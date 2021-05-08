program Project5;

uses
  ExceptionLog,
  Forms,
  uFrmMain in 'uFrmMain.pas' {main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
