unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngextra, ActnList, ExtCtrls;

type
  TForm2 = class(TForm)
    shpHeader: TShape;
    actlst1: TActionList;
    act1: TAction;
    btnClose: TPNGButton;
    btnNewDefaultPrj: TPNGButton;
    PNGButton1: TPNGButton;
    procedure act1Execute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure WMHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.act1Execute(Sender: TObject);
begin
  Application.Terminate();
end;

procedure TForm2.WMHitTest(var Message: TWMNCHitTest);
const
  EDGEDETECT = 7; // adjust to suit yourself
var
  deltaRect: TRect; // not really used as a rect, just a convenient structure
  aPoint: TPoint;
  PosControl: TControl;
begin
  inherited;
  aPoint := Point(Message.XPos, Message.YPos);
  aPoint := ScreenToClient(aPoint);
  PosControl := ControlAtPos(aPoint, False);
  // 设为标题 可拖动
  if PosControl = shpHeader then
    Message.Result := HTCAPTION
end;

end.
