unit uDataManagerUtils;

interface

uses
  Windows, Classes, SysUtils, ActiveX, Forms, uSysUtils;

//把字符串通过分隔符分隔到列表里
procedure StringToStringList(Source: string; aList: TStrings; ASeparator: string);
procedure Warn(aHandle: HWND; ahintStr: string);
function GetGUIDstr: string;
//临时目录
function GetSysTempPath: string;
function _GetSysTempPath: string;

function IsFileInUse(fName: string): boolean;
function CheckFileInUse(FileName: string): Boolean;
function IsLocalDisk(Drive: string): Boolean;


implementation

function IsLocalDisk(Drive: string): Boolean;
begin
  Result := GetDriveType(PWideChar(Drive)) = DRIVE_FIXED;
end;


function CheckFileInUse(FileName: string): Boolean;
var
  iSum: Integer;
begin
  Result := True;
  iSum := 1;
  while iSum <= 10 do
  begin
    Result := IsFileInUse(FileName);
    if Not Result then
      Break;
    Sleep(1000);
    Inc(iSum);
  end;
end;

function IsFileInUse(fName: string): boolean;
var
  HFileRes: HFILE;
begin
  Result := False;
  if not FileExists(fName) then
    exit;
  HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE, 0, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;


function GetSysTempPath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
  Result := Result + 'Temp\';
  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function _GetSysTempPath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
  Result := Result + 'Temp1\';
  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;


function GetGUIDstr: string;
var
  TmpGUID: TGUID;
begin
  Result := '';
  if CoCreateGuid(TmpGUID) = S_OK then
    Result := GUIDToString(TmpGUID);
end;

procedure Warn(aHandle: HWND; ahintStr: string);
begin
  if (aHandle = 0) and (application <> nil) then
    aHandle := Application.Handle;
  uSysUtils.Warn(aHandle, ahintStr);
end;


//把字符串通过分隔符分隔到列表里

procedure StringToStringList(Source: string; aList: TStrings; ASeparator: string);
var
  temp: string;
  i: integer;
begin
  temp := source;
  i := pos(ASeparator, source);
  while i <> 0 do
  begin
    aList.Add(copy(temp, 0, i - 1));
    delete(temp, 1, i);
    i := pos(ASeparator, temp);
  end;
  aList.Add(temp);
end;

end.

