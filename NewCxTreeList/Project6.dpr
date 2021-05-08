program Project6;

uses
  Forms,
  Unit13 in 'Unit13.pas' {Form13},
  uTreeListTable in 'uTreeListTable.pas',
  uTreeCol in 'uTreeCol.pas',
  Hashes2 in 'Hashes2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
