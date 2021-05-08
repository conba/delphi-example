unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ObjAuto;

type
{$MethodInfo ON}
  TTestCall = class(TPersistent)
  public
    function Add(X,Y: integer): integer;
    procedure Msg(s: string);
  end;
{$MethodInfo OFF}

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
//    BitBtn1: TBitBtn;
    procedure Edit1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1Enter(Sender: TObject);
begin

end;

{ TTestCall }

function TTestCall.Add(X, Y: integer): integer;
begin
  result := X+Y;
end;

procedure TTestCall.Msg(s: string);
begin
  ShowMessage(s);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  tc: TTestCall;
  mih: PMethodInfoHeader;
  res:integer;
begin
  tc := TTestCall.Create;
  mih := Objauto.GetMethodInfo(tc,'Msg');
  ObjAuto.ObjectInvoke(tc, mih, [1], ['orz']);
  tc.Free;
end;

end.
