{******************************************************}
{ ��Ʒ���ƣ�PMSS5.0                                    }
{ ��Ԫ�������ļ������ݹ���(ͨ��ԭ�ļ�����һ���м��ļ�, }
{           ���м��ļ����в���,�����ʱ���Ƶ�ʵ���ļ�}
{ ��Ԫ���ߣ�Wenxh                                      }
{ ����ʱ�䣺2010.05.27                                 }
{ ��    ע��                                           }
{ �޸ļ�¼��                                           }
// 2013-8-5 Wenxh �����ļ�����ʱ������ʧ��û���жϿ��������ı�������
// 2013-9-22 Wenxh ���������ļ�ʱ�����ܱ��治�ɹ�������(��������)
// 2013-10-12 Wenxh ���������ļ�ʱ����������ļ�·��ʧ�ܿ��ܻ�����Ĵ���(10.14
//                  ��������δ��ʼ��������)
// 2014-7-31 Wenxh  ����ѹ���ļ�ʱ����ѹ�������ļ������� BugId: 8303
// 2015-11-27 Wenxh ���ӣ������ڲ�����ģʽ
{******************************************************}

unit uPrjDataManager;

interface

uses
  Classes, Windows, uDataManagerIntf, uCompoundDocument, SysUtils, ActiveX,
  uDataContext, uCompoundDocumentIntf, uPMDataIntf, uDataRegister,
  Dialogs, SyncObjs, Forms;

type
  TPrjDataManager = class(TInterfacedObject, IPrjDataManager)
  private
    function GetDataRegister: TDataRegister;
  private
//    FSection: TCriticalSection;
    //����ע�������
    FDataRegister: TDataRegister;
    //��Ȼ�����ĵ�
    FCurrDocument: ICompoundDocument;
    //��ǰ���洢
    FCurrStorage: IStorage;
    //DataContext�б�
    FDataContextList: TInterfaceList;
    //�ļ�����(ʵ���ļ�)
    FFileName: string;
    //��ʱ�ļ�(�����ļ�)
    FTempFileName: string;
    //��¼��������״̬
    FBeginDataState: Boolean;
    //�¼�
    FOnEndDataState: TEndDataStateEvent;
    //
    FOnBackupFileEvent: TOnBackupFileEvent;
    //�Ƿ�Ҫѹ��/��ѹ��
    FbCompress: Boolean;
    FbDeCompress: Boolean;
    //�Ƿ�Ҫ����������
    FbShowProgress: Boolean;
    FOwnerHandle: Cardinal;
    function CreateDocument(const FileName: string): ICompoundDocument;
    function IntelGetDataContext(const sDataName: string): IDataContext;
    function DoCreateDataContext(AStorage: IStorage; const sDataName: string): IDataContext;
    function GetProjectFileName: string;
    //��
    function DoLoadPrj: Boolean;
    function DoLoadPrj_DeCompress: Boolean;
    //����
    function DoSavePrj: Boolean;
    function DoSavePrj_Compress(bShowProgress: Boolean; bInternalMode: Boolean =
        False; bBackUp: Boolean = True): Boolean;
    function CheckFileSize: Boolean;
    function DoCompressFile(SrcFileName, DstFileName: string; out bNotEnoughRoom:
        Boolean; out ErrMessage: string): Boolean;
    function DoSaveDataContext(bInternalMode: Boolean = False): Boolean;
    procedure GetDataStates(DataStateList: TInterfaceList);
    procedure UnDoDataStates(DataStateList: TInterfaceList);
    function CreateNewTempFile: string;
    function CreateNewTempFile_Compress: string;
    procedure UnInit;
    procedure Clear;
    //�洢ģ��ע����(���洢DataContext��ע����)
    property DataRegister: TDataRegister read GetDataRegister;
  private
    {*******************************ʵ�ֽӿ�***********************************}
    {IPrjDataManager}
    function CreateDataContext(const sDataName: string): IDataContext;
    procedure DeleteContext(const sDataName: string);
    function GetDataContext(const sDataName: string): IDataContext;
    function LoadPrj(const FileName: string; bDecompress: Boolean = False): Boolean;
    function SavePrj(const FileName: string = ''; bCompress: Boolean = False;
        bShowProgress: Boolean = False; AOwnerHandle: Cardinal = 0; bInternalMode:
        Boolean = False; bBackUp: Boolean = True): Boolean;
    function GetFileName: string;
    /// <summary>
    /// ���ù����ļ�����Ϊ�˽�����̱�������ʱ�ļ���FileName �����ĵ���ʱ�ļ�����
    ///                 ��ͨ���˷�������ɹ����ļ�,���򣬹����п��ܻᱣ������ʱ�ļ���
    /// </summary>
    /// <param name="AValue">�ļ���</param>
    procedure SetFileName(const AValue: string);
    procedure BeginDataState;
    procedure EndDataState(DataStateList: TInterfaceList); overload;
    procedure EndDataState(ACaption: string = ''); overload;
    function GetEndDataState: TEndDataStateEvent;
    function IsBeginDataState: Boolean;
    procedure SetEndDataState(Value: TEndDataStateEvent);
    procedure RollBack;
    procedure SetOnBackupFileEvent(Value: TOnBackupFileEvent);

    function Commit: Boolean;
    function SavePrjToStream(AStream: TStream): Boolean;
    function DoCompressFileToStream(SrcFileName: string; Stream: TStream): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
  end;

const
  cst_fileversion = '5.0';
  cst_TempFileExt = '.tmp';
  //�����ļ���(�̶��ļ���)
  cst_PrjFileName = 'PROJECTFILE.XM';

implementation

uses
  uDataManagerConst, uMessage, uDataManagerUtils, ufrmProgress,
  uZipImpl, uPMDataUtils, uPMDataConst;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.BeginDataState
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  ��ʼ���ݲ���״̬��¼
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.BeginDataState;
var
  i, iCount: Integer;
  ADataContext: IDataContext;
begin
  if FBeginDataState then
    Exit;
  FBeginDataState := True;
  iCount := FDataContextList.Count;
  for i := 0 to iCount - 1 do
  begin
    ADataContext := (FDataContextList.Items[i] as IDataContext);
    ADataContext.BeginDataState;
  end;
end;

constructor TPrjDataManager.Create;
begin
  FOnEndDataState := nil;
  FBeginDataState := False;
  FCurrStorage := nil;
  FDataContextList := TInterfaceList.Create;
//  FSection := TCriticalSection.Create;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.CreateDataContext
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  ����һ��DataContext
  ����:      const sDataName: string
  ����ֵ:    IDataContext
-------------------------------------------------------------------------------}

