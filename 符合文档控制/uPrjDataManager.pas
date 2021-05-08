{******************************************************}
{ 产品名称：PMSS5.0                                    }
{ 单元描述：文件的数据管理(通过原文件复制一个中间文件, }
{           对中间文件进行操作,保存的时候复制到实际文件}
{ 单元作者：Wenxh                                      }
{ 创建时间：2010.05.27                                 }
{ 备    注：                                           }
{ 修改记录：                                           }
// 2013-8-5 Wenxh 修正文件加载时，加载失败没有判断可能引发的报错问题
// 2013-9-22 Wenxh 修正保存文件时，可能保存不成功的问题(另存则可以)
// 2013-10-12 Wenxh 修正保存文件时，如果创建文件路径失败可能会引起的错误(10.14
//                  修正变量未初始化的问题)
// 2014-7-31 Wenxh  修正压缩文件时，会压缩多余文件的问题 BugId: 8303
// 2015-11-27 Wenxh 增加：增加内部保存模式
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
    //数据注册管理器
    FDataRegister: TDataRegister;
    //当然复合文档
    FCurrDocument: ICompoundDocument;
    //当前根存储
    FCurrStorage: IStorage;
    //DataContext列表
    FDataContextList: TInterfaceList;
    //文件名称(实际文件)
    FFileName: string;
    //临时文件(操作文件)
    FTempFileName: string;
    //记录操作开启状态
    FBeginDataState: Boolean;
    //事件
    FOnEndDataState: TEndDataStateEvent;
    //
    FOnBackupFileEvent: TOnBackupFileEvent;
    //是否要压缩/解压缩
    FbCompress: Boolean;
    FbDeCompress: Boolean;
    //是否要弹出进度条
    FbShowProgress: Boolean;
    FOwnerHandle: Cardinal;
    function CreateDocument(const FileName: string): ICompoundDocument;
    function IntelGetDataContext(const sDataName: string): IDataContext;
    function DoCreateDataContext(AStorage: IStorage; const sDataName: string): IDataContext;
    function GetProjectFileName: string;
    //打开
    function DoLoadPrj: Boolean;
    function DoLoadPrj_DeCompress: Boolean;
    //保存
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
    //存储模型注册器(根存储DataContext的注册器)
    property DataRegister: TDataRegister read GetDataRegister;
  private
    {*******************************实现接口***********************************}
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
    /// 设置工程文件名：为了解决工程保存至临时文件后，FileName 被更改到临时文件名了
    ///                 需通过此方法回设成工程文件,否则，工程有可能会保存至临时文件了
    /// </summary>
    /// <param name="AValue">文件名</param>
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
  //工程文件名(固定文件名)
  cst_PrjFileName = 'PROJECTFILE.XM';

implementation

uses
  uDataManagerConst, uMessage, uDataManagerUtils, ufrmProgress,
  uZipImpl, uPMDataUtils, uPMDataConst;

{-------------------------------------------------------------------------------
  过程名:    TPrjDataManager.BeginDataState
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  开始数据操作状态记录
  参数:      无
  返回值:    无
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
  过程名:    TPrjDataManager.CreateDataContext
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  创建一个DataContext
  参数:      const sDataName: string
  返回值:    IDataContext
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
  //向注册表注册并获取到实际存储的名称
  sStreamName := DataRegister.DataRegister(sDataName, rgtStorage);
  if sStreamName = '' then
    Exit;
  FCurrDocument.CreateStorage(FCurrStorage, sStreamName, AStorage);
  if AStorage = nil then
    Exit;
  Result := DoCreateDataContext(AStorage, sDataName);
  //判断是否要开始记录数据操作状态
  if (Result <> nil) and FBeginDataState then
    Result.BeginDataState;
end;

{-------------------------------------------------------------------------------
  过程名:    TPrjDataManager.CreateDocument
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  通过文件名打开或创建文件
  参数:      无
  返回值:    Boolean
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
  //创建文件成功
  if not bSucceed then
  begin
    //创建文件失败
    Result.CloseDocument;
    Result := nil;
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TPrjDataManager.DeleteContext
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  删除指定的数据上下层管理对象（即删除项目管理节点）
  参数:      const sDataName: string
  返回值:    无
-------------------------------------------------------------------------------}

procedure TPrjDataManager.DeleteContext(const sDataName: string);
var
  sStreamName: string;
  ADataContext: IDataContext;
begin
  ADataContext := GetDataContext(sDataName);
  if ADataContext <> nil then
  begin
    //获取注册名
    sStreamName := DataRegister.GetRegisterName(sDataName, rgtStorage);
    //删除存储数据
    FCurrDocument.DeleteStorage(FCurrStorage, sStreamName);
    FDataContextList.Remove(ADataContext);
    //删除数据注册记录
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
  过程名:    TPrjDataManager.DoCreateDataContext
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  创建DataContext对象
  参数:      AStorage: IStorage; const sDataName: string
  返回值:    IDataContext
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
  //建立 FFileName临时复合文档
  if SUCCEEDED(Hre) then
  begin
    Hre := FCurrStorage.CopyTo(0, nil, nil, TempStorage); //把FFileName 复合文档的内容复制到临//时复合文档中
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
  过程名:    TPrjDataManager.DoSaveDataContext
  作者:      Wenxh
  日期:      2010.07.12
  功能描述:  保存所有DataContext数据
  参数:      无
  返回值:    无
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
  过程名:    TPrjDataManager.DoSavePrj
  作者:      Wenxh
  日期:      2010.07.12
  功能描述:  执行保存操作时
  参数:      无
  返回值:    无
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
    Warn(FOwnerHandle,'保存文件失败！');
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TPrjDataManager.EndDataState
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  关闭数据操作状态记录(返回数据操作列表)
  参数:      DataStateList: TInterfaceList
  返回值:    无
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
  过程名:    TPrjDataManager.EndDataState
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  关闭数据状态记录(并抛出处理事件)
  参数:      无
  返回值:    无
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
    //抛出事件,外部处理
    if Assigned(FOnEndDataState) then
      FOnEndDataState(DataStateList, ACaption);
  finally
    DataStateList.Clear;
    DataStateList.Free;
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TPrjDataManager.GetDataContext
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  数据指定名称的DataContext对象
  参数:      const sDataName: string
  返回值:    IDataContext
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
      //判断是否要开始记录数据操作状态
      if (Result <> nil) and FBeginDataState then
        Result.BeginDataState;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TPrjDataManager.GetDataRegister
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  获取数据注册对象
  参数:      无
  返回值:    TDataRegister
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
  过程名:    TPrjDataManager.GetDataStates
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  获取数据操作状态列表
  参数:      DataStateList: TInterfaceList
  返回值:    无
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
  过程名:    TPrjDataManager.GetEndDataState
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  获取事件
  参数:      无
  返回值:    TEndDataStateEvent
-------------------------------------------------------------------------------}

function TPrjDataManager.GetEndDataState: TEndDataStateEvent;
begin
  Result := FOnEndDataState;
end;

{-------------------------------------------------------------------------------
  过程名:    TPrjDataManager.IntelGetDataContext
  作者:      Wenxh
  日期:      2010.06.24
  功能描述:  内部查找已经创建的DataContext
  参数:      const sDataName: string
  返回值:    IDataContext
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
  过程名:    TPrjDataManager.LoadPrj
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  加载工程数据
  参数:      FileName: string
  返回值:    Boolean
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
  过程名:    TPrjDataManager.RollBack
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  数据处理异常时回滚操作
  参数:      无
  返回值:    无
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
  过程名:    TPrjDataManager.SavePrj
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  保存工程数据
  参数:      无
  返回值:    无
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
    //判断一下目录是否已经创建
    bResult := True;
    sPath := ExtractFilePath(FFileName);
    if not DirectoryExists(sPath) then
      bResult := ForceDirectories(sPath);
    if Not bResult then
    begin
      sMessage := '保存文件失败(创建文件路径失败)，请稍候再保存！';
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
    //如果保存失败(恢复为老的文件名)
    if Not Result then
      FFileName := AOldFileName;
  finally
//    if FSection <> nil then
//      FSection.Leave;
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TPrjDataManager.SavePrj
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  保存工程数据
  参数:      无
  返回值:    无
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
      Warn(0, '保存文件数据出错，请稍候再保存！');
      Exit;
    end;
    Result := False;
    FCurrDocument.Commit;
    // 复制创建临时文件

    {if CheckFileInUse(FCurrDocument.GetFileName) then
      Warn('文件正在被使用，请稍候再保存！')
    else }
    begin
      // 压缩保存文件，压缩失败后重复压缩3遍
      Result := DoCompressFileToStream(FCurrDocument.GetFileName, AStream);
      while not Result and (iSaveCount <= 3) do
      begin
        Sleep(iSaveCount * 300);
        Result := DoCompressFileToStream(FCurrDocument.GetFileName, AStream);
        Inc(iSaveCount);
      end;
      if not Result then
        Warn(0, '文件保存过程中出现错误，请稍候再保存！');
    end;
  except
    Result := False;
    Warn(0, '保存文件失败！');
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPrjDataManager.SetEndDataState
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  设置事件
  参数:      Value: TEndDataStateEvent
  返回值:    无
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
  过程名:    TPrjDataManager.UnDoDataStates
  作者:      Wenxh
  日期:      2010.08.30
  功能描述:  回滚操作(撤消数据)
  参数:      DataStateList: TInterfaceList
  返回值:    无
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
  过程名:    TPrjDataManager.UnInit
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  释放相关数据
  参数:      无
  返回值:    无
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
  //删除临时文件
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
  //生成临时文件，临时文件已经存在则先删除后创建
  sStr := GetGUIDstr;
  FTempFileName := GetSysTempPath + sStr + cst_TempFileExt;
  if FileExists(FTempFileName) then
    DeleteFile(FTempFileName);
  //防止模板多输入\导致工程创建失败
  if Pos('\\', FFileName) > 0 then
    FFileName := StringReplace(FFileName, '\\', '\', []);
  CopyFile(PChar(FFileName), PChar(FTempFileName), False);
  //检查文件是否正在被使用
  if CheckFileInUse(FTempFileName) then
    Exit;
  //打开操作的临时文件
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
  //生成临时文件，临时文件已经存在则先删除后创建
  sStr := GetGUIDstr;
  FTempFileName := GetSysTempPath + sStr + cst_TempFileExt;
  if FileExists(FTempFileName) then
    DeleteFile(FTempFileName);
  //判断文件是否存在
  if FileExists(FFileName) then
  begin
    _FileName := GetProjectFileName;
    //检查文件是否正在被使用
    if CheckFileInUse(_FileName) then
      Exit;
    if FileExists(_FileName) then
      DeleteFile(_FileName);
    try
      bResult := Decompression(PChar(FFileName), PChar(GetSysTempPath));
      if bResult and FileExists(_FileName) then
      begin
        //检查文件是否正在被使用
        if CheckFileInUse(_FileName) then
          Exit;
        //将解压出来的文件更名为临时文件
        bResult := RenameFile(_FileName, FTempFileName);
        if not bResult then
        begin
          Warn(FOwnerHandle,'打开文件失败！');
          Exit;
        end;
      end
      else
      begin
        Warn(FOwnerHandle,'打开文件失败！');
        Exit;
      end;
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ES_0005 + e.Message);
        Warn(FOwnerHandle,'打开文件失败！');
        Exit;
      end;
    end;
  end;
  //打开操作的临时文件
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
   //建立 FFileName临时复合文档
  if not SUCCEEDED(Hre) then Exit;
  FCurrStorage.CopyTo(0, nil, nil, TempStorage); //把FFileName 复合文档的内容复制到临//时复合文档中
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
      ShowProgress('正在保存文件', 5);
    try
      if bShowProgress then
        UpdateProgress;
      //保存DataContext
      Result := DoSaveDataContext(bInternalMode);
      if not Result then
      begin
        //检查当前盘的磁盘空间
        sDriver := Copy(ExtractFilePath(Application.ExeName), 1, 3);
        GetDiskFreeSpaceEx(PChar(sDriver), AvailableSize, TotalSize, @FreeSize);
        if AvailableSize / 1024 / 1024 < 200 then
          Warn(FOwnerHandle,
            '软件所在的磁盘空间少于200M，为了保证工程正常保存，请进行清理！')
        else
          Warn(FOwnerHandle,'保存文件数据出错，请稍候再保存！');
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
      //保存前临时文件做备份
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
      //复制创建临时文件(如果文件小于200MB或者注册条目(项目节点个数)
      //小于200的工程则进行压缩存储)
      try
        _FileName := '';
        if CheckFileSize and (DataRegister.GetRegisterRecCount < 200) then
          _FileName := CreateNewTempFile_Compress;
        //碎片整理失败,则不进行碎片整理保存
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
        //判断文件是否处于被用状态
        if CheckFileInUse(_FileName) then
          Warn(FOwnerHandle,'文件正在被使用，请稍候再保存！')
        else
        begin
          //将目标文件做临时备份，保存失败后可以恢复
          if FileExists(FFileName) then
          begin
            sBackFileName := ChangeFileExt(FFileName, cst_TempFileExt);
            bResult := CopyFile(PChar(FFileName), PChar(sBackFileName), False);
            //备份成功才删除目标文件
            if bResult and FileExists(sBackFileName) then
              DeleteFile(FFileName);
          end;
          //压缩保存文件，压缩失败后重复压缩3遍
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
              Warn(FOwnerHandle, '保存失败，磁盘空间不足，请清空磁盘空间后再保存！')
            else if Not IsLocalDisk(ExtractFileDrive(FFileName)) then
              Warn(FOwnerHandle,'文件正在被使用，当前工程文件保存位置为可移动设备，存在一定风险，建议保存到本地磁盘！')
            else if Pos('Cannot', sErrorMessage) > 0 then
              Warn(FOwnerHandle, '保存失败，' + sErrorMessage)
            else
              Warn(FOwnerHandle,'文件正在被使用，请稍候再保存或将文件另存为新文件！');
          end;
          //如果保存失败并且目标文件不存在，则从备份文件恢复
          if not Result and not FileExists(FFileName) then
          begin
            if FileExists(sBackFileName) then
              CopyFile(PChar(sBackFileName), PChar(FFileName), False);
          end;
          //删除临时备份文件
          if FileExists(FFileName) and FileExists(sBackFileName) then
            DeleteFile(sBackFileName);
        end;
        if FileExists(_FileName) then
          DeleteFile(_FileName);
      end
      else
      begin
        //检查当前盘的磁盘空间
        sDriver := Copy(ExtractFilePath(Application.ExeName), 1, 3);
        GetDiskFreeSpaceEx(PChar(sDriver), AvailableSize, TotalSize, @FreeSize);
        if AvailableSize / 1024 / 1024 < 200 then
          Warn(FOwnerHandle,
            '软件所在的磁盘空间少于200M，为了保证工程正常保存，请进行清理！')
        else
          Warn(FOwnerHandle,'保存文件失败，请稍候再保存！');
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
      Warn(FOwnerHandle,'保存文件失败！');
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

