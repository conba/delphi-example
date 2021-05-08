{
  (c) Paul Alan Freshney 2002-2020
  (c) Aardvark Digital 2002
  (c) Maximum Octopus Limted 2020

  www.freshney.org :: paul@freshney.org :: maximumoctopus.com :: xinorbis.com

        Started: June 19th 2019
  Last Modified: January 11th 2020
}


unit X.Frame.Reports;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, System.ImageList, Vcl.ImgList,
  VclTee.TeeGDIPlus, Vcl.StdCtrls, Vcl.ComCtrls, HTMLabel, VCLTee.Series,
  AdvSmoothCapacityBar, AdvOfficeButtons, htmltv, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.Buttons, Vcl.ExtCtrls, AdvSplitter, AdvSmoothTabPager, Vcl.Menus,

  TMSLogging,

  X.GuiLogic,

  X.CReportOptions,
  X.CCSVReports, X.CHTMLReports, X.CTextReports, X.CTreeReports, X.CXinorbisReports, X.CXMLReports,

  X.ThemeHelper, X.ChartUtility, X.Formatting, X.LanguageHandler, X.Windows, X.SystemGlobal;


const
  __ChartCount = 9;


type
  TFrameReports = class(TFrame)
    pMainReports: TAdvSmoothTabPager;
    tsTable: TAdvSmoothTabPage;
    splitTable: TAdvSplitter;
    Panel6: TPanel;
    sbMainPie: TSpeedButton;
    sbMainBar: TSpeedButton;
    sbMainConfig: TSpeedButton;
    rbGraphSize: TAdvOfficeRadioButton;
    rbGraphQuantity: TAdvOfficeRadioButton;
    sgMainReport: TAdvStringGrid;
    vtcMain: TChart;
    Series1: TPieSeries;
    tsFileTypes: TAdvSmoothTabPage;
    splitterTree: TAdvSplitter;
    Panel10: TPanel;
    sbTreePie: TSpeedButton;
    sbTreeBar: TSpeedButton;
    SpeedButton14: TSpeedButton;
    cbTreeSize: TAdvOfficeRadioButton;
    cbTreeQuantity: TAdvOfficeRadioButton;
    vtcTree: TChart;
    PieSeries2: TPieSeries;
    pTree: TPanel;
    sgFileTypes: TAdvStringGrid;
    tvFileTypes: THTMLTreeview;
    tsExtensions: TAdvSmoothTabPage;
    Panel38: TPanel;
    cbExtensionsAll: TAdvOfficeCheckBox;
    cbExtensionsOther: TAdvOfficeCheckBox;
    cbExtensionsCustom: TAdvOfficeCheckBox;
    cbExtensionColourCode: TAdvOfficeCheckBox;
    sgExtension: TAdvStringGrid;
    Panel13: TPanel;
    cbOtherSuggestions: TComboBox;
    tsFolderList: TAdvSmoothTabPage;
    splitDirList: TAdvSplitter;
    Panel8: TPanel;
    sbDirListPie: TSpeedButton;
    sbDirListBar: TSpeedButton;
    sbFolderMoreDetail: TSpeedButton;
    sbFolderConfig: TSpeedButton;
    cbGraphSizeDirList: TAdvOfficeRadioButton;
    cbGraphQuantityDirList: TAdvOfficeRadioButton;
    sgDirList: TAdvStringGrid;
    vtcDirList: TChart;
    PieSeries1: THorizBarSeries;
    tsMagnitude: TAdvSmoothTabPage;
    splitMagnitude: TAdvSplitter;
    Panel9: TPanel;
    sbMagnitudePie: TSpeedButton;
    sbMagnitudeBar: TSpeedButton;
    cbGraphSizeMagnitude: TAdvOfficeRadioButton;
    cbGraphQtyMagnitude: TAdvOfficeRadioButton;
    sgMagnitude: TAdvStringGrid;
    vtcMagnitude: TChart;
    BarSeries1: THorizBarSeries;
    tsFileDates: TAdvSmoothTabPage;
    splitterFileDetails: TAdvSplitter;
    Panel16: TPanel;
    sbCollapseNodes: TSpeedButton;
    sbFileDatesPie: TSpeedButton;
    sbFileDatesBar: TSpeedButton;
    cbFileDates: TComboBox;
    cbFileDatesUsers: TComboBox;
    tsHistory: TAdvSmoothTabPage;
    Panel31: TPanel;
    bHistoryRefresh: TSpeedButton;
    lHUser: TLabel;
    gbHistory: TGroupBox;
    cbHCumulative: TAdvOfficeCheckBox;
    rbHQuantity: TAdvOfficeRadioButton;
    rbHSize: TAdvOfficeRadioButton;
    GroupBox1: TGroupBox;
    lHFrom: TLabel;
    lHTo: TLabel;
    lHInterval: TLabel;
    dtpHFrom: TDateTimePicker;
    dtpHTo: TDateTimePicker;
    cbHInterval: TComboBox;
    cbHDateSelect: TComboBox;
    cbHUsers: TComboBox;
    cbAutoRefreshHistory: TAdvOfficeCheckBox;
    Panel7: TPanel;
    capacityBarHistory: TAdvSmoothCapacityBar;
    vtcHistory: TChart;
    Series4: TBarSeries;
    Panel35: TPanel;
    lHistoryResults: THTMLabel;
    tsTop50: TAdvSmoothTabPage;
    pcTop101: TPageControl;
    astpTop101: TAdvSmoothTabPager;
    tsTop101FileSize: TAdvSmoothTabPage;
    splitterTop50: TAdvSplitter;
    Panel18: TPanel;
    cbTopUsers: TComboBox;
    cbTopColourCode: TAdvOfficeCheckBox;
    pTop101: TPanel;
    capacityTop101: TAdvSmoothCapacityBar;
    sgTop50Big: TAdvStringGrid;
    pTop101Left: TPanel;
    sgTop50Small: TAdvStringGrid;
    tsTop101Date: TAdvSmoothTabPage;
    splitterTopDate: TAdvSplitter;
    Panel3: TPanel;
    cbTop101Dates: TComboBox;
    cbTop101DatesUser: TComboBox;
    Panel12: TPanel;
    sgTop101BigDate: TAdvStringGrid;
    pTop101DateLeft: TPanel;
    sgTop101SmallDate: TAdvStringGrid;
    tsNullFiles: TAdvSmoothTabPage;
    Splitter1: TAdvSplitter;
    pNullFiles: TPanel;
    pNullFilesTitle: TPanel;
    sbIDeleteNullFiles: TSpeedButton;
    pNullFolders: TPanel;
    pEmptyFoldersTitle: TPanel;
    sbIDeleteNullFolders: TSpeedButton;
    sgNullFolders: TAdvStringGrid;
    tsUsers: TAdvSmoothTabPage;
    splitUsers: TAdvSplitter;
    pUsers: TPanel;
    Panel29: TPanel;
    sbUsersPie: TSpeedButton;
    sbUsersBar: TSpeedButton;
    rbUsersSize: TAdvOfficeRadioButton;
    rbUsersQuantity: TAdvOfficeRadioButton;
    vtcUsers: TChart;
    PieSeries8: TPieSeries;
    Panel5: TPanel;
    Panel28: TPanel;
    sgUsers: TAdvStringGrid;
    tsTemp: TAdvSmoothTabPage;
    splitterTemp: TAdvSplitter;
    Panel21: TPanel;
    Panel22: TPanel;
    SpeedButton2: TSpeedButton;
    rbTempSize: TAdvOfficeRadioButton;
    rbTempQuantity: TAdvOfficeRadioButton;
    vtcTemp: TChart;
    PieSeries7: TPieSeries;
    Panel24: TPanel;
    Panel23: TPanel;
    sgTemp: TAdvStringGrid;
    puCharts: TPopupMenu;
    miChartOptions: TMenuItem;
    N9: TMenuItem;
    miCOSave: TMenuItem;
    miCOCopy: TMenuItem;
    miCOAdvanced: TMenuItem;
    puType: TPopupMenu;
    miTypeExportContent: TMenuItem;
    miTypeZip: TMenuItem;
    miTypeExportCB: TMenuItem;
    puExtensionsMain: TPopupMenu;
    miOtherAddTo: TMenuItem;
    miOA1: TMenuItem;
    miOA2: TMenuItem;
    miOA3: TMenuItem;
    miOA4: TMenuItem;
    miOA5: TMenuItem;
    miOA6: TMenuItem;
    miOA7: TMenuItem;
    miOA8: TMenuItem;
    miCustomEM: TMenuItem;
    miOA9: TMenuItem;
    miOA10: TMenuItem;
    miOA11: TMenuItem;
    miOA12: TMenuItem;
    miOA13: TMenuItem;
    miOA14: TMenuItem;
    miOA15: TMenuItem;
    miOA16: TMenuItem;
    miOA17: TMenuItem;
    miOA18: TMenuItem;
    N2: TMenuItem;
    miShowOtherFiles: TMenuItem;
    miExtensionsExportTableCSV: TMenuItem;
    N37: TMenuItem;
    SaveasCSV2: TMenuItem;
    puFolders: TPopupMenu;
    miFolderMoreDetail: TMenuItem;
    miScanFromDirList: TMenuItem;
    miExploreFromDirList: TMenuItem;
    miFolderExportSelectedCB: TMenuItem;
    puMagnitude: TPopupMenu;
    miMagnitudeExport: TMenuItem;
    miMagnitudeZip: TMenuItem;
    miMagnitudeExportCB: TMenuItem;
    puTreeDate: TPopupMenu;
    MenuItem20: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    miFileDatesExploreDir: TMenuItem;
    miFileDatesInfo: TMenuItem;
    miDGenerateMD5: TMenuItem;
    N11: TMenuItem;
    miFileDatesExport: TMenuItem;
    miFileDatesExportCB: TMenuItem;
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
    puUsers: TPopupMenu;
    miUsersExportSelected: TMenuItem;
    miUsersZip: TMenuItem;
    miUsersExportSelectedCB: TMenuItem;
    puFolderConfig: TPopupMenu;
    miFCO: TMenuItem;
    miFCOShowAll: TMenuItem;
    N110: TMenuItem;
    N28: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N101: TMenuItem;
    N151: TMenuItem;
    puTableDisplay: TPopupMenu;
    miTDShowAll: TMenuItem;
    miTDNonZero: TMenuItem;
    miTDUserDefined: TMenuItem;
    N13: TMenuItem;
    miTD1: TMenuItem;
    miTD2: TMenuItem;
    miTD3: TMenuItem;
    miTD4: TMenuItem;
    miTD5: TMenuItem;
    miTD6: TMenuItem;
    miTD7: TMenuItem;
    miTD8: TMenuItem;
    miTD9: TMenuItem;
    miTDCustom: TMenuItem;
    miTD10: TMenuItem;
    miTD11: TMenuItem;
    miTD12: TMenuItem;
    miTD13: TMenuItem;
    miTD14: TMenuItem;
    miTD15: TMenuItem;
    miTD16: TMenuItem;
    miTD17: TMenuItem;
    miTD18: TMenuItem;
    miTD19: TMenuItem;
    puTable: TPopupMenu;
    miTableExportSelected: TMenuItem;
    miTableZip: TMenuItem;
    miTableExportSelectedCB: TMenuItem;
    puNullFiles: TPopupMenu;
    miNFExplore: TMenuItem;
    miNFProperties: TMenuItem;
    puNullFolders: TPopupMenu;
    miNFExploreFolder: TMenuItem;
    miNFFolderProperties: TMenuItem;
    ilTabs: TImageList;
    lTempStatus: THTMLabel;
    cbTopDateColourCode: TAdvOfficeCheckBox;
    sbUsersCopy: TSpeedButton;
    cbUsersDisplayMode: TComboBox;
    sgNullFiles: TAdvStringGrid;
    pUsersWarning: TPanel;
    lUsersWarning: TLabel;
    lHSelected: TLabel;
    cbMagnitudeScope: TComboBox;
    Panel1: TPanel;
    vtcFileDates: TChart;
    HorizBarSeries1: THorizBarSeries;
    capacityBarDates: TAdvSmoothCapacityBar;
    rbDatesSize: TAdvOfficeRadioButton;
    rbDatesQuantity: TAdvOfficeRadioButton;
    pTempFilesWarning: TPanel;
    lTempWarning: TLabel;
    tsLength: TAdvSmoothTabPage;
    Panel2: TPanel;
    sbLengthPie: TSpeedButton;
    sbLengthBar: TSpeedButton;
    SpeedButton4: TSpeedButton;
    rbLengthGraphSize: TAdvOfficeRadioButton;
    rbLengthGraphCount: TAdvOfficeRadioButton;
    sgLength: TAdvStringGrid;
    splitLength: TAdvSplitter;
    vtcLength: TChart;
    PieSeries3: TPieSeries;
    puLength: TPopupMenu;
    miLengthShowAll: TMenuItem;
    miLengthNonZero: TMenuItem;
    tvFileDates: THTMLTreeview;
    procedure sbMainPieClick(Sender: TObject);
    procedure sbMainBarClick(Sender: TObject);
    procedure sbMainConfigClick(Sender: TObject);
    procedure rbGraphSizeClick(Sender: TObject);
    procedure sgMainReportCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sgMainReportDblClick(Sender: TObject);
    procedure sgMainReportDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgLengthDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure splitTableCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure splitTableMoved(Sender: TObject);
    procedure splitLengthMoved(Sender: TObject);
    procedure vtcMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure vtcMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbTreeSizeClick(Sender: TObject);
    procedure tvFileTypesClick(Sender: TObject);
    procedure tvFileTypesDblClick(Sender: TObject);
    procedure sgFileTypesDblClick(Sender: TObject);
    procedure sgFileTypesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure cbExtensionsAllClick(Sender: TObject);
    procedure cbExtensionColourCodeClick(Sender: TObject);
    procedure sgExtensionCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sgExtensionClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgExtensionDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgExtensionDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sbFolderConfigClick(Sender: TObject);
    procedure cbGraphSizeDirListClick(Sender: TObject);
    procedure cbGraphQuantityDirListClick(Sender: TObject);
    procedure sbFolderMoreDetailClick(Sender: TObject);
    procedure sgDirListCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sgDirListDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgDirListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure vtcDirListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure vtcDirListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbGraphSizeMagnitudeClick(Sender: TObject);
    procedure sgMagnitudeCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sgMagnitudeDblClick(Sender: TObject);
    procedure sgMagnitudeDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure vtcMagnitudeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure vtcMagnitudeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbFileDatesChange(Sender: TObject);
    procedure tvFileDatesDblClick(Sender: TObject);
    procedure sbCollapseNodesClick(Sender: TObject);
    procedure vtcFileDatesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dtpHFromChange(Sender: TObject);
    procedure bHistoryRefreshClick(Sender: TObject);
    procedure vtcHistoryClick(Sender: TObject);
    procedure vtcHistoryMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbTopUsersChange(Sender: TObject);
    procedure cbTopColourCodeClick(Sender: TObject);
    procedure sgTop50BigDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgTop50SmallDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure cbTop101DatesUserChange(Sender: TObject);
    procedure cbTopDateColourCodeClick(Sender: TObject);
    procedure sgTop101BigDateDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sbIDeleteNullFilesClick(Sender: TObject);
    procedure sbIDeleteNullFoldersClick(Sender: TObject);
    procedure sgNullFilesDblClick(Sender: TObject);
    procedure rbUsersSizeClick(Sender: TObject);
    procedure vtcUsersMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbUsersCopyClick(Sender: TObject);
    procedure cbUsersDisplayModeChange(Sender: TObject);
    procedure sgUsersCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sgUsersDblClick(Sender: TObject);
    procedure sgUsersDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure rbTempSizeClick(Sender: TObject);
    procedure vtcTempMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sgTempCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sgTempDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure miTDShowAllClick(Sender: TObject);
    procedure miTDNonZeroClick(Sender: TObject);
    procedure miTDUserDefinedClick(Sender: TObject);
    procedure miTD1Click(Sender: TObject);
    procedure miOA1Click(Sender: TObject);
    procedure miShowOtherFilesClick(Sender: TObject);
    procedure miExtensionsExportTableCSVClick(Sender: TObject);
    procedure SaveasCSV2Click(Sender: TObject);
    procedure miFolderMoreDetailClick(Sender: TObject);
    procedure miScanFromDirListClick(Sender: TObject);
    procedure miExploreFromDirListClick(Sender: TObject);
    procedure miFolderExportSelectedCBClick(Sender: TObject);
    procedure miMagnitudeExportClick(Sender: TObject);
    procedure miMagnitudeZipClick(Sender: TObject);
    procedure miMagnitudeExportCBClick(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure miFileDatesExploreDirClick(Sender: TObject);
    procedure miFileDatesInfoClick(Sender: TObject);
    procedure miDGenerateMD5Click(Sender: TObject);
    procedure miFileDatesExportClick(Sender: TObject);
    procedure miFileDatesExportCBClick(Sender: TObject);
    procedure miUsersExportSelectedClick(Sender: TObject);
    procedure miUsersZipClick(Sender: TObject);
    procedure miUsersExportSelectedCBClick(Sender: TObject);
    procedure miTypeExportContentClick(Sender: TObject);
    procedure miTypeZipClick(Sender: TObject);
    procedure miTypeExportCBClick(Sender: TObject);
    procedure miFCOShowAllClick(Sender: TObject);
    procedure miCOSaveClick(Sender: TObject);
    procedure miCOCopyClick(Sender: TObject);
    procedure miCOAdvancedClick(Sender: TObject);
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
    procedure miZIPClick(Sender: TObject);
    procedure miSearchExportToCBClick(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure splitterTop50Moved(Sender: TObject);
    procedure splitterTopDateMoved(Sender: TObject);
    procedure splitUsersMoved(Sender: TObject);
    procedure miTableExportSelectedClick(Sender: TObject);
    procedure miTableZipClick(Sender: TObject);
    procedure miTableExportSelectedCBClick(Sender: TObject);
    procedure puSearchPopup(Sender: TObject);
    procedure pMainReportsResize(Sender: TObject);
    procedure splitMagnitudeMoved(Sender: TObject);
    procedure splitDirListMoved(Sender: TObject);
    procedure puFoldersPopup(Sender: TObject);
    procedure puTreeDatePopup(Sender: TObject);
    procedure puExtensionsMainPopup(Sender: TObject);
    procedure pMainReportsChange(Sender: TObject);
    procedure splitterTempMoved(Sender: TObject);
    procedure miNFExploreClick(Sender: TObject);
    procedure miNFPropertiesClick(Sender: TObject);
    procedure miNFExploreFolderClick(Sender: TObject);
    procedure miNFFolderPropertiesClick(Sender: TObject);
    procedure puNullFilesPopup(Sender: TObject);
    procedure puNullFoldersPopup(Sender: TObject);
    procedure miCCustomToClick(Sender: TObject);
    procedure miCCustomFromClick(Sender: TObject);
    procedure puUsersPopup(Sender: TObject);
    procedure puTablePopup(Sender: TObject);
    procedure puMagnitudePopup(Sender: TObject);
    procedure puTypePopup(Sender: TObject);
    procedure splitterTreeCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure splitDirListCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure splitterFileDetailsCanResize(Sender: TObject;
      var NewSize: Integer; var Accept: Boolean);
    procedure splitMagnitudeCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure splitterTreeMoved(Sender: TObject);
    procedure sgMainReportGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure lUsersWarningClick(Sender: TObject);
    procedure cbMagnitudeScopeChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure miLengthShowAllClick(Sender: TObject);
    procedure miLengthNonZeroClick(Sender: TObject);
    procedure rbLengthGraphSizeClick(Sender: TObject);
    procedure sgLengthDblClick(Sender: TObject);
    procedure vtcLengthMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure vtcLengthMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sgExtensionGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgMainReportGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
  private
    FSource        : integer;
    FCharts        : array[1..__ChartCount] of TChart;

    FGetLeftOffset : TGetLeftOffset;
    FGetTopOffset  : TGetTopOffset;

    FIsFHUpdateThreadRunning : TIsFHUpdateThreadRunning;

    FSetStatusBarText      : TSetStatusBarText;
    FSetTutorialBarText    : TSetTutorialBarText;
    FScanWithNewPath       : TScanWithNewPath;
    FOnNewSearch           : TSearchWithParameter;
    FOnNewSummary          : TNewSummary;
    FOnOpenSettingsTab     : TOpenSettingsTab;
    FOnProcessWindowStatus : TProcessWindowStatus;
    FChartsHaveChanged     : TChartsHaveChanged;

    procedure LoadSettings;

    procedure BuildTree;

    function  GetActivePage: integer;
    procedure SetActivePage(aNewPage : integer);

    function  IsFileHistoryThreadRunning: boolean;

    procedure SetTheme;
  public
    TableDisplay : array[1..19] of TMenuItem;

    procedure Init;
    procedure InitUpdate;
    procedure InitHints;
    procedure InitDisplayDoOnce;
    procedure UpdateGUICustomNames;

    procedure SaveSettings;

    procedure PreScan;
    procedure PostScan;

    procedure ResetDisplay;

    procedure JustInTimeDisplay(tabtodisplay : integer);
    procedure BuildDisplay;
    procedure SetTableRowHeights;

    procedure RefreshGraph(Sender: TObject);
    procedure RefreshLengthGraph(Sender: TObject);
    procedure RefreshGraphDirList(Sender: TObject);
    procedure BuildUserDetailsGraph(sender : TObject);

    procedure RefreshTableDisplay(tableID : integer);

    procedure UpdateReportFrameWithData(aDataIndex : integer);

    function  SaveReports(var TextOptions : TTextReportOptions; var CSVOptions  : TCSVReportOptions;
                          var HTMLOptions : THTMLReportOptions; var XinOptions  : TXinorbisReportOptions;
                          var XMLOptions  : TXMLReportOptions;  var TreeOptions : TTreeReportOptions): boolean;

    procedure AddNullFolder(const aFileName : string);
    procedure AddTempFile(const aFileName, aSizeWords, aSize : string);

    procedure ClearEverything; // used if scan is cancelled

    property ActivePage                  : integer                  read GetActivePage            write SetActivePage;
    property OnSetStatusBarText          : TSetStatusBarText        read FSetStatusBarText        write FSetStatusBarText;
    property OnSetTutorialBarText        : TSetTutorialBarText      read FSetTutorialBarText      write FSetTutorialBarText;
    property OnNewScan                   : TScanWithNewPath         read FScanWithNewPath         write FScanWithNewPath;
    property OnNewSearch                 : TSearchWithParameter     read FOnNewSearch             write FOnNewSearch;
    property OnNewSummary                : TNewSummary              read FOnNewSummary            write FOnNewSummary;
    property OnSettingsTab               : TOpenSettingsTab         read FOnOpenSettingsTab       write FOnOpenSettingsTab;
    property OnProcessWindowStatusChange : TProcessWindowStatus     read FOnProcessWindowStatus   write FOnProcessWindowStatus;
    property OnChartsHaveChanged         : TChartsHaveChanged       read FChartsHaveChanged       write FChartsHaveChanged;

    property GetLeftOffset               : TGetLeftOffset           read FGetLeftOffset           write FGetLeftOffset;
    property GetTopOffset                : TGetTopOffset            read FGetTopOffset            write FGetTopOffset;

    property IsFHUpdateThreadRunning     : TIsFHUpdateThreadRunning read FIsFHUpdateThreadRunning write FIsFHUpdateThreadRunning;

    property Source                      : integer                  read FSource                  write FSource;
  end;


implementation

{$R *.dfm}

uses
  System.UITypes,

  X.FileExtension, X.FileExtensionsObject, X.Dialogs.Colour, X.Dialogs.Dialog, X.SearchUtility,
  X.gridutility,

  X.Conversions, X.Form.Explore, X.Form.ChartOptions, X.Form.GetCopyMove, X.Dialogs.Save, X.Form.ShowMD5, X.CUserData,

  X.Constants, X.GlobalObjects, X.Global, X.Settings, X.Utility, X.MD5, X.ZipFiles,

  X.TreeUtility, X.DisplayUtility;


const
  CGridTemp            = 0;
  CGridTop101Big       = 2;
  CGridTop101Small     = 3;
  CGridTop101BigDate   = 6;
  CGridTop101SmallDate = 7;
  CGridExtension       = 8;

  CColumnIdentifier    = 0;
  CColumnCountGraph    = 3;
  CCOlumnSizeGraph     = 6;

  CCreatedDate  = 0;
  CAccessedDate = 1;
  CModifiedDate = 2;


{$region init}
procedure TFrameReports.Init;
var
  t : integer;
  lFA : array[1..3] of string;

begin
  lFA[1] := XText[rsCreated];
  lFA[2] := XText[rsAccessed];
  lFA[3] := XText[rsModified];

  TableDisplay[1]  := miTD1;  TableDisplay[2]  := miTD2;  TableDisplay[3]  := miTD3;  TableDisplay[4]  := miTD4;  TableDisplay[5]  := miTD5;
  TableDisplay[6]  := miTD6;  TableDisplay[7]  := miTD7;  TableDisplay[8]  := miTD8;  TableDisplay[9]  := miTD9;  TableDisplay[10] := miTD10;
  TableDisplay[11] := miTD11; TableDisplay[12] := miTD12; TableDisplay[13] := miTD13; TableDisplay[14] := miTD14; TableDisplay[15] := miTD15;
  TableDisplay[16] := miTD16; TableDisplay[17] := miTD17; TableDisplay[18] := miTD18; TableDisplay[19] := miTD19;

  FCharts[1] := vtcMain;      FCharts[2] := vtcTree;      FCharts[3] := vtcDirList;
  FCharts[4] := vtcMagnitude; FCharts[5] := vtcFileDates; FCharts[6] := vtcTemp;
  FCharts[7] := vtcUsers;     FCharts[8] := vtcHistory;   FCharts[9] := vtcLength;

  cbFileDates.Clear;

  // ==============================================================================================

  miOtherAddTo.Caption               := XText[rsAddTo];
  miOA1.Caption                      := XText[rsPrograms];
  miOA2.Caption                      := XText[rsSystem];
  miOA3.Caption                      := XText[rsGraphics];
  miOA4.Caption                      := XText[rsMovie];
  miOA5.Caption                      := XText[rsAudio];
  miOA6.Caption                      := XText[rsOffice];
  miOA7.Caption                      := XText[rsProgramming];
  miOA8.Caption                      := XText[rsCompressed];
  miCustomEM.Caption                 := XText[rsCustom];
  miOA9.Caption                      := XText[rsCustom1];
  miOA10.Caption                     := XText[rsCustom2];
  miOA11.Caption                     := XText[rsCustom3];
  miOA12.Caption                     := XText[rsCustom4];
  miOA13.Caption                     := XText[rsCustom5];
  miOA14.Caption                     := XText[rsCustom6];
  miOA15.Caption                     := XText[rsCustom7];
  miOA16.Caption                     := XText[rsCustom8];
  miOA17.Caption                     := XText[rsCustom9];
  miOA18.Caption                     := XText[rsCustom10];

  miShowOtherFiles.Caption           := XText[rsShowFiles];
  miExtensionsExportTableCSV.Caption := XText[rsCopyTableToClipboard];
  SaveasCSV2.Caption                 := XText[rsSaveAs] + ' CSV';

  // ==============================================================================================

  miMagnitudeExport.Caption   := XText[rsExportSelectedFile] + rsEllipsis;
  miMagnitudeZip.Caption      := XText[rsAddZipFile] + rsEllipsis;
  miMagnitudeExportCB.Caption := XText[rsCopyTableToClipboard];

  // ==============================================================================================

  miUsersExportSelected.Caption   := XText[rsExportContent] + rsEllipsis;
  miUsersZip.Caption              := XText[rsAddZipFile] + rsEllipsis;
  miUsersExportSelectedCB.Caption := XText[rsCopyTableToClipboard];

  // ==============================================================================================

  miFCO.Caption        := XText[rsFilter];
  miFCOShowAll.Caption := XText[rsShowAll];

  // ==============================================================================================

  miTableExportSelected.Caption   := XText[rsExportSelectedFile] + rsEllipsis;
  miTableZip.Caption              := XText[rsAddZipFile] + rsEllipsis;
  miTableExportSelectedCB.Caption := XText[rsCopyTableToClipboard];

  // ==============================================================================================

  miNFExplore.Caption    := XText[rsExploreFolder];
  miNFProperties.Caption := XText[rsFileProperties];

  // ==============================================================================================

  miNFExploreFolder.Caption    := XText[rsExploreFolder];
  miNFFolderProperties.Caption := XText[rsFileProperties];

  // ==============================================================================================

  miTDShowAll.Caption     := XText[rsShowAll];
  miTDNonZero.Caption     := XText[rsShowNonZero];
  miTDUserDefined.Caption := XText[rsUserDefined];
  miTDCustom.Caption      := XText[rsCustom] + rsEllipsis;

  miLengthShowAll.Caption := XText[rsShowAll];
  miLengthNonZero.Caption := XText[rsShowNonZero];

  // ==============================================================================================

  miFolderMoreDetail.Caption       := XText[rsMoreDetail] + rsEllipsis;
  miScanFromDirList.Caption        := XText[rsAnalyseThisFolder];
  miExploreFromDirList.Caption     := XText[rsExploreThisFolder];
  miFolderExportSelectedCB.Caption := XText[rsCopyTableToClipboard];

  // ==============================================================================================

  MenuItem20.Caption            := XText[rsViewOpenFile];
  MenuItem18.Caption            := XText[rsOpenWithCustomViewer];
  miFileDatesExploreDir.Caption := XText[rsExploreFolder];
  miFileDatesInfo.Caption       := XText[rsFileProperties];
  miDGenerateMD5.Caption        := XText[rsGenerateMD5];
  miFileDatesExport.Caption     := XText[rsExportContent] + rsEllipsis;
  miFileDatesExportCB.Caption   := XText[rsCopyTreeClipboard];

  // ==============================================================================================

  miTypeExportContent.Caption := XText[rsExportContent] + rsEllipsis;
  miTypeZip.Caption           := XText[rsAddZipFile] + rsEllipsis;
  miTypeExportCB.Caption      := XText[rsCopyTreeClipboard];

  // ==============================================================================================

  miChartOptions.Caption         := XText[rsChartOptions];
  miCOSave.Caption               := XText[rsSaveChart];
  miCOCopy.Caption               := XText[rsCopyChartToClipboard];
  miCOAdvanced.Caption         := XText[rsAdvancedOptions];

  // ==============================================================================================

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

  // ==============================================================================================

  lHFrom.Caption:= XText[rsFrom] + ':';
  lHTo.Caption:= XText[rsTo] + ':';


  rbGraphSize.Caption            := XText[rsBySize];
  cbTreeSize.Caption             := XText[rsBySize];
  cbGraphSizeDirList.Caption     := XText[rsBySize];
  cbGraphSizeMagnitude.Caption   := XText[rsBySize];
  rbDatesSize.Caption            := XText[rsBySize];
  rbTempSize.Caption             := XText[rsBySize];
  rbUsersSize.Caption            := XText[rsBySize];
  rbLengthGraphSize.Caption      := XText[rsBySize];

  rbGraphQuantity.Caption          := XText[rsByQuantity];
  cbTreeQuantity.Caption           := XText[rsByQuantity];
  cbGraphQuantityDirList.Caption   := XText[rsByQuantity];
  cbGraphQtyMagnitude.Caption      := XText[rsByQuantity];
  rbDatesQuantity.Caption          := XText[rsByQuantity];
  rbTempQuantity.Caption           := XText[rsByQuantity];
  rbUsersQuantity.Caption          := XText[rsByQuantity];
  rbLengthGraphCount.Caption       := XText[rsByQuantity];

  sbCollapseNodes.Caption          := XText[rsCollapseNodes];

  cbTopUsers.Clear;
  cbTop101DatesUser.Clear;
  cbTopUsers.Items.Add(XText[rsAllUsers]);
  cbTop101DatesUser.Items.Add(XText[rsAllUsers]);

  cbTopColourCode.Caption       := XText[rsColourCode];
  cbTopDateColourCode.Caption   := XText[rsColourCode];
  cbExtensionColourCode.Caption := XText[rsColourCode];
  lHFrom.Caption                := XText[rsFrom] + ':';
  lHTo.Caption                  := XText[rsTo] + ':';
  lHInterval.Caption            := XText[rsInterval] + ':';
  gbHistory.Caption             := XText[rsOptions];
  lHUser.Caption                := XText[rsUsers];
  rbHQuantity.Caption           := XText[rsQuantity];
  rbHSize.Caption               := XText[rsSize];
  cbHCumulative.Caption         := XText[rsCumulative];

  tsHistory.Caption             := XText[rsHistory] + '        ';
  tsUsers.Caption               := XText[rsUsers] + '        ';
  tsTemp.Caption                := XText[rsTemp] + '        ';
  tsFileDates.Caption           := XText[rsDates] + '        ';
  tsTop50.Caption               := XText[rsTop101] + '        ';
  tsTop101FileSize.Caption      := XText[rsBySize] + '        ';
  tsNullFiles.Caption           := XText[rsNull] + '        ';
  tsTop101Date.Caption          := XText[rsByDate] + '        ';
  tsTable.Caption               := XText[rsCategories] + '        ';
  tsFileTypes.Caption           := XText[rsType] + '        ';
  tsFolderList.Caption          := XText[rsFolders] + '        ';
  tsExtensions.Caption          := XText[rsExtensions] + '        ';
  tsMagnitude.Caption           := XText[rsMagnitude] + '        ';
  tsLength.Caption              := XText[rsLength] + '        ';

  cbHInterval.Items.Add(XText[rsDay]);
  cbHInterval.Items.Add(XText[rsWeek]);
  cbHInterval.Items.Add(XText[rsMonth]);
  cbHInterval.Items.Add(XText[rsYear]);
  cbHInterval.Items.Add(XText[rsHour]);

  pNullFilesTitle.Caption := XText[rsNullFiles];
  pEmptyFoldersTitle.Caption := XText[rsEmptyFolders];

  sbFolderMoreDetail.Caption:= XText[rsMoreDetail] + rsEllipsis;

  cbAutoRefreshHistory.Caption   := XText[rsAutoRefresh];
  bHistoryRefresh.Caption   := XText[rsRefresh];

  cbExtensionsAll.Caption    := XText[rsShowCategorised];
  cbExtensionsCustom.Caption := XText[rsShowCustom];
  cbExtensionsOther.Caption  := XText[rsShowUncategorised];

  cbUsersDisplayMode.Clear;
  cbUsersDisplayMode.Items.Add(XText[rsShowAll]);

  lUsersWarning.Caption := XText[rsUsersWarning];
  lTempWarning.Caption  := XText[rsTempFilesWarning];

  for t := 1 to __FileCategoriesCount do begin
    cbUsersDisplayMode.Items.Add(' - ' + TypeDescriptions[t]);
    TableDisplay[t].Caption := TypeDescriptions[t];
  end;

  for t := 1 to 3 do begin
    cbFileDates.Items.Add(lFA[t]);
    cbTop101Dates.Items.Add(lFA[t]);
    cbHDateSelect.Items.Add(lFA[t]);
  end;

  GXGuiUtil.SetPieBarImages(sbMainPie, sbMainBar);
  GXGuiUtil.SetPieBarImages(sbTreePie, sbTreeBar);
  GXGuiUtil.SetPieBarImages(sbDirListPie, sbDirListBar);
  GXGuiUtil.SetPieBarImages(sbMagnitudePie, sbMagnitudeBar);
  GXGuiUtil.SetPieBarImages(sbFileDatesPie, sbFileDatesBar);
  GXGuiUtil.SetPieBarImages(sbUsersPie, sbUsersBar);
  GXGuiUtil.SetPieBarImages(sbLengthPie, sbLengthBar);

  cbOtherSuggestions.Width := Panel13.Width;

  pNullFiles.Height := Round(tsNullFiles.Height / 2);

  cbFileDates.ItemIndex        := 0;
  cbTop101Dates.ItemIndex      := 0;
  cbHDateSelect.ItemIndex      := 0;
  cbHInterval.ItemIndex        := 0;
  cbUsersDisplayMode.ItemIndex := 0;

  splitDirListMoved(nil);
  splitMagnitudeMoved(nil);
  splitterTempMoved(Nil);
  splitterTop50Moved(Nil);
  splitterTopDateMoved(Nil);
  splitUsersMoved(Nil);
  splitterTreeMoved(Nil);

  SetTheme;

  InitDisplayDoOnce;
  InitUpdate;

  SetTableRowHeights;
end;


procedure TFrameReports.SetTheme;
begin
  TThemeHelper.SetSmoothTabPager(pMainReports);
  TThemeHelper.SetSmoothTabPager(astpTop101);

  TThemeHelper.SetSmoothTabPage(tsTable);
  TThemeHelper.SetSmoothTabPage(tsFileTypes);
  TThemeHelper.SetSmoothTabPage(tsExtensions);
  TThemeHelper.SetSmoothTabPage(tsFolderList);
  TThemeHelper.SetSmoothTabPage(tsMagnitude);
  TThemeHelper.SetSmoothTabPage(tsFileDates);
  TThemeHelper.SetSmoothTabPage(tsTemp);
  TThemeHelper.SetSmoothTabPage(tsLength);
  TThemeHelper.SetSmoothTabPage(tsHistory);
  TThemeHelper.SetSmoothTabPage(tsUsers);
  TThemeHelper.SetSmoothTabPage(tsTop50);
  TThemeHelper.SetSmoothTabPage(tsTop101FileSize);
  TThemeHelper.SetSmoothTabPage(tsTop101Date);
  TThemeHelper.SetSmoothTabPage(tsNullFiles);
end;


procedure TFrameReports.InitHints;
begin
{}
end;


procedure TFrameReports.InitUpdate;
var
  i : integer;

begin
  pUsersWarning.Visible     := not(XSettings.Optimisations.GetUserDetails);
  pTempFilesWarning.Visible := not(XSettings.Optimisations.GetTempFiles);

  SetTableRowHeights;

  for i := 1 to __ChartCount do begin
    TChartUtility.SetAdvancedOptions(FCharts[i], XSettings.Charts.Options);
  end;
end;


procedure TFrameReports.InitDisplayDoOnce;
var
  t : integer;

begin
  TGridUtility.ConfigureInfoTable(sgMainReport);
  TGridUtility.ConfigureInfoTypes(sgFileTypes);
  TGridUtility.ConfigureInfoExtensions(sgExtension);
  TGridUtility.ConfigureInfoUsers(sgUsers);
  TGridUtility.ConfigureInfoFolders(sgDirList);
  TGridUtility.ConfigureInfoMagnitude(sgMagnitude);
  TGridUtility.ConfigureInfoLength(sgLength);

  cbMagnitudeScope.Items.Add(XText[rsAll]);

  for t := 1 to 19 do
    cbMagnitudeScope.Items.Add(TypeDescriptions[t]);

  cbMagnitudeScope.ItemIndex := 0;

  TGridUtility.Configure101DateTable(sgTop101BigDate, XText[rsNewestFiles]);
  TGridUtility.Configure101DateTable(sgTop101SmallDate, XText[rsOldestFiles]);

  sgTop50Big.Cells[0, 0]   := XText[rsLargestFiles];
  sgTop50Big.Cells[1, 0]   := XText[rsSize];
  sgTop50Big.Cells[2, 0]   := XText[rsFileOwner];

  sgTop50Small.Cells[0, 0] := XText[rsSmallestFiles];
  sgTop50Small.Cells[1, 0] := XText[rsSize];

  sgTemp.Cells[0, 0] := XText[rsFileName];
  sgTemp.Cells[1, 0] := XText[rsSize];
  sgTemp.HideColumn(2);

  LoadSettings;
end;


procedure TFrameReports.UpdateGUICustomNames;
var
  t : integer;

begin
  miOA9.Caption  := TypeDescriptions[10];
  miOA10.Caption := TypeDescriptions[11];
  miOA11.Caption := TypeDescriptions[12];
  miOA12.Caption := TypeDescriptions[13];
  miOA13.Caption := TypeDescriptions[14];
  miOA14.Caption := TypeDescriptions[15];
  miOA15.Caption := TypeDescriptions[16];
  miOA16.Caption := TypeDescriptions[17];
  miOA17.Caption := TypeDescriptions[18];
  miOA18.Caption := TypeDescriptions[19];

    for t := 10 to __FileCategoriesCount do begin
      sgMainReport.Cells[1, t] := TypeDescriptions[t];
    end;

    cbUsersDisplayMode.Clear;
    cbUsersDisplayMode.Items.Add(XText[rsShowAll]);

    cbUsersDisplayMode.ItemIndex := 0;


    for t := 1 to __FileCategoriesCount do begin
      cbUsersDisplayMode.Items.Add(' - ' + TypeDescriptions[t]);

      TableDisplay[t].Caption      := TypeDescriptions[t];
    end;

    cbUsersDisplayMode.ItemIndex := 0;
end;


{$endregion}


procedure TFrameReports.LoadSettings;
var
  t, lChart : integer;

begin
  if XSettings.OpenSettings(True) then begin

    sgMainReport.Width            := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_sgMainReport_' + IntToStr(FSource), 284, 284);
    sgDirList.Width               := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_sgDirList_' + IntToStr(FSource),    336, 336);

    if sgMainReport.Width <= 284 then sgMainReport.Width := 284;
    if sgDirList.Width    <= 336 then sgDirList.Width    := 336;

    sgMagnitude.Width             := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_sgMagnitude_' + IntToStr(FSource),  350, 350);
    tvFileTypes.Width             := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_tvMain_' + IntToStr(FSource),       209, 209);
    vtcTree.Width                 := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_vtcTree_' + IntToStr(FSource),      250, 250);
    pTop101.Width                 := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_Top50_' + IntToStr(FSource),        Round(Width / 2), Round(Width / 2));
    sgTop101BigDate.Width         := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_Top101Dates_' + IntToStr(FSource),  Round(Width / 2), Round(Width / 2));
    pUsers.Width                  := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_Users_' + IntToStr(FSource),        350, 350);
    tvFileDates.Width             := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_vtcFileDates_' + IntToStr(FSource), 200, 200);

    sgLength.Width                := XSettings.ReadIntegerFromSettings('Prefs', 'Sizes_sgLength_' + IntToStr(FSource), 284, 284);

    // ===========================================================================

    for t := 1 to __ChartCount do begin
      lChart := XSettings.ReadIntegerFromSettings('Charts', 'Report_' + IntToStr(FSource) + '_' + IntToStr(t), 0, -1);

      TChartUtility.SetChartType(FCharts[t], lChart);
    end;

    XSettings.CloseSettings;
  end
  else
    TMSLogger.Error('Error loading settings from FrameReports.');
end;


procedure TFrameReports.SaveSettings;
var
  t : integer;

begin
  if XSettings.OpenSettings(False) then begin
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_sgMainReport_' + IntToStr(FSource), sgMainReport.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_sgDirList_'    + IntToStr(FSource), sgDirList.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_sgMagnitude_'  + IntToStr(FSource), sgMagnitude.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_tvMain_'       + IntToStr(FSource), tvFileTypes.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_vtcTree_'      + IntToStr(FSource), vtcTree.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_vtcFileDates_' + IntToStr(FSource), tvFileDates.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_Top50_'        + IntToStr(FSource), pTop101.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_Top101Dates_'  + IntToStr(FSource), sgTop101BigDate.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_Users_'        + IntToStr(FSource), pUsers.Width);
    XSettings.WriteIntegerToSettings('Prefs', 'Sizes_sgLength_'     + IntToStr(FSource), sgLength.Width);

    // ===========================================================================

    for t := 1 to __ChartCount do begin
      XSettings.WriteIntegerToSettings('Charts', 'Report_' + IntToStr(FSource) + '_' + IntToStr(t), TChartUtility.GetChartType(FCharts[t]));
    end;

    XSettings.CloseSettings;
  end
  else
    TMSLogger.Error('Error saving FrameReports settings.');
end;


procedure TFrameReports.ResetDisplay;
begin
  dtpHFrom.DateTime := Now;
  dtpHTo.DateTime   := Now;
end;


procedure TFrameReports.lUsersWarningClick(Sender: TObject);
begin
  if Assigned(FOnOpenSettingsTab) then
    FOnOpenSettingsTab(2);
end;


procedure TFrameReports.JustInTimeDisplay(tabtodisplay : integer);
 begin
  if XSettings.System.JustInTimeProcessed[FSource, tabtodisplay] = False then begin
    case tabtodisplay of
      TabIndexExtensions    : {};
      TabIndexHistory       : lHistoryResults.HTMLText[0] := TDisplayUtility.InformationTabHistoryGraph(FSource, vtcHistory, cbHUsers, HGraphData,
                                                                                                        dtpHFrom.Date, dtpHTo.Date, cbHInterval.ItemIndex, cbHDateSelect.ItemIndex,
                                                                                                        rbHQuantity.Checked, cbHCumulative.Checked, cbHInterval.Items[cbHInterval.ItemIndex], capacityBarHistory);
      TabIndexTop50         : {};
      TabIndexNull          : TDisplayUtility.InformationTabNullFiles(FSource, sgNullFiles);
      TabIndexUsers         : begin
                                 TDisplayUtility.InformationTabUsersTable(FSource, cbUsersDisplayMode.ItemIndex, sgUsers);

                                 BuildUserDetailsGraph(Nil);
                              end;
      TabIndexTemp          : {};

      TabIndexDatesCreated  : begin
                                cbFileDates.ItemIndex := 0;
                                TDisplayUtility.InformationTabFileDatesTree(FSource, cbFileDates.ItemIndex, cbFileDatesUsers, XSettings.Optimisations.BuildDateTree, tvFileDates, vtcFileDates, rbDatesQuantity.Checked, capacityBarDates);
                              end;
      TabIndexDatesAccessed : begin
                                cbFileDates.ItemIndex := 1;
                                TDisplayUtility.InformationTabFileDatesTree(FSource, cbFileDates.ItemIndex, cbFileDatesUsers, XSettings.Optimisations.BuildDateTree, tvFileDates, vtcFileDates, rbDatesQuantity.Checked, capacityBarDates);
                              end;
      TabIndexDatesModified : begin
                                cbFileDates.ItemIndex := 2;
                                TDisplayUtility.InformationTabFileDatesTree(FSource, cbFileDates.ItemIndex, cbFileDatesUsers, XSettings.Optimisations.BuildDateTree, tvFileDates, vtcFileDates, rbDatesQuantity.Checked, capacityBarDates);
                              end;
    end;

    XSettings.System.JustInTimeProcessed[FSource, tabtodisplay] := True;
  end;
end;


procedure TFrameReports.PreScan;
begin
  TGridUtility.ClearStringGird(sgTemp, False);
  TGridUtility.ClearStringGird(sgNullFiles, false);
  TGridUtility.ClearStringGird(sgNullFolders, false);

  sgTemp.BeginUpdate;
  sgNullFiles.BeginUpdate;
  sgNullFolders.BeginUpdate;
end;


procedure TFrameReports.PostScan;
begin
  if sgNullFolders.RowCount = 2 then
    sgNullFolders.Cells[0, 1] := XText[rsNoneFound]
  else
    sgNullFolders.RowCount := sgNullFolders.RowCount - 1;

  sgTemp.EndUpdate;
  sgNullFiles.EndUpdate;
  sgNullFolders.EndUpdate;
end;


procedure TFrameReports.BuildDisplay;
 var
  t : integer;

 begin
  ResetDisplay;

  try
    TDisplayUtility.InformationTabTableTable(FSource, 1, sgMainReport);
    TDisplayUtility.InformationTabFolderTable(FSource, sgDirList);
    TDisplayUtility.InformationTabTypesList(FSource, sgFileTypes);
    TDisplayUtility.InformationTabMagnitudeTable(FSource, cbMagnitudeScope.ItemIndex, sgMagnitude);
    TDisplayUtility.InformationTabUsersTable(FSource, cbUsersDisplayMode.ItemIndex, sgUsers);
    TDisplayUtility.InformationTabLengthTable(FSource, 3, sgLength);
  except
    on e : exception do begin
      TMSLogger.Error('Error FrameReports builddisplay: ' + e.ClassName + ' / ' + e.Message);
    end;
  end;

  RefreshGraphDirList(nil);
  RefreshLengthGraph(Nil);

  BuildTree;

  TDisplayUtility.InformationTabMagnitudeGraph(FSource, cbMagnitudeScope.ItemIndex, vtcMagnitude, cbGraphSizeMagnitude.Checked);

  // ======================================================================

  cbTopUsers.Clear;
  cbTop101DatesUser.Clear;
  cbFileDatesUsers.Clear;
  cbHUsers.Clear;
  cbTopUsers.Items.Add(XText[rsAllUsers]);
  cbTop101DatesUser.Items.Add(XText[rsAllUsers]);
  cbFileDatesUsers.Items.Add(XText[rsAllUsers]);
  cbHUsers.Items.Add(XText[rsAllUsers]);

  for t := 0 to GScanDetails[FSource].Users.Count - 1 do begin
    cbTopUsers.Items.Add(GScanDetails[FSource].Users[t].Name);
    cbTop101DatesUser.Items.Add(GScanDetails[FSource].Users[t].Name);
    cbFileDatesUsers.Items.Add(GScanDetails[FSource].Users[t].Name);
    cbHUsers.Items.Add(GScanDetails[FSource].Users[t].Name);
  end;

  cbTopUsers.ItemIndex        := 0;
  cbTop101DatesUser.ItemIndex := 0;
  cbFileDatesUsers.ItemIndex  := 0;
  cbHUsers.ItemIndex          := 0;

  // ======================================================================

  BuildUserDetailsGraph(Nil);
  pTop101Left.Caption     := TDisplayUtility.BuildTop101FileSize(FSource, sgTop50Big, sgTop50Small, cbTopUsers, capacityTop101);
  pTop101DateLeft.Caption := TDisplayUtility.BuildTop101Date(FSource, sgTop101BigDate, sgTop101SmallDate, cbTop101DatesUser, cbTop101Dates);

  // =====================================================================

  if not(XSettings.Optimisations.JustInTimeDisplay) then begin
    TDisplayUtility.InformationTabFileDatesTree(FSource, cbFileDates.ItemIndex, cbFileDatesUsers, XSettings.Optimisations.BuildDateTree, tvFileDates, vtcFileDates, rbDatesQuantity.Checked, capacityBarDates);
    TDisplayUtility.InformationTabFileExtensions(FSource, cbExtensionsAll, cbExtensionsCustom, cbExtensionsOther, sgExtension);
    TDisplayUtility.InformationTabNullFiles(FSource, sgNullFiles);

    lTempStatus.HTMLText[0]     := TDisplayUtility.BuildTempChart(FSource, sgTemp, vtcTemp, rbTempSize.Checked);

    lHistoryResults.HTMLText[0] := TDisplayUtility.InformationTabHistoryGraph(FSource, vtcHistory, cbHUsers, HGraphData,
                                                                              dtpHFrom.Date, dtpHTo.Date, cbHInterval.ItemIndex,
                                                                              cbHDateSelect.ItemIndex, rbHQuantity.Checked,
                                                                              cbHCumulative.Checked, cbHInterval.Items[cbHInterval.ItemIndex], capacityBarHistory);
  end;
end;


function TFrameReports.GetActivePage: integer;
begin
  Result := pMainReports.ActivePageIndex;
end;


procedure TFrameReports.SetActivePage(aNewPage : integer);
begin
  pMainReports.ActivePageIndex := aNewPage;
end;


procedure TFrameReports.SetTableRowHeights;
begin
{  sgMainReport.DefaultRowHeight     := XSettings.General.RowHeight;
  sgFileTypes.DefaultRowHeight      := XSettings.General.RowHeight;
  sgExtension.DefaultRowHeight      := XSettings.General.RowHeight;
  sgDirList.DefaultRowHeight        := XSettings.General.RowHeight;
  sgMagnitude.DefaultRowHeight      := XSettings.General.RowHeight;
  sgTop50Big.DefaultRowHeight       := XSettings.General.RowHeight;
  sgTop50Small.DefaultRowHeight     := XSettings.General.RowHeight;
  sgUsers.DefaultRowHeight          := XSettings.General.RowHeight;
  sgTemp.DefaultRowHeight           := XSettings.General.RowHeight;}
end;


procedure TFrameReports.UpdateReportFrameWithData(aDataIndex : integer);
begin
  TDisplayUtility.InformationTabTableTable(aDataIndex, 1, sgMainReport);
  TDisplayUtility.InformationTabFolderTable(aDataIndex, sgDirList);
  TDisplayUtility.InformationTabTypesList(aDataIndex, sgFileTypes);
  TDisplayUtility.InformationTabMagnitudeTable(aDataIndex, cbMagnitudeScope.ItemIndex, sgMagnitude);
  TDisplayUtility.InformationTabUsersTable(FSource, cbUsersDisplayMode.ItemIndex, sgUsers);
  TDisplayUtility.InformationTabLengthTable(FSource, 3, sgLength);

  RefreshGraphDirList(nil);

  BuildTree;

  TDisplayUtility.InformationTabMagnitudeGraph(aDataIndex, cbMagnitudeScope.ItemIndex, vtcMagnitude, cbGraphSizeMagnitude.Checked);
  TDisplayUtility.InformationTabFileDatesTree(aDataIndex, cbFileDates.ItemIndex, cbFileDatesUsers, XSettings.Optimisations.BuildDateTree, tvFileDates, vtcFileDates, rbDatesQuantity.Checked, capacityBarDates);
  pTop101Left.Caption     := TDisplayUtility.BuildTop101FileSize(aDataIndex, sgTop50Big, sgTop50Small, cbTopUsers, capacityTop101);
  pTop101DateLeft.Caption := TDisplayUtility.BuildTop101Date(aDataIndex, sgTop101BigDate, sgTop101SmallDate, cbTop101DatesUser, cbTop101Dates);

  lTempStatus.HTMLText[0] := TDisplayUtility.BuildTempChart(FSource, sgTemp, vtcTemp, rbTempSize.Checked);
  BuildUserDetailsGraph(Nil);
  lHistoryResults.HTMLText[0] := TDisplayUtility.InformationTabHistoryGraph(aDataIndex, vtcHistory, cbHUsers,HGraphData, dtpHFrom.Date,
                                                                                dtpHTo.Date, cbHInterval.ItemIndex, cbHDateSelect.ItemIndex,
                                                                                rbHQuantity.Checked, cbHCumulative.Checked, cbHInterval.Items[cbHInterval.ItemIndex], capacityBarHistory);
  TDisplayUtility.InformationTabNullFiles(aDataIndex, sgNullFiles);

  if Assigned(FOnNewSummary) then
    FOnNewSummary(FSource, 0);

  RefreshGraph(nil);
  RefreshLengthGraph(Nil);
end;


procedure TFrameReports.MenuItem18Click(Sender: TObject);
begin
  if FileExists(tvFileDates.Selected.Text) then
    TXWindows.ExecuteFile(0, '"' +XSettings.General.CustomViewer + '"', '"' + tvFileDates.Selected.Text + '"', '');
end;


procedure TFrameReports.MenuItem20Click(Sender: TObject);
begin
  if FileExists(tvFileDates.Selected.Text) then
    TXWindows.ExecuteFile(0, '"' + tvFileDates.Selected.Text + '"', '', '');
end;


procedure TFrameReports.miCCustomFromClick(Sender: TObject);
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


procedure TFrameReports.miCCustomToClick(Sender: TObject);
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


procedure TFrameReports.miCOAdvancedClick(Sender: TObject);
var
  mychart : TChart;
  tceo    : TChartOptions;

begin
  Assert(sender <> Nil, 'miCOAdvancedClick :: sender is nil');

  mychart := TChart(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

  tceo := XSettings.Charts.Options;

  tceo.ChartType := TChartUtility.GetChartType(mychart);

  // ===========================================================================

  tceo := DoAdvancedChartOptions(tceo);

  // ===========================================================================

  if tceo.Result = 1  then begin
    TChartUtility.SetAdvancedOptions(mychart, tceo);

    if Assigned(FChartsHaveChanged) then
      FChartsHaveChanged;
  end;
end;


procedure TFrameReports.miCOCopyClick(Sender: TObject);
  var
  mychart : TChart;

 begin
  mychart := TChart(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

  TChartUtility.CopyChartToClipboard(mychart);
end;


procedure TFrameReports.miCopyAllClick(Sender: TObject);
 var
  s : string;
  t : integer;

 begin
  s := GetCopyMoveFolder(XText[rsCopyTo] + rsEllipsis);

  if s <> '' then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      CGridTemp        : begin
                           for t := 1 to sgTemp.RowCount - 1 do
                             CopyFile(PChar(sgTemp.Cells[0, t]),
                                      PChar(s + ExtractFileName(sgTemp.Cells[0, t])),
                                      False);
                         end;
      CGridTop101Big   : begin
                           for t := 1 to sgTop50Big.RowCount - 1 do
                             CopyFile(PChar(sgTop50Big.Cells[0, t]),
                                      PChar(s + ExtractFileName(sgTop50Big.Cells[0, t])),
                                      False);
                         end;
      CGridTop101Small : begin
                           for t := 1 to sgTop50Small.RowCount - 1 do
                             CopyFile(PChar(sgTop50Small.Cells[0, t]),
                                      PChar(s + ExtractFileName(sgTop50Small.Cells[0, t])),
                                      False);
                         end;
    end;
  end;
end;


procedure TFrameReports.miCopySelectedClick(Sender: TObject);
var
  s : string;
begin
  s := GetCopyMoveFolder(XText[rsCopyTo] + rsEllipsis);

  if s <> '' then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      CGridTemp            : CopyFile(PChar(sgTemp.Cells[0, sgTemp.Selection.Top]),
                                      PChar(s + ExtractFileName(sgTemp.Cells[0, sgTemp.Selection.Top])),
                                      False);

      CGridTop101Big       : CopyFile(PChar(sgTop50Big.Cells[0, sgTop50Big.Selection.Top]),
                                      PChar(s + ExtractFileName(sgTop50Big.Cells[0, sgTop50Big.Selection.Top])),
                                      False);
      CGridTop101Small     : CopyFile(PChar(sgTop50Small.Cells[0, sgTop50Small.Selection.Top]),
                                      PChar(s + ExtractFileName(sgTop50Small.Cells[0, sgTop50Small.Selection.Top])),
                                      False);

      CGridTop101BigDate   : CopyFile(PChar(sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top]),
                                      PChar(s + ExtractFileName(sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top])),
                                      False);
      CGridTop101SmallDate : CopyFile(PChar(sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top]),
                                      PChar(s + ExtractFileName(sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top])),
                                      False);
    end;
  end;
