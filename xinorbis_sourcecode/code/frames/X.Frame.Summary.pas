{
  (c) Paul Alan Freshney 2002-2020
  (c) Aardvark Digital 2002
  (c) Maximum Octopus Limted 2020

  www.freshney.org :: paul@freshney.org :: maximumoctopus.com :: xinorbis.com

        Started: January 16th 2019
  Last Modified: January 11th 2020
}

unit X.Frame.Summary;


interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HTMLabel, GDIPFill,
  AdvSmoothCapacityBar, Vcl.Buttons, X.Gauge, Vcl.StdCtrls,
  Vcl.ExtCtrls, X.GuiLogic,

  X.CSummaryReports,

  X.LanguageHandler, X.GlobalObjects, X.SystemGlobal, X.Windows, X.ThemeHelper,
  AdvSmoothTabPager;


type
  TframeSummary = class(TFrame)
    pScanSelection: TAdvSmoothTabPager;
    tsSelectFolder: TAdvSmoothTabPage;
    tsImportFromFile: TAdvSmoothTabPage;
    pMainSummary: TPanel;
    lSNoF: TLabel;
    lSNoFx: TLabel;
    lSNoD: TLabel;
    lSNoDx: TLabel;
    lSSoF: TLabel;
    lSSoFx: TLabel;
    lSSoFoD: TLabel;
    lSSoFoDx: TLabel;
    lAFF: TLabel;
    lAFSx: TLabel;
    lAFS: TLabel;
    lAFFx: TLabel;
    lLF: TLabel;
    lLDSize: TLabel;
    lLUSize: TLabel;
    gSLDSize: TXGauge;
    gSLUSize: TXGauge;
    gSLF: TXGauge;
    lNDx: TLabel;
    lND: TLabel;
    lNFx: TLabel;
    lNF: TLabel;
    lSProcessTime: TLabel;
    capSummaryQuantity: TAdvSmoothCapacityBar;
    capSummarySize: TAdvSmoothCapacityBar;
    lSummaryByQuantity: TLabel;
    lSummaryBySize: TLabel;
    gSLDCount: TXGauge;
    lLDCount: TLabel;
    lLDxSize: THTMLabel;
    lLDxCount: THTMLabel;
    gSLUCount: TXGauge;
    lLUCount: TLabel;
    lLUxCount: THTMLabel;
    lLUxSize: THTMLabel;
    lSScanPath: TLabel;
    lLFx: THTMLabel;
    Panel2: TPanel;
    gSThisFolder: TXGauge;
    lSThisFolder: TLabel;
    lSDSpaceUsed: TLabel;
    lSVolName: TLabel;
    lSVolMax: TLabel;
    lSVolMaxx: TLabel;
    lSVolNamex: TLabel;
    lSSerial: TLabel;
    lSVolFree: TLabel;
    lSVolFreex: TLabel;
    lSFileSystem: TLabel;
    lSFileSystemx: TLabel;
    lSSerialx: TLabel;
    gSFS: TXGauge;
    sbSaveSummary: TSpeedButton;
    procedure sbSaveSummaryClick(Sender: TObject);
    procedure lSNoFxClick(Sender: TObject);
    procedure lAFSxClick(Sender: TObject);
    procedure lLFxClick(Sender: TObject);
    procedure lNFxClick(Sender: TObject);
    procedure lLUxSizeClick(Sender: TObject);
    procedure lLDxSizeClick(Sender: TObject);
    procedure lSNoDxClick(Sender: TObject);
    procedure lSScanPathClick(Sender: TObject);
  private
    FSource : integer;

    FOnReportsChange  : TMainReportsChange;
    FSetStatusBarText : TSetStatusBarText;
  public
    procedure Init;
    procedure SetTheme;

    procedure BuildCapacityBars(aDataIndex : integer);
    procedure BuildDriveSection(aDataIndex : integer);
    procedure BuildFileFolders(aNullFileCount, aNullFolderCount : integer);
    procedure BuildLargestFile(aSFolder, aSSize, aSPercent, aCFolder, aCSize, aCPercent : string);
    procedure BuildPreamble;
    procedure SetChart(aChart : TXGauge; aNumerator, aDenominator : int64);

    property OnReportsChange    : TMainReportsChange Read FOnReportsChange  Write FOnReportsChange;
    property OnSetStatusBarText : TSetStatusBarText  Read FSetStatusBarText Write FSetStatusBarText;

    property Source             : integer            read FSource           write FSource;
  end;


