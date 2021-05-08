{******************************************************}
{ 产品名称：PMSS5.0                                    }
{ 单元描述：负责与复合文档进行交互                     }
{ 单元作者：Wenxh                                      }
{ 创建时间：2010.05.24                                 }
{ 备    注：                                           }
{ 修改记录：                                           }
// 2015-11-27 Wenxh 增加：增加内部保存模式
{******************************************************}

unit uCompoundDocument;

interface

uses
  Windows, Classes, SysUtils, ActiveX, AxCtrls, uCompoundDocumentIntf;

type
{******************************************************}
{ 责任描述：复合文档操作与管理                         }
{******************************************************}
  TCompoundDocument = class(TInterfacedObject, ICompoundDocument)
  private
    FFileName: WideString;
    FRootStorage: IStorage;
    function OpenFile: Boolean;
    function CreateFile: Boolean;
  public
    {ICompoundDocument}
    function GetFileName: WideString;
    function GetRootStorage: IStorage;
    function CreateDocument(const sFileName: WideString; bOpen: Boolean): Boolean;
    procedure CloseDocument;
    function Commit: Integer;
    procedure Revert;
    function CreateStorage(APStorage: IStorage; const AStorageName: WideString;
      var ASubStorage: IStorage): Boolean;
    function CreateStream(APStorage: IStorage; const AStreamName: WideString; var
        ASubStream: IStream; bInternalMode: Boolean = False): Boolean;
    function DeleteStorage(APStorage: IStorage; const AStorageName: WideString): Boolean;
    function DeleteStream(APStorage: IStorage; const AStreamName: WideString): Boolean;
    function GetStorage(APStorage: IStorage; const AStorageName: WideString;
      var ASubStorage: IStorage): Boolean;
    function GetStream(APStorage: IStorage; const AStreamName: WideString;
      var ASubStream: IStream): Boolean;
    function StorageIsExist(APStorage: IStorage; const AStorageName: WideString): Boolean;
    function StreamIsExist(APStorage: IStorage; const AStreamName: WideString): Boolean;
    {Save and Load}
    function SaveToStream(APStorage: IStorage; const AStreamName: WideString;
        AMemoryStream: TStream; bInternalMode: Boolean = False): Boolean;
    function LoadFromStream(APStorage: IStorage; const AStreamName: WideString;
      AMemoryStream: TMemoryStream): Boolean;
    function GetResList(AStorage: IStorage; AResList: TStringList): Boolean;
  end;


implementation

uses
  uDataManagerUtils, uPMDataUtils, uPMDataConst, uDataManagerConst;

{ TCompoundDocument }

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.CloseDocument
  作者:      Wenxh
  日期:      2010.05.24
  功能描述:  关闭复合文档操作
  参数:      无
  返回值:    无
-------------------------------------------------------------------------------}

procedure TCompoundDocument.CloseDocument;
begin
//  Revert;
  FRootStorage := nil;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.Commit
  作者:      Wenxh
  日期:      2010.05.24
  功能描述:  事务中的提交操作
  参数:      无
  返回值:    无
-------------------------------------------------------------------------------}

function TCompoundDocument.Commit: Integer;
begin
  Result := FRootStorage.Commit(STGC_OVERWRITE);
//  CopyToFile;
end;


function TCompoundDocument.CreateDocument(const sFileName: WideString;
  bOpen: Boolean): Boolean;
begin
  Result := False;
  if bOpen then
  begin
    if CheckFileInUse(sFileName) then
      Exit;
  end;
  FFileName := sFileName;
  if bOpen then
    Result := OpenFile
  else
    Result := CreateFile;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.CreateFile
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  创建一个复合文档文件
  参数:      无
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.CreateFile: Boolean;
var
  pw: PWideChar;
begin
  pw := PWideChar(FFileName);
  Result := Succeeded(StgCreateDocfile(pw,
    STGM_CREATE or STGM_TRANSACTED or STGM_READWRITE
    or STGM_SHARE_EXCLUSIVE, 0, FRootStorage));
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.CreateStorage
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  创建一个存储
  参数:      APStorage: IStorage; const AStorageName: WideString;
             var ASubStorage: IStorage
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.CreateStorage(APStorage: IStorage;
  const AStorageName: WideString; var ASubStorage: IStorage): Boolean;
var
  pw: PWideChar;
  iResult: Integer;
