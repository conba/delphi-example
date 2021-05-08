program Project1;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {Form1},
  uThreadPool in 'uThreadPool.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
