{******************************************************}
{ ��Ʒ���ƣ�PMSS5.0                                    }
{ ��Ԫ���������ݲ�����������                           }
{ ��Ԫ���ߣ�Wenxh                                      }
{ ����ʱ�䣺2010.05.27                                 }
{ ��    ע��                                           }
{ �޸ļ�¼��                                           }
// 2013-6-19 Wenxh DataContext.Clear���ӷ���ֵ�������ж��Ƿ����֮ǰ����ɹ�
// 2015-11-27 Wenxh ���ӣ������ڲ�����ģʽ
{******************************************************}

unit uDataContext;

interface

uses
  Windows, Classes, SysUtils, uDataManagerIntf, ActiveX, uCompoundDocumentIntf,
  uPMDataIntf, uDataManagerConst, Generics.Collections,
  uDataManagerUtils, uDataRegister, uPMDataConst, uPmLibDataSet;

type
  /// <summary>
  /// ���ݼ��ʵ�
  /// </summary>
  TDataSetDic = TDictionary<string,IPMDataset>;
  /// <summary>
  /// �ڴ����б�
  /// </summary>
  TMemoryStreamList = TObjectList<TMemoryStream>;

  TDataContext = class(TInterfacedObject, IDataContext)
  private
    //����ע���
    FDataRegister: TDataRegister;
    //����ע���
    FRegDataSet: IPMDataset;
    //���ݼ��б�
    FDataSetList: TDataSetDic;
    //�����ĵ�
    FCurrDocument: ICompoundDocument;
    //��ǰDataContext�����ĸ����ĵ��洢�ڵ�
    FCurrStorage: IStorage;
    //���ݱ�ʶ
    FDataToken: string;
    //��¼��������״̬
    FBeginDataState: Boolean;
    //IndexMemoryStream
    FIndexMemoryStreamList: TMemoryStreamList;

    FNotifyAfterLoadStruct: TNotifyAfterLoadStruct;
    procedure FreeIndexMemoryStream;
    {*****************************������*************************************}
    procedure AddDataSetToList(sDataSetName: string; ADataSet: IPMDataset);
    function ExistsInDataSetList(sDataSetName: string): Boolean;
    procedure RemoveDataSetFromList(sDataSetName: string);
    procedure DoDestroyDataSetList;
    function DoGetDataSet(const sDataSetName: string;
      bLoadIndex: Boolean = False): IPMDataSet;
    function InternalGetDataSet(const sDataSetName: string): IPMDataSet;
    procedure InternalLoadDataSet(ADataSet: IPMDataset);
    function DoLoadDataSet(aStorage: IStorage; const sStreamName: string;
      bLoadIndex: Boolean = False): IPMDataset;
    procedure DoClearDataSets;

    {*****************************����������***********************************}
    function DoLoadData(aStream: TMemoryStream; aStorage: IStorage;
      const sStreamName: string): Boolean;
    procedure DoSaveData(aStream: TMemoryStream; aStorage: IStorage; const
        sStreamName: string; bInternalMode: Boolean = False);
    procedure DoRemoveData(aStorage: IStorage; const sStreamName: string);

    {*****************************����ע������*******************************}
    function DoCreateRegDataSet(const sDataSetName: string): IPMDataset;
    function GetRegDataSet: IPMDataset;
  private
    {IDataContext}
    {*****************************������*************************************}
    function GetDataContextToken: string;
    function GetDataContextResList(AResList: TStringList): Boolean;
    function LoadData: Boolean;
    function SaveData(bInternalMode: Boolean = False): Boolean;
    function GetDataSet(const sDataSetName: string): IPMDataSet;
    function GetDataSetByIndex(const sDataSetName: string): IPMDataset;
    function CreateDataSet(const sDataSetName: string): IPMDataset;
    procedure DeleteDataSet(const sDataSetName: string);
    function Clear: Boolean;
    procedure BeginDataState;
    procedure EndDataState(DataStateList: TInterfaceList);

    function GetCurrStorage: IStorage;
    function CopyTo(ADstDataContext: IDataContext): Boolean;

    {*****************************����������***********************************}
    function LoadStream(aStream: TMemoryStream; const DataName: string): Boolean;
    procedure SaveStream(aStream: TMemoryStream; const DataName: string;
        bInternalMode: Boolean = False);
    procedure DeleteStream(const DataName: string);

    //���� ���ݼ����ؽṹ�� �����¼�
    procedure SetNotifyAfterLoadStruct(AEvent: TNotifyAfterLoadStruct);
  public
    constructor Create(ADocument: ICompoundDocument;
      AStorage: IStorage; const sDataToken: string);
    destructor Destroy; override;
  end;