function TPrjDataManager.CreateDataContext(
  const sDataName: string): IDataContext;
var
  AStorage: IStorage;
  sStreamName: string;
begin
  Result := IntelGetDataContext(sDataName);
  if Result <> nil then
  begin
    Warn(FOwnerHandle,Format(Msg_DataManager_CreateNodeError, [sDataName, sDataName]));
    AppendFiledata(cst_logname, cst_error_ES_0029 + Format(Msg_DataManager_CreateNodeError, [sDataName, sDataName]));
    Exit;
  end;
  //��ע���ע�Ტ��ȡ��ʵ�ʴ洢������
  sStreamName := DataRegister.DataRegister(sDataName, rgtStorage);
  if sStreamName = '' then
    Exit;
  FCurrDocument.CreateStorage(FCurrStorage, sStreamName, AStorage);
  if AStorage = nil then
    Exit;
  Result := DoCreateDataContext(AStorage, sDataName);
  //�ж��Ƿ�Ҫ��ʼ��¼���ݲ���״̬
  if (Result <> nil) and FBeginDataState then
    Result.BeginDataState;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.CreateDocument
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ͨ���ļ����򿪻򴴽��ļ�
  ����:      ��
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TPrjDataManager.CreateDocument(const FileName: string): ICompoundDocument;
var
  bSucceed: Boolean;
begin
  Result := TCompoundDocument.Create;
  if FileExists(FileName) then
    bSucceed := Result.CreateDocument(FileName, True)
  else
    bSucceed := Result.CreateDocument(FileName, False);
  //�����ļ��ɹ�
  if not bSucceed then
  begin
    //�����ļ�ʧ��
    Result.CloseDocument;
    Result := nil;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.DeleteContext
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ɾ��ָ�����������²������󣨼�ɾ����Ŀ����ڵ㣩
  ����:      const sDataName: string
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.DeleteContext(const sDataName: string);
var
  sStreamName: string;
  ADataContext: IDataContext;
