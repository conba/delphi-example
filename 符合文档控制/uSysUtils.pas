{ ****************************************************** }
{ 产品名称：PMSS5.0 }
{ 单元描述：通用函数库 }
{ 单元作者：Wenxh }
{ 创建时间：2010.09.21 }
{ 备    注： }
{ 修改记录： }
// 2013.06.18 hwf  SelectDirectoryEx增加HandleOwner
// 2013.8.8 wxh 科学计数法代码调整
// 2013-8-21 Wenxh Variant类型转换函数调整
// 2013.10.25 hwf isZero有效位数判断增到7位
// 2014-11-20 Wenxh 增加填充0值函数
// 2015-4-3 Wenxh 修正：四舍五入精度问题
{ ****************************************************** }
// 2015-6-12 Wenxh 修正：人材机操作会导致人材丢失的问题 BugId: 10548
// 2015-6-16 Wenxh 修正：四舍五入精度问题引起的报错 BugId: 10568
// 2015-6-26 by hwf 修正：进行增减换算时余数进位的问题 bugid:10352
// 2015-8-31 Wenxh 修正：Variant类型转换时可能存在的错误(外部Bug)
// 2015-09-08 lap 增加：V5.2.7 通过正则表达式分解格式化日期方法
{ ****************************************************** }

unit uSysUtils;

interface

uses
  Windows, SysUtils, Classes, Variants, Math, XMLDoc, Controls, XMLIntf,
  IniFiles, ShlObj, Messages, Generics.Collections, Generics.Defaults;

type
  {$REGION '用于仅提供类方法的类的基类(隐藏掉TObject中其他的类方法 使调用更清晰)'}
  /// <summary>
  /// 用于仅提供类方法的类的基类(隐藏掉TObject中其他的类方法 使调用更清晰)
  /// </summary>
  TClassFunctionBase = class(TObject)
  protected
    constructor Create;
    class function InitInstance(Instance: Pointer): TObject;
    class function ClassName: string;
    class function ClassNameIs(const Name: string): Boolean;
    class function ClassParent: TClass;
    class function ClassInfo: Pointer; inline;
    class function InstanceSize: Longint; inline;
    class function InheritsFrom(AClass: TClass): Boolean;
    class function MethodAddress(const Name: ShortString): Pointer; overload;
    class function MethodAddress(const Name: string): Pointer; overload;
    class function MethodName(Address: Pointer): string;
    class function GetInterfaceEntry(const IID: TGUID): PInterfaceEntry;
    class function GetInterfaceTable: PInterfaceTable;
    class function UnitName: string;
    class function NewInstance: TObject; override;
  end;
  {$ENDREGION}
  /// <summary>
  /// 将str按照分隔符分成多列的记录(结合ColCount和GetCol的功能 使代码可读性更高)
  /// </summary>
  TColsRecord = record
  private
    sRow: string;
    cMask: Char;
    nCount: Integer;
    function GetCount: Integer;
    function GetCols(Index: Integer): string;
    function GetCount_Max: Integer;
    /// <summary>
    /// 获取分隔符左边字符串
    /// </summary>
    /// <param name="Index">第几个分隔符</param>
    /// <returns></returns>
    function GetStrForMask(Index: Integer):string;
  public

    /// <summary>
    /// 计算sRow中以cMask为分割的字符串的个数(ColCount)
    /// </summary>
    property Count: Integer read GetCount;
    /// <summary>
    /// 当sRow最后一个字符是cMask时;认为最后多了一个空值的列;故可能会个数+1
    /// </summary>
    property Count_Max: Integer read GetCount_Max;
    /// <summary>
    /// 取sRow中 以cMask为分隔符的 第lcolno个字符
    /// </summary>
    property Cols[Index: Integer]: string read GetCols; default;
    /// <summary>
    /// 原始值
    /// </summary>
    property Value: string read sRow;
    /// <summary>
    /// 获取分隔符左边字符串 = GetLeftStrForMask
    /// </summary>
    property LeftStrCols[Index: Integer]: string read GetStrForMask;
    constructor Create(AsRow: string; AcMask: Char);
  end;
  // 参数是一个 str 返回值是 bool 的方法
  TStringFunction = function(s: string): Boolean;
  /// <summary>
  /// 线程执行方法
  /// </summary>
  TRunThreadFunc = class(TThread)
  private
    FsString: string;
    FStrFunc: TStringFunction;
  protected
    procedure Execute; override;
  public
    constructor Create(AStrFunc: TStringFunction; AsString: string);
  end;

  {$REGION 'TJdsxHelper 节点属性辅助类 (可用于 类似于枚举对应的bool值列表转换为int的存储)'}
  /// <summary>
  /// 节点属性辅助类 (可用于 类似于枚举对应的bool值列表转换为int的存储)
  /// </summary>
  TJdsxHelper = class(TClassFunctionBase)
  const
    /// <summary>
    /// 二进制第32位的节点属性(2的31次幂 节点属性唯一的负数)
    /// </summary>
    cst_Jdsx_Value_Power31 = $80000000;
  type
    /// <summary>
    /// 节点属性集合
    /// </summary>
    TJdsxPowerSet = set of 0 .. 31;
  private { 一些没有用到的方法 暂时没有开出去 }
    /// <summary>
    /// 是否是正确的节点属性
    /// </summary>
    class function IsCorrectJdsx(const AnJdsx: Cardinal): Boolean;
    /// <summary>
    /// 添加节点属性
    /// </summary>
    class function AddJdsx(const AnValue, AnJdsx: Integer): Integer;
    /// <summary>
    /// 移除节点属性
    /// </summary>
    class function RemoveJdsx(const AnValue, AnJdsx: Integer): Integer;
    /// <summary>
    /// 是否存在节点属性
    /// </summary>
    class function IsExistJdsx(const AnValue, AnJdsx: Integer): Boolean;


    /// <summary>
    /// 节点属性值转换为单个节点属性数组(如 7=[1,2,4] 或 8=[8])
    /// </summary>
    /// <param name="AnJdsx: Integer">节点属性值</param>
    /// <returns>TArray: 单个节点属性数组</returns>
    class function IntToJdsxArray(AnValue: Integer): TArray<Integer>;
    /// <summary>
    /// 单个节点属性数组转换为节点属性值(如 [1,2,4]=7 或 [8]=8)
    /// </summary>
    /// <param name="AJdsxArr: TArray<Integer>">单个节点属性数组</param>
    /// <returns>Integer: 节点属性值</returns>
    class function JdsxArrayToInt(AJdsxArr: TArray<Integer>): Integer;

    /// <summary>
    /// 节点属性值转换为单个节点属性[2的指数的]数组(如 7=[1,2,4]=[0,1,2] 或 8=[2*2*2]=[3])
    /// </summary>
    /// <param name="AnJdsx: Integer"></param>
    /// <returns>TArray: </returns>
    class function IntToJdsxPowerArray(AnValue: Integer): TArray<Integer>;
    /// <summary>
    /// 单个节点属性[2的指数的]数组转换为节点属性值(如 [0,1,2]=[1,2,2*2]=7 或 [3]=[2*2*2]=8)
    /// </summary>
    /// <param name="AJdsxArr: TArray<Integer>"></param>
    /// <returns>Integer: </returns>
    class function JdsxPowerArrayToInt(AJdsxArr: TArray<Integer>): Integer;
//    class procedure AddJdsxToArray(var AArr: TArray<Integer>; AnValue: Integer);
  public
    /// <summary>
    /// 节点属性值转换为单个节点属性[2的指数的]数组(如 7=[1,2,4]=[0,1,2] 或 8=[2*2*2]=[3])
    /// </summary>
    /// <param name="AnJdsx: Integer"></param>
    /// <returns>TArray: </returns>
    class function IntToJdsxPowerSet(AnValue: Integer): TJdsxPowerSet;
    /// <summary>
    /// 单个节点属性[2的指数的]数组转换为节点属性值(如 [0,1,2]=[1,2,2*2]=7 或 [3]=[2*2*2]=8)
    /// </summary>
    /// <param name="AJdsxArr: TArray<Integer>"></param>
    /// <returns>Integer: </returns>
    class function JdsxPowerSetToInt(AJdsxArr: TJdsxPowerSet): Integer;
  end;
  {$ENDREGION}

  {$REGION 'ListDictionary 列表词典 可以顺序访问的词典，顺序指添加的顺序'}
  /// <summary>
  /// 调用工程库窗体词典(ListDic=可以顺序遍历的词典，顺序指添加的顺序)
  /// </summary>
  TObjectListDictionary<TKey, TValue> = class(TObjectDictionary<TKey,TValue>)
  private
    FKeyList: TList<TKey>;
    _KeyArr_: TArray<TKey>; // 不加这一行，继承 TObjectListDictionary 的类，释放时，会有奇怪的报错 External exception C0000008
    function GetKey_ByIndex(const Index: Integer): TKey;
    function GetItem_ByIndex(const Index: Integer): TValue;
    procedure SetItem_ByIndex(const Index: Integer; const Value: TValue);
  protected
    procedure KeyNotify(const Key: TKey; Action: TCollectionNotification);override;
    procedure CreateBefore; virtual;
  public
    { TDictionary constructor }
    constructor Create(ACapacity: Integer = 0); overload;
    constructor Create(const AComparer: IEqualityComparer<TKey>); overload;
    constructor Create(ACapacity: Integer; const AComparer:
      IEqualityComparer<TKey>); overload;
    constructor Create(Collection: TEnumerable<TPair<TKey,TValue>>); overload;
    constructor Create(Collection: TEnumerable<TPair<TKey,TValue>>; const
      AComparer: IEqualityComparer<TKey>); overload;
    { TObjectDictionary constructor }
    constructor Create(Ownerships: TDictionaryOwnerships; ACapacity: Integer = 0);
      overload;
    constructor Create(Ownerships: TDictionaryOwnerships;
      const AComparer: IEqualityComparer<TKey>); overload;
    constructor Create(Ownerships: TDictionaryOwnerships; ACapacity: Integer;
      const AComparer: IEqualityComparer<TKey>); overload;
    destructor Destroy; override;
    /// <summary>
    /// 排序 FKeyList
    /// </summary>
    procedure SortList(const AComparer: IComparer<TKey>);

    procedure Remove_ByIndex(const Index: Integer);
    property Keys_ByIndex[const Index: Integer]: TKey read GetKey_ByIndex;
    property Items_ByIndex[const Index: Integer]: TValue read GetItem_ByIndex write SetItem_ByIndex;
  end;
  {$ENDREGION}

// =================数据转换====================
function VarToFloatEx(Value: Variant): Double; overload;
function VarToFloatEx(Value: Variant; DefValue: Double): Double; overload;
function VarToBooleanEx(Value: Variant; DefValue: Boolean = False): Boolean;
function VarToStrEx(Value: Variant; DefValue: string = ''): string;
function VarToIntEx(Value: Variant; DefValue: Integer = 0): Integer;
// 浮点型转字符串型(去科学计算法产生的问题)
function FormatToStrEx(dXs: Double; DecNum: Integer = 6): string;

function SimpleRoundToEx(const AValue: Double;
  const ADigit: TRoundToRange = -2): Double;
function StrSimpleRoundToEx(const AValue: string; const ADigit: TRoundToRange =
  -2; AdDefValue: Double = 0): Double;
function SimpleRoundToStr(const AValue: Double; const ADigit: TRoundToRange =
  -2): string; overload;
function SimpleRoundToStr(const AValue: string; const ADigit: TRoundToRange =
  -2; AdDefValue: Double = 0): string; overload;
// 全角字符转半角
function SBCToDBC(s: string): string;
// 特殊字符转换
function ReplaceSpecialStr(AStr: string): string;
// 金额转换函数
function ConvertMoneyToCN(E: Extended; bHasDecimal: Boolean = False): string;
/// <summary>
/// 数值型转换为中文
/// </summary>
/// <param name="dblArabic">数值</param>
/// <returns>中文串</returns>
function Num2CNum(dblArabic: Double): string;

// =================字符串处理====================
// 大小写处理
function UpperCaseEx(AValue: WideString): string;
function LowerCaseEx(AValue: WideString): string;
//
function GetBaseDW(const aDW: WideString): string;
function GetValueOfStep(const aDW: WideString): Integer;
function LeftSepStr(var AStr, ASubStr: string; const aSep: string): Boolean;
function GetPartChar(strSource, SplitChar: string): string;
function GetNumFromStr(const str: string): string;
function StrSubCount(const Source, Sub: string): Integer;
function PlaintoPath(const AStr: string): string;
function PathToPlain(const aPath: string): string;
// 把字符串通过分隔符分隔到列表里
procedure StringToStringList(Source: string; aList: TStrings;
  ASeparator: string);
function GetSplitedLeftStr(const strSource, SplitChar: string): string;
function GetSplitedToList(strSource, SplitChar: string): TStringList;

// =================数据检查====================
function isZero(const aVar: Double): Boolean;
function IIFs(aBool: Boolean; const aStr1, aStr2: string): string; overload;
function IIFs(aBool: Boolean; const aStr1, aStr2: Integer): Integer; overload;
// 判断字符串全是数字
function CheckStrIsAllNumber(AValue: WideString): Boolean;
// 判断字符串全是数字(如果是空字符串则返回False)
function CheckStringIsAllNumber(AValue: WideString): Boolean;
// 字符串全是数字或字母
function CheckStrIsAllNumberAndLetter(AValue: WideString): Boolean;

// =================文件、目录处理====================
// 判断文件是否正在被使用
function IsFileInUse(fName: string): Boolean;
// 判断文件是否正在被使用(判断是否允许读)
function IsFileInUseByRead(fName: string): Boolean;
// 取上一级目录
function GetParentDirectory(const aDir: WideString): WideString;
// 复制文件(c:\dd复制到c:\ee下)
function CopyDir(FromDir: string; ToDir: string): Boolean;

// 移动目录
procedure MoveDir(const FromDir, ToDir: string);
// 删除目录
function BuildFileList(const Path: string; const Attr: Integer;
  const List: TStrings): Boolean;
/// <summary>
/// 删除文件目录及文件
/// </summary>
/// <param name="Path">删除文件夹</param>
/// <param name="AbortOnFailure">是否删除失败时终止</param>
/// <param name="bRemoveSelf">是否删除自己</param>
/// <returns></returns>
function DelTreeEx(const Path: string; bAbortOnFailure: Boolean;
  bRemoveSelf: Boolean = True): Boolean;

// 删除目录
function DeleteDir(aSourceDir: string): Boolean;
// 删除目录下所有文件(当前目录不删除)
function DeleteDirChild(aSourceDir: string): Boolean;
// 清空目录
function ClearDirectory(const ADirectory: string): Boolean;

procedure CopyFileToDir(SourceFile, DestDir: string);
function ExtractFileNameOnly(const aFileName: string): string;

function SelectDirectoryEx(AHandleOwner: THandle; Caption, RootDir: string;
  bCreateDir, bShowAddressBar: Boolean; var Path: string): Boolean;

// =================消息、提醒====================
// 封装信息提示(确认、取消按钮)
function Question(ahintStr: string): Boolean; overload;
// 封装信息提示(是、否按钮)
function Question_YseNo(ahintStr: string): Boolean;
function Question(aHandle: HWND; ahintStr: string): Boolean; overload;
function Question(aCaption, ahintStr: string): Boolean; overload;
procedure Warn(ahintStr: string); overload;
procedure Warn(aHandle: HWND; ahintStr: string; aCapStr: string = '注意');
  overload;
procedure Information(ahintStr: string); overload;
procedure Information(aHandle: HWND; ahintStr: string); overload;

// =================其他处理函数====================
// 压缩数据流
procedure CompressStream(var MyStream: TMemoryStream);
procedure UnCompressStream(var MyStream: TMemoryStream);
// 获取Guid
function GetGUIDstr: string; overload;
// 获取Guid(去掉两端的{})
function GetGUIDstr(sGuid: string): string; overload;
// 版本信息
function GetApplicationVersion(aVersionType: Byte = 0): string;
function GetShortVer(sVer: string; iLen: Integer = 1): string;
function GetSingleVer(iNumber: Integer): Integer;

function GetXMLNode(XMLDoc: TXMLDocument; RootDir: array of string): IXMLNode;

// 生成GUID
function NewGuid: string;
// 取文件字符串
function GetFileText(FileName: string): string;
/// <summary>
/// 获取文件大小
/// </summary>
function GetFileSize(AFileName: string): Integer;
// 记录LOG
procedure AppendFiledata(FileName, Data: string; bAddData: Boolean = False);
// 删除hash中指定记录
procedure ManageHashDelete(Hash: THashedStringList; Key: string);
function ColCount(sRow: string; cMask: Char): Integer;
function GetCol(sRow: string; lColNo: Integer; cMask: Char): string;
//取第 AMaskCount个分隔符左边字符串
function GetLeftStrForMask(sRow: string;AMaskCount: Integer; cMask: Char): string;
function StrtoDouble(s: string; Default: Double = 0): Double;
// 查找文件夹下所有文件名
procedure FindAllFileInPath(FilePath: string; StringList: TStringList);
// guid to string
function GuidToSimpleStr(AGuid: string): string;
function StrToGuid(AStr: string): string;