end;


procedure TFrameReports.miCOSaveClick(Sender: TObject);
var
  mychart : TChart;
  lFileName : string;

begin
  lFileName := TXSaveDialog.ExecuteImages(TUtility.GetDefaultFileName('.txt', XText[rsTable] + '_' + XText[rsExport]));

  if lFileName <> '' then begin
    mychart := TChart(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

    TChartUtility.SaveChartToPNG(mychart, lFileName);
  end;
end;


procedure TFrameReports.miDeleteAllClick(Sender: TObject);
 var
  t : integer;

 begin
  if MessageDlg(XText[rsDialog4], mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      CGridTemp        : begin
                           for t := 1 to sgTemp.RowCount - 1 do
                             TXWindows.SendToRecycleBin(sgTemp.Cells[0, t]);
                         end;
      CGridTop101Big   : begin
                           for t := 1 to sgTop50Big.RowCount - 1 do
                             TXWindows.SendToRecycleBin(sgTop50Big.Cells[0, t]);
                         end;
      CGridTop101Small : begin
                           for t := 1 to sgTop50Small.RowCount - 1 do
                             TXWindows.SendToRecycleBin(sgTop50Small.Cells[0, t]);
                         end;
    end;
  end;
end;


procedure TFrameReports.miDeleteSelectedClick(Sender: TObject);
begin
  if MessageDlg(XText[rsDialog3], mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      CGridTemp            : TXWindows.SendToRecycleBin(sgTemp.Cells[0, sgTemp.Selection.Top]);

      CGridTop101Big       : TXWindows.SendToRecycleBin(sgTop50Big.Cells[0, sgTop50Big.Selection.Top]);
      CGridTop101Small     : TXWindows.SendToRecycleBin(sgTop50Small.Cells[0, sgTop50Small.Selection.Top]);

      CGridTop101BigDate   : TXWindows.SendToRecycleBin(sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top]);
      CGridTop101SmallDate : TXWindows.SendToRecycleBin(sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top]);
    end;
  end;
end;


procedure TFrameReports.miDGenerateMD5Click(Sender: TObject);
begin
  if FileExists(tvFileDates.Selected.Text) then
    ShowMD5Checksum(tvFileDates.Selected.Text, TMD5.Generate(tvFileDates.Selected.Text));
end;


procedure TFrameReports.miExploreDirectoryClick(Sender: TObject);
var
  s : string;

begin
  s := '';

  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    CGridTemp            : s := '"' + ExtractFilePath(sgTemp.Cells[0, sgTemp.Selection.Top]) + '"';

    CGridTop101Big       : s := '"' + ExtractFilePath(sgTop50Big.Cells[0, sgTop50Big.Selection.Top]) + '"';
    CGridTop101Small     : s := '"' + ExtractFilePath(sgTop50Small.Cells[0, sgTop50Small.Selection.Top]) + '"';

    CGridTop101BigDate   : s := '"' + ExtractFilePath(sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top]) + '"';
    CGridTop101SmallDate : s := '"' + ExtractFilePath(sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top]) + '"';
  end;

  if s <> '' then
    TXWindows.ExecuteFile(0, s, '', '');
