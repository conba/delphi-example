unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Generics.Collections, StdCtrls;

type
  TMyRec = record
    I: Integer;
  end;
  PMyRec = ^TMyRec;

  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    FMyRec: TDictionary<Integer, TArray<TMyRec>>;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FMyRec := TDictionary<Integer, TArray<TMyRec>>.Create;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  MyArr: TArray<TMyRec>;
  PArr: Pointer;
begin
  SetLength(MyArr, 1);
  MyArr[0].I := 1;
  PArr := Pointer(MyArr);
  ShowMessage(IntToHex(Integer(PArr), 8));
  FMyRec.Add(1, MyArr);
  SetLength(MyArr, 2);
  MyArr[1].I := 2;
  PArr := Pointer(MyArr);
  ShowMessage(IntToHex(Integer(PArr), 8));
  ShowMessage(IntToStr(Length(FMyRec[1])));
  FMyRec.AddOrSetValue(1, MyArr);
  ShowMessage(IntToStr(Length(FMyRec[1])));
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  FMyRec1: TDictionary<Integer, TMyRec>;
  MyRec: TMyRec;
  iKey: Integer;
begin
  MyRec.I := 1;
  FMyRec1 := TDictionary<Integer, TMyRec>.Create;
  FMyRec1.Add(1, MyRec);
  MyRec.I := 2;
  FMyRec1.Add(2, MyRec);

  for iKey in FMyRec1.Keys do
  begin
    ShowMessage(IntToStr(FMyRec1[iKey].I));
  end;

end;

end.
