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

{����� Panel1 ���ƶ�ʱ, ���������´���:}
{1����ʾ����� Panel1 �е�����}
{2����ʾ�Ƿ�ͬʱ��ס�� Shift��Ctrl��Alt}
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

{�� Panel1 ���� WM_MOUSEMOVE ��Ϣ}
{��һ����Ϣ������ 0, ��ʾû�а��κθ�����}
{�ڶ�����Ϣ������ 0, �൱�ڰ�����ƶ���(0,0)����}
procedure TForm3.Button1Click(Sender: TObject);
begin
  Panel1.Perform(WM_MOUSEMOVE, 0, 0);
end;

{�� Panel1 ���� WM_MOUSEMOVE ��Ϣ}
{�ڶ�����Ϣ������ WM_MOUSEMOVE ��Ϣ�б�ʾ�������λ��; ������32λ����, ��16λ��X, ��16λ��Y}
{������������ǿؼ������ĵ�}
procedure TForm3.Button2Click(Sender: TObject);
var
  x,y,LParam: Integer;                 
begin
  x := Panel1.ClientWidth div 2;
  y := Panel1.ClientHeight div 2;
  LParam := y shl 16 or x;
  Panel1.Perform(WM_MOUSEMOVE, 0, LParam);
end;

{�� Panel1 ���� WM_MOUSEMOVE ��Ϣ}
{��Ϣ�ĵ�һ�������Ǳ�ʾ���ڰ����ĸ�������������״̬}
{���﷢�͵���Ϣ��: ���� Shift ��, ����ƶ��� (20,10) ��}
procedure TForm3.Button3Click(Sender: TObject);
const
  x = 20;
  y = 10;
begin
  Panel1.Perform(WM_MOUSEMOVE, MK_SHIFT, y shl 16 or x);
end;

end.