begin
  ADataContext := GetDataContext(sDataName);
  if ADataContext <> nil then
  begin
    //��ȡע����
    sStreamName := DataRegister.GetRegisterName(sDataName, rgtStorage);
    //ɾ���洢����
    FCurrDocument.DeleteStorage(FCurrStorage, sStreamName);
    FDataContextList.Remove(ADataContext);
    //ɾ������ע���¼
    DataRegister.DeleteRegisterName(sDataName);
    ADataContext := nil;
  end
  else
    Warn(FOwnerHandle,Format(msg_datamanager_deletedataContext, [sDataName]));
end;

destructor TPrjDataManager.Destroy;
begin
  UnInit;
//  if FSection <> nil then
//    FreeAndNil(FSection);
  inherited;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.DoCreateDataContext
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ����DataContext����
  ����:      AStorage: IStorage; const sDataName: string
  ����ֵ:    IDataContext
-------------------------------------------------------------------------------}

function TPrjDataManager.CreateNewTempFile_Compress: string;
var
  Hre: HResult;
  TempStorage: IStorage;
  TempFile: WideString;
  iResult: Integer;
begin
  Result := '';
  TempFile := GetProjectFileName;
  if IsFileInUse(TempFile) then
    Exit;
  FCurrStorage := FCurrDocument.m_RootStorage;
  if FileExists(TempFile) then
    DeleteFile(TempFile);
  Hre := StgCreateDocfile(PWideChar(TempFile), STGM_CREATE or STGM_READWRITE
    or STGM_DIRECT or STGM_SHARE_EXCLUSIVE, 0, TempStorage);
  //���� FFileName��ʱ�����ĵ�
  if SUCCEEDED(Hre) then
  begin
    Hre := FCurrStorage.CopyTo(0, nil, nil, TempStorage); //��FFileName �����ĵ������ݸ��Ƶ���//ʱ�����ĵ���
    if Succeeded(Hre) then
    begin
      Result := TempFile;
      iResult := TempStorage.Commit(STGC_OVERWRITE);
      if iResult <> S_OK then
        AppendFiledata(cst_logname, cst_error_ES_0013
          + ' CommitResult:' + IntToStr(iResult));
    end;
    TempStorage := nil;
  end;
end;

function TPrjDataManager.DoCreateDataContext(
  AStorage: IStorage; const sDataName: string): IDataContext;
begin
  Result := nil;
  if AStorage = nil then
    Exit;
  Result := TDataContext.Create(FCurrDocument, AStorage, sDataName);
  if Result <> nil then
    FDataContextList.Add(Result);
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.DoSaveDataContext
  ����:      Wenxh
  ����:      2010.07.12
  ��������:  ��������DataContext����
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

function TPrjDataManager.DoSaveDataContext(bInternalMode: Boolean = False):
    Boolean;
var
  i, iCount: Integer;
  ADataContext: IDataContext;
  iResult: Integer;
begin
  Result := True;
  try
    iCount := FDataContextList.Count;
    for i := 0 to iCount - 1 do
    begin
      ADataContext := FDataContextList.Items[i] as IDataContext;
      //SaveData
      if not ADataContext.SaveData(bInternalMode) then
      begin
        Result := False;
        Break;
      end;
      if (i mod 10 = 0) and (i <> 0) then
      begin
        iResult := FCurrDocument.Commit;
        if iResult <> S_OK then
          AppendFiledata(cst_logname, cst_error_ES_0012
            + ' CommitResult:' + IntToStr(iResult));
      end;
    end;
  except
    on e: Exception do
    begin
      Result := False;
      AppendFiledata(cst_logname, cst_error_ES_0021 + e.Message);
    end;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.DoSavePrj
  ����:      Wenxh
  ����:      2010.07.12
  ��������:  ִ�б������ʱ
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

function TPrjDataManager.DoSavePrj: Boolean;
var
  FileName: string;
  Delete: Boolean;
begin
  try
    Result := DoSaveDataContext;
    if Result then
    begin
      FCurrDocument.Commit;
      FileName := CreateNewTempFile;
      Delete := False;
      if FileName = '' then
        FileName := FTempFileName
      else
        Delete := True;
      CopyFile(PChar(FileName), PChar(FFileName), False);
      if Delete then
        DeleteFile(FileName);
    end;
  except
    Result := False;
    Warn(FOwnerHandle,'�����ļ�ʧ�ܣ�');
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.EndDataState
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  �ر����ݲ���״̬��¼(�������ݲ����б�)
  ����:      DataStateList: TInterfaceList
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.EndDataState(DataStateList: TInterfaceList);
var
  i, iCount: Integer;
  ADataContext: IDataContext;