implementation

uses
  uMessage, uPMData, uPMDataUtils, uPMDataStream, AxCtrls;

constructor TDataContext.Create(ADocument: ICompoundDocument;
  AStorage: IStorage; const sDataToken: string);
begin
  FBeginDataState := False;
  FDataToken := sDataToken;
  FCurrDocument := ADocument;
  FCurrStorage := AStorage;
  FDataSetList := TDataSetDic.Create();
  FRegDataSet := GetRegDataSet;
  FDataRegister := TDataRegister.Create(FRegDataSet);
  FIndexMemoryStreamList := TMemoryStreamList.Create(True);
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.CreateDataSet
  ����:      Wenxh
  ����:      2010.06.12
  ��������:  ����DataSet
  ����:      const sDataSetName: string
  ����ֵ:    IPMDataset
-------------------------------------------------------------------------------}

function TDataContext.CreateDataSet(
  const sDataSetName: string): IPMDataset;
begin
  Result := TPmLibDataSet.Create;
  if Result <> nil then
  begin
    //��ע���ע��
    FDataRegister.DataRegister(sDataSetName, rgtDataSet);
    Result.SetTableName(sDataSetName);
    AddDataSetToList(sDataSetName, Result);
    if FBeginDataState then
    begin
      Result.SetMarkState(True);
      Result.BeginState;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.DeleteStream
  ����:      Wenxh
  ����:      2010.06.12
  ��������:  ɾ��ָ��DataName��
  ����:      const DataName: string
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TDataContext.DeleteStream(const DataName: string);
var
  sStreamName: string;
begin
  if DataName = '' then
    Exit;
  sStreamName := FDataRegister.GetRegisterName(DataName, rgtStream);
  if sStreamName <> '' then
    DoRemoveData(FCurrStorage, sStreamName);
end;

destructor TDataContext.Destroy;
begin
  DoDestroyDataSetList;
  FDataRegister.Free;
  FreeIndexMemoryStream;
  inherited;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.DoCreateRegDataSet
  ����:      Wenxh
  ����:      2010.06.12
  ��������:  �������ע������ڣ��򴴽�����ע���
  ����:      const sDataSetName: string
  ����ֵ:    IPMDataset
-------------------------------------------------------------------------------}

function TDataContext.DoCreateRegDataSet(
  const sDataSetName: string): IPMDataset;
begin
  Result := TPmLibDataSet.Create;
  Result.AddField(cst_SjZc_Guid, fStr);
  Result.AddField(cst_SjZc_TableName, fStr);
  Result.AddField(cst_SjZc_Memo, fStr);
  Result.AddField(cst_SjZc_StreamName, fStr);
  Result.AddField(cst_SjZc_DataType, fInt);
  Result.GetInstance.Active := True;
  Result.TableName := sDataSetName;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.DoGetDataSet
  ����:      Wenxh
  ����:      2010.06.12
  ��������:  ͨ��sDataSetName��ȡ��ָ����DataSet
  ����:      const sDataSetName: string
  ����ֵ:    IPMDataSet
-------------------------------------------------------------------------------}

function TDataContext.DoGetDataSet(const sDataSetName: string;
  bLoadIndex: Boolean = False): IPMDataSet;
var
  sStreamName: string;
begin
  //��ȡ����ע���
  if sDataSetName = cst_Table_SjZc then
  begin
    Result := FRegDataSet;
  end
  else
  begin
    //��ͨ�����ݱ�
    Result := InternalGetDataSet(sDataSetName);
    if Result = nil then
    begin
      sStreamName := FDataRegister.GetRegisterName(sDataSetName, rgtDataSet);
      if sStreamName <> '' then
      begin
        Result := DoLoadDataSet(FCurrStorage, sStreamName, bLoadIndex);
        if Assigned(Result) then
          AddDataSetToList(sDataSetName, Result);
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.DoLoadData
  ����:      Wenxh
  ����:      2010.06.12
  ��������:  �Ӹ����ĵ���������ݵ��ڴ�����
  ����:      aStream: TMemoryStream; aStorage: IStorage; const sStreamName: string
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TDataContext.DoLoadData(aStream: TMemoryStream;
  aStorage: IStorage; const sStreamName: string): Boolean;