end;


procedure TFrameReports.miExploreFromDirListClick(Sender: TObject);
begin
  if (sgDirList.Cells[1, sgDirList.Selection.Top] <> '  -') and
     (sgDirList.Cells[1, sgDirList.Selection.Top] <> '') then begin
    if sgDirList.Cells[1, sgDirList.Selection.Top] <> '' then begin
      if sgDirList.Cells[1, sgDirList.Selection.Top] = '\' then
        TXWindows.ExecuteFile(0, '"' +GScanDetails[FSource].ScanPath + '"', '', '')
      else
        TXWindows.ExecuteFile(0, '"' +GScanDetails[FSource].ScanPath + sgDirList.Cells[1, sgDirList.Selection.Top] + '"', '', '');
    end;
  end;
end;
             

procedure TFrameReports.miExtensionsExportTableCSVClick(Sender: TObject);
begin
  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    CGridTemp            : TGridUtility.CopyGridToClipboard(0, sgTemp);
    CGridTop101Big       : TGridUtility.CopyGridToClipboard(0, sgTop50Big);
    CGridTop101Small     : TGridUtility.CopyGridToClipboard(0, sgTop50Small);
    CGridTop101BigDate   : TGridUtility.CopyGridToClipboard(0, sgTop101BigDate);
    CGridTop101SmallDate : TGridUtility.CopyGridToClipboard(0, sgTop101SmallDate);
    CGridExtension       : TGridUtility.CopyGridToClipboard(0, sgExtension);
  end;
