program wb;
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFDEF CPUX64}
{$R 'manifest_AMD64.res' 'manifest_AMD64.rc'}
{$ELSE}
{$R 'manifest.res' 'manifest.rc'}
{$ENDIF}
uses
  Windows,
  Messages,
  MicroWebBrowser in 'MicroWebBrowser.pas';

const
  WBName = 'Delphi小小浏览器';
var
  gWb: TMicroWebBrowser;
  MainHwnd, hUrlText, hButton: HWND;
  txtProc, BtnProc: Pointer;

procedure NavigateTxtUrl();
var
  tmpStr: string;
  l: Integer;
  hr : HRESULT;
begin
  l := GetWindowTextLength(hUrlText) + 10;
  SetLength(tmpStr, l);
  GetWindowText(hUrlText, PChar(tmpStr), l);
  tmpStr := PChar(tmpStr);
  gWb.Navigate(tmpStr);
  hr := gWb.WaitComplete(5000);
  if (hr = S_OK)or (hr = ERROR_TIMEOUT) then
  begin
    tmpStr := gWb.WebBrowser.Get_LocationURL();
    SetWindowText(hUrlText, PChar(tmpStr));
    tmpStr := WBName +' - '+ gWb.WebBrowser.Get_LocationName;
    SetWindowText(MainHwnd, PChar(tmpStr));
  end
  else
  begin
    tmpStr := WBName;
    SetWindowText(MainHwnd, PChar(tmpStr));
  end;
end;

// 窗口过程
function WndProc(HWND: THandle; Message: Longint; wParam: wParam;
  lParam: lParam): LRESULT; stdcall;
const
  BlankUrl = 'about:blank';
  UrlTextHeight = 30;
  ButtonWidth = 50;
  procedure ReLayout(const Width, Height: WORD);
  begin
    SetWindowPos(hUrlText, HWND_TOP, 0, 0, Width - ButtonWidth,
      UrlTextHeight, 0);
    SetWindowPos(hButton, HWND_TOP, Width - ButtonWidth, 0, ButtonWidth,
      UrlTextHeight, 0);
    gWb.SetBounds(0, UrlTextHeight, Width, Height - UrlTextHeight);
  end;

var
  rMain: TRect;
  e : Integer;
begin

  if HWND = hButton then
  begin
    Case Message of
      WM_LBUTTONUP:
        begin
          NavigateTxtUrl();
        end;
    end;
    result := CallWindowProc(BtnProc, HWND, Message, wParam, lParam);
  end
  else if HWND = hUrlText then
  begin
    Case Message of
      WM_KEYDOWN:
        begin
          if wParam = VK_RETURN then
            NavigateTxtUrl();
        end;
    end;
    result := CallWindowProc(txtProc, HWND, Message, wParam, lParam);
  end
  else
  begin
    Case Message of
      WM_CREATE:
        begin
          GetClientRect(HWND, rMain);
          hUrlText := CreateWindowEx(0, 'EDIT', BlankUrl,
            WS_CHILD or WS_VISIBLE or WS_BORDER, 0, 0, 0, 0, HWND, 0,
            hInstance, nil);
          e := GetLastError ;
          txtProc := Pointer(SetWindowLong(hUrlText, GWL_WNDPROC, LONG(@WndProc)));

          hButton := CreateWindowEx(0, 'BUTTON', '访问', WS_CHILD or WS_VISIBLE or
            WS_BORDER, 0, 0, 0, 0, HWND, 0, hInstance, nil);
          BtnProc := Pointer(SetWindowLong(hButton, GWL_WNDPROC, LONG(@WndProc)));
          gWb := TMicroWebBrowser.Create(HWND, rMain.Left,
            rMain.Top + UrlTextHeight, rMain.Right - rMain.Left,
            rMain.Height - (rMain.Top + UrlTextHeight));
          ReLayout(rMain.Right - rMain.Left, rMain.Bottom - rMain.Top);
          gWb.Navigate(BlankUrl);
          // gWb.Navigate('http://www.baidu.com');
        end;
      WM_SIZE:
        begin
          if (gWb <> nil) and (gWb.WebBrowser <> nil) then
          begin
            ReLayout(WORD(lParam), HiWord(lParam));
          end;
        end;
      WM_DESTROY:
        begin
          gWb.Free;
          PostQuitMessage(0);
          result := 1;
          exit;
        end;
    end;
    result := DefWindowProc(HWND, Message, wParam, lParam);
  end;
end;

var
  WndClass: TWndClass = (style: 0; lpfnWndProc: @WndProc; cbClsExtra: 0;
    cbWndExtra: 0; hInstance: 0; hIcon: 0; hCursor: 0; hbrBackground: 0;
    lpszMenuName: nil; lpszClassName: 'TWebBrowser');

var
  msg: Tmsg;

begin
  //防止Webbrowser中Flash抛出被0除的异常.
  SetSSEExceptionMask(exAllArithmeticExceptions);
  SetFPUExceptionMask(exAllArithmeticExceptions);
  //
  if RegisterClass(WndClass) <> 0 then
  begin
    MainHwnd := CreateWindowEx(0, WndClass.lpszClassName, WbName,
      ws_OverlappedWindow, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
      CW_USEDEFAULT, 0, 0, hInstance, nil);
    if MainHwnd <> 0 then
    begin
      ShowWindow(MainHwnd, sw_ShowNormal);
      UpdateWindow(MainHwnd);
      while GetMessage(msg, 0, 0, 0) do
      begin
        TranslateMessage(msg);
        DIspatchMessage(msg);
      end;
      ExitCOde := msg.wParam;
    end;
  end;

end.
