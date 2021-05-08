unit Self;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm13 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyClass = class
    FA: Byte;
    FB: array [0..3] of Double;
  protected
    FC: Boolean;
    FD: string;
  private
    FE: Integer;
    procedure F0();
    function G0(): Integer;
    procedure H0(var P: Pointer);

    function GetSelfAddress: string;
    class function GetClassSelfAddress: string;
    function GetVMTAddress: string;
  end;

  TProcA = procedure () of object;
  TFuncB = function (): Integer of object;
  TProcC = procedure (var P: Pointer) of object;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
var
  MyClass: TMyClass;
  Str: string;
  PMyClass: Pointer;
  P: Pointer;
  ProcA: TProcA;
  FuncB: TFuncB;
  ProcC: TProcC;
begin
  Self.mmo1.Lines.Clear;
  Str := '�෽����Self��ַ ' + TMyClass.GetClassSelfAddress;
  mmo1.Lines.Add(Str);

  PMyClass := @MyClass;
  Str := 'MyClass�������ָ��ĵ�ַ ' + IntToHex(Integer(PMyClass), 8);
  mmo1.Lines.Add(Str);

  MyClass := TMyClass.Create;
  Str := '��ͨ������self�ĵ�ַ ' + MyClass.GetSelfAddress;
  mmo1.Lines.Add(Str);

  PMyClass := Pointer(MyClass);
  Str := 'MyClass�������ָ��ĵ�ַ ' + IntToHex(Integer(PMyClass), 8);
  mmo1.Lines.Add(Str);

  Str := 'MyClass����������ⷽ����ĵ�ַ' + MyClass.GetVMTAddress;
  mmo1.Lines.Add(str);

  P := @MyClass.FA;
  Str := 'MyClass��FA�ֶεĵ�ַ ' + IntToHex(Integer(P), 8);
  mmo1.Lines.Add(Str);

  P := @MyClass.FB;
  Str := 'MyClass��FB�ֶεĵ�ַ ' + IntToHex(Integer(P), 8);
  mmo1.Lines.Add(Str);

  P := @MyClass.FC;
  Str := 'MyClass��FC�ֶεĵ�ַ ' + IntToHex(Integer(P), 8);
  mmo1.Lines.Add(Str);

  P := @MyClass.FD;
  Str := 'MyClass��FD�ֶεĵ�ַ ' + IntToHex(Integer(P), 8);
  mmo1.Lines.Add(Str);

  ProcA := MyClass.F0;
  Str := 'TMyClass��F0�ĵ�ַ ' + IntToHex(Integer(@@ProcA), 8);
  mmo1.Lines.Add(Str);

  FuncB := MyClass.G0;
  Str := 'TMyClass��G0�ĵ�ַ ' + IntToHex(Integer(@FuncB), 8);
  mmo1.Lines.Add(Str);

  ProcC := MyClass.H0;
  Str := 'TMyClass��H0�ĵ�ַ ' + IntToHex(Integer(@ProcC), 8);
  mmo1.Lines.Add(Str);

  MyClass.Free;
end;

{ TMyClass }

procedure TMyClass.F0;
begin

end;

function TMyClass.G0: Integer;
begin

end;

class function TMyClass.GetClassSelfAddress: string;
var
  P: Pointer;
begin
  P := Pointer(Self);
  Result := IntToHex(Integer(P), 8);
end;

function TMyClass.GetSelfAddress: string;
var
  P: Pointer;
begin
  P := Pointer(Self);
  Result := IntToHex(Integer(P), 8);
end;

function TMyClass.GetVMTAddress: string;
var
  P: Pointer;
begin
  P := Pointer(Self);
  P := Pointer(P^);
  Result := IntToHex(Integer(P), 8);
end;

procedure TMyClass.H0(var P: Pointer);
begin

end;

end.
