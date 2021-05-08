{
  (c) Paul Alan Freshney 2002-2020
  (c) Aardvark Digital 2002
  (c) Maximum Octopus Limted 2020

  www.freshney.org :: paul@freshney.org :: maximumoctopus.com :: xinorbis.com

        Started: January 16th 2019
  Last Modified: January 12th 2020
}

unit X.Frame.Navigation;


interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, System.UITypes,
  VclTee.TeeGDIPlus, Vcl.Menus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, Vcl.StdCtrls, HTMLabel, Vcl.Buttons, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, Vcl.ExtCtrls, AdvSplitter, System.ImageList, Vcl.ImgList,

  TMSLogging,

  X.Dialogs.Save, X.Dialogs.Colour, X.Form.ChartOptions,

  X.Form.GetCopyMove, X.Form.ShowMD5, X.Dialogs.Dialog,

  X.ChartUtility, X.GuiLogic, X.LanguageHandler, X.MD5, X.Formatting, X.SystemGlobal,
  X.Windows, X.ZipFiles,

  X.Thread.NavigateRight;


const
  __ChartCount = 1;


type
  TFrameNavigation = class(TFrame)
    pMainNavigation: TPanel;
    Splitter4: TAdvSplitter;
    Panel25: TPanel;
    sgNavigation: TAdvStringGrid;
    Panel2: TPanel;
    sbNMCreated: TSpeedButton;
    sbNMAccessed: TSpeedButton;
    sbNMModified: TSpeedButton;
    sbNMUsers: TSpeedButton;
    sbNMAttributes: TSpeedButton;
    sbNMColourCode: TSpeedButton;
    sbNMSizeOnDisk: TSpeedButton;
    sbNLFilter: TSpeedButton;
    Panel26: TPanel;
    Splitter5: TAdvSplitter;
    Panel27: TPanel;
    sbNavigationBack: TSpeedButton;
    sbNSBCreated: TSpeedButton;
    sbNSBAccessed: TSpeedButton;
    sbNSBModified: TSpeedButton;
    sbNSBUsers: TSpeedButton;
    sbNSBAttributes: TSpeedButton;
    sbNSBColourCode: TSpeedButton;
    sbNSBSizeOnDisk: TSpeedButton;
    sbNRFilter: TSpeedButton;
    lNavigationDetails: THTMLabel;
    sgNavigationSide: TAdvStringGrid;
    vtcFSMain: TChart;
    Series3: TPieSeries;
    puNavigateOptions: TPopupMenu;
    miPUNO1: TMenuItem;
    miPUNO2: TMenuItem;
    miPUNO3: TMenuItem;
    miPUNO4: TMenuItem;
    miPUNO5: TMenuItem;
    miPUNO6: TMenuItem;
    miPUNO7: TMenuItem;
    miPUNO8: TMenuItem;
    miPUNO9: TMenuItem;
    miNOCustom: TMenuItem;
    miPUNO10: TMenuItem;
    miPUNO11: TMenuItem;
    miPUNO12: TMenuItem;
    miPUNO13: TMenuItem;
    miPUNO14: TMenuItem;
    miPUNO15: TMenuItem;
    miPUNO16: TMenuItem;
    miPUNO17: TMenuItem;
    miPUNO18: TMenuItem;
    miPUNO19: TMenuItem;
    puCharts: TPopupMenu;
    miChartOptions: TMenuItem;
    N9: TMenuItem;
    miCOSave: TMenuItem;
    miCOCopy: TMenuItem;
    miCOAdvanced: TMenuItem;
    XFNImages: TImageList;
    puSearch: TPopupMenu;
    miSearchOpen: TMenuItem;
    miSearchOpenCustom: TMenuItem;
    N4: TMenuItem;
    miExploreDirectory: TMenuItem;
    miSFileProperties: TMenuItem;
    miGenerateMD5: TMenuItem;
    miHexEdit: TMenuItem;
    N21: TMenuItem;
    miCopyMenu: TMenuItem;
    miCopySelected: TMenuItem;
    miCopyAll: TMenuItem;
    miMoveMenu: TMenuItem;
    miMoveSelected: TMenuItem;
    miMoveAll: TMenuItem;
    miDeleteMenu: TMenuItem;
    miDeleteSelected: TMenuItem;
    miDeleteAll: TMenuItem;
    N23: TMenuItem;
    miZIP: TMenuItem;
    N22: TMenuItem;
    miSearchExportToCB: TMenuItem;
    N36: TMenuItem;
    miSaveAs: TMenuItem;
    procedure sbNMCreatedClick(Sender: TObject);
    procedure sbNLFilterClick(Sender: TObject);
    procedure sbNavigationBackClick(Sender: TObject);
    procedure sbNSBColourCodeClick(Sender: TObject);
    procedure sgNavigationCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sgNavigationDblClick(Sender: TObject);
    procedure sgNavigationDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgNavigationSideDblClick(Sender: TObject);
    procedure sgNavigationSideDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Panel25Resize(Sender: TObject);
    procedure Panel26Resize(Sender: TObject);
    procedure sbNMColourCodeClick(Sender: TObject);
    procedure miPUNO1Click(Sender: TObject);
    procedure sgNavigationGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure miCOSaveClick(Sender: TObject);
    procedure miCOCopyClick(Sender: TObject);
    procedure miCOAdvancedClick(Sender: TObject);
    procedure miCCustomFromClick(Sender: TObject);
    procedure miCCustomToClick(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure puSearchPopup(Sender: TObject);
    procedure miSearchOpenClick(Sender: TObject);
    procedure miSearchOpenCustomClick(Sender: TObject);
    procedure miExploreDirectoryClick(Sender: TObject);
    procedure miSFilePropertiesClick(Sender: TObject);
    procedure miGenerateMD5Click(Sender: TObject);
    procedure miHexEditClick(Sender: TObject);
    procedure miCopySelectedClick(Sender: TObject);
    procedure miCopyAllClick(Sender: TObject);
    procedure miMoveSelectedClick(Sender: TObject);
    procedure miMoveAllClick(Sender: TObject);
    procedure miDeleteSelectedClick(Sender: TObject);
    procedure miDeleteAllClick(Sender: TObject);
    procedure miSearchExportToCBClick(Sender: TObject);
    procedure miZIPClick(Sender: TObject);
    procedure sgNavigationGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgNavigationSideGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  private
    FSource            : integer;
    FFilterChanged     : boolean;

    FCurrentFolder         : string;

    FGetLeftOffset         : TGetLeftOffset;
    FGetTopOffset          : TGetTopOffset;

    FOnProcessWindowStatus : TProcessWindowStatus;

    FChartsHaveChanged     : TChartsHaveChanged;

    FCharts        : array[1..__ChartCount] of TChart;

    NavSideBarThread  : TNavigateRightThread;

    procedure LoadSettings;

    procedure NaviSideBarThreadOnTerminate(Sender : TObject);

    function  GetSelectedFileName(aSide : integer): string;
  public
    NavigateFilter  : array[1..19] of TMenuItem;

    procedure Init;
    procedure DeInit;
    procedure InitHint;
    procedure InitUpdate;
    procedure UpdateGUICustomNames;

    procedure SaveSettings;

    procedure BuildNavigationTab;

    procedure SelectAndDblClick(aRow, aColumn : integer);

    property GetLeftOffset               : TGetLeftOffset          read FGetLeftOffset            write FGetLeftOffset;
    property GetTopOffset                : TGetTopOffset           read FGetTopOffset             write FGetTopOffset;

    property Source                      : integer                 read FSource                   write FSource;

    property OnChartsHaveChanged         : TChartsHaveChanged      read FChartsHaveChanged        write FChartsHaveChanged;
    property OnProcessWindowStatusChange : TProcessWindowStatus    read FOnProcessWindowStatus    write FOnProcessWindowStatus;
  end;


implementation

{$R *.dfm}

uses
  X.CFileObject, X.GlobalObjects,

  X.Constants, X.Conversions,

  X.GridUtility, X.Utility, X.GuiUtil,

  X.Global, X.Settings, X.CSizeOfFolder;


const
  NavigationSortColumns : array[0..16] of integer = (sgnOrderIndex, 1, sgnIntegerSize, sgnIntegerSize, sgnIntegerSize,
                                                       5, 6, 7, 8, 9,
                                                       sgnIntegetSoD, 11, 12, 13, 14,
                                                       15, 16);

  CLeftFileName  = 1;
  CRightFileName = 1;

  CLeftOptions  = 0;
  CRightOptions = 1;


procedure TFrameNavigation.Init;
var
  t : integer;

begin

  FCharts[1] := vtcFSMain;

  FFilterChanged := True;

  // =========================================================================

  miSearchOpen.Caption       := XText[rsViewOpenFile];
  miSearchOpenCustom.Caption := XText[rsOpenWithCustomViewer];
  miExploreDirectory.Caption := XText[rsExploreFolder];
  miSFileProperties.Caption  := XText[rsFileProperties];
  miGenerateMD5.Caption      := XText[rsGenerateMD5];
  miHexEdit.Caption          := XText[rsHexEdit];
  miCopyMenu.Caption         := XText[rsCopy];
  miCopySelected.Caption     := XText[rsSelected] + rsEllipsis;
  miCopyAll.Caption          := XText[rsAll] + rsEllipsis;
  miMoveMenu.Caption         := XText[rsMove];
  miMoveSelected.Caption     := XText[rsSelected] + rsEllipsis;
  miMoveAll.Caption          := XText[rsAll] + rsEllipsis;
  miDeleteMenu.Caption       := XText[rsDelete];
  miDeleteSelected.Caption   := XText[rsSelected] + rsEllipsis;
  miDeleteAll.Caption        := XText[rsAll] + rsEllipsis;
  miZIP.Caption              := XText[rsAddZipFile] + rsEllipsis;
  miSearchExportToCB.Caption := XText[rsCopyTableToClipboard];
  miSaveAs.Caption           := XText[rsSaveAs] + rsEllipsis;

  // =========================================================================

  miPUNO1.Caption    := TypeDescriptions[1];
  miPUNO2.Caption    := TypeDescriptions[2];
  miPUNO3.Caption    := TypeDescriptions[3];
  miPUNO4.Caption    := TypeDescriptions[4];
  miPUNO5.Caption    := TypeDescriptions[5];
  miPUNO6.Caption    := TypeDescriptions[6];
  miPUNO7.Caption    := TypeDescriptions[7];
  miPUNO8.Caption    := TypeDescriptions[8];
  miPUNO9.Caption    := TypeDescriptions[9];
  miNOCustom.Caption := XText[rsCustom];
  miPUNO10.Caption   := TypeDescriptions[10];
  miPUNO11.Caption   := TypeDescriptions[11];
  miPUNO12.Caption   := TypeDescriptions[12];
  miPUNO13.Caption   := TypeDescriptions[13];
  miPUNO14.Caption   := TypeDescriptions[14];
  miPUNO15.Caption   := TypeDescriptions[15];
  miPUNO16.Caption   := TypeDescriptions[16];
  miPUNO17.Caption   := TypeDescriptions[17];
  miPUNO18.Caption   := TypeDescriptions[18];
  miPUNO19.Caption   := TypeDescriptions[19];

  // =========================================================================

  miChartOptions.Caption         := XText[rsChartOptions];
  miCOSave.Caption               := XText[rsSaveChart];
  miCOCopy.Caption               := XText[rsCopyChartToClipboard];
  miCOAdvanced.Caption           := XText[rsAdvancedOptions];

  // =========================================================================

  NavigateFilter[1]:=miPUNO1;   NavigateFilter[2]:=miPUNO2;   NavigateFilter[3]:=miPUNO3;   NavigateFilter[4]:=miPUNO4;   NavigateFilter[5]:=miPUNO5;
  NavigateFilter[6]:=miPUNO6;   NavigateFilter[7]:=miPUNO7;   NavigateFilter[8]:=miPUNO8;   NavigateFilter[9]:=miPUNO9;   NavigateFilter[10]:=miPUNO10;
  NavigateFilter[11]:=miPUNO11; NavigateFilter[12]:=miPUNO12; NavigateFilter[13]:=miPUNO13; NavigateFilter[14]:=miPUNO14; NavigateFilter[15]:=miPUNO15;
  NavigateFilter[16]:=miPUNO16; NavigateFilter[17]:=miPUNO17; NavigateFilter[18]:=miPUNO18; NavigateFilter[19]:=miPUNO19;

  for t := 1 to __FileCategoriesCount do begin
    NavigateFilter[t].Caption := TypeDescriptions[t];
  end;

  GXGuiUtil.SetButtonOffImage(sbNMCreated,     CImageCreated);
  GXGuiUtil.SetButtonOffImage(sbNMAccessed,    CImageAccessed);
  GXGuiUtil.SetButtonOffImage(sbNMModified,    CImageModified);
  GXGuiUtil.SetButtonOffImage(sbNMUsers,       CImageOwner);
  GXGuiUtil.SetButtonOffImage(sbNMAttributes,  CImageAttributes);
  GXGuiUtil.SetButtonOffImage(sbNMColourCode,  CImageColourCode);
  GXGuiUtil.SetButtonOffImage(sbNMSizeOnDisk,  CImageSizeOnDisk);
  GXGuiUtil.SetButtonOffImage(sbNSBCreated,    CImageCreated);
  GXGuiUtil.SetButtonOffImage(sbNSBAccessed,   CImageAccessed);
  GXGuiUtil.SetButtonOffImage(sbNSBModified,   CImageModified);
  GXGuiUtil.SetButtonOffImage(sbNSBUsers,      CImageOwner);
  GXGuiUtil.SetButtonOffImage(sbNSBAttributes, CImageAttributes);
  GXGuiUtil.SetButtonOffImage(sbNSBColourCode, CImageColourCode);
  GXGuiUtil.SetButtonOffImage(sbNSBSizeOnDisk, CImageSizeOnDisk);

  sgNavigation.HideColumns(5, 16);

  sgNavigation.ColWidths[0] := 18;
  sgNavigation.ColWidths[2] := 60;
  sgNavigation.ColWidths[3] := 52;
  sgNavigation.ColWidths[4] := 40;

  sgNavigationSide.HideColumns(5, 16);

  sgNavigationSide.ColWidths[0] := 18;
  sgNavigationSide.ColWidths[2] := 60;
  sgNavigationSide.ColWidths[3] := 52;
  sgNavigationSide.ColWidths[4] := 40;

  sgNavigation.DefaultRowHeight     := XSettings.General.RowHeight;
  sgNavigationSide.DefaultRowHeight := XSettings.General.RowHeight;

  sgNavigation.ClearRows(1, sgNavigation.RowCount - 1);

  sgNavigation.Cells[1, 0]               := XText[rsFilename];
  sgNavigation.Cells[2, 0]               := XText[rsSize];
  sgNavigation.Cells[3, 0]               := '%';
  sgNavigation.Cells[4, 0]               := '%';
  sgNavigation.Cells[5, 0]               := XText[rsCreated];
  sgNavigation.Cells[6, 0]               := XText[rsAccessed];
  sgNavigation.Cells[7, 0]               := XText[rsModified];
  sgNavigation.Cells[8, 0]               := XText[rsOwner];
  sgNavigation.Cells[sgnAttributes, 0]   := XText[rsAttr];
  sgNavigation.Cells[sgnSizeOnDisk, 0]   := XText[rsUsed];
  sgNavigation.Cells[sgnIntegerPCent, 1] := '0';

  sgNavigationSide.ClearRows(1, sgNavigationSide.RowCount - 1);

  sgNavigationSide.Cells[1, 0]             := XText[rsFilename];
  sgNavigationSide.Cells[2, 0]             := XText[rsSize];
  sgNavigationSide.Cells[3, 0]             := '%';
  sgNavigationSide.Cells[4, 0]             := '%';
  sgNavigationSide.Cells[5, 0]             := XText[rsCreated];
  sgNavigationSide.Cells[6, 0]             := XText[rsAccessed];
  sgNavigationSide.Cells[7, 0]             := XText[rsModified];
  sgNavigationSide.Cells[8, 0]             := XText[rsOwner];
  sgNavigationSide.Cells[sgnAttributes, 0] := XText[rsAttr];
  sgNavigationSide.Cells[sgnSizeOnDisk, 0] := XText[rsUsed];

  sgNavigationSide.Cells[sgnIntegerPCent, 1]:='0';

  Panel25Resize(Nil);
  Panel26Resize(Nil);

  LoadSettings;

  InitUpdate;
end;


procedure TFrameNavigation.DeInit;
begin
  if Assigned(NavSideBarThread) then begin
    NavSideBarThread.Terminate;
    NavSideBarThread.WaitFor;
    FreeAndNil(NavSideBarThread);
  end;
end;


procedure TFrameNavigation.InitUpdate;
var
  i : integer;

begin
  for i := 1 to __ChartCount do begin
    TChartUtility.SetAdvancedOptions(FCharts[i], XSettings.Charts.Options);
  end;
end;


procedure TFrameNavigation.InitHint;
begin
  sbNMCreated.Hint     := XText[rsHint1];
  sbNSBCreated.Hint    := XText[rsHint1];
  sbNMAccessed.Hint    := XText[rsHint2];
  sbNSBAccessed.Hint   := XText[rsHint2];
  sbNMModified.Hint    := XText[rsHint3];
  sbNSBModified.Hint   := XText[rsHint3];
  sbNMUsers.Hint       := XText[rsHint4];
  sbNSBUsers.Hint      := XText[rsHint4];
  sbNMAttributes.Hint  := XText[rsHint5];
  sbNSBAttributes.Hint := XText[rsHint5];
  sbNMSizeOnDisk.Hint  := XText[rsHint6];
  sbNSBSizeOnDisk.Hint := XText[rsHint6];
  sbNMColourCode.Hint  := XText[rsHint7];
  sbNSBColourCode.Hint := XText[rsHint7];
end;


procedure TFrameNavigation.UpdateGUICustomNames;
var
  t : integer;

begin
  for t := 1 to __FileCategoriesCount do
    NavigateFilter[t].Caption := TypeDescriptions[t];
end;


procedure TFrameNavigation.LoadSettings;
var
  t, lChart : integer;

begin
  if XSettings.OpenSettings(True) then begin

    Panel25.Width           := XSettings.ReadIntegerFromSettings('Prefs', 'NavLeft_' + IntToStr(FSource), 325, 325);
    sgNavigationSide.Height := XSettings.ReadIntegerFromSettings('Prefs', 'NavRight', Round(pMainNavigation.Height*0.75),10);

    // =========================================================================

    for t := 1 to __ChartCount do begin
      lChart := XSettings.ReadIntegerFromSettings('Charts', 'Report_' + IntToStr(FSource) + '_' + IntToStr(t), 0, -1);

      TChartUtility.SetChartType(FCharts[t], lChart);
    end;

    XSettings.CloseSettings;
  end
  else
    TMSLogger.Error('Error loading settings FrameNavigation');
end;


procedure TFrameNavigation.SaveSettings;
var
  t : integer;

begin
  if XSettings.OpenSettings(False) then begin

    XSettings.WriteIntegerToSettings('Prefs', 'NavLeft',  Panel25.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'NavRight', sgNavigationSide.Height);

    // ===========================================================================

    for t := 1 to __ChartCount do begin
      XSettings.WriteIntegerToSettings('Charts', 'Navigation_' + IntToStr(FSource) + '_' + IntToStr(t), TChartUtility.GetChartType(FCharts[t]));
    end;

    XSettings.CloseSettings;
  end
  else
    TMSLogger.Error('Error saving settings FrameNavigation');
end;


function TFrameNavigation.GetSelectedFileName(aSide : integer): string;
begin
  Result := '';

  case aSide of
    4 : if sgNavigation.Cells[sgnFolderFile, sgNavigation.Selection.Top] = '1' then
          Result := GScanDetails[FSource].ScanPath + sgNavigation.Cells[CLeftFileName, sgNavigation.Selection.Top] + '\'
        else
          Result := GScanDetails[FSource].ScanPath + sgNavigation.Cells[CLeftFileName, sgNavigation.Selection.Top];

    5 : if sgNavigationSide.Cells[sgnFolderFile, sgNavigationSide.Selection.Top] = '1' then
          Result := FCurrentFolder + sgNavigationSide.Cells[CRightFileName, sgNavigationSide.Selection.Top] + '\'
        else
          Result := FCurrentFolder + sgNavigationSide.Cells[CRightFileName, sgNavigationSide.Selection.Top];
  end;
end;


procedure TFrameNavigation.miCCustomFromClick(Sender: TObject);
var
  mychart : TChart;
  lColour : integer;

begin
  mychart := TChart(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

  lColour := TXColourDialog.Execute(mychart.Gradient.StartColor);

  if lColour <> -1 then begin
    mychart.Gradient.StartColor := lColour;

    XSettings.Charts.Options.ChartFrom := lColour;
  end;
end;


procedure TFrameNavigation.miCCustomToClick(Sender: TObject);
 var
  mychart : TChart;
  lColour : integer;

 begin
  mychart := TChart(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

  lColour := TXColourDialog.Execute(mychart.Gradient.EndColor);

  if lColour <> -1 then begin
    mychart.Gradient.EndColor := lColour;

    XSettings.Charts.Options.ChartTo := lColour;
  end;
end;


procedure TFrameNavigation.miCOAdvancedClick(Sender: TObject);
var
  mychart : TChart;
  tceo    : TChartOptions;

begin
  Assert(sender <> Nil, 'miCOAdvancedClick :: sender is nil');

  mychart        := TChart(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

  tceo           := XSettings.Charts.Options;

  tceo.ChartType := TChartUtility.GetChartType(mychart);

  // ===========================================================================

  tceo := DoAdvancedChartOptions(tceo);

  // ===========================================================================

  if tceo.Result = 1 then begin
    TChartUtility.SetAdvancedOptions(mychart, tceo);

    if Assigned(FChartsHaveChanged) then
      FChartsHaveChanged;
  end;
end;


procedure TFrameNavigation.miCOCopyClick(Sender: TObject);
var
  mychart : TChart;

begin
  mychart := TChart(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

  TChartUtility.CopyChartToClipboard(mychart);
end;


procedure TFrameNavigation.miCopyAllClick(Sender: TObject);
var
  lFolder : string;

begin
  lFolder := GetCopyMoveFolder(XText[rsCopyTo] + rsEllipsis);

  if lFolder <> '' then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      4 : begin
            TXWindows.CopyAllFiles(GScanDetails[FSource].ScanPath, lFolder);
          end;
      5 : begin
            TXWindows.CopyAllFiles(FCurrentFolder, lFolder);
          end;
    end;
  end;
end;


procedure TFrameNavigation.miCopySelectedClick(Sender: TObject);
var
  lFolder : string;

begin
  lFolder := GetCopyMoveFolder(XText[rsCopyTo] + rsEllipsis);

  if lFolder <> '' then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      4 : CopyFile(PChar(GetSelectedFileName(4)),
                   PChar(lFolder + sgNavigation.Cells[CLeftFileName, sgNavigation.Selection.Top]),
                   False);

      5 : CopyFile(PChar(GetSelectedFileName(5)),
                   PChar(lFolder + sgNavigationSide.Cells[CRightFileName, sgNavigationSide.Selection.Top]),
                   False);
    end;
  end;
end;


procedure TFrameNavigation.miCOSaveClick(Sender: TObject);
var
  mychart : TChart;
  lFileName : string;

begin
  lFileName := TXSaveDialog.ExecuteImages(TUtility.GetDefaultFileName('.png', XText[rsTable] + '_' + XText[rsExport]));

  if lFileName <> '' then begin
    mychart := TChart(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

    TChartUtility.SaveChartToPNG(mychart, lFileName);
  end;
end;


procedure TFrameNavigation.miDeleteAllClick(Sender: TObject);
var
  t : integer;

begin
  if MessageDlg(XText[rsDialog4], mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      4 : begin
            for t := 1 to sgNavigation.RowCount - 1 do begin
              TXWindows.SendToRecycleBin(GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag));
            end;
          end;
      5 : begin
            for t := 1 to sgNavigationSide.RowCount - 1 do begin
              TXWindows.SendToRecycleBin(GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag));
            end;
          end;
    end;
  end;
end;


procedure TFrameNavigation.miDeleteSelectedClick(Sender: TObject);
var
  s : string;

begin
  if MessageDlg(XText[rsDialog3], mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    s := GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag);

    if s <> '' then
      TXWindows.SendToRecycleBin(s);
  end;
end;


procedure TFrameNavigation.miExploreDirectoryClick(Sender: TObject);
var
  s : string;

begin
  s := '"' + ExtractFilePath(GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag)) + '"';

  if s <> '' then
    TXWindows.ExecuteFile(0, s, '', '');
end;


procedure TFrameNavigation.miGenerateMD5Click(Sender: TObject);
var
  s : string;

begin
  s := GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag);

  if s <> '' then
    ShowMD5Checksum(s, TMD5.Generate(s));
end;


procedure TFrameNavigation.miHexEditClick(Sender: TObject);
var
  s : string;

begin
  s := GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag);

  if s <> '' then
    TXWindows.ExecuteFile(0, '"' + GSystemGlobal.ExePath + '\Be.HexEditor.exe"', '"' + s + '"', '');
end;


procedure TFrameNavigation.miMoveAllClick(Sender: TObject);
var
  lFolder : string;

begin
  lFolder := GetCopyMoveFolder(XText[rsMoveTo] + rsEllipsis);

  if lFolder <> '' then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      4 : begin
            TXWindows.MoveAllFiles(GScanDetails[FSource].ScanPath, lFolder);
          end;
      5 : begin
            TXWindows.MoveAllFiles(FCurrentFolder, lFolder);
          end;
    end;
  end;
end;


procedure TFrameNavigation.miMoveSelectedClick(Sender: TObject);
var
  lFolder : string;

begin
  lFolder := GetCopyMoveFolder(XText[rsMoveTo] + rsEllipsis);

  if lFolder <> '' then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      4 : MoveFileEx(PChar(GetSelectedFileName(4)),
                     PChar(lFolder + sgNavigation.Cells[CLeftFileName, sgNavigation.Selection.Top]),
                     MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
      5 : MoveFileEx(PChar(GetSelectedFileName(5)),
                     PChar(lFolder + sgNavigationSide.Cells[CLeftFileName, sgNavigationSide.Selection.Top]),
                     MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
    end;
  end;
end;


procedure TFrameNavigation.miPUNO1Click(Sender: TObject);
begin
  Assert(Sender <> nil, 'miPUNO1Click :: Nil Object');

  TMenuItem(Sender).Checked := not(TMenuItem(Sender).Checked);

  if TMenuItem(Sender).Checked then
    XSettings.Navigation.DisplayOptions[puNavigateOptions.Tag][TMenuItem(Sender).Tag] := '1'
  else
    XSettings.Navigation.DisplayOptions[puNavigateOptions.Tag][TMenuItem(Sender).Tag] := '0';

  if GScanDetails[FSource].FileCount + GScanDetails[FSource].FolderCount> 0 then begin
    if puNavigateOptions.Tag = 0 then
      BuildNavigationTab
    else begin
      FFilterChanged := True;

      sgNavigationDblClick(Nil);
    end;
  end;
end;


procedure TFrameNavigation.miSaveAsClick(Sender: TObject);
var
  lGrid : TAdvStringGrid;
  lFileName : string;

begin
  lFileName := TXSaveDialog.ExecuteReports(TUtility.GetDefaultFileName('.csv', XText[rsSearchResults]));

  if lFileName <> '' then begin
    lGrid := TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

    TGridUtility.SaveGrid(lGrid, lFileName);
  end;
end;


procedure TFrameNavigation.miSearchExportToCBClick(Sender: TObject);
begin
  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    4 : TGridUtility.CopyGridToClipboard(0, sgNavigation);
    5 : TGridUtility.CopyGridToClipboard(0, sgNavigationSide);
  end;
end;


procedure TFrameNavigation.miSearchOpenClick(Sender: TObject);
var
  s : string;

begin
  s := GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag);

  if s <> '' then
    TXWindows.ExecuteFile(0, '"' + s + '"', '', '');
end;


procedure TFrameNavigation.miSearchOpenCustomClick(Sender: TObject);
var
  s : string;

begin
  s := GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag);

  if s <> '' then
    TXWindows.ExecuteFile(0, '"' + XSettings.General.CustomViewer + '"', '"' + s + '"', '');
end;


procedure TFrameNavigation.miSFilePropertiesClick(Sender: TObject);
var
  s : string;

begin
  s := GetSelectedFileName(TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag);

  if s <> '' then
    TXWindows.ShowFilePropertiesDialog(Application.Handle, '"' + s + '"');
end;


procedure TFrameNavigation.miZIPClick(Sender: TObject);
 var
  lZipCount : integer;
  lFileName : string;

 begin
  lFileName := TXSaveDialog.Execute(XText[rsCompressedFiles] + ' (*.zip)|*.zip',
                                    '.zip',
                                    TUtility.GetDefaultFileName('.zip', XText[rsTop101] + '_' + XText[rsExport]));

  if lFileName <> '' then begin

    lZipCount := -1;

    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      4 : lZipCount := XinorbisZip.ZipAllFiles(lFileName, TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag, sgNavigation, CLeftFileName);
      5 : lZipCount := XinorbisZip.ZipAllFiles(lFileName, TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag, sgNavigationSide, CRightFileName);
    end;

    if lZipCount = -1 then
      ShowXDialog(XText[rsErrorCompressingFiles],
                  XText[rsErrorCompressingFiles],
                  XDialogTypeWarning)
    else if lZipCount = 0 then
      ShowXDialog(XText[rsWarning], XText[rsNoFilesToCompress], XDialogTypeWarning);
  end;
end;


procedure TFrameNavigation.BuildNavigationTab;
var
  i, orderx, rowidx : integer;
  bigtemp : TSizeOfFolder;
  tfo : TFileObject;

begin
  orderx := 0;

  vtcFSMain.Series[0].Clear;

  TGridUtility.ClearStringGird(sgNavigation, False);

  sgNavigation.BeginUpdate;

  for i := 0 to GScanDetails[FSource].RootFiles.Count - 1 do begin
    tfo := GScanDetails[FSource].RootFiles[i];

    rowidx := sgNavigation.RowCount - 1;

    if (((faDirectory and tfo.Attributes) = faDirectory) or (XSettings.Navigation.DisplayOptions[0][tfo.FileCategory] = '1')) then begin

      if (faDirectory and tfo.Attributes) = faDirectory then begin

        bigtemp := GXinorbisScan.SizeOfFolderNav(0, GScanDetails[FSource].Folders[tfo.FilePathIndex] + tfo.FileName);

        sgNavigation.Cells[1, rowidx]                       := tfo.FileName;
        sgNavigation.Cells[2, rowidx]                       := TConvert.ConvertToUsefulUnit(bigtemp.Data[XFileUsed]);
        sgNavigation.Cells[sgnIntegerSize, rowidx]          := IntToStr(bigtemp.Data[XFileUsed]);

        if GScanDetails[FSource].TotalSize <> 0 then begin
          sgNavigation.Cells[4, rowidx]                  := TConvert.RealToPercent(bigtemp.Data[XFileUsed] / GScanDetails[FSource].TotalSize);
          sgNavigation.Cells[sgnIntegerPCent, rowidx]    := IntToStr(Round((bigtemp.Data[XFileUsed] / GScanDetails[FSource].TotalSize) * 50));
        end
        else begin
          sgNavigation.Cells[4, rowidx]                  := '100%';
          sgNavigation.Cells[sgnIntegerPCent, rowidx]    := '100';
        end;

        sgNavigation.Cells[sgnAttributes, rowidx]       := TXFormatting.GetAttributesAsString(tfo.Attributes);

        sgNavigation.Cells[sgnCreatedDate, rowidx]      := TConvert.IntDateToString(tfo.FileDateC);
        sgNavigation.Cells[sgnAccessedDate, rowidx]     := TConvert.IntDateToString(tfo.FileDateA);
        sgNavigation.Cells[sgnModifiedDate, rowidx]     := TConvert.IntDateToString(tfo.FileDateM);

        sgNavigation.Cells[sgnUserName, rowidx]         := GScanDetails[FSource].Users[tfo.Owner].Name;

        sgNavigation.Cells[sgnSizeOnDisk, rowidx]       := TConvert.ConvertToUsefulUnit(bigtemp.Data[XSpaceUsed]);
        sgNavigation.Cells[sgnIntegetSoD, rowidx]       := IntToStr(bigtemp.Data[XSpaceUsed]);

        sgNavigation.Cells[sgnFolderFile, rowidx]       := '1';
        sgNavigation.Cells[sgnOrderIndex, rowidx]       := IntToStr(orderx);

        sgNavigation.Cells[sgnCategoryIndex, rowidx]    := '0';
      end
      else begin
        sgNavigation.Cells[1, rowidx]                       := tfo.FileName;
        sgNavigation.Cells[2, rowidx]                       := TConvert.ConvertToUsefulUnit(tfo.FileSize);
        sgNavigation.Cells[sgnIntegerSize, rowidx]          := IntToStr(tfo.FileSize);

        if GScanDetails[FSource].TotalSize <> 0 then begin
          sgNavigation.Cells[4, rowidx]                   := TConvert.RealToPercent(tfo.FileSize / GScanDetails[FSource].TotalSize);
          sgNavigation.Cells[sgnIntegerPCent, rowidx]     := IntToStr(Round((tfo.FileSize / GScanDetails[FSource].TotalSize) * 50));
        end
        else begin
          sgNavigation.Cells[4, rowidx]                   := '100%';
          sgNavigation.Cells[sgnIntegerPCent, rowidx]     := '100';
        end;

        sgNavigation.Cells[sgnAttributes, rowidx]       := TXFormatting.GetAttributesAsString(tfo.Attributes);

        sgNavigation.Cells[sgnCreatedDate, rowidx]      := TConvert.IntDateToString(tfo.FileDateC);
        sgNavigation.Cells[sgnAccessedDate, rowidx]     := TConvert.IntDateToString(tfo.FileDateA);
        sgNavigation.Cells[sgnModifiedDate, rowidx]     := TConvert.IntDateToString(tfo.FileDateM);

        sgNavigation.Cells[sgnUserName, rowidx]         := GScanDetails[FSource].Users[tfo.Owner].Name;

        sgNavigation.Cells[sgnSizeOnDisk, rowidx]       := TConvert.ConvertToUsefulUnit(TConvert.GetSizeOnDisk(tfo.FileSize));
        sgNavigation.Cells[sgnIntegetSoD, rowidx]       := IntToStr(TConvert.GetSizeOnDisk(tfo.FileSize));

        sgNavigation.Cells[sgnFolderFile, rowidx]       := '0';
        sgNavigation.Cells[sgnOrderIndex, rowidx]       := IntToStr(orderx + 50000);

        sgNavigation.Cells[sgnCategoryIndex, rowidx]    := IntToStr(tfo.FileCategory);
      end;

      inc(orderx);

      sgNavigation.RowCount := sgNavigation.RowCount + 1;
    end;
  end;

  if sgNavigation.RowCount > 2 then
    sgNavigation.RowCount := sgNavigation.RowCount - 1;

  sgNavigation.EndUpdate;

  TGridUtility.DoTableSort(sgNavigation, sgNavigation.SortSettings.Column, NavigationSortColumns[sgNavigation.SortSettings.Column]);
end;


procedure TFrameNavigation.sbNavigationBackClick(Sender: TObject);
var
  idx,t,xflID : integer;
  s : string;

begin
  if GSystemGlobal.FolderStructure.Count > 1 then begin
    s := GSystemGlobal.FolderStructure.Strings[GSystemGlobal.FolderStructure.Count - 2];

    idx := Pos('?', s);

    GSystemGlobal.FolderStructure.Delete(GSystemGlobal.FolderStructure.Count - 1);
    GSystemGlobal.FolderStructure.Delete(GSystemGlobal.FolderStructure.Count - 1);

    // =========================================================================

    Screen.Cursor := crHourGlass;

    if Assigned(NavSideBarThread) then begin
      NavSideBarThread.Terminate;
      NavSideBarThread.WaitFor;
      FreeAndNil(NavSideBarThread);
    end;

    FCurrentFolder := Copy(s, 1, idx - 1);

    lNavigationDetails.HTMLText[0] := '"' + FCurrentFolder + '", 1<b>' + TConvert.ConvertToUsefulUnit(StrToInt64(Copy(s, idx + 1, length(s))) - idx) + '</b>. ';

    sgNavigationSide.BeginUpdate;

    // =========================================================================

    xflID := -1;

    for t := 0 to GScanDetails[FSource].Folders.Count - 1 do
      if GScanDetails[FSource].Folders[t] = Copy(s, 1, idx-1) then begin
        xflID := t;

        Break;
      end;

    // =========================================================================

    if xflID <> -1 then begin
      NavSideBarThread := TNavigateRightThread.Create(True);
      NavSideBarThread.SetData(FSource, xflID, StrToInt64(Copy(s, idx + 1, length(s))) - idx, sgNavigationSide, FFilterChanged);
      NavSideBarThread.OnTerminate := NaviSideBarThreadOnTerminate;
      NavSideBarThread.Priority    := tpHighest;
      NavSideBarThread.Start;
    end;

    // =========================================================================

    if GSystemGlobal.FolderStructure.Count <= 1 then
      sbNavigationBack.Enabled := False;
  end;
end;


procedure TFrameNavigation.NaviSideBarThreadOnTerminate(Sender : TObject);
 begin
  vtcFSMain.Title.Text.Text := FCurrentFolder;
  vtcFSMain.Series[0].Clear;

  if GScanDetails[FSource].TotalSize <> 0 then begin
    vtcFSMain.SeriesList.Items[0].Add(Round((NavSideBarThread.FileSize / GScanDetails[FSource].TotalSize) * 100), XText[rsSelectedFolder], magnicolors[0]);
    vtcFSMain.SeriesList.Items[0].Add(Round(((GScanDetails[FSource].TotalSize - NavSideBarThread.FileSize) / GScanDetails[FSource].TotalSize) * 100), 'Rest of scan', $00FFFFFF);
  end
  else begin
    vtcFSMain.SeriesList.Items[0].Add(100, XText[rsSelectedFolder], magnicolors[0]);
    vtcFSMain.SeriesList.Items[0].Add(100, 'Rest of scan', $00FFFFFF);
  end;

  sgNavigationSide.EndUpdate;

  // ===========================================================================

  if sgNavigationSide.RowCount > 2 then begin
    sgNavigationSide.RowCount := sgNavigationSide.RowCount - 1;
  end;

  TGridUtility.DoTableSort(sgNavigationSide, sgNavigationSide.SortSettings.Column, NavigationSortColumns[sgNavigationSide.SortSettings.Column]);

  lNavigationDetails.HTMLText[0] := lNavigationDetails.HTMLText[0] +
                                    ' <b>' + IntToStr(NavSideBarThread.FileCount) + '</b> ' + LowerCase(XText[rsFiles]) +
                                    '; <b>' + IntToStr(NavSideBarThread.FolderCount) + '</b> ' + LowerCase(XText[rsFolders]) + '.';

  // =========================================================================

  FFilterChanged := False;

  Screen.Cursor := crDefault;
end;


procedure TFrameNavigation.Panel25Resize(Sender: TObject);
 var
  t,i : integer;

 begin
  i := 18;

  for t := 2 to 13 do begin
    if not(sgNavigation.IsHiddenColumn(t)) then
      inc(i, sgNavigation.ColWidths[t]);
  end;

  sgNavigation.ColWidths[1] := sgNavigation.Width - (i + _WidthOfScrollbar);
end;


procedure TFrameNavigation.Panel26Resize(Sender: TObject);
 var
  t,i : integer;

 begin
  i := 18;

  for t := 2 to 13 do begin
    if not(sgNavigationSide.IsHiddenColumn(t)) then
      inc(i, sgNavigationSide.ColWidths[t]);
  end;

  sgNavigationSide.ColWidths[1] := sgNavigationSide.Width - (i + _WidthOfScrollbar);
end;


procedure TFrameNavigation.puSearchPopup(Sender: TObject);
var
  lFileName : string;
  lStatus, lFolder : boolean;
  lGrid : TAdvStringGrid;

begin
  lStatus := False;
  lFolder := False;

  if not(XSettings.ProcessWindowsVisible) then begin
    lGrid := TAdvStringGrid(Tpopupmenu(Sender).PopupComponent);

    if lGrid.Selection.Top > 0 then begin
      lFileName := lGrid.Cells[1, lGrid.Selection.Top];

      if lFileName <> '' then begin
        lStatus := True;

        lFolder := lGrid.Cells[sgnFolderFile, lGrid.Selection.Top] = '1';
      end;
    end;

    miSearchOpen.Enabled       := lStatus;
    miSearchOpenCustom.Enabled := lStatus;
    miExploreDirectory.Enabled := lStatus;
    miSFileProperties.Enabled  := lStatus;
    miGenerateMD5.Enabled      := lStatus and not(lFolder);
    miHexEdit.Enabled          := lStatus and not(lFolder);
    miCopyMenu.Enabled         := lStatus;
    miMoveMenu.Enabled         := lStatus;
    miDeleteMenu.Enabled       := lStatus;
    miZIP.Enabled              := lStatus;
    miSearchExportToCB.Enabled := lStatus;
    miSaveAs.Enabled           := lStatus;
  end;
end;


procedure TFrameNavigation.sbNLFilterClick(Sender: TObject);
var
  t : integer;

begin
  Assert(length(XSettings.Navigation.DisplayOptions[puNavigateOptions.Tag]) = 20, 'sbNRFilterClick :: Error with length.');

  puNavigateOptions.Tag := TSpeedbutton(Sender).Tag;

  for t := 1 to 19 do begin
    if XSettings.Navigation.DisplayOptions[puNavigateOptions.Tag][t] = '1' then
      NavigateFilter[t].Checked := True
    else
      NavigateFilter[t].Checked := False;
  end;

  case puNavigateOptions.Tag of
    CLeftOptions  : puNavigateOptions.Popup(FGetLeftOffset + sbNLFilter.Left + 31,
                                            FGetTopOffset  + pMainNavigation.Top + 55);
    CRightOptions : puNavigateOptions.Popup(FGetLeftOffset + Panel25.Width + sbNRFilter.Left + 35,
                                            FGetTopOffset  + pMainNavigation.Top + 77);
  end;
end;


procedure TFrameNavigation.sbNMColourCodeClick(Sender: TObject);
begin
  if sbNMColourCode.Tag = 0 then begin
    GXGuiUtil.SetButtonOnImage(TSpeedbutton(Sender), CImageColourCode);

    sbNMColourCode.Tag := 1;

    sgNavigation.Font.Color := clBlack;
  end
  else begin
    GXGuiUtil.SetButtonOffImage(TSpeedbutton(Sender), CImageColourCode);

    sbNMColourCode.Tag := 0;

    sgNavigation.Font.Color := clWhite;
  end;

  sgNavigation.Refresh;
end;


procedure TFrameNavigation.sbNMCreatedClick(Sender: TObject);
begin
  case TSpeedbutton(Sender).Tag of
    16..21 : begin
               TGridUtility.ToggleColumn(sgNavigation, TSpeedbutton(Sender),
                                         TableColumnLookup[(TSpeedbutton(Sender).Tag * 2) + 1], TableColumnLookup[TSpeedbutton(Sender).Tag * 2]);

               Panel25Resize(Nil);
             end;
    22..27 : begin
               TGridUtility.ToggleColumn(sgNavigationSide, TSpeedbutton(Sender),
                                         TableColumnLookup[(TSpeedbutton(Sender).Tag * 2) + 1], TableColumnLookup[TSpeedbutton(Sender).Tag * 2]);

               Panel26Resize(Nil);
             end;
  end;
end;


procedure TFrameNavigation.sbNSBColourCodeClick(Sender: TObject);
begin
  if sbNSBColourCode.Tag = 0 then begin
    GXGuiUtil.SetButtonOnImage(TSpeedbutton(Sender), CImageColourCode);

    sbNSBColourCode.Tag := 1;

    sgNavigationSide.Font.Color := clBlack
  end
  else begin
    GXGuiUtil.SetButtonOffImage(TSpeedbutton(Sender), CImageColourCode);

    sbNSBColourCode.Tag := 0;

    sgNavigationSide.Font.Color := clWhite
  end;

  sgNavigationSide.Refresh;
end;


procedure TFrameNavigation.sgNavigationCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
begin
  case Acol of
    sgnIsFolder   : begin
                      DoSort := False;

                      with TAdvStringGrid(Sender) do begin
                        if SortSettings.Direction = sdDescending then
                          SortSettings.Direction := sdAscending
                        else
                          SortSettings.Direction := sdDescending;

                        Sortsettings.Column := sgnOrderIndex;
                        QSort;

                        SortSettings.Column := ACol;
                      end;
                    end;
    sgnStringSize,
    sgnGraphSize,
    sgnStringPCent : begin
                      DoSort := False;

                      with TAdvStringGrid(Sender) do begin
                        if SortSettings.Direction = sdDescending then
                          SortSettings.Direction := sdAscending
                        else
                          SortSettings.Direction := sdDescending;

                        Sortsettings.Column := sgnIntegerSize;
                        QSort;

                        SortSettings.Column := ACol;
                      end;
                    end;
    sgnSizeOnDisk : begin
                      DoSort := False;

                      with TAdvStringGrid(Sender) do begin
                        if SortSettings.Direction = sdDescending then
                          SortSettings.Direction := sdAscending
                        else
                          SortSettings.Direction := sdDescending;

                        Sortsettings.Column := sgnIntegetSoD;
                        QSort;

                        SortSettings.Column := ACol;
                      end;
                    end;

  end;
end;


procedure TFrameNavigation.SelectAndDblClick(aRow, aColumn : integer);
begin
  sgNavigation.SelectRows(aRow, aColumn);

  sgNavigationDblClick(Nil);
end;


procedure TFrameNavigation.sgNavigationDblClick(Sender: TObject);
 var
  s : string;
  i : int64;
  t,xflID : integer;

 begin
  if sgNavigation.Cells[sgnFolderFile, sgNavigation.Selection.Top] = '1' then begin
    GSystemGlobal.FolderStructure.Clear;

    sbNavigationBack.Enabled := True;

    // =========================================================================

    Screen.Cursor := crHourGlass;

    if Assigned(NavSideBarThread) then begin
      NavSideBarThread.Terminate;
      NavSideBarThread.WaitFor;
      FreeAndNil(NavSideBarThread);
    end;

    s := GScanDetails[FSource].ScanPath + sgNavigation.Cells[1, sgNavigation.Selection.Top] + '\';
    i := StrToInt64(sgNavigation.Cells[sgnIntegerSize, sgNavigation.Selection.Top]);

    FCurrentFolder := s;

    lNavigationDetails.HTMLText[0] := '"' + s + '", <b>' + TConvert.ConvertToUsefulUnit(i) + '</b>. ';

    // =========================================================================

    xflID := -1;

    for t := 0 to GScanDetails[FSource].Folders.Count - 1 do
      if GScanDetails[FSource].Folders[t] = s then begin
        xflID := t;

        Break;
      end;

    // =========================================================================

    sgNavigationSide.BeginUpdate;

    NavSideBarThread := TNavigateRightThread.Create(True);
    NavSideBarThread.SetData(FSource, xflID, i, sgNavigationSide, FFilterChanged);
    NavSideBarThread.OnTerminate := NaviSideBarThreadOnTerminate;
//    NavSideBarThread.Priority    := tpHighest;
    NavSideBarThread.Start;

    // =========================================================================
  end;
end;


procedure TFrameNavigation.sgNavigationDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
 var
  zRect : TRect;

 begin
  if ARow > 0 then begin
    case ACol of
      sgnIsFolder  : begin
                       if ARow <> 0 then begin
                         if TAdvStringGrid(Sender).Cells[sgnFolderFile, ARow] = '1' then begin
                           XFNImages.Draw(TAdvStringGrid(Sender).Canvas, Rect.Left + 1, Rect.Top, 0, True);
                         end;
                       end;
                     end;
      sgnGraphSize : begin
                       TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[1];
                         TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                         if (TAdvStringGrid(Sender).Cells[sgnIntegerPCent, ARow] <> '0') and (TAdvStringGrid(Sender).Cells[sgnIntegerPCent, ARow] <> '') then begin
                           zRect.Top    := Rect.Top + 1;
                           zRect.Bottom := Rect.Bottom - 1;
                           zRect.Left   := Rect.Left + 1;
                           zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[sgnIntegerPCent, ARow]);

                           TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[2];
                           TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                         end;
                       end;
    end;
  end;
end;


procedure TFrameNavigation.sgNavigationGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ACol = 2) or (ACol = 4) or (ACol = 10) then
    HAlign := taRightJustify
  else
    HAlign := taLeftJustify;
