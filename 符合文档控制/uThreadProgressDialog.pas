{ ****************************************************** }
{ 产品名称：PMSS5.0 }
{ 单元描述：线程进度条 }
{ 单元作者：sdd }
{ 创建时间： }
{ 备    注： }
{ 修改记录： }
// 2013.07.11 sdd: 添加Tag属性,不在任务栏显示,修正闪烁的问题
// 2013.07.15 sdd: 修改父窗口为nil时窗口不在任务栏显示的实现
{ ****************************************************** }
unit uThreadProgressDialog;

interface

uses
  Windows, SysUtils, Messages, CommCtrl, Graphics, Forms, Controls, Math, Imm;

const
  PBM_SETMARQUEE = WM_USER + 10;
  TM_RELEASE = WM_USER + 100;
  TM_HIDE = WM_USER + 101;
  TM_SHOW = WM_USER + 102;

type
  // 正常，无进度
  TProgressType = (pbNormal, pbMarquee);

  TThreadProgress = class
  private
    FPBHwnd: THandle;
    FStaticHwnd: THandle;
    FTitleHwnd: THandle;
    FPercentHwnd: THandle;
    FHwnd: THandle;
    FHwndCreate: THandle;
    FOwner: THandle;

    FTextFont: HFONT;
    FTitleFont: HFONT;
    FBrush: HBRUSH;

    FVisible: Boolean;
    FCaption: string;
    FWndProcJumper: Pointer;
    FWindowList: Pointer;
    FWidth: Integer;
    FTop: Integer;
    FHeight: Integer;
    FLeft: Integer;
    FText: string;
    FProgMultiplier: Integer;

    FFormCreated: Boolean;
    FPosition: DWORD;
    FProgressType: TProgressType;
    FMax: DWORD;
    FMin: DWORD;
    FPercent: Integer;
    FTitle: string;
    FThreadID: DWORD;
    FOnKeyDownEvent: TKeyEvent;
    FTag: Integer;
    procedure WaitForWndCreation;
    procedure SetOnKeyDownEvent(const Value: TKeyEvent);
  protected
    function WndProc(hwnd: THandle; message: UINT; WPARAM: WPARAM; LPARAM: LPARAM): LRESULT; stdcall;

    procedure SetCaption(value: string);
    procedure SetLeft(value: Integer);
    procedure SetTop(value: Integer);
    procedure SetWidth(value: Integer);
    procedure SetHeight(value: Integer);
    procedure SetText(value: string);
    procedure SetTitle(value: string);
    procedure SetProgMax(value: DWORD);
    procedure SetProgMin(value: DWORD);
    procedure SetProgPos(value: DWORD);
    procedure SetProgType(value: TProgressType);
    procedure UpdateProgPercent;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure ProgressStepIt;
    procedure SetFocus;
    procedure BringToFront;
    procedure Hide;
    procedure Show;
    property Caption: string read FCaption write SetCaption;
    property Left: Integer read FLeft write SetLeft;
    property Top: Integer read FTop write SetTop;
    property Width: Integer read FWidth write SetWidth;
    property Height: Integer read FHeight write SetHeight;
    property Text: string read FText write SetText;
    property Title: string read FTitle write SetTitle;
    property ProgressMax: DWORD read FMax write SetProgMax;
    property ProgressMin: DWORD read FMin write SetProgMin;
    property ProgressPos: DWORD read FPosition write SetProgPos;
    property ProgressType: TProgressType read FProgressType write SetProgType;
    property OnKeyDown: TKeyEvent read FOnKeyDownEvent write SetOnKeyDownEvent;
    property Tag: Integer read FTag write FTag;
  end;

  TCreateWindowInfo = packed record
    Caption, Title, Text: PChar;
    Owner: THandle;
    Left, Top, Width, Height: Integer;
    ProgressType: TProgressType;
    ProgressMax: Integer;
  end;

  PCreateWindowInfo = ^TCreateWindowInfo;

