unit uTChineseMan;

interface
uses
  uIMan, Dialogs;

type
  TChinese = class(TInterfacedObject, IMan)
  public
    Fa: Integer;
    constructor Create;
    procedure SayHello;
    function IncA: Integer;
  end;
implementation

{ TChinese }

constructor TChinese.Create;
begin
  Fa := 1;
end;

function TChinese.IncA: Integer;
begin
  Fa := Fa + 1;
  Result := Fa;
end;

procedure TChinese.SayHello;
begin
  ShowMessage('ÄãºÃ');
end;

end.
