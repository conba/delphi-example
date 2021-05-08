program hashTest;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {Form13},
  Hashes2 in 'Hashes2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
