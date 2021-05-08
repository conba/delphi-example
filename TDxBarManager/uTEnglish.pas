unit uTEnglish;

interface
uses
  uIMan, Dialogs;

type
  TEnglish = class(TInterfacedObject, IMan)
  public
    Fa: Integer;
    function IncA: Integer;
    procedure SayHello;
  end;
implementation

{ TEnglish }

function TEnglish.IncA: Integer;
begin
  Fa := Fa - 1;
  Result := Fa;
end;

procedure TEnglish.SayHello;
begin
  ShowMessage('hello');
end;

end.
