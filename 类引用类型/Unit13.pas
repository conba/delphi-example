unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm13 = class(TForm)
    rg1: TRadioGroup;
    btn1: TButton;
    lbl1: TLabel;
    cal1: TMonthCalendar;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateControlObj(ControlClass: TControlClass);
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
const
  ContrlClassArry: array[0..2] of
          TControlClass = (TMonthCalendar,TMemo, TColorBox);
var
  i: Integer;
begin
  for I := 0 to ControlCount - 1 do
    if (Controls[i] is TMonthCalendar) or (Controls[i] is TMemo)
      or (Controls[i] is TColorBox)then
      Controls[i].Free;
  CreateControlObj(ContrlClassArry[rg1.ItemIndex]);

end;

procedure TForm13.CreateControlObj(ControlClass: TControlClass);
var
  AControlObj: TControl;
begin
  AControlObj := ControlClass.Create(self);
  AControlObj.Parent := self;
  AControlObj.Name := AControlObj.ClassName;
  AControlObj.SetBounds(10, 10, 250, 150);
  lbl1.Caption := AControlObj.ClassName;
end;

end.
