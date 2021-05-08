{
  超小WebBrowser

  by wr960204武稀松. 2013/05/24

  2013/05/28 TMicroWebBrowser加入Events方法,可以相应外面IDispatch的Invoke方法.

  wr960204@126.com
}
unit MicroWebBrowser;

{$IF CompilerVersion >= 17.00}
{$DEFINE SUPPORTS_INLINE}
{$IFEND}
{$DEFINE FAKE_OLEVARIANT }
{ 使用假的OleVariant类型,避免引入更多的单元,例如Variants,SysUtils等 }
{$DEFINE DYNAMIC_LINK}
{ 动态链接API,可以使API不出现在函数的导入表中.牺牲一点点速度,代码体积也会大一点点.
  参考了JEDI的方式. }

interface

uses

{$IFNDEF FAKE_OLEVARIANT}
  Variants,
{$ENDIF}
  Windows;

type
  TOleDate = Double;
  POleDate = ^TOleDate;
  TOleBool = WordBool;
  POleBool = ^TOleBool;
{$IFDEF FAKE_OLEVARIANT}

type

  OleVariant = TVarData;
  // 不得已,否则编译器会直接引用Variants单元,而Variants单元又会带入SysUils,Character,
function EmptyParam: OleVariant;
{$ENDIF FAKE_OLEVARIANT}
{$REGION 'OLE2.pas'}

const
  OLEIVERB_PRIMARY = 0;
  OLEIVERB_SHOW = -1;
  OLEIVERB_OPEN = -2;
  OLEIVERB_HIDE = -3;
  OLEIVERB_UIACTIVATE = -4;
  OLEIVERB_INPLACEACTIVATE = -5;
  OLEIVERB_DISCARDUNDOSTATE = -6;
{$ENDREGION 'OLE2.pas'}
{$REGION 'ActiveX.pas'}

const
  ole32 = 'ole32.dll';
  oleaut32 = 'oleaut32.dll';

  CLSCTX_INPROC_SERVER = 1;
  CLSCTX_INPROC_HANDLER = 2;
  CLSCTX_INPROC = CLSCTX_INPROC_SERVER or CLSCTX_INPROC_HANDLER;

  CLSID_WebBrowser: TGUID = '{8856F961-340A-11D0-A96B-00C04FD705A2}';
  IID_IOleInPlaceObject: TGUID = '{00000113-0000-0000-C000-000000000046}';
  IID_IOleObject: TGUID = '{00000112-0000-0000-C000-000000000046}';

type
  POleStr = PWideChar;
  SYSINT = Integer;
  TOleEnum = type LongWord;

  TSafeArrayBound = record
    cElements: Longint;
    lLbound: Longint;
  end;

  PSafeArray = ^TSafeArray;

  TSafeArray = record
    cDims: Word;
    fFeatures: Word;
    cbElements: Longint;
    cLocks: Longint;
    pvData: Pointer;
    rgsabound: array [0 .. 0] of TSafeArrayBound;
  end;

  TOleInPlaceFrameInfo = record
    cb: Integer;
    fMDIApp: BOOL;
    hwndFrame: HWND;
    haccel: haccel;
    cAccelEntries: Integer;
  end;

  IOleClientSite = interface(IUnknown)
    ['{00000118-0000-0000-C000-000000000046}']
    function SaveObject: HResult; stdcall;
    function GetMoniker(dwAssign: Longint; dwWhichMoniker: Longint;
      out mk: IUnknown): HResult; stdcall;
    function GetContainer(out container: IUnknown): HResult; stdcall;
    function ShowObject: HResult; stdcall;
    function OnShowWindow(fShow: BOOL): HResult; stdcall;
    function RequestNewObjectLayout: HResult; stdcall;
  end;

  IOleWindow = interface(IUnknown)
    ['{00000114-0000-0000-C000-000000000046}']
    function GetWindow(out wnd: HWND): HResult; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult; stdcall;
  end;

  IOleInPlaceActiveObject = interface;

  IOleInPlaceUIWindow = interface(IOleWindow)
    ['{00000115-0000-0000-C000-000000000046}']
    function GetBorder(out rectBorder: TRect): HResult; stdcall;
    function RequestBorderSpace(const borderwidths: TRect): HResult; stdcall;
    function SetBorderSpace(pborderwidths: PRect): HResult; stdcall;
    function SetActiveObject(const activeObject: IOleInPlaceActiveObject;
      pszObjName: POleStr): HResult; stdcall;
  end;

  { IOleInPlaceActiveObject interface }

  IOleInPlaceActiveObject = interface(IOleWindow)
    ['{00000117-0000-0000-C000-000000000046}']
    function TranslateAccelerator(var msg: TMsg): HResult; stdcall;
    function OnFrameWindowActivate(fActivate: BOOL): HResult; stdcall;
    function OnDocWindowActivate(fActivate: BOOL): HResult; stdcall;
    function ResizeBorder(const rcBorder: TRect;
      const uiWindow: IOleInPlaceUIWindow; fFrameWindow: BOOL)
      : HResult; stdcall;
    function EnableModeless(fEnable: BOOL): HResult; stdcall;
  end;

  IOleInPlaceFrame = IUnknown;

  IOleInPlaceSite = interface(IOleWindow)
    ['{00000119-0000-0000-C000-000000000046}']
    function CanInPlaceActivate: HResult; stdcall;
    function OnInPlaceActivate: HResult; stdcall;
    function OnUIActivate: HResult; stdcall;
    function GetWindowContext(out frame: IOleInPlaceFrame; out doc: IUnknown;
      out rcPosRect: TRect; out rcClipRect: TRect;
      out frameInfo: TOleInPlaceFrameInfo): HResult; stdcall;
    function Scroll(scrollExtent: TPoint): HResult; stdcall;
    function OnUIDeactivate(fUndoable: BOOL): HResult; stdcall;
    function OnInPlaceDeactivate: HResult; stdcall;
    function DiscardUndoState: HResult; stdcall;
    function DeactivateAndUndo: HResult; stdcall;
    function OnPosRectChange(const rcPosRect: TRect): HResult; stdcall;
  end;

  IOleInPlaceObject = interface(IOleWindow)
    ['{00000113-0000-0000-C000-000000000046}']
    function InPlaceDeactivate: HResult; stdcall;
    function UIDeactivate: HResult; stdcall;
    function SetObjectRects(const rcPosRect: TRect; const rcClipRect: TRect)
      : HResult; stdcall;
    function ReactivateAndUndo: HResult; stdcall;
  end;

  IOleObject = interface(IUnknown)
    ['{00000112-0000-0000-C000-000000000046}']
    function SetClientSite(const clientSite: IOleClientSite): HResult; stdcall;
    function GetClientSite(out clientSite: IOleClientSite): HResult; stdcall;
    function SetHostNames(szContainerApp: Pointer; szContainerObj: Pointer)
      : HResult; stdcall;
    function Close(dwSaveOption: Longint): HResult; stdcall;
    function SetMoniker(dwWhichMoniker: Longint; const mk: IUnknown)
      : HResult; stdcall;
    function GetMoniker(dwAssign: Longint; dwWhichMoniker: Longint;
      out mk: IUnknown): HResult; stdcall;
    function InitFromData(const dataObject: IUnknown; fCreation: BOOL;
      dwReserved: Longint): HResult; stdcall;
    function GetClipboardData(dwReserved: Longint; out dataObject: IUnknown)
      : HResult; stdcall;
    function DoVerb(iVerb: Longint; msg: PMsg; const activeSite: IOleClientSite;
      lindex: Longint; hwndParent: HWND; const posRect: TRect)
      : HResult; stdcall;
    function EnumVerbs(out enumOleVerb: IUnknown): HResult; stdcall;
    function Update: HResult; stdcall;
    function IsUpToDate: HResult; stdcall;
    function GetUserClassID(out clsid: TGUID): HResult; stdcall;
    function GetUserType(dwFormOfType: Longint; out pszUserType: Pointer)
      : HResult; stdcall;
    function SetExtent(dwDrawAspect: Longint; const size: TPoint)
      : HResult; stdcall;
    function GetExtent(dwDrawAspect: Longint; out size: TPoint)
      : HResult; stdcall;
    function Advise(const advSink: IUnknown; out dwConnection: Longint)
      : HResult; stdcall;
    function Unadvise(dwConnection: Longint): HResult; stdcall;
    function EnumAdvise(out EnumAdvise: IUnknown): HResult; stdcall;
    function GetMiscStatus(dwAspect: Longint; out dwStatus: Longint)
      : HResult; stdcall;
    function SetColorScheme(const logpal: TLogPalette): HResult; stdcall;
  end;

  IEnumConnections = interface
    ['{B196B287-BAB4-101A-B69C-00AA00341D07}']
    function Next(celt: Longint; out elt; pceltFetched: PLongint)
      : HResult; stdcall;
    function Skip(celt: Longint): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out Enum: IEnumConnections): HResult; stdcall;
  end;

  IEnumConnectionPoints = interface
    ['{B196B285-BAB4-101A-B69C-00AA00341D07}']
    function Next(celt: Longint; out elt; pceltFetched: PLongint)
      : HResult; stdcall;
    function Skip(celt: Longint): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out Enum: IEnumConnectionPoints): HResult; stdcall;
  end;

  IConnectionPoint = interface;

  IConnectionPointContainer = interface
    ['{B196B284-BAB4-101A-B69C-00AA00341D07}']
    function EnumConnectionPoints(out Enum: IEnumConnectionPoints)
      : HResult; stdcall;
    function FindConnectionPoint(const iid: TGUID; out cp: IConnectionPoint)
      : HResult; stdcall;
  end;

  IConnectionPoint = interface
    ['{B196B286-BAB4-101A-B69C-00AA00341D07}']
    function GetConnectionInterface(out iid: TGUID): HResult; stdcall;
    function GetConnectionPointContainer(out cpc: IConnectionPointContainer)
      : HResult; stdcall;
    function Advise(const unkSink: IUnknown; out dwCookie: Longint)
      : HResult; stdcall;
    function Unadvise(dwCookie: Longint): HResult; stdcall;
    function EnumConnections(out Enum: IEnumConnections): HResult; stdcall;
  end;

