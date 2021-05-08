unit uCreateManClass;

interface
uses
  Dialogs, Classes;

type
  TSkinColor = (scWhite, scYello, scBlack, scDark);
  TMan = class(TObject)
  private
    FAge: Integer;
    FData: TStrings;
    FMale: Boolean;
    FSkinColor: TSkinColor;
    FValidData: Boolean;
    function GetData(Index: Integer): string;
    procedure SetData(Index: Integer; Value: string);
    function GetAge: integer;
    function GetColor: TSkinColor;
    function GetMale: Boolean;
    procedure SetAge(Value: Integer);
    procedure SetColor(Value: TSkinColor);
    procedure SetMale(Value: Boolean);
  public
    constructor Create;
    procedure SayHello(words: pchar);
    property Age: Integer read GetAge write SetAge;
    property Male: Boolean read GetMale write SetMale;
    property SkinColor: TSkinColor read GetColor write SetColor;
    property ValidData: Boolean read FValidData write FValidData;
    property Name: string index 0 read GetData write SetData;
    property Language: string index 1 read GetData write SetData;
    property Nationality: string index 2 read GetData write SetData;
  end;

implementation

const
  DataName: array [0..2] of string = ('Name', 'Language', 'Nationality');

constructor TMan.Create;
begin
  FData :=  TStringList.Create;
end;

function TMan.GetAge: integer;
begin

end;

function TMan.GetColor: TSkinColor;
begin

end;

function TMan.GetData(Index: Integer): string;
begin
  result := FData.Values[DataName[index]];
end;

function TMan.GetMale: Boolean;
begin

end;

procedure TMan.SayHello(words: pchar);
begin

end;

procedure TMan.SetAge(Value: Integer);
begin

end;

procedure TMan.SetColor(Value: TSkinColor);
begin

end;

procedure TMan.SetData(Index: Integer; Value: string);
begin
  FData.Values[DataName[Index]] := Value;
end;
procedure TMan.SetMale(Value: Boolean);
begin

end;

end.