{$REGION '进度条函数入口定义'}
  /// <summary>
  /// 创建进度条
  /// </summary>
  /// <param name="Sender"></param>
  /// <param name="Caption">标题</param>
  /// <param name="Title">主提示内容(如：正在打印...)</param>
  /// <param name="Text">副提示内容(第N页)</param>
  /// <param name="ProgressType">类型</param>
  /// <param name="ProgressMax">条最大值</param>
  /// <returns></returns>
function CreateThreadedProgressDlg(Sender: TWinControl; Caption, Title, Text:
  string; ProgressType: TProgressType = pbMarquee; ProgressMax: Integer = 0):
  TThreadProgress; overload;
function CreateThreadedProgressDlg(var CWInfo: TCreateWindowInfo): TThreadProgress; overload;
{$ENDREGION}


var
  SwitchToThisWindow: procedure(hwnd: THandle; fAltTab: BOOL); stdcall;

implementation

function ImmDisableIme(idThread: DWORD): BOOL; stdcall; external 'imm32.dll' name 'ImmDisableIME';

function ForceForegroundWindow(hwnd: THandle): Boolean;
var
  timeout: DWORD;
begin
  if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
    ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
    ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and (Win32MinorVersion > 0)))) then
  begin
    SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
    SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0), SPIF_SENDCHANGE);
    Result := SetForegroundWindow(hwnd);
    SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout), SPIF_SENDCHANGE);
  end
  else
    Result := SetForegroundWindow(hwnd);
end;

/// <summary>
/// This wndProc is only used when window is created, we will change wndproc to a dynamic one later.
/// </summary>

function WndProcInital(hwnd: THandle; message: UINT; WPARAM: WPARAM; LPARAM: LPARAM): LRESULT; stdcall;
begin
  case message of
    WM_CREATE:
      Result := TThreadProgress(PCreateStruct(LPARAM).lpCreateParams).WndProc(hwnd, message, WPARAM, LPARAM);
    WM_IME_SETCONTEXT:
      Result := DefWindowProc(hwnd, message, 0, 0);
  else
    Result := DefWindowProc(hwnd, message, WPARAM, LPARAM);
  end;
end;

/// <summary>
/// this function create a memory wndproc jumper which convert the message proc to a class proc
/// </summary>

function GetWndProcJumper(InstanceObj: TThreadProgress): Pointer;
const
  Jumper: array [1 .. 30] of Byte = (
    $55, // push ebp
    $8B, $EC, // mov ebp, esp
    $FF, $75, $14, // push    dword ptr [ebp+8]
    $FF, $75, $10, // push    dword ptr [ebp+C]
    $FF, $75, $0C, // push    dword ptr [ebp+10]
    $FF, $75, $08, // push    dword ptr [ebp+14]
    $68, $99, $99, $99, $99, // push    99999999
    $FF, $15, $88, $88, $88, $88, // call    dword ptr [88888888]
    $5D, // pop ebp
    $C2, $10, $00 // retn 10
    );
type
  TObjWndProc = function(hwnd: THandle; message: UINT; WPARAM: WPARAM; LPARAM: LPARAM): LRESULT of object; stdcall;

  TJumperRec = packed record
    JumperCode: array [1 .. 30] of Byte;
    InstanceObj: TThreadProgress;
    ObjWndproc: TObjWndProc;
  end;

  PJumperRec = ^TJumperRec;
var
  I: Integer;
  nOldProtect: DWORD;
begin
  Result := GetMemory(100); // allocate enough memory for jumper
  VirtualProtect(Result, 100, PAGE_EXECUTE_READWRITE, @nOldProtect); // set protection
  CopyMemory(@PJumperRec(Result).JumperCode, @Jumper, SizeOf(Jumper)); // copy assembler
  PJumperRec(Result).InstanceObj := InstanceObj; // the instanceobject
  PJumperRec(Result).ObjWndproc := InstanceObj.WndProc; // the proc of object
  for I := 0 to SizeOf(TJumperRec) - 1 do
    case PDWORD(PChar(Result) + I)^ of
      $99999999:
        PInteger(PChar(Result) + I)^ := Integer(PJumperRec(Result).InstanceObj);
      $88888888:
        PInteger(PChar(Result) + I)^ := Integer(@@PJumperRec(Result).ObjWndproc);
    end;
end;

procedure FreeWndProcJumper(WndProcJumper: Pointer);
begin
  FreeMemory(WndProcJumper);