end;


procedure TFrameNavigation.sgNavigationGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if sbNMColourCode.Tag = 1 then begin
    if ARow > 0 then
      ABrush.Color := GSystemGlobal.FileCategoryColors[StrToInt(TAdvStringGrid(Sender).Cells[sgnCategoryIndex, ARow])];
  end
  else begin
    if gdSelected in AState then
      ABrush.Color := CGridColourSelected
    else begin
      if Odd(ARow) then
        ABrush.Color := CGridColourOn
      else
        ABrush.Color := CGridColourOff;
    end;
  end;
end;


procedure TFrameNavigation.sgNavigationSideGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if sbNSBColourCode.Tag = 1 then begin
    if ARow > 0 then
      ABrush.Color := GSystemGlobal.FileCategoryColors[StrToInt(TAdvStringGrid(Sender).Cells[sgnCategoryIndex, ARow])];
  end
  else begin
    if gdSelected in AState then
      ABrush.Color := CGridColourSelected
    else begin
      if Odd(ARow) then
        ABrush.Color := CGridColourOn
      else
        ABrush.Color := CGridColourOff;
    end;
  end;
end;


procedure TFrameNavigation.sgNavigationSideDblClick(Sender: TObject);
 var
  s : string;
  i : int64;
  t,xflID : integer;

 begin
  if sgNavigationSide.Cells[sgnFolderFile, sgNavigationSide.Selection.Top] = '1' then begin
    sbNavigationBack.Enabled := True;

    // =========================================================================

    Screen.Cursor := crHourGlass;

    if Assigned(NavSideBarThread) then begin
      NavSideBarThread.Terminate;
      NavSideBarThread.WaitFor;
      FreeAndNil(NavSideBarThread);
    end;

    s := GSystemGlobal.CurrentNavigationSideLocation + sgNavigationSide.Cells[1, sgNavigationSide.Selection.Top] + '\';
    i := StrToInt64(sgNavigationSide.Cells[sgnIntegerSize, sgNavigationSide.Selection.Top]);

    FCurrentFolder := s;

    lNavigationDetails.HTMLText[0] := '"' + s + '", <b>' + TConvert.ConvertToUsefulUnit(i) + '</b>. ';

    // =========================================================================

    xflID := -1;

    for t := 0 to GScanDetails[FSource].Folders.Count - 1 do
      if GScanDetails[FSource].Folders[t] = s then begin
        xflID := t;

        Break;
      end;

    // =========================================================================

    sgNavigationSide.BeginUpdate;

    NavSideBarThread := TNavigateRightThread.Create(True);
    NavSideBarThread.SetData(FSource, xflID, i, sgNavigationSide, FFilterChanged);
    NavSideBarThread.OnTerminate := NaviSideBarThreadOnTerminate;
    NavSideBarThread.Priority    := tpHighest;
    NavSideBarThread.Start;

    // =========================================================================
  end;
