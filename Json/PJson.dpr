program PJson;

uses
  ExceptionLog,
  Forms,
  uJson in 'uJson.pas' {Form1},
  superobject in 'superobject.pas',
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