begin
  Result := FCurrDocument.LoadFromStream(aStorage, sStreamName, aStream);
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.DoLoadDataSet
  ����:      Wenxh
  ����:      2010.06.12
  ��������:  ����DataSet����
  ����:      aStorage: IStorage; const sStreamName: string
  ����ֵ:    IPMDataset
-------------------------------------------------------------------------------}

function TDataContext.DoLoadDataSet(aStorage: IStorage; const sStreamName:
  string; bLoadIndex: Boolean = False): IPMDataset;
var
  aMemoryStream: TMemoryStream;
  bResult: Boolean;
begin
  Result := nil;
  if sStreamName = '' then
    Exit;
  aMemoryStream := TMemoryStream.Create;
  try
    bResult := FCurrDocument.LoadFromStream(aStorage, sStreamName, aMemoryStream);
    if bResult then
    begin
      Result := TPmLibDataSet.Create;
      if Assigned(FNotifyAfterLoadStruct) then
        Result.SetNotifyAfterLoadStruct(FNotifyAfterLoadStruct);
      if bLoadIndex then
      begin
        Result.LoadRecIndex(aMemoryStream);
        FIndexMemoryStreamList.Add(aMemoryStream);
      end
      else if not Result.LoadStream(aMemoryStream) then
      begin
        Result := nil;
        Exit;
      end;
      //��¼����״̬
      if (Result <> nil) and FBeginDataState then
      begin
        Result.SetMarkState(True);
        Result.BeginState;
      end;
    end;
  finally
    if not bLoadIndex then
      aMemoryStream.Free;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.DoRemoveData
  ����:      Wenxh
  ����:      2010.06.12
  ��������:  ɾ��ָ����
  ����:      aStorage: IStorage; const sStreamName: string
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TDataContext.DoRemoveData(aStorage: IStorage;
  const sStreamName: string);
begin
  FCurrDocument.DeleteStream(aStorage, sStreamName);
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.DoSaveData
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  ����ָ��������
  ����:      aStream: TMemoryStream; aStorage: IStorage; const sStreamName: string
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TDataContext.DoSaveData(aStream: TMemoryStream; aStorage: IStorage;
    const sStreamName: string; bInternalMode: Boolean = False);
var
  bResult: Boolean;
begin
  bResult := FCurrDocument.SaveToStream(aStorage, sStreamName, aStream, bInternalMode);
  if not bResult then
    Warn(0,Format(msg_datamanager_savedata, [sStreamName]));
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.GetDataContextResList
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  ��ȡ��Դ�б�
  ����:      AResList: TStringList
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TDataContext.GetCurrStorage: IStorage;
begin
  Result := FCurrStorage;
end;

function TDataContext.GetDataContextResList(
  AResList: TStringList): Boolean;
begin
  Result := FCurrDocument.GetResList(FCurrStorage, AResList);
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.GetDataContextToken
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  ��ȡ���ݱ�ʶ
  ����:      ��
  ����ֵ:    string
-------------------------------------------------------------------------------}

function TDataContext.GetDataContextToken: string;
begin
  Result := FDataToken;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.GetDataSet
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  ͨ��DataSet���ƻ�ȡ�����ݼ�
  ����:      const sDataSetName: string
  ����ֵ:    IPMDataSet
-------------------------------------------------------------------------------}

function TDataContext.GetDataSet(const sDataSetName: string): IPMDataSet;
begin
  Result := nil;
  if sDataSetName = '' then
    Exit;
  Result := DoGetDataSet(sDataSetName);
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.GetRegDataSet
  ����:      Wenxh
  ����:      2010.06.24
  ��������:
  ����:      ��
  ����ֵ:    IPMDataset
-------------------------------------------------------------------------------}

function TDataContext.GetRegDataSet: IPMDataset;
begin
  Result := DoLoadDataSet(FCurrStorage, cst_Table_SjZc);
  if Result = nil then
    Result := DoCreateRegDataSet(cst_Table_SjZc);
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.LoadStream
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  ������
  ����:      aStream: TMemoryStream; const DataName: string
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TDataContext.LoadStream(aStream: TMemoryStream; const DataName:
  string): Boolean;
