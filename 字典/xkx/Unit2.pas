unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMyList = class(TObject)
  private
    FStringArray: array of string;
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

end;

function TMyList.Get(Index: Integer): string;
begin

end;

procedure TMyList.Put(Index: Integer; const Value: string);
begin

end;

end.