end;


procedure TFrameReports.miFCOShowAllClick(Sender: TObject);
begin
  if Sender <> Nil then begin
    if Sender.ClassType = TMenuItem then
      sbFolderConfig.Tag := TMenuItem(Sender).Tag;
  end;

  if cbGraphSizeDirList.Checked then
    vtcDirList.Tag := 1
  else
    vtcDirList.Tag := 0;

  TDisplayUtility.InformationTabFolderChart(FSource, sbFolderConfig.Tag, vtcDirList, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.miFileDatesExploreDirClick(Sender: TObject);
begin
  TXWindows.ExecuteFile(0, '"' + ExtractFilePath(tvFileDates.Selected.Text) + '"', '', '');
end;


procedure TFrameReports.miFileDatesExportCBClick(Sender: TObject);
begin
  TTreeUtility.CopyTreeToClipboard(tvFileDates);
end;


procedure TFrameReports.miFileDatesExportClick(Sender: TObject);
var
  lFileName : string;

begin
  lFileName := TXSaveDialog.Execute(XText[rsTextFiles] + ' (*.txt)|*.txt',
                                    '.txt',
                                    TUtility.GetDefaultFileName('.txt', XText[rsFileDates] + '_' + XText[rsExport]));

  if lFileName <> '' then begin
    try
      tvFileDates.SaveToFile(lFileName);
    except
      on e : exception do begin
        ShowXDialog(XText[rsErrorSavingReport],
                    XText[rsErrorSaving] + ' "' + lFileName + '".',
                    XDialogTypeWarning);
      end;
    end;
  end;
end;


procedure TFrameReports.miFileDatesInfoClick(Sender: TObject);
begin
  if FileExists(tvFileDates.Selected.Text) then
    TXWindows.ShowFilePropertiesDialog(Application.Handle, tvFileDates.Selected.Text);
end;


procedure TFrameReports.miFolderExportSelectedCBClick(Sender: TObject);
begin
  TGridUtility.CopyGridToClipboard(1, sgDirList);
end;


procedure TFrameReports.miFolderMoreDetailClick(Sender: TObject);
begin
  if sgDirList.Selection.Top > 0 then
    sgDirListDblClickCell(Nil, sgDirList.Selection.Top, 0);
end;


procedure TFrameReports.miGenerateMD5Click(Sender: TObject);
begin
  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    CGridTemp            : ShowMD5Checksum(sgTemp.Cells[0, sgTemp.Selection.Top], TMD5.Generate(sgTemp.Cells[0, sgTemp.Selection.Top]));

    CGridTop101Big       : ShowMD5Checksum(sgTop50Big.Cells[0, sgTop50Big.Selection.Top], TMD5.Generate(sgTop50Big.Cells[0, sgTop50Big.Selection.Top]));
    CGridTop101Small     : ShowMD5Checksum(sgTop50Small.Cells[0, sgTop50Small.Selection.Top], TMD5.Generate(sgTop50Small.Cells[0, sgTop50Small.Selection.Top]));

    CGridTop101BigDate   : ShowMD5Checksum(sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top], TMD5.Generate(sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top]));
    CGridTop101SmallDate : ShowMD5Checksum(sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top], TMD5.Generate(sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top]));
  end;
end;


procedure TFrameReports.miHexEditClick(Sender: TObject);
var
  lFileName : string;

begin
  lFileName := '';

  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    CGridTemp            : lFileName := sgTemp.Cells[0, sgTemp.Selection.Top];

    CGridTop101Big       : lFileName :=  sgTop50Big.Cells[0, sgTop50Big.Selection.Top];
    CGridTop101Small     : lFileName :=  sgTop50Small.Cells[0, sgTop50Small.Selection.Top];

    CGridTop101BigDate   : lFileName :=  sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top];
    CGridTop101SmallDate : lFileName :=  sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top];
  end;

  if lFileName <> '' then
    TXWindows.ExecuteFile(0, '"' + GSystemGlobal.ExePath + '\Be.HexEditor.exe"', lFileName, '');
end;


procedure TFrameReports.miLengthNonZeroClick(Sender: TObject);
begin
  XSettings.TabDisplayOptions[puLength.Tag][1] := '1';

  RefreshTableDisplay(puLength.Tag);
end;

procedure TFrameReports.miLengthShowAllClick(Sender: TObject);
begin
  XSettings.TabDisplayOptions[puLength.Tag][1] := '0';

  RefreshTableDisplay(puLength.Tag);
end;

procedure TFrameReports.miMagnitudeExportCBClick(Sender: TObject);
begin
  TGridUtility.CopyGridToClipboard(1, sgMagnitude);
end;


procedure TFrameReports.miMagnitudeExportClick(Sender: TObject);
 var
  wp : TextFile;
  str : string;
  t, lDataIndex : integer;
  grid : TAdvStringGrid;
  lFileName : string;

 begin
  lDataIndex := FSource;
  grid       := sgMagnitude;

  Assert(grid <> Nil, 'miMagnitudeExportClick :: Grid is nil');

  lFileName := TXSaveDialog.ExecuteReports(TUtility.GetDefaultFileName('.csv', XText[rsMagnitude] + '_' + XText[rsExport]));

  if lFileName <> '' then begin
    if UpperCase(ExtractFileExt(lFileName)) = '.TXT' then begin
      AssignFile(wp, lFileName);

      {$I-}
      Rewrite(wp);
      {$I+}

      if (IOResult <> 0) then begin
        ShowXDialog(XText[rsErrorSavingReport],
                    XText[rsErrorSaving] + ' "' + lFileName + '".',
                    XDialogTypeWarning);
      end
      else begin
        //-- file magnitudes ----------------------------------------------
        writeln(wp, TextReport[0]);
        writeln(wp, TextReport[7]);
        writeln(wp, TextReport[0]);
        writeln(wp, TextReport[2]);
        writeln(wp, TextReport[0]);

        if GScanDetails[lDataIndex].FileCount <> 0 then begin
          for t := 0 to __MagnitudesCount do begin
            str := TXFormatting.AddTrailing(' ' + magnilabels[t], 25, ' ');
            str := str + TXFormatting.AddLeading(IntToStr(GScanDetails[lDataIndex].Magnitude.Data[Category_MagnitudeAll, t, 0]), 8, ' ');
            str := str + TXFormatting.AddLeading(TConvert.RealToPercent(GScanDetails[lDataIndex].Magnitude.Data[Category_MagnitudeAll, t, 0] / GScanDetails[lDataIndex].FileCount), 6, ' ');
            str := str + TXFormatting.AddLeading(TConvert.ConvertToUsefulUnit(GScanDetails[lDataIndex].Magnitude.Data[Category_MagnitudeAll, t, 1]), 11, ' ');

            if GScanDetails[lDataIndex].TotalSize <> 0 then
              str := str + TXFormatting.AddLeading(TConvert.RealToPercent(GScanDetails[lDataIndex].Magnitude.Data[Category_MagnitudeAll, t, 1] /GScanDetails[lDataIndex].TotalSize), 6, ' ')
            else
              str := str + TXFormatting.AddLeading('100%', 6, ' ');

            writeln(wp, str);
          end;
        end;

        writeln(wp, XText[rsFavourite]);
        writeln(wp, '');

        CloseFile(wp);
      end;
    end
    else begin
      TGridUtility.SaveGrid(grid, lFileName);
    end;
  end;
end;


procedure TFrameReports.miMagnitudeZipClick(Sender: TObject);
var
  lFileName : string;

begin
  if not(XSettings.ProcessWindowsVisible) then begin
    lFileName := TXSaveDialog.Execute(XText[rsCompressedFiles] + ' (*.zip)|*.zip',
                                      '.zip',
                                      TUtility.GetDefaultFileName('.zip', XText[rsMagnitude] + '_' + XText[rsExport]));

    if lFileName <> '' then
      XinorbisZip.ZipFilesOfType(FSource, lFileName, 3, '', sgMagnitude.Selection.Top);
  end;
end;


procedure TFrameReports.miMoveAllClick(Sender: TObject);
 var
  s : string;
  t : integer;

 begin
  s := GetCopyMoveFolder(XText[rsMoveTo] + rsEllipsis);

  if s <> '' then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      CGridTemp        : begin
                           for t := 1 to sgTemp.RowCount - 1 do
                             MoveFileEx(PChar(sgTemp.Cells[0, t]),
                                        PChar( s+ ExtractFileName(sgTemp.Cells[0, t])),
                                        MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
                         end;
      CGridTop101Big   : begin
                           for t := 1 to sgTop50Big.RowCount - 1 do
                             MoveFileEx(PChar(sgTop50Big.Cells[0, t]),
                                        PChar(s + ExtractFileName(sgTop50Big.Cells[0, t])),
                                        MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
                         end;
      CGridTop101Small : begin
                           for t := 1 to sgTop50Small.RowCount - 1 do
                             MoveFileEx(PChar(sgTop50Small.Cells[0, t]),
                                        PChar(s + ExtractFileName(sgTop50Small.Cells[0, t])),
                                        MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
                         end;
    end;
  end;
end;


procedure TFrameReports.miMoveSelectedClick(Sender: TObject);
var
  s : string;
begin
  s := GetCopyMoveFolder(XText[rsMoveTo] + rsEllipsis);

  if s <> '' then begin
    case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
      CGridTemp            : MoveFileEx(PChar(sgTemp.Cells[0, sgTemp.Selection.Top]),
                                        PChar(s + ExtractFileName(sgTemp.Cells[0, sgTemp.Selection.Top])),
                                        MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
      CGridTop101Big       : MoveFileEx(PChar(sgTop50Big.Cells[0, sgTop50Big.Selection.Top]),
                                        PChar(s + ExtractFileName(sgTop50Big.Cells[0, sgTop50Big.Selection.Top])),
                                        MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
      CGridTop101Small     : MoveFileEx(PChar(sgTop50Small.Cells[0, sgTop50Small.Selection.Top]),
                                        PChar(s + ExtractFileName(sgTop50Small.Cells[0, sgTop50Small.Selection.Top])),
                                        MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);

      CGridTop101BigDate   : MoveFileEx(PChar(sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top]),
                                        PChar(s + ExtractFileName(sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top])),
                                        MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
      CGridTop101SmallDate : MoveFileEx(PChar(sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top]),
                                        PChar(s + ExtractFileName(sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top])),
                                        MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING + MOVEFILE_WRITE_THROUGH);
    end;
  end;
end;


procedure TFrameReports.miNFExploreClick(Sender: TObject);
begin
  if sgNullFiles.Cells[0, 1] <> XText[rsNoneFound] then begin
    TXWindows.ExecuteFile(0, '"' + sgNullFiles.Cells[0, sgNullFiles.Selection.Top] + '"', '', '')
  end;
end;


procedure TFrameReports.miNFExploreFolderClick(Sender: TObject);
begin
  if sgNullFolders.Cells[0, 1] <> XText[rsNoneFound] then begin
    TXWindows.ExecuteFile(0, '"' + sgNullFolders.Cells[0, sgNullFolders.Selection.Top] + '"', '', '')
  end;
end;


procedure TFrameReports.miNFFolderPropertiesClick(Sender: TObject);
begin
 if sgNullFolders.Selection.Top <> -1 then
    TXWindows.ShowFilePropertiesDialog(Application.Handle, sgNullFolders.Cells[0, sgNullFolders.Selection.Top]);
end;


procedure TFrameReports.miNFPropertiesClick(Sender: TObject);
begin
  if sgNullFiles.Selection.Top > 0 then
    TXWindows.ShowFilePropertiesDialog(Application.Handle,
                                       sgNullFiles.Cells[0, sgNullFiles.Selection.Top]);
end;


procedure TFrameReports.miOA1Click(Sender: TObject);
var
  t, idx : integer;
  tfx : TFileExtension;

begin
  idx := TMenuItem(sender).Tag;

  for t := 1 to sgExtension.RowCount - 1 do begin
    if sgExtension.RowSelect[t] then begin
      tfx          := TFileExtension.Create;
      tfx.Name     := sgExtension.Cells[0, t];
      tfx.Category := idx;
      FileExtensionsObject.CategoryExtensions.Add(tfx);
    end;
  end;

  FileExtensionsObject.SaveFileExtensionLists(XSettings.CustomSettings.SettingsSaveLocation);
end;


procedure TFrameReports.miScanFromDirListClick(Sender: TObject);
var
  lPath : string;
begin
  if (sgDirList.Cells[1, sgDirList.Selection.Top] <> '  -') and
     (sgDirList.Cells[1, sgDirList.Selection.Top] <> '') then begin
      lPath := GScanDetails[FSource].ScanPath + sgDirList.Cells[1, sgDirList.Selection.Top] + '\';

    if Assigned(FScanWithNewPath) then
      FScanWithNewPath(dataLatestScan, False, lPath);
  end;
end;


procedure TFrameReports.miSearchExportToCBClick(Sender: TObject);
begin
  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    CGridTemp            : TGridUtility.CopyGridToClipboard(0, sgTemp);
    CGridTop101Big       : TGridUtility.CopyGridToClipboard(0, sgTop50Big);
    CGridTop101Small     : TGridUtility.CopyGridToClipboard(0, sgTop50Small);
    CGridTop101BigDate   : TGridUtility.CopyGridToClipboard(0, sgTop101BigDate);
    CGridTop101SmallDate : TGridUtility.CopyGridToClipboard(0, sgTop101SmallDate);
    CGridExtension       : TGridUtility.CopyGridToClipboard(0, sgExtension);
  end;
end;


procedure TFrameReports.miSearchOpenClick(Sender: TObject);
var
  s : string;

begin
  s := '';

  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    CGridTemp            : s := '"' + sgTemp.Cells[0, sgTemp.Selection.Top] + '"';

    CGridTop101Big       : s := '"' + sgTop50Big.Cells[0, sgTop50Big.Selection.Top] + '"';
    CGridTop101Small     : s := '"' + sgTop50Small.Cells[0, sgTop50Small.Selection.Top] + '"';

    CGridTop101BigDate   : s := '"' + sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top] + '"';
    CGridTop101SmallDate : s := '"' + sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top] + '"';
  end;

  if s <> '' then
    TXWindows.ExecuteFile(0, s, '', '');
end;


procedure TFrameReports.miSearchOpenCustomClick(Sender: TObject);
 var
  s : string;

 begin
  s := '';

  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    CGridTemp            : s := '"' + sgTemp.Cells[0, sgTemp.Selection.Top] + '"';

    CGridTop101Big       : s := '"' + sgTop50Big.Cells[0, sgTop50Big.Selection.Top] + '"';
    CGridTop101Small     : s := '"' + sgTop50Small.Cells[0, sgTop50Small.Selection.Top] + '"';

    CGridTop101BigDate   : s := '"' + sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top] + '"';
    CGridTop101SmallDate : s := '"' + sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top] + '"';
  end;

  if s <> '' then
    TXWindows.ExecuteFile(0, '"' + XSettings.General.CustomViewer + '"', s, '');
end;


procedure TFrameReports.miSFilePropertiesClick(Sender: TObject);
 begin
  case TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag of
    CGridTemp            : TXWindows.ShowFilePropertiesDialog(Application.Handle, sgTemp.Cells[0, sgTemp.Selection.Top]);

    CGridTop101Big       : TXWindows.ShowFilePropertiesDialog(Application.Handle, sgTop50Big.Cells[0, sgTop50Big.Selection.Top]);
    CGridTop101Small     : TXWindows.ShowFilePropertiesDialog(Application.Handle, sgTop50Small.Cells[0, sgTop50Small.Selection.Top]);

    CGridTop101BigDate   : TXWindows.ShowFilePropertiesDialog(Application.Handle, sgTop101BigDate.Cells[0, sgTop101BigDate.Selection.Top]);
    CGridTop101SmallDate : TXWindows.ShowFilePropertiesDialog(Application.Handle, sgTop101SmallDate.Cells[0, sgTop101SmallDate.Selection.Top]);
  end;
