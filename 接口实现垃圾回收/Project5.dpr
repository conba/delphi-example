program Project5;

uses
  ExceptionLog,
  Forms,
  ufrmMain in 'ufrmMain.pas' {Form13},
  mtReaper in 'mtReaper.pas',
  uSnapshot in 'uSnapshot.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
