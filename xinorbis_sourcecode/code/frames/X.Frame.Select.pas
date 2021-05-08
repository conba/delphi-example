{
  (c) Paul Alan Freshney 2002-2020
  (c) Aardvark Digital 2002
  (c) Maximum Octopus Limted 2020

  www.freshney.org :: paul@freshney.org :: maximumoctopus.com :: xinorbis.com

        Started: January 16th 2002
  Last Modified: January 11th 2020
}

unit X.Frame.Select;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.DateUtils, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,

  TMSLogging,

  AdvObj, BaseGrid, AdvGrid, AdvUtil,
  Vcl.StdCtrls, Vcl.FileCtrl, FlCtrlEx,
  AdvSmoothTabPager, Vcl.Menus,

  X.Dialogs.Dialog, X.Dialogs.Save, X.Dialogs.Load,

  X.CReportInfo, X.GridUtility, X.Constants, X.GlobalObjects, X.GuiLogic, X.LanguageHandler,
  X.ThemeHelper,X.Windows, X.SystemGlobal;

type
  TFrameSelect = class(TFrame)
    pScanSelection: TAdvSmoothTabPager;
    tsSelectFolder: TAdvSmoothTabPage;
    dlbexMain: TDirectoryListBoxEx;
    dcbexMain: TDriveComboBoxEx;
    tsScanHistory: TAdvSmoothTabPage;
    sgScanHistory: TAdvStringGrid;
    Panel61: TPanel;
    bYesterday: TBitBtn;
    bLastMonth: TBitBtn;
    bAll: TBitBtn;
    bThisWeek: TBitBtn;
    bLastWeek: TBitBtn;
    puScanHistory: TPopupMenu;
    miExploreFromScanHistory: TMenuItem;
    N20: TMenuItem;
    miShowInFolderHistory: TMenuItem;
    puQuickFolder: TPopupMenu;
    miQFTitle: TMenuItem;
    N16: TMenuItem;
    miQFAdd: TMenuItem;
    N17: TMenuItem;
    ePath: TEdit;
    bThisMonth: TBitBtn;
    N1: TMenuItem;
    miSaveAs: TMenuItem;
    tsImportFromFile: TAdvSmoothTabPage;
    eFromReportPath: TEdit;
    mInfo: TMemo;
    sbGoPath: TSpeedButton;
    sbGoPathEdit: TSpeedButton;
    sbQuickFolder: TSpeedButton;
    sbExcludeFolders: TSpeedButton;
    sbExcludeFiles: TSpeedButton;
    sbCombine: TSpeedButton;
    sbExploreDir: TSpeedButton;
    bSelectImportFile: TSpeedButton;
    bLoadFromImportFile: TSpeedButton;
    procedure sbExploreDirClick(Sender: TObject);
    procedure sbGoPathEditClick(Sender: TObject);
    procedure sbExcludeFoldersClick(Sender: TObject);
    procedure sbExcludeFilesClick(Sender: TObject);
    procedure sbCombineClick(Sender: TObject);
    procedure sbQuickFolderClick(Sender: TObject);
    procedure ePathChange(Sender: TObject);
    procedure sgScanHistoryDblClick(Sender: TObject);
    procedure sgScanHistoryDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dlbexMainChange(Sender: TObject);
    procedure sbGoPathClick(Sender: TObject);
    procedure bAllClick(Sender: TObject);
    procedure bYesterdayClick(Sender: TObject);
    procedure bThisWeekClick(Sender: TObject);
    procedure bLastWeekClick(Sender: TObject);
    procedure bLastMonthClick(Sender: TObject);
    procedure pScanSelectionResize(Sender: TObject);
    procedure miShowInFolderHistoryClick(Sender: TObject);
    procedure puQuickFolderPopup(Sender: TObject);
    procedure ePathKeyPress(Sender: TObject; var Key: Char);
    procedure miExploreFromScanHistoryClick(Sender: TObject);
    procedure sgScanHistoryGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure miQFAddClick(Sender: TObject);
    procedure miQFTitleClick(Sender: TObject);
    procedure bThisMonthClick(Sender: TObject);
    procedure puScanHistoryPopup(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure bSelectImportFileClick(Sender: TObject);
    procedure bLoadFromImportFileClick(Sender: TObject);
  private
    FGetLeftOffset         : TGetLeftOffset;
    FGetTopOffset          : TGetTopOffset;

    FSystemEditing         : boolean;

    FScanWithNewPath       : TScanWithNewPath;
    FChangeFileHistorypath : TChangeFHPath;
    FScanWithMultiple      : TScanWithMultiple;

    QuickFolder            : array[1..QuickFolderCount] of TMenuItem;

    procedure LoadSettings;

    procedure ReportDetail(aFileName : string);
  public
    procedure Init;
    procedure SetTheme;
    procedure SaveSettings;

    procedure BuildScanHistoryTable(aRange : integer);

    procedure SetupQuickFolders;
    procedure UpdateQuickFolders;

    property OnChangeFHPath              : TChangeFHPath            read FChangeFileHistorypath   write FChangeFileHistorypath;
    property OnNewScan                   : TScanWithNewPath         read FScanWithNewPath         write FScanWithNewPath;
    property OnNewCombineScan            : TScanWithMultiple        read FScanWithMultiple        write FScanWithMultiple;

    property GetLeftOffset               : TGetLeftOffset           read FGetLeftOffset           write FGetLeftOffset;
    property GetTopOffset                : TGetTopOffset            read FGetTopOffset            write FGetTopOffset;
  end;


var
  FrameSelect : TFrameSelect;


implementation

{$R *.dfm}

uses
  System.UITypes,

  X.Form.Combine, X.Form.ExcludeFolders, X.Form.ExcludeFiles, X.CScanHistoryObject, X.Conversions,

  X.Settings, X.Global, X.Utility;


const
  sgScanHistoryDate = 0;
  sgScanHistoryTime = 1;
  sgScanHistoryPath = 2;
  sgScanHistoryExcludeFiles   = 3;
  sgScanHistoryExcludeFolders = 4;

  rangeAll       = 0;
  rangeYesterday = 1;
  rangeThisWeek  = 2;
  rangeThisMonth = 3;
  rangeLastWeek  = 4;
  rangeLastMonth = 5;


procedure TFrameSelect.Init;
begin
  FSystemEditing := False;

  sgScanHistory.HideColumns(3, 4);
  sgScanHistory.Cells[0, 0] := XText[rsDate];
  sgScanHistory.Cells[1, 0] := XText[rsTime];
  sgScanHistory.Cells[2, 0] := XText[rsFolder];

  pScanSelectionResize(Nil);

  miExploreFromScanHistory.Caption := XText[rsExploreFolder];
  miShowInFolderHistory.Caption    := XText[rsOpenInFileHistory];
  miSaveAs.Caption                 := XText[rsSaveAs] + rsEllipsis;

  sbGoPath.Caption            := XText[rsScan];
  sbGoPath.Width              := TUtility.ComponentWidth(dlbexMain.Canvas.TextWidth(XText[rsScan]) + 24, 82);
  ePath.Left                  := sbGoPath.Width + sbGoPath.Left + 6;
  ePath.Width                 := sbExploreDir.Left - ePath.Left - 6;

  miQFAdd.Caption             := XText[rsAddCurrentFolder];
  sbGoPathEdit.Caption        := XText[rsSelect];

  sbExcludeFolders.Caption    := XText[rsExclude];
  sbExcludeFiles.Caption      := XText[rsExclude];
  sbCombine.Caption           := XText[rsCombine];
  sbExploreDir.Caption        := XText[rsExplore];
  sbQuickFolder.Caption       := XText[rsFavourites];
  miQFTitle.Caption           := XText[rsFavourites];

  tsScanHistory.Caption       := XText[rsScanHistory];
  tsImportFromFile.Caption    := XText[rsImportScanDetail];
  tsSelectFolder.Caption      := XText[rsScanDriveFolder];

  bYesterday.Caption          := XText[rsYesterday];
  bLastMonth.Caption          := XText[rsLastMonth];
  bAll.Caption                := XText[rsAll];
  bThisWeek.Caption           := XText[rsThisWeek];
  bThisMonth.Caption          := XText[rsThisMonth];
  bLastWeek.Caption           := XText[rsLastWeek];

  // import

  bSelectImportFile.Caption   := XText[rsSelect];
  bLoadFromImportFile.Caption := XText[rsOpen];

  //

  SetTheme;

  LoadSettings;
end;


procedure TFrameSelect.SetTheme;
begin
  TThemeHelper.SetSmoothTabPager(pScanSelection);

  TThemeHelper.SetSmoothTabPage(tsSelectFolder);
  TThemeHelper.SetSmoothTabPage(tsImportFromFile);
  TThemeHelper.SetSmoothTabPage(tsScanHistory);
end;


procedure TFrameSelect.LoadSettings;
begin
  if XSettings.OpenSettings(True) then begin

    ePath.Text := XSettings.ReadStringFromSettings('Prefs', 'Main_Path', '');

    XSettings.CloseSettings;
  end
  else
    TMSLogger.Error('Error loading settings in FrameSelect');
end;


procedure TFrameSelect.SaveSettings;
begin
  if XSettings.OpenSettings(False) then begin
    XSettings.WriteStringToSettings('Prefs', 'Main_Path', ePath.Text);

    XSettings.CloseSettings;
  end
  else
    TMSLogger.Error('Error saving FrameSelect settings.');
end;


procedure TFrameSelect.miExploreFromScanHistoryClick(Sender: TObject);
begin
  if not(XSettings.ProcessWindowsVisible) then begin
    if sgScanHistory.Selection.Top > 0 then begin
      TXWindows.ExecuteFile(0, '"' + sgScanHistory.Cells[sgScanHistoryPath, sgScanHistory.Selection.Top] + '"', '', '')
    end;
  end;
end;

procedure TFrameSelect.miQFAddClick(Sender: TObject);
var
  t,idx : integer;

 begin
  if not(TUtility.QuickFolderExists(ePath.Text)) then begin
    idx := -1;

    for t := QuickFolderCount downto 1 do begin
      if XSettings.XSQuickFolder[t] = '' then
        idx := t;
    end;

    if (idx <> -1) and (ePath.Text <> '') then begin
      XSettings.XSQuickFolder[idx] := ePath.Text;

      UpdateQuickFolders;
    end;
  end
  else
    ShowXDialog(XText[rsWarning], XText[rsQuickFoldersAlreadyExists], XDialogTypeXinorbis);
end;

procedure TFrameSelect.miSaveAsClick(Sender: TObject);
var
  lFileName : string;

begin
  lFileName := TXSaveDialog.ExecuteReports(TUtility.GetDefaultFileName('.csv', XText[rsScanHistory]));

  if lFileName <> '' then begin
    TGridUtility.SaveGrid(sgScanHistory, lFileName);
  end;
end;

procedure TFrameSelect.miShowInFolderHistoryClick(Sender: TObject);
 begin
  if sgScanHistory.Selection.Top > 0 then begin

    if Assigned(FChangeFileHistorypath) then
      FChangeFileHistorypath(sgScanHistory.Cells[sgScanHistoryPath, sgScanHistory.Selection.Top]);
  end;
end;

procedure TFrameSelect.bThisMonthClick(Sender: TObject);
begin
  BuildScanHistoryTable(rangeThisMonth);
end;

procedure TFrameSelect.bThisWeekClick(Sender: TObject);
begin
  BuildScanHistoryTable(rangeThisWeek);
end;

procedure TFrameSelect.bYesterdayClick(Sender: TObject);
begin
  BuildScanHistoryTable(rangeYesterday);
end;

procedure TFrameSelect.bLastMonthClick(Sender: TObject);
begin
  BuildScanHistoryTable(rangeLastMonth);
end;

procedure TFrameSelect.bLoadFromImportFileClick(Sender: TObject);
begin
  if Assigned(FScanWithNewPath) then
    FScanWithNewPath(dataLatestScan, True, eFromReportPath.Text);
end;

procedure TFrameSelect.bSelectImportFileClick(Sender: TObject);
var
  lFileName : string;

begin
  lFileName := TXOpenDialog.Execute(XText[rsSupportedFileTypes] + ' (*.csv, *.zsr, *.zsr2)|*.csv; *.zsr; *.zsr2|' + XText[rsCSVFiles] + ' (*.csv)|*.csv|Xinorbis (*.zsr)|*.zsr|Xinorbis v2 (*.zsr2)|*.zsr2',
                                    '.csv',
                                    GSystemGlobal.AppDataPath + 'reports\',
                                    '');

  if lFileName <> '' then begin
    eFromReportPath.Text := lFileName;

    ReportDetail(lFileName);
  end;
end;

procedure TFrameSelect.bAllClick(Sender: TObject);
begin
  BuildScanHistoryTable(rangeAll);
end;

procedure TFrameSelect.bLastWeekClick(Sender: TObject);
begin
  BuildScanHistoryTable(rangeLastWeek);
end;

procedure TFrameSelect.dlbexMainChange(Sender: TObject);
begin
  ePath.Text := dlbexMain.Directory;
end;

procedure TFrameSelect.ePathChange(Sender: TObject);
begin
  if not(FSystemEditing) then begin
    GSystemGlobal.ExcludedFolders.Clear;
    GSystemGlobal.ExcludedFiles.Clear;
  end;
end;


procedure TFrameSelect.ePathKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    sbGoPathClick(Nil);
end;

procedure TFrameSelect.pScanSelectionResize(Sender: TObject);
begin
  sgScanHistory.ColWidths[sgScanHistoryDate] := 68;
  sgScanHistory.ColWidths[sgScanHistoryTime] := 40;
  sgScanHistory.ColWidths[sgScanHistoryPath] := sgScanHistory.Width - (23 + 68 + 40);
end;


procedure TFrameSelect.puQuickFolderPopup(Sender: TObject);
begin
  miQFAdd.Enabled := not(TUtility.QuickFolderExists(ePath.Text));
end;


procedure TFrameSelect.puScanHistoryPopup(Sender: TObject);
var
 lStatus : boolean;

begin
  lStatus := False;

  if sgScanHistory.Selection.Top > 0 then
    if sgScanHistory.Cells[sgScanHistoryTime, sgScanHistory.Selection.Top] <> '' then
      lStatus := True;

  miExploreFromScanHistory.Enabled := lStatus;
  miShowInFolderHistory.Enabled    := lStatus;
end;


procedure TFrameSelect.sbCombineClick(Sender: TObject);
begin
  if Assigned(FScanWithMultiple) then
    FScanWithMultiple(1);
end;


procedure TFrameSelect.sbExcludeFilesClick(Sender: TObject);
begin
  DoExcludedFiles(GSystemGlobal.ExcludedFiles);

  if GSystemGlobal.ExcludedFiles.Count <> 0 then
    sbExcludeFiles.Caption := XText[rsExclude] + ' (' + IntToStr(GSystemGlobal.ExcludedFiles.Count) + ')'
  else
    sbExcludeFiles.Caption := XText[rsExclude];
end;


procedure TFrameSelect.sbExcludeFoldersClick(Sender: TObject);
begin
  DoExcludedFolders(GSystemGlobal.ExcludedFolders, GSystemGlobal.ExcludeVirtual);

  if GSystemGlobal.ExcludedFolders.Count <> 0 then
    sbExcludeFolders.Caption := XText[rsExclude] + ' (' + IntToStr(GSystemGlobal.ExcludedFolders.Count) + ')'
  else
    sbExcludeFolders.Caption := XText[rsExclude];
end;


procedure TFrameSelect.sbExploreDirClick(Sender: TObject);
begin
  if System.SysUtils.DirectoryExists(ePath.Text) then
    TXWindows.ExecuteFile(0, '"' + ePath.Text + '"', '', '')
  else
    ShowXDialog(XText[rsError],
                XText[rsFolderDoesNotExist],
                XDialogTypeWarning);
end;


procedure TFrameSelect.sbGoPathClick(Sender: TObject);
begin
  if not(XSettings.ProcessWindowsVisible) then begin
    GScanDetails[dataLatestScan].MultipleList.Clear;

    TMSLogger.Info(XText[rsStarted] + ePath.Text + '"');

    if System.SysUtils.DirectoryExists(ePath.Text) then begin
      FSystemEditing := True;

      if ePath.Text[length(ePath.Text)] <> '\' then
        ePath.Text := ePath.Text + '\';

      FSystemEditing := False;

      if Assigned(FScanWithNewPath) then
        FScanWithNewPath(dataLatestScan, False, ePath.Text);
    end
    else
      ShowXDialog(XText[rsWarning], XText[rsFolderDoesNotExist], XDialogTypeWarning);
  end;
end;

procedure TFrameSelect.sbGoPathEditClick(Sender: TObject);
 var
  str : string;

 begin
  str := TXWindows.BrowseForFolder(Handle);

  if str <> '' then begin
    ePath.Text := str;

    GSystemGlobal.ExcludedFolders.Clear;
    GSystemGlobal.ExcludedFiles.Clear;

    if ePath.Text[2] = ':' then begin
      dcbexMain.Drive     := str[1];
      dlbexMain.Directory := str;
    end;
  end;
end;

procedure TFrameSelect.sbQuickFolderClick(Sender: TObject);
begin
  puQuickFolder.Popup(FGetLeftOffset + sbQuickFolder.Left,
                      FGetTopOffset + pScanSelection.Top + 148);
end;

procedure TFrameSelect.sgScanHistoryDblClick(Sender: TObject);
var
  s : string;
  ret : word;

begin
  s := sgScanHistory.Cells[sgScanHistoryPath, sgScanHistory.Selection.Top];

  if System.SysUtils.DirectoryExists(s) then begin
    ePath.Text := s;

    ret := mrYes;

    if (sgScanHistory.Cells[sgScanHistoryExcludeFiles, sgScanHistory.Selection.Top] <> '') or
       (sgScanHistory.Cells[sgScanHistoryExcludeFolders, sgScanHistory.Selection.Top] <> '') then begin

      ret := MessageDlg(XText[rsContainsExclusions] + #13#13 +
                        sgScanHistory.Cells[sgScanHistoryExcludeFiles,
                        sgScanHistory.Selection.Top] + #13 +
                        sgScanHistory.Cells[sgScanHistoryExcludeFolders, sgScanHistory.Selection.Top],
                        mtWarning, [mbYes, mbNo, mbCancel], 0);

      if ret = mrYes then begin
        TUtility.StringToExcludedFiles(sgScanHistory.Cells[sgScanHistoryExcludeFiles, sgScanHistory.Selection.Top]);
        TUtility.StringToExcludedFolders(sgScanHistory.Cells[sgScanHistoryExcludeFolders, sgScanHistory.Selection.Top]);
      end;

      if ret = mrNo then begin
        GSystemGlobal.ExcludedFiles.Clear;
        GSystemGlobal.ExcludedFolders.Clear;
      end;
    end;

    if ret <> mrCancel then begin
      if Assigned(FScanWithNewPath) then
        FScanWithNewPath(dataLatestScan, False, ePath.Text);
    end;
  end
  else
    ShowXDialog(XText[rsWarning], XText[rsFolderDoesNotExist], XDialogTypeWarning);
end;

procedure TFrameSelect.sgScanHistoryDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if ARow > 0 then begin
    if (TAdvStringGrid(Sender).Cells[sgScanHistoryExcludeFolders, ARow] <> '') or (TAdvStringGrid(Sender).Cells[sgScanHistoryExcludeFiles, ARow] <> '') then
      TAdvStringGrid(Sender).Canvas.Font.Style := [fsItalic]
    else
      TAdvStringGrid(Sender).Canvas.Font.Style := [];
  end;
end;


procedure TFrameSelect.sgScanHistoryGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if gdSelected in AState then
    ABrush.Color := CGridColourSelected
  else begin
    if Odd(ARow) then
      ABrush.Color := CGridColourOn
    else
      ABrush.Color := CGridColourOff;
  end;
end;


procedure TFrameSelect.BuildScanHistoryTable(aRange : integer);
var
  t : integer;
  tsho : TScanHistoryObject;
  lFrom, lTo, lCount : integer;

begin
  lCount := 0;

  if (ScanHistory.Count <> 0) then begin
    case aRange of
      rangeAll       : begin
                         lFrom := 00000000;
                         lTo   := 99999999;
                       end;
      rangeYesterday : begin
                         lFrom := TConvert.DateToYYYYMMDDI(IncDay(Now, -1));
                         lTo   := TConvert.DateToYYYYMMDDI(IncDay(Now, -1));
                       end;
      rangeThisWeek  : begin
                         lFrom := TConvert.DateToYYYYMMDDI(IncMonth(Now, -7));
                         lTo   := TConvert.DateToYYYYMMDDI(Now);
                       end;
      rangeThisMonth : begin
                         lFrom := TConvert.DateToYYYYMMDDI(IncDay(Now, -31));
                         lTo   := TConvert.DateToYYYYMMDDI(Now);
                       end;
      rangeLastWeek  : begin
                         lFrom := TConvert.DateToYYYYMMDDI(IncDay(Now, -14));
                         lTo   := TConvert.DateToYYYYMMDDI(IncDay(Now, -7));
                       end;
      rangeLastMonth : begin
                         lFrom := TConvert.DateToYYYYMMDDI(StartOfTheMonth(IncMonth(Now, -1)));
                         lTo   := TConvert.DateToYYYYMMDDI(EndOfTheMonth(IncMonth(Now, -1)));
                       end;
    else
      lFrom := 00000000;
      lTo   := 99999999;
    end;

    sgScanHistory.ClearRows(1, FrameSelect.sgScanHistory.RowCount - 1);
    sgScanHistory.RowCount := 2;

    for t := 0 to ScanHistory.Count - 1 do begin
      tsho := ScanHistory[t];

      if (tsho.DateI >= lFrom) and (tsho.DateI <= lTo) then begin
        sgScanHistory.Cells[sgScanHistoryDate, sgScanHistory.RowCount - 1]           := TConvert.IntDateToString(tsho.DateI);
        sgScanHistory.Cells[sgScanHistoryTime, sgScanHistory.RowCount - 1]           := tsho.TimeI;
        sgScanHistory.Cells[sgScanHistoryPath, sgScanHistory.RowCount - 1]           := tsho.Path;
        sgScanHistory.Cells[sgScanHistoryExcludeFiles, sgScanHistory.RowCount - 1]   := tsho.ExcludeFiles;
        sgScanHistory.Cells[sgScanHistoryExcludeFolders, sgScanHistory.RowCount - 1] := tsho.ExcludeFolders;

        sgScanHistory.RowCount := sgScanHistory.RowCount + 1;

        inc(lCount);
      end;
    end;

    if  sgScanHistory.Cells[sgScanHistoryDate, 1] = '' then begin
      sgScanHistory.Cells[sgScanHistoryDate, sgScanHistory.RowCount - 1]           := XText[rsNoneFound];
      sgScanHistory.Cells[sgScanHistoryTime, sgScanHistory.RowCount - 1]           := '';
      sgScanHistory.Cells[sgScanHistoryPath, sgScanHistory.RowCount - 1]           := '';
      sgScanHistory.Cells[sgScanHistoryExcludeFiles, sgScanHistory.RowCount - 1]   := '';
      sgScanHistory.Cells[sgScanHistoryExcludeFolders, sgScanHistory.RowCount - 1] := '';
    end;
  end
  else begin
    sgScanHistory.RowCount := 2;

    sgScanHistory.Cells[sgScanHistoryDate, 1]           := '----';
    sgScanHistory.Cells[sgScanHistoryTime, 1]           := '----';
    sgScanHistory.Cells[sgScanHistoryPath, 1]           := '----';
    sgScanHistory.Cells[sgScanHistoryExcludeFiles, 1]   := '';
    sgScanHistory.Cells[sgScanHistoryExcludeFolders, 1] := '';
  end;

  tsScanHistory.Caption := XText[rsScanHistory] + ' (' + IntToStr(lCount) + ')';
end;


procedure TFrameSelect.SetupQuickFolders;
 var
  t : integer;

 begin
  for t := 1 to QuickFolderCount do
    QuickFolder[t] := Nil;

  for t := 1 to QuickFolderCount do begin
    if XSettings.XSQuickFolder[t] <> '' then begin
      QuickFolder[t] := TMenuItem.Create(Self);

      with QuickFolder[t] do begin
        Caption  := XSettings.XSQuickFolder[t];
        Tag      := t;
        OnClick  := miQFTitleClick;
      end;

      FrameSelect.puQuickFolder.Items.Add(QuickFolder[t]);
    end;
  end;
end;


procedure TFrameSelect.UpdateQuickFolders;
 var
  t : integer;

 begin
  for t := 1 to QuickFolderCount do begin
    if QuickFolder[t] <> Nil then
      QuickFolder[t].Free;
  end;

  for t := 1 to QuickFolderCount do begin
    if XSettings.XSQuickFolder[t] <> '' then begin
      QuickFolder[t] := TMenuItem.Create(Self);

      with QuickFolder[t] do begin
        Caption  := XSettings.XSQuickFolder[t];
        Tag      := t;
        OnClick  := miQFTitleClick;
      end;

      puQuickFolder.Items.Add(QuickFolder[t]);
    end;
  end;
end;


procedure TFrameSelect.miQFTitleClick(Sender: TObject);
 begin
  ePath.Text := XSettings.XSQuickFolder[TMenuItem(Sender).Tag];
end;


procedure TFrameSelect.ReportDetail(aFileName : string);
begin
  mInfo.Clear;

  if Pos('.ZSR2', UpperCase(aFileName)) > 0 then begin
    TReportInfo.GetInfoXinorbis2Report(aFileName, mInfo);
  end
  else if Pos('.ZSR', UpperCase(aFileName)) > 0 then begin
    TReportInfo.GetInfoXinorbisReport(aFileName, mInfo);
  end
  else if Pos('.CSV', UpperCase(aFileName)) > 0 then begin
    TReportInfo.GetInfoCSVReport(aFileName, mInfo);
  end
  else begin
    mInfo.Lines.Add(XText[rsReport] + ': ' + XText[rsUnknown]);
  end;
end;


end.