implementation

{$R *.dfm}


uses
  X.Dialogs.Save,

  X.Settings, X.Global, X.Constants, X.Utility, X.Conversions;


procedure TFrameSummary.Init;

  function FormatForScreen(const s : string): string;
    begin
     Result := StringReplace(s,      ':', ' ', [rfReplaceAll]);
     Result := StringReplace(Result, '\', ' ', [rfReplaceAll]);

     Result := Trim(Result);
  end;

begin
  lSummaryBySize.Caption     := XText[rsBySize];
  lSummaryByQuantity.Caption := XText[rsByQuantity];

  //== configure summary panel =================================================
  lSNoF.Caption        := FormatForScreen(SummaryReport[1]);
  lSNoD.Caption        := FormatForScreen(SummaryReport[2]);
  lSSoF.Caption        := FormatForScreen(SummaryReport[3]);
  lSSoFoD.Caption      := FormatForScreen(SummaryReport[4]);
  lAFS.Caption         := FormatForScreen(SummaryReport[8]);
  lAFF.Caption         := FormatForScreen(SummaryReport[9]);
  lNF.Caption          := FormatForScreen(SummaryReport[6]);
  lND.Caption          := FormatForScreen(SummaryReport[7]);
  lLDSize.Caption      := FormatForScreen(SummaryReport[10] + ' (' + lSSoF.Caption + ')');
  lLDCount.Caption     := FormatForScreen(SummaryReport[10] + ' (' + lSNoF.Caption + ')');
  lLF.Caption          := FormatForScreen(SummaryReport[12]);
  lLUSize.Caption      := FormatForScreen(SummaryReport[13] + ' (' + lSSoF.Caption + ')');
  lLUCount.Caption     := FormatForScreen(SummaryReport[13] + ' (' + lSNoF.Caption + ')');

  lSVolName.Caption    := FormatForScreen(DriveReport[7]);
  lSSerial.Caption     := FormatForScreen(DriveReport[8]);
  lSFileSystem.Caption := FormatForScreen(DriveReport[9]);
  lSVolMax.Caption     := FormatForScreen(DriveReport[1]);
  lSVolFree.Caption    := FormatForScreen(DriveReport[2]);

  if lSThisFolder.Canvas.TextWidth(XText[rsFolder]) < 80 then
    lSThisFolder.Left := gSThisFolder.Left + (Round((80 - lSThisFolder.Canvas.TextWidth(XText[rsFolder])) / 2));
  lSThisFolder.Caption := XText[rsFolder];

  if lSDSpaceUsed.Canvas.TextWidth(XText[rsUsedSpace]) < 80 then
    lSDSpaceUsed.Left := gSFS.Left + (Round((80 - lSDSpaceUsed.Canvas.TextWidth(XText[rsUsedSpace])) / 2));
  lSDSpaceUsed.Caption := XText[rsUsedSpace];

  tsSelectFolder.Caption := XText[rsSummary];
  tsImportFromFile.Caption := XText[rsORIReport9];

  SetTheme;
end;


procedure TframeSummary.SetTheme;
begin
  TThemeHelper.SetSmoothTabPager(pScanSelection);

  TThemeHelper.SetSmoothTabPage(tsSelectFolder);
  TThemeHelper.SetSmoothTabPage(tsImportFromFile);
end;


procedure TframeSummary.lAFSxClick(Sender: TObject);
begin
  if Assigned(FOnReportsChange) then
    FOnReportsChange(TabIndexMagnitude);
end;


procedure TframeSummary.lLDxSizeClick(Sender: TObject);
begin
  if Assigned(FOnReportsChange) then
    FOnReportsChange(TabIndexFolder);
end;


procedure TframeSummary.lLFxClick(Sender: TObject);
begin
  if Assigned(FOnReportsChange) then
    FOnReportsChange(TabIndexTop50);
end;


procedure TframeSummary.lLUxSizeClick(Sender: TObject);
begin
  if Assigned(FOnReportsChange) then
    FOnReportsChange(TabIndexUsers);
end;

procedure TframeSummary.lNFxClick(Sender: TObject);
begin
  if Assigned(FOnReportsChange) then
    FOnReportsChange(TabIndexNull);
end;


procedure TframeSummary.lSNoDxClick(Sender: TObject);
begin
  if Assigned(FOnReportsChange) then
    FOnReportsChange(TabIndexFolder);
end;

procedure TframeSummary.lSNoFxClick(Sender: TObject);
begin
  if Assigned(FOnReportsChange) then
    FOnReportsChange(TabIndexMain);
end;


procedure TframeSummary.lSScanPathClick(Sender: TObject);
begin
  TXWindows.ExecuteFile(0, TLabel(Sender).Caption, '', '');
end;


procedure TFrameSummary.sbSaveSummaryClick(Sender: TObject);
var
  lFileName : string;

begin
  lFileName := TXSaveDialog.Execute(XText[rsTextFiles] + ' (*.txt)|*.txt',
                                    '.txt',
                                    TUtility.GetDefaultFileName('.txt', XText[rsSummary] + '_' + XText[rsReport]));

  if lFileName <> '' then begin
    GReportSummary.SaveSummary(FSource, lFileName);
  end;
end;


procedure TFrameSummary.BuildCapacityBars(aDataIndex : integer);
var
  t : integer;
  lCapacityItem : TCapacityItem;

begin
  capSummaryQuantity.Items.Clear;
  capSummarySize.Items.Clear;

  for t := 1 to __FileCategoriesCount do begin
    if (GScanDetails[aDataIndex].FileCount <> 0) then begin
      if GScanDetails[aDataIndex].ExtensionSpread[t, 1] <> 0 then begin
        lCapacityItem := capSummaryQuantity.Items.Add;

        lCapacityItem.Value       := (GScanDetails[aDataIndex].ExtensionSpread[t, 1] / GScanDetails[aDataIndex].FileCount) * 100;
        lCapacityItem.Color       := GSystemGlobal.FileCategoryColors[t];
        lCapacityItem.ColorTo     := GSystemGlobal.FileCategoryColors[t];
        lCapacityItem.DisplayName := TypeDescriptions[t];
        lCapacityItem.Description := TypeDescriptions[t];
        lCapacityItem.Hint        := TypeDescriptions[t] + ' (' + IntToStr(GScanDetails[aDataIndex].ExtensionSpread[t, 1]) + ' ' + XText[rsFiles] + ')';
      end;
    end;

    if GScanDetails[aDataIndex].TotalSize <> 0 then begin
      if GScanDetails[aDataIndex].ExtensionSpread[t, 2] <> 0 then begin
        lCapacityItem := capSummarySize.Items.Add;

        lCapacityItem.Value       := (GScanDetails[aDataIndex].ExtensionSpread[t, 2] / GScanDetails[aDataIndex].TotalSize) * 100;
        lCapacityItem.Color       := GSystemGlobal.FileCategoryColors[t];
        lCapacityItem.ColorTo     := GSystemGlobal.FileCategoryColors[t];
        lCapacityItem.DisplayName := TypeDescriptions[t];
        lCapacityItem.Description := TypeDescriptions[t];
        lCapacityItem.Hint        := TypeDescriptions[t] + ' (' + TConvert.ConvertToUsefulUnit(GScanDetails[aDataIndex].ExtensionSpread[t, 2]) + ')';
      end;
    end;
  end;
end;


procedure TFrameSummary.BuildDriveSection(aDataIndex : integer);
var
  lDriveDetails : TXDriveDetails;

begin
  lSVolNamex.Visible     := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSSerialx.Visible      := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSFileSystemx.Visible  := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSVolMaxx.Visible      := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSVolFreex.Visible     := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSVolName.Visible      := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSSerial.Visible       := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSFileSystem.Visible   := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSVolMax.Visible       := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSVolFree.Visible      := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  gSThisFolder.Visible   := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSThisFolder.Visible   := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  gSFS.Visible           := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);
  lSDSpaceUsed.Visible   := GScanDetails[aDataIndex].ScanSource <> (ScanSourceFileCSV or ScanSourceLiveShare or ScanSourceFolderHistory);

  if (GScanDetails[aDataIndex].ScanSource <> ScanSourceFileCSV) and
     (GScanDetails[aDataIndex].ScanSource <> ScanSourceLiveShare) and
     (GScanDetails[aDataIndex].ScanSource <> ScanSourceFolderHistory) then begin

    lDriveDetails := TXWindows.GetDriveDetails(GScanDetails[aDataIndex].ScanPath[1]);

    lSVolNamex.Caption     := lDriveDetails.VolumeName;
    lSSerialx.Caption      := lDriveDetails.SerialNumber + ' ($' + lDriveDetails.SerialNumberHex + ')';
    lSFileSystemx.Caption  := lDriveDetails.FileSystem;

    if GSystemGlobal.drivespacemax > 0 then begin
      lSVolMaxx.Caption      := TConvert.ConvertToUsefulUnit(GSystemGlobal.drivespacemax);
      lSVolFreex.Caption     := TConvert.ConvertToUsefulUnit(GSystemGlobal.drivespacefree);

      gSThisFolder.SetDisplay((GScanDetails[aDataIndex].TotalSize / GSystemGlobal.drivespacemax) * 100);
      gSFS.SetDisplay(100 - (GSystemGlobal.drivespacefree / GSystemGlobal.drivespacemax) * 100);
    end
    else begin
      lSVolMaxx.Caption      := 'n/a';
      lSVolFreex.Caption     := 'n/a';

      gSThisFolder.SetDisplay(0);
      gSFS.SetDisplay(0);
    end;
  end
  else begin
    gSThisFolder.SetDisplay(0);
    gSFS.SetDisplay(0);
  end;