end;

procedure ThreadedCreateForm(aThreadedFormObj: TThreadProgress);
var
  wndclass: TWndClass;
  msg: TMsg;
  ret: Integer;
  pid: DWORD;
begin
  ImmDisableIme(0);
  FillChar(wndclass, SizeOf(wndclass), 0);
  with aThreadedFormObj do
  begin
    with wndclass do
    begin
      style := CS_HREDRAW or CS_VREDRAW;
      lpfnWndProc := @WndProcInital;
      cbClsExtra := 0;
      cbWndExtra := 0;
      wndclass.hInstance := 0; // sysinit.hInstance;
      HICON := LoadIcon(0, IDI_APPLICATION);
      HCURSOR := LoadCursor(0, IDC_ARROW);
      hbrBackground := HBRUSH(GetStockObject(WHITE_BRUSH));
      lpszMenuName := nil;
      lpszClassName := 'ThreadedProgressDlg';
    end;
    RegisterClass(wndclass); // 注册类名，如果重复了也没关系
    FHwnd := CreateWindowEx(IfThen(FOwner = 0, WS_EX_NOACTIVATE or WS_EX_NOPARENTNOTIFY or WS_EX_TOOLWINDOW,
      WS_EX_NOACTIVATE or WS_EX_NOPARENTNOTIFY),
      'ThreadedProgressDlg', // 创建窗口，窗口类名
      PChar(Caption), // 窗口实例的标题名
      WS_VISIBLE and (not WS_SYSMENU or WS_MAXIMIZEBOX or WS_MINIMIZEBOX or WS_BORDER) or WS_POPUP, //or WS_DLGFRAME,
      // 窗口的风格
      Left, Top, // 窗口左上角坐标为缺省值
      Width, Height, // 窗口的高度和宽度为缺省值
      0, // 此窗口无父窗口
      0, // 此窗口无主菜单
      0, // 应用程序当前句柄
      Pointer(aThreadedFormObj));
    if FHwnd <> 0 then
      FFormCreated := True;

    FWndProcJumper := GetWndProcJumper(aThreadedFormObj);
    SetWindowLong(FHwnd, GWL_WNDPROC, Integer(aThreadedFormObj.FWndProcJumper));
    if FOwner <> 0 then
      SetWindowLong(FHwnd, GWL_HWNDPARENT, FOwner)
    else
      if (Application.MainForm.Handle <> Application.Handle) then
      SetWindowLong(FHwnd, GWL_HWNDPARENT, Application.Handle)
    else
      SetWindowPos(FHwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or SWP_NOACTIVATE);
    { begin
      FOwner := GetWindow(Application.MainForm.Handle, GW_HWNDFIRST);
      GetWindowThreadProcessId(FOwner, pid);
      while ((pid <> GetCurrentProcessId) or (not IsWindowVisible(FOwner)) or (FOwner = FHwnd)) and (FOwner <> 0) do
      begin
      FOwner := GetWindow(FOwner, GW_HWNDNEXT);
      GetWindowThreadProcessId(FOwner, pid);
      end;
      if (FOwner<>0) then
      SetWindowLong(FHwnd, GWL_HWNDPARENT, FOwner)
      else
      FOwner := 0;
      end; }
    SendMessage(FHwnd, TM_SHOW, 0, 0);
    UpdateWindow(FHwnd); // 绘制用户区
    SetEvent(FHwndCreate); // 通知外部已经创建完毕

    ret := Integer(GetMessage(msg, 0, 0, 0));
    while (Integer(ret) <> 0) do // 消息循环
    begin
      if ret = -1 then
        Exit;
      TranslateMessage(msg);
      DispatchMessage(msg);
      ret := Integer(GetMessage(msg, 0, 0, 0));
    end;
  end;
end;

{ TThreadProgress }

procedure TThreadProgress.BringToFront;
var
  bIsTopMost: Boolean;
