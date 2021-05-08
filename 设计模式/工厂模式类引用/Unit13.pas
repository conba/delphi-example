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
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
uses
  Unit14;
{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
const
  ControlClassArry: array[0..2] of TControlClass =
              (TMonthCalendar, TMemo, TColorBox);
var
  i: Integer;
  ControlObj: TObject;
begin
  for I := 0 to ControlCount - 1 do
    if (Controls[i] is TMonthCalendar) or (Controls[i] is TMemo) or
      (Controls[i] is TColorBox) then
      Controls[i].Free;
//  ControlObj := TControlFactory.createControlObj(Self,
//                        ControlClassArry[rg1.ItemIndex]);

  ControlObj := TControlFactory.Create(Self,
                          ControlClassArry[rg1.ItemIndex]);
  lbl1.caption := ControlObj.ClassName;
  if (ControlObj is TMemo) then
    TMemo(ControlObj).Lines.Add('≤‚ ‘≥…π¶');
  if (ControlObj is TColorBox) then
    TColorBox(ControlObj).ItemIndex := 2

end;

end.