end;


procedure TFrameReports.miShowOtherFilesClick(Sender: TObject);
 var
  str : string;

 begin
  str := sgExtension.Cells[0, sgExtension.Selection.Top];

  if str <> '' then begin
    if Assigned(FOnNewSearch) then
      FOnNewSearch(FSource, '.' + str);
  end;
end;


procedure TFrameReports.miTableExportSelectedCBClick(Sender: TObject);
 begin
  TGridUtility.CopyGridToClipboard(1, sgMainReport);
end;


procedure TFrameReports.miTableExportSelectedClick(Sender: TObject);
var
  CSVOptions : TCSVReportOptions;
  lFileName : string;
  lCSVReport : TStringList;

begin
  if sgMainReport.Cells[7, sgMainReport.Selection.Top] <> '' then begin
    lFileName := TXSaveDialog.ExecuteReports(TUtility.GetDefaultFileName('.csv', XText[rsCategories] + '_' + XText[rsExport]));

    if lFileName <> '' then begin

      if UpperCase(ExtractFileExt(lFileName)) = '.CSV' then begin
         CSVOptions.FileName := lFileName;
         CSVOptions.CSVData  := CDataFileList;
        if sgMainReport.Cells[7, sgMainReport.Selection.Top] <> '' then
          CSVOptions.Category := StrToInt(sgMainReport.Cells[7, sgMainReport.Selection.Top])
        else
          CSVOptions.Category := __FileCategoriesOther;

        lCSVReport := TStringList.Create;

        GReportCSV.GenerateCSVReport(FSource, lCSVReport, CSVOptions, LayoutUnknown);

        lCSVReport.Free;
      end
      else begin
        TGridUtility.SaveGrid(sgMainReport, lFileName);
      end;
    end;
  end;
end;


procedure TFrameReports.miTableZipClick(Sender: TObject);
var
  lFileName : string;
begin
  lFileName := TXSaveDialog.Execute(XText[rsCompressedFiles] + ' (*.zip)|*.zip',
                                    '.zip',
                                    TUtility.GetDefaultFileName('.zip', XText[rsTable] + '_' + XText[rsExport]));

  if lFileName <> '' then begin
    if sgUsers.Cells[2, sgUsers.Selection.Top] <> '0' then begin
      XinorbisZip.ZipFilesOfType(FSource, lFileName, 4, sgUsers.Cells[1, sgUsers.Selection.Top], 0);
    end;
  end;
end;


procedure TFrameReports.miTD1Click(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not(TMenuItem(Sender).Checked);

  if TMenuItem(Sender).Checked then
    XSettings.TabDisplayOptions[puTableDisplay.Tag][TMenuItem(Sender).Tag + 1] := '1'
  else
    XSettings.TabDisplayOptions[puTableDisplay.Tag][TMenuItem(Sender).Tag + 1] := '0';

  RefreshTableDisplay(puTableDisplay.Tag);
end;


procedure TFrameReports.miTDNonZeroClick(Sender: TObject);
begin
  XSettings.TabDisplayOptions[puTableDisplay.Tag][1] := '1';

  RefreshTableDisplay(puTableDisplay.Tag);
end;


procedure TFrameReports.miTDShowAllClick(Sender: TObject);
begin
  XSettings.TabDisplayOptions[puTableDisplay.Tag][1] := '0';

  RefreshTableDisplay(puTableDisplay.Tag);
end;


procedure TFrameReports.miTDUserDefinedClick(Sender: TObject);
begin
  XSettings.TabDisplayOptions[puTableDisplay.Tag][1] := '2';

  RefreshTableDisplay(puTableDisplay.Tag);
end;


procedure TFrameReports.miTypeExportCBClick(Sender: TObject);
 begin
  TTreeUtility.CopyTreeToClipboard(tvFileTypes);
end;


procedure TFrameReports.miTypeExportContentClick(Sender: TObject);
 var
  lFileName : string;

 begin
  lFileName := TXSaveDialog.Execute(XText[rsTextFiles] + ' (*.txt)|*.txt',
                                    '.txt',
                                    TUtility.GetDefaultFileName('.txt', XText[rsType] + '_' + XText[rsExport]));

  if lFileName <> '' then begin
    tvFileTypes.SaveToFile(lFileName);
  end;
end;


procedure TFrameReports.miTypeZipClick(Sender: TObject);
 var
  s : string;
  t, idx : integer;
  lFileName : string;

 begin
  lFileName := TXSaveDialog.Execute(XText[rsCompressedFiles] + ' (*.zip)|*.zip',
                                    '.zip',
                                    TUtility.GetDefaultFileName('.zip', XText[rsFiles] + '_' + XText[rsExport]));

  if lFileName <> '' then begin

    if tvFileTypes.Selected.Parent = Nil then begin
      s := '';
      t := 1;

      while tvFileTypes.Selected.Text[t] <> ' ' do begin
        s := s + tvFileTypes.Selected.Text[t];

        inc(t);
      end;

      idx := -1;
      s   := TXFormatting.FilterTags(s); // removes html formatting from parent node text

      for t := 1 to __FileCategoriesCount do
        if UpperCase(TypeDescriptions[t]) = UpperCase(s) then
          idx := t;

      if idx <> -1 then
        XinorbisZip.ZipFilesOfType(FSource, lFileName, 2, '', idx);
    end
    else begin
      s := '';
      t := 1;

      while tvFileTypes.Selected.Text[t] <> ':' do begin
        s := s + tvFileTypes.Selected.Text[t];

        inc(t);
      end;

      XinorbisZip.ZipFilesOfType(FSource, lFileName, 1, UpperCase(s), -1);
    end;
  end;
end;


procedure TFrameReports.miUsersExportSelectedCBClick(Sender: TObject);
 begin
  TGridUtility.CopyGridToClipboard(1, sgUsers);
end;


procedure TFrameReports.miUsersExportSelectedClick(Sender: TObject);
 var
  str : string;
  wp : TextFile;
  t, lDataIndex : integer;
  grid : TAdvStringGrid;
  lFileName : string;

 begin
  lDataIndex := FSource;
  grid       := sgUsers;

  Assert(grid <> Nil, 'miUsersExportSelectedClick :: Grid is nil');

  lFileName := TXSaveDialog.ExecuteReports(TUtility.GetDefaultFileName('.csv', XText[rsUsers] + '_' + XText[rsExport]));

  if lFileName <> '' then begin
    if UpperCase(ExtractFileExt(lFileName)) = '.TXT' then begin
      AssignFile(wp, lFileName);

      {$I-}
      Rewrite(wp);

      if IOResult <> 0 then begin
        ShowXDialog(XText[rsErrorSavingReport],
                    XText[rsErrorSaving] + ' "' + lFileName + '".',
                    XDialogTypeWarning);
      end
      else begin
        writeln(wp, TextReport[0]);
        writeln(wp, TextReport[11]);
        writeln(wp, TextReport[0]);
        writeln(wp, TextReport[12]);
        writeln(wp, TextReport[0]);

        if GScanDetails[lDataIndex].FileCount <> 0 then begin
          for t := 0 to GScanDetails[lDataIndex].Users.Count - 1 do begin
            str := TXFormatting.AddTrailing(' ' + GScanDetails[lDataIndex].Users[t].Name, 25, ' ');
            str := str + TXFormatting.AddLeading(IntToStr(GScanDetails[lDataIndex].Users[t].Data[XUserCount]), 8, ' ');

            if (GScanDetails[lDataIndex].FileCount <> 0) then
              str := str + TXFormatting.AddLeading(TConvert.RealToPercent(GScanDetails[lDataIndex].Users[t].Data[XUserCount] / GScanDetails[lDataIndex].FileCount), 6, ' ')
            else
              str := str + TXFormatting.AddLeading('100%', 6, ' ');

            str := str + TXFormatting.AddLeading(TConvert.ConvertToUsefulUnit(GScanDetails[lDataIndex].Users[t].Data[XUserSize]), 11, ' ');
            if GScanDetails[lDataIndex].TotalSize <> 0 then
              str := str + TXFormatting.AddLeading(TConvert.RealToPercent(GScanDetails[lDataIndex].Users[t].Data[XUserSize] / GScanDetails[lDataIndex].TotalSize), 6, ' ')
            else
              str := str + TXFormatting.AddLeading('100%', 6, ' ');

            writeln(wp, str);
          end;
        end;

        writeln(wp, TextReport[0]);

        CloseFile(wp);
      end;

      {$I+}
    end
    else begin
      TGridUtility.SaveGrid(grid, lFileName);
    end;
  end;
end;


procedure TFrameReports.miUsersZipClick(Sender: TObject);
var
  lFileName : string;

begin
  if sgUsers.Cells[2, sgUsers.Selection.Top] <> '0' then begin
    lFileName := TXSaveDialog.Execute(XText[rsCompressedFiles] + ' (*.zip)|*.zip',
                                      '.zip',
                                      TUtility.GetDefaultFileName('.zip', XText[rsUsers] + '_' + XText[rsExport]));

    if lFileName <> '' then
      XinorbisZip.ZipFilesOfType(FSource, lFileName, 4, sgUsers.Cells[1, sgUsers.Selection.Top], 0);
  end;
end;


procedure TFrameReports.miZIPClick(Sender: TObject);
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
      CGridTop101Big       : lZipCount := XinorbisZip.ZipAllFiles(lFileName, TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag, sgTop50Big, 0);
      CGridTop101Small     : lZipCount := XinorbisZip.ZipAllFiles(lFileName, TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag, sgTop50Small, 0);
      CGridTop101BigDate   : lZipCount := XinorbisZip.ZipAllFiles(lFileName, TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag, sgTop101BigDate, 0);
      CGridTop101SmallDate : lZipCount := XinorbisZip.ZipAllFiles(lFileName, TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent).Tag, sgTop101SmallDate, 0);
    end;

    if lZipCount = -1 then
      ShowXDialog(XText[rsErrorCompressingFiles],
                  XText[rsErrorCompressingFiles],
                  XDialogTypeWarning)
    else if lZipCount = 0 then
      ShowXDialog(XText[rsWarning], XText[rsNoFilesToCompress], XDialogTypeWarning);
  end;
end;


procedure TFrameReports.pMainReportsChange(Sender: TObject);
begin
   case pMainReports.ActivePageIndex of
      TabIndexExtensions,
      TabIndexNull,
      TabIndexTemp : begin                      // these don't require File History to have stopped
                   if (XSettings.Optimisations.JustInTimeDisplay) and (XSettings.System.JustInTimeProcessed[FSource, pMainReports.ActivePageIndex] = False) and (GScanDetails[FSource].Files.Count <> 0) then begin
                     Screen.Cursor := crHourGlass;

                     case pMainReports.ActivePageIndex of
                       TabIndexExtensions : TDisplayUtility.InformationTabFileExtensions(FSource, cbExtensionsAll, cbExtensionsCustom, cbExtensionsOther, sgExtension);
                       TabIndexNull       : TDisplayUtility.InformationTabNullFiles(FSource, sgNullFiles);
                       TabIndexTemp       : begin
                                              if XSettings.Forms.ProgressForm = NIL then
                                                XSettings.ShowProgressWindow;

                                              lTempStatus.HTMLText[0] := TDisplayUtility.BuildTempChart(FSource, sgTemp, vtcTemp, rbTempSize.Checked);

                                              XSettings.HideProgressWindow;
                                            end;
                     end;

                     XSettings.System.JustInTimeProcessed[FSource, pMainReports.ActivePageIndex] := True;

                     Screen.Cursor := crDefault;
                   end;
                 end;
      TabIndexMagnitude,
      TabIndexDates,
      TabIndexHistory      : begin
                             if (IsFileHistoryThreadRunning) then begin
                               if (XSettings.Optimisations.JustInTimeDisplay) and (XSettings.System.JustInTimeProcessed[FSource, pMainReports.ActivePageIndex] = False) and (GScanDetails[FSource].Files.Count <> 0) then begin
                                 Screen.Cursor := crHourGlass;

                                 case pMainReports.ActivePageIndex of
                                   TabIndexDates    : TDisplayUtility.InformationTabFileDatesTree(FSource, cbFileDates.ItemIndex, cbFileDatesUsers, XSettings.Optimisations.BuildDateTree, tvFileDates, vtcFileDates, rbDatesQuantity.Checked, capacityBarDates);
                                   TabIndexHistory  : lHistoryResults.HTMLText[0] := TDisplayUtility.InformationTabHistoryGraph(FSource, vtcHistory, cbHUsers, HGraphData,
                                                                                                                                dtpHFrom.Date, dtpHTo.Date, cbHInterval.ItemIndex, cbHDateSelect.ItemIndex,
                                                                                                                                rbHQuantity.Checked, cbHCumulative.Checked, cbHInterval.Items[cbHInterval.ItemIndex], capacityBarHistory);
                                 end;

                                 XSettings.System.JustInTimeProcessed[FSource, pMainReports.ActivePageIndex] := True;

                                 Screen.Cursor := crDefault;
                               end;
                             end;
                           end;
  end;

  if Visible then
    if Assigned(FSetTutorialBarText) then
      FSetTutorialBarText(GSystemGlobal.ExePath + 'data\languages\' + TLanguageHandler.GetLanguageSymbol(XSettings.CurrentLanguage) +
                                                  '\tutorial\fp' + IntToStr(pMainReports.ActivePageIndex) + '.dat');
end;


procedure TFrameReports.pMainReportsResize(Sender: TObject);
begin
  sgExtension.ColWidths[0]   := 75;
  sgExtension.ColWidths[1]   := 65;
  sgExtension.ColWidths[2]   := 52;
  sgExtension.ColWidths[3]   := 4;
  sgExtension.ColWidths[4]   := 65;
  sgExtension.ColWidths[5]   := 52;
  sgExtension.ColWidths[6]   := 4;
  sgExtension.ColWidths[7]   := sgExtension.Width - 340;

  sgNullFiles.ColWidths[0]   := sgNullFiles.Width - _WidthOfScrollbar;
  sgNullFolders.ColWidths[0] := sgNullFolders.Width - _WidthOfScrollbar;

  splitTableMoved(Nil);
  splitDirListMoved(nil);
  splitMagnitudeMoved(nil);
  splitterTop50Moved(Nil);
  splitterTopDateMoved(Nil);
  splitterTempMoved(Nil);
  splitUsersMoved(Nil);
  splitLengthMoved(Nil);
end;


procedure TFrameReports.puExtensionsMainPopup(Sender: TObject);
 var
  mistatus : boolean;

 begin
  mistatus := True;

  if sgExtension.Cells[sgExtension.Selection.Left, sgExtension.Selection.Top] = '' then
    mistatus := False;

  miOtherAddTo.Enabled     := mistatus;
  miShowOtherFiles.Enabled := mistatus;
end;


procedure TFrameReports.puFoldersPopup(Sender: TObject);
 begin
  if not(XSettings.ProcessWindowsVisible) then begin
    if (sgDirList.Cells[1, sgDirList.Selection.Top] <> '') and (sgDirList.Selection.Top > 1) then
      miScanFromDirList.Enabled := True
    else
      miScanFromDirList.Enabled := False;
  end;
end;


procedure TFrameReports.puMagnitudePopup(Sender: TObject);
var
  status : boolean;

begin
  if not(XSettings.ProcessWindowsVisible) then begin
    status := False;

    if GScanDetails[FSource].FileCount > 0  then status := True;

    miMagnitudeExport.Enabled   := status;
    miMagnitudeZip.Enabled      := status;
    miMagnitudeExportCB.Enabled := status;
  end;
end;


procedure TFrameReports.puNullFilesPopup(Sender: TObject);
var
  lStatus : boolean;

begin
  lStatus := True;

  if sgNullFiles.Selection.Top < 1 then begin
    lStatus := False;
  end
  else begin
    if sgNullFiles.Cells[0, sgNullFiles.Selection.Top] = XText[rsNoneFound] then
      lStatus := False;
  end;

  miNFExplore.Enabled    := lStatus;
  miNFProperties.Enabled := lStatus;
end;


procedure TFrameReports.puNullFoldersPopup(Sender: TObject);
var
  lStatus : boolean;

begin
  lStatus := True;

  if sgNullFolders.Selection.Top < 1 then begin
    lStatus := False;
  end
  else begin
    if sgNullFolders.Cells[0, sgNullFolders.Selection.Top] = XText[rsNoneFound] then
      lStatus := False;
  end;

  miNFExploreFolder.Enabled    := lStatus;
  miNFFolderProperties.Enabled := lStatus;
end;


procedure TFrameReports.puSearchPopup(Sender: TObject);
 var
  status, CMD, zipstatus : boolean;

 begin
  status    := False;
  CMD       := True;
  ZIPStatus := False;

  if not(XSettings.ProcessWindowsVisible) then begin

    case TAdvStringGrid(Tpopupmenu(Sender).PopupComponent).Tag of
      CGridTemp            : begin
                               if sgTemp.Cells[0, 1] <> '  -' then
                                 status := True;
                             end;
      CGridTop101Big       : begin
                               if sgTop50Big.Cells[0, 1] <> '' then begin
                                 status    := True;
                                 ZIPStatus := True;
                               end;
                             end;
      CGridTop101Small     : begin
                               if sgTop50Small.Cells[0, 1] <> '' then begin
                                 status    := True;
                                 ZIPStatus := True;
                               end;
                             end;
      CGridTop101BigDate   : begin
                               if sgTop101BigDate.Cells[0, 1] <> '' then begin
                                 status    := True;
                                 ZIPStatus := True;
                               end;
                             end;
      CGridTop101SmallDate : begin
                               if sgTop101SmallDate.Cells[0, 1] <> '' then begin
                                 status    := True;
                                 ZIPStatus := True;
                               end;
                             end;
    end;

    miCopyAll.Enabled          := CMD;
    miMoveAll.Enabled          := CMD;
    miDeleteAll.Enabled        := CMD;

    miSearchOpen.Enabled       := status;
    miSearchOpenCustom.Enabled := status;
    miExploreDirectory.Enabled := status;
    miSFileProperties.Enabled  := status;
    miGenerateMD5.Enabled      := status;
    miHexEdit.Enabled          := status;
    miCopyMenu.Enabled         := status;
    miMoveMenu.Enabled         := status;
    miDeleteMenu.Enabled       := status;
    miZip.Enabled              := ZIPStatus;
  end;
end;


procedure TFrameReports.puTablePopup(Sender: TObject);
var
  lTable : TAdvStringGrid;
  lStatus : boolean;

begin
  if not(XSettings.ProcessWindowsVisible) then begin
    lTable := TAdvStringGrid(Tpopupmenu(Sender).PopupComponent);
    lStatus := True;

    if GScanDetails[FSource].Files.Count = 0 then
      lStatus := False;

    if (lTable.Cells[0, 1] = '') and (lTable.Cells[1, 1] = '') then
      lStatus := False;

    if (lTable.Cells[0, 1] = XText[rsNoneFound]) or (lTable.Cells[1, 1] = XText[rsNoneFound]) then
      lStatus := False;

    miTableExportSelected.Enabled   := lStatus;
    miTableZip.Enabled              := lStatus;
    miTableExportSelectedCB.Enabled := lStatus;
  end;
end;


procedure TFrameReports.puTreeDatePopup(Sender: TObject);
var
  status : boolean;

