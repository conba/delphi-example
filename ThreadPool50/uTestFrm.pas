unit uTestFrm;

{
  The sample of using TPoolOfThreads.
  uses memo.lines as a source of request and
  MessageBox procedure as processing
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ThreadPool, StdCtrls, ExtCtrls;

const
  WM_U_EMPTY = WM_USER + 1;

type
  TForm1 = class(TForm)
    PoolOfThreads1: TPoolOfThreads;
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PoolOfThreads1ProcessRequest(Sender: TPoolOfThreads;
      aDataObj: TThreadPoolDataObject; aThread: TThreadInPool);
    procedure PoolOfThreads1QueueEmpty(Sender: TPoolOfThreads;
      EmptyKind: TEmptyKind);
  private
    { Private declarations }
    procedure PoolEmpty(var Msg: TMessage); message WM_U_EMPTY;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  FileCtrl;

{$R *.DFM}
type
  TMyDO = class (TThreadPoolDataObject)
    Str: string;
    constructor Create(const s: string);
    function TextForLog: string; override;
  end;


{ TMyDO }

constructor TMyDO.Create(const s: string);
begin
  Str := s;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  s: string;
  i: Integer;
begin
  for i := 0 to Memo1.Lines.Count-1 do
  begin
    s := Trim(Memo1.Lines[i]);
    if s<>'' then
      PoolOfThreads1.AddRequest(TMyDO.Create(s));
  end;
end;

var
  CurFileHandle: THandle;
  FileOpenDay: Integer;
  csLog: TRTLCriticalSection;

procedure LogMessage(const Str: string; LogID: Integer; Level: Integer);
var
  Msg: string;
  Buf: array[0..MAX_PATH] of Char;
  CurFileName: string;
  CurDay: integer;
  n: Cardinal;
const
  sMsgLevelMarkers: array[0..10] of string =
  ('', '', 't:', 'i:', 'I:', 'w:', 'W:',
   'e:', 'E:', 'Error:', '!!! Fatal error !!!: ');
begin
  if Level<1 then
    Exit;
  LogID := GetCurrentThreadId;
  
  EnterCriticalSection(csLog);
  try
    CurDay := trunc(Date);
    if CurDay>FileOpenDay then // It's a time to switch to other log file
    begin
      if CurFileHandle<>INVALID_HANDLE_VALUE then
        CloseHandle(CurFileHandle);

      GetModuleFileName(HInstance, Buf, SizeOf(Buf));

      CurFileName := ExtractFilePath(Buf)+'Logs\' +ExtractFileName(Buf)+FormatDateTime('YYYY_MM_DD',Date)+'.log';
      ForceDirectories(ExtractFilePath(CurFileName));

      CurFileHandle := CreateFile(
        PChar(CurFileName),
        GENERIC_WRITE,
        FILE_SHARE_READ,
        nil,
        OPEN_ALWAYS,
        FILE_FLAG_WRITE_THROUGH or FILE_FLAG_SEQUENTIAL_SCAN,
        0
      );

      if CurFileHandle<>INVALID_HANDLE_VALUE then
        SetFilePointer(CurFileHandle, 0, nil, FILE_END);
      FileOpenDay := CurDay;
    end;

    if CurFileHandle = INVALID_HANDLE_VALUE then
      Exit;

  finally
    LeaveCriticalSection(csLog);
  end;

  Msg := Format('(%5d) ', [LogID])+FormatDateTime('HH:NN:SS: ',Now)+sMsgLevelMarkers[Level]+Str+#13#10;
  WriteFile(CurFileHandle, Msg[1],Length(Msg),n,nil);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ThreadPool.WriteLog := LogMessage;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  CloseHandle(CurFileHandle);
end;

function TMyDO.TextForLog: string;
begin
  Result := 'Request: "'+Str+'"';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  s : string;
begin
  s := PoolOfThreads1.InfoText;
  if s<>Memo2.Lines.Text then
    Memo2.Lines.Text := s;
end;

procedure TForm1.PoolOfThreads1ProcessRequest(Sender: TPoolOfThreads;
  aDataObj: TThreadPoolDataObject; aThread: TThreadInPool);
begin
  MessageBox(0, PChar((aDataObj as TMyDO).Str), PChar(Format('ThreadID=%d', [GetCurrentThreadId])),0);
end;

procedure TForm1.PoolOfThreads1QueueEmpty(Sender: TPoolOfThreads;
  EmptyKind: TEmptyKind);
begin
  PostMessage(Handle, WM_U_EMPTY, ord(EmptyKind), Integer(Sender));
end;

procedure TForm1.PoolEmpty(var Msg: TMessage);
begin
  case TEmptyKind(Msg.wParam) of
    ekQueueEmpty:
      ShowMessage('ThreadPoolEvent: The queue is empty');
    ekProcessingFinished:
      ShowMessage('ThreadPoolEvent: Processing finished');
  end;
end;

initialization
  InitializeCriticalSection(csLog);
finalization
  DeleteCriticalSection(csLog);
end.
