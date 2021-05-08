unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOneIntf, uTwoIntf, StdCtrls;

type
  TMyObject = class(TInterfacedObject, Intf1, Intf2)
    procedure SayHello;
    //procedure SayHello1;
  end;

  TForm13 = class(TForm)
    btnTset: TButton;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnTsetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

{ TMyObject }

procedure TMyObject.SayHello;
begin
  ShowMessage('Hello');
end;

procedure TForm13.btn1Click(Sender: TObject);
var
  MyObj: TMyObject;
  AIntf1: Intf1;
  AIntf2: Intf2;
begin
  MyObj := TMyObject.Create;
  if Supports(MyObj, Intf1, AIntf1) then
   AIntf1.SayHello;
  if Supports(MyObj, Intf2) then
  begin
    if Assigned(AIntf2) then
    begin
      AIntf2.SayHello;
    end;
    ShowMessage('1');
  end;
end;

procedure TForm13.btn2Click(Sender: TObject);
var
  i, j: Integer;
begin
  Screen.Cursor := crNo;
  for I := 0 to 500000000000 do
  begin
    Inc(j);
  end;
  ShowMessage(IntToStr(j));
  Screen.Cursor := crDefault;
end;

procedure TForm13.btnTsetClick(Sender: TObject);
var
  MyObj: TMyObject;
  AIntf1: Intf1;
  AIntf2: Intf2;
begin
  MyObj := TMyObject.Create;
  AIntf1 := MyObj as Intf1;
  AIntf2 := AIntf1 as Intf2;
  AIntf2.SayHello;
end;

//procedure TMyObject.SayHello1;
//begin
//  ShowMessage('Hello1');
//end;

end.
