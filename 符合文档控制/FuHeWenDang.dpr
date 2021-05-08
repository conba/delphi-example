program FuHeWenDang;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {Form1},
  uDataMgrService in 'uDataMgrService.pas',
  uDataManagerIntf in 'uDataManagerIntf.pas',
  uPrjDataManager in 'uPrjDataManager.pas',
  uPMDataIntf in 'uPMDataIntf.pas',
  uPmLibDataSet in 'uPmLibDataSet.pas',
  uServiceIntf in 'uServiceIntf.pas',
  Hashes2 in 'Hashes2.pas',
  uPMTreeListIntf in 'uPMTreeListIntf.pas',
  uPMDataConst in 'uPMDataConst.pas',
  uCompoundDocument in 'uCompoundDocument.pas',
  uCompoundDocumentIntf in 'uCompoundDocumentIntf.pas',
  uDataContext in 'uDataContext.pas',
  uDataManagerUtils in 'uDataManagerUtils.pas',
  uSysUtils in 'uSysUtils.pas',
  uThreadProgressDialog in 'uThreadProgressDialog.pas',
  ufrmProgress in 'ufrmProgress.pas' {frmProgress},
  MessageDialog in 'MessageDialog.pas' {frmMessageBox},
  RegExpr in 'RegExpr.pas',
  superobject in 'superobject.pas',
  uPMDataUtils in 'uPMDataUtils.pas',
  uPMData in 'uPMData.pas',
  pmdxmdaset in 'pmdxmdaset.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
