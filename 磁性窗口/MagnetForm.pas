unit MagnetForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Generics.Collections;

type
  TCustomMagnetForm = class(TForm)
  private
    type
      TMagnetFormList = TList<TCustomMagnetForm>;
    class var
      // 吸附距离
      FMagnetBuffer: Integer;
      var
      // 吸附子窗口容器
      FMagnetClientList: TMagnetFormList;
      // 相对主窗口的位置
      FMagnetPosOffset: TPoint;
      // 可否随主窗口移动
      FEnableMagnetMoveClient: Boolean;
    // 移除子窗口
    procedure RemoveMagnetForm(AForm: TCustomMagnetForm);
    // 添加子窗口
    procedure AddMagnetForm(AForm: TCustomMagnetForm; Value: TPoint);
    // 处理子窗口吸附
    function ProcessClient(var ServerBound, ClientBound: TRect): Boolean;
    // 处理主窗口吸附
    function ProcessServer(var ServerBound, ClientBound: TRect; AClient: TCustomMagnetForm): Boolean;
    // 主窗口移动
    procedure ProcessServerMove();
  protected
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
    procedure WMMoving(var Message: TWMMoving); message WM_MOVING;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure DoClose(var Action: TCloseAction); override;
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class property MagnetBuffer: Integer read FMagnetBuffer write FMagnetBuffer;
  end;

implementation

{ TCustomMagnetForm }

constructor TCustomMagnetForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMagnetClientList := TMagnetFormList.Create;
end;

destructor TCustomMagnetForm.Destroy;
begin
  if Self <> Application.MainForm then
    RemoveMagnetForm(Self);
  FMagnetClientList.Free;
  inherited Destroy;
end;

procedure TCustomMagnetForm.DoClose(var Action: TCloseAction);
begin
  inherited DoClose(Action);
  if Self <> Application.MainForm then
    RemoveMagnetForm(Self);
end;

function TCustomMagnetForm.ProcessClient(var ServerBound, ClientBound: TRect): Boolean;
var
  lspace, rspace, tspace, bspace: Integer;
begin
  Result := False;
  lspace := ABS(ClientBound.Right - ServerBound.Left);
  rspace := ABS(ClientBound.Left - ServerBound.Right);
  tspace := ABS(ClientBound.Bottom - ServerBound.Top);
  bspace := ABS(ClientBound.Top - ServerBound.Bottom);

  FMagnetPosOffset := Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top);

  if (ClientBound.Bottom > ServerBound.Top) and (ClientBound.Top < ServerBound.Bottom) then
  begin
    if lspace < rspace then
    begin
      if lspace < FMagnetBuffer then
      begin
        AddMagnetForm(Self, Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top));
        OffsetRect(ClientBound, (ServerBound.Left - ClientBound.Right), 0);
        Result := True;
      end;
    end
    else
    begin
      if rspace < FMagnetBuffer then
      begin
        AddMagnetForm(Self, Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top));
        OffsetRect(ClientBound, (ServerBound.Right - ClientBound.Left), 0);
        Result := True;
      end;
    end;
  end;
  if (ClientBound.Right > ServerBound.Left) and (ClientBound.Left < ServerBound.Right) then
  begin
    if tspace < bspace then
    begin
      if tspace < FMagnetBuffer then
      begin
        AddMagnetForm(Self, Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top));
        OffsetRect(ClientBound, 0, ServerBound.Top - ClientBound.Bottom);
        Result := True;
      end;
    end
    else
    begin
      if bspace < FMagnetBuffer then
      begin
        AddMagnetForm(Self, Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top));
        OffsetRect(ClientBound, 0, ServerBound.Bottom - ClientBound.Top);
        Result := True;
      end;
    end;
  end;
end;

function TCustomMagnetForm.ProcessServer(var ServerBound, ClientBound: TRect; AClient: TCustomMagnetForm): Boolean;
var
  lspace, rspace, tspace, bspace: Integer;
begin
  Result := False;
  lspace := ABS(ClientBound.Right - ServerBound.Left);
  rspace := ABS(ClientBound.Left - ServerBound.Right);
  tspace := ABS(ClientBound.Bottom - ServerBound.Top);
  bspace := ABS(ClientBound.Top - ServerBound.Bottom);

  FMagnetPosOffset := Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top);

  if (ClientBound.Bottom > ServerBound.Top) and (ClientBound.Top < ServerBound.Bottom) then
  begin
    if lspace < rspace then
    begin
      if lspace < FMagnetBuffer then
      begin
        AddMagnetForm(AClient, Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top));
        OffsetRect(ServerBound, -(ServerBound.Left - ClientBound.Right), 0);
        Result := True;
      end;
    end
    else
    begin
      if rspace < FMagnetBuffer then
      begin
        AddMagnetForm(AClient, Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top));
        OffsetRect(ServerBound, -(ServerBound.Right - ClientBound.Left), 0);
        Result := True;
      end;
    end;
  end;
  if (ClientBound.Right > ServerBound.Left) and (ClientBound.Left < ServerBound.Right) then
  begin
    if tspace < bspace then
    begin
      if tspace < FMagnetBuffer then
      begin
        AddMagnetForm(AClient, Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top));
        OffsetRect(ServerBound, 0, -(ServerBound.Top - ClientBound.Bottom));
        Result := True;
      end;
    end
    else
    begin
      if bspace < FMagnetBuffer then
      begin
        AddMagnetForm(AClient, Point(ClientBound.Left - ServerBound.Left, ClientBound.Top - ServerBound.Top));
        OffsetRect(ServerBound, 0, -(ServerBound.Bottom - ClientBound.Top));
        Result := True;
      end;
    end;
  end;
