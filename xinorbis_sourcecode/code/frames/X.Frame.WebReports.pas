{
  (c) Paul Alan Freshney 2002-2020
  (c) Aardvark Digital 2002
  (c) Maximum Octopus Limted 2020

  www.freshney.org :: paul@freshney.org :: maximumoctopus.com :: xinorbis.com

        Started: January 16th 2019
  Last Modified: January 11th 2020
}


unit X.Frame.WebReports;


interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,

  X.FindFile, X.Form.ReportOptions,

  X.Thread.WebReports, X.LanguageHandler, X.Windows, X.SystemGlobal;

type
  TFrameWebReports = class(TFrame)
    pWelcomeWebReports: TPanel;
    sbWebReportsSetup: TSpeedButton;
    sbWebReportsUpdate: TSpeedButton;
    sbWebUploadView: TSpeedButton;
    lWebReportsProgress: TLabel;
    mWebReports: TMemo;
    procedure sbWebReportsSetupClick(Sender: TObject);
    procedure sbWebReportsUpdateClick(Sender: TObject);
    procedure sbWebUploadViewClick(Sender: TObject);

    procedure WebReportsThreadOnTerminate(Sender : TObject);
  private
    tfg : TextFile;

    procedure OnFoundFile(const rt, sp, dt, aFileName : string; aSize : int64);
  public
    procedure Init;
    procedure RebuildReportList;
  end;


var
  FrameWebReports : TFrameWebReports;


implementation


{$R *.dfm}


uses
  X.Dialogs.Dialog, X.ScanAnalysis,

  X.Conversions, X.Constants, X.GlobalObjects,

  X.Global, X.Settings, X.Utility;


procedure TFrameWebReports.Init;
begin
  sbWebReportsSetup.Caption  := XText[rsConfigure];
  sbWebReportsUpdate.Caption := XText[rsUpload];
  sbWebUploadView.Caption    := XText[rsView];

  if not(FileExists(GSystemGlobal.AppDataPath + 'Reports\reportlist.dat')) then
    FrameWebReports.RebuildReportList;
end;


procedure TFrameWebReports.sbWebReportsSetupClick(Sender: TObject);
begin
  DoReportSettings(9);
end;


procedure TFrameWebReports.RebuildReportList;
var
  lXinorbisScan : TXinorbisScan;
begin
  lXinorbisScan := TXinorbisScan.Create(1);
  lXinorbisScan.OnFoundFile := OnFoundFile;

  AssignFile(tfg, GSystemGlobal.AppDataPath + 'Reports\reportlist.dat');

  {$I-}
  Rewrite(tfg);
  {$I+}

  if IOResult <> 0 then begin
    ShowXDialog(XText[rsErrorTitle],
                XText[rsErrorOpening] + ' "' + GSystemGlobal.AppDataPath + 'Reports\reportlist.dat',
                XDialogTypeWarning);
  end
  else begin
    lXinorbisScan.Scan;

    CloseFile(tfg);
  end;

  FreeAndNil(lXinorbisScan);
end;


procedure TFrameWebReports.OnFoundFile(const rt, sp, dt, aFileName : string; aSize : int64);
begin
  Writeln(tfg, rt + ';' + sp + ';' + dt + ';' + aFileName + ';' + TConvert.ConvertToUsefulUnit(aSize) + ';');
end;


procedure TFrameWebReports.sbWebReportsUpdateClick(Sender: TObject);
begin
  if (XSettings.FTPSettingsValid) then begin
    mWebReports.Lines.Add('');
    mWebReports.Lines.Add(XText[rsBuildingWebReports]);
    mWebReports.Lines.Add('');

    RebuildReportList;

    GWebReportsThread :=  TWebReportsThread.Create(True);
    GWebReportsThread.SetData(lWebReportsProgress, lWebReportsProgress{lWelcomeWebReports}, mWebReports);
    GWebReportsThread.OnTerminate := WebReportsThreadOnTerminate;
    GWebReportsThread.Start;
  end
  else
    ShowXDialog(XText[rsWebReports], XText[rsWebReportsSettingsMissing], XDialogTypeXinorbis);
end;


procedure TFrameWebReports.WebReportsThreadOnTerminate(Sender : TObject);
begin
  GWebReportsThread := Nil;
end;


procedure TFrameWebReports.sbWebUploadViewClick(Sender: TObject);
begin
  TXWindows.ExecuteFile(0, XSettings.ftpOptions[ftpActualLink], '', '');
end;


end.