end;


procedure TFrameSummary.BuildFileFolders(aNullFileCount, aNullFolderCount : integer);
begin
  lSNoFx.Caption     := IntToStr(GScanDetails[FSource].FileCount);
  lSNoDx.Caption     := IntToStr(GScanDetails[FSource].FolderCount);

  lSSoFx.Caption     := TConvert.ConvertToUsefulUnit(GScanDetails[FSource].TotalSize);

  if drivesectorsize <> 0 then
    lSSoFoDx.Caption   := TConvert.ConvertToUsefulUnit(GScanDetails[FSource].TotalSizeOD)
  else
    lSSoFoDx.Caption   := '-';

  if GScanDetails[FSource].FileCount <> 0 then
    lAFSx.Caption    := TConvert.ConvertToUsefulUnit(Round(GScanDetails[FSource].TotalSize / GScanDetails[FSource].FileCount))
  else
    lAFSx.Caption    := '-';

  if GScanDetails[FSource].FolderCount <> 0 then
    lAFFx.Caption    := FloatToStrF(GScanDetails[FSource].FileCount / GScanDetails[FSource].FolderCount, ffFixed, 7, 2, XinorbisFormatSettings)
  else
    lAFFx.Caption    := '-';

  lNFx.Caption       := IntToStr(aNullFileCount);
  lNDx.Caption       := IntToStr(aNullFolderCount);