function Lf_StrToBase64(s: string): string;

function Lf_Base64ToStr(s: string): string;

function Base64ToStr(const s: AnsiString): string;

function StrToBase64(const s: AnsiString): string;

// double转字符，处理科学计算法
function ConvertDouToStr_Kxjs(AValue: Double): string;

// Ini文件内容读取
function IniFileReadValue(aFileName, ASection, AIdent: string): string;
// 判断路径是否合法
function IsFilePathLawful(aPath: string): Boolean;

// 判断是否安装VBA
function IsInstallVBA: Boolean;
// 取
function GetStrAB(s, a, b: string; bWithAB: Boolean = True): string;

function SimpleEncStr(str: string): string; // 字符加密函數  這是用的一個異或加密
function SimpleDecStr(str: string): string; // 字符解密函數

// 判断磁盘是否本地硬盘(不为可移动磁盘)
function IsLocalDisk(Drive: string): Boolean;
// 判断磁盘是否正常
function DiskReady(Root: string): Boolean;
/// <summary>
/// 倒转字符串
/// </summary>
/// <param name="str">源字符串</param>
/// <returns>倒转后的字符串</returns>
function ConvertStr(const str: string): string;
/// <summary>
/// 填充0值
/// </summary>
/// <param name="iIndex">填充对象</param>
/// <param name="iLen">填充长度</param>
/// <returns></returns>
function FillZero(iIndex, iLen: Integer): string;

/// <summary>
/// XML特殊字符转换为转义字符
/// </summary>
/// <param name="aStr">字符串</param>
/// <returns>转换后的字符串</returns>
function XmlEscapePhrasesToESC(const AStr: string): string;
/// <summary>
/// XML转义字符转换为特殊字符
/// </summary>
/// <param name="aStr">字符串</param>
/// <returns>转换后的字符串</returns>
function XmlESCToEscapePhrases(const AStr: string): string;
/// <summary>
/// 字符串转换成日期
/// </summary>
/// <param name="AStr">字符串</param>
/// <returns>转换后的日期</returns>
function ConvertStrToDate(const AStr: string; var ADate :TDateTime): Boolean;

/// <summary>
/// 睡眠
/// </summary>
/// <param name="milliseconds">睡眠时间</param>
/// <param name="startTickCount">计算睡眠时间的开始时间</param>
procedure Sleep_From(milliseconds, startTickCount: Cardinal);

function GetFirstSepStr(AStr: string; ASep: string=','): string;

{$REGION '正则表达式 相关'}
/// <summary>
/// 正则检查
/// </summary>
/// <param name="Str">输入字符串</param>
/// <param name="ExprStr">检查字符串(正则表达式)</param>
/// <param name="AbChangeToSafeExpr: Boolean">变更为安全的表达式(将特殊字符转义)</param>
/// <returns>是否找到匹配的检查字符串</returns>
function CheckRegExpr(Str, ExprStr: string; AbChangeToSafeExpr: Boolean =
  False): Boolean; overload;

/// <summary>
/// 正则检查
/// </summary>
/// <param name="Str">输入字符串</param>
/// <param name="ExprStr">检查字符串(正则表达式)</param>
/// <param name="MatchStr">对应MatchIndex匹配的字符串</param>
/// <returns>是否找到匹配的检查字符串</returns>
function CheckRegExpr(Str, ExprStr: string; MatchIndex: Integer; out MatchStr:
  string): Boolean; overload;

/// <summary>
/// 正则检查
/// </summary>
/// <param name="Str">输入字符串</param>
/// <param name="ExprStr">检查字符串(正则表达式)</param>
/// <param name="MatchStr">对应MatchIndex匹配的字符串</param>
/// <returns>是否找到匹配的检查字符串</returns>
function CheckRegExpr(Str, ExprStr: string; MatchIndexArr: array of Integer;
  out MatchStrArr: array of string): Boolean; overload;
type
  /// <summary>
  /// 正则表达式 匹配信息
  /// </summary>
  TRegExprMatchInfo = record
    sValue: string; // 匹配值
    nPos: Integer; // 匹配值所在位置
    nLen: Integer; // 匹配值的长度
  private
    function GetIsValueEmpty: Boolean;
  public
    // 初始化
    procedure Init();
    // 是否匹配值是空字符串
    property bIsEmpty: Boolean read GetIsValueEmpty;
  end;
  /// <summary>
  /// 正则表达式 匹配信息 列表
  /// </summary>
  TRegExprMatchList = class(TList<TRegExprMatchInfo>)
  private
    // 原始输入
    FsInput: string;
    function GetItem(Index: Integer): TRegExprMatchInfo;
    procedure SetItem(Index: Integer; const Value: TRegExprMatchInfo);
  public
    constructor Create(AsInput: string);
    /// <summary>
    /// 复制数据
    /// </summary>
    procedure Assign(ASource: TRegExprMatchList);
    /// <summary>
    /// 增加了 允许输入不存在的 Index
    /// </summary>
    property Items[Index: Integer]: TRegExprMatchInfo read GetItem write SetItem; default;
    /// <summary>
    /// 将原始输入 的匹配值进行替换
    /// </summary>
    /// <param name="Index: Integer">匹配索引</param>
    /// <param name="AsReplaceStr: string">替换字符串</param>
    /// <returns>string: 替换结果</returns>
    function ReplaceMatchValue(Index: Integer; AsReplaceStr: string): string;
  end;

/// <summary>
/// 正则检查
/// </summary>
/// <param name="Str">输入字符串</param>
/// <param name="ExprStr">检查字符串(正则表达式)</param>
/// <param name="AMatchList">匹配列表</param>
/// <returns>是否找到匹配的检查字符串</returns>
function CheckRegExpr(Str, ExprStr: string; out AMatchList: TRegExprMatchList):
  Boolean; overload;

/// <summary>
/// 正则 替换
/// </summary>
/// <param name="ARegExpr: string">正则表达式</param>
/// <param name="AInputStr: string">输入字符串</param>
/// <param name="AReplaceStr: string">替换字符串</param>
/// <param name="AReplaceXThArray: array of Integer">要替换第几个匹配的 数字数组(-1 代表匹配全部)</param>
/// <param name="AUseSubstitution: Boolean">是否支持子表达式</param>
/// <returns>string: 替换结果</returns>
function ReplaceRegExprEx(const ARegExpr, AInputStr, AReplaceStr: string;
  AReplaceXThArray: array of Integer; AUseSubstitution: Boolean = False): string; overload;

/// <summary>
/// 正则 替换
/// </summary>
/// <param name="ARegExpr: string">正则表达式</param>
/// <param name="AInputStr: string">输入字符串</param>
/// <param name="AReplaceStr: string">替换字符串</param>
/// <param name="AnReplaceXTh: Integer">替换第 x 个匹配(-1 代表匹配全部)</param>
/// <param name="AUseSubstitution: Boolean">是否支持子表达式</param>
/// <returns>string: 替换结果</returns>
function ReplaceRegExprEx(const ARegExpr, AInputStr, AReplaceStr: string;
  AnReplaceXTh: Integer = -1; AUseSubstitution: Boolean = False): string; overload;
type
  /// <summary>
  /// 循环回调(正则检查)
  /// </summary>
  /// <param name="Match: TStrings">匹配结果</param>
  /// <returns>Boolean: 是否结束遍历</returns>
  TCheckRegExpr_LoopCallBack1 = reference to function(Match: TStrings):Boolean;
  TCheckRegExpr_LoopCallBack2 = function(Match: TStrings):Boolean of object;
  /// <summary>
  /// 循环回调(正则检查)
  /// </summary>
  /// <param name="Match: TRegExprMatchList">匹配结果</param>
  /// <param name="AnNextExecPos: Integer">进行下一次匹配的位置</param>
  /// <returns>Boolean: 是否结束遍历</returns>
  TCheckRegExpr_LoopCallBack3 = reference to function(Match: TRegExprMatchList; var AnNextExecPos: Integer):Boolean;
  TCheckRegExpr_LoopCallBack4 = function(Match: TRegExprMatchList; var AnNextExecPos: Integer):Boolean of object;
/// <summary>
/// 循环 正则检查
/// </summary>
/// <param name="Str">输入字符串</param>
/// <param name="ExprStr">检查字符串(正则表达式)</param>
/// <param name="ALoopCallBackFunc">循环回调函数</param>
/// <returns>匹配的结果数量</returns>
function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc:
  TCheckRegExpr_LoopCallBack1): Integer; overload;
/// <summary>
/// 循环 正则检查
/// </summary>
/// <param name="Str">输入字符串</param>
/// <param name="ExprStr">检查字符串(正则表达式)</param>
/// <param name="ALoopCallBackFunc">循环回调函数</param>
/// <returns>匹配的结果数量</returns>
function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc:
  TCheckRegExpr_LoopCallBack2): Integer; overload;
/// <summary>
/// 循环 正则检查
/// </summary>
/// <param name="Str">输入字符串</param>
/// <param name="ExprStr">检查字符串(正则表达式)</param>
/// <param name="ALoopCallBackFunc">循环回调函数</param>
/// <returns>匹配的结果数量</returns>
function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc:
  TCheckRegExpr_LoopCallBack3): Integer; overload;
/// <summary>
/// 循环 正则检查
/// </summary>
/// <param name="Str">输入字符串</param>
/// <param name="ExprStr">检查字符串(正则表达式)</param>
/// <param name="ALoopCallBackFunc">循环回调函数</param>
/// <returns>匹配的结果数量</returns>
function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc:
  TCheckRegExpr_LoopCallBack4): Integer; overload;
/// <summary>
/// 循环 正则检查 返回：查询到的次数
/// </summary>
function CheckRegExpr_Loop(Str, ExprStr: string): Integer; overload;
/// <summary>
/// 循环 正则检查 基础函数
///  注：多个回调中，认为最多传入１个回调函数
/// </summary>
function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc1:
  TCheckRegExpr_LoopCallBack1; ALoopCallBackFunc2: TCheckRegExpr_LoopCallBack2;
  ALoopCallBackFunc3: TCheckRegExpr_LoopCallBack3; ALoopCallBackFunc4:
  TCheckRegExpr_LoopCallBack4): Integer; overload;
/// <summary>
/// 获取不区分大小写的正则表达式
/// </summary>
/// <param name="AsExprStr: string">普通正则表达式</param>
/// <returns>string: 不区分大小写的正则表达式</returns>
function GetNotCaseSensitiveRegExpr(AsExprStr: string): string;
{$ENDREGION}

/// <summary>
/// 设置控件是否可用(遍历设置子控件Enabled属性)
/// </summary>
procedure SetControlsEnable(AControl: TWinControl; AbEnable: Boolean);
type
  /// <summary>
  /// 遍历控件 回调函数
  /// </summary>
  /// <param name="ACtrl">当前控件</param>
  /// <returns>是否结束遍历</returns>
  TLoopCtrls_CallBack1 = reference to function(ACtrl: TControl):Boolean;
  TLoopCtrls_CallBack2 = function(ACtrl: TControl):Boolean of object;
/// <summary>
/// 遍历处理所有的子控件
/// </summary>
/// <param name="AControl: TWinControl">要处理的控件</param>
/// <param name="ACallBack: TLoopCtrls_CallBack1">处理回调</param>
/// <param name="AbRecurse: Boolean">是否递归</param>
/// <returns>Boolean: 是否被回调终止</returns>
function LoopAllChildControls(AControl: TWinControl; ACallBack:
  TLoopCtrls_CallBack1; AbRecurse: Boolean): Boolean; overload;
function LoopAllChildControls(AControl: TWinControl; ACallBack:
  TLoopCtrls_CallBack2; AbRecurse: Boolean): Boolean; overload;
/// <summary>
/// 遍历处理所有的子控件 基础函数
///  注：多个回调中，认为最多传入１个回调函数
/// </summary>
function LoopAllChildControls(AControl: TWinControl; ACallBack1:
  TLoopCtrls_CallBack1; ACallBack2: TLoopCtrls_CallBack2; AbRecurse: Boolean):
  Boolean; overload;

/// <summary>
/// 在列表里(TList)查找想要的类
/// </summary>
/// <param name="AList">给定列表</param>
/// <param name="AFindClassType">要找的类(如TFrom2)</param>
/// <param name="AResult">找到的类(当返回True时可用)(用 TObject(var)的方式传入比较便利)</param>
/// <param name="AnFindStartIndex">起始查找索引</param>
/// <returns>是否找到</returns>
function FindClassInList(AList: TList; AFindClassType: TClass; out AResult:
  TObject; AnFindStartIndex: Cardinal = 0): Boolean;

/// <summary>
/// 字符串中是否有给定 单词(参见: 正则表达式 - \w+)
/// </summary>
/// <param name="AsWord">单词</param>
/// <param name="AsString">字符串</param>
/// <param name="AbCaseSensitive">是否区分大小写</param>
/// <returns>是否有</returns>
function IsWordInString(AsWord, AsString: string; AbCaseSensitive: Boolean =
  False): Boolean;

/// <summary>
/// 两个字符串中是否存在相同的 单词(参见: 正则表达式 - \w+)
/// </summary>
/// <param name="AsStr1">字符串1</param>
/// <param name="AsStr2">字符串2</param>
/// <param name="AbCaseSensitive">是否区分大小写</param>
/// <returns>是否存在</returns>
function IsStringHasSameWord(AsStr1, AsStr2: string; AbCaseSensitive: Boolean =
  False): Boolean;

/// <summary>
/// 16进制字符串 转换为 10进制字符串
/// </summary>
/// <param name="AsHex: string">16进制字符串(默认应输入无前缀的 判断时从低位到高位 遇到第一个非16进制的字符则返回)</param>
/// <returns>string: 10进制字符串</returns>
function HexStrToIntStr(AsHex: string): string;
/// <summary>
/// 16进制字符串 转换为 10进制
/// </summary>
/// <param name="AsHex: string">16进制字符串(默认应输入无前缀的 判断时从低位到高位 遇到第一个非16进制的字符则返回)</param>
/// <returns>string: 10进制</returns>
function HexStrToInt(AsHex: string): Integer;

/// <summary>
/// 判断字符串是否为 utf-8 编码
/// add by xkx
/// </summary>
function IsWordsUTF8(AnsiStr: AnsiString): Boolean;

/// <summary>
/// 是否存在 nil接口
/// </summary>
/// <param name="AIntfArr">接口数组</param>
/// <returns>是否存在</returns>
function HasNilInterface(AIntfArr: array of IUnknown): Boolean;

/// <summary>
/// 获取文件名(不带后缀名)
/// </summary>
/// <param name="sFileString">文件名</param>
/// <returns>文件名</returns>
function ExtractFileNameNoExt(sFileString: string): string;

function StringReplace(const S, OldPattern, NewPattern: string; Flags:
  TReplaceFlags): string;

function FastStringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string;

/// <summary>
/// 给定的字符串是否存在于给定的数组中
/// </summary>
/// <param name="AsValue: string">字符串</param>
/// <param name="AStrArray: TArray<string>">数组</param>
/// <param name="AbCaseSensitive: Boolean">是否区分大小写</param>
/// <returns>Boolean: 是否存在</returns>
function IsStrInArray(AsValue: string; AStrArray: array of string;
  AbCaseSensitive: Boolean = False): Boolean;

/// <summary>
/// 给定的位置，是否是一对匹配的括号
///  内部：可获取 按照执行顺序 括号对的列表
/// </summary>
function IsMatchPos_Parenthesis(AsValue: string; AnLeft, AnRight: Integer):
  Boolean;

/// <summary>
/// XSd检查
/// </summary>
/// <param name="sXsdPath">Xsd文件路径<</param>
/// <param name="sDzpbFirPath">需要检查的XML文件路径<</param>
function CheckXsd(sXsdPath, sCheckedFirPath: string): string;

/// <summary>
/// 遍历文件夹下的文件列表
/// </summary>
/// <param name="Path">路径</param>
/// <param name="FileExt">文件扩展名</param>
/// <returns>文件列表</returns>
function MakeFileList(Path,FileExt:string):TStringList;

/// <summary>
/// 检查是否存在一条材料被多次响应
/// </summary>
/// <param name="Path">路径</param>
/// <param name="FileExt">文件扩展名</param>
/// <returns>文件列表</returns>
function CheckMultiXyCl(): Boolean;

