program Project5;

uses
  ExceptionLog,
  Forms,
  frmDemo in 'frmDemo.pas' {Form13},
  Demo in 'Demo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
