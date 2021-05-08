{******************************************************}
{ 产品名称：PMSS5.0                                    }
{ 单元描述：数据层数据上下文                           }
{ 单元作者：Wenxh                                      }
{ 创建时间：2010.05.27                                 }
{ 备    注：                                           }
{ 修改记录：                                           }
// 2013-6-19 Wenxh DataContext.Clear增加返回值，用于判断是否清空之前保存成功
// 2015-11-27 Wenxh 增加：增加内部保存模式
{******************************************************}

unit uDataContext;

interface

uses
  Windows, Classes, SysUtils, uDataManagerIntf, ActiveX, uCompoundDocumentIntf,
  uPMDataIntf, uDataManagerConst, Generics.Collections,
  uDataManagerUtils, uDataRegister, uPMDataConst, uPmLibDataSet;

type
  /// <summary>
  /// 数据集词典
  /// </summary>
  TDataSetDic = TDictionary<string,IPMDataset>;
  /// <summary>
  /// 内存流列表
  /// </summary>
  TMemoryStreamList = TObjectList<TMemoryStream>;

  TDataContext = class(TInterfacedObject, IDataContext)
  private
    //数据注册表
    FDataRegister: TDataRegister;
    //数据注册表
    FRegDataSet: IPMDataset;
    //数据集列表
    FDataSetList: TDataSetDic;
    //复合文档
    FCurrDocument: ICompoundDocument;
    //当前DataContext操作的复合文档存储节点
    FCurrStorage: IStorage;
    //数据标识
    FDataToken: string;
    //记录操作开启状态
    FBeginDataState: Boolean;
    //IndexMemoryStream
    FIndexMemoryStreamList: TMemoryStreamList;

    FNotifyAfterLoadStruct: TNotifyAfterLoadStruct;
    procedure FreeIndexMemoryStream;
    {*****************************表格操作*************************************}
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

    {*****************************数据流操作***********************************}
    function DoLoadData(aStream: TMemoryStream; aStorage: IStorage;
      const sStreamName: string): Boolean;
    procedure DoSaveData(aStream: TMemoryStream; aStorage: IStorage; const
        sStreamName: string; bInternalMode: Boolean = False);
    procedure DoRemoveData(aStorage: IStorage; const sStreamName: string);

    {*****************************数据注册表操作*******************************}
    function DoCreateRegDataSet(const sDataSetName: string): IPMDataset;
    function GetRegDataSet: IPMDataset;
  private
    {IDataContext}
    {*****************************表格操作*************************************}
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

    {*****************************数据流操作***********************************}
    function LoadStream(aStream: TMemoryStream; const DataName: string): Boolean;
    procedure SaveStream(aStream: TMemoryStream; const DataName: string;
        bInternalMode: Boolean = False);
    procedure DeleteStream(const DataName: string);

    //设置 数据集加载结构后 处理事件
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
  过程名:    TDataContext.CreateDataSet
  作者:      Wenxh
  日期:      2010.06.12
  功能描述:  创建DataSet
  参数:      const sDataSetName: string
  返回值:    IPMDataset
-------------------------------------------------------------------------------}

function TDataContext.CreateDataSet(
  const sDataSetName: string): IPMDataset;
begin
  Result := TPmLibDataSet.Create;
  if Result <> nil then
  begin
    //向注册表注册
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
  过程名:    TDataContext.DeleteStream
  作者:      Wenxh
  日期:      2010.06.12
  功能描述:  删除指定DataName流
  参数:      const DataName: string
  返回值:    无
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
  过程名:    TDataContext.DoCreateRegDataSet
  作者:      Wenxh
  日期:      2010.06.12
  功能描述:  如果数据注册表不存在，则创建数据注册表
  参数:      const sDataSetName: string
  返回值:    IPMDataset
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
  过程名:    TDataContext.DoGetDataSet
  作者:      Wenxh
  日期:      2010.06.12
  功能描述:  通过sDataSetName获取到指定的DataSet
  参数:      const sDataSetName: string
  返回值:    IPMDataSet
-------------------------------------------------------------------------------}

function TDataContext.DoGetDataSet(const sDataSetName: string;
  bLoadIndex: Boolean = False): IPMDataSet;
var
  sStreamName: string;
begin
  //获取数据注册表
  if sDataSetName = cst_Table_SjZc then
  begin
    Result := FRegDataSet;
  end
  else
  begin
    //普通的数据表
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
  过程名:    TDataContext.DoLoadData
  作者:      Wenxh
  日期:      2010.06.12
  功能描述:  从复合文档里加载数据到内存流中
  参数:      aStream: TMemoryStream; aStorage: IStorage; const sStreamName: string
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TDataContext.DoLoadData(aStream: TMemoryStream;
  aStorage: IStorage; const sStreamName: string): Boolean;
begin
  Result := FCurrDocument.LoadFromStream(aStorage, sStreamName, aStream);
end;

{-------------------------------------------------------------------------------
  过程名:    TDataContext.DoLoadDataSet
  作者:      Wenxh
  日期:      2010.06.12
  功能描述:  加载DataSet数据
  参数:      aStorage: IStorage; const sStreamName: string
  返回值:    IPMDataset
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
      //记录操作状态
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
  过程名:    TDataContext.DoRemoveData
  作者:      Wenxh
  日期:      2010.06.12
  功能描述:  删除指定流
  参数:      aStorage: IStorage; const sStreamName: string
  返回值:    无
-------------------------------------------------------------------------------}

procedure TDataContext.DoRemoveData(aStorage: IStorage;
  const sStreamName: string);
begin
  FCurrDocument.DeleteStream(aStorage, sStreamName);
end;

