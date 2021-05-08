program observer;

uses
  Forms,
  main in 'main.pas' {Form1},
  observer in 'observer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