begin
  pw := PWideChar(AStorageName);
  iResult := APStorage.CreateStorage
    (pw, STGM_CREATE or STGM_READWRITE or STGM_SHARE_EXCLUSIVE, 0, 0,
    ASubStorage);
  Result := Succeeded(iResult);
  if Not Result then
    AppendFiledata(cst_logname, cst_error_ES_0022 + IntToStr(iResult));
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.CreateStream
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  创建一个流对象
  参数:      APStorage: IStorage; const AStreamName: WideString;
             var ASubStream: IStream
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.CreateStream(APStorage: IStorage; const AStreamName:
    WideString; var ASubStream: IStream; bInternalMode: Boolean = False):
    Boolean;
var
  iResult: Integer;
begin
  if bInternalMode then
  begin
    iResult := APStorage.OpenStream(PWideChar(AStreamName), nil,
      STGM_READWRITE or STGM_SHARE_EXCLUSIVE, 0, ASubStream);
    Result := Succeeded(iResult) and (ASubStream <> nil);
    if Not Result then
    begin
      iResult := APStorage.CreateStream(PWideChar(AStreamName),
        STGM_CREATE or STGM_READWRITE or STGM_SHARE_EXCLUSIVE, 0, 0, ASubStream);
      Result := Succeeded(iResult);
      if Not Result then
        AppendFiledata(cst_logname, cst_error_ES_0028 + IntToStr(iResult));
    end
  end
  else
  begin
    iResult := APStorage.CreateStream(PWideChar(AStreamName),
      STGM_CREATE or STGM_READWRITE or STGM_SHARE_EXCLUSIVE, 0, 0, ASubStream);
    Result := Succeeded(iResult);
    if Not Result then
      AppendFiledata(cst_logname, cst_error_ES_0016 + IntToStr(iResult));
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.DeleteStorage
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  删除一个存储对象
  参数:      APStorage: IStorage; const AStorageName: WideString
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.DeleteStorage(APStorage: IStorage;
  const AStorageName: WideString): Boolean;
var
  pw: PWideChar;
begin
  pw := PWideChar(AStorageName);
  Result := Succeeded(APStorage.DestroyElement(pw));
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.DeleteStream
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  删除一个流对象
  参数:      APStorage: IStorage; const AStreamName: WideString
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.DeleteStream(APStorage: IStorage;
  const AStreamName: WideString): Boolean;
var
  pw: PWideChar;
begin
  pw := PWideChar(AStreamName);
  Result := Succeeded(APStorage.DestroyElement(pw));
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.GetFileName
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  获取当前复合文档文件名
  参数:      无
  返回值:    WideString
-------------------------------------------------------------------------------}

function TCompoundDocument.GetFileName: WideString;
begin
  Result := FFileName;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.GetResList
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  获取指定存储下的流对象列表（资源列表）
  参数:      AStorage: IStorage; AResList: TStringList
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.GetResList(AStorage: IStorage;
  AResList: TStringList): Boolean;
var
  s: string;
  EnumStatStg: IEnumStatStg;
  StatStg: TStatStg;
  iHResult: HRESULT;
begin
  Result := False;
  iHResult := AStorage.EnumElements(0, nil, 0, EnumStatStg);
  if iHResult = S_OK then
  begin
    while EnumStatStg.Next(1, StatStg, nil) = S_OK do
    begin
      s := StatStg.pwcsName;
      AResList.Add(s);
    end;
    Result := True;
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.GetRootStorage
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  返回根存储
  参数:      无
  返回值:    IStorage
-------------------------------------------------------------------------------}

function TCompoundDocument.GetRootStorage: IStorage;
begin
  Result := FRootStorage;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.GetStorage
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  在一个存储下通过指定的存储名获取存储
  参数:      APStorage: IStorage; const AStorageName: WideString;
             var ASubStorage: IStorage
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.GetStorage(APStorage: IStorage;
  const AStorageName: WideString; var ASubStorage: IStorage): Boolean;
begin
  Result := Succeeded(APStorage.OpenStorage(PWideChar(AStorageName), nil,
    STGM_READWRITE or STGM_SHARE_EXCLUSIVE, nil, 0, ASubStorage));
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.GetStream
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  在一个存储下通过指定的流名称找到相应的流对象
  参数:      APStorage: IStorage; const AStreamName: WideString;
             var ASubStream: IStream
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.GetStream(APStorage: IStorage;
  const AStreamName: WideString; var ASubStream: IStream): Boolean;
var
  iResult: Integer;