begin
  if FDataContextList = nil then Exit;
  iCount := FDataContextList.Count;
  for i := 0 to iCount - 1 do
  begin
    ADataContext := (FDataContextList.Items[i] as IDataContext);
    ADataContext.EndDataState(DataStateList);
  end;
  FBeginDataState := False;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.EndDataState
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  �ر�����״̬��¼(���׳������¼�)
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.EndDataState(ACaption: string = '');
var
  i, iCount: Integer;
  ADataContext: IDataContext;
  DataStateList: TInterfaceList;
begin
  DataStateList := TInterfaceList.Create;
  try
    iCount := FDataContextList.Count;
    for i := 0 to iCount - 1 do
    begin
      ADataContext := (FDataContextList.Items[i] as IDataContext);
      ADataContext.EndDataState(DataStateList);
    end;
    FBeginDataState := False;
    //�׳��¼�,�ⲿ����
    if Assigned(FOnEndDataState) then
      FOnEndDataState(DataStateList, ACaption);
  finally
    DataStateList.Clear;
    DataStateList.Free;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.GetDataContext
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ����ָ�����Ƶ�DataContext����
  ����:      const sDataName: string
  ����ֵ:    IDataContext
-------------------------------------------------------------------------------}

function TPrjDataManager.GetDataContext(const sDataName: string): IDataContext;
var
  sStreamName: string;
  AStorage: IStorage;
begin
  Result := IntelGetDataContext(sDataName);
  if Result = nil then
  begin
    AStorage := nil;
    if sDataName = cst_DataContext_XmData then
      AStorage := FCurrStorage
    else
    begin
      if DataRegister <> nil then
      begin
        sStreamName := DataRegister.GetRegisterName(sDataName, rgtStorage);
        if Length(sStreamName) <> 0 then
          FCurrDocument.GetStorage(FCurrStorage, sStreamName, AStorage);
      end;
    end;
    if AStorage <> nil then
    begin
      Result := DoCreateDataContext(AStorage, sDataName);
      //�ж��Ƿ�Ҫ��ʼ��¼���ݲ���״̬
      if (Result <> nil) and FBeginDataState then
        Result.BeginDataState;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.GetDataRegister
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  ��ȡ����ע�����
  ����:      ��
  ����ֵ:    TDataRegister
-------------------------------------------------------------------------------}

function TPrjDataManager.GetDataRegister: TDataRegister;
var
  ADataSet: IPMDataset;
  ADataContext: IDataContext;
begin
  if FDataRegister = nil then
  begin
    ADataContext := GetDataContext(cst_DataContext_XmData);
    if Assigned(ADataContext) then
    begin
      ADataSet := ADataContext.GetDataSet(cst_Table_SjZc);
      if Assigned(ADataSet) then
        FDataRegister := TDataRegister.Create(ADataSet);
    end;
  end;
  Result := FDataRegister;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.GetDataStates
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  ��ȡ���ݲ���״̬�б�
  ����:      DataStateList: TInterfaceList
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.GetDataStates(DataStateList: TInterfaceList);
var
  i, iCount: Integer;
  ADataContext: IDataContext;
begin
  iCount := FDataContextList.Count;
  for i := 0 to iCount - 1 do
  begin
    ADataContext := (FDataContextList.Items[i] as IDataContext);
    ADataContext.EndDataState(DataStateList);
  end;
  FBeginDataState := False;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.GetEndDataState
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  ��ȡ�¼�
  ����:      ��
  ����ֵ:    TEndDataStateEvent
-------------------------------------------------------------------------------}

function TPrjDataManager.GetEndDataState: TEndDataStateEvent;
begin
  Result := FOnEndDataState;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.IntelGetDataContext
  ����:      Wenxh
  ����:      2010.06.24
  ��������:  �ڲ������Ѿ�������DataContext
  ����:      const sDataName: string
  ����ֵ:    IDataContext
-------------------------------------------------------------------------------}

function TPrjDataManager.IntelGetDataContext(
  const sDataName: string): IDataContext;
var
  i, iCount: Integer;
  ADataContext: IDataContext;
begin
  Result := nil;
  iCount := FDataContextList.Count;
  for i := 0 to iCount - 1 do
  begin
    ADataContext := (FDataContextList.Items[i] as IDataContext);
    if ADataContext.DataToken = sDataName then
      Result := ADataContext;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.LoadPrj
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ���ع�������
  ����:      FileName: string
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TPrjDataManager.LoadPrj(const FileName: string; bDecompress: Boolean =
  False): Boolean;
