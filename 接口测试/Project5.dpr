program Project5;

uses
  ExceptionLog,
  Forms,
  Unit13 in 'Unit13.pas' {Form13},
  uOneIntf in 'uOneIntf.pas',
  uTwoIntf in 'uTwoIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