var
  /// <summary>
  /// 项目属性中保存的最早的SVN版本号(新建)
  /// 由于SimpleRoundToEx函数引起的版本控制用
  /// </summary>
  FirstSVNVersion: Integer;

implementation

uses
  ufrmProgress, Forms, ShellAPI, StrUtils, MessageDialog, ZLib, cxPC,
  ActiveX, ComObj, uThreadProgressDialog, RegularExpressions, RegExpr, msxml;

const
  THEZERO = 0.0000001;
  PowerValue: array [0 .. 63] of Int64 = ($0000000000000001, $0000000000000002,
    $0000000000000004, $0000000000000008, $0000000000000010, $0000000000000020,
    $0000000000000040, $0000000000000080, $0000000000000100, $0000000000000200,
    $0000000000000400, $0000000000000800, $0000000000001000, $0000000000002000,
    $0000000000004000, $0000000000008000, $0000000000010000, $0000000000020000,
    $0000000000040000, $0000000000080000, $0000000000100000, $0000000000200000,
    $0000000000400000, $0000000000800000, $0000000001000000, $0000000002000000,
    $0000000004000000, $0000000008000000, $0000000010000000, $0000000020000000,
    $0000000040000000, $0000000080000000, $0000000100000000, $0000000200000000,
    $0000000400000000, $0000000800000000, $0000001000000000, $0000002000000000,
    $0000004000000000, $0000008000000000, $0000010000000000, $0000020000000000,
    $0000040000000000, $0000080000000000, $0000100000000000, $0000200000000000,
    $0000400000000000, $0000800000000000, $0001000000000000, $0002000000000000,
    $0004000000000000, $0008000000000000, $0010000000000000, $0020000000000000,
    $0040000000000000, $0080000000000000, $0100000000000000, $0200000000000000,
    $0400000000000000, $0800000000000000, $1000000000000000, $2000000000000000,
    $4000000000000000, $8000000000000000);

  { ************************字符串匹配时需转换字符****************************** }
  // 全角
  cst_SBC_CASE_String: array [0 .. 30] of string = ('～', '！', '＠', '＃', '＄',
    '％', '＾', '＆', '＊', '（', '）', '＿', '＋', '－', '＝', '｛', '｝', '［', '］', '｜',
    '＼', '：', '；', '＂', '＇', '＜', '＞', '，', '．', '？', '／');
  // 半角
  cst_DBC_CASE_String: array [0 .. 30] of string = ('~', '!', '@', '#', '$',
    '%', '^', '&', '*', '(', ')', '_', '+', '-', '=', '{', '}', '[', ']', '|',
    '\', ':', ';', '"', '''', '<', '>', ',', '.', '?', '/');

  B64: array [0 .. 63] of AnsiChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' + { 26 }
    'abcdefghijklmnopqrstuvwxyz' + { 52 }
    '0123456789' + { 62 }
    '+/'; { 64 }
  LfB64: array [0 .. 63] of Char = '01mnGHIJopXbRq5MNOBCDEh69' + { 62 }
    'aTUcKL78Pdef234klwxyz' + { 26 }
    'AijrstFQVguvWSYZ' + { 52 }
    '+/'; { 64 }
  XorKey: array [0 .. 7] of Byte = ($B2, $09, $AA, $55, $93, $6D, $84, $47);
  // 字符串加密用

  PathSeparator = '/';

  cXmlEscapePhrases: array [0 .. 4] of Utf8String =
    ('<',
    '>',
    '''',
    '"',
    '&');
  cXmlReplacePhrases: array [0 .. 4] of Utf8String =
    ('&lt;',
    '&gt;',
    '&apos;',
    '&quot;',
    '&amp;');

function MakeFileList(Path,FileExt:string):TStringList;
var
  sch:TSearchrec;
  aTempFileExt: string;
begin
  Result:=TStringlist.Create;

  if rightStr(trim(Path), 1) <> '\' then
    Path := trim(Path) + '\'
  else
    Path := trim(Path);

  if not DirectoryExists(Path) then
  begin
    Result.Clear;
    exit;
  end;

  if FindFirst(Path + '*', faAnyfile, sch) = 0 then
  begin
    repeat
      Application.ProcessMessages;
      if ((sch.Name = '.') or (sch.Name = '..')) then Continue;
      if DirectoryExists(Path+sch.Name) then
      begin
        Result.AddStrings(MakeFileList(Path+sch.Name,FileExt));
      end
      else
      begin
        aTempFileExt := UpperCase(extractfileext(Path+sch.Name));
        if (aTempFileExt = UpperCase('.SSQ6')) or (aTempFileExt = UpperCase('.SSD6')) or (aTempFileExt = UpperCase('.清单计价'))
          or (aTempFileExt = UpperCase('.定额计价')) or (FileExt='.*') then
          Result.Add(Path+sch.Name);
      end;
    until FindNext(sch) <> 0;
    SysUtils.FindClose(sch);
  end;
end;

function CheckXsd(sXsdPath, sCheckedFirPath: string): string;
var
  SchemaDoc, XmlDoc: IXMLDOMDocument2;
  SchemaCache: IXMLDOMSchemaCollection;
  Error: IXMLDOMParseError;
begin
  Result := EmptyStr;
  // 加载电子评标导出Xml类型的文件
  XmlDoc := CoDOMDocument60.Create;
  XmlDoc.async := False;
  XmlDoc.load(sCheckedFirPath);
  SchemaDoc := CoDOMDocument60.Create;
  SchemaDoc.async := False;
  SchemaDoc.load(sXsdPath);
  SchemaCache := CoXMLSchemaCache60.Create;
  SchemaCache.add('', schemadoc);
  // 进行XSD验证
  XmlDoc.schemas := schemacache;
  // 验证结果
  Error := xmldoc.validate;
  if Error.errorCode <> S_OK then
    Result := Error.reason;
end;

/// <summary>
/// 添加正则表达式匹配信息 (自行检查参数的合法性)
/// </summary>
procedure _AddMachInfo(AMatchList: TRegExprMatchList; ARegExpr: TRegExpr; AnIndex: Integer);
var
  LInfo: TRegExprMatchInfo;
begin
  LInfo.Init();
  LInfo.sValue := ARegExpr.Match[AnIndex];
  LInfo.nPos := ARegExpr.MatchPos[AnIndex];
  LInfo.nLen := ARegExpr.MatchLen[AnIndex];
  AMatchList.Add(LInfo);
end;

function GetLeftStrForMask(sRow: string;AMaskCount: Integer; cMask: Char): string;
var
  Index: Integer;
  Position: Integer;
  sStrList: TStringList;
begin
  sStrList := TStringList.Create;
  sStrList.Delimiter := cMask;
  sStrList.DelimitedText := sRow;
  try
    for index := 0 to AMaskCount - 1 do
      if Result <> '' then
        Result := Result +cMask+ sStrList.Strings[index]
      else
        Result := sStrList.Strings[index];
  finally
    sStrList.Free;
  end;
end;

function GetFileSize(AFileName: string): Integer;
var
  SearchRec: TSearchRec;
begin
  if FindFirst(ExpandFileName(AFileName), faAnyFile, SearchRec) = 0 then
    Result := SearchRec.Size
  else
    Result := -1;
end;

/// <summary>
/// 判断字符串是否为 utf-8 编码
/// add by xkx
/// </summary>
function IsWordsUTF8(AnsiStr: AnsiString): Boolean;
var
  I, iCount, chr: Integer;
  c: AnsiChar;
  nBytes: Integer; // UFT8可用1-6个字节编码,ASCII用一个字节
  bAllAscii: Boolean; // 如果全部都是ASCII, 说明不是UTF-8
begin
  Result := False;
  nBytes := 0;
  bAllAscii := True;
  iCount := Length(AnsiStr);
  for I := 1 to iCount do
  begin
    c := AnsiStr[I];
    chr := Ord(c);
    // 判断是否ASCII编码,如果不是,说明有可能是UTF-8,ASCII用7位编码,但用一个字节存,最高位标记为0,o0xxxxxxx;中文ASCII编码可能最高位为1
    if (chr and $80) <> 0 then
      bAllAscii := False;
    // 如果不是ASCII码,应该是多字节符,计算字节数
    if nBytes = 0 then
    begin
      if chr > $80 then
      begin
        if (chr>=$fc) and (chr<=$fd) then // 1111 1100 and 1111 1101
          nBytes := 6
        else if chr>=$f8 then // 1111 1000
          nBytes := 5
        else if chr>=$f0 then // 1111 0000
          nBytes := 4
        else if chr>=$e0 then // 1110 0000
          nBytes := 3
        else if chr>=$c0 then // 1100 0000
          nBytes := 2
        else
          Exit(False);

        Dec(nBytes);
      end;
    end
    else // 多字节符的非首字节,应为 10xxxxxx
    begin
      if (chr and $c0) <> $80 then
        Exit(False);

      Dec(nBytes);
    end;
  end;
  // 违返规则
  if nBytes > 0 then
    Exit(False);
  // 如果全部都是ASCII, 说明不是UTF-8
  if bAllAscii then
    Exit(False);

  Result := True;
end;

procedure Sleep_From(milliseconds, startTickCount: Cardinal);
var
  stopTickCount, used_milliseconds: Cardinal;
begin
  stopTickCount := GetTickCount;
  used_milliseconds := stopTickCount - startTickCount;
  if used_milliseconds < milliseconds then
    Sleep(milliseconds - used_milliseconds);
end;

function XmlEscapePhrasesToESC(const AStr: string): string;
var
  i: Integer;
begin
  Result := AStr;
  for i := Low(cXmlEscapePhrases) to High(cXmlEscapePhrases) do
    Result := StringReplace(Result, cXmlEscapePhrases[i], cXmlReplacePhrases[i], [rfReplaceAll]);
end;

function XmlESCToEscapePhrases(const AStr: string): string;
var
  i: Integer;
begin
  Result := AStr;
  for i := Low(cXmlReplacePhrases) to High(cXmlReplacePhrases) do
    Result := StringReplace(Result, cXmlReplacePhrases[i], cXmlEscapePhrases[i], [rfReplaceAll]);
end;

function FillZero(iIndex, iLen: Integer): string;
var
  i: Integer;
begin
  Result := IntToStr(iIndex);
  for i := Length(Result) to iLen do
    Result := '0' + Result;
end;

function ConvertStr(const str: string): string;
// 将字串反向, 例如: 传入 '1234', 传回 '4321'
var
  i: Integer;
begin
  Result := '';
  for i := Length(str) downto 1 do
    Result := Result + str[i];
end;


// Ini文件内容读取

function IniFileReadValue(aFileName, ASection, AIdent: string): string;
var
  IniFile: TIniFile;
begin
  Result := '';
  if not FileExists(aFileName) then
    Exit;
  IniFile := TIniFile.Create(aFileName);
  try
    Result := IniFile.ReadString(ASection, AIdent, '');
  finally
    IniFile.Free;
  end;
end;

function SBCToDBC(s: string): string;
var
  i: Integer;
begin
  Result := s;
  for i := Low(cst_SBC_CASE_String) to High(cst_SBC_CASE_String) do
    Result := StringReplace(Result, cst_SBC_CASE_String[i],
      cst_DBC_CASE_String[i], [rfReplaceAll]);
end;

// 特殊字符转换

function ReplaceSpecialStr(AStr: string): string;
begin
  Result := AStr;
  Result := StringReplace(Result, '㎡', 'm2', [rfReplaceAll]);
  Result := StringReplace(Result, 'm3', 'm3', [rfReplaceAll]);
  Result := StringReplace(Result, '㎝', 'cm', [rfReplaceAll]);
  Result := StringReplace(Result, '㎜', 'mm', [rfReplaceAll]);
  Result := StringReplace(Result, '㎞', 'km', [rfReplaceAll]);
  Result := StringReplace(Result, '㎎', 'mg', [rfReplaceAll]);
  Result := StringReplace(Result, '㎏', 'kg', [rfReplaceAll]);
end;

function GetXMLNode(XMLDoc: TXMLDocument; RootDir: array of string): IXMLNode;
var
  k, iPos, m: Integer;
  FirstNode: IXMLNode;
begin
  FirstNode := XMLDoc.DocumentElement.ChildNodes[RootDir[0]];
  for k := 1 to high(RootDir) do
  begin
    iPos := Pos(':', RootDir[k]);
    if iPos > 0 then
    begin
      m := StrToIntDef(Copy(RootDir[k], iPos + 1, MaxInt), 0);
      FirstNode := FirstNode.ChildNodes.Get(m);
    end
    else
      FirstNode := FirstNode.ChildNodes[RootDir[k]];
  end;
  Result := FirstNode;
end;

// 判断字符串全是数字

function CheckStrIsAllNumber(AValue: WideString): Boolean;
var
  i: Integer;
  aTempStr: string;
begin
  Result := True;
  aTempStr := AValue;
  for i := 1 to Length(AValue) do
    if not(aTempStr[i] in ['0' .. '9']) then
    begin
      Result := False;
      Exit;
    end;
end;

// 判断字符串全是数字

function CheckStringIsAllNumber(AValue: WideString): Boolean;
var
  i: Integer;
  aTempStr: string;
begin
  Result := True;
  aTempStr := AValue;
  if Length(AValue) = 0 then
  begin
    Result := False;
    Exit;
  end;
  for i := 1 to Length(AValue) do
    if not(aTempStr[i] in ['0' .. '9']) then
    begin
      Result := False;
      Exit;
    end;
end;

function CheckStrIsAllNumberAndLetter(AValue: WideString): Boolean;
var
  i: Integer;
  aTempStr: string;
begin
  Result := True;
  aTempStr := AValue;
  for i := 1 to Length(AValue) do
    if not(aTempStr[i] in ['0' .. '9', 'a' .. 'z', 'A' .. 'Z']) then
    begin
      Result := False;
      Exit;
    end;
end;

procedure StringToStringList(Source: string; aList: TStrings;
  ASeparator: string);
var
  temp: string;
  i: Integer;
begin
  aList.Clear;
  temp := Source;
  i := Pos(ASeparator, Source);
  while i <> 0 do
  begin
    aList.Add(Copy(temp, 0, i - 1));
    delete(temp, 1, i);
    i := Pos(ASeparator, temp);
  end;
  aList.Add(temp);
end;

function PathToPlain(const aPath: string): string;
begin
  Result := StringReplace(aPath, '\', '#%@', [rfReplaceAll]);
end;

function PlaintoPath(const AStr: string): string;
begin
  Result := StringReplace(AStr, '#%@', '\', [rfReplaceAll]);
end;

function GetShortVer(sVer: string; iLen: Integer = 1): string;
var
  tmpStr: string;
  P1, i: Integer;
begin
  // Result:= '5.1'; Exit;
  // -->>取得版本号的第N个'.'符号前的版本信息 add by hwy 2007-6-11
  // 如3.0.1.100 如果传入1则返回3.0
  tmpStr := sVer;
  P1 := Pos('.', sVer);
  for i := 1 to iLen do
  begin
    tmpStr := Copy(sVer, Pos('.', tmpStr) + 1, Length(tmpStr));
    P1 := P1 + Pos('.', tmpStr);
  end;
  Result := Copy(sVer, 1, P1 - 1);
end;

function GetApplicationVersion(aVersionType: Byte = 0): string;
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  VerInfo: ^VS_FIXEDFILEINFO;
begin
  // Result:= '5.1'; Exit;
  Result := '0.0.0.0';
  FileName := Application.ExeName;
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
      begin
        VerInfo := nil;
        VerQueryValue(VerBuf, '\', Pointer(VerInfo), Wnd);
        { if VerInfo<>nil then Result:=Format('%d.%d.%d.%d',[VerInfo^.dwFileVersionMS shr 16,
          VerInfo^.dwFileVersionMS and $0000ffff,
          VerInfo^.dwFileVersionLS shr 16,
          VerInfo^.dwFileVersionLS and $0000ffff]); }
        { if VerInfo<>nil then Result:=Format('%d.%d.%d',[VerInfo^.dwFileVersionMS shr 16,
          VerInfo^.dwFileVersionMS and $0000ffff,
          VerInfo^.dwFileVersionLS shr 16]); }
        // >>应该只要前面两位就行了
        if aVersionType = 0 then
        begin
          if VerInfo <> nil then
            Result := Format('%d.%d', [VerInfo^.dwFileVersionMS shr 16,
              VerInfo^.dwFileVersionMS and $0000FFFF]);
        end
        else
        begin
          if VerInfo <> nil then
            if VerInfo <> nil then
              Result := Format('%d.%d.%d.%d', [VerInfo^.dwFileVersionMS shr 16,
                VerInfo^.dwFileVersionMS and $0000FFFF,
                VerInfo^.dwFileVersionLS shr 16, VerInfo^.dwFileVersionLS and
                $0000FFFF]);
        end;
      end;
    finally
      FreeMem(VerBuf, InfoSize);
    end;
  end;
end;

function GetSingleVer(iNumber: Integer): Integer;
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  VerInfo: ^VS_FIXEDFILEINFO;
begin
  Result := 0;
  if iNumber > 4 then
    Exit;
  FileName := Application.ExeName;
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
      begin
        VerInfo := nil;
        VerQueryValue(VerBuf, '\', Pointer(VerInfo), Wnd);
        case iNumber of
          1:
            Result := VerInfo^.dwFileVersionMS shr 16;
          2:
            Result := VerInfo^.dwFileVersionMS and $0000FFFF;
          3:
            Result := VerInfo^.dwFileVersionLS shr 16;
          4:
            Result := VerInfo^.dwFileVersionLS and $0000FFFF;
        end;
      end;
    finally
      FreeMem(VerBuf, InfoSize);
    end;
  end;
end;

function GetNumFromStr(const str: string): string;
var
  i: Integer;
  charset: set of Char;
begin
  Result := '';
  charset := ['0' .. '9', '.'];
  for i := 1 to Length(str) do
    if (str[i] in charset) then
      Result := Result + str[i]
    else
      break;
end;

function StrSubCount(const Source, Sub: string): Integer;
var
  Buf: string;
  i: Integer;
  Len: Integer;
begin
  Result := 0;
  Buf := Source;
  i := Pos(Sub, Buf);
  Len := Length(Sub);
  while i <> 0 do
  begin
    Inc(Result);
    delete(Buf, 1, i + Len - 1);
    i := Pos(Sub, Buf);
  end;
end;

function GetSplitedToList(strSource, SplitChar: string): TStringList;
var
  nPos: Integer;
  strField, strContent: string;
begin
  strContent := strSource;
  if RightStr(strContent, 1) <> SplitChar then
    strContent := strContent + SplitChar;
  Result := TStringList.Create;
  if (Length(strContent) = 0) or (Length(SplitChar) = 0) then
    Exit;
  nPos := Pos(SplitChar, strContent);
  while nPos > 0 do
  begin
    strField := LeftStr(strContent, nPos - 1);
    strField := AnsiReplaceStr(strField, SplitChar, '');
    Result.Add(strField);
    strContent := MidStr(strContent, nPos + 1, Length(strContent) - nPos);
    nPos := Pos(SplitChar, strContent);
  end;
  if (Length(strContent) > 0) and (nPos = 0) then
    Result.Add(strContent);
end;

function GetPartChar(strSource, SplitChar: string): string;
var
  nPos: Integer;
  strText: string;
begin
  strText := '';
  nPos := Pos(SplitChar, strSource);
  while nPos > 0 do
  begin
    strText := strText + SplitChar;
    strSource := MidStr(strSource, nPos + 1, Length(strSource) - nPos);
    nPos := Pos(SplitChar, strSource);
  end;
  Result := strText;
end;

function GetSplitedLeftStr(const strSource, SplitChar: string): string;
var
  nPos: Integer;
begin
  nPos := Pos(SplitChar, strSource);
  if nPos > 0 then
    Result := LeftStr(strSource, (nPos - 1) div 2);
end;

function GetGUIDstr: string;
var
  TmpGUID: TGUID;
begin
  Result := '';
  if CoCreateGuid(TmpGUID) = S_OK then
    Result := GUIDToString(TmpGUID);
end;

function GetGUIDstr(sGuid: string): string;
var
  sTempStr: string;
begin
  sTempStr := sGuid;
  if sTempStr = '' then
    sTempStr := GetGUIDstr;
  // 为了与第三方电子招投标接口对应,将Guid中{和}去掉
  sTempStr := StringReplace(sTempStr, '{', '', [rfReplaceAll]);
  Result := StringReplace(sTempStr, '}', '', [rfReplaceAll]);
end;

procedure CompressStream(var MyStream: TMemoryStream); // 压缩数据流
var
  SourceStream: TCompressionStream;
  DestStream: TMemoryStream;
  Count: Integer;
begin
  // 获得数据流的原始尺寸
  Count := MyStream.Size;
  DestStream := TMemoryStream.Create;
  SourceStream := TCompressionStream.Create(clMax, DestStream);
  try
    // SourceStream中保存着原始的数据流
    MyStream.SaveToStream(SourceStream);
    // 将原始数据流进行压缩， DestStream中保存着压缩后的数据流
    SourceStream.Free;
    MyStream.Clear;
    MyStream.WriteBuffer(Count, SizeOf(Count)); // 写入原始数据流的尺寸
    MyStream.CopyFrom(DestStream, 0); // 写入经过压缩的数据流
    MyStream.Position := 0; // 复位流指针
  finally
    // SourceStream.Free;
    DestStream.Free;

  end;
end;

procedure UnCompressStream(var MyStream: TMemoryStream);
var
  SourceStream: TDecompressionStream;
  Buffer: PChar;
  Count: Integer;
begin
  // 从被压缩的数据流中读出原始数据流的尺寸
  MyStream.Seek(0, soFromBeginning);
  MyStream.ReadBuffer(Count, SizeOf(Count));
  // 根据数据流尺寸大小为将要读入的原始数据流分配内存块
  GetMem(Buffer, Count);
  SourceStream := TDecompressionStream.Create(MyStream);
  try
    // 将被压缩的数据流解压缩，然后存入 Buffer内存块中
    SourceStream.ReadBuffer(Buffer^, Count);
    MyStream.Clear;
    MyStream.WriteBuffer(Buffer^, Count);
    MyStream.Position := 0;
  finally
    FreeMem(Buffer);
    SourceStream.Free;
  end;
end;

function LeftSepStr(var AStr, ASubStr: string; const aSep: string): Boolean;
var
  p: Integer;
begin
  p := Pos(aSep, AStr);
  if p > 0 then
  begin
    ASubStr := Copy(AStr, 1, p - 1);
    AStr := Copy(AStr, p + Length(aSep), MaxInt);
  end
  else
  begin
    ASubStr := AStr;
    AStr := '';
  end;

  Result := (AStr <> '') or (ASubStr <> '');
end;

function ExtractFileNameOnly(const aFileName: string): string;
begin
  Result := ChangeFileExt(ExtractFileName(aFileName), '');
end;

procedure Information(aHandle: HWND; ahintStr: string); overload;
var
  AStr: PChar;
begin
  AStr := StrAlloc(1024);
  AStr := StrPCopy(AStr, ahintStr);
  dsMessageBox(nil, AStr, '提示', MI_OK, MI_Infomation);
  StrDispose(AStr);
end;

procedure Information(ahintStr: string);
var
  AStr: PChar;
begin
  AStr := StrAlloc(1024);
  AStr := StrPCopy(AStr, ahintStr);
  dsMessageBox(nil, AStr, '提示', MI_OK, MI_Infomation);
  StrDispose(AStr);
end;

procedure Warn(aHandle: HWND; ahintStr: string; aCapStr: string = '注意');
var
  AStr, Cap: PChar;
begin
  if (aHandle = 0) and (Application <> nil) then
    aHandle := Application.Handle;
  AStr := StrAlloc(1024);
  AStr := StrPCopy(AStr, ahintStr);
  Cap := StrAlloc(1024);
  Cap := StrPCopy(Cap, aCapStr);
  dsMessageBox(nil, AStr, Cap, MI_OK, MI_Warning);
  StrDispose(AStr);
  StrDispose(Cap);
end;

procedure Warn(ahintStr: string);
var
  AStr: PChar;
begin
  AStr := StrAlloc(1024);
  AStr := StrPCopy(AStr, ahintStr);
  dsMessageBox(nil, AStr, '注意', MI_OK, MI_Warning);
  StrDispose(AStr);
end;

function Question(aCaption, ahintStr: string): Boolean;
begin
  Result := dsMessageBox(nil, PChar(ahintStr), PChar(aCaption), MI_OKCancel,
    MI_Question) = MR_OK;
end;

function Question(aHandle: HWND; ahintStr: string): Boolean; overload;
var
  AStr: PChar;
begin
  AStr := StrAlloc(1024);
  AStr := StrPCopy(AStr, ahintStr);

  Result := dsMessageBox(nil, AStr, '请选择', MI_OKCANCEL, MI_QUESTION) = MR_OK;
  {
    MbOK         --1;
    MbCancel     --2;
    mbAbort      --3
    mbRetry      --4
    mbingore     --5
    MbYes        --6
    MbNo         --7
    mbAll        --8
    MbNOtoall    --9
    MbYestoall   --10
    mbhelp       ...
  }

  StrDispose(AStr);
end;

function Question(ahintStr: string): Boolean;
var
  AStr: PChar;
begin
  AStr := StrAlloc(1024);
  AStr := StrPCopy(AStr, ahintStr);

  Result := dsMessageBox(nil, AStr, '请选择',
    MI_OKCANCEL, MI_QUESTION) = MR_OK;
  {
    MbOK         --1;
    MbCancel     --2;
    mbAbort      --3
    mbRetry      --4
    mbingore     --5
    MbYes        --6
    MbNo         --7
    mbAll        --8
    MbNOtoall    --9
    MbYestoall   --10
    mbhelp       ...
  }

  StrDispose(AStr);
end;

function Question_YseNo(ahintStr: string): Boolean;
var
  AStr: PChar;
begin
  AStr := StrAlloc(1024);
  AStr := StrPCopy(AStr, ahintStr);

  Result := dsMessageBox(nil, AStr, '请选择',
    MI_YesNo, MI_QUESTION) = MR_Yes;
  {
    MbOK         --1;
    MbCancel     --2;
    mbAbort      --3
    mbRetry      --4
    mbingore     --5
    MbYes        --6
    MbNo         --7
    mbAll        --8
    MbNOtoall    --9
    MbYestoall   --10
    mbhelp       ...
  }

  StrDispose(AStr);
end;

procedure CopyFileToDir(SourceFile, DestDir: string);
var
  sFileName: string;
  F: TShFileOpStruct;
begin
  if (FileExists(SourceFile)) and (DirectoryExists(DestDir)) then
  begin
    sFileName := ExtractFileName(SourceFile);
    sFileName := DestDir + '\' + sFileName;
    try
      with F do
      begin
        Wnd := 0;
        wFunc := FO_COPY; { 操作方式 }
        pFrom := PChar(SourceFile);
        pTo := PChar(sFileName);
        fFlags := FOF_SILENT or FOF_RENAMEONCOLLISION; { 操作选项 }
      end;
      if ShFileOperation(F) <> 0 then
        raise Exception.Create('文件拷贝失败！');
    except
      raise Exception.Create('文件拷贝时出现异常！');
    end;
  end;
end;

procedure MoveDir(const FromDir, ToDir: string);
var
  fs: TSearchRec;
  found: Boolean;
begin
  found := FindFirst(FromDir + '\*.*', faAnyFile, fs) = 0;
  while found do
  begin
    if (fs.Name = '.') or (fs.Name = '..') then
      found := FindNext(fs) = 0
    else
    begin
      if fs.Attr = faDirectory then
        MoveDir(FromDir + '\' + fs.Name, ToDir + '\' + fs.Name)
      else
        MoveFileEx(PChar(FromDir + '\' + fs.Name), PChar(ToDir + '\' + fs.Name),
          MOVEFILE_REPLACE_EXISTING);
      found := FindNext(fs) = 0;
    end;
  end;
  FindClose(fs);
end;

function PathRemoveSeparator(const Path: string): string;
var
  L: Integer;
begin
  L := Length(Path);
  if (L <> 0) and (AnsiLastChar(Path) = PathSeparator) then
    Result := Copy(Path, 1, L - 1)
  else
    Result := Path;
end;

function BuildFileList(const Path: string; const Attr: Integer;
  const List: TStrings): Boolean;
var
  SearchRec: TSearchRec;
  R: Integer;
begin
  Assert(List <> nil);
  R := FindFirst(Path, Attr, SearchRec);
  Result := R = 0;
  try
    if Result then
    begin
      while R = 0 do
      begin
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          List.Add(SearchRec.Name);
        R := FindNext(SearchRec);
      end;
      Result := R = ERROR_NO_MORE_FILES;
    end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

function DelTreeEx(const Path: string; bAbortOnFailure: Boolean;
  bRemoveSelf: Boolean = True): Boolean;
var
  Files: TStringList;
  LPath: string; // writable copy of Path
  FileName: string;
  i: Integer;
  PartialResult: Boolean;
  Attr: DWORD;
begin
{$IFOPT C-}
  if Path = '' then
  begin
    Result := False;
    Exit;
  end;
{$ENDIF ASSERTIONS OFF}
  Result := True;
  Files := TStringList.Create;
  try
    LPath := PathRemoveSeparator(Path);
    BuildFileList(LPath + '\*.*', faAnyFile, Files);
    for i := 0 to Files.Count - 1 do
    begin
      FileName := LPath + '\' + Files[i];
      PartialResult := True;
      // If the current file is itself a directory then recursively delete it
      Attr := GetFileAttributes(PChar(FileName));
      if (Attr <> DWORD(-1)) and ((Attr and FILE_ATTRIBUTE_DIRECTORY) <> 0) then
        PartialResult := DelTreeEx(FileName, bAbortOnFailure)
      else
      begin
        if PartialResult then
        begin
          // Set attributes to normal in case it's a readonly file
          PartialResult := SetFileAttributes(PChar(FileName),
            FILE_ATTRIBUTE_NORMAL);
          if PartialResult then
            PartialResult := DeleteFile(PChar(FileName));
        end;
      end;
      if not PartialResult then
      begin
        Result := False;
        if bAbortOnFailure then
          break;
      end;
    end;
  finally
    FreeAndNil(Files);
  end;
  if Result then
  begin
    // Finally remove the directory itself
    Result := SetFileAttributes(PChar(LPath), FILE_ATTRIBUTE_NORMAL);
    if Result then
    begin
{$IOCHECKS OFF}
      if bRemoveSelf then
        RmDir(LPath);
{$IFDEF IOCHECKS_ON}
{$IOCHECKS ON}
{$ENDIF IOCHECKS_ON}
      Result := IOResult = 0;
    end;
  end;
end;

function DeleteDirChild(aSourceDir: string): Boolean;
var
  hFindFile: Cardinal;
  tfile: string;
  sCurDir: string;
  bEmptyDir: Boolean;
  FindFileData: WIN32_FIND_DATA;
begin
  Result := True;
  bEmptyDir := True;
  sCurDir := GetCurrentDir;
  SetLength(sCurDir, Length(sCurDir));
  if not DirectoryExists(aSourceDir) then
    Exit; // BUG1032   Modified by yhx   Date:2009.4.7
  ChDir(aSourceDir);
  hFindFile := FindFirstFile('*.*', FindFileData);
  if hFindFile <> INVALID_HANDLE_VALUE then
  begin
    repeat
      tfile := FindFileData.cFileName;
      if (tfile = '.') or (tfile = '..') then
      begin
        bEmptyDir := bEmptyDir and True;
        Continue;
      end;
      bEmptyDir := False;
      if FindFileData.dwFileAttributes = FILE_ATTRIBUTE_DIRECTORY then
      begin
        DeleteDir(tfile);
      end
      else
      begin
        DeleteFile(PChar(tfile));
      end;
    until FindNextFile(hFindFile, FindFileData) = False;
  end
  else
  begin
    ChDir(sCurDir);
    Result := False;
    Exit;
  end;
  if bEmptyDir then
  begin
    ChDir('..');
  end;
  ChDir(sCurDir);
  Result := True;
end;

function DeleteDir(aSourceDir: string): Boolean;
var
  FO: TShFileOpStruct;
begin
  Result := False;
  if aSourceDir = '' then
    Exit;
  // 如果最后一个符号为'\'，则去掉
  if RightStr(aSourceDir, 1) = '\' then
    aSourceDir := Copy(aSourceDir, 1, Length(aSourceDir) - 1);
  aSourceDir := aSourceDir + #0#0;
  with FO do
  begin
    Wnd := 0;
    wFunc := FO_DELETE;
    pFrom := PChar(aSourceDir);
    pTo := nil;
    fFlags := FOF_NOCONFIRMATION or FOF_SILENT or FOF_SILENT;
    hNameMappings := nil;
    lpszProgressTitle := nil;
    fAnyOperationsAborted := False;
  end;
  if ShFileOperation(FO) = 0 then
    Result := True;
end;

function CopyDir(FromDir: string; ToDir: string): Boolean;
var
  FO: TShFileOpStruct;
begin
  Result := False;
  // ToDir := ToDir + #0#0;
  ToDir := ToDir + #0;
  FromDir := FromDir + #0;
  with FO do
  begin
    Wnd := 0;
    wFunc := FO_COPY;
    pFrom := PChar(FromDir);
    pTo := PChar(ToDir);
    fFlags := FOF_NOCONFIRMATION or FOF_SILENT;
    hNameMappings := nil;
    lpszProgressTitle := nil;
    fAnyOperationsAborted := False;
  end;
  if ShFileOperation(FO) = 0 then
    Result := True;
end;

function GetParentDirectory(const aDir: WideString): WideString;
var
  p: Integer;
  c: WideChar;
begin
  p := Length(aDir);
  c := aDir[p];
  if c = '\' then
    Dec(p);
  while p > 1 do
  begin
    c := aDir[p];
    if (c = '\') or (c = ':') then
      break;
    Dec(p);
  end;
  Result := Copy(aDir, 1, p);
end;

function SimpleRoundToEx(const AValue: Double;
  const ADigit: TRoundToRange = -2): Double;
// function DRoundTo(const AValue: Double;
// const ADigit: TRoundToRange = -2): Double;
// var
// tmp, tmp1: Extended;
// a: string;
// iPos: Integer;
// begin
// tmp := Power(10, -ADigit);
// if AValue > 0 then
// tmp1 := AValue * tmp + 0.5
// else
// tmp1 := AValue * tmp - 0.5;
//
// a := FloatToStr(tmp1);
// iPos := Pos('.', a);
// if iPos > 0 then
// a := Copy(a, 1, iPos - 1);
// Result := StrToFloat(a) / tmp;
// end;

  function RoundFloat(const AValue: Double;
    const ADigit: TRoundToRange = -2): Double;
  var
    s: string;
    ef: Extended;
    b: Double;
  begin
    Result := AValue;
    if SameValue(AValue, 0) or (ADigit > 0) then
    begin
      b := frac(AValue);
      if AValue > 0 then
        Result := AValue - b + SimpleRoundTo(b + 0.000000000001, ADigit)
      else
        Result := AValue - b - SimpleRoundTo(-b + 0.000000000001, ADigit);
      Exit;
    end;
    s := '0.' + StringOfChar('0', -ADigit);
    // 防止浮点运算的误差
    ef := StrToFloat(FloatToStr(AValue));
    Result := StrToFloat(FormatFloat(s, ef));
  end;

var
  b: Double;
begin
  if Math.IsZero(AValue) then
  begin
    Result := 0; // 此函数可能产生微小的误差，尤其是传入的值为0的情况 bugId 15701 add by xkx
    Exit; // 注：看了下代码 0 会变成下面的 0.000000000001 故意的吧。。。 12为改成15位吧。
  end;
  if FirstSVNVersion > 16818 then
    Result := RoundFloat(AValue, ADigit)
  else
  begin
    b := frac(AValue);
    if AValue > 0 then
      Result := AValue - b + SimpleRoundTo(b + 0.000000000001, ADigit)
    else
      Result := AValue - b - SimpleRoundTo(-b + 0.000000000001, ADigit);
  end;
end;

function IIFs(aBool: Boolean; const aStr1, aStr2: string): string;
begin
  if aBool then
    Result := aStr1
  else
    Result := aStr2;
end;

function isZero(const aVar: Double): Boolean;
begin
  Result := ABS(aVar) < THEZERO;
end;

function UpperCaseEx(AValue: WideString): string;
begin
  Result := WideUpperCase(AValue);
end;

function LowerCaseEx(AValue: WideString): string;
begin
  Result := WideLowerCase(AValue);
end;

function FormatToStrEx(dXs: Double; DecNum: Integer = 6): string;
var
  iPos: Integer;
  sStr: string;
  sFormatStr: string;
begin
  if (DecNum <= 0) or (DecNum > 15) then
    DecNum := 6;
  Result := LowerCase(FloatToStr(SimpleRoundToEx(dXs, -DecNum)));
  if Pos('e', Result) = 0 then
    Exit;
  sFormatStr := '%.' + IntToStr(DecNum) + 'f';
  Result := Format(sFormatStr, [dXs]);
  iPos := Pos('.', Result);
  if iPos > 0 then
  begin
    while True do
    begin
      sStr := Copy(Result, Length(Result), 1);
      if sStr = '0' then
        Result := Copy(Result, 1, Length(Result) - 1)
      else if sStr = '.' then
      begin
        Result := Copy(Result, 1, Length(Result) - 1);
        break;
      end
      else
        break;
    end;
  end;
end;

function VarToFloatEx(Value: Variant): Double;
begin
  Result := VarToFloatEx(Value, 0);
end;

function VarToFloatEx(Value: Variant; DefValue: Double): Double;
var
  StrValue: string;
begin
  StrValue := VarToStrDef(Value, '');
  if Not TryStrToFloat(StrValue, Result) then
    Result := DefValue;
end;

function VarToBooleanEx(Value: Variant; DefValue: Boolean = False): Boolean;
var
  StrValue: string;
begin
  StrValue := VarToStrDef(Value, '');
  if Not TryStrToBool(StrValue, Result) then
    Result := DefValue;
end;

function VarToStrEx(Value: Variant; DefValue: string = ''): string;
begin
  Result := VarToStrDef(Value, DefValue);
end;

function VarToIntEx(Value: Variant; DefValue: Integer = 0): Integer;
var
  StrValue: string;
begin
  StrValue := VarToStrDef(Value, '');
  if Not TryStrToInt(StrValue, Result) then
    Result := DefValue;
end;

function GetBaseDW(const aDW: WideString): string;
var
  c: WideChar;
  theposition, thelength: Integer;
begin
  thelength := Length(aDW);
  theposition := 1;

  while (theposition <= thelength) do
  begin
    c := aDW[theposition];
    if (c > '9') or (c < '0') then
      break;
    Inc(theposition);
  end;

  Result := LowerCaseEx(Copy(aDW, theposition, MaxInt));
end;

function GetValueOfStep(const aDW: WideString): Integer;
var
  c: WideChar;
  aStepStr: string;
  theposition, thelength: Integer;
begin
  thelength := Length(aDW);
  theposition := 1;
  aStepStr := '';
  while (theposition <= thelength) do
  begin
    c := aDW[theposition];
    if ((c <= '9') and (c >= '0')) or (c = '.') then
      aStepStr := aStepStr + c
    else
      break;
    Inc(theposition);
  end;

  Result := StrToIntDef(aStepStr, 1);

  if Result = 0 then
    Result := 1;
end;

function NewGuid: string;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := GUIDToString(Guid);
end;

function GetFileText(FileName: string): string;
var
  ts: TStringList;
begin
  Result := '';
  if not FileExists(FileName) then
    Exit;
  ts := TStringList.Create;
  try
    ts.LoadFromFile(FileName);
    Result := ts.Text;
  finally
    ts.Free;
  end;
end;

procedure AppendFiledata(FileName, Data: string; bAddData: Boolean = False);
var
  TF: TextFile;
  StrDire: string;
begin
  try
    FileName := ExtractFilePath(Application.ExeName) + FileName;
    Data := FormatDateTime('yy-MM-DD HH:MM:SS', Now()) + '  ' + Data + #13;
    StrDire := ExtractFilePath(FileName);
    if StrDire <> '' then
      ForceDirectories(StrDire);

    AssignFile(tf,FileName);
    if FileExists(FileName) then
      append(tf)
    else
      rewrite(tf);

    writeln(tf, Data);
    closefile(tf);
  except
  end;
end;

procedure ManageHashDelete(Hash: THashedStringList; Key: string);
var
  HshRecIndex: Integer; // 删除hash表记录
begin
  HshRecIndex := Hash.IndexOf(Key);
  if HshRecIndex >= 0 then
    Hash.delete(HshRecIndex);
end;

{ -------------------------------------------------------------------------------
  过程名:    ColCount
  作者:      李锋
  日期:      2010.05.05
  参数:      sRow: string; cMask: Char
  返回值:    Integer
  功能描述:  计算sRow中以cMask为分割的字符串的个数
  ------------------------------------------------------------------------------- }

function ColCount(sRow: string; cMask: Char): Integer;
var
  i: Integer;
begin
  Result := 0;
  if (sRow <> '') and (sRow[Length(sRow)] <> cMask) then
    sRow := sRow + cMask;
  for i := 1 to Length(sRow) do
    if sRow[i] = cMask then
      Inc(Result);
end;

{ -------------------------------------------------------------------------------
  过程名:    GetCol
  作者:      李锋
  日期:      2010.05.05
  参数:      sRow: string; lColNo: integer; cMask: char
  返回值:    string
  功能描述:  取sRow中 以cMask为分隔符的 第lcolno个字符
  ------------------------------------------------------------------------------- }

function GetCol(sRow: string; lColNo: Integer; cMask: Char): string;
var
  Index: Integer;
  Position: Integer;
begin
  if lColNo >= 0 then
    Result := cMask + sRow
  else
  begin
    Result := '';
    Exit;
  end;
  for Index := 0 to lColNo do
  begin
    Position := Pos(cMask, Result);
    if Position > 0 then
      Result := Copy(Result, Position + 1, Length(Result))
    else
      Result := '';
  end;
  Position := Pos(cMask, Result);
  if Position > 0 then
    Result := Copy(Result, 0, Position - 1);
end;

function StrtoDouble(s: string; Default: Double = 0): Double;
var
  dValue: Double;
begin
  Result := Default;
  if TryStrToFloat(s, dValue) then
    Result := dValue;
end;

{ -------------------------------------------------------------------------------
  过程名:    FindAllFileInPath
  作者:      lifeng
  日期:      2010.12.03
  参数:      FilePath: string; StringList: TStringList
  返回值:    无
  功能描述:  在文件夹下查找所有文件
  ------------------------------------------------------------------------------- }

procedure FindAllFileInPath(FilePath: string; StringList: TStringList);
var
  SearchRec: TSearchRec;
  FindResult: Integer;
begin
  FindResult := FindFirst(FilePath + '\*', faAnyFile, SearchRec);
  while FindResult = 0 do
  begin
    if FileExists(FilePath + '\' + SearchRec.Name) then
      StringList.Add(SearchRec.Name);
    FindResult := FindNext(SearchRec);
  end;
  SysUtils.FindClose(SearchRec);
end;

// 清空目录

function ClearDirectory(const ADirectory: string): Boolean;
var
  SearchRec: TSearchRec;
begin
  Result := False;
  try
    if DirectoryExists(ADirectory) then
    begin
      // 进入该目录，删除其中的子目录和文件
      ChDir(ADirectory);
      // 查找目录中所有任何文件
      FindFirst('*.*', faAnyFile, SearchRec);
      repeat
        // 修改文件属性为普通属性值
        FileSetDate(SearchRec.Name, 0);
        // 如果是目录并且不是.和..则递归调用deltree
        if (SearchRec.Attr and faDirectory > 0) then
        begin
          if (SearchRec.Name[1] <> '.') then
            if (not ClearDirectory(SearchRec.Name)) then
              break
            else
              RemoveDir(SearchRec.Name);
        end
        // 如果是文件直接删除
        else if (not SysUtils.DeleteFile(SearchRec.Name)) then
          break;
        // 继续查找，直到最后
      until (FindNext(SearchRec) <> 0);
      // 回到父目录，删除该目录
      ChDir('..');
      SysUtils.FindClose(SearchRec);
      Result := True;
    end
  except
    Result := False;
  end;
end;

function GuidToSimpleStr(AGuid: string): string;
begin
  Result := StringReplace(AGuid, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
end;

function StrToGuid(AStr: string): string;
var
  s: string;
begin
  Result := AStr;
  if Length(AStr) <> 32 then
    Exit;
  Result := Copy(AStr, 1, 8) + '-';
  s := Copy(AStr, 9, 4);
  Result := Result + s + '-';
  s := Copy(AStr, 13, 4);
  Result := Result + s + '-';
  s := Copy(AStr, 17, 4);
  Result := Result + s + '-';
  s := Copy(AStr, 21, 12);
  Result := Result + s;
  Result := '{' + Result + '}';
end;

// 判断文件是否正在被使用

function IsFileInUse(fName: string): Boolean;
var
  HFileRes: HFILE;
begin
  Result := False;
  if not FileExists(fName) then
    Exit;
  HFileRes := CreateFile(PChar(fName), GENERIC_READ or GENERIC_WRITE, 0, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;

// 判断文件是否正在被使用(判断是否允许读)

function IsFileInUseByRead(fName: string): Boolean;
var
  HFileRes: HFILE;
begin
  Result := False;
  if not FileExists(fName) then
    Exit;
  HFileRes := CreateFile(PChar(fName), GENERIC_READ, 0, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;

// 非标准，可作简单加密用

{ -------------------------------------------------------------------------------
  过程名:    Lf_StrToBase64
  作者:      lifeng
  日期:      2011.07.07
  参数:      s: string
  返回值:    string
  功能描述:
  ------------------------------------------------------------------------------- }

function Lf_StrToBase64(s: string): string;
var
  c1, c2: Byte;
  Shift: Byte;
  i: Integer;
  sTemp: string;
begin
  sTemp := '';
  c2 := 0;
  Shift := 2;
  for i := 1 to Length(s) do
  begin
    c1 := ord(s[i]);
    sTemp := sTemp + LfB64[c2 or c1 shr Shift];
    c2 := (c1 shl (6 - Shift)) and 63;
    Shift := (Shift + 2) and 7;
    if Shift = 0 then
    begin
      Shift := 2;
      sTemp := sTemp + LfB64[c2];
      c2 := 0;
    end;
  end;
  if (Shift > 2) then
  begin
    sTemp := sTemp + LfB64[c2] + '=';
    if Shift = 4 then
      sTemp := sTemp + '=';
  end;
  Result := sTemp;
end;

function Lf_Base64ToStr(s: string): string;
var
  c1, c2: Byte;
  Shift: Byte;
  i: Integer;

  sTemp: string;
begin
  sTemp := '';
  Shift := 0;
  c1 := 0;
  for i := 1 to Length(s) do
  begin
    if s[i] = '=' then
      c2 := 0
    else
      c2 := Pos(s[i], LfB64) - 1;
    if Shift > 0 then
      sTemp := sTemp + chr((c1 shl Shift) or (c2 shr (6 - Shift)));
    Shift := (Shift + 2) and 7;
    c1 := c2;
  end;
  Result := sTemp;
end;

function Base64ToStr(const s: AnsiString): string;
var
  c1, c2: Byte;
  Shift: Byte;
  i: Integer;
  aResult: string;
begin
  aResult := '';
  Shift := 0;
  c1 := 0;
  for i := 1 to Length(s) do
  begin
    if s[i] = '=' then
      c2 := 0
    else
      c2 := Pos(s[i], B64) - 1;
    if Shift > 0 then
      aResult := aResult + AnsiChar((c1 shl Shift) or (c2 shr (6 - Shift)));
    Shift := (Shift + 2) and 7;
    c1 := c2;
  end;
  Result := string(aResult);
end;

function StrToBase64(const s: AnsiString): string;
var
  c1, c2: Byte;
  Shift: Byte;
  i: Integer;
  aResult: AnsiString;
begin
  aResult := '';
  c2 := 0;
  Shift := 2;
  for i := 1 to Length(s) do
  begin
    c1 := ord(s[i]);
    aResult := aResult + B64[c2 or c1 shr Shift];
    c2 := (c1 shl (6 - Shift)) and 63;
    Shift := (Shift + 2) and 7;
    if Shift = 0 then
    begin
      Shift := 2;
      aResult := aResult + B64[c2];
      c2 := 0;
    end;
  end;
  if (Shift > 2) then
  begin
    aResult := aResult + B64[c2] + '=';
    if Shift = 4 then
      aResult := aResult + '=';
  end;
  Result := string(aResult);
end;

function ConvertDouToStr_Kxjs(AValue: Double): string;
var
  d: Double;
  i: Integer;
  s: string;
begin
  Result := FloatToStr(AValue);
  d := AValue;
  if d = 0 then
    Exit;
  if ((d < 0.0001) and (d > 0)) or ((d < 0) and (d > -0.0001)) then
  begin
    Result := FormatFloat('0.0000000000000', d);
    for i := Length(Result) downto 1 do
    begin
      s := Result[i];
      if s <> '0' then
      begin
        Result := Copy(Result, 1, i);
        break;
      end;
    end;
  end;
end;

function Num2CNum(dblArabic: Double): string;
const
  _ChineseNumber = '零一二三四五六七八九';
var
  sArabic: string;
  sIntArabic: string;
  iPosOfDecimalPoint: Integer;
  i: Integer;
  iDigit: Integer;
  iSection: Integer;
  sSectionArabic: string;
  sSection: string;
  bInZero: Boolean;
  bMinus: Boolean;

  function ConvertStr(const sBeConvert: string): string;
  var
    x: Integer;
  begin
    Result := '';
    for x := Length(sBeConvert) downto 1 do
      Result := Result + sBeConvert[x];
  end;

begin
  Result := '';
  bInZero := True;
  sArabic := FloatToStr(dblArabic);
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 254);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic);

  if iPosOfDecimalPoint = 0 then
    sIntArabic := ConvertStr(sArabic)
  else
    sIntArabic := ConvertStr(Copy(sArabic, 1, iPosOfDecimalPoint - 1));
  for iSection := 0 to ((Length(sIntArabic) - 1) div 4) do
  begin
    sSectionArabic := Copy(sIntArabic, iSection * 4 + 1, 4);
    sSection := '';
    for i := 1 to Length(sSectionArabic) do
    begin
      iDigit := ord(sSectionArabic[i]) - 48;
      if iDigit = 0 then
      begin
        if (not bInZero) and (i <> 1) then
          sSection := '零' + sSection;
        bInZero := True;
      end
      else
      begin
        case i of
          2:
            sSection := '十' + sSection;
          3:
            sSection := '百' + sSection;
          4:
            sSection := '千' + sSection;
        end;
        // '零一二三四五六七八九'
        sSection := Copy(_ChineseNumber, iDigit + 1, 1) + sSection;
        bInZero := False;
      end;
    end;

    if Length(sSection) = 0 then
    begin
      if (Length(Result) > 0) and (Copy(Result, 1, 1) <> '零') then
        Result := '零' + Result;

    end
    else
    begin
      case iSection of
        0:
          Result := sSection;
        1:
          Result := sSection + '万' + Result;
        2:
          Result := sSection + '亿' + Result;
        3:
          Result := sSection + '兆' + Result;
      end;
    end;
  end;
  if iPosOfDecimalPoint > 0 then
  begin
    Result := Result + '点';
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := ord(sArabic[i]) - 48;
      Result := Result + Copy(_ChineseNumber, iDigit + 1, 1);
    end;
  end;
  if Length(Result) = 0 then
    Result := '零';
  if Copy(Result, 1, 2) = '一十' then
    Result := Copy(Result, 2, 254);
  if Copy(Result, 1, 1) = '点' then
    Result := '零' + Result;
  if bMinus then
    Result := '负' + Result;
end;

function ConvertMoneyToCN(E: Extended; bHasDecimal: Boolean = False): string;
// 金额转换函数
const
  _ChineseNumeric: array [0 .. 22] of string = ('零', '壹', '贰', '叁', '肆', '伍',
    '陆', '柒', '捌', '玖', '拾', '佰', '仟', '万', '亿', '兆', '元', '角', '分', '厘', '点',
    '负', '整');
var
  sArabic, sIntArabic: string;
  sSectionArabic, sSection: string;
  i, iDigit, iSection, iPosOfDecimalPoint: Integer;
  bInZero, bMinus: Boolean;
  je: Double;

  function ConvertStr(const str: string): string;
  // 将字串反向, 例如: 传入 '1234', 传回 '4321'
  var
    i: Integer;
  begin
    Result := '';
    for i := Length(str) downto 1 do
      Result := Result + str[i];
  end;

begin
  Result := '';
  bInZero := True;
  try
    je := E;
  except
    je := 0;
  end;
  if not bHasDecimal then
    sArabic := FormatFloat('0', je) // 将数字转成阿拉伯数字字串
  else
    sArabic := FloatToStr(je);
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 9999);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic); // 取得小数点的位置

  // 先处理整数的部分
  if iPosOfDecimalPoint = 0 then
    sIntArabic := ConvertStr(sArabic)
  else
    sIntArabic := ConvertStr(Copy(sArabic, 1, iPosOfDecimalPoint - 1));

  // 从个位数起以每四位数为一小节
  for iSection := 0 to ((Length(sIntArabic) - 1) div 4) do
  begin
    sSectionArabic := Copy(sIntArabic, iSection * 4 + 1, 4);
    sSection := '';
    for i := 1 to Length(sSectionArabic) do // 以下的 i 控制: 个十百千位四个位数
    begin
      iDigit := ord(sSectionArabic[i]) - 48;
      if iDigit = 0 then
      begin
        if (not bInZero) and (i <> 1) then
          sSection := _ChineseNumeric[0] + sSection;
        bInZero := True;
      end
      else
      begin
        case i of
          2:
            sSection := _ChineseNumeric[10] + sSection;
          3:
            sSection := _ChineseNumeric[11] + sSection;
          4:
            sSection := _ChineseNumeric[12] + sSection;
        end;
        sSection := _ChineseNumeric[iDigit] + sSection;
        bInZero := False;
      end;
    end;

    if Length(sSection) = 0 then
    begin
      if (Length(Result) > 0) and
        (Copy(Result, 1, 2) <> _ChineseNumeric[0]) then
        Result := _ChineseNumeric[0] + Result;
    end
    else
    begin
      case iSection of
        0:
          Result := sSection + Result;
        1:
          Result := sSection + _ChineseNumeric[13] + Result;
        2:
          Result := sSection + _ChineseNumeric[14] + Result;
        3:
          Result := sSection + _ChineseNumeric[15] + Result;
      end;
    end;

  end;

  if Length(Result) > 0 then
    Result := Result + _ChineseNumeric[16];
  if iPosOfDecimalPoint > 0 then // 处理小数部分
  begin
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := ord(sArabic[i]) - 48;
      Result := Result + _ChineseNumeric[iDigit];
      case i - (iPosOfDecimalPoint + 1) of
        0:
          Result := Result + _ChineseNumeric[17];
        1:
          Result := Result + _ChineseNumeric[18];
        2:
          Result := Result + _ChineseNumeric[19];
      end;
    end;
  end;
  // 其他例外状况的处理
  if Length(Result) = 0 then
    Result := _ChineseNumeric[0];
  if Copy(Result, 1, 2) = _ChineseNumeric[20] then
    Result := _ChineseNumeric[0] + Result;

  if bMinus then
    Result := _ChineseNumeric[21] + Result;
  if not bHasDecimal then
  begin
    Result := Result + _ChineseNumeric[22];
  end
  else
  begin
    if (((Round(je * 100)) div 1) mod 10 = 0) then
      Result := Result + _ChineseNumeric[22];
  end;
end;

function IsFilePathLawful(aPath: string): Boolean;
var
  sWidePath: WideString;
begin
  Result := False;
  sWidePath := aPath;
  if sWidePath = '' then
    Exit;
  Result := True;
  if Pos('?', sWidePath) > 0 then
    Result := False;
end;

function IsInstallVBA: Boolean;
type
  TMsiQueryFeatureState = function(szProduct: PWchar; szFeature: PWchar)
    : LRESULT; stdcall;
var
  hdl, iResult: Integer;
  MsiQueryFeatureState: TMsiQueryFeatureState;
  ExcelApp: Variant;
begin
  Result := False;
  hdl := LoadLibrary('msi.dll');
  try
    try
      ExcelApp := CreateOleObject('Excel.Application');
    except
      Exit;
    end;
    if hdl = 0 then
      Exit;
    try
      @MsiQueryFeatureState := GetProcAddress(hdl, 'MsiQueryFeatureStateW');
      if @MsiQueryFeatureState = nil then
        Exit;
      iResult := MsiQueryFeatureState
        (PWchar(WideString(VarToStr(ExcelApp.ProductCode))), 'VBAFiles');
      if iResult in [1, 3, 4] then
        Result := True;
    except
      Result := False;
    end;
  finally
    ExcelApp := Unassigned;
    FreeLibrary(hdl);
  end;
end;

function GetStrAB(s, a, b: string; bWithAB: Boolean = True): string;
var
  iPos1, iPos2: Integer;
  sTemp: string;
begin
  sTemp := '';
  try
    iPos1 := Pos(a, s);
    if iPos1 <= 0 then
      Exit;

    sTemp := Copy(s, iPos1 + Length(a), Length(s));

    iPos2 := Pos(b, sTemp);
    if iPos2 <= 0 then
      Exit;

    if bWithAB then
      sTemp := a + Copy(sTemp, 1, iPos2 + Length(b) - 1)
    else
      sTemp := Copy(sTemp, 1, iPos2 - 1);
  finally
    Result := sTemp;
  end;
end;

function SimpleEncStr(str: string): string; // 字符加密函數  這是用的一個異或加密
var
  i, j: Integer;
begin
  Result := '';
  j := 0;
  for i := 1 to Length(str) do
  begin
    Result := Result + IntToHex(Byte(str[i]) xor XorKey[j], 2);
    j := (j + 1) mod 8;
  end;
end;

function SimpleDecStr(str: string): string; // 字符解密函數
var
  i, j: Integer;
begin
  Result := '';
  j := 0;
  for i := 1 to Length(str) div 2 do
  begin
    Result := Result + Char(StrToInt('$' + Copy(str, i * 2 - 1, 2))
      xor XorKey[j]);
    j := (j + 1) mod 8;
  end;
end;

function IsLocalDisk(Drive: string): Boolean;
begin
  Result := GetDriveType(PWideChar(Drive)) = DRIVE_FIXED;
end;

function DiskReady(Root: string): Boolean;
var
  Oem: Cardinal;
  Dw1, Dw2: DWORD;
begin
  Oem := SetErrorMode(SEM_FAILCRITICALERRORS);
  if Length(Root) = 1 then
    Root := Root + ':\'
  else if Length(Root) = 2 then
    Root := Root + '\';
  Result := GetVolumeInformation(PChar(Root), nil, 0, nil, Dw1, Dw2, nil, 0);
  SetErrorMode(Oem);
end;

function SelectDirectoryEx(AHandleOwner: THandle; Caption, RootDir: string;
  bCreateDir, bShowAddressBar: Boolean; var Path: string): Boolean;
var
  bi: BROWSEINFO;
  pidl, rootpidl: PITEMIDLIST;
  pShellMalloc: IMalloc;
  pShellFolder: IShellFolder;
  dumy: Cardinal;
  pszDisplay: array [0 .. MAX_PATH] of Char;
  function BrowseCallBack(Wnd: HWND; uMsg: UINT; lParam, lpData: lParam)
    : Integer stdcall;
  var
    edtWnd: THandle;
    buff: PChar;
    ch: Char;
  begin
    Result := 0;
    case uMsg of
      BFFM_SELCHANGED:
        begin
          edtWnd := FindWindowEx(Wnd, 0, 'Edit', nil);
          GetMem(buff, 65535 * SizeOf(Char));
          if SHGetPathFromIDList(PITEMIDLIST(lParam), buff) then
          begin
            SendMessage(edtWnd, WM_SETTEXT, 0, Integer(buff));
            SendMessage(edtWnd, WM_KILLFOCUS, 0, 0);
          end;
          FreeMem(buff);
        end;
      BFFM_VALIDATEFAILED:
        begin
          for ch in ['"', '|', '>', '<', '?', '*'] do
          begin
            if StrScan(PChar(lParam), ch) <> nil then
            begin
              Warn(Wnd, PChar(Format('"%s" 不是一个合法的名称。', [PChar(lParam)])));
              Exit(1);
            end;
          end;
          if Question(Wnd, PChar(Format('文件夹 "%s" 不存在，您想要创建它吗？',
            [PChar(lParam)]))) then
          begin
            try
              ForceDirectories(PChar(lParam));
            except
              dsMessageBox(nil, '无法创建文件夹，请检查文件夹路径是否正确！', '错误',
                MI_OK, MI_Warning);
              Exit(1);
            end;
            if DirectoryExists(PChar(lParam)) then
            begin
              Result := 0;
              SendMessage(Wnd, BFFM_SETSELECTION, 1, lParam);
            end
            else
            begin
              dsMessageBox(nil, '无法创建文件夹，请检查文件夹名称是否正确，或是否拥有足够的权限。', '错误',
                MI_OK, MI_Warning);
              Exit(1);
            end;
          end
          else
            Result := 1;
        end;
    end;
  end;

begin
  Result := False;
  if SHGetMalloc(pShellMalloc) = NOERROR then
  begin
    FillChar(bi, SizeOf(bi), 0);
    if (RootDir = '') or (not DirectoryExists(RootDir)) or
      (SHGetDesktopFolder(pShellFolder) <> NOERROR) then
      rootpidl := nil
    else
    begin
      dumy := 0;
      pShellFolder.ParseDisplayName(0, nil, PChar(RootDir), dumy,
        rootpidl, dumy);
      pShellFolder := nil;
    end;

    with bi do
    begin
      if AHandleOwner = 0 then
        hwndOwner := Application.MainForm.Handle
      else
        hwndOwner := AHandleOwner;
      pidlRoot := rootpidl;
      pszDisplayName := @pszDisplay;
      lpszTitle := PChar(Caption);
      ulFlags := BIF_RETURNONLYFSDIRS or BIF_NEWDIALOGSTYLE;
      if bShowAddressBar then
        ulFlags := ulFlags or BIF_EDITBOX;
      if not bCreateDir then
        ulFlags := ulFlags or BIF_NONEWFOLDERBUTTON
      else
        ulFlags := ulFlags or BIF_VALIDATE;
      lpfn := @BrowseCallBack;
    end;
    pidl := SHBrowseForFolder(bi);
    if (pidl <> nil) then
    begin
      SetLength(Path, $FFFF);
      if SHGetPathFromIDList(pidl, PChar(Path)) then
      begin
        Result := True;
        SetLength(Path, strlen(PChar(Path)));
      end;
      pShellMalloc.Free(pidl);
    end;
    pShellMalloc := nil;
  end;
end;

function ConvertStrToDate(const AStr: string; var ADate :TDateTime): Boolean;
var
  R :TRegEx;
  iYear, iMonth, iDay :Integer;
  match: TMatch;
begin
  Result := False;
  R := TRegEx.Create('(\d{4})\D+(\d+)\D+(\d+)');
  match := R.Match(AStr);
  if match.Success and (match.Groups.Count > 3) then
  begin
    iYear := StrToIntDef(match.Groups.Item[1].Value, 0);
    iMonth := StrToIntDef(match.Groups.Item[2].Value, 0);
    iDay := StrToIntDef(match.Groups.Item[3].Value, 0);
    Result := TryEncodeDate(iYear, iMonth, iDay, ADate);
  end;
end;

function IIFs(aBool: Boolean; const aStr1, aStr2: Integer): Integer; overload;
begin
  if aBool then
    Result := aStr1
  else
    Result := aStr2;
end;

function StrSimpleRoundToEx(const AValue: string; const ADigit: TRoundToRange =
  -2; AdDefValue: Double = 0): Double;
begin
  Result := SimpleRoundToEx(StrToFloatDef(AValue, AdDefValue), ADigit);
end;

function SimpleRoundToStr(const AValue: Double; const ADigit: TRoundToRange =
  -2): string; overload;
begin
  Result := FloatToStr(SimpleRoundToEx(AValue, ADigit));
end;

function SimpleRoundToStr(const AValue: string; const ADigit: TRoundToRange =
  -2; AdDefValue: Double = 0): string; overload;
begin
  Result := FloatToStr(StrSimpleRoundToEx(AValue, ADigit, AdDefValue));
end;

function GetFirstSepStr(AStr: string; ASep: string=','): string;
var
  iPos: Integer;
begin
  Result := AStr;
  iPos := Pos(ASep, AStr);
  if iPos > 0 then
    Result := Copy(Result, 1, iPos - 1);
end;

function CheckRegExpr(Str, ExprStr: string; AbChangeToSafeExpr: Boolean =
  False): Boolean;
begin
  Result := False;
  if SameStr(ExprStr, EmptyStr) then
    Exit;
  // 当 ExprStr 来源于用户输入 可能包含一些正则表达式用的特殊字符 导致不少正确的表达式 这里会将这些特殊字符进行转义处理
  if AbChangeToSafeExpr then
    ExprStr := QuoteRegExprMetaChars(ExprStr);
  with TRegExpr.Create do
  try
    try
      Expression := ExprStr;
      Result := Exec(Str);
    except
      Result := False;
    end;
  finally
    Free;
  end;
end;

function CheckRegExpr(Str, ExprStr: string; MatchIndex: Integer; out MatchStr:
  string): Boolean;
begin
  Result := False;
  if SameStr(ExprStr, EmptyStr) then
    Exit;
  with TRegExpr.Create do
  try
    try
      Expression := ExprStr;
      Result := Exec(Str);
      if Result then
        MatchStr := Match[MatchIndex];
    except
      Result := False;
    end;
  finally
    Free;
  end;
end;

function CheckRegExpr(Str, ExprStr: string; MatchIndexArr: array of Integer;
  out MatchStrArr: array of string): Boolean;
var
  I, iCount, nMatchIndex: Integer;
begin
  Result := False;
  if SameStr(ExprStr, EmptyStr) then
    Exit;
  with TRegExpr.Create do
  try
    try
      Expression := ExprStr;
      Result := Exec(Str);
      if Result then
      begin
        iCount := Length(MatchIndexArr);
        for I := 0 to iCount - 1 do
        begin
          nMatchIndex := MatchIndexArr[I];
          MatchStrArr[I] := Match[nMatchIndex];
        end;
      end;
    except
      Result := False;
    end;
  finally
    Free;
  end;
end;

function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc:
  TCheckRegExpr_LoopCallBack1): Integer;
begin
  Result := CheckRegExpr_Loop(Str, ExprStr, ALoopCallBackFunc,
    TCheckRegExpr_LoopCallBack2(nil), TCheckRegExpr_LoopCallBack3(nil), TCheckRegExpr_LoopCallBack4(nil));
end;

function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc:
  TCheckRegExpr_LoopCallBack2): Integer;
begin
  Result := CheckRegExpr_Loop(Str, ExprStr, TCheckRegExpr_LoopCallBack1(nil),
    ALoopCallBackFunc, TCheckRegExpr_LoopCallBack3(nil), TCheckRegExpr_LoopCallBack4(nil));
end;

procedure SetControlsEnable(AControl: TWinControl; AbEnable: Boolean);
var
  I, iCount: Integer;
  ChildCtrl: TControl;
begin
  if not Assigned(AControl) then
    Exit;
  iCount := AControl.ControlCount;
  for I := 0 to iCount - 1 do
  begin
    ChildCtrl := AControl.Controls[I];
    if ChildCtrl is TWinControl then
      SetControlsEnable(ChildCtrl as TWinControl, AbEnable)
    else
      ChildCtrl.Enabled := AbEnable;
  end;
  AControl.Enabled := AbEnable;
end;

function FindClassInList(AList: TList; AFindClassType: TClass; out AResult:
  TObject; AnFindStartIndex: Cardinal = 0): Boolean;
var
  I: Cardinal;
begin
  Result := False;
  if Assigned(AList) and Assigned(AFindClassType) then
  for I := AnFindStartIndex to AList.Count - 1 do
  begin
    AResult := TObject(AList[I]);
    if AResult is AFindClassType then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function IsWordInString(AsWord, AsString: string; AbCaseSensitive: Boolean =
  False): Boolean;
var
  bResult: Boolean;
begin
  Result := False;
  if CheckRegExpr_Loop(AsString, '\w+',
    function {_IsSameWord}(Match: TStrings): Boolean
    begin
      if AbCaseSensitive then
        Result := SameStr(AsWord, Match[0])
      else
        Result := SameText(AsWord, Match[0]);
      bResult := Result;
    end
  ) > 0 then
    Result := bResult;
end;

function IsStringHasSameWord(AsStr1, AsStr2: string; AbCaseSensitive: Boolean =
  False): Boolean;
var
  bResult: Boolean;
begin
  Result := False;
  if SameStr(AsStr1, EmptyStr) or SameStr(AsStr2, EmptyStr) then
    Exit;
  // 将 字符串1 分成单词 与 字符串2 比较
  if CheckRegExpr_Loop(AsStr1, '\w+',
    function {_CompareWordWithStr}(Match: TStrings): Boolean
    begin
      Result := IsWordInString(Match[0], AsStr2, AbCaseSensitive);
      bResult := Result;
    end
  ) > 0 then
    Result := bResult;
end;

function GetNotCaseSensitiveRegExpr(AsExprStr: string): string;
begin
//  Result := ReplaceRegExpr('[a-zA-Z]', AsExprStr, '(?i)$0', True);
  Result := EmptyStr;
  if not SameStr(AsExprStr, EmptyStr) then
    Result := '(?i)' + AsExprStr;
end;

function HexStrToIntStr(AsHex: string): string;
begin
  Result := IntToStr(HexStrToInt(AsHex));
end;

function HexStrToInt(AsHex: string): Integer;
var
  I, nLen, nExponent, nNum: Integer;
  c: Char;
begin
  Result := 0;
  nLen := Length(AsHex);
  nExponent := 0;
  for I := nLen downto 1 do
  begin
    c := AsHex[I];
    case c of
      '0'..'9': nNum := StrToInt(c);
      'a', 'A': nNum := 10;
      'b', 'B': nNum := 11;
      'c', 'C': nNum := 12;
      'd', 'D': nNum := 13;
      'e', 'E': nNum := 14;
      'f', 'F': nNum := 15;
    else
      Break;
    end;
    Result := Result + nNum * Trunc(IntPower(16, nExponent)); // + x * 16 的 n 次方
    Inc(nExponent);
  end;
end;

function ReplaceRegExprEx(const ARegExpr, AInputStr, AReplaceStr: string;
  AReplaceXThArray: array of Integer; AUseSubstitution: Boolean = False):
  string;
type
  TIntDic = TDictionary<Integer,Integer>;

  function _ToDic(A: array of Integer): TIntDic;
  var
   n: Integer;
  begin
    Result := TIntDic.Create();
    for n in A do
      Result.AddOrSetValue(n, 0);
  end;

var
  nCount, nPrevPos, nReplaced: Integer;
  LIntDic: TIntDic;
  bReplaceAll: Boolean;
begin
  if SameStr(ARegExpr, EmptyStr) or (Length(AReplaceXThArray) = 0) then
    Exit(AInputStr);
  Result := EmptyStr;
  LIntDic := _ToDic(AReplaceXThArray);
  with TRegExpr.Create() do
  try
    try
      bReplaceAll := LIntDic.ContainsKey(-1);
      Expression := ARegExpr;
      nCount := 0;
      nPrevPos := 1;
      nReplaced := 0;
      if Exec(AInputStr) then
      repeat
        Inc(nCount);
        if (not bReplaceAll) and not LIntDic.ContainsKey(nCount) then
          Continue;
        Inc(nReplaced);
        Result := Result + System.Copy (AInputStr, nPrevPos, MatchPos[0] - nPrevPos);
        if AUseSubstitution then
          Result := Result + Substitute(AReplaceStr)
        else
          Result := Result + AReplaceStr;
        nPrevPos := MatchPos [0] + MatchLen [0];
      until not ExecNext();
      if nReplaced = 0 then
        Result := AInputStr
      else
        Result := Result + System.Copy (AInputStr, nPrevPos, MaxInt);
    except
      Result := AInputStr;
    end;
  finally
    Free();
    LIntDic.Free();
  end;
end;

function ReplaceRegExprEx(const ARegExpr, AInputStr, AReplaceStr: string;
  AnReplaceXTh: Integer = -1; AUseSubstitution: Boolean = False): string;
  overload;
begin
  Result := ReplaceRegExprEx(ARegExpr, AInputStr, AReplaceStr, [AnReplaceXTh], AUseSubstitution);
end;

function LoopAllChildControls(AControl: TWinControl; ACallBack:
  TLoopCtrls_CallBack1; AbRecurse: Boolean): Boolean;
begin
  Result := LoopAllChildControls(AControl, ACallBack, TLoopCtrls_CallBack2(nil), AbRecurse);
end;

function LoopAllChildControls(AControl: TWinControl; ACallBack:
  TLoopCtrls_CallBack2; AbRecurse: Boolean): Boolean;
begin
  Result := LoopAllChildControls(AControl, nil, ACallBack, AbRecurse);
end;

function HasNilInterface(AIntfArr: array of IUnknown): Boolean;
var
  I: Integer;
  Intf: IUnknown;
begin
  Result := True;
  for I := Low(AIntfArr) to High(AIntfArr) do
  begin
    Intf := AIntfArr[I];
    if Intf = nil then
      Exit;
  end;
  Result := False;
end;

{ TColsRecord }

constructor TColsRecord.Create(AsRow: string; AcMask: Char);
begin
  sRow := AsRow;
  cMask := AcMask;
  nCount := ColCount(sRow, cMask);
end;

function TColsRecord.GetCols(Index: Integer): string;
begin
  Result := GetCol(sRow, Index, cMask);
end;

function TColsRecord.GetCount: Integer;
begin
  Result := nCount;
end;

function TColsRecord.GetCount_Max: Integer;
var
  nLen: Integer;
begin
  Result := nCount;
  if SameStr(sRow, EmptyStr) then
    Exit;
  if sRow[Length(sRow)] = cMask then
    Result := nCount + 1;
end;

function TColsRecord.GetStrForMask(Index: Integer): string;
begin
  Result := GetLeftStrForMask(sRow,Index,cMask);
end;

{ TRunThreadFunc }

constructor TRunThreadFunc.Create(AStrFunc: TStringFunction; AsString:
  string);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  FStrFunc := AStrFunc;
  FsString := AsString;
end;

procedure TRunThreadFunc.Execute;
begin
  if Assigned(FStrFunc) then
    FStrFunc(FsString);
end;

{ TJdsxHelper }

class function TJdsxHelper.AddJdsx(const AnValue, AnJdsx: Integer): Integer;
begin
  Result := AnValue;
  if IsCorrectJdsx(AnJdsx) then
    Result := AnValue or AnJdsx;
end;

class function TJdsxHelper.IntToJdsxArray(AnValue: Integer): TArray<Integer>;
var
  nLen: Integer;

  procedure _AddSingleJdsx(AnSingleJdsx: Integer);
  begin
    Inc(nLen);
    SetLength(Result, nLen);
    Result[nLen - 1] := AnSingleJdsx;
  end;

var
  nSingleJdsx, nPower: Integer;
begin
  nLen := 0;
  SetLength(Result, nLen);
  // 指数是31的节点属性 特殊处理
  nPower := 31;
  nSingleJdsx := cst_Jdsx_Value_Power31;
  if IsExistJdsx(AnValue, nSingleJdsx) then
  begin
    _AddSingleJdsx(nSingleJdsx);
    AnValue := RemoveJdsx(AnValue, nSingleJdsx);
  end;

  nPower := 0;
  nSingleJdsx := 0;
  while True do
  begin
    if nPower = 31 then
      Break;
    nSingleJdsx := Trunc(IntPower(2, nPower));
    if nSingleJdsx > AnValue then
      Break;
    if AnValue and nSingleJdsx = nSingleJdsx then
      _AddSingleJdsx(nSingleJdsx);

    Inc(nPower);
  end;
end;

class function TJdsxHelper.IntToJdsxPowerSet(AnValue: Integer): TJdsxPowerSet;
var
  nLen: Integer;
  nSingleJdsx, nPower: Integer;
begin
  Result := [];
  nLen := 0;
  // 指数是31的节点属性 特殊处理
  nPower := 31;
  nSingleJdsx := cst_Jdsx_Value_Power31;
  if IsExistJdsx(AnValue, nSingleJdsx) then
  begin
    Include(Result, nPower);
    AnValue := RemoveJdsx(AnValue, nSingleJdsx);
  end;

  nPower := 0;
  nSingleJdsx := 0;
  while True do
  begin
    if nPower = 31 then
      Break;
    nSingleJdsx := Trunc(IntPower(2, nPower));
    if nSingleJdsx > AnValue then
      Break;
    if AnValue and nSingleJdsx = nSingleJdsx then
      Include(Result, nPower);

    Inc(nPower);
  end;
end;

class function TJdsxHelper.IntToJdsxPowerArray(AnValue: Integer):
  TArray<Integer>;
var
  nLen: Integer;

  procedure _AddSinglePower(AnSingleJdsx: Integer);
  begin
    Inc(nLen);
    SetLength(Result, nLen);
    Result[nLen - 1] := AnSingleJdsx;
  end;

var
  nSingleJdsx, nPower: Integer;
begin
  nLen := 0;
  SetLength(Result, nLen);
  // 指数是31的节点属性 特殊处理
  nPower := 31;
  nSingleJdsx := cst_Jdsx_Value_Power31;
  if IsExistJdsx(AnValue, nSingleJdsx) then
  begin
    _AddSinglePower(nPower);
    AnValue := RemoveJdsx(AnValue, nSingleJdsx);
  end;

  nPower := 0;
  nSingleJdsx := 0;
  while True do
  begin
    if nPower = 31 then
      Break;
    nSingleJdsx := Trunc(IntPower(2, nPower));
    if nSingleJdsx > AnValue then
      Break;
    if AnValue and nSingleJdsx = nSingleJdsx then
      _AddSinglePower(nPower);

    Inc(nPower);
  end;
end;

class function TJdsxHelper.IsCorrectJdsx(const AnJdsx: Cardinal): Boolean;
begin
  Result := False;
  if Math.IsZero(AnJdsx) then
    Exit;
  Result := Math.IsZero(Frac(Log2(AnJdsx))); // 2的整数次幂
end;

class function TJdsxHelper.IsExistJdsx(const AnValue, AnJdsx: Integer): Boolean;
begin
  Result := False;
  if IsCorrectJdsx(AnJdsx) then
    Result := AnValue and AnJdsx = AnJdsx;
end;

class function TJdsxHelper.JdsxArrayToInt(AJdsxArr: TArray<Integer>): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I in AJdsxArr do
  begin
    if IsExistJdsx(Result, I) then
      Continue; // 重复的节点属性
    if IsCorrectJdsx(I) then
      Inc(Result, I); // 仅添加正确的节点属性
  end;
end;

class function TJdsxHelper.JdsxPowerSetToInt(AJdsxArr: TJdsxPowerSet): Integer;
var
  nPower, I: Integer;
begin
  Result := 0;
  for nPower in AJdsxArr do
  begin
    I := Trunc(IntPower(2, nPower));
    { 集合不会重复 不需要判断 if IsExistJdsx(Result, I) then Continue; // 重复的节点属性 // }
    if IsCorrectJdsx(I) then
      Inc(Result, I); // 仅添加正确的节点属性
  end;
end;

class function TJdsxHelper.JdsxPowerArrayToInt(AJdsxArr: TArray<Integer>):
  Integer;
var
  nPower, I: Integer;
begin
  Result := 0;
  for nPower in AJdsxArr do
  begin
    I := Trunc(IntPower(2, nPower));
    if IsExistJdsx(Result, I) then
      Continue; // 重复的节点属性
    if IsCorrectJdsx(I) then
      Inc(Result, I); // 仅添加正确的节点属性
  end;
end;

class function TJdsxHelper.RemoveJdsx(const AnValue, AnJdsx: Integer): Integer;
begin
  Result := AnValue;
  if IsCorrectJdsx(AnJdsx) then
    Result := AnValue and not AnJdsx;
end;

function ExtractFileNameNoExt(sFileString: string): string;
var
  sFileExtString: String;
  iLenExt: Integer;
  iLenNameWithExt: Integer;
begin
  iLenNameWithExt := Length(sFileString);
  sFileExtString := ExtractFileExt(sFileString);
  iLenExt := Length(sFileExtString);
  Result := Copy(sFileString, 1, (iLenNameWithExt - iLenExt));
end;

function CheckRegExpr(Str, ExprStr: string; out AMatchList: TRegExprMatchList):
  Boolean;
var
  I, iCount, nMatchIndex: Integer;
  LRegExpr: TRegExpr;
begin
  Result := False;
  if SameStr(ExprStr, EmptyStr) then
    Exit;
  LRegExpr := TRegExpr.Create();
  with LRegExpr do
  try
    try
      Expression := ExprStr;
      Result := Exec(Str);
      if Result then
      begin
        AMatchList := TRegExprMatchList.Create(Str);
        _AddMachInfo(AMatchList, LRegExpr, 0);
        iCount := SubExprMatchCount;
        for I := 1 to iCount do
          _AddMachInfo(AMatchList, LRegExpr, I);
      end;
    except
      Result := False;
    end;
  finally
    Free;
  end;
end;

function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc:
  TCheckRegExpr_LoopCallBack3): Integer; overload;
begin
  Result := CheckRegExpr_Loop(Str, ExprStr, TCheckRegExpr_LoopCallBack1(nil),
    TCheckRegExpr_LoopCallBack2(nil), ALoopCallBackFunc, TCheckRegExpr_LoopCallBack4(nil));
end;

function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc:
  TCheckRegExpr_LoopCallBack4): Integer; overload;
begin
  Result := CheckRegExpr_Loop(Str, ExprStr, TCheckRegExpr_LoopCallBack1(nil),
    TCheckRegExpr_LoopCallBack2(nil), TCheckRegExpr_LoopCallBack3(nil), ALoopCallBackFunc);
end;

function StringReplace(const S, OldPattern, NewPattern: string; Flags:
  TReplaceFlags): string;
begin
  Result := FastStringReplace(S, OldPattern, NewPattern, Flags);
end;

// Much faster StringReplace implementation than RTL StringReplace() (including XE7 implementation)
// In our tests it is at least 20% faster in small strings and up to 500% faster in most cases.
// Some corner cases tests showed that this version can be 100x faster than std StringReplace(), e.g.
// Length(OldPattern) = Length(NewPattern) and huge number of occurrences of OldPattern in the string.
// It also beats TStringBuilder.Replace() in all tested scenarios
function FastStringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string;
const
  Size_of_Char = SizeOf(Char);
var
  Str: string;
  xOldPattern: string;
  i, j: Integer;
  SourceIdx,
  DestIdx,
  p: Integer;
  FindCount: Integer;
  PosArray: array of Integer;
  LenOP, LenNP, ArrLen: Integer;
begin
  if S = '' then begin
    Result := '';
    Exit;
  end;

  if rfIgnoreCase in Flags then begin
    xOldPattern := AnsiUpperCase(OldPattern);
    if SameStr(xOldPattern, AnsiLowerCase(OldPattern)) then begin   // if AnsiUpperCase(OldPattern) = AnsiLowerCase(OldPattern) we don't need to use UpperCase() in the whole string
      Str := S;
    end else begin
      Str := AnsiUpperCase(S);
    end;
  end else begin
    xOldPattern := OldPattern;
    Str := S;
  end;

  LenOP := Length(OldPattern);
  LenNP := Length(NewPattern);

  i := 1;
  FindCount := 0;
  ArrLen := 0;
  repeat
    //In x64 we call FastPos() directly. In XE3 or below, we call PosEx(). If IDE >= XE3, then call Pos()
    i := {$IFDEF CPUX64}FastPos{$ELSE} {$IF CompilerVersion < 24}PosEx{$ELSE}Pos{$IFEND}{$ENDIF}(xOldPattern, Str, i);
    if i = 0 then begin
      Break;
    end;
    Inc(FindCount);
    if ArrLen < FindCount then begin
      if ArrLen = 0 then begin
        ArrLen := 32;
      end else begin
        ArrLen := ArrLen * 2;
      end;
      SetLength(PosArray, ArrLen);   // call SetLength less frequently makes a huge difference when replacing multiple occurrences
    end;
    PosArray[FindCount - 1] := i;
    Inc(i, LenOP);
  until Flags * [rfReplaceAll] = [];

  if FindCount > 0 then begin
    if LenNP = LenOP then begin   // special case where Length(OldPattern) = Length(NewPattern)
      Result := S;                // in this case, we can optimize it even further
      for j := 0 to FindCount - 1 do begin
        DestIdx := PosArray[j];
        if LenNP > 0 then begin
          Move(NewPattern[1], Result[DestIdx], LenNP * Size_of_Char);
        end;
      end;
    end else begin
      SetLength(Result, Length(S) + (LenNP - LenOP) * FindCount);
      SourceIdx := 1;
      DestIdx := 1;
      for j := 0 to FindCount - 1 do begin
        p := PosArray[j] - SourceIdx;
        if p > 0 then begin
          Move(S[SourceIdx], Result[DestIdx], p * Size_of_Char);
          Inc(SourceIdx, p);
          Inc(DestIdx, p);
        end;
        if LenNP > 0 then begin
          Move(NewPattern[1], Result[DestIdx], LenNP * Size_of_Char);
        end;
        Inc(SourceIdx, LenOP);
        Inc(DestIdx, LenNP);
      end;
      p := Length(S) + 1 - SourceIdx;
      if p > 0 then begin
        Move(S[SourceIdx], Result[DestIdx], p * Size_of_Char);
      end;
    end;
  end else begin
    Result := S;
  end;
end;

function IsStrInArray(AsValue: string; AStrArray: array of string;
  AbCaseSensitive: Boolean = False): Boolean;
var
  I: Integer;
  LsValue: string;
begin
  Result := False;
  for I := Low(AStrArray) to High(AStrArray) do
  begin
    LsValue := AStrArray[I];
    if AbCaseSensitive then
      Result := SameStr(LsValue, AsValue)
    else
      Result := SameText(LsValue, AsValue);
    if Result then
      Exit;
  end;
end;

function CheckRegExpr_Loop(Str, ExprStr: string): Integer; overload;
begin
  Result := CheckRegExpr_Loop(Str, ExprStr, TCheckRegExpr_LoopCallBack1(nil),
    TCheckRegExpr_LoopCallBack2(nil), TCheckRegExpr_LoopCallBack3(nil), TCheckRegExpr_LoopCallBack4(nil));
end;

function IsMatchPos_Parenthesis(AsValue: string; AnLeft, AnRight: Integer):
  Boolean;
type
  TParenthesis_Info = record
    nLeft, nRight: Integer; // 左右括号位置
  end;
  TParenthesis_List = TList<TParenthesis_Info>; // 匹配括号列表
  TParenthesis_Stack = TStack<TParenthesis_Info>;
var
  _List: TParenthesis_List; // 返回按照执行顺序 括号对的列表
  _Stack: TParenthesis_Stack;
  _Count: Integer; // 左+1 右-1
  _Info: TParenthesis_Info;
  _nLen: Integer;
begin
  Result := False;
  if (AnLeft < 1) or (AnRight < 1) then
    Exit;
  _nLen := Length(AsValue);
  if (_nLen < 2) or (AnLeft > _nLen) or (AnRight > _nLen) then
    Exit;
  _List := TParenthesis_List.Create(TComparer<TParenthesis_Info>.Construct(
    function(const Left, Right: TParenthesis_Info): Integer
    begin
      if (Left.nLeft = Right.nLeft) and (Left.nRight = Right.nRight) then
        Result := 0
      else
        Result := -1;
    end));
  _Stack := TParenthesis_Stack.Create;
  try
    _Count := 0;
    CheckRegExpr_Loop(AsValue, '\(|\)',
      function(Match: TRegExprMatchList; var AnNextExecPos: Integer):Boolean
      var
        __MatchInfo: TRegExprMatchInfo;
      begin
        Result := False;
        __MatchInfo := Match[0];
        if __MatchInfo.sValue = '(' then
        begin
          Inc(_Count);
          _Info.nLeft := __MatchInfo.nPos;
          _Info.nRight := -1;
          _Stack.Push(_Info);
        end
        else
        begin
          Dec(_Count);
          if _Count < 0 then
          begin
            Result := True;
            Exit; // 非法
          end;
          _Info := _Stack.Pop();
          _Info.nRight := __MatchInfo.nPos;
          _List.Add(_Info);
        end;
      end);
    if _Count < 0 then
      Exit;
    _Info.nLeft := AnLeft;
    _Info.nRight := AnRight;
    if _List.Contains(_Info) then
      Result := True;
  finally
    _List.Free();
    _Stack.Free();
  end;
end;

function LoopAllChildControls(AControl: TWinControl; ACallBack1:
  TLoopCtrls_CallBack1; ACallBack2: TLoopCtrls_CallBack2; AbRecurse: Boolean):
  Boolean; overload;
var
  I, iCount, J, jCount, nCallBack{传入的回调函数编号; 认为最多传入1个}: Integer;
  ChildCtrl: TControl;
  PageControl: TcxPageControl;
begin
  Result := False;
  if AControl = nil then
    Exit;
  if Assigned(ACallBack1) then
    nCallBack := 1
  else if Assigned(ACallBack2) then
    nCallBack := 2
  else
    Exit;
  iCount := AControl.ControlCount;
  for I := 0 to iCount - 1 do
  begin
    ChildCtrl := AControl.Controls[I];
    // deal
    case nCallBack of
      1: if ACallBack1(ChildCtrl) then Exit(True); 
      2: if ACallBack2(ChildCtrl) then Exit(True);
    end;
    // 递归
    if AbRecurse then
    begin
      // PageControl 子插页处理
      if ChildCtrl is TcxPageControl then
      begin
        PageControl := ChildCtrl as TcxPageControl;
        jCount := PageControl.PageCount;
        for J := 0 to jCount - 1 do
        begin
          if LoopAllChildControls(PageControl.Pages[J] as TWinControl, ACallBack1, ACallBack2, AbRecurse) then
            Exit(True);
        end;
      end
      else if ChildCtrl is TWinControl then
      begin
        if LoopAllChildControls(ChildCtrl as TWinControl, ACallBack1, ACallBack2, AbRecurse) then
          Exit(True);
      end;
    end;
  end;
end;

function CheckRegExpr_Loop(Str, ExprStr: string; ALoopCallBackFunc1:
  TCheckRegExpr_LoopCallBack1; ALoopCallBackFunc2: TCheckRegExpr_LoopCallBack2;
  ALoopCallBackFunc3: TCheckRegExpr_LoopCallBack3; ALoopCallBackFunc4:
  TCheckRegExpr_LoopCallBack4): Integer; overload;
var
  I, iCount, nExecPos, nCallBack{传入的回调函数编号; 认为最多传入1个}: Integer;
  LRegExpr: TRegExpr;
  LMatchs34: TRegExprMatchList;
  LMatchs12: TStringList;
begin
  Result := 0;
  if SameStr(ExprStr, EmptyStr) then
    Exit;
  if Assigned(ALoopCallBackFunc1) then
    nCallBack := 1
  else if Assigned(ALoopCallBackFunc2) then
    nCallBack := 2
  else if Assigned(ALoopCallBackFunc3) then
    nCallBack := 3
  else if Assigned(ALoopCallBackFunc4) then
    nCallBack := 4
  else
    nCallBack := 0;
  LRegExpr := TRegExpr.Create();
  LMatchs12 := TStringList.Create();
  LMatchs34 := TRegExprMatchList.Create(Str);
  try
    try
      LRegExpr.Expression := ExprStr;
      if LRegExpr.Exec(Str) then
      repeat
        Inc(Result);
        LMatchs12.Clear();
        LMatchs12.Add(LRegExpr.Match[0]);
        LMatchs34.Clear();
        _AddMachInfo(LMatchs34, LRegExpr, 0);
        iCount := LRegExpr.SubExprMatchCount;
        for I := 1 to iCount do
        begin
          LMatchs12.Add(LRegExpr.Match[I]);
          _AddMachInfo(LMatchs34, LRegExpr, I);
        end;
        nExecPos := LMatchs34[0].nPos + LMatchs34[0].nLen;
        case nCallBack of
          1: if ALoopCallBackFunc1(LMatchs12) then Exit;
          2: if ALoopCallBackFunc2(LMatchs12) then Exit;
          3: if ALoopCallBackFunc3(LMatchs34, nExecPos) then Exit; // 这里需自行解决 nExecPos 的合法性[可能会死循环]
          4: if ALoopCallBackFunc4(LMatchs34, nExecPos) then Exit; // 这里需自行解决 nExecPos 的合法性[可能会死循环]
        end;
      until not LRegExpr.ExecPos(nExecPos);
    except
      Result := -1;
    end;
  finally
    LRegExpr.Free();
    LMatchs12.Free();
    LMatchs34.Free();
  end;
end;

{ TClassFunctionBase }

constructor TClassFunctionBase.Create; begin end;
class function TClassFunctionBase.ClassInfo: Pointer; begin end;
class function TClassFunctionBase.ClassName: string; begin end;
class function TClassFunctionBase.ClassNameIs(const Name: string): Boolean; begin end;
class function TClassFunctionBase.ClassParent: TClass; begin end;
class function TClassFunctionBase.GetInterfaceEntry(const IID: TGUID): PInterfaceEntry; begin end;
class function TClassFunctionBase.GetInterfaceTable: PInterfaceTable; begin end;
class function TClassFunctionBase.InheritsFrom(AClass: TClass): Boolean; begin end;
class function TClassFunctionBase.InitInstance(Instance: Pointer): TObject; begin end;
class function TClassFunctionBase.InstanceSize: Longint; begin end;
class function TClassFunctionBase.MethodAddress(const Name: ShortString): Pointer; begin end;
class function TClassFunctionBase.MethodAddress(const Name: string): Pointer; begin end;
class function TClassFunctionBase.MethodName(Address: Pointer): string; begin end;
class function TClassFunctionBase.NewInstance: TObject; begin end;
class function TClassFunctionBase.UnitName: string; begin end;

{ TRegExprMatchInfo }

function TRegExprMatchInfo.GetIsValueEmpty: Boolean;
begin
  Result := SameStr(sValue, EmptyStr);
end;

procedure TRegExprMatchInfo.Init;
begin
  sValue := EmptyStr;
  nPos := -1;
  nLen := -1;
end;

{ TRegExprMatchList }

procedure TRegExprMatchList.Assign(ASource: TRegExprMatchList);
var
  I: Integer;
begin
  Self.Clear();
  if Assigned(ASource) then
  for I := 0 to ASource.Count - 1 do
    Self.Add(ASource.Items[I]);
end;

constructor TRegExprMatchList.Create(AsInput: string);
begin
  inherited Create();
  FsInput := AsInput;
end;

function TRegExprMatchList.GetItem(Index: Integer): TRegExprMatchInfo;
begin
  if (Index < 0) or (Index >= Count) then
    Result.Init()
  else
    Result := inherited Items[Index];
end;

function TRegExprMatchList.ReplaceMatchValue(Index: Integer;
  AsReplaceStr: string): string;
var
  LMatch: TRegExprMatchInfo;
begin
  if Index = 0 then
    Exit(AsReplaceStr);

  Result := EmptyStr;
  LMatch := Items[Index];
  Result := Copy(FsInput, 1, LMatch.nPos - 1);
  Result := Result + AsReplaceStr;
  Result := Result + Copy(FsInput, LMatch.nPos + LMatch.nLen, Length(FsInput));
end;

procedure TRegExprMatchList.SetItem(Index: Integer;
  const Value: TRegExprMatchInfo);
begin
  inherited Items[Index] := Value;
end;

{ TObjectListDictionary<TKey, TValue> }

constructor TObjectListDictionary<TKey, TValue>.Create(const AComparer:
  IEqualityComparer<TKey>);
begin
  CreateBefore;
  inherited Create(AComparer);
end;

constructor TObjectListDictionary<TKey, TValue>.Create(ACapacity: Integer = 0);
begin
  CreateBefore;
  inherited Create(ACapacity);
end;

constructor TObjectListDictionary<TKey, TValue>.Create(ACapacity: Integer;
  const AComparer: IEqualityComparer<TKey>);
begin
  CreateBefore;
  inherited Create(ACapacity, AComparer);
end;

constructor TObjectListDictionary<TKey, TValue>.Create(Collection:
  TEnumerable<TPair<TKey,TValue>>; const AComparer: IEqualityComparer<TKey>);
begin
  CreateBefore;
  inherited Create(Collection, AComparer)
end;

constructor TObjectListDictionary<TKey, TValue>.Create(Collection:
  TEnumerable<TPair<TKey,TValue>>);
begin
  CreateBefore;
  inherited Create(Collection);
end;

procedure TObjectListDictionary<TKey, TValue>.CreateBefore;
begin
  FKeyList := TList<TKey>.Create();
end;

destructor TObjectListDictionary<TKey, TValue>.Destroy;
begin
  FreeAndNil(FKeyList);
  inherited;
end;

function TObjectListDictionary<TKey, TValue>.GetItem_ByIndex(const Index:
  Integer): TValue;
begin
  Result := Items[Keys_ByIndex[Index]];
end;

function TObjectListDictionary<TKey, TValue>.GetKey_ByIndex(const Index:
  Integer): TKey;
begin
  if Assigned(FKeyList) then
    Result := FKeyList.Items[Index];
end;

procedure TObjectListDictionary<TKey, TValue>.KeyNotify(const Key: TKey;
  Action: TCollectionNotification);
begin
  if Assigned(FKeyList) then
  case Action of
    cnAdded: FKeyList.Add(Key);
    cnRemoved, cnExtracted: FKeyList.Remove(Key);
  end;
  inherited;
end;

procedure TObjectListDictionary<TKey, TValue>.Remove_ByIndex(const Index:
  Integer);
begin
  inherited Remove(Keys_ByIndex[Index]);
end;

procedure TObjectListDictionary<TKey, TValue>.SetItem_ByIndex(const Index:
  Integer; const Value: TValue);
begin
  Items[Keys_ByIndex[Index]] := Value;
end;

constructor TObjectListDictionary<TKey, TValue>.Create(Ownerships:
  TDictionaryOwnerships; ACapacity: Integer = 0);
begin
  CreateBefore;
  inherited Create(Ownerships, ACapacity);
end;

constructor TObjectListDictionary<TKey, TValue>.Create(
  Ownerships: TDictionaryOwnerships; const AComparer: IEqualityComparer<TKey>);
begin
  CreateBefore;
  inherited Create(Ownerships, AComparer);
end;

constructor TObjectListDictionary<TKey, TValue>.Create(
  Ownerships: TDictionaryOwnerships; ACapacity: Integer;
  const AComparer: IEqualityComparer<TKey>);
begin
  CreateBefore;
  inherited Create(Ownerships, ACapacity, AComparer);
end;

procedure TObjectListDictionary<TKey, TValue>.SortList(const AComparer:
  IComparer<TKey>);
begin
  if Assigned(FKeyList) then
    FKeyList.Sort(AComparer);
end;

function CheckMultiXyCl(): Boolean;
begin

end;

initialization

FirstSVNVersion := 20000;

end.