begin
  Clear;
  FbDeCompress := bDecompress;
  FFileName := FileName;
  if bDecompress then
    Result := DoLoadPrj_DeCompress
  else
    Result := DoLoadPrj;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.RollBack
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  ���ݴ����쳣ʱ�ع�����
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.RollBack;
var
  DataStateList: TInterfaceList;
begin
  DataStateList := TInterfaceList.Create;
  try
    GetDataStates(DataStateList);
    UnDoDataStates(DataStateList);
  finally
    DataStateList.Clear;
    DataStateList.Free;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.SavePrj
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ���湤������
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

function TPrjDataManager.SavePrj(const FileName: string = ''; bCompress:
    Boolean = False; bShowProgress: Boolean = False; AOwnerHandle: Cardinal =
    0; bInternalMode: Boolean = False; bBackUp: Boolean = True): Boolean;
var
  sPath: string;
  AOldFileName: string;
  bResult: Boolean;
  sMessage: string;
begin
//  if FSection <> nil then
//    FSection.Enter;
  try
    FbCompress := bCompress;
    FbShowProgress := bShowProgress;
    AOldFileName := FFileName;
    FOwnerHandle := AOwnerHandle;
    if FileName <> '' then
      FFileName := FileName;
    //�ж�һ��Ŀ¼�Ƿ��Ѿ�����
    bResult := True;
    sPath := ExtractFilePath(FFileName);
    if not DirectoryExists(sPath) then
      bResult := ForceDirectories(sPath);
    if Not bResult then
    begin
      sMessage := '�����ļ�ʧ��(�����ļ�·��ʧ��)�����Ժ��ٱ��棡';
      Warn(FOwnerHandle, sMessage);
      FFileName := AOldFileName;
      Result := False;
      Exit;
    end;
    if bCompress then
    begin
      Result := DoSavePrj_Compress(bShowProgress, bInternalMode, bBackUp);
    end
    else
      Result := DoSavePrj;
    //�������ʧ��(�ָ�Ϊ�ϵ��ļ���)
    if Not Result then
      FFileName := AOldFileName;
  finally
//    if FSection <> nil then
//      FSection.Leave;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.SavePrj
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ���湤������
  ����:      ��
  ����ֵ:    ��
  ------------------------------------------------------------------------------- }

function TPrjDataManager.SavePrjToStream(AStream: TStream): Boolean;
var
  _FileName: string;
  iSaveCount: Integer;
  sBackFileName: string;
  bResult: Boolean;
begin
  iSaveCount := 1;
  sBackFileName := '';
  try
    Result := DoSaveDataContext;
    if not Result then
    begin
      Warn(0, '�����ļ����ݳ������Ժ��ٱ��棡');
      Exit;
    end;
    Result := False;
    FCurrDocument.Commit;
    // ���ƴ�����ʱ�ļ�

    {if CheckFileInUse(FCurrDocument.GetFileName) then
      Warn('�ļ����ڱ�ʹ�ã����Ժ��ٱ��棡')
    else }
    begin
      // ѹ�������ļ���ѹ��ʧ�ܺ��ظ�ѹ��3��
      Result := DoCompressFileToStream(FCurrDocument.GetFileName, AStream);
      while not Result and (iSaveCount <= 3) do
      begin
        Sleep(iSaveCount * 300);
        Result := DoCompressFileToStream(FCurrDocument.GetFileName, AStream);
        Inc(iSaveCount);
      end;
      if not Result then
        Warn(0, '�ļ���������г��ִ������Ժ��ٱ��棡');
    end;
  except
    Result := False;
    Warn(0, '�����ļ�ʧ�ܣ�');
  end;
end;

