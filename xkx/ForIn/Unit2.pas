unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMyList = class(TObject)
  private
  type
    TEnumerator = class
    private
      FValue: TArray<string>;
      FIndex: NativeInt;
      function GetCurrent: string;
    public
      constructor Create(const AValue: TArray<string>);
      function MoveNext: Boolean;
      property Current: string read GetCurrent;
    end;
  public
    function GetEnumerator(): TEnumerator;
  private
    FStringArray: TArray<string>;
    function Get(Index: Integer): string;
    procedure Put(Index: Integer; const Value: string);
  public
    procedure Add(Value: string);
    property Strings[Index: Integer]: string read Get write Put; default;
  end;

  TForm2 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  MyList: TMyList;
  s: string;
begin
  MyList := TMyList.Create;
  MyList.Add('111');
  MyList.Add('222');
  MyList.Add('333');
  for s in MyList do
    Memo1.Lines.Add(s);
  // 修改程序，使其可以正确执行此函数，【此函数不能修改】
end;

{ TMyList }

procedure TMyList.Add(Value: string);
begin
  SetLength(FStringArray, Length(FStringArray) + 1);
  FStringArray[Length(FStringArray) - 1] := Value;
end;

function TMyList.Get(Index: Integer): string;
begin
  Result := '';
  if (Index < 0) or (Index > Length(FStringArray)) then
  begin
    ShowMessage('索引错误');
  end;
  Result := FStringArray[Index];
end;

function TMyList.GetEnumerator: TEnumerator;
begin
  Result := TEnumerator.Create(FStringArray);
end;

procedure TMyList.Put(Index: Integer; const Value: string);
begin
  FStringArray[Index] := Value;
end;

{ TMyList.TEnumerator }

constructor TMyList.TEnumerator.Create(const AValue: TArray<string>);
begin
  FValue := AValue;
  FIndex := -1;
end;

function TMyList.TEnumerator.GetCurrent: string;
begin
  Result := FValue[FIndex];
end;

function TMyList.TEnumerator.MoveNext: Boolean;
begin
  Result := False;
  if (FIndex >= Length(FValue)) then
    Exit;

  Inc(FIndex);
  Result := FIndex < Length(FValue);
end;

end.