end;

procedure TCustomMagnetForm.ProcessServerMove;
var
  i: Integer;
  p: TPoint;
begin
  inherited;
  if Self = Application.MainForm then
  begin
    if FMagnetClientList <> nil then
      for i := 0 to FMagnetClientList.Count - 1 do
      begin
        if FMagnetClientList[i].FEnableMagnetMoveClient then
        begin
          p := FMagnetClientList[i].FMagnetPosOffset;
          FMagnetClientList[i].SetBounds(Left + p.X, Top + p.Y, FMagnetClientList[i].Width, FMagnetClientList[i].Height);
        end;
      end;
  end;
end;

procedure TCustomMagnetForm.AddMagnetForm(AForm: TCustomMagnetForm; Value: TPoint);
var
  Index: Integer;
begin
  if (Application.MainForm <> nil) and (Application.MainForm is TCustomMagnetForm) then
    with TCustomMagnetForm(Application.MainForm) do
      if FMagnetClientList <> nil then
      begin
        AForm.FMagnetPosOffset := Value;
        Index := FMagnetClientList.IndexOf(AForm);
        if Index < 0 then
        begin
          Index := FMagnetClientList.Add(AForm);
        end;
      end;
end;

procedure TCustomMagnetForm.RemoveMagnetForm(AForm: TCustomMagnetForm);
begin
  AForm.FEnableMagnetMoveClient := False;
  if (Application.MainForm <> nil) and (Application.MainForm is TCustomMagnetForm) then
    with TCustomMagnetForm(Application.MainForm) do
      if FMagnetClientList <> nil then
      begin
        if FMagnetClientList.IndexOf(AForm) >= 0 then
        begin
          FMagnetClientList.Remove(AForm);
        end;
      end;
end;

procedure TCustomMagnetForm.WMMove(var Message: TWMMove);
begin
  ProcessServerMove;
end;

procedure TCustomMagnetForm.WMMoving(var Message: TWMMoving);
begin
  ProcessServerMove;
end;

procedure TCustomMagnetForm.WMSysCommand(var Message: TWMSysCommand);
  procedure SetAllClientEnableMove();
  var
    i: Integer;
  begin
    inherited;
    if Self = Application.MainForm then
    begin
      if FMagnetClientList <> nil then
        for i := 0 to FMagnetClientList.Count - 1 do
        begin
          FMagnetClientList[i].FEnableMagnetMoveClient := True;
        end;
    end;
  end;

begin
  inherited;
  if (Message.CmdType and SC_MOVE) = SC_MOVE then
  begin
    SetAllClientEnableMove();
  end;
end;

procedure TCustomMagnetForm.WMWindowPosChanging(var Message: TWMWindowPosChanging);
var
  ServerBound, ClientBound: TRect;
  lspace, rspace, tspace, bspace: Integer;
  MainForm: TCustomMagnetForm;
  oBound: TRect;
  i: Integer;
begin
  inherited;

  if (Message.WindowPos^.flags and SWP_NOMOVE) = SWP_NOMOVE then
  begin
    Exit;
  end;

  if (Application.MainForm = nil) or (not (Application.MainForm is TCustomMagnetForm)) then
    Exit;

  if (Application.MainForm = Self) then
  begin
    ServerBound := Rect(Message.WindowPos^.X, Message.WindowPos^.Y, Message.WindowPos^.X + Message.WindowPos^.cx, Message.WindowPos^.Y + Message.WindowPos^.cy);
    for i := 0 to Screen.FormCount - 1 do
    begin
      if (Screen.Forms[i] <> Self) and (Screen.Forms[i] is TCustomMagnetForm) and ((FMagnetClientList.IndexOf(TCustomMagnetForm(Screen.Forms[i])) < 0) or (not TCustomMagnetForm(Screen.Forms[i]).FEnableMagnetMoveClient)) then
      begin
        ClientBound := Screen.Forms[i].BoundsRect;
        TCustomMagnetForm(Screen.Forms[i]).FEnableMagnetMoveClient := False;
        if ProcessServer(ServerBound, ClientBound, TCustomMagnetForm(Screen.Forms[i])) then
        begin
          Message.WindowPos^.X := ServerBound.Left;
          Message.WindowPos^.Y := ServerBound.Top;
          Message.WindowPos^.cx := ServerBound.Right - ServerBound.Left;
          Message.WindowPos^.cy := ServerBound.Bottom - ServerBound.Top;

          break;
        end;
      end;
    end;
  end
  else
  begin

    MainForm := TCustomMagnetForm(Application.MainForm);
    MainForm.RemoveMagnetForm(Self);
    ServerBound := Application.MainForm.BoundsRect;
    ClientBound := Rect(Message.WindowPos^.X, Message.WindowPos^.Y, Message.WindowPos^.X + Message.WindowPos^.cx, Message.WindowPos^.Y + Message.WindowPos^.cy);
    ProcessClient(ServerBound, ClientBound);
    Message.WindowPos^.X := ClientBound.Left;
    Message.WindowPos^.Y := ClientBound.Top;
    Message.WindowPos^.cx := ClientBound.Right - ClientBound.Left;
    Message.WindowPos^.cy := ClientBound.Bottom - ClientBound.Top;
    FEnableMagnetMoveClient := True;
  end;
end;

initialization
  TCustomMagnetForm.FMagnetBuffer := 10;

finalization

end.
