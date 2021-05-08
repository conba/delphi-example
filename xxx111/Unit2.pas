unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Generics.Collections, Generics.Defaults, StdCtrls;

type
  TMyRec = record
    n: Integer;
    s: string;
    class operator Equal(const a: TMyRec; const b: TMyRec): Boolean;
    // 隐式转换
    class operator Implicit(const a: TMyRec): Integer; overload;
    class Operator Implicit(const a: Integer): TMyRec; overload;
    // 显示转换
    class Operator Explicit(const a: TMyRec): Integer; overload;
    class Operator Explicit(const a: Integer): TMyRec; overload;
  end;

  TMyDic = class(TDictionary<TMyRec,Integer>)
    // 只能在这个类里面写东西 不许写 ContainsKey 这个函数
    constructor Create();
  end;

  TForm2 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FMyDic: TMyDic;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
var
  iVar: Integer;
  MyVar: TMyRec;
begin
//  MyVar.n := 1;
//  MyVar.s := '123';
//  iVar := MyVar;
//  MyVar := 2;
  ShowMessage(IntToStr(MyVar.n));
end;

procedure TForm2.btn2Click(Sender: TObject);
var
  iVar, iVar2: Integer;
  MyVar: TMyRec;
begin
  iVar := 1234;
  MyVar := TMyRec(iVar);
  iVar2 := TMyRec(MyVar);
//  ShowMessage(IntToStr(MyVar.n));
  ShowMessage(IntToStr(iVar2));
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FMyDic.Free;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  a, b, c: TMyRec;
begin
  FMyDic := TMyDic.Create;
  a.s := '123';
  a.n := 1;
  b.s := '123';
  b.n := 2;
  c.s := '234';
  c.n := 3;
  FMyDic.Add(a, 0);
  if FMyDic.ContainsKey(b) and not FMyDic.ContainsKey(c) then
    ShowMessage('Goal'); // 目标是执行这段代码

  if a = b then
    ShowMessage('1');
end;

{ TMyRec }

class operator TMyRec.Equal(const a, b: TMyRec): Boolean;
begin
  Result := False;
  if a.s = b.s then
    Result := True;
end;

class operator TMyRec.Implicit(const a: TMyRec): Integer;
begin
  Result := a.n;
end;

class operator TMyRec.Explicit(const a: TMyRec): Integer;
begin
  Result := a.n;
end;

class operator TMyRec.Explicit(const a: Integer): TMyRec;
begin
  Result.n := a;
end;

class operator TMyRec.Implicit(const a: Integer): TMyRec;
begin
  Result.n := a;
end;

{ TMyDic }

constructor TMyDic.Create;
var
  FuncEqual: TEqualityComparison<TMyRec>;
  FuncHash: THasher<TMyRec>;
  FCompare: TDelegatedEqualityComparer<TMyRec>;
begin
  FuncEqual := function(const Left, Right: TMyRec): Boolean
  begin
    Result := False;
    if Left = Right then
      Result := True;
  end;

  FuncHash := function(const Value: TMyRec): Integer
  begin
    Result := StrToInt(Value.s);
  end;

  FCompare := TDelegatedEqualityComparer<TMyRec>.Create(
  function(const Left, Right: TMyRec): Boolean
  begin
    Result := False;
    if Left = Right then
      Result := True;
  end,
  function(const Value: TMyRec): Integer
  begin
    Result := StrToInt(Value.s);
  end);
  inherited Create(FCompare);
end;

end.