const
{$EXTERNALSYM VT_EMPTY}
  VT_EMPTY = 0; { [V]   [P]  nothing }
{$EXTERNALSYM VT_NULL}
  VT_NULL = 1; { [V]        SQL style Null }
{$EXTERNALSYM VT_I2}
  VT_I2 = 2; { [V][T][P]  2 byte signed int }
{$EXTERNALSYM VT_I4}
  VT_I4 = 3; { [V][T][P]  4 byte signed int }
{$EXTERNALSYM VT_R4}
  VT_R4 = 4; { [V][T][P]  4 byte real }
{$EXTERNALSYM VT_R8}
  VT_R8 = 5; { [V][T][P]  8 byte real }
{$EXTERNALSYM VT_CY}
  VT_CY = 6; { [V][T][P]  currency }
{$EXTERNALSYM VT_DATE}
  VT_DATE = 7; { [V][T][P]  date }
{$EXTERNALSYM VT_BSTR}
  VT_BSTR = 8; { [V][T][P]  binary string }
{$EXTERNALSYM VT_DISPATCH}
  VT_DISPATCH = 9; { [V][T]     IDispatch FAR* }
{$EXTERNALSYM VT_ERROR}
  VT_ERROR = 10; { [V][T]     SCODE }
{$EXTERNALSYM VT_BOOL}
  VT_BOOL = 11; { [V][T][P]  True=-1, False=0 }
{$EXTERNALSYM VT_VARIANT}
  VT_VARIANT = 12; { [V][T][P]  VARIANT FAR* }
{$EXTERNALSYM VT_UNKNOWN}
  VT_UNKNOWN = 13; { [V][T]     IUnknown FAR* }
{$EXTERNALSYM VT_DECIMAL}
  VT_DECIMAL = 14; { [V][T]   [S]  16 byte fixed point }

{$EXTERNALSYM VT_I1}
  VT_I1 = 16; { [T]     signed char }
{$EXTERNALSYM VT_UI1}
  VT_UI1 = 17; { [T]     unsigned char }
{$EXTERNALSYM VT_UI2}
  VT_UI2 = 18; { [T]     unsigned short }
{$EXTERNALSYM VT_UI4}
  VT_UI4 = 19; { [T]     unsigned long }
{$EXTERNALSYM VT_I8}
  VT_I8 = 20; { [T][P]  signed 64-bit int }
{$EXTERNALSYM VT_UI8}
  VT_UI8 = 21; { [T]     unsigned 64-bit int }
{$EXTERNALSYM VT_INT}
  VT_INT = 22; { [T]     signed machine int }
{$EXTERNALSYM VT_UINT}
  VT_UINT = 23; { [T]     unsigned machine int }
{$EXTERNALSYM VT_VOID}
  VT_VOID = 24; { [T]     C style void }
{$EXTERNALSYM VT_HRESULT}
  VT_HRESULT = 25; { [T] }
{$EXTERNALSYM VT_PTR}
  VT_PTR = 26; { [T]     pointer type }
{$EXTERNALSYM VT_SAFEARRAY}
  VT_SAFEARRAY = 27; { [T]     (use VT_ARRAY in VARIANT) }
{$EXTERNALSYM VT_CARRAY}
  VT_CARRAY = 28; { [T]     C style array }
{$EXTERNALSYM VT_USERDEFINED}
  VT_USERDEFINED = 29; { [T]     user defined type }
{$EXTERNALSYM VT_LPSTR}
  VT_LPSTR = 30; { [T][P]  null terminated string }
{$EXTERNALSYM VT_LPWSTR}
  VT_LPWSTR = 31; { [T][P]  wide null terminated string }
{$EXTERNALSYM VT_RECORD}
  VT_RECORD = 36; { [V]   [P][S]  user defined type }
{$EXTERNALSYM VT_INT_PTR}
  VT_INT_PTR = 37; { [T]     signed machine register size width }
{$EXTERNALSYM VT_UINT_PTR}
  VT_UINT_PTR = 38; { [T]     unsigned machine register size width }

