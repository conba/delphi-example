program Project5;

uses
  ExceptionLog,
  Forms,
  uFrmMain in '..\���̲���\uFrmMain.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