var
  sStreamName: string;
begin
  Result := False;
  if DataName = '' then
    Exit;
  sStreamName := FDataRegister.GetRegisterName(DataName, rgtStream);
  if sStreamName <> '' then
    Result := DoLoadData(aStream, FCurrStorage, sStreamName);
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.InternalGetDataSet
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  �ڲ���ȡ�Ѿ����ص�DataSet
  ����:      const sDataSetName: string
  ����ֵ:    IPMDataSet
-------------------------------------------------------------------------------}

function TDataContext.InternalGetDataSet(
  const sDataSetName: string): IPMDataSet;
var
  iIndex: Integer;
begin
  Result := nil;
  try
    if FDataSetList.ContainsKey(sDataSetName) then
      Result := FDataSetList.Items[sDataSetName];
    if Assigned(Result) and Result.GetDataEmptyStatus() then
      InternalLoadDataSet(Result);
    except
      on E: Exception do
      begin
        AppendFiledata(cst_logname, 'InternalGetDataSet Error��');
        raise Exception.Create(E.Message);
      end;
    end;

end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.LoadData
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  �������ݵ�DataSet����
  ����:      ��
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TDataContext.LoadData: Boolean;
var
  iDataType: Integer;
  sStreamName: string;
  sDataSetName: string;
  i, iCount: Integer;
  ADataSet: IPMDataset;
begin
  Result := False;
  if FRegDataSet = nil then
    Exit;
  iCount := FRegDataSet.GetRecordCount;
  for i := 0 to iCount - 1 do
  begin
    iDataType := FRegDataSet.GetFieldValue(cst_SjZc_DataType, 0, i);
    if Ord(rgtStream) = iDataType then
      Continue;
    sDataSetName := FRegDataSet.GetFieldValue(cst_SjZc_TableName, '', i);
    sStreamName := FRegDataSet.GetFieldValue(cst_SjZc_StreamName, '', i);
    ADataSet := DoLoadDataSet(FCurrStorage, sStreamName);
    //����ע�����ȥ�����б�
    if Assigned(ADataSet) and (sDataSetName <> cst_Table_SjZc) then
      AddDataSetToList(sDataSetName, ADataSet);
  end;
  Result := True;
end;

function TDataContext.SaveData(bInternalMode: Boolean = False): Boolean;

  function _SaveDataToStream(APMStream: TPMDataSaveStream; ADataSet: IPMDataset;
    sStreamName: string): Boolean;
  var
    ASubStream: IStream;
    AOleStream: TOleStream;
    iCommitResult: Cardinal;
  begin
    Result := False;
    if FCurrDocument.CreateStream(FCurrStorage, sStreamName, ASubStream, bInternalMode) then
    begin
      try
        AOleStream := TOleStream.Create(ASubStream);
        try
          //
          try
            APMStream.Stream := AOleStream;
            Result := ADataSet.SaveStream(APMStream);
          except
            on e: Exception do
            begin
              Result := False;
              AppendFiledata(cst_logname, cst_error_ES_0024 + e.Message + ADataSet.TableName);
            end;
          end;
          //
          try
            if Result then
              APMStream.Save;
          except
            on e: Exception do
            begin
              Result := False;
              AppendFiledata(cst_logname, cst_error_ES_0025 + e.Message + ADataSet.TableName);
            end;
          end;
          //�ύ���ͷ�
          if Result then
          begin
            iCommitResult := ASubStream.Commit(STGC_OVERWRITE);
            if Not (iCommitResult = S_OK) then
              AppendFiledata(cst_logname, cst_error_ES_0026
                + ' CommitResult:' + IntToStr(iCommitResult));
          end;
          ASubStream := nil;
        finally
          AOleStream.Free;
        end;
      except
        on e: Exception do
        begin
          Result := False;
          AppendFiledata(cst_logname, cst_error_ES_0018 + e.Message + ADataSet.TableName);
        end;
      end;
    end
    else
      AppendFiledata(cst_logname, cst_error_ES_0017 + ADataSet.TableName);
  end;

var
  ADataSet: IPMDataset;
  sDataSetName, sStreamName: string;
  i: Integer;
  bResult: Boolean;
  iCommitResult: Integer;
  APMStream: TPMDataSaveStream;
