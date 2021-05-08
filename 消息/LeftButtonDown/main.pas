unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    mmo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift:
        TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  mmo1.Clear;
end;

procedure TForm4.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift:
    TShiftState; X, Y: Integer);
begin
  mmo1.Lines.Add('OnMouseDown');
end;

procedure TForm4.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  mmo1.Lines.Add('MouseDown');
  inherited; {可以去掉或下移这句再试}
end;

procedure TForm4.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited; {可以去掉或上移这句再试}
  mmo1.Lines.Add('WM_LeftMouseDown');
end;

end.