end;


procedure  TFrameSummary.BuildLargestFile(aSFolder, aSSize, aSPercent, aCFolder, aCSize, aCPercent : string);
begin
  if aSFolder <> '\' then
    lLDxSize.HTMLText[0]   := '\' + aSFolder + '\ (<b>' + aSSize + '</b>, <b>' + aSPercent + '</b> of files)'
  else
    lLDxSize.HTMLText[0]   := '&lt;root&gt; (<b>' + aSSize + '</b>, <b>' + aSPercent + '</b> of files)';

  if aCFolder <> '\' then
    lLDxCount.HTMLText[0]  := '\' + aCFolder + '\ (<b>' + aCSize + '</b>, <b>' + aCPercent + '</b> of files)'
  else
    lLDxCount.HTMLText[0]  := '&lt;root&gt; (<b>' + aCSize + '</b>, <b>' + aCPercent + '</b> of files)';
end;


procedure TFrameSummary.BuildPreamble;
var
  t : integer;

begin
  if XSettings.LastScanMultiple then begin
    lSScanPath.Caption := XText[rsMultipleFolders];
    lSScanPath.Hint    := '';

    for t := 0 to GScanDetails[FSource].MultipleList.Count - 1 do begin
      lSScanPath.Hint := lSScanPath.Hint + GScanDetails[FSource].MultipleList[t];

      if t <> GScanDetails[FSource].MultipleList.Count - 1 then
        lSScanPath.Hint := lSScanPath.Hint + #13;
    end;
  end
  else begin
    lSScanPath.Caption := GScanDetails[FSource].ScanPath; // was .htmltext
    lSScanPath.Hint    := GScanDetails[FSource].ScanPath;
  end;
end;


procedure TFrameSummary.SetChart(aChart : TXGauge; aNumerator, aDenominator : int64);
begin
  if aDenominator <> 0 then
    aChart.SetDisplay((aNumerator / aDenominator) * 100)
  else
    aChart.SetDisplay(100);
end;


end.
