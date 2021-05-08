program Project5;

uses
  ExceptionLog,
  Forms,
  uFrmMain in '..\Àý³Ì²ÎÊý\uFrmMain.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
