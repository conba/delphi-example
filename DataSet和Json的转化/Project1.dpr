program Project1;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {Form1},
  uDBJson in 'uDBJson.pas',
  superobject in 'superobject.pas',
  uJsonDB in 'uJsonDB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
