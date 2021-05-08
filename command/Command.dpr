program Command;

uses
  Forms,
  main in 'main.pas' {Form1},
  uAbstractCommandIntf in 'uAbstractCommandIntf.pas',
  uAbstractCommand in 'uAbstractCommand.pas',
  uPMStdActns in 'uPMStdActns.pas',
  uMainCommand in 'uMainCommand.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
