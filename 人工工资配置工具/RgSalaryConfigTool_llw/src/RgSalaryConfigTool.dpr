program RgSalaryConfigTool;

uses
  Forms,
  uMain in 'uMain.pas' {FrmMain},
  uRgSalaryConfigBusi in 'uRgSalaryConfigBusi.pas',
  uSimpleXml in 'uSimpleXml.pas',
  uRgSalaryConfigToolConst in 'uRgSalaryConfigToolConst.pas',
  ufrmRglx in 'ufrmRglx.pas' {FrmRglx};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
//  Application.CreateForm(TFrmRglx, FrmRglx);
  Application.Run;
end.