{$EXTERNALSYM VT_FILETIME}
  VT_FILETIME = 64; { [P]  FILETIME }
{$EXTERNALSYM VT_BLOB}
  VT_BLOB = 65; { [P]  Length prefixed bytes }
{$EXTERNALSYM VT_STREAM}
  VT_STREAM = 66; { [P]  Name of the stream follows }
{$EXTERNALSYM VT_STORAGE}
  VT_STORAGE = 67; { [P]  Name of the storage follows }
{$EXTERNALSYM VT_STREAMED_OBJECT}
  VT_STREAMED_OBJECT = 68; { [P]  Stream contains an object }
{$EXTERNALSYM VT_STORED_OBJECT}
  VT_STORED_OBJECT = 69; { [P]  Storage contains an object }
{$EXTERNALSYM VT_BLOB_OBJECT}
  VT_BLOB_OBJECT = 70; { [P]  Blob contains an object }
{$EXTERNALSYM VT_CF}
  VT_CF = 71; { [P]  Clipboard format }
{$EXTERNALSYM VT_CLSID}
  VT_CLSID = 72; { [P]  A Class ID }
{$EXTERNALSYM VT_VERSIONED_STREAM}
  VT_VERSIONED_STREAM = 73; { [P]  Stream with a GUID version }

{$EXTERNALSYM VT_VECTOR}
  VT_VECTOR = $1000; { [P]  simple counted array }
{$EXTERNALSYM VT_ARRAY}
  VT_ARRAY = $2000; { [V]        SAFEARRAY* }
{$EXTERNALSYM VT_BYREF}
  VT_BYREF = $4000; { [V] }
{$EXTERNALSYM VT_RESERVED}
  VT_RESERVED = $8000;
{$EXTERNALSYM VT_ILLEGAL}
  VT_ILLEGAL = $FFFF;
{$EXTERNALSYM VT_ILLEGALMASKED}
  VT_ILLEGALMASKED = $0FFF;
{$EXTERNALSYM VT_TYPEMASK}
  VT_TYPEMASK = $0FFF;

type
  { from WTYPES.H }
{$ALIGN 1}
  PDecimal = ^TDecimal;

  tagDEC = record
    wReserved: Word;
    case Integer of
      0:
        (scale, sign: Byte; Hi32: Longint;
          case Integer of
            0: (Lo32, Mid32: Longint);
            1: (Lo64: LONGLONG));
      1:
        (signscale: Word);
  end;

  TDecimal = tagDEC;
  DECIMAL = TDecimal;
{$ALIGN ON}
  PVariantArg = ^TVariantArg;
{$EXTERNALSYM tagVARIANT}

  tagVARIANT = record
    vt: TVarType;
    wReserved1: Word;
    wReserved2: Word;
    wReserved3: Word;
    case Integer of
      VT_UI1:
        (bVal: Byte);
      VT_I2:
        (iVal: Smallint);
      VT_I4:
        (lVal: Longint);
      VT_R4:
        (fltVal: Single);
      VT_R8:
        (dblVal: Double);
      VT_BOOL:
        (vbool: TOleBool);
      VT_ERROR:
        (scode: HResult);
      VT_CY:
        (cyVal: Currency);
      VT_DATE:
        (date: TOleDate);
      VT_BSTR:
        (bstrVal: PWideChar { WideString } );
      VT_UNKNOWN:
        (unkVal: Pointer { IUnknown } );
      VT_DISPATCH:
        (dispVal: Pointer { IDispatch } );
      VT_ARRAY:
        (parray: PSafeArray);
      VT_BYREF or VT_UI1:
        (pbVal: ^Byte);
      VT_BYREF or VT_I2:
        (piVal: ^Smallint);
      VT_BYREF or VT_I4:
        (plVal: ^Longint);
      VT_BYREF or VT_R4:
        (pfltVal: ^Single);
      VT_BYREF or VT_R8:
        (pdblVal: ^Double);
      VT_BYREF or VT_BOOL:
        (pbool: ^TOleBool);
      VT_BYREF or VT_ERROR:
        (pscode: ^HResult);
      VT_BYREF or VT_CY:
        (pcyVal: ^Currency);
      VT_BYREF or VT_DATE:
        (pdate: ^TOleDate);
      VT_BYREF or VT_BSTR:
        (pbstrVal: ^WideString);
      VT_BYREF or VT_UNKNOWN:
        (punkVal: ^IUnknown);
      VT_BYREF or VT_DISPATCH:
        (pdispVal: ^IDispatch);
      VT_BYREF or VT_ARRAY:
        (pparray: ^PSafeArray);
      VT_BYREF or VT_VARIANT:
        (pvarVal: PVariant);
      VT_BYREF:
        (byRef: Pointer);
      VT_I1:
        (cVal: AnsiChar);
      VT_UI2:
        (uiVal: Word);
      VT_UI4:
        (ulVal: LongWord);
      VT_I8:
        (llVal: Int64);
      VT_UI8:
        (ullVal: UInt64);
      VT_INT:
        (intVal: Integer);
      VT_UINT:
        (uintVal: LongWord);
      VT_BYREF or VT_DECIMAL:
        (pdecVal: PDecimal);
      VT_BYREF or VT_I1:
        (pcVal: PAnsiChar);
      VT_BYREF or VT_UI2:
        (puiVal: PWord);
      VT_BYREF or VT_UI4:
        (pulVal: PInteger);
      VT_BYREF or VT_INT:
        (pintVal: PInteger);
      VT_BYREF or VT_UINT:
        (puintVal: PLongWord);
      VT_BYREF or VT_I8:
        (pllVal: ^Int64);
      VT_BYREF or VT_UI8:
        (pullVal: ^UInt64);
      VT_RECORD:
        (pvRecord: Pointer;
          pRecInfo: Pointer);
  end;

  TVariantArg = tagVARIANT;

  PVariantArgList = ^TVariantArgList;
  TVariantArgList = array [0 .. 65535] of TVariantArg;

  TDispID = Longint;

  PDispIDList = ^TDispIDList;
  TDispIDList = array [0 .. 65535] of TDispID;

  PDispParams = ^TDispParams;
{$EXTERNALSYM tagDISPPARAMS}

  tagDISPPARAMS = record
    rgvarg: PVariantArgList;
    rgdispidNamedArgs: PDispIDList;
    cArgs: Longint;
    cNamedArgs: Longint;
  end;

  TDispParams = tagDISPPARAMS;
{$EXTERNALSYM DISPPARAMS}
  DISPPARAMS = TDispParams;