end;


procedure TFrameNavigation.sgNavigationSideDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  zRect : TRect;

begin
  if ARow > 0 then begin
    case ACol of
      0  : begin
             if ARow <> 0 then begin
               if sgNavigationSide.Cells[sgnFolderFile, ARow] = '1' then begin
                  XFNImages.Draw(TAdvStringGrid(Sender).Canvas, Rect.Left + 1, Rect.Top, 0, True);
               end;
             end;
           end;
      3  : begin
             sgNavigationSide.Canvas.Brush.Color := XSettings.Navigation.BarColours[3];
             sgNavigationSide.Canvas.Rectangle(Rect);

             if (sgNavigationSide.Cells[sgnIntegerPCent, ARow] <> '0') and (sgNavigationSide.Cells[sgnIntegerPCent, ARow] <> '') then begin
               zRect.Top    := Rect.Top + 1;
               zRect.Bottom := Rect.Bottom - 1;
               zRect.Left   := Rect.Left + 1;
               zRect.Right  := Rect.Left + StrToInt(sgNavigationSide.Cells[sgnIntegerPCent, ARow]);

               sgNavigationSide.Canvas.Brush.Color:=XSettings.Navigation.BarColours[4];
               sgNavigationSide.Canvas.FillRect(zRect);
            end;
          end;
    end;
  end;
end;

end.
