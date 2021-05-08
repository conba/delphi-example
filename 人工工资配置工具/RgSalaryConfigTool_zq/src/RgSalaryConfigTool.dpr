program RgSalaryConfigTool;

uses
  Forms,
  uMain in 'uMain.pas' {FrmMain},
  uRgSalaryConfigBusi in 'uRgSalaryConfigBusi.pas',
  uSimpleXml in 'uSimpleXml.pas',
  uRgSalaryConfigToolConst in 'uRgSalaryConfigToolConst.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