{-------------------------------------------------------------------------------
  过程名:    TDataContext.DoSaveData
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  保存指定流数据
  参数:      aStream: TMemoryStream; aStorage: IStorage; const sStreamName: string
  返回值:    无
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
  过程名:    TDataContext.GetDataContextResList
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  获取资源列表
  参数:      AResList: TStringList
  返回值:    Boolean
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
  过程名:    TDataContext.GetDataContextToken
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  获取数据标识
  参数:      无
  返回值:    string
-------------------------------------------------------------------------------}

function TDataContext.GetDataContextToken: string;
begin
  Result := FDataToken;
end;

{-------------------------------------------------------------------------------
  过程名:    TDataContext.GetDataSet
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  通过DataSet名称获取到数据集
  参数:      const sDataSetName: string
  返回值:    IPMDataSet
-------------------------------------------------------------------------------}

function TDataContext.GetDataSet(const sDataSetName: string): IPMDataSet;
begin
  Result := nil;
  if sDataSetName = '' then
    Exit;
  Result := DoGetDataSet(sDataSetName);
end;

{-------------------------------------------------------------------------------
  过程名:    TDataContext.GetRegDataSet
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:
  参数:      无
  返回值:    IPMDataset
-------------------------------------------------------------------------------}

function TDataContext.GetRegDataSet: IPMDataset;
begin
  Result := DoLoadDataSet(FCurrStorage, cst_Table_SjZc);
  if Result = nil then
    Result := DoCreateRegDataSet(cst_Table_SjZc);
end;

{-------------------------------------------------------------------------------
  过程名:    TDataContext.LoadStream
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  加载流
  参数:      aStream: TMemoryStream; const DataName: string
  返回值:    Boolean
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
  过程名:    TDataContext.InternalGetDataSet
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  内部获取已经加载的DataSet
  参数:      const sDataSetName: string
  返回值:    IPMDataSet
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
        AppendFiledata(cst_logname, 'InternalGetDataSet Error！');
        raise Exception.Create(E.Message);
      end;
    end;

end;

{-------------------------------------------------------------------------------
  过程名:    TDataContext.LoadData
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  加载数据的DataSet数据
  参数:      无
  返回值:    Boolean
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
    //数据注册表不进去数据列表
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
          //提交、释放
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
    //保存数据注册表
    if not _SaveDataToStream(APMStream, FRegDataSet, FRegDataSet.TableName) then
    begin
      Warn(0,Format(msg_datamanager_savedataset, [FRegDataSet.TableName]));
      Exit;
    end;
    // 保存数据表管理列表里的数据表
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
        // 获取到注册的流存储名称
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
  过程名:    TDataContext.SaveStream
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  保存流数据
  参数:      aStream: TMemoryStream; const DataName: string
  返回值:    无
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
  过程名:    TDataContext.Clear
  作者:      Wenxh
  日期:      2010.06.21
  功能描述:  清空DataSet内部数据(先保存后清空)
  参数:      无
  返回值:    无
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
  // Added by hwf 2015-6-3 TODO:必面重新拷贝一下数据注册表数据
  sjzc := ADstDataContext.GetDataSet(cst_Table_SjZc);
  if (sjzc <> nil) and (FRegDataSet <> nil) then
  begin
    sjzc.DeleteAllRec;
    sjzc.CopyData(FRegDataSet);
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TDataContext.DoClearDataSets
  作者:      Wenxh
  日期:      2010.06.21
  功能描述:  清空所有的DataSet
  参数:      无
  返回值:    无
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
  过程名:    TDataContext.InternalLoadDataSet
  作者:      Wenxh
  日期:      2010.06.21
  功能描述:  通过清空的DataSet，内部加载数据
  参数:      ADataSet: IPMDataset
  返回值:    无
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
      AppendFiledata(cst_logname, 'InternalLoadDataSet->LoadFromStream Error！');
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
  //数据注册表
// 数据注册表 不用进撤销队列        update by lifeng 2013,1,7
//  BeginDataSet(FRegDataSet);
  // 数据集列表
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
    //记录DataSet操作状态
    kCount := DataSet.GetDataState.Count;
    for k := 0 to kCount - 1 do
      DataStateList.Add(DataSet.GetDataState.Items[k]);
    //清空数据集状态
    DataSet.GetDataState.Clear;
  end;

var
  LDset: IPMDataset;
begin
  //数据集列表
  if FDataSetList.Count > 0 then
    for LDset in FDataSetList.Values do
      _EndDataSet(LDset);
  // 数据注册表
  _EndDataSet(FRegDataSet);
  FBeginDataState := False;
end;

procedure TDataContext.DeleteDataSet(const sDataSetName: string);
var
  sStreamName: string;
begin
  //如果是数据注册表那么退出
  if LowerCase(sDataSetName) = cst_table_sjzc then
    Exit;
  try
    //从列表中删除
    RemoveDataSetFromList(sDataSetName);
    //获取注册名
    sStreamName := FDataRegister.GetRegisterName(sDataSetName, rgtDataSet);
    //删除存储数据
    if sStreamName <> '' then
      FCurrDocument.DeleteStream(FCurrStorage, sStreamName);
    //删除数据注册记录
    FDataRegister.DeleteRegisterName(sDataSetName);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ES_0007 + e.Message);
      raise Exception.Create('删除数据表: ' + sDataSetName + ' 时出错！');
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
  // Free 会调用 Clear；Clear 会自动 Free Object
  FIndexMemoryStreamList.Free;
end;

{-------------------------------------------------------------------------------
  过程名:    TDataContext.SetNotifyAfterLoadStruct
  作者:      lifeng
  日期:      2010.12.13
  参数:      AEvet: TNotifyAfterLoadStruct
  返回值:    无
  功能描述:  数据集 加载结构后处理事件
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
  // Free 会调用 Clear；Clear 会自动 扣减接口 引用计数
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

