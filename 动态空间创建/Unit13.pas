unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ActnList;

type
  TControlClass = class of TControl;
  TForm13 = class(TForm)
    rgTest: TRadioGroup;
    btnTest: TButton;
    lblTest: TLabel;
    btn1: TButton;
    grp1: TGroupBox;
    btn2: TButton;
    actlst1: TActionList;
    act1: TAction;
    btn3: TButton;
    pnl1: TPanel;
    pnl2: TPanel;
    btn4: TButton;
    procedure act1Execute(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
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

procedure TForm13.act1Execute(Sender: TObject);
begin
  ShowMessage(Sender.ClassName);
  ShowMessage((Sender as TAction).ActionComponent.ClassName);
  if Sender is TButton then
  begin
    ShowMessage((Sender as TButton).ClassName);
  end;
end;

procedure TForm13.btn1Click(Sender: TObject);
begin
  if Sender is TButton then
  begin
    ShowMessage((Sender as TButton).Parent.ClassName);
    ShowMessage((Sender as TButton).Owner.ClassName);
  end;
end;

procedure TForm13.btn2Click(Sender: TObject);
begin
  if Sender is TButton then
  begin
    ShowMessage((Sender as TButton).Parent.ClassName);
    ShowMessage((Sender as TButton).Owner.ClassName);
  end;
end;

procedure TForm13.btn4Click(Sender: TObject);
begin
  (Sender as TButton).Parent := pnl2;
end;

procedure TForm13.btnTestClick(Sender: TObject);
const
  ContrlClassArry: array[0..2] of TControlClass
                = (TMonthCalendar, TMemo, TColorBox);
var
  I: Integer;
  ControlObj: TObject;
begin
  //清理对象
  for I := 0 to ControlCount - 1 do
  begin
    ShowMessage(Controls[i].ClassName);
    if (Controls[i] is TMonthCalendar) or (Controls[i] is TMemo)
      or (Controls[i] is TColorBox) then
      Controls[i].Free;
  end;
    //创建对象
  ControlObj := TControlFactory.createControlObj(self,
                        ContrlClassArry[rgTest.ItemIndex]);
  lblTest.Caption := ControlObj.ClassName;
  //测试对象
  if (ControlObj is TMemo) then
    TMemo(ControlObj).Lines.Add('测试成功');
  if (ControlObj is TColorBox) then
    TColorBox(ControlObj).ItemIndex := 2;
end;

end.