procedure OleUninitialize; stdcall;
function OleInitialize(pwReserved: Pointer): HResult; stdcall;
function CoCreateInstance(const clsid: TGUID; unkOuter: IUnknown;
  dwClsContext: Longint; const iid: TGUID; out pv): HResult; stdcall;

function SafeArrayCreate(vt: TVarType; cDims: Integer; const rgsabound)
  : PSafeArray; stdcall;
function SafeArrayDestroy(psa: PSafeArray): HResult; stdcall;
procedure VariantInit(var varg: OleVariant); stdcall;
function VariantClear(var varg: OleVariant): HResult; stdcall;

function SysAllocString(psz: POleStr): POleStr; stdcall;
procedure SysFreeString(bstr: POleStr); stdcall;

{$ENDREGION}
{$REGION 'SHDocVw.pas'}

const
  IID_IWebBrowser2: TGUID = '{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}';

type
  OLECMDID = TOleEnum;
  OLECMDF = TOleEnum;
  OLECMDEXECOPT = TOleEnum;
  tagREADYSTATE = TOleEnum;

const
  READYSTATE_UNINITIALIZED = $00000000;
  READYSTATE_LOADING = $00000001;
  READYSTATE_LOADED = $00000002;
  READYSTATE_INTERACTIVE = $00000003;
  READYSTATE_COMPLETE = $00000004;

type

  IWebBrowser = interface(IDispatch)
    ['{EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}']
    procedure GoBack; safecall;
    procedure GoForward; safecall;
    procedure GoHome; safecall;
    procedure GoSearch; safecall;
    procedure Navigate(const URL: WideString; const Flags: OleVariant;
      const TargetFrameName: OleVariant; var PostData: OleVariant;
      const Headers: OleVariant); safecall;
    procedure Refresh; safecall;
    procedure Refresh2(var Level: OleVariant); safecall;
    procedure Stop; safecall;
    function Get_Application: IDispatch; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Container: IDispatch; safecall;
    function Get_Document: IDispatch; safecall;
    function Get_TopLevelContainer: WordBool; safecall;
    function Get_type_: WideString; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pl: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pl: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pl: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pl: Integer); safecall;
    function Get_LocationName: WideString; safecall;
    function Get_LocationURL: WideString; safecall;
    function Get_Busy: WordBool; safecall;
  end;

  IWebBrowserApp = interface(IWebBrowser)
    ['{0002DF05-0000-0000-C000-000000000046}']
    procedure Quit; safecall;
    procedure ClientToWindow(var pcx: SYSINT; var pcy: SYSINT); safecall;
    procedure PutProperty(const Property_: WideString;
      vtValue: OleVariant); safecall;
    function GetProperty(const Property_: WideString): OleVariant; safecall;
    function Get_Name: WideString; safecall;
    function Get_HWnd: Integer; safecall;
    function Get_FullName: WideString; safecall;
    function Get_Path: WideString; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(pbool: WordBool); safecall;
    function Get_StatusBar: WordBool; safecall;
    procedure Set_StatusBar(pbool: WordBool); safecall;
    function Get_StatusText: WideString; safecall;
    procedure Set_StatusText(const StatusText: WideString); safecall;
    function Get_ToolBar: SYSINT; safecall;
    procedure Set_ToolBar(Value: SYSINT); safecall;
    function Get_MenuBar: WordBool; safecall;
    procedure Set_MenuBar(Value: WordBool); safecall;
    function Get_FullScreen: WordBool; safecall;
    procedure Set_FullScreen(pbFullScreen: WordBool); safecall;
    property Name: WideString read Get_Name;
    property HWND: Integer read Get_HWnd;
    property FullName: WideString read Get_FullName;
    property Path: WideString read Get_Path;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property StatusBar: WordBool read Get_StatusBar write Set_StatusBar;
    property StatusText: WideString read Get_StatusText write Set_StatusText;
    property ToolBar: SYSINT read Get_ToolBar write Set_ToolBar;
    property MenuBar: WordBool read Get_MenuBar write Set_MenuBar;
    property FullScreen: WordBool read Get_FullScreen write Set_FullScreen;
  end;

  IWebBrowser2 = interface(IWebBrowserApp)
    ['{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}']
    procedure Navigate2(const URL: OleVariant; const Flags: OleVariant;
      const TargetFrameName: OleVariant; const PostData: OleVariant;
      const Headers: OleVariant); safecall;
    function QueryStatusWB(cmdID: OLECMDID): OLECMDF; safecall;
    procedure ExecWB(cmdID: OLECMDID; cmdexecopt: OLECMDEXECOPT;
      var pvaIn: OleVariant; var pvaOut: OleVariant); safecall;
    procedure ShowBrowserBar(var pvaClsid: OleVariant; var pvarShow: OleVariant;
      var pvarSize: OleVariant); safecall;
    function Get_ReadyState: tagREADYSTATE; safecall;
    function Get_Offline: WordBool; safecall;
    procedure Set_Offline(pbOffline: WordBool); safecall;
    function Get_Silent: WordBool; safecall;
    procedure Set_Silent(pbSilent: WordBool); safecall;
    function Get_RegisterAsBrowser: WordBool; safecall;
    procedure Set_RegisterAsBrowser(pbRegister: WordBool); safecall;
    function Get_RegisterAsDropTarget: WordBool; safecall;
    procedure Set_RegisterAsDropTarget(pbRegister: WordBool); safecall;
    function Get_TheaterMode: WordBool; safecall;
    procedure Set_TheaterMode(pbRegister: WordBool); safecall;
    function Get_AddressBar: WordBool; safecall;
    procedure Set_AddressBar(Value: WordBool); safecall;
    function Get_Resizable: WordBool; safecall;
    procedure Set_Resizable(Value: WordBool); safecall;
    property ReadyState: tagREADYSTATE read Get_ReadyState;
    property Offline: WordBool read Get_Offline write Set_Offline;
    property Silent: WordBool read Get_Silent write Set_Silent;
    property RegisterAsBrowser: WordBool read Get_RegisterAsBrowser
      write Set_RegisterAsBrowser;
    property RegisterAsDropTarget: WordBool read Get_RegisterAsDropTarget
      write Set_RegisterAsDropTarget;
    property TheaterMode: WordBool read Get_TheaterMode write Set_TheaterMode;
    property AddressBar: WordBool read Get_AddressBar write Set_AddressBar;
    property Resizable: WordBool read Get_Resizable write Set_Resizable;
  end;

  DWebBrowserEvents2 = dispinterface
    ['{34A715A0-6587-11D0-924A-0020AFC7AC4D}']
    procedure StatusTextChange(const Text: WideString); dispid 102;
    procedure ProgressChange(Progress: Integer; ProgressMax: Integer);
      dispid 108;
    procedure CommandStateChange(Command: Integer; Enable: WordBool);
      dispid 105;
    procedure DownloadBegin; dispid 106;
    procedure DownloadComplete; dispid 104;
    procedure TitleChange(const Text: WideString); dispid 113;
    procedure PropertyChange(const szProperty: WideString); dispid 112;
    {
      procedure BeforeNavigate2(const pDisp: IDispatch; const URL: OleVariant; const Flags: OleVariant;
      const TargetFrameName: OleVariant; const PostData: OleVariant;
      const Headers: OleVariant; var Cancel: WordBool); dispid 250;
    }
    procedure NewWindow2(var ppDisp: IDispatch; var Cancel: WordBool);
      dispid 251;
    {
      procedure NavigateComplete2(const pDisp: IDispatch; var URL: OleVariant); dispid 252;
      procedure DocumentComplete(const pDisp: IDispatch; var URL: OleVariant); dispid 259;
    }
    procedure OnQuit; dispid 253;
    procedure OnVisible(Visible: WordBool); dispid 254;
    procedure OnToolBar(ToolBar: WordBool); dispid 255;
    procedure OnMenuBar(MenuBar: WordBool); dispid 256;
    procedure OnStatusBar(StatusBar: WordBool); dispid 257;
    procedure OnFullScreen(FullScreen: WordBool); dispid 258;
    procedure OnTheaterMode(TheaterMode: WordBool); dispid 260;
    procedure WindowSetResizable(Resizable: WordBool); dispid 262;
    procedure WindowSetLeft(Left: Integer); dispid 264;
    procedure WindowSetTop(Top: Integer); dispid 265;
    procedure WindowSetWidth(width: Integer); dispid 266;
    procedure WindowSetHeight(Height: Integer); dispid 267;
    procedure WindowClosing(IsChildWindow: WordBool; var Cancel: WordBool);
      dispid 263;
    procedure ClientToHostWindow(var CX: Integer; var CY: Integer); dispid 268;
    procedure SetSecureLockIcon(SecureLockIcon: Integer); dispid 269;
    procedure FileDownload(ActiveDocument: WordBool; var Cancel: WordBool);
      dispid 270;
    {
      procedure NavigateError(const pDisp: IDispatch; var URL: OleVariant; var Frame: OleVariant;
      var StatusCode: OleVariant; var Cancel: WordBool); dispid 271;
    }
    procedure PrintTemplateInstantiation(const pDisp: IDispatch); dispid 225;
    procedure PrintTemplateTeardown(const pDisp: IDispatch); dispid 226;
    {
      procedure UpdatePageStatus(const pDisp: IDispatch; var nPage: OleVariant; var fDone: OleVariant); dispid 227;
    }
    procedure PrivacyImpactedStateChange(bImpacted: WordBool); dispid 272;
  end;
{$ENDREGION}
{$REGION 'MATH'}

