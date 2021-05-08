{******************************************************}
{ ��Ʒ���ƣ�PMSS5.0                                    }
{ ��Ԫ�����������븴���ĵ����н���                     }
{ ��Ԫ���ߣ�Wenxh                                      }
{ ����ʱ�䣺2010.05.24                                 }
{ ��    ע��                                           }
{ �޸ļ�¼��                                           }
// 2015-11-27 Wenxh ���ӣ������ڲ�����ģʽ
{******************************************************}

unit uCompoundDocument;

interface

uses
  Windows, Classes, SysUtils, ActiveX, AxCtrls, uCompoundDocumentIntf;

type
{******************************************************}
{ ���������������ĵ����������                         }
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
  ������:    TCompoundDocument.CloseDocument
  ����:      Wenxh
  ����:      2010.05.24
  ��������:  �رո����ĵ�����
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TCompoundDocument.CloseDocument;
begin
//  Revert;
  FRootStorage := nil;
end;

{-------------------------------------------------------------------------------
  ������:    TCompoundDocument.Commit
  ����:      Wenxh
  ����:      2010.05.24
  ��������:  �����е��ύ����
  ����:      ��
  ����ֵ:    ��
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
  ������:    TCompoundDocument.CreateFile
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ����һ�������ĵ��ļ�
  ����:      ��
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.CreateStorage
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ����һ���洢
  ����:      APStorage: IStorage; const AStorageName: WideString;
             var ASubStorage: IStorage
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.CreateStream
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ����һ��������
  ����:      APStorage: IStorage; const AStreamName: WideString;
             var ASubStream: IStream
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.DeleteStorage
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ɾ��һ���洢����
  ����:      APStorage: IStorage; const AStorageName: WideString
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.DeleteStream
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ɾ��һ��������
  ����:      APStorage: IStorage; const AStreamName: WideString
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.GetFileName
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ��ȡ��ǰ�����ĵ��ļ���
  ����:      ��
  ����ֵ:    WideString
-------------------------------------------------------------------------------}

function TCompoundDocument.GetFileName: WideString;
begin
  Result := FFileName;
end;

{-------------------------------------------------------------------------------
  ������:    TCompoundDocument.GetResList
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ��ȡָ���洢�µ��������б���Դ�б�
  ����:      AStorage: IStorage; AResList: TStringList
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.GetRootStorage
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ���ظ��洢
  ����:      ��
  ����ֵ:    IStorage
-------------------------------------------------------------------------------}

function TCompoundDocument.GetRootStorage: IStorage;
begin
  Result := FRootStorage;
end;

{-------------------------------------------------------------------------------
  ������:    TCompoundDocument.GetStorage
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ��һ���洢��ͨ��ָ���Ĵ洢����ȡ�洢
  ����:      APStorage: IStorage; const AStorageName: WideString;
             var ASubStorage: IStorage
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.GetStorage(APStorage: IStorage;
  const AStorageName: WideString; var ASubStorage: IStorage): Boolean;
begin
  Result := Succeeded(APStorage.OpenStorage(PWideChar(AStorageName), nil,
    STGM_READWRITE or STGM_SHARE_EXCLUSIVE, nil, 0, ASubStorage));
end;

{-------------------------------------------------------------------------------
  ������:    TCompoundDocument.GetStream
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ��һ���洢��ͨ��ָ�����������ҵ���Ӧ��������
  ����:      APStorage: IStorage; const AStreamName: WideString;
             var ASubStream: IStream
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.LoadFromStream
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  �ҵ�ָ���Ĵ洢�����������ͨ���ڴ�����ʽ�����������
  ����:      APStorage: IStorage; const AStreamName: WideString;
             AMemoryStream: TMemoryStream
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.OpenFile
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  �򿪸����ĵ��ļ�
  ����:      ��
  ����ֵ:    Boolean
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
  ������:    TCompoundDocument.Revert
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ����������еĻع�
  ����:      ��
  ����ֵ:    ��
-------------------------------------------------------------------------------}

procedure TCompoundDocument.Revert;
begin
  if FRootStorage <> nil then
    FRootStorage.Revert;
end;

{-------------------------------------------------------------------------------
  ������:    TCompoundDocument.SaveToStream
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  ���ڴ���������ݱ��浽ָ������������
  ����:      APStorage: IStorage; const AStreamName: WideString;
             AMemoryStream: TMemoryStream
  ����ֵ:    Boolean
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
      //�ֶ�ʽд�뵽��
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
  ������:    TCompoundDocument.StorageIsExist
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  �ж�ָ�������ƵĴ洢�Ƿ����
  ����:      APStorage: IStorage; const AStorageName: WideString
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.StorageIsExist(APStorage: IStorage;
  const AStorageName: WideString): Boolean;
var
  AStorage: IStorage;
begin
  Result := GetStorage(APStorage, AStorageName, AStorage);
end;

{-------------------------------------------------------------------------------
  ������:    TCompoundDocument.StreamIsExist
  ����:      Wenxh
  ����:      2010.05.27
  ��������:  �ж�ָ�����Ƶ��������Ƿ����
  ����:      APStorage: IStorage; const AStreamName: WideString
  ����ֵ:    Boolean
-------------------------------------------------------------------------------}

function TCompoundDocument.StreamIsExist(APStorage: IStorage;
  const AStreamName: WideString): Boolean;
var
  AStream: IStream;
begin
  Result := GetStream(APStorage, AStreamName, AStream);
end;

end.