begin
  Result := False;
  if FRegDataSet = nil then
    Exit;
  APMStream := TPMDataSaveStream.Create;
  try
    //��������ע���
    if not _SaveDataToStream(APMStream, FRegDataSet, FRegDataSet.TableName) then
    begin
      Warn(0,Format(msg_datamanager_savedataset, [FRegDataSet.TableName]));
      Exit;
    end;
    // �������ݱ�����б�������ݱ�
    bResult := True;
    if FDataSetList.Count > 0 then
    begin
      for sDataSetName in FDataSetList.Keys do
      begin
        ADataSet := FDataSetList[sDataSetName];
        if ADataSet = nil then
          Continue;
        if not TPMDataSet(ADataSet.GetObject).DataChanged then
          Continue;
        bResult := False;
        // ��ȡ��ע������洢����
        sStreamName := FDataRegister.GetRegisterName(sDataSetName, rgtDataSet);
        if sStreamName = '' then
        begin
          Warn(0,Format(msg_datamanager_GetStreamNameError, [sDataSetName]));
          Exit;
        end;
        bResult := _SaveDataToStream(APMStream, ADataSet, sStreamName);
        if not bResult then
        begin
          Warn(0,Format(msg_datamanager_savedataset, [sDataSetName]));
          Exit;
        end;
      end;
    end;
  finally
    APMStream.Free;
  end;
  //Storage Commit
  if bResult then
  begin
    iCommitResult := FCurrStorage.Commit(STGC_OVERWRITE);
    Result := iCommitResult = S_OK;
    if Not Result then
      AppendFiledata(cst_logname, cst_error_ES_0010
        + ' CommitResult:' + IntToStr(iCommitResult));
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.SaveStream
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  ����������
  ����:      aStream: TMemoryStream; const DataName: string
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TDataContext.SaveStream(aStream: TMemoryStream; const DataName:
    string; bInternalMode: Boolean = False);
var
  sStreamName: string;
begin
  if DataName = '' then
    Exit;
  sStreamName := FDataRegister.DataRegister(DataName, rgtStream);
  if sStreamName <> '' then
    DoSaveData(aStream, FCurrStorage, sStreamName, bInternalMode);
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.Clear
  ����:      Wenxh
  ����:      2010.06.21
  ��������:  ���DataSet�ڲ�����(�ȱ�������)
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

function TDataContext.Clear: Boolean;
begin
  Result := SaveData;
  if Result then
    DoClearDataSets;
end;

function TDataContext.CopyTo(ADstDataContext: IDataContext): Boolean;
var
  sjzc: IPMDataset;
begin
  Result := False;
  if (ADstDataContext = nil) or (ADstDataContext.GetCurrStorage = nil) then
    Exit;
  Result := Succeeded(FCurrStorage.CopyTo(0, nil, nil, ADstDataContext.GetCurrStorage));
  // Added by hwf 2015-6-3 TODO:�������¿���һ������ע�������
  sjzc := ADstDataContext.GetDataSet(cst_Table_SjZc);
  if (sjzc <> nil) and (FRegDataSet <> nil) then
  begin
    sjzc.DeleteAllRec;
    sjzc.CopyData(FRegDataSet);
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.DoClearDataSets
  ����:      Wenxh
  ����:      2010.06.21
  ��������:  ������е�DataSet
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TDataContext.DoClearDataSets;
var
  ADataSet: IPMDataset;
begin
  if FDataSetList.Count > 0 then
  begin
    for ADataSet in FDataSetList.Values do
    begin
      if ADataSet <> nil then
        ADataSet.Clear;
    end;
  end;
  FDataSetList.Clear();
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.InternalLoadDataSet
  ����:      Wenxh
  ����:      2010.06.21
  ��������:  ͨ����յ�DataSet���ڲ���������
  ����:      ADataSet: IPMDataset
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TDataContext.InternalLoadDataSet(ADataSet: IPMDataset);
var
  sStreamName: string;
  aMemoryStream: TMemoryStream;
  bResult: Boolean;
begin
  sStreamName := FDataRegister.GetRegisterName(ADataSet.TableName, rgtDataSet);
  if sStreamName = '' then
    Exit;
  aMemoryStream := TMemoryStream.Create;
  try
    bResult := FCurrDocument.LoadFromStream(FCurrStorage, sStreamName,
      aMemoryStream);
    if bResult then
      ADataSet.LoadStream(aMemoryStream)
    else
      AppendFiledata(cst_logname, 'InternalLoadDataSet->LoadFromStream Error��');
  finally
    aMemoryStream.Free;
  end;