type
  TArithmeticException = (exInvalidOp, exDenormalized, exZeroDivide, exOverflow,
    exUnderflow, exPrecision);
  TFPUException = type TArithmeticException;
  TSSEException = type TArithmeticException;
  TFPUExceptionMask = set of TFPUException;
  TSSEExceptionMask = set of TSSEException;

const
  exAllArithmeticExceptions = [TArithmeticException.exInvalidOp,
    TArithmeticException.exDenormalized, TArithmeticException.exZeroDivide,
    TArithmeticException.exOverflow, TArithmeticException.exUnderflow,
    TArithmeticException.exPrecision];

  DefaultExceptionFlags = [TArithmeticException.exInvalidOp,
    TArithmeticException.exZeroDivide, TArithmeticException.exOverflow];

function SetFPUExceptionMask(const Mask: TFPUExceptionMask): TFPUExceptionMask;
function SetSSEExceptionMask(const Mask: TSSEExceptionMask): TSSEExceptionMask;
{$ENDREGION}

type
  TMicroWebBrowser = class(TObject, IUnknown, IDispatch, IOleClientSite,
    IOleInPlaceSite)
  private
    FEvents: IDispatch;
    FConnected: Boolean;
    FCookie: Integer;
    FConnectionPpoint: IConnectionPoint;
    FWebBrowser: IWebBrowser2;
    FHandle: HWND;
    FPrivateHandle: Boolean;
    FOleObject: IOleObject;
    FOleInPlaceObject: IOleInPlaceObject;
    FOleInPlaceActiveObject: IOleInPlaceActiveObject;
    FStatusText: WideString;
    function GetReadyState: tagREADYSTATE;
  private
    // IDispatch(Events)
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo)
      : HResult; stdcall;
    function GetIDsOfNames(const iid: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const iid: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer)
      : HResult; stdcall;
    procedure Disconnect;
  private
    // IUnknown
    function QueryInterface(const iid: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    // IOleClientSite
    function SaveObject: HResult; stdcall;
    function GetMoniker(dwAssign: Longint; dwWhichMoniker: Longint;
      out mk: IUnknown): HResult; stdcall;
    function GetContainer(out container: IUnknown): HResult; stdcall;
    function ShowObject: HResult; stdcall;
    function OnShowWindow(fShow: BOOL): HResult; stdcall;
    function RequestNewObjectLayout: HResult; stdcall;
    // IOleWindow
    function GetWindow(out wnd: HWND): HResult; stdcall;
    function ContextSensitiveHelp(fEnterMode: BOOL): HResult; stdcall;
    // IOleInPlaceSite
    function CanInPlaceActivate: HResult; stdcall;
    function OnInPlaceActivate: HResult; stdcall;
    function OnUIActivate: HResult; stdcall;
    function GetWindowContext(out frame: IOleInPlaceFrame; out doc: IUnknown;
      out rcPosRect: TRect; out rcClipRect: TRect;
      out frameInfo: TOleInPlaceFrameInfo): HResult; stdcall;
    function Scroll(scrollExtent: TPoint): HResult; stdcall;
    function OnUIDeactivate(fUndoable: BOOL): HResult; stdcall;
    function OnInPlaceDeactivate: HResult; stdcall;
    function DiscardUndoState: HResult; stdcall;
    function DeactivateAndUndo: HResult; stdcall;
    function OnPosRectChange(const rcPosRect: TRect): HResult; stdcall;
    function GetWBClientRect: TRect;
    //
  public
    constructor Create(); overload;
    constructor Create(AParen: HWND); overload;
    constructor Create(AParen: HWND;
      ALeft, ATop, AWidth, AHeight: Integer); overload;

    destructor Destroy; override;

    procedure Show();
    procedure Hide();

    function WaitComplete(TimeOut: ULONG): HResult;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer);

    procedure Navigate(const URL: WideString);
    property WebBrowser: IWebBrowser2 read FWebBrowser;
    property ReadyState: tagREADYSTATE read GetReadyState;
    property ClientRect: TRect read GetWBClientRect;
    property Events: IDispatch read FEvents write FEvents;
  end;

  // 可以在线程中调用.
