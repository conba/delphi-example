unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

{鼠标在 Panel1 中移动时, 我做了如下处理:}
{1、显示鼠标在 Panel1 中的坐标}
{2、显示是否同时按住了 Shift、Ctrl、Alt}
procedure TForm3.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  List: TStringList;
begin
  List := TStringList.Create;
  if ssShift in Shift then List.Add('Shift');
  if ssCtrl  in Shift then List.Add('Ctrl');
  if ssAlt   in Shift then List.Add('Alt');
  if ssLeft  in Shift then List.Add('Left');
  if ssRight in Shift then List.Add('Right');
  if ssMiddle in Shift then List.Add('Middle');
  if ssDouble in Shift then List.Add('Double');
  


  if List.Count > 0 then
    Panel1.Caption := Format('%s: %d, %d', [List.CommaText, X, Y])
  else
    Panel1.Caption := Format('%d, %d', [X, Y]);

  List.Free;
end;

{向 Panel1 发送 WM_MOUSEMOVE 消息}
{第一个消息参数是 0, 表示没有按任何辅助键}
{第二个消息参数是 0, 相当于把鼠标移动到(0,0)坐标}
procedure TForm3.Button1Click(Sender: TObject);
begin
  Panel1.Perform(WM_MOUSEMOVE, 0, 0);
end;

{向 Panel1 发送 WM_MOUSEMOVE 消息}
{第二个消息参数在 WM_MOUSEMOVE 消息中表示鼠标坐标位置; 参数是32位整数, 低16位是X, 高16位是Y}
{这里给的坐标是控件的中心点}
procedure TForm3.Button2Click(Sender: TObject);
var
  x,y,LParam: Integer;                 
begin
  x := Panel1.ClientWidth div 2;
  y := Panel1.ClientHeight div 2;
  LParam := y shl 16 or x;
  Panel1.Perform(WM_MOUSEMOVE, 0, LParam);
end;

{向 Panel1 发送 WM_MOUSEMOVE 消息}
{消息的第一个参数是表示正在按下哪个辅助键和鼠标的状态}
{这里发送的消息是: 按着 Shift 键, 鼠标移动到 (20,10) 处}
procedure TForm3.Button3Click(Sender: TObject);
const
  x = 20;
  y = 10;
begin
  Panel1.Perform(WM_MOUSEMOVE, MK_SHIFT, y shl 16 or x);
end;

end.
