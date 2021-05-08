unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
Function After (Src: string ; Var S:string ) : string ;
  Var
  F : Word ;
begin
  F := POS (Src,S) ;
  if F=0 then
    After := ''
   else
    After := COPY(S,F+length(src),length(s)) ;
end ;

function GetStr(Dyjss: string): string;
var
  sFylx: string;
  sAfter, sBefore: string;
  iPosition: Integer;
begin
  iPosition := Pos('^', Dyjss);
  if iPosition = 0 then
    Result := Dyjss;
  sAfter := COPY(Dyjss, iPosition + length('^'), length(Dyjss));
  iPosition := Pos('^', sAfter);
  sBefore := COPY(sAfter, 1, iPosition - 1);
  Result := sBefore;
end;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  s: string;
  Str: string;
  Str1: string;
begin
  Str := '(1 + 2) ¡Á^bhgd^%';
  s := After('^', Str);

  Str1 := GetStr(Str);

  ShowMessage(Str1);
end;

end.
