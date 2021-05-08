program DynamicArry;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {Form1},
  ArrayEx in 'ArrayEx.pas',
  PELoader in 'PELoader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