begin
  if not(XSettings.ProcessWindowsVisible) then begin
    case THTMLTreeView(Tpopupmenu(Sender).PopupComponent).Tag of
      0 : begin
            if (tvFileDates.Selected <> NIL) and (Pos('\', tvFileDates.Selected.Text) <> 0) then
              status := True
            else
              status := False;

            MenuItem18.Enabled            := status;
            MenuItem20.Enabled            := status;
            miFileDatesExploreDir.Enabled := status;
            miFileDatesInfo.Enabled       := status;
            miDGenerateMD5.Enabled        := status
          end;
      1 : begin
            MenuItem18.Enabled            := False;
            MenuItem20.Enabled            := False;
            miFileDatesExploreDir.Enabled := False;
            miFileDatesInfo.Enabled       := False;
            miDGenerateMD5.Enabled        := False;
          end;
    end;
  end;
end;


procedure TFrameReports.puTypePopup(Sender: TObject);
var
  status : boolean;

begin
  if not(XSettings.ProcessWindowsVisible) then begin
    status := False;

    if GScanDetails[FSource].Files.Count <> 0 then
      status := True;

    miTableExportSelected.Enabled   := status;
    miTableZip.Enabled              := status;
    miTableExportSelectedCB.Enabled := status;
  end;
end;


procedure TFrameReports.puUsersPopup(Sender: TObject);
var
  status : boolean;

begin
  if not(XSettings.ProcessWindowsVisible) then begin
    status := True;

    if GScanDetails[FSource].Files.Count  = 0 then status := False;

    miUsersExportSelected.Enabled   := status;
    miUsersZip.Enabled              := status;
    miUsersExportSelectedCB.Enabled := status;
  end;
end;


procedure TFrameReports.bHistoryRefreshClick(Sender: TObject);
begin
  if (IsFileHistoryThreadRunning) then begin
    ShowXDialog(XText[rsWarning], XText[rsPleaseWaitFolderHistory], XDialogTypeXinorbis);
  end
  else
    lHistoryResults.HTMLText[0] := TDisplayUtility.InformationTabHistoryGraph(FSource, vtcHistory, cbHUsers, HGraphData,
                                                                              dtpHFrom.Date, dtpHTo.Date, cbHInterval.ItemIndex, cbHDateSelect.ItemIndex,
                                                                              rbHQuantity.Checked, cbHCumulative.Checked, cbHInterval.Items[cbHInterval.ItemIndex], capacityBarHistory);
end;


procedure TFrameReports.cbExtensionColourCodeClick(Sender: TObject);
begin
  if cbExtensionColourCode.Checked then
    sgExtension.Font.Color := clBlack
  else
    sgExtension.Font.Color := clWhite;

  sgExtension.Refresh;
end;


procedure TFrameReports.cbExtensionsAllClick(Sender: TObject);
begin
  TDisplayUtility.InformationTabFileExtensions(FSource, cbExtensionsAll, cbExtensionsCustom, cbExtensionsOther, sgExtension);
end;


procedure TFrameReports.cbFileDatesChange(Sender: TObject);
begin
  if not(IsFileHistoryThreadRunning) then begin
    Screen.Cursor := crHourGlass;

    if Assigned(FSetStatusBarText) then
      FSetStatusBarText(XText[rsBuilding] + ' ' + XText[rsPleaseWait]);

    TDisplayUtility.InformationTabFileDatesTree(FSource, cbFileDates.ItemIndex, cbFileDatesUsers, True, tvFileDates, vtcFileDates, rbDatesQuantity.Checked, capacityBarDates);

    if Assigned(FSetStatusBarText) then
      FSetStatusBarText('');

    Screen.Cursor := crDefault;
  end
  else
    ShowXDialog(XText[rsWarning], XText[rsPleaseWaitFolderHistory], XDialogTypeXinorbis);
end;


procedure TFrameReports.cbGraphQuantityDirListClick(Sender: TObject);
begin
  if Sender <> Nil then begin
    if Sender.ClassType = TMenuItem then
      sbFolderConfig.Tag := TMenuItem(Sender).Tag;
  end;

  if cbGraphSizeDirList.Checked then
    vtcDirList.Tag := 1
  else
    vtcDirList.Tag := 0;

  TDisplayUtility.InformationTabFolderChart(FSource, sbFolderConfig.Tag, vtcDirList, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.rbGraphSizeClick(Sender: TObject);
begin
  if rbGraphSize.Checked then
    vtcMain.Tag := 2
  else
    vtcMain.Tag := 1;

  TDisplayUtility.InformationTabTableGraph(FSource, vtcMain, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.rbLengthGraphSizeClick(Sender: TObject);
begin
  if rbLengthGraphSize.Checked then
    vtcLength.Tag := 2
  else
    vtcLength.Tag := 1;

  TDisplayUtility.InformationTabLengthGraph(FSource, vtcLength, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.cbGraphSizeDirListClick(Sender: TObject);
begin
  if Sender <> Nil then begin
    if Sender.ClassType = TMenuItem then
      sbFolderConfig.Tag := TMenuItem(Sender).Tag;
  end;

  if cbGraphSizeDirList.Checked then
    vtcDirList.Tag := 1
  else
    vtcDirList.Tag := 0;

  TDisplayUtility.InformationTabFolderChart(FSource, sbFolderConfig.Tag, vtcDirList, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.cbGraphSizeMagnitudeClick(Sender: TObject);
begin
  TDisplayUtility.InformationTabMagnitudeGraph(FSource, cbMagnitudeScope.ItemIndex, vtcMagnitude, cbGraphSizeMagnitude.Checked);
end;


procedure TFrameReports.cbMagnitudeScopeChange(Sender: TObject);
begin
  TDisplayUtility.InformationTabMagnitudeTable(FSource, cbMagnitudeScope.ItemIndex, sgMagnitude);
  TDisplayUtility.InformationTabMagnitudeGraph(FSource, cbMagnitudeScope.ItemIndex, vtcMagnitude, cbGraphSizeMagnitude.Checked);
end;


procedure TFrameReports.cbTopColourCodeClick(Sender: TObject);
begin
  if sgTop50Big.Cells[0, 1] <> '' then begin

    if cbTopColourCode.Checked then begin
      sgTop50Big.Font.Color   := clBlack;
      sgTop50Small.Font.Color := clBlack;
    end
    else begin
      sgTop50Big.Font.Color   := clWhite;
      sgTop50Small.Font.Color := clWhite;
    end;

    sgTop50Big.Refresh;
    sgTop50Small.Refresh;
  end;
end;


procedure TFrameReports.cbTop101DatesUserChange(Sender: TObject);
begin
  if (IsFileHistoryThreadRunning) then begin
    ShowXDialog(XText[rsWarning], XText[rsPleaseWaitFolderHistory], XDialogTypeXinorbis);
  end
  else
    pTop101DateLeft.Caption := TDisplayUtility.BuildTop101Date(FSource, sgTop101BigDate, sgTop101SmallDate, cbTop101DatesUser, cbTop101Dates);
end;


procedure TFrameReports.cbTopDateColourCodeClick(Sender: TObject);
begin
  if sgTop50Big.Cells[0, 1] <> '' then begin

    if cbTopColourCode.Checked then begin
      sgTop101BigDate.Font.Color   := clBlack;
      sgTop101SmallDate.Font.Color := clBlack;
    end
    else begin
      sgTop101BigDate.Font.Color   := clWhite;
      sgTop101SmallDate.Font.Color := clWhite;
    end;

    sgTop101BigDate.Refresh;
    sgTop101SmallDate.Refresh;
  end;
end;


procedure TFrameReports.cbTopUsersChange(Sender: TObject);
begin
  if (IsFileHistoryThreadRunning) then begin
    ShowXDialog(XText[rsWarning], XText[rsPleaseWaitFolderHistory], XDialogTypeXinorbis);
  end
  else
    pTop101Left.Caption := TDisplayUtility.BuildTop101FileSize(FSource, sgTop50Big, sgTop50Small, cbTopUsers, capacityTop101);
end;


procedure TFrameReports.cbTreeSizeClick(Sender: TObject);
begin
  if cbTreeSize.Checked then
    vtcTree.Tag := 2
  else
    vtcTree.Tag := 1;

  TDisplayUtility.InformationTabTypesChart(FSource, vtcTree, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.cbUsersDisplayModeChange(Sender: TObject);
begin
  TDisplayUtility.InformationTabUsersTable(FSource, cbUsersDisplayMode.ItemIndex, sgUsers);
end;


procedure TFrameReports.dtpHFromChange(Sender: TObject);
begin
  if cbAutoRefreshHistory.Checked then
    bHistoryRefreshClick(bHistoryRefresh);
end;

procedure TFrameReports.rbTempSizeClick(Sender: TObject);
begin
  lTempStatus.HTMLText[0] := TDisplayUtility.BuildTempChart(FSource, sgTemp, vtcTemp, rbTempSize.Checked);
end;


procedure TFrameReports.rbUsersSizeClick(Sender: TObject);
begin
  if rbUsersQuantity.Checked then
    vtcUsers.Tag := 1
  else
    vtcUsers.Tag := 2;

  TDisplayUtility.InformationTabUsersGraph(FSource, vtcUsers);
end;


procedure TFrameReports.miSaveAsClick(Sender: TObject);
var
  lFileName : string;
  lGrid : TAdvStringGrid;

begin
  lFileName := TXSaveDialog.Execute(XText[rsCSVFiles] + ' (*.csv)|*.csv',
                                    '.csv',
                                    TUtility.GetDefaultFileName('.csv', XText[rsReport] + '_' + XText[rsExport]));

  if lFileName <> '' then begin
    lGrid := TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

    TGridUtility.SaveGrid(lGrid, lFileName);
  end;
end;


procedure TFrameReports.SaveasCSV2Click(Sender: TObject);
var
  lFileName : string;
  lGrid : TAdvStringGrid;

begin
  lFileName := TXSaveDialog.ExecuteReports(TUtility.GetDefaultFileName('.csv', XText[rsSearchResults]));

  if lFileName <> '' then begin
    lGrid := TAdvStringGrid(Tpopupmenu(TMenuItem(Sender).GetParentMenu).PopupComponent);

    TGridUtility.SaveGrid(lGrid, lFileName);
  end;
end;


procedure TFrameReports.sbCollapseNodesClick(Sender: TObject);
begin
  tvFileDates.FullCollapse;
end;


procedure TFrameReports.sbFolderConfigClick(Sender: TObject);
begin
  puFolderConfig.Popup(FGetLeftOffset + sbFolderConfig.Left + 34,
                       FGetTopOffset + pMainReports.Top + 150);
end;


procedure TFrameReports.sbFolderMoreDetailClick(Sender: TObject);
begin
  if sgDirList.Selection.Top > 0 then
    sgDirListDblClickCell(Nil, sgDirList.Selection.Top, 0);
end;


procedure TFrameReports.sbIDeleteNullFilesClick(Sender: TObject);
 var
  t : integer;
  s : string;

 begin
  if MessageDlg('Delete all empty (null) files?', mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    for t := 1 to sgNullFiles.RowCount - 1 do begin
      if sgNullFiles.Cells[0, t] <> '<' then begin
        s:=sgNullFiles.Cells[0, t];

        if TXWindows.SendToRecycleBin(sgNullFiles.Cells[0, t]) then
          sgNullFiles.Cells[0, t] := '<DELETED> ' + s
        else
          sgNullFiles.Cells[0, t] := '<Could not delete> ' + s;
      end;
    end;
  end;
end;


procedure TFrameReports.sbIDeleteNullFoldersClick(Sender: TObject);
var
  t : integer;

 begin
  if MessageDlg('Delete all empty (null) folders?', mtWarning, [mbYes, mbNo], 0) = mrYes then begin

    for t := 1 to sgNullFolders.RowCount - 1 do
      TXWindows.SendToRecycleBin(sgNullFolders.Cells[0, t]);
  end;
end;


procedure TFrameReports.sbMainBarClick(Sender: TObject);
begin
  TSpeedButton(Sender).Down := True;

  case TSpeedButton(Sender).tag of
     1 : begin
           TChartUtility.ChangeChartToHorizontalBar(vtcMain, False);
           GXGuiUtil.SetPieBarImages(sbMainPie, sbMainBar);
         end;
     2 : begin
           TChartUtility.ChangeChartToHorizontalBar(vtcTree, False);
           GXGuiUtil.SetPieBarImages(sbTreePie, sbTreeBar);
         end;
     3 : begin
           TChartUtility.ChangeChartToHorizontalBar(vtcDirList, True);
           GXGuiUtil.SetPieBarImages(sbDirListPie, sbDirListBar);
         end;
     4 : begin
           TChartUtility.ChangeChartToHorizontalBar(vtcMagnitude, False);
           GXGuiUtil.SetPieBarImages(sbMagnitudePie, sbMagnitudeBar);
         end;
     8 : begin
           TChartUtility.ChangeChartToHorizontalBar(vtcFileDates, False);
           GXGuiUtil.SetPieBarImages(sbFileDatesPie, sbFileDatesBar);
         end;
    11 : begin
           TChartUtility.ChangeChartToHorizontalBar(vtcUsers, False);
           GXGuiUtil.SetPieBarImages(sbUsersPie, sbUsersBar);
         end;
    12 : begin
           TChartUtility.ChangeChartToHorizontalBar(vtcLength, False);
           GXGuiUtil.SetPieBarImages(sbLengthPie, sbLengthBar);
         end;
  end;
end;


procedure TFrameReports.sbMainConfigClick(Sender: TObject);
var
  t : integer;

begin
  case Ord(XSettings.TabDisplayOptions[TSpeedbutton(Sender).Tag][1]) of
    CCharacter_1 : miTDShowAll.Checked     := True;
    CCharacter_2 : miTDNonZero.Checked     := True;
    CCharacter_3 : miTDUserDefined.Checked := True;
  end;

  for t := 1 to 19 do begin
    if XSettings.TabDisplayOptions[TSpeedbutton(Sender).Tag][t + 1] = '1' then
      TableDisplay[t].Checked := True
    else
      TableDisplay[t].Checked := False;
  end;

  puTableDisplay.Tag := TSpeedbutton(Sender).Tag;
  puTableDisplay.Popup(FGetLeftOffset + 90, FGetTopOffset + 160);
end;


procedure TFrameReports.sbMainPieClick(Sender: TObject);
begin
  TSpeedButton(Sender).Down := True;

  case TSpeedButton(Sender).tag of
     1 : begin
           TChartUtility.ChangeChartToPie(vtcMain);
           GXGuiUtil.SetPieBarImages(sbMainPie, sbMainBar);
         end;
     2 : begin
           TChartUtility.ChangeChartToPie(vtcTree);
           GXGuiUtil.SetPieBarImages(sbTreePie, sbTreeBar);
         end;
     3 : begin
           TChartUtility.ChangeChartToPie(vtcDirList);
           GXGuiUtil.SetPieBarImages(sbDirListPie, sbDirListBar);
         end;
     4 : begin
           TChartUtility.ChangeChartToPie(vtcMagnitude);
           GXGuiUtil.SetPieBarImages(sbMagnitudePie, sbMagnitudeBar);
         end;
     8 : begin
           TChartUtility.ChangeChartToPie(vtcFileDates);
           GXGuiUtil.SetPieBarImages(sbFileDatesPie, sbFileDatesBar);
         end;
    11 : begin
           TChartUtility.ChangeChartToPie(vtcUsers);
           GXGuiUtil.SetPieBarImages(sbUsersPie, sbUsersBar);
         end;
    12 : begin
           TChartUtility.ChangeChartToPie(vtcLength);
           GXGuiUtil.SetPieBarImages(sbLengthPie, sbLengthBar);
         end;
  end;
end;


procedure TFrameReports.sgDirListCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
begin
  if (Acol = 0) or (Acol = 1) then begin
    DoSort := False;

    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 7;
      QSort;

      SortSettings.Column := Acol;
    end;
  end
  else if Acol = 3 then begin
    DoSort := False;

    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 2;
      QSort;

      SortSettings.Column := 3;
    end;
  end
  else if (Acol = 5) or (Acol = 6) then begin
    DoSort := False;

    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 8;
      QSort;

      SortSettings.Column := Acol;
    end;
  end;
end;


procedure TFrameReports.sgDirListDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow > 0 then begin
    if ARow = 1 then
      DoExplore(FSource,GScanDetails[FSource].ScanPath)
    else
      DoExplore(FSource,GScanDetails[FSource].ScanPath + sgDirList.Cells[1, ARow] + '\');
  end;
end;


procedure TFrameReports.sgDirListDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  zRect : TRect;

begin
  if ARow <> 0 then begin
    case ACol of
      CColumnIdentifier : begin
                            Rect.Left   := Rect.Left;
                            Rect.Top    := Rect.Top;
                            Rect.Right  := Rect.Right;
                            Rect.Bottom := Rect.Bottom;

                            if TAdvStringGrid(Sender).Cells[7, ARow] <> '' then begin
                              TAdvStringGrid(Sender).Canvas.Brush.Color := spectrumcolours[StrToInt(TAdvStringGrid(Sender).Cells[7, ARow]) mod spectrummod];
                              TAdvStringGrid(Sender).Canvas.Rectangle(Rect);
                            end;
                          end;
      CColumnCountGraph : begin
                            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
                            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                            if TAdvStringGrid(Sender).Cells[9, ARow] <> '0' then begin
                              zRect.Top    := Rect.Top + 1;
                              zRect.Bottom := Rect.Bottom - 1;
                              zRect.Left   := Rect.Left + 1;
                              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[9, ARow]);

                              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
                              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                            end;

                            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
                            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
                            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[3, ARow]);
                          end;
      CCOlumnSizeGraph  : begin
                            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
                            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                            if TAdvStringGrid(Sender).Cells[10, ARow] <> '0' then begin
                              zRect.Top    := Rect.Top + 1;
                              zRect.Bottom := Rect.Bottom - 1;
                              zRect.Left   := Rect.Left + 1;
                              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[10, ARow]);

                              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
                              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                            end;

                            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
                            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
                            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[6, ARow]);
                          end;
    end;
  end;
end;


procedure TFrameReports.sgExtensionCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
begin
  if (Acol = 2) then begin
    DoSort := False;

    with TAdvStringGrid(Sender) do begin
//      SortSettings.AutoFormat := True;

      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 8;
      QSort;

      SortSettings.Column := Acol;
    end;
  end
  else if (Acol = 4) or (Acol = 5) then begin
    DoSort := False;

    with TAdvStringGrid(Sender) do begin
      SortSettings.AutoFormat := True;

      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction:=sdDescending;

      Sortsettings.Column:=9;
      QSort;

      SortSettings.Column:=Acol;
    end;
  end
end;


procedure TFrameReports.sgExtensionClickCell(Sender: TObject; ARow,
  ACol: Integer);
 var
  t : integer;
  s : string;

 begin
  if ARow <> 0 then begin
    cbOtherSuggestions.Clear;

    s := WideUpperCase(sgExtension.Cells[0, ARow]) + ' ';

    if FileExtensionsObject.FileExtensionDescriptions.Count <> 0 then begin
      for t := 0 to FileExtensionsObject.FileExtensionDescriptions.Count - 1 do begin
        if Pos(s, FileExtensionsObject.FileExtensionDescriptions.Strings[t]) = 1 then
          cbOtherSuggestions.Items.Add(FileExtensionsObject.FileExtensionDescriptions.Strings[t]);
      end;

      if cbOtherSuggestions.Items.Count = 0 then
        cbOtherSuggestions.Items.Add('* ' + XText[rsUnknown] + ' *')
      else begin
        for t := 0 to cbOtherSuggestions.Items.Count - 1 do begin
          cbOtherSuggestions.Items[t] := IntToStr(t + 1) + '/' + IntToStr(cbOtherSuggestions.Items.Count) + ' : ' + cbOtherSuggestions.Items[t];
        end;
      end;

      cbOtherSuggestions.ItemIndex := 0;
    end
    else begin
      cbOtherSuggestions.Items.Add('* ' + XText[rsUnknown] + ' *')
    end;
  end;
end;


procedure TFrameReports.sgExtensionDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  lSearchText : string;

begin
  if ARow <> 0 then begin
    if TAdvStringGrid(Sender).Cells[0, ARow] <> '< >' then
      lSearchText := '(extension=' + sgExtension.Cells[0, ARow] + ')'
    else
      lSearchText := '@NOEXT';

    if lSearchText <> '' then
      if Assigned(FOnNewSearch) then
        FOnNewSearch(FSource, lSearchText);
  end;
end;


procedure TFrameReports.sgExtensionDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  zRect : TRect;

begin
  if cbExtensionColourCode.Checked then begin
    if ARow <> 0 then begin
      TAdvStringGrid(Sender).Canvas.Brush.Color := GSystemGlobal.FileCategoryColors[StrToInt(TAdvStringGrid(Sender).Cells[10, ARow])];
      TAdvStringGrid(Sender).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TAdvStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;

  if ARow <> 0 then begin
    case ACol of
      2 : begin
            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

            if (TAdvStringGrid(Sender).Cells[11, ARow] <> '0') and
               (TAdvStringGrid(Sender).Cells[11, ARow] <> '') then begin
              zRect.Top    := Rect.Top + 1;
              zRect.Bottom := Rect.Bottom - 1;
              zRect.Left   := Rect.Left + 1;
              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[11, ARow]);
              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
            end;

            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[2, ARow]);
          end;
      5 : begin
            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

            if (TAdvStringGrid(Sender).Cells[12, ARow] <> '0') and
               (TAdvStringGrid(Sender).Cells[12, ARow] <> '') then begin
              zRect.Top    := Rect.Top + 1;
              zRect.Bottom := Rect.Bottom - 1;
              zRect.Left   := Rect.Left + 1;
              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[12, ARow]);
              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
            end;

            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[5, ARow]);
          end;
        end;
  end;
end;


procedure TFrameReports.sgExtensionGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ACol = 1) or (ACol = 4) then
    HAlign := taRightJustify
  else
    HAlign := taLeftJustify;