{ -------------------------------------------------------------------------------
  ������:    TPrjDataManager.SetEndDataState
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  �����¼�
  ����:      Value: TEndDataStateEvent
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.SetEndDataState(Value: TEndDataStateEvent);
begin
  FOnEndDataState := Value;
end;

procedure TPrjDataManager.SetFileName(const AValue: string);
begin
  FFileName := AValue;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.UnDoDataStates
  ����:      Wenxh
  ����:      2010.08.30
  ��������:  �ع�����(��������)
  ����:      DataStateList: TInterfaceList
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.UnDoDataStates(DataStateList: TInterfaceList);
var
  i, iCount: Integer;
  AState: IDataState;
begin
  iCount := DataStateList.Count;
  for i := iCount - 1 downto 0 do
  begin
    AState := (DataStateList.Items[i] as IDataState);
    AState.UnDo;
  end;
end;

{-------------------------------------------------------------------------------
  ������:    TPrjDataManager.UnInit
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  �ͷ��������
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TPrjDataManager.UnInit;
begin
  FDataContextList.Clear;
  FDataContextList.Free;
  FCurrStorage := nil;
  if FCurrDocument <> nil then
  begin
    FCurrDocument.CloseDocument;
    FCurrDocument := nil;
  end;
  if FDataRegister <> nil then
     FreeAndNil(FDataRegister);
//    FDataRegister.Free;
  //ɾ����ʱ�ļ�
  if FileExists(FTempFileName) then
    DeleteFile(PChar(FTempFileName));
end;

function TPrjDataManager.GetFileName: string;
begin
  Result := FFileName;
end;

function TPrjDataManager.DoLoadPrj: Boolean;
var
  sStr: string;
begin
  Result := False;
  FCurrStorage := nil;
  //������ʱ�ļ�����ʱ�ļ��Ѿ���������ɾ���󴴽�
  sStr := GetGUIDstr;
  FTempFileName := GetSysTempPath + sStr + cst_TempFileExt;
  if FileExists(FTempFileName) then
    DeleteFile(FTempFileName);
  //��ֹģ�������\���¹��̴���ʧ��
  if Pos('\\', FFileName) > 0 then
    FFileName := StringReplace(FFileName, '\\', '\', []);
  CopyFile(PChar(FFileName), PChar(FTempFileName), False);
  //����ļ��Ƿ����ڱ�ʹ��
  if CheckFileInUse(FTempFileName) then
    Exit;
  //�򿪲�������ʱ�ļ�
  FCurrDocument := CreateDocument(FTempFileName);
  if FCurrDocument <> nil then
  begin
    FCurrStorage := FCurrDocument.m_RootStorage;
    Result := FCurrStorage <> nil;
  end;
end;

function TPrjDataManager.DoLoadPrj_DeCompress: Boolean;
var
  sStr: string;
  _FileName: string;
  bResult: Boolean;
begin
  Result := False;
  //������ʱ�ļ�����ʱ�ļ��Ѿ���������ɾ���󴴽�
  sStr := GetGUIDstr;
  FTempFileName := GetSysTempPath + sStr + cst_TempFileExt;
  if FileExists(FTempFileName) then
    DeleteFile(FTempFileName);
  //�ж��ļ��Ƿ����
  if FileExists(FFileName) then
  begin
    _FileName := GetProjectFileName;
    //����ļ��Ƿ����ڱ�ʹ��
    if CheckFileInUse(_FileName) then
      Exit;
    if FileExists(_FileName) then
      DeleteFile(_FileName);
    try
      bResult := Decompression(PChar(FFileName), PChar(GetSysTempPath));
      if bResult and FileExists(_FileName) then
      begin
        //����ļ��Ƿ����ڱ�ʹ��
        if CheckFileInUse(_FileName) then
          Exit;
        //����ѹ�������ļ�����Ϊ��ʱ�ļ�
        bResult := RenameFile(_FileName, FTempFileName);
        if not bResult then
        begin
          Warn(FOwnerHandle,'���ļ�ʧ�ܣ�');
          Exit;
        end;
      end
      else
      begin
        Warn(FOwnerHandle,'���ļ�ʧ�ܣ�');
        Exit;
      end;
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ES_0005 + e.Message);
        Warn(FOwnerHandle,'���ļ�ʧ�ܣ�');
        Exit;
      end;
    end;
  end;
  //�򿪲�������ʱ�ļ�
  FCurrDocument := CreateDocument(FTempFileName);
  if FCurrDocument <> nil then
    FCurrStorage := FCurrDocument.m_RootStorage;
  Result := (FCurrDocument <> nil) and (FCurrStorage <> nil);
end;

function TPrjDataManager.GetProjectFileName: string;
begin
  Result := GetSysTempPath + cst_PrjFileName;
end;

function TPrjDataManager.IsBeginDataState: Boolean;
begin
  Result := FBeginDataState;
end;

function TPrjDataManager.CreateNewTempFile: string;
var
  Hre: HResult;
  TempStorage: IStorage;
  TempFile: WideString;
begin
  Result := '';
  FCurrStorage := FCurrDocument.m_RootStorage;
  TempFile := ExtractFilePath(FTempFileName) + GetGUIDstr + cst_TempFileExt;
  if FileExists(TempFile) then
    DeleteFile(TempFile);
  Hre := StgCreateDocfile(PWideChar(TempFile), STGM_CREATE or STGM_READWRITE
    or STGM_DIRECT or STGM_SHARE_EXCLUSIVE, 0, TempStorage);
   //���� FFileName��ʱ�����ĵ�
  if not SUCCEEDED(Hre) then Exit;
  FCurrStorage.CopyTo(0, nil, nil, TempStorage); //��FFileName �����ĵ������ݸ��Ƶ���//ʱ�����ĵ���
  Result := TempFile;
  TempStorage := nil;
end;

procedure TPrjDataManager.SetOnBackupFileEvent(Value: TOnBackupFileEvent);
begin
  FOnBackupFileEvent := Value;
end;

function TPrjDataManager.DoSavePrj_Compress(bShowProgress: Boolean;
    bInternalMode: Boolean = False; bBackUp: Boolean = True): Boolean;
var
  _FileName: string;
  iSaveCount: Integer;
  sBackFileName: string;
  bResult: Boolean;
  iResult: Integer;
  sDriver: string;
  AvailableSize, TotalSize, FreeSize: Int64;
  bNotEnoughRoom: Boolean;
  sErrorMessage: string;
begin
  iSaveCount := 1;
  sBackFileName := '';
  try
    if bShowProgress then
      ShowProgress('���ڱ����ļ�', 5);
    try
      if bShowProgress then
        UpdateProgress;
      //����DataContext
      Result := DoSaveDataContext(bInternalMode);
      if not Result then
      begin
        //��鵱ǰ�̵Ĵ��̿ռ�
        sDriver := Copy(ExtractFilePath(Application.ExeName), 1, 3);
        GetDiskFreeSpaceEx(PChar(sDriver), AvailableSize, TotalSize, @FreeSize);
        if AvailableSize / 1024 / 1024 < 200 then
          Warn(FOwnerHandle,
            '������ڵĴ��̿ռ�����200M��Ϊ�˱�֤�����������棬���������')
        else
          Warn(FOwnerHandle,'�����ļ����ݳ������Ժ��ٱ��棡');
        Exit;
      end;
      Result := False;
      if bShowProgress then
        UpdateProgress;
      iResult := FCurrDocument.Commit;
      if iResult <> S_OK then
        AppendFiledata(cst_logname, cst_error_ES_0011
          + ' CommitResult:' + IntToStr(iResult));
      if bShowProgress then
        UpdateProgress;
      //����ǰ��ʱ�ļ�������
      if bBackUp and Assigned(FOnBackupFileEvent) then
      begin
        try
          FOnBackupFileEvent(nil, FCurrDocument.m_FileName, ExtractFileName(FFileName));
        except
          on e: Exception do
          begin
            AppendFiledata(cst_logname, cst_error_ES_0019 + e.Message);
          end;
        end;
      end;
      //���ƴ�����ʱ�ļ�(����ļ�С��200MB����ע����Ŀ(��Ŀ�ڵ����)
      //С��200�Ĺ��������ѹ���洢)
      try
        _FileName := '';
        if CheckFileSize and (DataRegister.GetRegisterRecCount < 200) then
          _FileName := CreateNewTempFile_Compress;
        //��Ƭ����ʧ��,�򲻽�����Ƭ������
        if _FileName = '' then
        begin
          _FileName := GetProjectFileName;
          if not CopyFile(PChar(FTempFileName), PChar(_FileName), False) then
            _FileName := '';
        end;
      except
        on e: Exception do
        begin
          AppendFiledata(cst_logname, cst_error_ES_0020 + e.Message);
          raise Exception.Create(e.Message);
        end;
      end;
      //
      if _FileName <> '' then
      begin
        //�ж��ļ��Ƿ��ڱ���״̬
        if CheckFileInUse(_FileName) then
          Warn(FOwnerHandle,'�ļ����ڱ�ʹ�ã����Ժ��ٱ��棡')
        else
        begin
          //��Ŀ���ļ�����ʱ���ݣ�����ʧ�ܺ���Իָ�
          if FileExists(FFileName) then
          begin
            sBackFileName := ChangeFileExt(FFileName, cst_TempFileExt);
            bResult := CopyFile(PChar(FFileName), PChar(sBackFileName), False);
            //���ݳɹ���ɾ��Ŀ���ļ�
            if bResult and FileExists(sBackFileName) then
              DeleteFile(FFileName);
          end;
          //ѹ�������ļ���ѹ��ʧ�ܺ��ظ�ѹ��3��
          Result := DoCompressFile(_FileName, FFileName, bNotEnoughRoom, sErrorMessage);
          while (not Result) and (iSaveCount <= 3) and (Not bNotEnoughRoom) do
          begin
            Sleep(iSaveCount * 300);
            Result := DoCompressFile(_FileName, FFileName, bNotEnoughRoom, sErrorMessage);
            Inc(iSaveCount);
          end;
          if not Result then
          begin
            if bNotEnoughRoom then
              Warn(FOwnerHandle, '����ʧ�ܣ����̿ռ䲻�㣬����մ��̿ռ���ٱ��棡')
            else if Not IsLocalDisk(ExtractFileDrive(FFileName)) then
              Warn(FOwnerHandle,'�ļ����ڱ�ʹ�ã���ǰ�����ļ�����λ��Ϊ���ƶ��豸������һ�����գ����鱣�浽���ش��̣�')
            else if Pos('Cannot', sErrorMessage) > 0 then
              Warn(FOwnerHandle, '����ʧ�ܣ�' + sErrorMessage)
            else
              Warn(FOwnerHandle,'�ļ����ڱ�ʹ�ã����Ժ��ٱ�����ļ����Ϊ���ļ���');
          end;
          //�������ʧ�ܲ���Ŀ���ļ������ڣ���ӱ����ļ��ָ�
          if not Result and not FileExists(FFileName) then
          begin
            if FileExists(sBackFileName) then
              CopyFile(PChar(sBackFileName), PChar(FFileName), False);
          end;
          //ɾ����ʱ�����ļ�
          if FileExists(FFileName) and FileExists(sBackFileName) then
            DeleteFile(sBackFileName);
        end;
        if FileExists(_FileName) then
          DeleteFile(_FileName);
      end
      else
      begin
        //��鵱ǰ�̵Ĵ��̿ռ�
        sDriver := Copy(ExtractFilePath(Application.ExeName), 1, 3);
        GetDiskFreeSpaceEx(PChar(sDriver), AvailableSize, TotalSize, @FreeSize);
        if AvailableSize / 1024 / 1024 < 200 then
          Warn(FOwnerHandle,
            '������ڵĴ��̿ռ�����200M��Ϊ�˱�֤�����������棬���������')
        else
          Warn(FOwnerHandle,'�����ļ�ʧ�ܣ����Ժ��ٱ��棡');
      end;
    finally
      if bShowProgress then
      begin
        UpdateProgress;
        HideProgress;
      end;
    end;
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ES_0004 + e.Message);
      Result := False;
      Warn(FOwnerHandle,'�����ļ�ʧ�ܣ�');
    end;
  end;
end;

function TPrjDataManager.DoCompressFile(SrcFileName, DstFileName: string; out
    bNotEnoughRoom: Boolean; out ErrMessage: string): Boolean;
begin
  bNotEnoughRoom := False;
  try
    Result := CompressSingleFile(PChar(SrcFileName), PChar(DstFileName));
  except
    on e: Exception do
    begin
      ErrMessage := e.Message;
      bNotEnoughRoom := Pos('Not enough room', ErrMessage) > 0;
      AppendFiledata(cst_logname, cst_error_ES_0003 + ErrMessage);
      Result := False;
    end;
  end;
end;

function TPrjDataManager.DoCompressFileToStream(SrcFileName: string; Stream: TStream): Boolean;
begin
  try
    Result := CompressToStream(PChar(SrcFileName), Stream);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ES_0002 + e.Message);
      Result := False;
    end;
  end;
end;

function TPrjDataManager.CheckFileSize: Boolean;
var
  FS: TFileStream;
begin
  Result := True;
  if IsFileInUse(FTempFileName) then
    Exit;
  try
    FS := TFileStream.Create(FTempFileName, fmShareDenyNone);
    Result := FS.Size / 1024 / 1024 < 200;
    FS.Free;
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ES_0001 + e.Message);
      Result := True;
    end;
  end;
end;

procedure TPrjDataManager.Clear;
begin
  FDataContextList.Clear;
  if FDataRegister <> nil then
     FreeAndNil(FDataRegister);
end;

function TPrjDataManager.Commit: Boolean;
begin
  Result := False;
  if FCurrDocument <> nil then
    Result := FCurrDocument.Commit = S_OK;
end;

end.

