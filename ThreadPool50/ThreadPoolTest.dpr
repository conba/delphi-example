program ThreadPoolTest;

uses
  Forms,
  uTestFrm in 'uTestFrm.pas' {Form1},
  ThreadPool in 'ThreadPool.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