end;


procedure TFrameReports.sgFileTypesDblClick(Sender: TObject);
begin
  if Assigned(FOnNewSearch) then
    FOnNewSearch(FSource, TSearchUtility.GetSearchAttribute(sgFileTypes.Selection.Top));
end;


procedure TFrameReports.sgFileTypesDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  zRect : TRect;

begin
  if ARow <> 0 then begin
    case ACol of
      2 : begin
            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

            if TAdvStringGrid(Sender).Cells[6, ARow] <> '0' then begin
              zRect.Top    := Rect.Top + 1;
              zRect.Bottom := Rect.Bottom - 1;
              zRect.Left   := Rect.Left + 1;
              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[6, ARow]);
              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
            end;

            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[2, ARow]);
          end;
      5 : begin
            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

            if TAdvStringGrid(Sender).Cells[7, ARow] <> '0' then begin
              zRect.Top    := Rect.Top + 1;
              zRect.Bottom := Rect.Bottom - 1;
              zRect.Left   := Rect.Left + 1;
              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[7, ARow]);
              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
            end;

            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[5, ARow]);
          end;
        end;
  end;
end;


procedure TFrameReports.sgMagnitudeCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
begin
  if (Acol = 0) or (Acol = 1) then begin
    DoSort := False;

    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 7;
      QSort;

      SortSettings.Column := Acol;
    end;
  end
  else if Acol = 3 then begin
    DoSort := False;

    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 2;
      QSort;

      SortSettings.Column := 3;
    end;
  end
  else if (Acol = 5) or (Acol = 6) then begin
    DoSort := False;

    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 8;
      QSort;

      SortSettings.Column := Acol;
    end;
  end;
end;


procedure TFrameReports.sgMagnitudeDblClick(Sender: TObject);
var
  lSearchText : string;
begin
  if sgMagnitude.Selection.Top > 0 then begin
    lSearchText := '';

    case StrToIntDef(sgMagnitude.Cells[7, sgMagnitude.Selection.Top], -1) of
      CMagnitude1  : lSearchText := TSearchUtility.GetSearchSize(  -1,        0,   1, rsUnitKB);
      CMagnitude2  : lSearchText := TSearchUtility.GetSearchSize(   1, rsUnitKB,   1, rsUnitMB);
      CMagnitude3  : lSearchText := TSearchUtility.GetSearchSize(   1, rsUnitMB,  10, rsUnitMB);
      CMagnitude4  : lSearchText := TSearchUtility.GetSearchSize(  10, rsUnitMB,  50, rsUnitMB);
      CMagnitude5  : lSearchText := TSearchUtility.GetSearchSize(  50, rsUnitMB, 100, rsUnitMB);
      CMagnitude6  : lSearchText := TSearchUtility.GetSearchSize( 100, rsUnitMB, 150, rsUnitMB);
      CMagnitude7  : lSearchText := TSearchUtility.GetSearchSize( 150, rsUnitMB, 200, rsUnitMB);
      CMagnitude8  : lSearchText := TSearchUtility.GetSearchSize( 200, rsUnitMB, 250, rsUnitMB);
      CMagnitude9  : lSearchText := TSearchUtility.GetSearchSize( 250, rsUnitMB, 500, rsUnitMB);
      CMagnitude10 : lSearchText := TSearchUtility.GetSearchSize( 500, rsUnitMB,   1, rsUnitGB);
      CMagnitude11 : lSearchText := TSearchUtility.GetSearchSize(   1, rsUnitGB,   2, rsUnitGB);
      CMagnitude12 : lSearchText := TSearchUtility.GetSearchSize(   2, rsUnitGB,   5, rsUnitGB);
      CMagnitude13 : lSearchText := TSearchUtility.GetSearchSize(   5, rsUnitGB,  -1,      - 1);
    else
      ShowXDialog(XText[rsError],
                  'sgMagnitudeDblClick invalid input',
                  XDialogTypeXinorbis);
    end;

    if lSearchText <> '' then
      if Assigned(FOnNewSearch) then
        FOnNewSearch(FSource, lSearchText);
  end;
end;


procedure TFrameReports.sgMagnitudeDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  zRect : TRect;

begin
  if ARow <> 0 then begin
    case ACol of
      CColumnIdentifier : begin
                            Rect.Left   := Rect.Left;
                            Rect.Top    := Rect.Top;
                            Rect.Right  := Rect.Right;
                            Rect.Bottom := Rect.Bottom;

                            if TAdvStringGrid(Sender).Cells[7, Arow] <> '' then begin
                              TAdvStringGrid(Sender).Canvas.Brush.Color := magnicolors[StrToInt(TAdvStringGrid(Sender).Cells[7, Arow])];
                              TAdvStringGrid(Sender).Canvas.Rectangle(Rect);
                            end;
                          end;
      CColumnCountGraph : begin
                            TAdvStringGrid(Sender).Canvas.Brush.Color:=XSettings.Navigation.BarColours[5];
                            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                            if TAdvStringGrid(Sender).Cells[9, ARow] <> '0' then begin
                              zRect.Top    := Rect.Top + 1;
                              zRect.Bottom := Rect.Bottom - 1;
                              zRect.Left   := Rect.Left + 1;
                              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[9, ARow]);
                              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
                              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                            end;

                            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
                            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
                            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[3, ARow]);
                          end;
      CCOlumnSizeGraph  : begin
                            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
                            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                            if TAdvStringGrid(Sender).Cells[10, ARow] <> '0' then begin
                              zRect.Top    := Rect.Top + 1;
                              zRect.Bottom := Rect.Bottom - 1;
                              zRect.Left   := Rect.Left + 1;
                              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[10, ARow]);

                              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
                              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                            end;

                            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
                            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
                            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[6, ARow]);
                          end;
    end;
  end;
end;


procedure TFrameReports.sgMainReportCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
begin
  if (Acol = 0) or (Acol = 1) then begin
    DoSort := False; // stops the component for sorting automatically
    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then  // make sure we toggle the search direction -
        SortSettings.Direction := sdAscending        // as this is not done for us
      else                                         //
        SortSettings.Direction := sdDescending;      //

      Sortsettings.Column := 7; //set the hidden column as the sort source
      QSort;                  //force a quick sort of above

      SortSettings.Column := Acol;
    end;
  end
  else if Acol = 3 then begin
    DoSort := False; // stops the component for sorting automatically
    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then  // make sure we toggle the search direction -
        SortSettings.Direction := sdAscending        // as this is not done for us
      else                                         //
        SortSettings.Direction := sdDescending;      //

      Sortsettings.Column := 2; //set the hidden column as the sort source
      QSort;                  //force a quick sort of above

      SortSettings.Column := Acol;
    end;
  end
  else if (Acol = 5) or (Acol = 6) then begin
    DoSort := False; // stops the component for sorting automatically
    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then  // make sure we toggle the search direction -
        SortSettings.Direction := sdAscending        // as this is not done for us
      else                                         //
        SortSettings.Direction := sdDescending;      //

      Sortsettings.Column := 8; //set the hidden column as the sort source
      QSort;                  //force a quick sort of above

      SortSettings.Column := Acol;
    end;
  end;
end;


procedure TFrameReports.sgMainReportDblClick(Sender: TObject);
begin
  if Assigned(FOnNewSearch) then
    FOnNewSearch(FSource, TSearchUtility.GetSearchText(StrToInt(sgMainReport.Cells[7, sgMainReport.Selection.Top])));
end;


procedure TFrameReports.sgMainReportDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  zRect : TRect;

begin
  if ARow <> 0 then begin
    case ACol of
      CColumnIdentifier : begin
                            Rect.Left   := Rect.Left;
                            Rect.Top    := Rect.Top;
                            Rect.Right  := Rect.Right;
                            Rect.Bottom := Rect.Bottom;

                            if TAdvStringGrid(Sender).Cells[7, Arow] <> '' then begin
                              TAdvStringGrid(Sender).Canvas.Brush.Color := GSystemGlobal.FileCategoryColors[StrToInt(TAdvStringGrid(Sender).Cells[7, Arow])];
                              TAdvStringGrid(Sender).Canvas.Rectangle(Rect);
                            end;
                          end;
      CColumnCountGraph : begin
                            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
                            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                            if TAdvStringGrid(Sender).Cells[9, ARow] <> '0' then begin
                              zRect.Top    := Rect.Top + 1;
                              zRect.Bottom := Rect.Bottom - 1;
                              zRect.Left   := Rect.Left + 1;
                              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[9, ARow]);

                              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
                              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                            end;

                            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
                            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
                            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[3, ARow]);
                          end;
      CCOlumnSizeGraph  : begin
                            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
                            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                            if TAdvStringGrid(Sender).Cells[10, ARow] <> '0' then begin
                              zRect.Top    := Rect.Top + 1;
                              zRect.Bottom := Rect.Bottom - 1;
                              zRect.Left   := Rect.Left + 1;
                              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[10, ARow]);

                              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
                              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                            end;

                            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
                            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
                            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[6, ARow]);
                          end;
    end;
  end;
end;


procedure TFrameReports.sgLengthDblClick(Sender: TObject);
begin
  if Assigned(FOnNewSearch) then begin
    if sgLength.Cells[1, sgLength.Selection.Top] = '280' then
      FOnNewSearch(FSource, '(FILEPATHLENGTH>279)')
    else
      FOnNewSearch(FSource, '(FILEPATHLENGTH=' + sgLength.Cells[1, sgLength.Selection.Top] + ')');
  end;
end;


procedure TFrameReports.sgLengthDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  zRect : TRect;

begin
  if ARow <> 0 then begin
    case ACol of
      CColumnIdentifier : begin
                          end;
      CColumnCountGraph : begin
                            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
                            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                            if TAdvStringGrid(Sender).Cells[9, ARow] <> '0' then begin
                              zRect.Top    := Rect.Top + 1;
                              zRect.Bottom := Rect.Bottom - 1;
                              zRect.Left   := Rect.Left + 1;
                              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[9, ARow]);

                              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
                              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                            end;

                            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
                            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
                            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[3, ARow]);
                          end;
      CCOlumnSizeGraph  : begin
                            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
                            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

                            if TAdvStringGrid(Sender).Cells[10, ARow] <> '0' then begin
                              zRect.Top    := Rect.Top + 1;
                              zRect.Bottom := Rect.Bottom - 1;
                              zRect.Left   := Rect.Left + 1;
                              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[10, ARow]);

                              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
                              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
                            end;

                            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
                            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
                            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[6, ARow]);
                          end;
    end;
  end;
end;


procedure TFrameReports.sgMainReportGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ACol = 2) or (ACol = 5) then  // File count, total size
    HAlign := taRightJustify
  else
    HAlign := taLeftJustify;
end;

procedure TFrameReports.sgMainReportGetCellColor(Sender: TObject; ARow,
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


procedure TFrameReports.sgNullFilesDblClick(Sender: TObject);
begin
  TXWindows.ExecuteFile(0, '"' + sgNullFiles.Cells[1, sgNullFiles.Selection.Top] + '"', '', '');
end;


procedure TFrameReports.sgTempCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
begin
  if Acol = 1 then begin
    DoSort := False; // stops the component for sorting automatically

    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then  // make sure we toggle the search direction -
        SortSettings.Direction := sdAscending        // as this is not done for us
      else                                         //
        SortSettings.Direction := sdDescending;      //

      Sortsettings.Column := 2; //set the hidden column as the sort source
      QSort;                  //force a quick sort of above

      //this line refreshes the component and forces the glyphs to be redrawn
      //on our Location column and NOT the column we sorted on!
      SortSettings.Column := 1;
    end;
  end;
end;


procedure TFrameReports.sgTempDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  l, w   : integer;

begin
  if ARow <> 0 then begin
    case ACol of
      1 : begin
            w := TAdvStringGrid(Sender).Canvas.TextWidth(TAdvStringGrid(Sender).Cells[ACol, ARow]);
            l := TAdvStringGrid(Sender).ColWidths[ACol] - w;

            TAdvStringGrid(Sender).Canvas.TextRect(Rect, Rect.Left + l - 2, Rect.Top + 2, TAdvStringGrid(Sender).Cells[ACol, ARow]);
          end;
    end;
  end;
end;


procedure TFrameReports.sgTop101BigDateDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);

 begin
  if cbTopDateColourCode.Checked then begin
    if ARow <> 0 then begin
      TAdvStringGrid(Sender).Canvas.Brush.Color := GSystemGlobal.FileCategoryColors[StrToInt(TAdvStringGrid(Sender).Cells[4, ARow])];
      TAdvStringGrid(Sender).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TAdvStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;
end;


procedure TFrameReports.sgTop50BigDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

 begin
  if cbTopColourCode.Checked then begin
    if ARow <> 0 then begin
      TAdvStringGrid(Sender).Canvas.Brush.Color := GSystemGlobal.FileCategoryColors[StrToInt(TAdvStringGrid(Sender).Cells[4, ARow])];
      TAdvStringGrid(Sender).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TAdvStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;
end;


procedure TFrameReports.sgTop50SmallDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);

 begin
  if cbTopColourCode.Checked then begin
    if ARow <> 0 then begin
      TAdvStringGrid(Sender).Canvas.Brush.Color := GSystemGlobal.FileCategoryColors[StrToInt(TAdvStringGrid(Sender).Cells[3, ARow])];
      TAdvStringGrid(Sender).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TAdvStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;
end;


procedure TFrameReports.sgUsersCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
begin
  if Acol = 3 then begin
    DoSort := False;                                 // stops the component for sorting automatically
    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 2;                      //set the hidden column as the sort source
      QSort;                                       //force a quick sort of above

      SortSettings.Column := 3;
    end;
  end
  else if (Acol = 5) or (Acol = 6) then begin
    DoSort := False;                                 // stops the component for sorting automatically
    with TAdvStringGrid(Sender) do begin
      if SortSettings.Direction = sdDescending then
        SortSettings.Direction := sdAscending
      else
        SortSettings.Direction := sdDescending;

      Sortsettings.Column := 7;                      //set the hidden column as the sort source
      QSort;                                       //force a quick sort of above

      SortSettings.Column := Acol;
    end;
  end;
end;


procedure TFrameReports.sgUsersDblClick(Sender: TObject);
begin
  if Assigned(FOnNewSearch) then
    FOnNewSearch(FSource, '(user=' + sgUsers.Cells[1, sgUsers.Selection.Top] + ')');
end;


procedure TFrameReports.sgUsersDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  zRect : TRect;

 begin
  if ARow <> 0 then begin
    case ACol of
      CColumnIdentifier : begin
            Rect.Left   := Rect.Left;
            Rect.Top    := Rect.Top;
            Rect.Right  := Rect.Right;
            Rect.Bottom := Rect.Bottom;

            TAdvStringGrid(Sender).Canvas.Brush.Color := spectrumcolours[(ARow - 1) mod spectrummod];
            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);
          end;
      CColumnCountGraph : begin
            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

            if TAdvStringGrid(Sender).Cells[8, ARow] <> '0' then begin
              zRect.Top    := Rect.Top + 1;
              zRect.Bottom := Rect.Bottom - 1;
              zRect.Left   := Rect.Left + 1;
              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[8, ARow]);

              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
            end;

            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[3, ARow]);
          end;
      CCOlumnSizeGraph : begin
            TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[5];
            TAdvStringGrid(Sender).Canvas.Rectangle(Rect);

            if TAdvStringGrid(Sender).Cells[9, ARow] <> '0' then begin
              zRect.Top    := Rect.Top + 1;
              zRect.Bottom := Rect.Bottom - 1;
              zRect.Left   := Rect.Left + 1;
              zRect.Right  := Rect.Left + StrToInt(TAdvStringGrid(Sender).Cells[9, ARow]);

              TAdvStringGrid(Sender).Canvas.Brush.Color := XSettings.Navigation.BarColours[6];
              TAdvStringGrid(Sender).Canvas.FillRect(zRect);
            end;

            TAdvStringGrid(Sender).Canvas.Brush.Style := bsClear;
            TAdvStringGrid(Sender).Canvas.Font.Color  := clBlack;
            TAdvStringGrid(Sender).Canvas.TextOut(Rect.Left + 5, Rect.Top + 3, TAdvStringGrid(Sender).Cells[6, ARow]);
          end;
    end;
  end;
end;


procedure TFrameReports.SpeedButton2Click(Sender: TObject);
begin
  if Assigned(FOnOpenSettingsTab) then
    FOnOpenSettingsTab(7);
end;


procedure TFrameReports.SpeedButton4Click(Sender: TObject);
begin
  case Ord(XSettings.TabDisplayOptions[TSpeedbutton(Sender).Tag][1]) of
    48 : miLengthShowAll.Checked := True;
    49 : miLengthNonZero.Checked := True;
  end;

  puLength.Popup(FGetLeftOffset + 90, FGetTopOffset + 160);
end;


procedure TFrameReports.sbUsersCopyClick(Sender: TObject);
begin
  TGridUtility.CopyGridToClipboard(1, sgUsers);
end;


procedure TFrameReports.splitDirListCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  if NewSize < 335 then Accept := False;
end;


procedure TFrameReports.splitDirListMoved(Sender: TObject);
begin
  sgDirList.ColWidths[0] := 10;
  sgDirList.ColWidths[2] := 50;
  sgDirList.ColWidths[3] := 52;
  sgDirList.ColWidths[4] := 4;
  sgDirList.ColWidths[5] := 62;
  sgDirList.ColWidths[6] := 52;

  sgDirList.ColWidths[1] := sgDirList.Width - (230 + 23);
end;


procedure TFrameReports.splitMagnitudeCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  if (NewSize < 350) then Accept := False;
end;


procedure TFrameReports.splitMagnitudeMoved(Sender: TObject);
begin
  sgMagnitude.ColWidths[0] := 10;
  sgMagnitude.ColWidths[2] := 40;
  sgMagnitude.ColWidths[3] := 52;
  sgMagnitude.ColWidths[4] := 4;
  sgMagnitude.ColWidths[5] := 60;
  sgMagnitude.ColWidths[6] := 52;

  sgMagnitude.ColWidths[1] := sgMagnitude.Width - (218 + 23);
end;


