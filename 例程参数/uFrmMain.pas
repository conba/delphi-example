unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TC = 'A'..'Z';
  TOneFunc = function(X: Integer): Integer;
  TMain = class(TForm)
    edtOne: TEdit;
    edtTwo: TEdit;
    btnOK: TButton;
    edtThree: TEdit;
    btnWeiTuo: TButton;
    btnGetComputerName: TButton;
    btnParamTest: TButton;
    procedure btnGetComputerNameClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnParamTestClick(Sender: TObject);
    procedure btnWeiTuoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeStr(AStr: String);
    function StringStatus(const Str: string): string;
  public
    { Public declarations }
  end;

  function AddOne(X: Integer): Integer;
  function SomeCallBack(X: Integer; OneFunc: TOneFunc): Integer;
  procedure ShowInfo(const Form: TForm);

var
  Main: TMain;
  AForm: TForm;
  C: TC;
  OI: Integer;
  PI, SI, H, L: Char;
  S: String;
  TestStr: string = 'liliangwie';

implementation

{$R *.dfm}

procedure TMain.btnGetComputerNameClick(Sender: TObject);
var
  P: PChar;
  Size: Cardinal;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  GetMem(P,Size);
  GetComputerName(P,Size);
  ShowMessage(P);
  FreeMem(P);
end;

procedure TMain.btnOKClick(Sender: TObject);
begin
  C := 'A';
  {$R+}
  OI := Ord(C);
  PI := Pred(C);
  SI := Succ(C);
  H := High(C);
  L := Low(TC);
  S :=
    '顺序：' + IntToStr(OI) + #13 +
    '前序：' + PI + #13 +
    '后续：' + SI + #13 +
    '末序：' + H + #13 +
    '始序：' + L;
  ShowMessage(s);

end;

procedure TMain.btnParamTestClick(Sender: TObject);
begin
//  ShowInfo(AForm);
  ChangeStr(TestStr);
  ShowMessage(TestStr);
end;

procedure TMain.btnWeiTuoClick(Sender: TObject);
var
  F: TOneFunc;
  I,J: Integer;
  P1, P2: PChar;
begin
  F := AddOne;
  I := F(4);
  J := SomeCallBack(4, F);
  P1 := 'liliangwei';
  P2 := P1;
  ShowMessage(P1);
  ShowMessage(P2);
  if I = j then
    ShowMessage('F(4) 和SomeCallBack功能相同');
end;

procedure TMain.ChangeStr(AStr: String);
begin
  AStr := 'jiang'
end;

function TMain.StringStatus(const Str: string): string;
var
  Str1,Str2: string;
begin
  Str1 := 'Hello';
  Str2 := Str1;
  Result := 'Address: ' + IntToStr(Integer(Str)) +
    ',Length: ' + IntToStr(Length(Str)) +
    ',References: ' + IntToStr(PInteger(Integer(Str) - 8)^) +
    ',Value: ' + Str;
end;

function AddOne(X: Integer):Integer;
begin
  Result := X + 1;
end;

function SomeCallBack(X: Integer; OneFunc: TOneFunc):Integer;
begin
  Result := OneFunc(X);
end;

procedure ShowInfo(const Form: TForm);
begin
  {Form := Main}
  Form.Caption := 'liliangwei';
  ShowMessage(Form.Caption);
end;

end.
