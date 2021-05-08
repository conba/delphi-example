unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Hashes2, StdCtrls;

type
  TForm13 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

var
  Hash: TIntegerHash;

procedure TForm13.FormDestroy(Sender: TObject);
begin
  Hash.Free;
  Hash := nil;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  Hash := TIntegerHash.Create;
end;

procedure TForm13.btn1Click(Sender: TObject);
begin
  Hash.Items['1'] := 1;
  ShowMessage(IntToStr(Hash.Items['1']));
end;

procedure TForm13.btn2Click(Sender: TObject);
var
  ObjHash: TObjectHash;
  obj1, obj2, obj3: TObject;
  sObjName: string;
begin
  ObjHash := TObjectHash.Create;
  obj1 := TObject.Create;
  obj2 := TObject.Create;
  obj3 := TObject.Create;
  ObjHash['1'] := obj1;
  ObjHash['2'] := obj2;
  ObjHash['3'] := obj3;
  sObjName := ObjHash['1'].ClassName;
  ShowMessage(sObjName);
end;

end.