procedure TFrameReports.splitTableCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  if NewSize < 284 then Accept := False;
end;


procedure TFrameReports.splitTableMoved(Sender: TObject);
begin
  sgMainReport.ColWidths[0] := 10;
  sgMainReport.ColWidths[2] := 50;
  sgMainReport.ColWidths[3] := 52;
  sgMainReport.ColWidths[4] := 4;
  sgMainReport.ColWidths[5] := 62;
  sgMainReport.ColWidths[6] := 52;

  sgMainReport.ColWidths[1] := sgMainReport.Width - (230 + 23);
end;


procedure TFrameReports.splitLengthMoved(Sender: TObject);
begin
  sgLength.ColWidths[0] := 10;
  sgLength.ColWidths[2] := 50;
  sgLength.ColWidths[3] := 52;
  sgLength.ColWidths[4] := 4;
  sgLength.ColWidths[5] := 62;
  sgLength.ColWidths[6] := 52;

  sgLength.ColWidths[1] := sgLength.Width - (230 + 23);
end;


procedure TFrameReports.splitterFileDetailsCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  if (NewSize < 150) then Accept := False;
end;


procedure TFrameReports.splitterTempMoved(Sender: TObject);
begin
  sgTemp.ColWidths[1] := 80;
  sgTemp.ColWidths[0] := sgTemp.Width - 103;
end;


procedure TFrameReports.splitterTop50Moved(Sender: TObject);
begin
  sgTop50Big.ColWidths[2]   := 90;
  sgTop50Big.ColWidths[1]   := 60;
  sgTop50Big.ColWidths[0]   := sgTop50Big.Width - 173;

  sgTop50Small.ColWidths[1] := 60;
  sgTop50Small.ColWidths[0] := sgTop50Small.Width - 83;
end;


procedure TFrameReports.splitterTopDateMoved(Sender: TObject);
begin
  sgTop101BigDate.ColWidths[3]   := 90;
  sgTop101BigDate.ColWidths[2]   := 60;
  sgTop101BigDate.ColWidths[1]   := 65;
  sgTop101BigDate.ColWidths[0]   := sgTop101BigDate.Width - 238;

  sgTop101SmallDate.ColWidths[3] := 90;
  sgTop101SmallDate.ColWidths[2] := 60;
  sgTop101SmallDate.ColWidths[1] := 65;
  sgTop101SmallDate.ColWidths[0] := sgTop101SmallDate.Width - 238;
end;


procedure TFrameReports.splitterTreeCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
 if NewSize < 264 then Accept := False;
end;


procedure TFrameReports.splitterTreeMoved(Sender: TObject);
begin
  sgFileTypes.ColWidths[1] := 50;
  sgFileTypes.ColWidths[2] := 52;
  sgFileTypes.ColWidths[3] :=  4;
  sgFileTypes.ColWidths[4] := 60;
  sgFileTypes.ColWidths[5] := 52;

  sgFileTypes.ColWidths[0] := sgFileTypes.Width - (218 + 6);
end;


procedure TFrameReports.splitUsersMoved(Sender: TObject);
begin
  sgUsers.ColWidths[0] := 10;
  sgUsers.ColWidths[2] := 50;
  sgUsers.ColWidths[3] := 52;
  sgUsers.ColWidths[4] := 4;
  sgUsers.ColWidths[5] := 60;
  sgUsers.ColWidths[6] := 52;

  sgUsers.ColWidths[1] := sgUsers.Width - (228 + 23);
end;


procedure TFrameReports.tvFileDatesDblClick(Sender: TObject);
 var
  i : integer;
  ms, year,day, month : string;
  DateNode : TTreeNode;
  lSearchText : string;

 begin
  if tvFileDates.Selected <> Nil then begin       // cvbcbvb
    if (tvFileDates.Selected.Level >= 2) and (tvFileDates.Selected.Level <= 3) then begin
      DateNode := Nil;

      case tvFileDates.Selected.Level of
        2 : DateNode := tvFileDates.Selected;
        3 : DateNode := tvFileDates.Selected.Parent;
      else
        ShowXDialog('tvFileDatesDblClick', XText[rsDialog13], XDialogTypeWarning);
      end;

      if DateNode <> Nil then begin
        day := Copy(TXFormatting.FilterTags(DateNode.Text), 1, 2);
        ms  := Copy(TXFormatting.FilterTags(DateNode.Parent.Text), 1, 3);

        month := '01';
        for i := 1 to 12 do
          if shortmonths[i] = ms then month := IntToStr(i);

        if length(month) = 1 then month := '0' + month;

        year := Copy(TXFormatting.FilterTags(DateNode.Parent.Parent.Text), 1, 4);

        case cbFileDates.ItemIndex of
          CCreatedDate  : lSearchText := '(date='  + year + '/' + month + '/' + day + ')';
          CAccessedDate : lSearchText := '(adate=' + year + '/' + month + '/' + day + ')';
          CModifiedDate : lSearchText := '(mdate=' + year + '/' + month + '/' + day + ')';
        else
          lSearchText := '';
        end;

        if Assigned(FOnNewSearch) then
          FOnNewSearch(FSource, lSearchText);
      end;
    end;
  end;
end;


procedure TFrameReports.tvFileTypesClick(Sender: TObject);
var
  t : integer;
  lText : string;

begin
  if (GScanDetails[THTMLTreeView(Sender).Tag].Files.Count <> 0) then begin
    if THTMLTreeView(Sender).Selected.Parent = Nil then
      lText := THTMLTreeView(Sender).Selected.Text
    else
      lText := THTMLTreeView(Sender).Selected.Parent.Text;

    for t := 1 to __FileCategoriesCount do begin
      if Pos(TypeDescriptions[t], lText) <> 0 then
        XSettings.System.TreeIndex := t;
    end;

    TDisplayUtility.InformationTabTypesChart(THTMLTreeView(Sender).Tag, vtcTree, XSettings.Charts.Options.LabelOptions);
  end;
end;


procedure TFrameReports.tvFileTypesDblClick(Sender: TObject);
 var
  i : integer;

 begin
  if (GScanDetails[FSource].Files.Count <> 0) then begin
    if tvFileTypes.Selected.Parent <> Nil then begin
      i := Pos(':', tvFileTypes.Selected.Text);

      if Assigned(FOnNewSearch) then
        FOnNewSearch(FSource, '(extension='  + Copy(tvFileTypes.Selected.Text, 1, i - 1) + ')');
    end;
  end;
end;


procedure TFrameReports.vtcDirListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  AValueIndex : integer;

 begin
  Assert(Sender <> Nil, 'vtcDirListMouseDown :: Nil chart');

  if ssLeft in Shift then begin
    AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

    if AValueIndex > -1 then begin
      Screen.cursor := crHandPoint;

       sgDirListDblClickCell(Nil, sgDirList.Selection.Top, 0);
    end;
  end;
end;


procedure TFrameReports.vtcDirListMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
 var
  t, AValueIndex : integer;

 begin
  Assert(Sender <> Nil, 'vtcDirListMouseMove :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.cursor := crHandPoint;

    t := 1;

    while t < sgDirList.RowCount do begin
      if sgDirList.Cells[1, t] = vtcDirList.SeriesList[0].XLabel[AValueIndex] then begin
        sgDirList.SelectRows(t, 1);

        t := 99999;
      end;

      inc(t);
    end;
  end
  else begin
    Screen.cursor := crDefault;
  end;
end;


procedure TFrameReports.vtcFileDatesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
 var
  t, AValueIndex : integer;

 begin
  Assert(sender <> nil, 'vtcFileDatesMouseMove :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.cursor := crHandPoint;

    t := 0;

    while t<tvFileDates.Items.Count do begin
      if Copy(tvFileDates.Items[t].Text, 4, 4) = vtcFileDates.SeriesList[0].XLabel[AValueIndex] then begin
        tvFileDates.Selected := tvFileDates.Items[t];

        t := 99999999;
      end;

      inc(t);
    end;
  end
  else begin
    Screen.cursor := crDefault;
  end;
end;


procedure TFrameReports.vtcHistoryClick(Sender: TObject);
 var
  AValueIndex : integer;

 begin
  AValueIndex := vtcHistory.SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
      // TO lTaskID4Click(Nil);

// TO      FrameSearch.DoSearch(HGraphData.Strings[Round(vtcHistory.SeriesList[0].XValue[AValueIndex])]);
  end;
end;


procedure TFrameReports.vtcHistoryMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
 var
  AValueIndex : integer;

 begin
  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.cursor := crHandPoint;

    lHSelected.Caption := XText[rsSelected] + ': ' + TChart(Sender).SeriesList[0].XLabel[AValueIndex];
  end
  else begin
    Screen.cursor := crDefault;

    lHSelected.Caption := XText[rsSelected] + ': n/a';
  end;
end;


procedure TFrameReports.vtcLengthMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AValueIndex : integer;

begin
  Assert(Sender <> Nil, 'vtcLengthMouseDown :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then
    sgMainReportDblClick(Nil);
end;


procedure TFrameReports.vtcLengthMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  t, AValueIndex : integer;

begin
  Assert(Sender <> Nil, 'vtcLengthMouseMove :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.cursor := crHandPoint;

    t := 1;
    while t < sgLength.RowCount do begin
      if sgLength.Cells[1, t] = TChart(Sender).SeriesList[0].XLabel[AValueIndex] then begin
        sgLength.SelectRows(t, 1);

        t := 999;
      end;

      inc(t);
    end;
  end
  else begin
    Screen.Cursor := crDefault;
  end;
end;


procedure TFrameReports.vtcMagnitudeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  AValueIndex : integer;

 begin
  Assert(Sender <> Nil, 'vtcMagnitudeMouseDown :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.Cursor := crHandPoint;

    sgMagnitudeDblClick(Nil);
  end;
end;


procedure TFrameReports.vtcMagnitudeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
 var
  t, AValueIndex : integer;

 begin
  Assert(Sender <> Nil, 'vtcMagnitudeMouseMove :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.Cursor := crHandPoint;

    t := 1;

    while t<sgMagnitude.RowCount do begin
      if sgMagnitude.Cells[1, t] = vtcMagnitude.SeriesList[0].XLabel[AValueIndex] then begin
        sgMagnitude.SelectRows(t, 1);

        t := 99;
      end;

      inc(t);
    end;
  end
  else begin
    Screen.cursor := crDefault;
  end;
end;


procedure TFrameReports.vtcMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var
  AValueIndex : integer;

 begin
  Assert(Sender <> Nil, 'vtcMainMouseDown :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then
    sgMainReportDblClick(Nil);
end;


procedure TFrameReports.vtcMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  t, AValueIndex : integer;

begin
  Assert(Sender <> Nil, 'vtcMainMouseMove :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.cursor := crHandPoint;

    t := 1;
    while t <= 19 do begin
      if sgMainReport.Cells[1, t] = TChart(Sender).SeriesList[0].XLabel[AValueIndex] then begin
        sgMainReport.SelectRows(t, 1);

        t := 99;
      end;

      inc(t);
    end;
  end
  else begin
    Screen.Cursor := crDefault;
  end;
end;


procedure TFrameReports.vtcTempMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
 var
  t, AValueIndex : integer;

 begin
  Assert(Sender <> Nil, 'vtcUsersMouseMove :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.Cursor := crHandPoint;

    t := 1;

    while t < sgUsers.RowCount do begin
      if sgUsers.Cells[1, t] = vtcUsers.SeriesList[0].XLabel[AValueIndex] then begin
        sgUsers.SelectRows(t, 1);

        t := 9999;
      end;

      inc(t);
    end;
  end
  else begin
    Screen.Cursor := crDefault;
  end;
end;


procedure TFrameReports.vtcUsersMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  t, AValueIndex : integer;

 begin
  Assert(Sender <> Nil, 'vtcUsersMouseMove :: Nil chart');

  AValueIndex := TChart(Sender).SeriesList[0].GetCursorValueIndex;

  if AValueIndex > -1 then begin
    Screen.Cursor := crHandPoint;

    t := 1;

    while t < sgUsers.RowCount do begin
      if sgUsers.Cells[1, t] = vtcUsers.SeriesList[0].XLabel[AValueIndex] then begin
        sgUsers.SelectRows(t, 1);

        t := 9999;
      end;

      inc(t);
    end;
  end
  else begin
    Screen.Cursor := crDefault;
  end;
end;


procedure TFrameReports.RefreshTableDisplay(tableID : integer);
 begin
  case tableID of
    1 : TDisplayUtility.InformationTabTableTable(FSource, 1, sgMainReport);
    2 : BuildTree;
    3 : TDisplayUtility.InformationTabLengthTable(FSource, 3, sgLength);
  end;
end;


procedure TFrameReports.RefreshGraphDirList(Sender: TObject);
 begin
  if Sender <> Nil then begin
    if Sender.ClassType = TMenuItem then
      sbFolderConfig.Tag := TMenuItem(Sender).Tag;
  end;

  if cbGraphSizeDirList.Checked then
    vtcDirList.Tag := 1
  else
    vtcDirList.Tag := 0;

  TDisplayUtility.InformationTabFolderChart(FSource, sbFolderConfig.Tag, vtcDirList, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.BuildUserDetailsGraph(sender : TObject);
 begin
  if rbUsersQuantity.Checked then
    vtcUsers.Tag := 1
  else
    vtcUsers.Tag := 2;

  TDisplayUtility.InformationTabUsersGraph(FSource, vtcUsers);
end;


procedure TFrameReports.RefreshGraph(Sender: TObject);
 begin
  if rbGraphSize.Checked then
    vtcMain.Tag := 2
  else
    vtcMain.Tag := 1;

  TDisplayUtility.InformationTabTableGraph(FSource, vtcMain, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.RefreshLengthGraph(Sender: TObject);
 begin
  if rbLengthGraphSize.Checked then
    vtcLength.Tag := 2
  else
    vtcLength.Tag := 1;

  TDisplayUtility.InformationTabLengthGraph(FSource, vtcLength, XSettings.Charts.Options.LabelOptions);
end;


procedure TFrameReports.BuildTree;
 begin
  TDisplayUtility.InformationTabTypesTable(FSource, 2, tvFileTypes);

  case TDisplayUtility.InformationTabTypesTablePost(tvFileTypes) of
    1 : tvFileTypesClick(tvFileTypes);
    2 : cbTreeSizeClick(Nil);
  end;
end;


//par1, caption; par2, text FileName; par3, zsr report, par4; html report, par5; do charts, par6; xml reports
function TFrameReports.SaveReports(var TextOptions : TTextReportOptions; var CSVOptions  : TCSVReportOptions;
                               var HTMLOptions : THTMLReportOptions; var XinOptions  : TXinorbisReportOptions;
                               var XMLOptions  : TXMLReportOptions;  var TreeOptions : TTreeReportOptions): boolean;

var
  lReportOutput : TStringList;

begin
//  tc := Caption;
//  Caption := XText[rsSavingReports] + ' ' + XText[rsPleaseWait];

  Result := True;

  // =========================================================================
  // -- save out text version ------------------------------------------------
  // =========================================================================
  if TextOptions.FileName <> '' then begin
    lReportOutput := TStringList.Create;

    GReportText.GenerateTextReport(FSource, lReportOutput, TextOptions);

    FreeAndNil(lReportOutput);
  end;

  // =========================================================================
  // -- save out xinorbis report ---------------------------------------------
  // =========================================================================
  if XinOptions.FileName <> '' then begin
    GReportXinorbis.GenerateXinorbisReport(FSource, XinOptions);
  end;

  // =========================================================================
  // -- save out HTML version ------------------------------------------------
  // =========================================================================
  if HTMLOptions.FileName <> '' then begin
    GReportHTML.GenerateHTMLReport(FSource, HTMLOptions, '');
  end;

  // =========================================================================
  // -- save out XML version -------------------------------------------------
  // =========================================================================
  if XMLOptions.FileName <> '' then begin
    lReportOutput := TStringList.Create;

    if XMLOptions.XMLData = CDataSummary then
      GReportXML.GenerateXMLOutput(FSource, XMLOptions, lReportOutput)
    else
      GReportXML.GenerateXMLOutputFileList(XMLOptions.FileName, lReportOutput, 1, LayoutUnknown); // MOVE TO xinorbisreports

    FreeAndNil(lReportOutput);
  end;

  // =========================================================================
  // -- save out CSV version -------------------------------------------------
  // =========================================================================
  if CSVOptions.FileName <> '' then begin
    lReportOutput := TStringList.Create;

    GReportCSV.GenerateCSVReport(FSource, lReportOutput, CSVOptions, LayoutUnknown);

    FreeAndNil(lReportOutput);
  end;

  // =========================================================================
  // -- save out Tree version ------------------------------------------------
  // =========================================================================
  if TreeOptions.FileName <> '' then begin
    if not(IsFileHistoryThreadRunning) then begin
      lReportOutput := TStringList.Create;

      GReportTree.GenerateTreeReport(FSource, lReportOutput, TreeOptions);

      FreeAndNil(lReportOutput);
    end;
  end;

//    Caption:=tc;
end;


procedure TFrameReports.ClearEverything;
begin
  sgMainReport.ClearRows(1, sgMainReport.RowCount - 1);
  sgMainReport.RowCount := 2;
  vtcMain.SeriesList.Items[0].Clear;

  tvFileTypes.Items.Clear;
  vtcTree.SeriesList.Items[0].Clear;

  sgExtension.ClearRows(1, sgExtension.RowCount - 1);
  sgExtension.RowCount := 2;

  sgDirList.ClearRows(1, sgDirList.RowCount - 1);
  sgDirList.RowCount := 2;
  vtcDirList.SeriesList.Items[0].Clear;

  sgMagnitude.ClearRows(1, sgMagnitude.RowCount - 1);
  sgMagnitude.RowCount := 2;
  vtcMagnitude.SeriesList.Items[0].Clear;

  tvFileDates.Items.Clear;
  vtcFileDates.SeriesList.Items[0].Clear;

  vtcHistory.SeriesList.Items[0].Clear;

  sgTop50Big.ClearRows(1, sgTop50Big.RowCount - 1);
  sgTop50Big.RowCount   := 2;
  sgTop50Small.ClearRows(1, sgTop50Small.RowCount - 1);
  sgTop50Small.RowCount := 2;

  sgTop101BigDate.ClearRows(1, sgTop101BigDate.RowCount - 1);
  sgTop101BigDate.RowCount   := 2;
  sgTop101SmallDate.ClearRows(1, sgTop101SmallDate.RowCount - 1);
  sgTop101SmallDate.RowCount := 2;

  TGridUtility.ClearStringGird(sgNullFiles, False);
  TGridUtility.ClearStringGird(sgNullFolders, False);

  sgUsers.ClearRows(1, sgUsers.RowCount - 1);
  sgUsers.RowCount := 2;
  vtcUsers.SeriesList.Items[0].Clear;

  sgTemp.ClearRows(1, sgTemp.RowCount - 1);
  sgTemp.RowCount := 2;
  vtcTemp.SeriesList.Items[0].Clear;
end;


procedure TFrameReports.AddTempFile(const aFileName, aSizeWords, aSize : string);
begin
  sgTemp.Cells[0, sgTemp.RowCount - 1] := aFileName;
  sgTemp.Cells[1, sgTemp.RowCount - 1] := aSizeWords;
  sgTemp.Cells[2, sgTemp.RowCount - 1] := aSize;

  sgTemp.RowCount := sgTemp.RowCount + 1;
end;


procedure TFrameReports.AddNullFolder(const aFileName : string);
begin
  sgNullFolders.Cells[0, sgNullFolders.RowCount - 1] := aFileName;

  sgNullFolders.RowCount := sgNullFolders.RowCount + 1;
end;


function TFrameReports.IsFileHistoryThreadRunning: boolean;
begin
  if Assigned(FIsFHUpdateThreadRunning) then
    Result := FIsFHUpdateThreadRunning
  else
    Result := False;
end;


end.
