program Project1;

uses
  ExceptionLog,
  Forms,
  WNADOQDlg in 'WNADOQDlg.pas' {Form1},
  WNADOCQuery in 'WNADOCQuery.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_WNADOQDlg, Form_WNADOQDlg);
  Application.Run;
end.
