unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const WM_MyMessage = WM_USER + 2000;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnMessage := AppMessage;
  Button1.Caption := '发送自定义消息';
end;

procedure TForm1.AppMessage(var Msg: TMsg; var Handled: Boolean);
var msgStr: String;
begin
  if Msg.hwnd = Application.Handle then
  begin
    if Msg.message = WM_MyMessage then
    begin
      msgStr:= PChar(Msg.lParam);
      ShowMessage(msgStr);
      Handled := True;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
const lParam: PChar = '来自定义消息';
begin
  PostMessage(Application.Handle, WM_MyMessage, 0, Integer(lParam));
end;

end.