end;

procedure TDataContext.BeginDataState;

  procedure _BeginDataSet(DataSet: IPMDataset);
  begin
    if DataSet = nil then
      Exit;
    DataSet.GetDataState.Clear;
    DataSet.SetMarkState(True);
    DataSet.BeginState;
  end;

var
    LDset: IPMDataset;
begin
  FBeginDataState := True;
  //����ע���
// ����ע��� ���ý���������        update by lifeng 2013,1,7
//  BeginDataSet(FRegDataSet);
  // ���ݼ��б�
  if FDataSetList.Count > 0 then
    for LDset in FDataSetList.Values do
      _BeginDataSet(LDset);
end;

procedure TDataContext.EndDataState(DataStateList: TInterfaceList);

  procedure _EndDataSet(DataSet: IPMDataset);
  var
    k, kCount: Integer;
  begin
    if DataSet = nil then
      Exit;
    DataSet.EndState;
    DataSet.SetMarkState(False);
    //��¼DataSet����״̬
    kCount := DataSet.GetDataState.Count;
    for k := 0 to kCount - 1 do
      DataStateList.Add(DataSet.GetDataState.Items[k]);
    //������ݼ�״̬
    DataSet.GetDataState.Clear;
  end;

var
  LDset: IPMDataset;
begin
  //���ݼ��б�
  if FDataSetList.Count > 0 then
    for LDset in FDataSetList.Values do
      _EndDataSet(LDset);
  // ����ע���
  _EndDataSet(FRegDataSet);
  FBeginDataState := False;
end;

procedure TDataContext.DeleteDataSet(const sDataSetName: string);
var
  sStreamName: string;
begin
  //���������ע�����ô�˳�
  if LowerCase(sDataSetName) = cst_table_sjzc then
    Exit;
  try
    //���б���ɾ��
    RemoveDataSetFromList(sDataSetName);
    //��ȡע����
    sStreamName := FDataRegister.GetRegisterName(sDataSetName, rgtDataSet);
    //ɾ���洢����
    if sStreamName <> '' then
      FCurrDocument.DeleteStream(FCurrStorage, sStreamName);
    //ɾ������ע���¼
    FDataRegister.DeleteRegisterName(sDataSetName);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ES_0007 + e.Message);
      raise Exception.Create('ɾ�����ݱ�: ' + sDataSetName + ' ʱ����');
    end;
  end;
end;

function TDataContext.GetDataSetByIndex(
  const sDataSetName: string): IPMDataset;
begin
  Result := nil;
  if sDataSetName = '' then
    Exit;
  Result := DoGetDataSet(sDataSetName, True);
end;

procedure TDataContext.FreeIndexMemoryStream;
begin
  // Free ����� Clear��Clear ���Զ� Free Object
  FIndexMemoryStreamList.Free;
end;

{-------------------------------------------------------------------------------
  ������:    TDataContext.SetNotifyAfterLoadStruct
  ����:      lifeng
  ����:      2010.12.13
  ����:      AEvet: TNotifyAfterLoadStruct
  ����ֵ:    ��
  ��������:  ���ݼ� ���ؽṹ�����¼�
-------------------------------------------------------------------------------}

procedure TDataContext.SetNotifyAfterLoadStruct(
  AEvent: TNotifyAfterLoadStruct);
begin
  FNotifyAfterLoadStruct := AEvent;
end;

procedure TDataContext.AddDataSetToList(sDataSetName: string; ADataSet:
  IPMDataset);
begin
  if ExistsInDataSetList(sDataSetName) then
    FDataSetList.Items[sDataSetName] := ADataSet
  else
    FDataSetList.Add(sDataSetName, ADataSet);
end;

procedure TDataContext.DoDestroyDataSetList;
begin
  // Free ����� Clear��Clear ���Զ� �ۼ��ӿ� ���ü���
  FDataSetList.Free();
end;

function TDataContext.ExistsInDataSetList(sDataSetName: string): Boolean;
begin
  Result := FDataSetList.ContainsKey(sDataSetName);
end;

procedure TDataContext.RemoveDataSetFromList(sDataSetName: string);
begin
  if ExistsInDataSetList(sDataSetName) then
    FDataSetList.Remove(sDataSetName);
end;

end.

