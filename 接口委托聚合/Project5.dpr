program Project5;

uses
  ExceptionLog,
  Forms,
  Unit13 in 'Unit13.pas' {Form13},
  uMyIntf in 'uMyIntf.pas',
  Unit14 in 'Unit14.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