begin
  if FFormCreated then
  { if @SwitchToThisWindow <> nil then
    SwitchToThisWindow(FHwnd, False)     //use undocumented API to switch window
    else }
  begin
    bIsTopMost := (GetWindowLong(FHwnd, GWL_EXSTYLE) and WS_EX_TOPMOST)<>0;
    SetWindowPos(FHwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE); // or set TOPMOST to force switch
    SetWindowPos(FHwnd, HWND_TOP, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    if not bIsTopMost then
      SetWindowPos(FHwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetForegroundWindow(FHwnd);
  end;
end;

constructor TThreadProgress.Create;
begin
  FHwndCreate := CreateEvent(nil, True, False, nil);
  // initializing position
  FHwnd := 0;
  FPBHwnd := 0;
  FWidth := 325;
  FHeight := 68;
  FVisible := True;
  FProgMultiplier := 1;
  FLeft := (GetSystemMetrics(SM_CXSCREEN) - FWidth) div 2;
  FTop := (GetSystemMetrics(SM_CYSCREEN) - FHeight) div 2;

  FFormCreated := False;

  // initializing GDI resources
  FTextFont := CreateFont(-12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SimSun');
  FTitleFont := CreateFont(-12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SimSun');
end;

destructor TThreadProgress.Destroy;
begin
  if FFormCreated then
  begin
    Hide;
    SendMessage(FHwnd, TM_RELEASE, 0, 0);
  end;
  // Sleep(10000);
  FreeWndProcJumper(FWndProcJumper);
  CloseHandle(FHwndCreate);
  DeleteObject(FTextFont);
  DeleteObject(FTitleFont);
//  DeleteObject(FBrush);
  if (FOwner <> 0) and IsWindow(FOwner) and IsWindowVisible(FOwner) then
    ForceForegroundWindow(FOwner)
  else
    ForceForegroundWindow(Application.MainForm.Handle);
  inherited;
end;

procedure TThreadProgress.Hide;
begin
  if FWindowList <> nil then
  begin
    EnableTaskWindows(FWindowList);
    FWindowList := nil;
  end;
  if FVisible then
  begin
    FVisible := False;
    SendMessage(FHwnd, TM_HIDE, 0, 0);
  end;
end;

procedure TThreadProgress.ProgressStepIt;
begin
  if FPosition < FMax then
    SetProgPos(FPosition + 1);
end;

procedure TThreadProgress.SetCaption(value: string);
begin
  FCaption := value;
end;

procedure TThreadProgress.SetFocus;
begin
  if FFormCreated then
  begin
    Windows.SetFocus(FHwnd);
  end;
end;

procedure TThreadProgress.SetHeight(value: Integer);
begin

end;

procedure TThreadProgress.SetLeft(value: Integer);
begin

end;

procedure TThreadProgress.SetOnKeyDownEvent(const Value: TKeyEvent);
begin
  FOnKeyDownEvent := Value;
  if @Value<>nil then
  begin
    SetWindowLong(FHwnd, GWL_HWNDPARENT, 0);
    SetWindowPos(FHwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
  end;
end;

procedure TThreadProgress.SetProgMax(value: DWORD);
begin
  if FFormCreated then
    if (value <> FMax) then
    begin
      if (value < 100) and (value > 0) then
        FProgMultiplier := Ceil(100 / value)
      else
        FProgMultiplier := 1;
      FMax := value;
      SendMessage(FPBHwnd, PBM_SETRANGE, 0, MakeLParam(FMin * FProgMultiplier, FMax * FProgMultiplier));
      UpdateProgPercent;
    end;
end;

procedure TThreadProgress.SetProgMin(value: DWORD);
begin
  if FFormCreated then
    if (value <> FMin) then
    begin
      FMin := value;
      SendMessage(FPBHwnd, PBM_SETRANGE, 0, MakeLParam(FMin * FProgMultiplier, FMax * FProgMultiplier));
      UpdateProgPercent;
    end;
end;

procedure TThreadProgress.UpdateProgPercent();
var
  Percent: Integer;
begin
  // set progress percent display.
  // We calculate percent here and hide percent display for pbMarquee style
  if FFormCreated then
    if (FProgressType = pbMarquee) or (FMax = 0) and (FPercent <> -1) then
    begin
      SendMessage(FPercentHwnd, WM_SETTEXT, 0, 0);
      FPercent := -1;
    end
    else
    begin
      if FMax <= FMin then
        Percent := 100
      else
        Percent := Round(Max(0, (FPosition - FMin)) / (FMax - FMin) * 100);
      if FPercent <> Percent then
        SendMessage(FPercentHwnd, WM_SETTEXT, 0,
          Integer(PChar(Format('%d%%', [Percent]))));
      FPercent := Percent;
    end;
end;

procedure TThreadProgress.SetProgPos(value: DWORD);
begin
  if FFormCreated then
    if (FProgressType = pbNormal) and (FPosition <> value) and (FPosition < FMax) then
    begin
      FPosition := value;
      SendMessage(FPBHwnd, PBM_SETPOS, value * FProgMultiplier, 0);
      UpdateProgPercent;
    end;
end;

procedure TThreadProgress.SetProgType(value: TProgressType);
begin
  if FFormCreated then
    if FProgressType <> value then
    begin
      FProgressType := value;
      case value of
        pbNormal:
          begin
            SetWindowLong(FPBHwnd, GWL_STYLE, GetWindowLong(FPBHwnd, GWL_STYLE) and (not 08));
            SendMessage(FPBHwnd, PBM_SETMARQUEE, 0, 0);
            UpdateProgPercent;
          end;
        pbMarquee:
          begin
            SetWindowLong(FPBHwnd, GWL_STYLE, GetWindowLong(FPBHwnd, GWL_STYLE) or 08);
            SendMessage(FPBHwnd, PBM_SETMARQUEE, 1, 0);
            UpdateProgPercent;
          end;
      end;
    end;
end;

procedure TThreadProgress.SetText(value: string);
begin
  FText := value;
  if FFormCreated then
    SendMessage(FStaticHwnd, WM_SETTEXT, 0, Integer(PChar(value)));
end;

procedure TThreadProgress.SetTitle(value: string);
begin
  FTitle := value;
  if FFormCreated then
    SendMessage(FTitleHwnd, WM_SETTEXT, 0, Integer(PChar(value)));
end;

procedure TThreadProgress.SetTop(value: Integer);
begin

end;

procedure TThreadProgress.SetWidth(value: Integer);
begin

end;

procedure TThreadProgress.Show;
begin
  if not FVisible then
  begin
    FVisible := True;
    SendMessage(FHwnd, TM_SHOW, 0, 0);
  end;
  if FWindowList = nil then
    FWindowList := DisableTaskWindows(FHwnd);
end;

procedure TThreadProgress.WaitForWndCreation;
begin
  WaitForSingleObject(FHwndCreate, INFINITE);
end;

function TThreadProgress.WndProc(hwnd: THandle; message: UINT; WPARAM: WPARAM;
  LPARAM: LPARAM): LRESULT;
var
  key: Word;
  icc: TInitCommonControlsEx;
begin
  Result := 0;
  case message of
    WM_CREATE:
      begin
        icc.dwSize := SizeOf(icc);
        icc.dwICC := ICC_PROGRESS_CLASS;
        InitCommonControlsEx(icc);
        icc.dwICC := ICC_ANIMATE_CLASS;
        InitCommonControlsEx(icc);
        icc.dwICC := ICC_STANDARD_CLASSES;
        InitCommonControlsEx(icc);
        FPBHwnd := CreateWindowEx(
          0,
          PROGRESS_CLASS,
          nil,
          WS_CHILD or WS_VISIBLE,
          8, 38, 304, 17, // 位置和大小在WM_SIZE中设置
          hwnd,
          0,
          PCreateStruct(LPARAM).hInstance,
          nil);

        FStaticHwnd := CreateWindowEx(0, 'STATIC', PChar(FText),
          WS_CHILD or WS_VISIBLE,
          8, 21, 270, 13, hwnd, 0, 0, nil);
        FTitleHwnd := CreateWindowEx(0, 'STATIC', PChar(FTitle),
          WS_CHILD or WS_VISIBLE,
          8, 4, 300, 13, hwnd, 0, 0, nil);
        FPercentHwnd := CreateWindowEx(0, 'STATIC', '',
          WS_CHILD or WS_VISIBLE or SS_RIGHT,
          272, 21, 40, 13, hwnd, 0, 0, nil);

        PostMessage(FStaticHwnd, WM_SETFONT, FTextFont, 1); // 设置文本字体
        PostMessage(FTitleHwnd, WM_SETFONT, FTitleFont, 1); // 设置文本字体
        PostMessage(FPercentHwnd, WM_SETFONT, FTitleFont, 1); // 设置文本字体
        PostMessage(FTitleHwnd,WM_CTLCOLORSTATIC,GetDC(FTitleHwnd),0); //设置字体背景色
        PostMessage(FStaticHwnd,WM_CTLCOLORSTATIC,GetDC(FStaticHwnd),0);
        Result := 0;
      end;
    TM_RELEASE:
      DestroyWindow(FHwnd);
    TM_HIDE:
      begin
        ShowWindow(FHwnd, SW_HIDE);
      end;
    TM_SHOW:
      begin
        ShowWindow(FHwnd, SW_SHOW);
      end;
    WM_DESTROY: // destroy window
      begin
        PostThreadMessage(GetCurrentThreadId, WM_QUIT, 0, 0);
        FFormCreated := False;
      end;
    WM_SHOWWINDOW:
      begin
        if (LPARAM = SW_PARENTCLOSING) and (FOwner <> 0) and (not IsWindow(FOwner)) then
          Result := 0
        else
          Result := DefWindowProc(hwnd, message, WPARAM, LPARAM);
      end;
    WM_CTLCOLORSTATIC:
      begin
      //  SetBkMode(HDC(WPARAM),TRANSPARENT);
      // SetTextColor(HDC(WPARAM),RGB(59,59,59));
        Result := HBRUSH(GetStockObject(WHITE_BRUSH));
      end;
    WM_LBUTTONDOWN:
      begin
        ForceForegroundWindow(FHwnd);
        SetFocus;
      end;
    WM_CLOSE:
      begin
        Result := 0; // DefWindowProc(hwnd, message, WPARAM, LPARAM);
      end;
    WM_KEYDOWN:
      begin
        key := WPARAM;
        if Assigned(FOnKeyDownEvent) and ((LPARAM and (1 shl 30)) = 0) then // key never pressed
          FOnKeyDownEvent(Self, key, []);
      end
  else
    begin
      Result := DefWindowProc(hwnd, message, WPARAM, LPARAM);
    end;
  end;
end;

function CreateThreadedProgressDlg(var CWInfo: TCreateWindowInfo): TThreadProgress; overload;
var
  tid: DWORD;
  AHandle: Cardinal;
begin
  Result := TThreadProgress.Create;
  Result.Caption := CWInfo.Caption;
  Result.FOwner := CWInfo.Owner;
  { Result.Left:=cwinfo.Left;
    Result.Top:=cwinfo.Top;
    Result.Width:=cwinfo.Width;
    result.Height:=cwinfo.Height; }
  AHandle := BeginThread(nil, 0, @ThreadedCreateForm, Result, 0, Result.FThreadID);
  Result.WaitForWndCreation;
  CloseHandle(AHandle);
  Result.Show;
  with Result do
  begin
    ProgressType := CWInfo.ProgressType;
    ProgressMax := CWInfo.ProgressMax;
    Title := CWInfo.Title;
    Text := CWInfo.Text;
  end;
end;

function CreateThreadedProgressDlg(Sender: TWinControl; Caption, Title, Text:
  string; ProgressType: TProgressType = pbMarquee; ProgressMax: Integer = 0):
  TThreadProgress; overload;
var
  CWInfo: TCreateWindowInfo;
begin
  if Sender <> nil then
    CWInfo.Owner := Sender.Handle
  else
    CWInfo.Owner := 0;
  CWInfo.Caption := PChar(Caption);
  CWInfo.ProgressType := ProgressType;
  CWInfo.ProgressMax := ProgressMax;
  CWInfo.Title := PChar(Title);
  CWInfo.Text := PChar(Text);
  Result := CreateThreadedProgressDlg(CWInfo);
end;

initialization

SwitchToThisWindow := GetProcAddress(LoadLibrary('User32.dll'), 'SwitchToThisWindow');

finalization

end.