begin
  iResult := APStorage.OpenStream(PWideChar(AStreamName), nil,
    STGM_READWRITE or STGM_SHARE_EXCLUSIVE, 0, ASubStream);
  Result := Succeeded(iResult);
  if (Not Result) and (Not SameText(AStreamName, cst_Table_SjZc)) then
    AppendFiledata(cst_logname, cst_error_ES_0023 + 'SN:'
     + AStreamName + ' EC:' + IntToStr(iResult));
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.LoadFromStream
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  找到指定的存储下面的流对象，通过内存流方式返回相关数据
  参数:      APStorage: IStorage; const AStreamName: WideString;
             AMemoryStream: TMemoryStream
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.LoadFromStream(APStorage: IStorage;
  const AStreamName: WideString; AMemoryStream: TMemoryStream): Boolean;
var
  ASubStream: IStream;
  AOleStream: TOleStream;
begin
  Result := False;
  if not GetStream(APStorage, AStreamName, ASubStream) then
    Exit;
  AOleStream := TOleStream.Create(ASubStream);
  try
    AMemoryStream.Position := 0;
    AMemoryStream.LoadFromStream(AOleStream);
    // UnCompressStream(AMemoryStream);
    Result := True;
  finally
    AOleStream.Free;
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.OpenFile
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  打开复合文档文件
  参数:      无
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.OpenFile: Boolean;
begin
  Result := False;
  if FileExists(FFileName) then
    Result := Succeeded(StgOpenStorage(PWideChar(FFileName), nil,
      STGM_TRANSACTED or STGM_READWRITE
      or STGM_SHARE_EXCLUSIVE, nil, 0, FRootStorage));
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.Revert
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  事务处理过程中的回滚
  参数:      无
  返回值:    无
-------------------------------------------------------------------------------}

procedure TCompoundDocument.Revert;
begin
  if FRootStorage <> nil then
    FRootStorage.Revert;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.SaveToStream
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  将内存流里的数据保存到指定的流对象里
  参数:      APStorage: IStorage; const AStreamName: WideString;
             AMemoryStream: TMemoryStream
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.SaveToStream(APStorage: IStorage; const AStreamName:
    WideString; AMemoryStream: TStream; bInternalMode: Boolean = False):
    Boolean;
const
  Memory_Capacity = 10 * 1024 * 1024;
var
  ASubStream: IStream;
  AOleStream: TOleStream;
  Buffer: Pointer;
  nSize: DWORD;
  nReadSize: DWORD;
begin
  Result := False;
  nReadSize := AMemoryStream.Size;
  if nReadSize = 0 then
  begin
    Result := True;
    Exit;
  end;
  if not CreateStream(APStorage, AStreamName, ASubStream, bInternalMode) then
  begin
    AppendFiledata(cst_logname, cst_error_ES_0014 + 'Create Stream Error!');
    Exit;
  end;
  AOleStream := TOleStream.Create(ASubStream);
  try
    try
      //分段式写入到流
      if nReadSize > Memory_Capacity then
      begin
        GetMem(Buffer, Memory_Capacity);
        try
          AMemoryStream.Seek(0, soBeginning);
          repeat
            nSize := AMemoryStream.Read(Buffer^, Memory_Capacity);
            AOleStream.WriteBuffer(Buffer^, nSize);
          until (nSize < Memory_Capacity);
          Result := True;
        finally
          FreeMem(Buffer);
        end;
      end
      else
      begin
        GetMem(Buffer, nReadSize);
        try
          AMemoryStream.Seek(0, soBeginning);
          nSize := AMemoryStream.Read(Buffer^, nReadSize);
          AOleStream.WriteBuffer(Buffer^, nSize);
          Result := True;
        finally
          FreeMem(Buffer);
        end;
      end;
    except
      on e: Exception do
        AppendFiledata(cst_logname, cst_error_ES_0015 + e.Message);
    end;
  finally
    AOleStream.Free;
  end;
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.StorageIsExist
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  判断指定的名称的存储是否存在
  参数:      APStorage: IStorage; const AStorageName: WideString
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.StorageIsExist(APStorage: IStorage;
  const AStorageName: WideString): Boolean;
var
  AStorage: IStorage;
begin
  Result := GetStorage(APStorage, AStorageName, AStorage);
end;

{-------------------------------------------------------------------------------
  过程名:    TCompoundDocument.StreamIsExist
  作者:      Wenxh
  日期:      2010.05.27
  功能描述:  判断指定名称的流对象是否存在
  参数:      APStorage: IStorage; const AStreamName: WideString
  返回值:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.StreamIsExist(APStorage: IStorage;
  const AStreamName: WideString): Boolean;
var
  AStream: IStream;
begin
  Result := GetStream(APStorage, AStreamName, AStream);
end;

end.

