unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Generics.Collections, Generics.Defaults;

type
  TMyFunc = procedure(Msg : PChar);

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

  TMyRecord = record
  strict private
    Num1: Integer;
    Str1: string;
  public
    class operator Implicit(a: TMyRecord): TMyRecord;
  end;

var
  Form1: TForm1;

implementation
uses
  ArrayEx, PELoader;
{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  //������̬����
  a, b, c: TArrayEx<Integer>;
  f: TArrayEx<Single>;
  s : TArrayEx<string>;
  //
  i: Integer;
  z: array of Integer;
begin
  // ֱ�Ӹ������������
  a := [2, 2, 3, 4];
  s := ['haha', 'hello'];
  // ��¡
  b := a.Clone;

  // ��Ԫ�ظ�ֵ
  b[0] := 5;

  // ����������,����������ӻ�������Ԫ��
  c := a + b;

  c := 88 + c + 99;
  a.Append([10, 20, 30]);
  a.Insert(2, 1000);
  a.Insert(2, [1000, 45]);

  a[0] := 7;
  // ȥ��
  c.Unique;
  // ɾ��
  c.Delete(0, 3);
  // �Ƚ�
  if c = z then
    // for in ѭ��
    for i in c do
      if i = 0 then
      begin
        //
      end;
  //
  f := [1, 2, 3.1415926];
  f.Size := 200;
  if f[0] = 1.0 then
  begin

  end;

end;

procedure TForm1.btn2Click(Sender: TObject);
//var
//  hDLL: Cardinal;
//  A: TMyFunc;
begin
//  hDLL := LoadPE('DLL������,DLL���ݵĴ�С');
//  A := PELoader.GetProcAddress(DWORD(hDLL), 'A');
//  A('aa');
//  FreePE(hDLL);
end;

{ TMyRecord }

class operator TMyRecord.Implicit(a: TMyRecord): TMyRecord;
begin
  Num1 := a.Num1;
  Str1 := a.Str1;
end;

end.