function Navigate(const URL: WideString; const TimeOut: ULONG = 15000): HResult;

implementation

function Navigate(const URL: WideString; const TimeOut: ULONG): HResult;
const
  WM_QUIT = $0012;
var
  mwb: TMicroWebBrowser;
begin
  Result := E_FAIL;
  OleInitialize(nil);
  mwb := TMicroWebBrowser.Create;
  if mwb.WebBrowser = nil then
    Exit;
  mwb.Navigate(URL);
  Result := mwb.WaitComplete(TimeOut);
  mwb.Free;
  OleUninitialize;
end;

function SetFPUExceptionMask(const Mask: TFPUExceptionMask): TFPUExceptionMask;
var
  CtlWord: Word;
begin
  CtlWord := Get8087CW;
  Set8087CW((CtlWord and $FFC0) or Byte(Mask));
  Byte(Result) := CtlWord and $3F;
end;

function SetSSEExceptionMask(const Mask: TSSEExceptionMask): TSSEExceptionMask;
var
  MXCSR: Word;
begin
  MXCSR := GetMXCSR;
  SetMXCSR((MXCSR and $FFFFE07F) or (Byte(Mask) shl 7));
  Byte(Result) := (MXCSR shr 7) and $3F;
end;

function Rect(ALeft, ATop, ARight, ABottom: Integer): TRect;
{$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
begin
  with Result do
  begin
    Left := ALeft;
    Top := ATop;
    Right := ARight;
    Bottom := ABottom;
  end;
end;

function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
{$IFDEF SUPPORTS_INLINE} inline; {$ENDIF}
begin
  with Result do
  begin
    Left := ALeft;
    Top := ATop;
    Right := ALeft + AWidth;
    Bottom := ATop + AHeight;
  end;
end;

{$IFDEF FAKE_OLEVARIANT}

function EmptyParam(): OleVariant;
const
  VAR_PARAMNOTFOUND = HResult($80020004);
begin
  VariantInit(Result);
  Result.VType := varError;
  Result.VError := VAR_PARAMNOTFOUND;
end;
{$ENDIF FAKE_OLEVARIANT}
{$REGION 'Classes.pas'}
{$IFDEF DYNAMIC_LINK}

var
  _OleUninitialize: procedure; stdcall;
  _OleInitialize: function(pwReserved: Pointer): HResult; stdcall;
  _CoCreateInstance: function(const clsid: TGUID; unkOuter: IUnknown;
    dwClsContext: Longint; const iid: TGUID; out pv): HResult; stdcall;
  _SafeArrayCreate: function(vt: TVarType; cDims: Integer; const rgsabound)
    : PSafeArray; stdcall;
  _SafeArrayDestroy: function(psa: PSafeArray): HResult; stdcall;
  _VariantInit: procedure(var varg: OleVariant); stdcall;
  _VariantClear: function(var varg: OleVariant): HResult; stdcall;
  _SysAllocString: function(psz: POleStr): POleStr; stdcall;
  _SysFreeString: procedure(bstr: POleStr); stdcall;

procedure GetProcedureAddress(var P: Pointer;
  const ModuleName, ProcName: string);
var
  ModuleHandle: HMODULE;
begin
  if not Assigned(P) then
  begin
    ModuleHandle := GetModuleHandle(PChar(ModuleName));
    if ModuleHandle = 0 then
    begin
      ModuleHandle := LoadLibrary(PChar(ModuleName));
      if ModuleHandle = 0 then
        Exit;
    end;
    P := Pointer(GetProcAddress(ModuleHandle, PAnsiChar(AnsiString(ProcName))));
    if not Assigned(P) then
      Exit;
  end;
end;

procedure OleUninitialize; stdcall;
begin
  GetProcedureAddress(@_OleUninitialize, ole32, 'OleUninitialize');
  _OleUninitialize();
end;

function OleInitialize(pwReserved: Pointer): HResult; stdcall;
begin
  GetProcedureAddress(@_OleInitialize, ole32, 'OleInitialize');
  Result := _OleInitialize(pwReserved);
end;

function CoCreateInstance(const clsid: TGUID; unkOuter: IUnknown;
  dwClsContext: Longint; const iid: TGUID; out pv): HResult; stdcall;
begin
  GetProcedureAddress(@_CoCreateInstance, ole32, 'CoCreateInstance');
  Result := _CoCreateInstance(clsid, unkOuter, dwClsContext, iid, pv);
end;

function SafeArrayCreate(vt: TVarType; cDims: Integer; const rgsabound)
  : PSafeArray; stdcall;
begin
  GetProcedureAddress(@_SafeArrayCreate, oleaut32, 'SafeArrayCreate');
  Result := _SafeArrayCreate(vt, cDims, rgsabound);
end;

function SafeArrayDestroy(psa: PSafeArray): HResult; stdcall;
begin
  GetProcedureAddress(@_SafeArrayDestroy, oleaut32, 'SafeArrayDestroy');
  Result := _SafeArrayDestroy(psa);
end;

procedure VariantInit(var varg: OleVariant); stdcall;
begin
  GetProcedureAddress(@_VariantInit, oleaut32, 'VariantInit');
  _VariantInit(varg);
end;

function VariantClear(var varg: OleVariant): HResult; stdcall;
begin
  GetProcedureAddress(@_VariantClear, oleaut32, 'VariantClear');
  Result := _VariantClear(varg);
end;

function SysAllocString(psz: POleStr): POleStr; stdcall;
begin
  GetProcedureAddress(@_SysAllocString, oleaut32, 'SysAllocString');
  Result := _SysAllocString(psz);
end;

procedure SysFreeString(bstr: POleStr); stdcall;
begin
  GetProcedureAddress(@_SysFreeString, oleaut32, 'SysFreeString');
  _SysFreeString(bstr);
end;

{$ELSE}
procedure OleUninitialize; stdcall; external ole32;
function OleInitialize; stdcall; external ole32;
function CoCreateInstance; stdcall; external ole32;
function SafeArrayCreate; stdcall; external oleaut32;
function SafeArrayDestroy; stdcall; external oleaut32;
procedure VariantInit; stdcall; external oleaut32;
function VariantClear; stdcall; external oleaut32;
function SysAllocString; stdcall; external oleaut32;
procedure SysFreeString; stdcall; external oleaut32;
{$ENDIF}
{ Object instance management }

type
  TWndMethod = Pointer;

var
  WebBrowserWndClass: TWndClass = (style: 0; lpfnWndProc: @DefWindowProc;
    cbClsExtra: 0; cbWndExtra: 0; hInstance: 0; hIcon: 0; hCursor: 0;
    hbrBackground: 0; lpszMenuName: nil; lpszClassName: 'WebBrowser_byWANGRUI');

function AllocateHWnd(const AMethod: TWndMethod): HWND;
var
  TempClass: TWndClass;
begin
  { 使用DefWindowProc默认窗口处理过程,AMethod是被忽略的.
    之所以留这个是为了代码兼容真正的Classes单元的AllocateHWnd函数.
  }
  WebBrowserWndClass.hInstance := hInstance;
  if not GetClassInfo(hInstance, WebBrowserWndClass.lpszClassName, TempClass)
  then
  begin
    Windows.RegisterClass(WebBrowserWndClass);
  end;
  Result := CreateWindowEx(WS_EX_TOOLWINDOW, WebBrowserWndClass.lpszClassName,
    '', WS_POPUP { + 0 } , 0, 0, 0, 0, 0, 0, hInstance, nil);
end;

procedure DeallocateHWnd(wnd: HWND);
begin
  DestroyWindow(wnd);
end;

{$ENDREGION 'Classes.pas'}

constructor TMicroWebBrowser.Create();
begin
  FPrivateHandle := true;
  Create(AllocateHWnd(nil));
end;

constructor TMicroWebBrowser.Create(AParen: HWND);
var
  r: TRect;
begin
  GetClientRect(AParen, r);
  Create(AParen, r.Left, r.Top, r.Right - r.Left, r.Bottom - r.Top);
end;

constructor TMicroWebBrowser.Create(AParen: HWND;
  ALeft, ATop, AWidth, AHeight: Integer);
var
  ConnectionPointContainer: IConnectionPointContainer;
begin
  FHandle := AParen;
  if (CoCreateInstance(CLSID_WebBrowser, nil, CLSCTX_INPROC, IID_IOleObject,
    FOleObject) <> S_OK) or (FOleObject.SetClientSite(Self) <> S_OK) or
    (FOleObject.DoVerb(OLEIVERB_INPLACEACTIVATE, nil, Self, 0, 0, PRect(nil)^)
    <> S_OK) or (FOleObject.QueryInterface(IID_IWebBrowser2, FWebBrowser) <>
    S_OK) then
  begin
    Exit;
  end;
  FWebBrowser.Set_Left(ALeft);
  FWebBrowser.Set_Top(ATop);
  FWebBrowser.Set_Width(AWidth);
  FWebBrowser.Set_Height(AHeight);
  // 脚本出错不弹出错对话框
  FWebBrowser.Set_Silent(true);
  // 捆绑事件
  // FEvents := TBrowserEvents.Create(WebBrowser);
  FConnected := (WebBrowser.QueryInterface(IConnectionPointContainer,
    ConnectionPointContainer) = S_OK) and
    (ConnectionPointContainer.FindConnectionPoint(DWebBrowserEvents2,
    FConnectionPpoint) = S_OK) and
    (FConnectionPpoint.Advise(Self, FCookie) = S_OK);
  ConnectionPointContainer := nil;
  Show;
  Navigate('about:blank');
end;

destructor TMicroWebBrowser.Destroy;
begin
  // 断开事件连接
  if FConnected then
    Disconnect;

  if FOleObject <> nil then
    FOleObject.SetClientSite(nil);
  FWebBrowser := nil;
  if FPrivateHandle then
    DeallocateHWnd(FHandle);
  FPrivateHandle := False;
  inherited Destroy;
end;

function TMicroWebBrowser.GetReadyState: tagREADYSTATE;
begin
  Result := FWebBrowser.Get_ReadyState;
end;

procedure TMicroWebBrowser.Navigate(const URL: WideString);
var
  v: OleVariant;
begin
  v := EmptyParam;
  FWebBrowser.Navigate(URL, EmptyParam, EmptyParam, v, EmptyParam);
end;

procedure TMicroWebBrowser.Hide;
begin
  FOleObject.DoVerb(OLEIVERB_HIDE, nil, Self, -1, FHandle, ClientRect);
end;

procedure TMicroWebBrowser.Show;
begin
  FOleObject.DoVerb(OLEIVERB_SHOW, nil, Self, -1, FHandle, ClientRect);
end;

procedure TMicroWebBrowser.Disconnect;
begin
  if FConnected then
  begin
    if FConnectionPpoint <> nil then
      FConnectionPpoint.Unadvise(FCookie);
    FWebBrowser := nil;
    FConnectionPpoint := nil;
    FConnected := False;
  end;
end;

function TMicroWebBrowser.GetTypeInfoCount(out Count: Integer): HResult;
begin
  if FEvents <> nil then
    Result := FEvents.GetTypeInfoCount(Count)
  else
  begin
    Count := 0;
    Result := S_OK;
  end;
end;

function TMicroWebBrowser.GetTypeInfo(Index, LocaleID: Integer;
  out TypeInfo): HResult;
begin
  if FEvents <> nil then
    FEvents.GetTypeInfo(Index, LocaleID, TypeInfo)
  else
  begin
    Pointer(TypeInfo) := nil;
    Result := E_NOTIMPL;
  end;
end;

function TMicroWebBrowser.GetIDsOfNames(const iid: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  if FEvents <> nil then
    Result := FEvents.GetIDsOfNames(iid, Names, NameCount, LocaleID, DispIDs)
  else
    Result := E_NOTIMPL;
end;

function TMicroWebBrowser.Invoke(DispID: Integer; const iid: TGUID;
  LocaleID: Integer; Flags: Word; var Params;
  VarResult, ExcepInfo, ArgErr: Pointer): HResult;
  procedure BuildPositionalDispIds(pDispIds: PDispIDList;
    const dps: TDispParams);
  var
    i: Integer;
  begin
    Assert(pDispIds <> nil);
    for i := 0 to dps.cArgs - 1 do
      pDispIds^[i] := dps.cArgs - 1 - i;
    if (dps.cNamedArgs <= 0) then
      Exit;
    for i := 0 to dps.cNamedArgs - 1 do
      pDispIds^[dps.rgdispidNamedArgs^[i]] := i;
  end;

const
  DISPID_NEWWINDOW2 = 251;
  DISPID_STATUSTEXTCHANGE = 102;
var
  dps: TDispParams absolute Params;
  bHASParams: Boolean;
  pDispIds: PDispIDList;
  iDispIdsSize: Integer;
begin
  if FEvents <> nil then
  begin
    Result := FEvents.Invoke(DispID, iid, LocaleID, Flags, Params, VarResult, ExcepInfo, ArgErr);
    Exit;
  end;
  Result := S_OK;
  pDispIds := nil;
  iDispIdsSize := 0;
  bHASParams := (dps.cArgs > 0);
  if (bHASParams) then
  begin
    iDispIdsSize := dps.cArgs * SizeOf(TDispID);
    GetMem(pDispIds, iDispIdsSize);
  end;
  if (bHASParams) then
    BuildPositionalDispIds(pDispIds, dps);
  // 处理,防止新窗口创建浏览器进程.
  case DispID of
    DISPID_NEWWINDOW2:
      begin
        // Cancel := True;
        dps.rgvarg^[pDispIds^[1]].pbool^ := true;
        Navigate(FStatusText);
      end;
    DISPID_STATUSTEXTCHANGE:
      begin
        FStatusText := dps.rgvarg^[pDispIds^[0]].bstrVal;
      end;
  else
    Result := DISP_E_MEMBERNOTFOUND;
  end;

  if (bHASParams) then
    FreeMem(pDispIds, iDispIdsSize);

  // Result := DISP_E_MEMBERNOTFOUND;
  // URL := WebBrowser.Get_LocationURL;
end;

// IUnknow
function TMicroWebBrowser.QueryInterface(const iid: TGUID; out Obj): HResult;
begin
  if GetInterface(iid, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TMicroWebBrowser._AddRef: Integer;
begin
  Result := -1;
end;

function TMicroWebBrowser._Release: Integer;
begin
  Result := -1;
end;
// IOleWindow

function TMicroWebBrowser.GetWindow(out wnd: HWND): HResult;
begin
  wnd := FHandle;
  Result := S_OK;
end;

function TMicroWebBrowser.ContextSensitiveHelp(fEnterMode: BOOL): HResult;
begin
  Result := S_OK;
end;

// IOleInPlaceSite

function TMicroWebBrowser.CanInPlaceActivate: HResult;
begin
  Result := S_OK;
end;

function TMicroWebBrowser.OnInPlaceActivate: HResult;
begin
  FOleObject.QueryInterface(IOleInPlaceObject, FOleInPlaceObject);
  FOleObject.QueryInterface(IOleInPlaceActiveObject, FOleInPlaceActiveObject);
  Result := S_OK;
end;

function TMicroWebBrowser.OnUIActivate: HResult;
begin
  Result := S_OK;
end;

function TMicroWebBrowser.GetWBClientRect: TRect;
begin
  Result := Bounds(0, 0, 0, 0);
  if FWebBrowser <> nil then
    with FWebBrowser do
      Result := Bounds(Get_Left, Get_Top, Get_Width, Get_Height);
end;

function TMicroWebBrowser.GetWindowContext(out frame: IOleInPlaceFrame;
  out doc: IUnknown; out rcPosRect, rcClipRect: TRect;
  out frameInfo: TOleInPlaceFrameInfo): HResult;
begin
  /// frame := Self;
  frameInfo.fMDIApp := False;
  frameInfo.hwndFrame := FHandle;
  frameInfo.haccel := 0;
  frameInfo.cAccelEntries := 0;
  rcClipRect := Rect(0, 0, 32767, 32767);
  Result := S_OK;
end;

function TMicroWebBrowser.Scroll(scrollExtent: TPoint): HResult;
begin
  Result := E_NOTIMPL;
end;

procedure TMicroWebBrowser.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if WebBrowser <> nil then
    with WebBrowser do
    begin
      Set_Left(ALeft);
      Set_Top(ATop);
      Set_Width(AWidth);
      Set_Height(AHeight);
    end;
end;

function TMicroWebBrowser.OnUIDeactivate(fUndoable: BOOL): HResult;
begin
  Result := S_OK;
end;

function TMicroWebBrowser.OnInPlaceDeactivate: HResult;
begin
  FOleInPlaceActiveObject := nil;
  FOleInPlaceObject := nil;
  Result := S_OK;
end;

function TMicroWebBrowser.DiscardUndoState: HResult;
begin
  Result := E_NOTIMPL;
end;

function TMicroWebBrowser.DeactivateAndUndo: HResult;
begin
  FOleInPlaceObject.UIDeactivate;
  Result := S_OK;
end;

function TMicroWebBrowser.OnPosRectChange(const rcPosRect: TRect): HResult;
begin
  FOleInPlaceObject.SetObjectRects(rcPosRect, Rect(0, 0, 32767, 32767));
  Result := S_OK;
end;

// IOleClientSite
function TMicroWebBrowser.SaveObject: HResult;
begin
  Result := S_OK;
end;

function TMicroWebBrowser.GetMoniker(dwAssign, dwWhichMoniker: Integer;
  out mk: IUnknown): HResult;
begin
  // mk := nil;
  Result := E_NOTIMPL;
end;

function TMicroWebBrowser.GetContainer(out container: IUnknown): HResult;
begin
  // container := nil;
  Result := E_NOINTERFACE;
end;

function TMicroWebBrowser.ShowObject: HResult;
begin
  Result := S_OK;
end;

function TMicroWebBrowser.OnShowWindow(fShow: BOOL): HResult;
begin
  Result := S_OK;
end;

function TMicroWebBrowser.RequestNewObjectLayout: HResult;
begin
  Result := E_NOTIMPL;
end;

//

function TMicroWebBrowser.WaitComplete(TimeOut: ULONG): HResult;
const
  WM_QUIT = $0012;
var
  startTime: ULONG;
  Unicode, MsgExists: Boolean;
  msg: TMsg;
begin
  Result := E_FAIL;
  startTime := GetTickCount;
  while true do
  begin
    if ReadyState = READYSTATE_COMPLETE then
    begin
      Result := S_OK;
      Break;
    end;
    if (TimeOut <> INFINITE) and ((GetTickCount - startTime) > TimeOut) then
    begin
      Result := ERROR_TIMEOUT;
      Break;
    end;
    // 处理消息循环.如果多线程的话也是可以的.
    while PeekMessage(msg, 0, 0, 0, PM_NOREMOVE) do
    begin
      Unicode := (msg.HWND = 0) or IsWindowUnicode(msg.HWND);
      if Unicode then
        MsgExists := PeekMessageW(msg, 0, 0, 0, PM_REMOVE)
      else
        MsgExists := PeekMessageA(msg, 0, 0, 0, PM_REMOVE);

      if MsgExists then
      begin
        if msg.Message = WM_QUIT then
          Break
        else
        begin
          TranslateMessage(msg);
          if Unicode then
            DispatchMessageW(msg)
          else
            DispatchMessageA(msg);
        end;
      end;
    end;
    Sleep(1);
  end;
end;

initialization

OleInitialize(nil);

finalization

OleUninitialize;

end.
