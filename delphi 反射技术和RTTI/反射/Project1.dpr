program Project1;

uses
  ExceptionLog,
  Forms,
  Unit_main in 'Unit_main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_main, Form_main);
  Application.Run;
end.
