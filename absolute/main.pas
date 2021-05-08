unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  num: Int64;
  pt: TPoint absolute num;
  arr: array[0..1] of Integer absolute pt;
begin
  pt.X := 111;
  pt.Y := 222;

  ShowMessageFmt('%d, %d', [arr[0], arr[1]]);                {111, 222}
  ShowMessageFmt('%d, %d', [num shl 32 shr 32, num shr 32]); {111, 222}
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  num: Integer;
  shnum: Byte absolute num;
begin
  num := 512;
  shnum := 1;
  ShowMessage(IntToStr(num));
end;

end.
