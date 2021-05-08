{ ******************************************************* }
{ }
{ PMSS5.0 }
{ Author:李锋 }
{ 时间:2010 }
{ 功能描述:pmData单元     数据集 视图 等类定义单元 }
{ 版权所有 (C) 2010 PmSoft }
// update
// 2011 3.8 由于只要实现 单个专业工作的撤销工作， 为了使程序 稳定 去掉 state_info 字段中的   TStateInfo 类存放信息
// 2012-3-26 lifeng 修改数据层上下移动时 没有进行索引记录的清空，导致主从表顺序错误
// 2013-7-23 lifeng 修改数据修改维护索引时 有可能报错的问题
// 2013-8-9 lifeng 修改当记录指针为空的时候抛出异常的问题
// 2013-09-06 lifeng 修改设置double类型字段时有可能报错的问题
// 2013-09-23 lifeng  修改设置double类型字段设置NAN值的问题
// 2013-09-25 lifeng  模板转换时修改设置double类型字段设置NAN值的问题
// 2013-12-04 hwf 修改SaveViewToXML保存数据时，对转义字符进行转换
// 2013-12-18 lifeng 修改设置值时 指针为空则跳出
// 2015-5-12 Wenxh 修正：数据库字段创建时，重复字段会重复创建导致报错的问题
// 2015-10-09 Wenxh 修正：TDataSet保存时可能会导致字段丢失的问题
{ ******************************************************* }
unit uPMData;

interface

uses
{$IFDEF DELPHI12}
  DBPlatform,
{$ENDIF}
  DB, Classes, PMdxmdaset, IniFiles, Variants,
  Hashes2, Dialogs, PMdxCore, uPMDataIntf, DBConsts, Windows,
  SysUtils,
  TypInfo, uBaseDataSource, uPMDataConst, Generics.Collections;

const
  DefaultFile = 'Default';

type

  TState = (sMemery, sStream, sFree);
  TLevelChangMod = (lcRise, lcDrop);
  TPMRecStatus = (recDefault, recTempClear);

  TPMDataView = class;
  TPMDataSet = class;
  TPMNode = class;
  TDataStateManger = class;
  TPMLinkView = class;
  TPMLinkDetailView = class;
  TPMDetailView = class;
  TPmViewStreamWrite = class;
  TOnPushState = procedure(DataStateList: TDataStateManger) of object;
  TPmBeforeSaveStruct = function(AField: string): string of object;

  TRecChangInfo = record
    Rec: Pointer;
    OppRec: Pointer;
    PmNode: IPMNode;
    RecIndex: Integer;
    OppRecIndex: Integer;
    ChangeType: TPMChangType;
    FieldName: string;
  end;

  TRecIndexInfo = class
    // 索引信息
    BeginPosion: Integer; // 起始位置
    EndPosion: Integer; // 结束位置
  end;

  TTempRec = class
  private
    bObjectInList: Boolean;
    PmRecList: TList; // 从表情况下记录 集合
  public
    procedure AddToList(ARec: Pointer; AList: TList);
    constructor Create;
    destructor Destroy; override;
  end;

  TFieldLinkView = class
    // 关联字段类定义
  private
    // 本身字段名
    FSelfFieldName: string;
    // 关联View字段名
    FFieldName: string;
    // 视图
    FView: TPMLinkView;
    // 是否关联
    FLinked: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function GetValue(KeyValue: string; DefaultValue: Variant;
      Rec: Pointer): Variant;
    procedure SetValue(Value: Variant; KeyValue: string; Rec: Pointer;
      PmNode: IPMNode);
    property FieldName: string read FFieldName write FFieldName;
    property View: TPMLinkView read FView write FView;
    property Linked: Boolean read FLinked write FLinked;
    property SelfFieldName: string read FSelfFieldName write FSelfFieldName;
  end;

  TFieldRWBase = class
  private
    // 记录索引
    FRecIndex: Integer;
    // 字段索引 不包括 blob类型字段
    FFieldIndex: Integer;
    // 全部字段索引
    FAllFieldIndex: Integer;
    // 数据集
    FDataSet: TPMDataSet;
    // 字段对象
    FField: TField;
    // blob的偏移量
    FOffSet: Integer;
    // 显示名称
    FDisplayName: string;
    // 字段类型
    FFieldType: TPMFieldType;

    function CheckVar(v: Variant; Ftype: TPMFieldType; bNull: Boolean): Boolean;
    procedure SetDisplayName(const Value: string);
    function GetDisplayName: string;
    procedure SetField(const Value: TField);
  public
    constructor Create(ADataSet: TPMDataSet);
    procedure FindRecIndex(Buffer: Pointer; RecIndex: Integer = -1);
    function Read(PmRec: TPmRec; DefaultValue: Variant; RecIndex: Integer = -1)
      : Variant; virtual; abstract;
    function write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
      RecIndex: Integer = -1): TPmRec; virtual; abstract;
  public
    property RecIndex: Integer read FRecIndex write FRecIndex;
    property FieldIndex: Integer read FFieldIndex write FFieldIndex;
    property AllFieldIndex: Integer read FAllFieldIndex write FAllFieldIndex;
    property DataSet: TPMDataSet read FDataSet write FDataSet;
    property Field: TField read FField write SetField;
    property DisplayName: string read GetDisplayName write SetDisplayName;
    property FieldType: TPMFieldType read FFieldType write FFieldType;
  end;
  TFieldRWBase_Class = class of TFieldRWBase;

  TIntFieldRW = class(TFieldRWBase)
  public
    function Read(PmRec: TPmRec; DefaultValue: Variant; RecIndex: Integer = -1)
      : Variant; override;
    function ReadAsInteger(PmRec: TPmRec; DefaultValue: Integer): Integer;
    function write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
      RecIndex: Integer = -1): TPmRec; override;
    procedure SetInt(Value: Integer);
    procedure WriteValueBuffer(Buffer: Pointer; Value: Integer);
  end;

  TDouFieldRW = class(TFieldRWBase)
  public
    function Read(PmRec: TPmRec; DefaultValue: Variant; RecIndex: Integer = -1)
      : Variant; override;
    function ReadAsDouble(PmRec: TPmRec; DefaultValue: Double): Double;
    function write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
      RecIndex: Integer = -1): TPmRec; override;
    procedure SetDou(Value: Double);
    procedure WriteValueBuffer(Buffer: Pointer; Value: Double);
    function writeAsDouble(Value: Double; PmRec: TPmRec; bNull: Boolean;
      RecIndex: Integer = -1): TPmRec;
  end;

  TBooFieldRW = class(TFieldRWBase)
  public
    function Read(PmRec: TPmRec; DefaultValue: Variant; RecIndex: Integer = -1)
      : Variant; override;
    function ReadAsBoolean(PmRec: TPmRec; DefaultValue: Boolean): Boolean;
    function write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
      RecIndex: Integer = -1): TPmRec; override;
    procedure SetBoolean(Value: Boolean);
    procedure WriteValueBuffer(Buffer: Pointer; Value: Boolean);
  end;

  TShortStrFieldRW = class(TFieldRWBase)
  public
    function Read(PmRec: TPmRec; DefaultValue: Variant; RecIndex: Integer = -1)
      : Variant; override;
    function write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
      RecIndex: Integer = -1): TPmRec; override;
    procedure WriteValueBuffer(Buffer: Pointer; Value: string);
  end;

  TMemFieldRW = class(TFieldRWBase)
  public
    function Read(PmRec: TPmRec; DefaultValue: Variant; RecIndex: Integer = -1)
      : Variant; override;
    function ReadAsString(PmRec: TPmRec; DefaultValue: string): string;
    function write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
      RecIndex: Integer = -1): TPmRec; override;
  end;

  /// <summary>
  /// 以wide方式读写(其实是 将AnsiString 转为UTF-8编码读写)
  /// </summary>
  TMemFieldRW_Wide = class(TFieldRWBase)
  public
    function Read(PmRec: TPmRec; DefaultValue: Variant; RecIndex: Integer = -1):
      Variant; override;
    function ReadAsString(PmRec: TPmRec; DefaultValue: string): string;
    function write(Value: Variant; PmRec: TPmRec; bNull: Boolean; RecIndex: Integer
      = -1): TPmRec; override;
  end;

  TStateInfo = class
  private
    // 自身 buffer指针  dataset的buffer队列
    FSelfBuffer: Pointer;
    // 引用计数
    FRef: Integer;
    // 被该对象所描述的 buffer 目前的 状态  内存中或者 被序列化到磁盘
    FState: TState;
  protected
    procedure AddRef;
    function DetetRef(AData: TPMDataSet): Boolean;
  public
    constructor Create;
    property SelfBuffer: Pointer read FSelfBuffer write FSelfBuffer;
    property State: TState read FState write FState;
  end;

  TDataStateBase = class
  private
    FOppRec: Pointer;
    FRec: Pointer;
    function FindAdress(AData: TPMDataSet): Integer;
    procedure ReDo(AData: TPMDataSet); virtual;
    procedure UnDo(AData: TPMDataSet); virtual;
    procedure DecStateInfo(AData: TPMDataSet; StateStatus: TPMStateStatus);
    procedure CheckFree(AData: TPMDataSet; StateStatus: TPMStateStatus);
    procedure CheckStateInfo(AData: TPMDataSet); virtual;
    function GetRecord: Pointer;
    procedure SetRecord(Value: Pointer);
  public
    constructor Create(ARec: Pointer);
    destructor Destroy; override;
    property Rec: Pointer read FRec write FRec;
    // property StateInfo: TStateInfo read FStateInfo write FStateInfo;
  end;

  TRecordChanged = class(TDataStateBase)
  private
    // 修改的字段名
    FFiledName: string;
    // 老值
    FOldValue: string;
    // 新值
    FNewValue: string;
  protected
    procedure ReadBufferIndex(AData: TPMDataSet);
  public
    procedure ReDo(AData: TPMDataSet); override;
    procedure UnDo(AData: TPMDataSet); override;
  end;

  TRecordDelete = class(TDataStateBase)
  public
    procedure ReDo(AData: TPMDataSet); override;
    procedure UnDo(AData: TPMDataSet); override;
  end;

  TRecordInsert = class(TDataStateBase)
  public
    procedure ReDo(AData: TPMDataSet); override;
    procedure UnDo(AData: TPMDataSet); override;
  end;

  TRecordMove = class(TDataStateBase)
  public
    procedure ReDo(AData: TPMDataSet); override;
    procedure UnDo(AData: TPMDataSet); override;
  end;

  TDataStateManger = class(TInterfacedObject, IDataState)
  private
    FStateList: TList;
    FOwner: TPMDataSet;
    FStatus: TPMStateStatus;

    function GetCount: Integer;
  protected
    procedure Add(DataState: TDataStateBase);
    function isHaveChangRec(IndexList: TList): Boolean;
    procedure SaveRecIndex(AList: Pointer);
    procedure RecoverRecBufferByIndex(AList: Pointer);
  public
    procedure Notify(Rec, OppRec: Pointer; NewValue, OldValue: string;
      ChangType: TPMChangType; RecIndex: Integer; FieldName: string = '');
    constructor Create(AData: TPMDataSet);
    destructor Destroy; override;
    function GetState: TPMStateStatus;
    procedure UnDo;
    procedure ReDo;
    function IsHaveMoveStats: Boolean;
    function GetDataSet: IPMDataset;
    property Count: Integer read GetCount;
    property List: TList read FStateList;
  end;

  // HASH表管理基类
  TObjectHashMapMgr = class
  public
    // 添加对象
    procedure AddObject(AKey: string; AObject: TObject); virtual; abstract;
    // 删除KEY
    procedure Remove(AKey: string); virtual; abstract;
    // 获取对象
    function GetObject(AKey: string): TObject; virtual; abstract;
    // 判断是否存在该KEY
    function Exist(AKey: string): Boolean; virtual; abstract;

  end;

  // 基于DGL库
  { TFieldMgr_Dgl = class(TFieldMgr)
    private
    FList: TStrIntHashMultiMap;
    procedure FreeDglObjecHash;
    public
    procedure AddField(AFieldName: string; AField: TFieldRWBase); override;
    function GetFieldObject(AFieldName: string): TFieldRWBase; override;
    function ExistField(AFieldName: string): Boolean; override;
    constructor Create;
    destructor Destroy; override;
    end; }

  // 基于ＸＥ TDictionary
  TStrIntHashMgr_Dic = class(TObjectHashMapMgr)
  private
    FList: TDictionary<string, TObject>;
    procedure FreeObject;
  public
    procedure AddObject(AKey: string; AObject: TObject); override;
    procedure Remove(AKey: string); override;
    function GetObject(AKey: string): TObject; override;
    function Exist(AKey: string): Boolean; override;
    constructor Create;
    destructor Destroy; override;
  end;

  TIntHashMgr_Dic = class(TObjectHashMapMgr)
  private
    FList: TDictionary<Integer, TObject>;
    procedure FreeObject;
  public
    procedure AddObject(AKey: string; AObject: TObject); override;
    procedure Remove(AKey: string); override;
    function GetObject(AKey: string): TObject; override;
    function Exist(AKey: string): Boolean; override;
    constructor Create;
    destructor Destroy; override;
  end;

  TPMDataSet = class(TdxCustomMemData, IPMDataset)
  private
    //
    FOwner: TObject;
    // 开始设置值
    FbBeginChang: Boolean;
    // DataSet的唯一标识符
    FGuid: string;
    // 表名
    FTableName: string;
    // 数据集属性列表
    FAttributeHash: TStringHash;
    // 数据集对象属性列表
    FAttributeObjectHast: TObjectHash;
    // 不是blob类型的index
    FHashIndex: Integer;
    // blob类型的offset
    FBlobOffSetIndex: Integer;
    // 字段对象 hash表
    FObjectFieldHash: TObjectHashMapMgr;

    FFieldClassList: TList;

    // *****************************
    // 由字段名做key的记录的索引 hash表   (在 只载入索引 不载入数据的情况下使用)
    FRecIndexHash: TObjectHash;
    // 加载数据索引 后 索引存放的 hash表
    FRecIndexHashInUser: TObjectHash;

    // **************************************
    // 记录hash表 列表
    FFieldHash_RecHash: TObjectHash;
    // 字段索引hash表
    FFieldHash: TIntegerHash;
    // 记录索引
    FRecIndex: Integer;
    // 字段名列表
    FFieldList: TStringList;
    // 数据集视图 列表
    FDataViewList: TList;
    // 是否通知更新
    FNotifyChanged: Boolean;
    // 修改数据时 是否执行内部事件
    FNotifyChangeEvent: Boolean;
    // 是否记录 state
    FMarkState: Boolean;
    // 触发变更的view
    FChangedView: Pointer;
    // State对象 每次变更的记录
    FDataStateManger: TDataStateManger;
    // 外部使用的 DataStateManger接口队列
    FDataStateList: TInterfaceList;
    // 内部管理的 DataStateManger队列
    FSelfManageStateList: TList;
    // 产生的State数量
    FManageStateCount: Integer;
    // 修改记录在SelfManageStateList中的Index
    FStateIndexList: TList;
    // 内部的修改index
    FStateChangRecIndexList: TList;
    // 过程属性 DataStateManger生成时推送
    FPushStateList: TOnPushState;
    // 导入自定义文件时  字段生成方式
    FFieTypeByImport: TFieldTypeByImport;
    // 该表是否 有level字段 即是否 支持树状
    FLevel: Boolean;
    // dataset 是否更改过
    FChanged: Boolean;
    // 数据集是否修改过 ， 只读
    FInternalChanged: Boolean;
    // 是否已经存在 stateinfofield字段
    FbHaveStateField: Boolean;

    // 此字段用于 ADO模式主从
    FADOMasterField: string;
    // 与主表关联的字段
    FADOKeyValue: string;
    // 主表数据集
    FMasterData: TPMDataSet;
    // 主表 DataSource
    FMasterSource: TDataSource;

    FMasterDataLink: TMasterDataLink;
    FOnAfterMasterScroll: TOnAfterMasterScroll;
    FDataSource: TDataSource;
    // --------------------------------- 以下用于PM模式主从
    // 从表数据集
    FDetailDataSet: TPMDataSet;
    // 关联值  id=id1 样式
    FDetailMaster: string;
    // 从表字段
    FDetailField: string;
    // 主表字段
    FMasterField: string;
    // 是否为某张表的 从表
    FDetail: Boolean;
    // ------------------------------------------------

    // 该dataset是否清空
    FDataEmpty: Boolean;
    // 数据记录 状态
    FRecStatus: TPMRecStatus;
    // 是否有被state的记录
    FbHaveStateRecord: Boolean;
    // 是否记录日记
    FLog: Boolean;
    // 日记文件
    FLogFile: string;
    // 过滤事件
    FPMFilterRecordEvent: TPMFilterRecordEvent;
    // 流读取对象
    FReadStream: TdxMemDataStreamReader;
    // 只加载 数据集索引的情况下保存 该流   该对象 需要内部管理
    FStream: TStream;
    // 加载索引状态下
    FLoadIndex: Boolean;
    // 撤销前进响应事件
    FOnAfterUnReDo: TOnAfterUnReDo;
    // 数据结构加载完成后通知
    FAfterLoadStruct: TNotifyAfterLoadStruct;

    FSortField: string;
    FBeforeSaveStruct: TPmBeforeSaveStruct;

    FMaxValueField: string;
    // 字段最大值   字段必须为int 类型
    FMaxValue: Integer;
    // 建立hash的类型  hash2 还是inifile中的HASH
    FHashMod: TPMRECHashMod;
    // 刷新界面开关
    FDisplayUiState: Boolean;
    // 临时的 记录容器 （被修改过并且在撤销队列里，然后被执行释放指针的记录）
    FTempStateChangedRecList: TList;

    FHaveStatus: Boolean;
    // ***********************************************
    // **********************************************
    FOnAfterSetValue: TOnFieldValueChanged;
    FNotifyValueChanged: Boolean;
    // FCurrentFieldName: string;
    // FLastFieldRW: TFieldRWBase;
  private
    procedure InternalInit;
    procedure InternalClearStreamHash;
    procedure InternalClearStreamHashObject;
    procedure FreeRec(Rec: Pointer; bAddToTeampList: Boolean = False);
    procedure SetValue(FieldIndex, RecIndex: Integer; Buffer: Pointer);
    /// <summary>
    /// 保存文件结构到流
    /// </summary>
    /// <param name="Stream">流对象</param>
    /// <param name="bSaveResult">保存状态 False=保存出错, True=保存成功</param>
    /// <returns>文件大小</returns>
    function SaveStructureToStream(Stream: TStream; var bSaveResult: Boolean):
      Integer;
    procedure SaveRecIndexToStream(Stream: TStream);

    procedure NotifyUpdate(Rec: Pointer; PmNode: IPMNode;
      NewValue, OldValue, FieldName: string);
    procedure NotifyDelete(Rec: Pointer; RecIndex: Integer;
      bInternal: Boolean = False);
    procedure NotifyAdd(Rec, OppRec: Pointer; RecIndex, OppRecIndex: Integer;
      ChangType: TPMChangType; bInternal: Boolean = False);
    procedure NotifyMoveto(SoucNode, DestNode: IPMNode; AMoveMode: TMoveMode);

    procedure OnFilterprocedure(DataSet: IPMDataset; Index: Integer;
      var Accept: Boolean);
    function GetFilterRecList(AFilterList, AFilterBuffList: TList)
      : Boolean; override;
    procedure DataChangedEvent(Event: TPMChangType; Rec: Pointer = nil;
      FieldName: string = ''; NewValue: string = ''; OldValue: string = '';
      bInternal: Boolean = False);
    procedure MasterChanged(Sender: TObject);
    procedure MasterDisabled(Sender: TObject);
    procedure CreateRecHash(Field: string; Hash: TObjectHashMapMgr);
    procedure SetDetailDataset(AData: TPMDataSet);
    procedure ReplaceRec(RecIndex: Integer; Rec: Pointer);
    procedure SerializedRecIndex;
    procedure SerializedRec;
    procedure DeserializeState;
    procedure DeserializeRec;

    procedure CreateStateField;
    procedure FreeStateIndexList;
    procedure SetManageStateCount(Value: Integer);
    procedure InternalLog(Msg: string);

    procedure InternalFreeIndexObject;

    function InternalGetLevel(Rec: Pointer): Integer;
    procedure CopyAtt(ASource: IPMDataset);
    procedure DoSortByField(List: TList; sField: string; ExhangeList: TList;
      ComparType: TPmComparerType);
    procedure FindMaxValue;

    function IsChildRec(AFatherRec, AChildRec: Pointer): Boolean;
    function GetRecHash: TObject;

    procedure AfterAddFieldByFromDataSet(AField: TField); override;
  protected

    procedure OnAfterMasterScroll(ARec: Pointer; AMasterData: IPMDataset);
    procedure DeleteView(PMView: TPMDataView);
    procedure StateInsertRec(Rec: Pointer);
    procedure InternalInsertBefore_ByIndex(Rec: Pointer; Index: Integer);
    function InternalMoveSigleRec(Rec, OppRec: Pointer): Pointer;
    procedure InternalInsertBefore_ByOppRec(Rec, OppRec: Pointer);

    procedure RefreshRec(PmNode: IPMNode; AData: Pointer); // 更新界面 同时替换记录指针

    function InternalDeleteRow(Index: Integer): Pointer; overload;
    function InternalDeleteRow(Rec: Pointer): Pointer; overload;

    procedure CreateRecIDField; override;
    procedure CheckFiletrRecodrd(index: Integer;
      var Accepted: Boolean); override;

    procedure SaveViewToFile(FileName: string; AView: TPMDataView);

    procedure MoveRecByLevel(Rec: Pointer; AMoveMode: TMoveMode);
    procedure MoveTo(ASourceNode, ADestNode: IPMNode; AMoveMode: TMoveMode);
    procedure MoveSingleRecCross(Rec: Pointer; AMoveMode: TMoveMode);
    procedure SerializeRecIndex(BeginSize, EndSize: Integer;
      RecIndex: Integer = -1; Rec: Pointer = nil); override;
    procedure PmDoAFterScroll(ACurIndex: Integer); override;
    procedure NotfiyViewReConstructTree;

    procedure InternalClose; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RefreshViews;
    procedure ReConstructTree;
    procedure RefreshField(AFieldName: string);
    procedure BeginState;
    procedure EndState;
    function GetTableName: string;
    procedure SetTableName(const Value: string);

    function GetTableVariable: string;
    procedure SetTableVariable(const Value: string);

    function GetUserName: string;
    procedure SetUserName(const Value: string);

    procedure SetFieldVisible(FieldName: string; Value: Boolean);
    function GetFieldVisible(FieldName: string): Boolean;

    function GetAttributesAsString: string;
    procedure DeleteAtt(Key: string);

    function GetAttribute(Key: string): string; overload;
    function GetAttAsString(Key: string): string;
    function GetAttAsBoolean(Key: string): Boolean;
    function GetAttAsInteger(Key: string): Integer;
    procedure SetAttribute(Value: Variant; Key: string); overload;

    function IsExitsAtt(Key: string): Boolean;

    procedure SetAttribute(Key: string; AObject: TObject); overload;
    function GetObjectAttribute(Key: string): TObject;
    procedure SetAttribute(Key: string; AIntf: IUnknown); overload;
    function GetInfAttribute(Key: string): IUnknown;

    function GetFieldValue(FieldName: string; DValue: Variant;
      Rec: Pointer = nil): Variant; overload;

    function GetFieldValueAsDouble(FieldName: string; DValue: Double;
      Rec: Pointer): Double; overload;
    function GetFieldValueAsDouble(FieldIndex: Integer; DValue: Double;
      Rec: Pointer): Double; overload;
    function GetFieldValueAsInt(FieldName: string; DValue: Integer;
      Rec: Pointer): Integer;
    function GetFieldValueAsBoolean(FieldName: string; DValue: Boolean;
      Rec: Pointer): Boolean;
    function GetFieldValueAsString(FieldName: string; DValue: string;
      Rec: Pointer): string;
    procedure FastSetFieldValue(FieldName: string; Value: Variant;
      Rec: Pointer);

    function GetFieldValue(FieldName: string; DValue: Variant;
      RecIndex: Integer): Variant; overload;
    function SetFieldValue(FieldName: string; Value: Variant; Rec: Pointer;
      PmNode: IPMNode = nil): Boolean; overload;
    function SetFieldValue(FieldName: string; Value: Variant; RecIndex: Integer;
      PmNode: IPMNode = nil): Boolean; overload;

    procedure SetFieldValueAsDouble(FieldName: string; Value: Double;
      Rec: Pointer; PmNode: IPMNode = nil);
    procedure InternalSetFieldValue(FieldName: string; Value: Variant;
      Rec: Pointer);
    function GetFieldValueByRec(FieldName: string; Rec: Pointer): Variant;

    procedure AddField(FieldName: string; AType: TPMFieldType;
      Caption: string = '');
    function InsertAfter(OppRec: Pointer; Level: Integer = 0): Pointer;
    function InsertBefore(OppRec: Pointer; Level: Integer = 0): Pointer;
    procedure DeleteRow(Rec: Pointer; bFreeRec: Boolean = True);
    procedure DeleteAllRec;
    procedure Clear;
    procedure AddRecordData(ASourceData: IPMDataset; ARecList: TList);

  public
    function HasValue(FieldName: string; Rec: Pointer): Boolean;
    procedure SetHashMod(AValue: TPMRECHashMod);
    procedure NextRec;
    procedure SetEdit;
    function GetCurrentRec(RecIndex: Integer = -1): Pointer;
    function GetRecordCount: Integer; reintroduce;
    function GetFieldList: TStringList;
    function GetFieldTypeByName(FieldName: string): TPMFieldType;

    function GetDisplayUiStatus: Boolean;
    procedure SetChangedView(P: Pointer);
    procedure SetIndexInSream(FieldName: string);
    procedure SetIndex(FieldName: string; AHashMode: TPMRECHashMod = phNone;
      bReSet: Boolean = False);
    procedure DeleteAllIndex;
    procedure DeleteIndex(FieldName: string; bDelete: Boolean = True);
    function FindRec(FieldName, Value: string; bCreateIndex: Boolean = True)
      : Pointer; overload;
    function FindRec(FieldName: string; Value: Integer): Pointer; overload;
    procedure FindRecList(FieldName: string; Value: Integer;
      var RecList: TList); overload;
    procedure FindRecList(FieldName, Value: string; var RecList: TList;
      bCreateIndex: Boolean = True); overload;
    // 查找记录 列表
    function GetRecByFieldValue(FieldName: string; Value: Variant;
      BeginCurRec: Boolean = False): Pointer;
    function GetRecByFieldValues(AFields: array of string;
      AValues: array of string): Pointer;
    function GetInstance: TDataSet;
    function GetObject: Pointer;
    function GetLevelStatus: Boolean;
    procedure SetNotifyChanged(Value: Boolean);
    procedure SetNotifyChangeEvent(Value: Boolean);
    function GetRecList: TList;

    function GetMarkState: Boolean;
    procedure SetMarkState(const Value: Boolean);
    procedure SetOnAfterUnReDo(Value: TOnAfterUnReDo);

    procedure BeginUpdataUi;
    procedure EndUpdataui;

    procedure Exchanger(index1, Index2: Integer);

    procedure SetCustomMaxValue(AValue: Integer);
  public
    function GetDataState: TInterfaceList;
    procedure LoadAttribute(Stream: TStream);
    function LoadStructure(Stream: TStream): Boolean;
    function SaveAttributeToStream(Stream: TStream): Integer;
    function SaveStream(Stream: TStream): Boolean;

    procedure SaveDataToFile(FileName: string);
    function LoadStream(Stream: TStream): Boolean;
    procedure LoadRecIndex(Stream: TStream);
    procedure LoadDataFromFile(FileName: string);
    procedure SaveToCustomFile(FileName: string; cMark: char);
    procedure LoadFromCustomFile(FileName: string; cMark: char);
    procedure SetFieTypeByImport(Value: TFieldTypeByImport);
    procedure SaveViewToXML(FileName: string; AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string);
    function GetViewToXmlSource(AView: IPMDataView; AAttKeys: array of string;
      AValues: array of string): string;
    procedure CloseAllViewDisplayUi;
    procedure OpenAllViewDisplayUi;
    procedure RefreshViewsUi;
    function CheckDataHasChanged: Boolean;
    procedure SetDataChangeStatus(Value: Boolean);
    procedure SetMasterField(Value: string);
    procedure SetDetailMaster(Value: string);
    function GetDetailField: string;
    function GetDetailMaster: string;
    function GetPmMasterField: string;
    function GetMasterField: string;
    procedure SetMasterDataSource(ASource: TDataSource);
    procedure SetMasterDataSet(ADataSet: TDataSet);
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataset;
      Rec: Pointer): IPMDataView;
    function GetMasterDataSource: TDataSource;
    function CreateView(AViewType: TPMViewType = tDefault): IPMDataView;
    function GetExitView(bCreate: Boolean = True;
      AViewType: TPMViewType = tDefault): IPMDataView;
    function GetDataEmptyStatus: Boolean;
    procedure SetLogStatus(Value: Boolean);
    procedure SetLogFile(FileName: string);
    function CheckFieldExit(Field: string): Boolean;
    function CreateNewDataSet: IPMDataset;
    procedure CloneData(ASource: IPMDataset; bCloneField: Boolean = True);
    procedure CopyData(ASource: IPMDataset);
    function Clone: IPMDataset;
    procedure SetNotifyAfterLoadStruct(AEvent: TNotifyAfterLoadStruct);

    function GetDisplayName(FieldName: string): string;
    procedure SetDisplayName(DisplayName, FieldName: string);

    procedure InternalCopyData(ASource, ADest: Pointer); overload;
    procedure InternalCopyData(ASource, ADest: Pointer;
      ExceptField: array of string); overload;
    // 数据集加载数据结构结束后的通知事件

    procedure SetSortField(AField: string; ComparType: TPmComparerType);

    procedure SetMaxValueFile(AField: string);
    function MaxValue: Integer;
    procedure PostAllViewEdit;

    function GetViewByKeyValue(AKey, Value: string): IPMDataView;

    function GetViewCount: Integer;
    procedure InitRWCount;
    function GetRwCount: string;
    function GetViewByIndex(AIndex: Integer): IPMDataView;

    procedure SetOnFieldValueChanged(AEvent: TOnFieldValueChanged);
    procedure SetNotifyFieldValueChangedStatus(AValue: Boolean);
  public
    property RecHash: TObject read GetRecHash;
    property SelfManageStateList: TList read FSelfManageStateList;
    property ManageStateCount: Integer read FManageStateCount
      write SetManageStateCount;
    property FieldStringList: TStringList read GetFieldList;
    property DataStateManger: TDataStateManger read FDataStateManger;
    // property ObjectFieldHash: TStrIntHashMap read FObjectFieldHash;
    property FieldHash: TIntegerHash read FFieldHash;
    property RecStatus: TPMRecStatus read FRecStatus;
    property PMFilterRecordEvent: TPMFilterRecordEvent read FPMFilterRecordEvent
      write FPMFilterRecordEvent;
  published
    property DetailDataSet: TPMDataSet read FDetailDataSet
      write SetDetailDataset;
    property bNotifyChanged: Boolean read FNotifyChanged write SetNotifyChanged;
    property MarkState: Boolean read FMarkState write SetMarkState;
    property FieTypeByImport: TFieldTypeByImport read FFieTypeByImport
      write SetFieTypeByImport;
    property OnPushState: TOnPushState read FPushStateList write FPushStateList;
    property OnAfterUnReDo: TOnAfterUnReDo read FOnAfterUnReDo
      write FOnAfterUnReDo;
    property SelfTableName: string read GetTableName write SetTableName;
    property BeforeSaveStruct: TPmBeforeSaveStruct read FBeforeSaveStruct
      write FBeforeSaveStruct;
    property DataChanged: Boolean read FInternalChanged;
    property Owner: TObject read FOwner write FOwner;
    property bBeginChange: Boolean read FbBeginChang write FbBeginChang;
  end;

  TPMDataView = class(TInterfacedObject, IPMDataView)
  private
    //
    FTag: Integer;
    // 唯一标识
    FToKen: string;
    // view的主数据集
    FDataSet: TPMDataSet;
    // 记录列表
    FRecList: TList;
    // 查找时的当前记录
    FCurRecIndex: Integer;
    // 记录实际在 数据集中的 索引列表  只在 从表VIEW时排序所用
    FRecIndexList: TList;
    // 是否过滤
    FFilter: Boolean;
    // View的状态
    FStatus: TViewStatus;
    // 排序类型
    FSortOptions: TPMSortOptions;
    // 排序的字段
    FSortedField: string;
    // DataSource
    FDataSource: TBaseDataSource;
    // 是否支持树状
    FLevel: Boolean;
    // 过滤从表 的关联字段值
    FKeyValue: string;
    // 实际放在界面上的记录 列表  并已经构建了 树状
    FPMNodeList: TInterfaceList;
    // 是否需要构建树状
    FStructTree: Boolean;
    // 临时 PMNODE
    FTempNode: IPMNode;
    // 根Node
    FRoot: IPMNode;
    // 字段列表
    FFieldList: TStringList;
    // 修改前过程属性
    FOnBeforeSet: TOnBeforeSet;
    // 修改后过程属性
    FOnAfterSet: TOnAfterSet;
    // 删除记录时是否删除子节点   默认删除
    FDeleteChild: Boolean;

    FPMFilterRecordEvent: TPMFilterRecordEvent;
    // 是否显示界面
    FDisplayUi: Boolean;
    // 当该视图 是由 定额，清单材料库里出来的数据集创建时  有该属性 保持引用数
    FPmLibDataSet: IPMDataset;
    // beginend;界面的应用计算
    FRefeshUiRef: Integer;
    // 自己添加行是，任何情况下 都进行添加
    FAlawysAdd: Boolean;

    procedure ClearPmNode;

    function FindSiblingNode(ASourceNode, APosNode: IPMNode): IPMNode;
    procedure SetDataSet(const Value: IPMDataset;
      CopyData: Boolean = True); virtual;
    procedure ReAddRec(BufferList: TList); virtual;
    procedure AssignedRec(bDefault: Boolean = True);
    procedure DataChanged(Rec: Pointer); virtual;

    procedure OnSourceDataInsert(PmNode, oppNode: IPMNode;
      ChangType: TPMChangType; bFrist: Boolean = False); virtual;

    procedure OnDataDetete(Rec: Pointer; RecIndex: Integer; bInternal: Boolean;
      var Index: Integer); virtual;
    function OnDataUpdate(Rec: Pointer; PmNode: IPMNode;
      NewValue, OldValue, FieldName: string): Integer; virtual;
    function OnDataAdd(Rec, OppRec: Pointer; RecIndex, OppRecIndex: Integer;
      ChangType: TPMChangType; bInter: Boolean = False): IPMNode; virtual;
    function OnMoveTo(SourceNode, DestNode: IPMNode;
      AMoveMod: TMoveMode): Boolean;

    procedure DealLevel(Level: Integer; PmNode, lsNode: IPMNode);
    procedure CreateTempNode(Index: Integer = -1;
      ChangType: TPMChangType = cAddAfter);
    procedure StructTree(Rec: Pointer; PmNode: IPMNode);
    function ConstructorNode(Rec: Pointer; Index: Integer = -1)
      : IPMNode; virtual;
    function GetPMNodeIntf(Index: Integer): IPMNode;

    procedure SetSortedField(Value: string);
    function GetSortedField: string;
    procedure SetSortOptions(Value: TPMSortOptions);
    function GetSortOptions: TPMSortOptions;
    procedure SetDeleteChild(Value: Boolean);
    function GetDeleteChild: Boolean;

    function ExChangeParent(PmNode: IPMNode; AMoveMode: TMoveMode): Boolean;
    function ExChangParentCross(PmNode: IPMNode; AMoveMode: TMoveMode): Boolean;
    function ExChangeRecList(PmNode: IPMNode; AMoveMode: TMoveMode;
      var Index: Integer): Boolean;
    procedure ExChangerHashList(ARec: Pointer; AMoveMode: TMoveMode);
    procedure InternalChangeLevel(APMNode: IPMNode; AChangMod: TLevelChangMod);
  protected
    procedure ClearRef; virtual;
    procedure StructNodeTree;
    // -----------------关联字段 处理 函数
    function FindLinkView(FieldName: string; var AView: IPMDataView)
      : Boolean; virtual;
    procedure SetLinkField(FieldName, LinkFieldName: string;
      ALinkView: IPMDataView); virtual;
    procedure SetPrimaryKey(FieldName: string); virtual;
    function GetPrimaryKey: string; virtual;
    procedure SetForeignKey(FieldName: string); virtual;
    function GetForeignKey: string; virtual;
    function GetLinkRec(Value: string): Pointer; virtual;
    function GetFieldHash: TStringHash; virtual;
    function GetForeigLinkRec(Value: string): IPMNode; virtual;
    // ----------------------从表关联处理函数
    procedure SetMasterPrimaryField(const Value: string); virtual;
    function GetMasterPrimaryField: string; virtual;
    procedure setDetailPrimaryField(const Value: string); virtual;
    function GetDetailPrimaryField: string; virtual;
    function GetHideNoChildNode: Boolean; virtual;
    procedure SetHideNoChildNode(const Value: Boolean); virtual;
    procedure SetDetailView(AView: IPMDataView); virtual;
    procedure SetLinkRecrdAdd(Value: Boolean); virtual;
    procedure DisConnect; virtual;
    procedure InternalBeginUpdataUi;
    procedure InternalEndUpdataUi;
    procedure InternalReConstructTree;
  public
    constructor Create(ADataSet: IPMDataset); virtual;
    destructor Destroy; override;
    procedure SaveViewToFile(FileName: string);
    procedure SaveViewToXML(FileName: string);
    procedure SetFilterStatus(Value: Boolean);
    function GetFilterStatus: Boolean;
    procedure SetOnFilter(OnFilter: TPMFilterRecordEvent);
    function GetRecByFieldValue(FieldName: string; Value: Variant;
      BeginCurRec: Boolean = False): IPMNode;
    function FindPmNode(AKeyValueList: TStringList): IPMNode; overload;
    function FindPmNode(Conditions: array of string): IPMNode; overload;
    function FindPmNode(AKey, AValue: string): IPMNode; overload;
    procedure FindRecList(FieldName, Value: string; var RecList: TList;
      bCreateIndex: Boolean = False); overload;
    procedure FindRecList(FieldName, Value: string; var RecList: TInterfaceList;
      bCreateIndex: Boolean = False); overload;
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataset;
      AMainNode: IPMNode): IPMDataView; overload;
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet;
      AMainRec: Pointer): IPMDataView; overload;

    procedure SetOnbeforeSet(Value: TOnBeforeSet);
    procedure SetOnAfterSet(Value: TOnAfterSet);
    function GetOnBeforeSet: TOnBeforeSet;
    function GetOnAfterSet: TOnAfterSet;

    procedure Move(PmNode: IPMNode; AMoveMode: TMoveMode);
    procedure MoveCross(PmNode: IPMNode; AMoveMode: TMoveMode);
    function MoveTo(ASourceNode, ADestNode: IPMNode;
      AMoveMod: TMoveMode): Boolean;
    function MoveToNotiy(ASourceNode, ADestNode: IPMNode;
      AMoveMod: TMoveMode): Boolean;
    procedure Exchanger(index1, Index2: Integer);

    procedure RiseLevel(APMNode: IPMNode);
    procedure DorpLevel(APMNode: IPMNode);
    procedure DropSingle(APMNode: IPMNode);

    procedure DeleteRow(PmNode: IPMNode); virtual;
    procedure DeleteAll;
    function InsertAfter(PmNode: IPMNode; Level: Integer = 0): IPMNode; virtual;
    function InsertBefore(PmNode: IPMNode; Level: Integer = 0)
      : IPMNode; virtual;
    function AddChild(PmNode: IPMNode): IPMNode; virtual;
    function GetFieldValue(FieldName: string; DValue: Variant; PmNode: IPMNode)
      : Variant; virtual;

    function GetFieldValueAsString(FieldName: string; DValue: string;
      PmNode: IPMNode): string;
    function GetFieldValueAsInt(FieldName: string; DValue: Variant;
      PmNode: IPMNode): Integer;
    function GetFieldValueAsDouble(FieldName: string; DValue: Variant;
      PmNode: IPMNode): Double;
    function GetFieldValueAsBoolean(FieldName: string; DValue: Variant;
      PmNode: IPMNode): Boolean;

    function SetFieldValue(FieldName: string; Value: Variant; PmNode: IPMNode)
      : Boolean; virtual;

    procedure Clear;
    procedure RefreshViews; virtual;
    procedure RefreshViewsUi(bReBuild: Boolean = False); virtual;
    procedure RefreshField(AFieldName: string);
    procedure RefreshRec(PmNode: IPMNode);

    procedure SetNotifyChanged(Value: Boolean);
    procedure SetMarkState(Value: Boolean);
    function GetMarkState: Boolean;
    procedure SetDisplayUi(const Value: Boolean); virtual;
    function GetDisplayUi: Boolean;

    procedure SortByRecIndex;
    procedure SetChangedView;
    function GetTableName: string;
    function GetAttribute(Key: string): string;
    procedure SetAttribute(Value, Key: string);
    procedure SetDataSource(ASource: Pointer); virtual;

    procedure BeginState;
    procedure EndState;

    procedure BeginUpdateUi;
    procedure EndUpdateUi;

    function GetPmNode(ARec: Pointer): IPMNode;

    function GetObject: Pointer;
    function GetRecList: TList;
    function CheckLevel: Boolean;
    function GetState: TViewStatus;
    function GetFieldList: TStringList;
    function CheckFieldExist(Field: string): Boolean; virtual;
    function GetDataSet: IPMDataset;
    function GetRecCount: Integer;
    function GetDataState: TInterfaceList;
    procedure SetStructTree(Value: Boolean);
    function GetPMNodeList: TInterfaceList;
    function Root: IPMNode;
    procedure DeleteRelation;
    function GetUiNode(APMNode: IPMNode): Pointer;
    procedure CopyRecData(ASourceNode: IPMNode; ADestNode: IPMNode); overload;
    procedure CopyRecData(ASourceNode: IPMNode; ADestNode: IPMNode;
      ExceptField: array of string); overload;
    procedure CopyFromDataView(ASourceView: IPMDataView;
      CopyRecBefore: TCopyRecBefor; CopyRecAfter: TCopyRecAfter);
    procedure ADDStateList(AState: IDataState);
    procedure GetFilterView(FieldName, Value: string; AView: TPMDetailView);
    procedure ReConstructTree;
    function GetToken: string;
    procedure SetToKen(const Value: string);
    function GetPmNodeByRec(ARec: Pointer): IPMNode;
    procedure FilterByKeyValue(Keys, Values: array of string);
    procedure SetPmLibDataSet(APmLibDataSet: IPMDataset);
    procedure PostTreeEdit;
    function GetPmDataSource: Pointer;
    procedure CheckNodeRec;

    procedure SetTag(const ATag: Integer);
    function GetTag: Integer;
  public
    // property DataSet: TPMDataSet read FDataSet write SetDataSet;
    property RecList: TList read FRecList;
    property RecIndexList: TList read FRecIndexList;
    property FieldStringList: TStringList read GetFieldList;
    property RecordCount: Integer read GetRecCount;
    property SortOptions: TPMSortOptions read FSortOptions write FSortOptions;
    property SortedField: string read FSortedField write SetSortedField;
    property DataSource: TBaseDataSource read FDataSource write FDataSource;
    property OnBeforeSet: TOnBeforeSet read FOnBeforeSet write SetOnbeforeSet;
    property OnAfterSet: TOnAfterSet read FOnAfterSet write SetOnAfterSet;
    property SelfTableName: string read GetTableName;
    property ToKen: string read FToKen write SetToKen;
    property Tag: Integer read GetTag write SetTag;
  end;

  TPMLinkView = class(TPMDataView)
  private
    // 关联指向的视图列表
    FToLinkView: TList;
    // 本身字段和 link字段的对应
    FField_LinkField: TStringHash;
    // 本身字段和关联字段对象的对应Hash表
    FField_LinkObject: TObjectHash;
    // 关联的View列表  注意：这些VIEw不能 被绑定到 界面上 (使用接口队列防止被释放)
    FLinkedViewList: TInterfaceList;
    // 是否关联别的数据集
    FLinked: Boolean;
    // 是否被关联到其他view
    FToLinked: Boolean;
    // 主键 字段 用来关联时定位   被关联时设置该字段
    FPrimaryKey: string;

    // 外键 用来和关联表 关联   关联别的表时 设置该字段
    FForeignKey: string;
    // 临时主键值
    FPriValue: string;
    // 临时外键值
    FForeValue: string;
    // 从表主键字段
    FDetailField: string;

    procedure CreateSelfField;
    procedure CreateSelfFieldHash; virtual;
    procedure ReAddRec(BufferList: TList); override;
    // procedure CreateRecHash(HashList: THashedStringList; Key: string);
    procedure OnDetailViewUpdate(Rec: Pointer; PmNode: IPMNode;
      RecIndex: Integer; OldValue, NewValue, FieldName: string); virtual;
    procedure OnDetailViewAdd(Rec: Pointer; PmNode: IPMNode); virtual;
    procedure OnDetailViewDelete; virtual;

    procedure OnDataDetete(Rec: Pointer; RecIndex: Integer; bInternal: Boolean;
      var Index: Integer); override;
    function OnDataUpdate(Rec: Pointer; PmNode: IPMNode;
      NewValue, OldValue, FieldName: string): Integer; override;
    function OnDataAdd(Rec, OppRec: Pointer; RecIndex, OppRecIndex: Integer;
      ChangType: TPMChangType; bInter: Boolean = False): IPMNode; override;
    function OnDataAddBefore(Rec: Pointer): Boolean; virtual;

  protected
    procedure DataChanged(Rec: Pointer); override;
    procedure ClearRef; override;
    function GetForeigLinkRec(Value: string): IPMNode; override;
    procedure AssignedLink(ASource: TPMLinkView);
    procedure DisConnect; override;
    procedure RefreshViews; override;
  public
    constructor Create(ADataSet: IPMDataset); override;
    destructor Destroy; override;

    function SetFieldValue(FieldName: string; Value: Variant; PmNode: IPMNode)
      : Boolean; override;
    function GetFieldValue(FieldName: string; DValue: Variant; PmNode: IPMNode)
      : Variant; override;
    procedure SetDataSource(ASource: Pointer); override;
    function FindLinkView(FieldName: string; var AView: IPMDataView)
      : Boolean; override;
    procedure SetLinkField(FieldName, LinkFieldName: string;
      ALinkView: IPMDataView); override;
    procedure SetPrimaryKey(FieldName: string); override;
    function GetPrimaryKey: string; override;
    procedure SetForeignKey(FieldName: string); override;
    function GetForeignKey: string; override;
    function GetLinkRec(Value: string): Pointer; override;
    function GetFieldHash: TStringHash; override;
    procedure SetDisplayUi(const Value: Boolean); override;
    property ToLinkView: TList read FToLinkView write FToLinkView;
  end;

  TPMLinkDetailView = class(TPMLinkView)
  private
    // 从表视图
    FDetailView: IPMDataView;
    // 主表主键值
    FMasterPrimaryField: string;
    // 从表主键值
    FDetailPrimaryField: string;
    // 隐藏没有从表数据的 记录
    FHideNoChildNode: Boolean;
    // 自有字段 hash表
    FFieldHashList: TIntegerHash;

    procedure CreateSelfFieldHash; override;
    function ConstructorNode(Rec: Pointer; Index: Integer = -1)
      : IPMNode; override;
    procedure FindDetailView(PmNode: IPMNode);
    procedure SetDataSet(const Value: IPMDataset;
      CopyData: Boolean = True); override;
    procedure OnDetailViewUpdate(Rec: Pointer; PmNode: IPMNode;
      RecIndex: Integer; OldValue, NewValue, FieldName: string); override;
    procedure OnDetailViewAdd(Rec: Pointer; PmNode: IPMNode); override;
    // procedure OnDetailviewDelete()
  public
    constructor Create(ADataSet: IPMDataset); override;
    destructor Destroy; override;

    procedure RefreshViewsUi(bReBuild: Boolean = False); override;
    procedure SetMasterPrimaryField(const Value: string); override;
    function GetMasterPrimaryField: string; override;
    procedure setDetailPrimaryField(const Value: string); override;
    function GetDetailPrimaryField: string; override;
    function GetHideNoChildNode: Boolean; override;
    procedure SetHideNoChildNode(const Value: Boolean); override;

    function CheckFieldExist(Field: string): Boolean; override;

    function SetFieldValue(FieldName: string; Value: Variant; PmNode: IPMNode)
      : Boolean; override;
    function GetFieldValue(FieldName: string; DValue: Variant; PmNode: IPMNode)
      : Variant; override;
    procedure DeleteRow(PmNode: IPMNode); override;
    function InsertAfter(PmNode: IPMNode; Level: Integer = 0): IPMNode;
      override;
    function InsertBefore(PmNode: IPMNode; Level: Integer = 0)
      : IPMNode; override;
    function AddChild(PmNode: IPMNode): IPMNode; override;

    procedure SetDetailView(AView: IPMDataView); override;
    property MasterPrimaryField: string read GetMasterPrimaryField
      write SetMasterPrimaryField;
    property DetailPrimaryField: string read GetDetailPrimaryField
      write setDetailPrimaryField;
    property HideNoChildNode: Boolean read GetHideNoChildNode
      write SetHideNoChildNode;
  end;

  TPmExtractDataView = class(TPMLinkDetailView, IExtractDataView)
  protected
    function ConstructorNode(Rec: Pointer; Index: Integer = -1)
      : IPMNode; override;
  public
    function ExtractPmNode(ARec: Pointer): IPMNode;
  end;

  TPMDetailView = class(TPMLinkDetailView) // 从表视图
  private
    // 是否被 主表关联显示
    FShowLinkDetail: Boolean;
    // 主表记录
    FMasterNode: TPMNode;
    // 从表添加记录 是否判断主键
    FLinkRecrdAdd: Boolean;
    // 当与主表关联显示时，从该View中二次 过滤
    FMasterView: TPMDataView;

  public
    procedure SetLinkRecrdAdd(Value: Boolean); override;
    constructor Create(ADataSet: IPMDataset); override;
    function OnDataAddBefore(Rec: Pointer): Boolean; override;
    procedure OnSourceDataInsert(PmNode, oppNode: IPMNode;
      ChangType: TPMChangType; bFrist: Boolean = False); override;
    procedure OnDetailViewUpdate(Rec: Pointer; PmNode: IPMNode;
      RecIndex: Integer; OldValue, NewValue, FieldName: string); override;
    procedure OnDetailViewDelete; override;
  end;

  TPMNode = class(TInterfacedObject, IPMNode)
  private
    // 记录buffer的指针
    FRec: Pointer;
    // 所属的view
    FOwenView: TPMDataView;
    // 子Node列表
    FChildNodeList: TList;
    // 界面上的 UInode
    FNode: Pointer;
    // 父级Node
    FParentNode: TPMNode;
    // 正在删除状态
    FDelete: Boolean;
    function GetChildCount: Integer;
    function GetChildNode(Index: Integer): IPMNode;
    procedure SetLevel(Value: Integer);
    function GetLevel: Integer;
    procedure SetNode(Value: Pointer);
    function GetUiNode: Pointer;
    function GetSelfPointer: Pointer;
    procedure SetDelete(Value: Boolean);
    function GetDelete: Boolean;
    function GetDetailLinkView: IPMDataView; virtual;
    procedure SetDetailLinkView(const Value: IPMDataView); virtual;
    procedure InternalAddFirstChild(APMNode: IPMNode);
    procedure InternalAddNexSibling(APMNode: IPMNode);
    procedure InternalAddChild(APMNode: IPMNode);
    procedure InternalDeleteChild(PmNode: IPMNode);
  protected
    function FindLastChildNode: IPMNode;
    function FindFirstChildNode: IPMNode;
    function GetChildLastestNode: IPMNode;
    procedure DeleteAll;
    procedure RemoveParent;
    procedure DeleteChild;
  public
    constructor Create(AView: TPMDataView; Rec: Pointer); virtual;
    destructor Destroy; override;
    procedure SetRec(ARec: Pointer);
    function GetRec: Pointer;
    function GetView: IPMDataView;
    function AddFirstChild: IPMNode;
    function AddChildPmNode: IPMNode;
    function AddNexSibling: IPMNode;
    // 添加下一个同级记录
    function AddPrevSibling: IPMNode;

    procedure SetParentNode(ANode: IPMNode);
    function GetParentNode: IPMNode;
    function GetChildNodeList: TList;
    function GetPrevSibling: IPMNode;
    function GetNextSibling: IPMNode;

    function GetNext: IPMNode;
    function GetPrev: IPMNode;

    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataset)
      : IPMDataView;
    procedure SetValue(Value: Variant; FieldName: string); virtual;
    procedure SetValueAsDouble(Value: Double; FieldName: string); virtual;
    procedure SetValueAsString(Value: string; FieldName: string); virtual;
    procedure SetValueAsInt(Value: Integer; FieldName: string); virtual;
    procedure SetValueAsBoolean(Value: Boolean; FieldName: string); virtual;
    function GetValue(FieldName: string; DefaultValue: Variant)
      : Variant; virtual;
    function GetValueAsString(FieldName: string; DefaultValue: string)
      : string; virtual;
    function GetValueAsInt(FieldName: string; DefaultValue: Integer)
      : Integer; virtual;
    function GetValueAsDouble(FieldName: string; DefaultValue: Double)
      : Double; virtual;
    function GetValueAsBoolean(FieldName: string; DefaultValue: Boolean)
      : Boolean; virtual;
    procedure SetToKen(Value: string); virtual;
    function IsChildNode(ANode: IPMNode): Boolean;

    procedure InitialValue;
    procedure MoveToSibling(ADestNode: IPMNode);
    procedure MoveToChild(ADestNode: IPMNode);
    procedure MoveToLastChild(ADestNode: IPMNode);
    procedure MoveToNext(ADestNode: IPMNode);
    procedure Rise;
    procedure Drop;
    procedure SetFoce;

    procedure Refresh;

    property Count: Integer read GetChildCount;
    property ChildNodes[Index: Integer]: IPMNode read GetChildNode;
    property Level: Integer read GetLevel write SetLevel;
    property UINode: Pointer read GetUiNode write SetNode;
  end;

  TPMLinkDetailNode = class(TPMNode)
  private
    FToKen: string;
    FDetailView: IPMDataView;
  public
    constructor Create(AView: TPMDataView; Rec: Pointer); override;
    destructor Destroy; override;
    function GetDetailLinkView: IPMDataView; override;
    procedure SetDetailLinkView(const Value: IPMDataView); override;

    procedure SetValue(Value: Variant; FieldName: string); override;
    procedure SetValueAsDouble(Value: Double; FieldName: string); override;
    procedure SetValueAsString(Value: string; FieldName: string); override;
    procedure SetValueAsInt(Value: Integer; FieldName: string); override;
    procedure SetValueAsBoolean(Value: Boolean; FieldName: string); override;
    function GetValue(FieldName: string; DefaultValue: Variant)
      : Variant; override;
    function GetValueAsString(FieldName: string; DefaultValue: string)
      : string; override;
    function GetValueAsInt(FieldName: string; DefaultValue: Integer)
      : Integer; override;
    function GetValueAsDouble(FieldName: string; DefaultValue: Double)
      : Double; override;
    function GetValueAsBoolean(FieldName: string; DefaultValue: Boolean)
      : Boolean; override;
    procedure SetToKen(Value: string); override;
  end;

  TPmViewStreamWrite = class(TdxMemDataStreamWriter)
    // 保存View到视图   二进制方式保存
  private
    FDataView: TPMDataView;
  public
    constructor Create(AMemData: TdxCustomMemData; AStream: TStream); override;
    procedure SaveData; override;
    property DataView: TPMDataView read FDataView write FDataView;
  end;

var
  _RedCount, _WirteRecCount: Integer;

implementation

uses uPmLibDataSet, uPMDataUtils,Math;
{ procedure FreeDglObjecHash(AHash: TStrIntHashMap);
  var
  itBegin, itEnd: IStrIntMapIterator;
  begin
  try
  itBegin := AHash.itBegin;
  itEnd := AHash.itEnd;
  while not itBegin.IsEqual(itEnd) do
  begin
  TObject(PInteger(itBegin.GetValue)).Free;
  itBegin.Next;
  end;
  AHash.Clear;
  except
  end;
  end;

  procedure FreeDglIntObjecHash(AHash: TIntHashMultiMap);
  var
  itBegin, itEnd: IIntMapIterator;
  begin
  itBegin := AHash.itBegin;
  itEnd := AHash.itEnd;
  while not itBegin.IsEqual(itEnd) do
  begin
  TObject(PInteger(itBegin.GetValue)).Free;
  itBegin.Next;
  end;
  AHash.Clear;
  end; }

{ -------------------------------------------------------------------------------
  过程名:    ClearObjectHash
  作者:      李锋
  日期:      2010.06.10
  参数:      AObject: TObjectHash
  返回值:    无
  功能描述:  释放ObjectHash中的对象
  ------------------------------------------------------------------------------- }

procedure ClearObjectHash(AObject: TObjectHash);
var
  Key: string;
begin
  if AObject = nil then
    Exit;
  AObject.Restart;
  while AObject.Next do
  begin
    Key := AObject.CurrentKey;
    AObject.Items[Key].Free;
  end;
  AObject.Clear;
end;

procedure ClearHasdStrList(AObject: THashedStringList);
begin
  AObject.Clear;
end;
{ -------------------------------------------------------------------------------
  过程名:    GetCharSize
  作者:      李锋
  日期:      2010.05.05
  参数:      AFieldType: TFieldType
  返回值:    Integer
  功能描述:  取AFieldType的字段SIZE值
  ------------------------------------------------------------------------------- }

function GetCharSize(AFieldType: TFieldType): Integer;
begin
  case AFieldType of
    ftString, ftGuid:
      Result := 1;
    ftWideString:
      Result := 2;
  else
    Result := 0;
  end;
end;

function StrLen(const S: Pointer; AFieldType: TFieldType): Integer;
begin
  Result := 0;
  case AFieldType of
    ftWideString:
      while (ReadWord(S, Result * GetCharSize(AFieldType)) <> 0) do
        Inc(Result);
    ftString, ftGuid:
      while (ReadByte(S, Result * GetCharSize(AFieldType)) <> 0) do
        Inc(Result);
  end;
end;

procedure CopyChars(ASource, ADest: Pointer; AMaxCharCount: Integer;
  AFieldType: TFieldType);
var
  ACharCount: Integer;
begin
  ACharCount := StrLen(ASource, AFieldType);
  if ACharCount > AMaxCharCount then
    ACharCount := AMaxCharCount;
  cxCopyData(ASource, ADest, ACharCount * GetCharSize(AFieldType));
  Shift(ADest, ACharCount * GetCharSize(AFieldType));
  cxZeroMemory(ADest, GetCharSize(AFieldType));
end;

{ TFieldRWBase }

{ -------------------------------------------------------------------------------
  过程名:    TFieldRWBase.CheckVar
  作者:      李锋
  日期:      2010.05.05
  参数:      v: Variant; Ftype: TPMFieldType
  返回值:    Boolean
  功能描述:  检查v 值是否符合规则
  ------------------------------------------------------------------------------- }

function TFieldRWBase.CheckVar(v: Variant; Ftype: TPMFieldType;
  bNull: Boolean): Boolean;
var
  s:string;
begin
  Result := True;
  if bNull then
  begin
    Result := False;
    Exit;
  end;
  case Ftype of
    fInt:
      if VarIsNumeric(v) then
        Exit;
    fDou:
      begin
         if (VarIsFloat(v)) or (VarIsNumeric(v)) then
         begin
           if v >= 0 then
             Exit;
           s:= V;
           if s = '' then
           begin
             Result := False;
             Exit;
           end
           else
           begin
             s:= V;
             s:= LowerCase(s);
             if (s = 'nan') or (s='-nan') or ( s = 'inf') or (s = '-inf') then
             begin
               Result := False;
               Exit;
             end;
           end;
           s:= LowerCase(s);
           if (s = 'nan') or (s='-nan') or ( s = 'inf') or (s = '-inf') then
           begin
             Result := False;
           end;
           Exit;
         end
         else
         begin
           s:= V;
           s:= LowerCase(s);
           if (s = 'nan') or (s='-nan') or ( s = 'inf') or (s = '-inf') then
           begin
             Result := False;
             Exit;
           end;
         end;
      end;
    fBoo:
      if VarIsNumeric(v) then
        Exit;
  end;
  if v <> '' then
    Exit;
  if v = '' then
    Result := False;
end;

constructor TFieldRWBase.Create(ADataSet: TPMDataSet);
begin
  DataSet := ADataSet;
end;

{ -------------------------------------------------------------------------------
  过程名:    TFieldRWBase.FindRecIndex
  作者:      李锋
  日期:      2010.05.05
  参数:      Buffer: Pointer; RecIndex: Integer
  返回值:    无
  功能描述:  通过记录指针查找记录所在队列的索引
  ------------------------------------------------------------------------------- }

procedure TFieldRWBase.FindRecIndex(Buffer: Pointer; RecIndex: Integer);
begin
  if RecIndex >= 0 then
  begin
    FRecIndex := RecIndex;
    Exit;
  end;
  if Buffer = nil then
    FRecIndex := DataSet.CurRec
  else
    FRecIndex := DataSet.Data.Values.IndexOf(Buffer);
end;

{ TIntFieldRW }

{ -------------------------------------------------------------------------------
  过程名:    TIntFieldRW.Read
  作者:      李锋
  日期:      2010.05.05
  参数:      Buffer: Pointer; DefaultValue: Variant; RecIndex: Integer = -1
  返回值:    Variant
  功能描述:  读取Int的记录值
  ------------------------------------------------------------------------------- }

function TIntFieldRW.Read(PmRec: TPmRec; DefaultValue: Variant;
  RecIndex: Integer = -1): Variant;
var
  P: Pointer;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  P := DataSet.Data.Items[FFieldIndex].GetValueFromBuffer(PmRec.Rec);
  if P = nil then
    Exit;
  Result := PInteger(P)^;
end;

function TIntFieldRW.ReadAsInteger(PmRec: TPmRec;
  DefaultValue: Integer): Integer;
var
  P: Pointer;
begin
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  P := DataSet.Data.Items[FFieldIndex].GetValueFromBuffer(PmRec.Rec);
  if P = nil then
    Exit;
  Result := PInteger(P)^;
end;

procedure TIntFieldRW.SetInt(Value: Integer);
begin
  DataSet.Data.SetValue(DataSet.Data.Items[FFieldIndex], FRecIndex, @Value);
end;

procedure TIntFieldRW.WriteValueBuffer(Buffer: Pointer; Value: Integer);
begin
  DataSet.Data.Items[FFieldIndex].SetValueByBuffer(Buffer, @Value);
end;

{ -------------------------------------------------------------------------------
  过程名:    TIntFieldRW.write
  作者:      李锋
  日期:      2010.05.05
  参数:      value: Variant; Buffer: Pointer; RecIndex: Integer = -1
  返回值:    Pointer
  功能描述:  写入INT的记录值
  ------------------------------------------------------------------------------- }

function TIntFieldRW.write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
  RecIndex: Integer = -1): TPmRec;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := PmRec;
  if Result = nil then
    Exit;
  if not CheckVar(Value, fInt, bNull) then
    DataSet.Data.Items[FFieldIndex].SetHasValuesByBuffer(PmRec.Rec, #0)
  else
    WriteValueBuffer(PmRec.Rec, Value);
end;

{ TDouFieldRW }

function TDouFieldRW.Read(PmRec: TPmRec; DefaultValue: Variant;
  RecIndex: Integer): Variant;
var
  P: Pointer;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  P := DataSet.Data.Items[FFieldIndex].GetValueFromBuffer(PmRec.Rec);
  if P = nil then
    Exit;
  Result := pdouble(P)^;
end;

function TDouFieldRW.ReadAsDouble(PmRec: TPmRec; DefaultValue: Double): Double;
var
  P: Pointer;
begin
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  P := DataSet.Data.Items[FFieldIndex].GetValueFromBuffer(PmRec.Rec);
  if P = nil then
    Exit;
  Result := pdouble(P)^;
  if IsNan(Result) then
   Result:=0;
end;

procedure TDouFieldRW.WriteValueBuffer(Buffer: Pointer; Value: Double);
begin
  DataSet.Data.Items[FFieldIndex].SetValueByBuffer(Buffer, @Value);
end;

procedure TDouFieldRW.SetDou(Value: Double);
begin
  DataSet.Data.SetValue(DataSet.Data.Items[FFieldIndex], FRecIndex, @Value);
end;

function TDouFieldRW.write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
  RecIndex: Integer = -1): TPmRec;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := PmRec;
  if Result = nil then
    Exit;
  if not CheckVar(Value, fDou, bNull) then
    DataSet.Data.Items[FFieldIndex].SetHasValuesByBuffer(PmRec.Rec, #0)
  else
    WriteValueBuffer(PmRec.Rec, Value);
end;

function TDouFieldRW.writeAsDouble(Value: Double; PmRec: TPmRec; bNull: Boolean;
  RecIndex: Integer): TPmRec;
begin
  Result := PmRec;
  if Result = nil then
    Exit;
  WriteValueBuffer(PmRec.Rec, Value);
end;

{ TBooFieldRW }

function TBooFieldRW.Read(PmRec: TPmRec; DefaultValue: Variant;
  RecIndex: Integer): Variant;
var
  P: Pointer;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  P := DataSet.Data.Items[FFieldIndex].GetValueFromBuffer(PmRec.Rec);
  if P = nil then
    Exit;
  Result := pboolean(P)^;
end;

function TBooFieldRW.ReadAsBoolean(PmRec: TPmRec;
  DefaultValue: Boolean): Boolean;
var
  P: Pointer;
begin
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  P := DataSet.Data.Items[FFieldIndex].GetValueFromBuffer(PmRec.Rec);
  if P = nil then
    Exit;
  Result := pboolean(P)^;
end;

procedure TBooFieldRW.SetBoolean(Value: Boolean);
begin
  DataSet.Data.SetValue(DataSet.Data.Items[FFieldIndex], FRecIndex, @Value);
end;

procedure TBooFieldRW.WriteValueBuffer(Buffer: Pointer; Value: Boolean);
begin
  DataSet.Data.Items[FFieldIndex].SetValueByBuffer(Buffer, @Value);
end;

function TBooFieldRW.write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
  RecIndex: Integer = -1): TPmRec;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := PmRec;
  if Result = nil then
    Exit;
  if not CheckVar(Value, fBoo, bNull) then
    DataSet.Data.Items[FFieldIndex].SetHasValuesByBuffer(PmRec.Rec, #0)
  else
    WriteValueBuffer(PmRec.Rec, Value);
end;

{ TMemFieldRW }

function TMemFieldRW.Read(PmRec: TPmRec; DefaultValue: Variant;
  RecIndex: Integer): Variant;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  Result := DataSet.GetBlobData(PmRec.BlobRec, FOffSet);
end;

function TMemFieldRW.ReadAsString(PmRec: TPmRec; DefaultValue: string): string;
begin
  Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  Result := DataSet.GetBlobData(PmRec.BlobRec, FOffSet);
end;

function TMemFieldRW.write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
  RecIndex: Integer = -1): TPmRec;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := PmRec;
  if PmRec = nil then
    Exit;
  if bNull then
    Value := '';
  DataSet.SetInternalBlobData(PmRec.BlobRec, FOffSet, Value);
end;

{ TShortStrFieldRW }

function TShortStrFieldRW.Read(PmRec: TPmRec; DefaultValue: Variant;
  RecIndex: Integer): Variant;
begin
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  Result := string(FDataSet.Data.Items[FFieldIndex].GetValueFromBuffer
    (PmRec.Rec));
end;

procedure TShortStrFieldRW.WriteValueBuffer(Buffer: Pointer; Value: string);
  function GetDataBuffer(ABuffer: Pointer; Field: TField): Pointer;
  begin
{$IFNDEF DELPHI10}
    if Field.DataType = ftWideString then
      Result := PWideChar(PWideString(ABuffer)^)
    else
{$ENDIF}
      Result := ABuffer;
  end;

begin
  with DataSet.Data.Items[FFieldIndex] do
  begin
    if Pointer(Value) <> nil then
      SetHasValuesByBuffer(Buffer, #1)
    else
    begin
      SetHasValuesByBuffer(Buffer, #0);
      Exit;
    end;
    CopyChars(GetDataBuffer(Pointer(Value), Field), DataPointerByBuffer(Buffer,
      OffSet), Field.DataSize, Field.DataType);
  end;
end;

function TShortStrFieldRW.write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
  RecIndex: Integer = -1): TPmRec;
begin
  Result := PmRec;
  if Result = nil then
    Exit;
  if bNull then
    DataSet.Data.Items[FFieldIndex].SetHasValuesByBuffer(PmRec.Rec, #0)
  else
    WriteValueBuffer(PmRec.Rec, Value);
end;

{ TPMDataSet }

constructor TPMDataSet.Create(AOwner: TComponent);
var
  Guid: TGUID;
begin

  InternalInit;
  FObjectFieldHash := TStrIntHashMgr_Dic.Create;
  FFieldHash := TIntegerHash.Create;
  CreateGUID(Guid);
  FGuid := GUIDToString(Guid);
  inherited Create(AOwner);
  FLog := False;
  FStream := nil;
  Active := True;
  FManageStateCount := 0;
  FbHaveStateRecord := False;
  FAttributeHash := TStringHash.Create;
  FAttributeObjectHast := TObjectHash.Create;
  FDataViewList := TList.Create;
  FFieldList := TStringList.Create;
  // FRecIndexHash := TObjectHash.Create;
  // FRecIndexHashInUser := TObjectHash.Create;
  FFieldHash_RecHash := TObjectHash.Create;
  FDataStateList := TInterfaceList.Create;
  // FRecHash := TStrIntHashMap.Create;
  // FRecHash.Duplicates := dupAccept;
  FMasterDataLink := TMasterDataLink.Create(Self);
  FMasterDataLink.OnMasterChange := MasterChanged;
  FMasterDataLink.OnMasterDisable := MasterDisabled;
  FSelfManageStateList := TList.Create;
  FStateIndexList := TList.Create;
  FStateChangRecIndexList := TList.Create;
  FTempStateChangedRecList := TList.Create;
  FFieldClassList := TList.Create;
  CreateStateField;

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalInit
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    无
  功能描述:  初始化数据集的变量
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.InternalInit;
begin
  FDetailMaster := '';
  FDetailField := '';
  FMasterField := '';
  FADOMasterField := '';
  FADOKeyValue := '';
  FMaxValue := 0;
  FMaxValueField := '';

  FHashIndex := 1;
  FRecIndex := 0;
  FBlobOffSetIndex := 0;
  FNotifyChanged := True;
  FMarkState := False;
  FbHaveStateField := False;
  FLevel := False;
  FChanged := False;
  FInternalChanged := False;
  FDetail := False;
  FLoadIndex := False;
  FDataEmpty := True;
  FDisplayUiState := True;
  FChangedView := nil;
  FHashMod := phDGl;
  FNotifyChangeEvent := True;
  FbBeginChang := False;
end;

destructor TPMDataSet.Destroy;
var
  i: Integer;
begin
  Clear;
  FFieldHash.Free;
  FAttributeHash.Free;

  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList[i]).DisConnect;
  FDataViewList.Clear;
  FDataViewList.Free;
  FDataStateList.Free;
  FFieldList.Free;
  FMasterDataLink.Free;

  FTempStateChangedRecList.Free;
  FreeStateIndexList;
  FStateIndexList.Free;
  FStateChangRecIndexList.Free;

  FObjectFieldHash.Free;

  FAttributeObjectHast.Free;

  InternalFreeIndexObject;
  FFieldHash_RecHash.Free;
  if FReadStream <> nil then
    FReadStream.Free;
  while True do
  begin
    if FSelfManageStateList.Count = 0 then
      Break;
    TDataStateManger(FSelfManageStateList[0]).Free;
  end;
  FSelfManageStateList.Free;
  FFieldClassList.Free;
  if FDataSource <> nil then
    FreeAndNil(FDataSource);
  // **************************
  inherited Destroy;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.AddField
  作者:      李锋
  日期:      2010.05.05
  参数:      FieldName: string; fType: TPMFieldType; size: Integer = -1
  返回值:    无
  功能描述:  添加DataSet中的字段
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.AddField(FieldName: string; AType: TPMFieldType;
  Caption: string = '');

  procedure _Add(FieldRw: TFieldRWBase; index: Integer; AField: TField);
  begin
    FieldRw.FieldIndex := index;
    FieldRw.Field := AField;
    FObjectFieldHash.AddObject(AField.FieldName, FieldRw);
    // FObjectFieldHash.Items[TempField.FieldName] := FieldRw;
  end;

  function _Create_Init_FieldRWBase(AFieldRWBase_Class: TFieldRWBase_Class; AbIsBlob: Boolean = False): TFieldRWBase;
  begin
    Result := nil;
    if Assigned(AFieldRWBase_Class) then
    begin
      Result := AFieldRWBase_Class.Create(Self);
      Result.FDisplayName := Caption;
      Result.FieldType := AType;
      if AbIsBlob then
      begin
        Result.FOffSet := FBlobOffSetIndex;
        Inc(FBlobOffSetIndex);
      end;
    end;
  end;

var
  TempField: TField;
  LFieldRW: TFieldRWBase;
begin
  if Active then
    Active := False;
  FDataEmpty := False;
  FInternalChanged := True;
  case AType of
    fWideStr:
      begin
        TempField := TMemoField.Create(Self);
        TempField.FieldName := FieldName;
        LFieldRW := _Create_Init_FieldRWBase(TMemFieldRW_Wide, True);
        FFieldClassList.Add(LFieldRW);
        _Add(LFieldRW, -1, TempField);
      end;
    fStr:
      begin
        TempField := TMemoField.Create(Self);
        TempField.FieldName := FieldName;
        LFieldRW := _Create_Init_FieldRWBase(TMemFieldRW, True);
        FFieldClassList.Add(LFieldRW);
        _Add(LFieldRW, -1, TempField);
      end;
    fDou:
      begin
        TempField := TFloatField.Create(Self);
        TempField.FieldName := FieldName;
        LFieldRW := _Create_Init_FieldRWBase(TDouFieldRW);
        FFieldClassList.Add(LFieldRW);
        _Add(LFieldRW, FHashIndex, TempField);
      end;
    fInt:
      begin
        TempField := TIntegerField.Create(Self);
        TempField.FieldName := FieldName;
        LFieldRW := _Create_Init_FieldRWBase(TIntFieldRW);
        FFieldClassList.Add(LFieldRW);
        _Add(LFieldRW, FHashIndex, TempField);
      end;
    fBoo:
      begin
        TempField := TBooleanField.Create(Self);
        TempField.FieldName := FieldName;
        LFieldRW := _Create_Init_FieldRWBase(TBooFieldRW);
        FFieldClassList.Add(LFieldRW);
        _Add(LFieldRW, FHashIndex, TempField);
      end;
    fLargeint:
      begin
        TempField := TLargeintField.Create(Self);
        TempField.FieldName := FieldName;
        LFieldRW := _Create_Init_FieldRWBase(TIntFieldRW);
        FFieldClassList.Add(LFieldRW);
        _Add(LFieldRW, FHashIndex, TempField);
      end;
  end;

  if FieldName = RecordLevel then
    FLevel := True;
  TempField.FieldName := FieldName;
  TempField.DataSet := Self;
  if AType in [fDou, fInt, fBoo, fLargeint] then
  begin
    FFieldHash.Items[FieldName] := FHashIndex;
    Inc(FHashIndex);
  end;
  FFieldList.Add(FieldName);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetFieldValue
  作者:      李锋
  日期:      2010.05.05
  参数:      FieldName: string; Value: Variant; RecIndex: Integer
  返回值:    Boolean
  功能描述:  通过记录索引和字段名设置字段值
  ------------------------------------------------------------------------------- }

function TPMDataSet.SetFieldValue(FieldName: string; Value: Variant;
  RecIndex: Integer; PmNode: IPMNode = nil): Boolean;
var
  FieldRw: TFieldRWBase;
  sOldValue, sNewValue: string;
  bNull: Boolean;
begin
  if (FOwner <> nil) and (not FbBeginChang) and (FOwner is TPmLibDataSet) then
  begin
    FbBeginChang := True;
    try
      Result := TPmLibDataSet(FOwner).SetFieldValue(FieldName, Value,
        RecIndex, PmNode);
    finally
      FbBeginChang := False;
    end;
  end
  else
  begin
    Result := True;
    bNull := False;
    FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
    if FieldRw = nil then
      Exit;
    try
      sOldValue := FieldRw.Read(RecList[RecIndex], '');
      if VarIsNull(Value) then
      begin
        sNewValue := '';
        bNull := True;
      end
      else
        sNewValue := Value;

      FieldRw.write(Value, TPmRec(RecList[RecIndex]), bNull);
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ED_0003 + e.Message);
        raise Exception.Create('设置字段 "' + FieldName + '" 错误!!!');
      end;
    end;

    if FMarkState and (FDataStateManger <> nil) then
      FDataStateManger.Notify(RecList[RecIndex], nil, sNewValue, sOldValue,
        cUpdate, RecIndex, FieldName); // 主要记录了操作步骤(撤销 用)

    DataChangedEvent(cUpdate, RecList[RecIndex], FieldName, sNewValue,
      sOldValue); // 主要处理了哈希列表(FindRec、FindRecList 用)
    NotifyUpdate(RecList[RecIndex], PmNode, sNewValue, sOldValue, FieldName); // 主要通知了 IPMDataView 变动
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetFieldValue
  作者:      李锋
  日期:      2010.05.05
  参数:      FieldName: string; Value: Variant; Rec: Pointer
  返回值:    Boolean
  功能描述:  通过记录指针设置字段值
  ------------------------------------------------------------------------------- }

function TPMDataSet.SetFieldValue(FieldName: string; Value: Variant;
  Rec: Pointer; PmNode: IPMNode = nil): Boolean;
var
  FieldRw: TFieldRWBase;
  sOldValue, sNewValue: string;
  bNull: Boolean;
begin
  Result:= True;
  if (FOwner <> nil) and (not FbBeginChang) and (FOwner is TPmLibDataSet) then
  begin
    FbBeginChang := True;
    try
      Result := TPmLibDataSet(FOwner).SetFieldValue(FieldName, Value,
        Rec, PmNode);
    finally
      FbBeginChang := False;
    end;
  end
  else
  begin
    if Rec = nil then
      Exit;
//    Assert(Rec <> nil, '记录指针为空！！！');
    bNull := False;
    FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
    if FieldRw = nil then
      Exit;
    try
      sOldValue := FieldRw.Read(Rec, '');
      if VarIsNull(Value) then
      begin
        sNewValue := '';
        bNull := True;
      end
      else
        sNewValue := Value;
      // Inc(_WirteRecCount);
      FieldRw.write(Value, TPmRec(Rec), bNull);
      if FMarkState and (FDataStateManger <> nil) then
        FDataStateManger.Notify(Rec, nil, sNewValue, sOldValue, cUpdate, -1,
          FieldName);
      DataChangedEvent(cUpdate, Rec, FieldName, sNewValue, sOldValue);
      NotifyUpdate(Rec, PmNode, sNewValue, sOldValue, FieldName);
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ED_0012 + e.Message);
        raise Exception.Create('设置字段 "' + FieldName + '" 错误!!! tablenaem:' +
          FTableName);
      end;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetFieldValue
  作者:      李锋
  日期:      2010.05.05
  参数:      FieldName: string; DefaultValue: Variant; Rec: Pointer = nil
  返回值:    Variant
  功能描述:  取记录字段值
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetFieldValue(FieldName: string; DValue: Variant;
  Rec: Pointer = nil): Variant;
var
  FieldRw: TFieldRWBase;
begin
  if Rec = nil then
    Exit;
  Result := DValue;
  if FieldName = '' then
    Exit;

  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  try
    Result := FieldRw.Read(TPmRec(Rec), DValue);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0011 + e.Message);
      raise Exception.Create('读取字段 "' + FieldName + '" 错误!!! tablenaem:' +
        FTableName);
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetFieldValue
  作者:      李锋
  日期:      2010.05.05
  参数:      FieldName: string; DefaultValue: Variant; RecIndex: Integer
  返回值:    Variant
  功能描述:  通过记录索引取记录字段值
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetFieldValue(FieldName: string; DValue: Variant;
  RecIndex: Integer): Variant;
var
  FieldRw: TFieldRWBase;
begin
  Result := DValue;

  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  try
    Result := FieldRw.Read(TPmRec(RecList[RecIndex]), DValue);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0010 + e.Message);
      raise Exception.Create('读取字段 "' + FieldName + '" 错误!!! tablenaem:' +
        FTableName);
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetCurrentRec
  作者:      李锋
  日期:      2010.05.05
  参数:      RecIndex: Integer = -1
  返回值:    Pointer
  功能描述:  取当前记录指针
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetCurrentRec(RecIndex: Integer = -1): Pointer;
begin
  Result := nil;
  if RecIndex < 0 then
    RecIndex := FRecIndex;
  if (RecIndex < 0) or (RecIndex >= RecList.Count) then
    Exit;
  Result := RecList[RecIndex];
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetFieldList
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    TStringList
  功能描述:  取字段列表
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetFieldList: TStringList;
var
  i: Integer;
  S: string;
begin
  if FFieldList = nil then
    FFieldList := TStringList.Create;
  FFieldList.Clear;
  for i := 1 to Fields.Count - 1 do
  begin
    S := Fields.Fields[i].FieldName;
    if S = StateField then
      Continue;
    FFieldList.Add(S);
  end;
  Result := FFieldList;
end;

procedure TPMDataSet.NextRec;
begin
  Inc(FRecIndex);
  Next;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetRecordCount
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    Integer
  功能描述:  取DataSet记录数
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetRecordCount: Integer;
begin
  if (Data = nil) or (Data.Values = nil) then
    Result := 0
  else
    Result := Data.Values.Count;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.ReplaceRec
  作者:      李锋
  日期:      2010.05.05
  参数:      Rec: Pointer; Level: Integer = 0
  返回值:    Pointer
  功能描述:  替换原值 在undo redo时用到
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.ReplaceRec(RecIndex: Integer; Rec: Pointer);
begin
  FreeRec(RecList[RecIndex]); // 释放内存
  RecList[RecIndex] := Rec;
  Data.Values[RecIndex] := TPmRec(Rec).Rec;
  if BlobList.Count > 0 then
    BlobList[RecIndex] := TPmRec(Rec).BlobRec;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalDeleteRow
  作者:      李锋
  日期:      2010.06.02
  参数:      Index: Integer
  返回值:    Pointer
  功能描述:  内部删除 在delete 的 redo 和insert的UNDO 时调用
  ------------------------------------------------------------------------------- }

function TPMDataSet.InternalDeleteRow(Index: Integer): Pointer;
  procedure DeleteRec;
  begin
    Data.Values.Delete(Index);
    RecList.Delete(Index);
    if BlobFieldCount > 0 then
      BlobList.Delete(Index);
  end;
  procedure MoveCur;
  begin
    if index <= CurRec then
      if CurRec >= Data.RecordCount then // 移动当前
        CurRec := CurRec - 1;
  end;

begin
  Result := nil;
  if (Index > RecList.Count - 1) and (Index < 0) then
    Exit;
  Result := RecList[index];
  DeleteRec; // 删除
  MoveCur; // 移动
  DataChangedEvent(cDelete, Result); // 数据改变事件
  NotifyDelete(Result, Index, True);
end;

function TPMDataSet.InternalDeleteRow(Rec: Pointer): Pointer;
var
  Index, TempIndex: Integer;
  procedure DeleteRec;
  begin
    Data.Values.Delete(Index);
    RecList.Delete(Index);
    if BlobFieldCount > 0 then
      BlobList.Delete(Index);
  end;
  procedure MoveCur;
  begin
    if index <= CurRec then
      if CurRec >= Data.RecordCount then // 移动当前
        CurRec := CurRec - 1;
  end;

begin
  Result := nil;
  Index := RecList.IndexOf(Rec);
  if Index < 0 then
    Exit;
  TempIndex := Index + 1;
  if RecList.Count - 1 >= TempIndex then
    Result := RecList[TempIndex];
  DeleteRec; // 删除
  MoveCur; // 移动
  DataChangedEvent(cDelete, Rec); // 数据改变事件
  NotifyDelete(Rec, Index, True);

end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalInsertBefore_ByIndex
  作者:      李锋
  日期:      2010.06.02
  参数:      Rec: Pointer; Index: Integer
  返回值:    无
  功能描述:  内部插入记录 通过索引定位 deletestate的UNDO 和inserteState的REDO时调用
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.InternalInsertBefore_ByIndex(Rec: Pointer; Index: Integer);
var
  RecIndex, OppRecIndex: Integer;
  OppRec: Pointer;
begin
  OppRec := nil;
  Append;
  Post;
  RecIndex := RecList.Count - 1;
  ReplaceRec(RecIndex, Rec); // 替换
  if (Index >= 0) and (Index <= RecList.Count - 1) then
  begin
    OppRec := RecList[Index];
    MoveCurRecordTo(Index + 1);
    RecIndex := Index;
    OppRecIndex := RecIndex;
  end
  else
    OppRecIndex := -1;
  DataChangedEvent(cAddBefore, Rec, '', '', '', True);
  NotifyAdd(Rec, OppRec, RecIndex, OppRecIndex, cAddBefore, True);
end;

procedure TPMDataSet.InternalInsertBefore_ByOppRec(Rec, OppRec: Pointer);
var
  RecIndex, OppRecIndex, Index: Integer;
begin
  Append;
  Post;
  RecIndex := RecList.Count - 1;
  ReplaceRec(RecIndex, Rec); // 替换
  Index := RecList.IndexOf(OppRec);
  // if Index < 0 then Exit;
  if (Index >= 0) and (Index <= RecList.Count - 1) then
  begin
    // OppRec := RecList[Index];
    MoveCurRecordTo(Index + 1);
    RecIndex := Index;
    OppRecIndex := RecIndex;
  end
  else
    OppRecIndex := -1;
  DataChangedEvent(cAddBefore, Rec, '', '', '', True);
  NotifyAdd(Rec, OppRec, RecIndex, OppRecIndex, cAddBefore, True);
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InsertAfter
  作者:      李锋
  日期:      2010.05.05
  参数:      Rec: Pointer; Level: Integer = 0
  返回值:    Pointer
  功能描述:  通过相对记录指针往后插入记录
  ------------------------------------------------------------------------------- }

function TPMDataSet.InsertAfter(OppRec: Pointer; Level: Integer = 0): Pointer;
var
  Index, iCurIndex: Integer;
begin
  if (FOwner <> nil) and (not FbBeginChang) and (FOwner is TPmLibDataSet) then
  begin
    FbBeginChang := True;
    try
      Result := TPmLibDataSet(FOwner).InsertAfter(OppRec, Level);
    finally
      FbBeginChang := False;
    end;
  end
  else
  begin

    if not Active then
      Active := True;
    Index := -1;
    Append;
    Post;
    iCurIndex := RecList.Count - 1;
    Result := RecList[iCurIndex];
    if OppRec <> nil then
      Index := RecList.IndexOf(OppRec);
    if Index >= 0 then
    begin
      MoveCurRecordTo(Index + 2);
      iCurIndex := Index + 1;
    end;
    if FLevel then
      SetFieldValue(RecordLevel, Level, Result);
    DataChangedEvent(cAddAfter);
    NotifyAdd(Result, OppRec, iCurIndex, iCurIndex - 1, cAddAfter);

    if FMarkState and (FDataStateManger <> nil) then // 记录更改
      FDataStateManger.Notify(Result, nil, '', '', cAddAfter, iCurIndex, '');

  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InsertBefore
  作者:      李锋
  日期:      2010.05.05
  参数:      Rec: Pointer; Level: Integer = 0
  返回值:    Pointer
  功能描述:  通过相对记录指针往前插入记录
  ------------------------------------------------------------------------------- }

function TPMDataSet.InsertBefore(OppRec: Pointer; Level: Integer = 0): Pointer;
var
  Index, iCurIndex, OppIndex: Integer;
begin
  if (FOwner <> nil) and (not FbBeginChang) and (FOwner is TPmLibDataSet) then
  begin
    FbBeginChang := True;
    try
      Result := TPmLibDataSet(FOwner).InsertBefore(OppRec, Level);
    finally
      FbBeginChang := False;
    end;
  end
  else
  begin
    if not Active then
      Active := True;
    Index := -1;
    OppIndex := -1;
    Append;
    Post;
    iCurIndex := RecList.Count - 1;
    Result := RecList[iCurIndex];
    if OppRec <> nil then
      Index := RecList.IndexOf(OppRec);
    if Index >= 0 then
    begin
      MoveCurRecordTo(Index + 1);
      iCurIndex := Index;
      OppIndex := iCurIndex;
    end;
    if FLevel then // 为树状 数据源 设置等级字段值
      SetFieldValue(RecordLevel, Level, Result);
    DataChangedEvent(cAddBefore);
    NotifyAdd(Result, OppRec, iCurIndex, OppIndex, cAddBefore);

    if FMarkState and (FDataStateManger <> nil) then // 记录更改
      FDataStateManger.Notify(Result, nil, '', '', cAddBefore, iCurIndex, '');
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.DeleteRow
  作者:      李锋
  日期:      2010.05.05
  参数:      Rec: Pointer; bFreeRec: Boolean = True
  返回值:    无
  功能描述:  删除记录
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.DeleteRow(Rec: Pointer; bFreeRec: Boolean = True);
var
  Index, TempIndex: Integer;
  OppRec: Pointer;
  procedure DeleteRec;
  begin
    Data.Values.Delete(Index);
    RecList.Delete(Index);
    if BlobFieldCount > 0 then
      BlobList.Delete(Index);
  end;
  procedure MoveCur;
  begin
    if index <= CurRec then
      if CurRec >= Data.RecordCount then // 移动当前
        CurRec := CurRec - 1;
  end;

begin
  if (FOwner <> nil) and (not FbBeginChang) and (FOwner is TPmLibDataSet) then
  begin
    FbBeginChang := True;
    try
      TPmLibDataSet(FOwner).DeleteRow(Rec, bFreeRec);
    finally
      FbBeginChang := False;
    end;
  end
  else
  begin
    if Rec = nil then
      Exit;
    OppRec := nil;
    Index := RecList.IndexOf(Rec);
    if Index < 0 then
      Exit;
    TempIndex := Index + 1;
    if RecList.Count - 1 >= TempIndex then
      OppRec := RecList[TempIndex];
    DataChangedEvent(cDelete, Rec); // 数据改变事件
    NotifyDelete(Rec, Index);
    DeleteRec; // 删除
    MoveCur; // 移动

    if FMarkState and (FDataStateManger <> nil) then // 记录更改
      FDataStateManger.Notify(Rec, OppRec, '', '', cDelete, Index, '')
    else if bFreeRec then
      FreeRec(Rec, True); // 不记录则释放
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetValue
  作者:      李锋
  日期:      2010.05.05
  参数:      FieldIndex, RecIndex: Integer; Buffer: Pointer
  返回值:    无
  功能描述:  内部使用的 设置字段值
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetValue(FieldIndex, RecIndex: Integer; Buffer: Pointer);
const
  HasValueArr: array [False .. True] of AnsiChar = (#0, #1);
var
  mField: TdxMemField;
  function GetDataBuffer(ABuffer: Pointer; Field: TField): Pointer;
  begin
{$IFNDEF DELPHI10}
    if Field.DataType = ftWideString then
      Result := PWideChar(PWideString(ABuffer)^)
    else
{$ENDIF}
      Result := ABuffer;
  end;

begin
  mField := Data.Items[FieldIndex];
  Data.SetHasValue(mField, RecIndex, HasValueArr[Buffer <> nil]);
  if (Buffer = nil) then
    Exit;
  if mField.Field.DataType in ftStrings then
    CopyChars(GetDataBuffer(Buffer, mField.Field), mField.Values[RecIndex],
      mField.Field.DataSize, mField.Field.DataType)
  else
    cxCopyData(Buffer, mField.Values[RecIndex], mField.Field.DataSize);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetRecByFieldValue
  作者:      李锋
  日期:      2010.05.05
  参数:      FieldName: string; Value: Variant
  返回值:    Pointer
  功能描述:  通过字段的一个值找到 该记录
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetRecByFieldValue(FieldName: string; Value: Variant;
  BeginCurRec: Boolean): Pointer;
var
  i, BeginIndex: Integer;
begin
  Result := nil;
  if BeginCurRec then
    BeginIndex := FRecIndex + 1
  else
    BeginIndex := 0;
  FRecIndex := 0;
  for i := BeginIndex to RecList.Count - 1 do
  begin
    if Value = GetFieldValue(FieldName, '', i) then
    begin
      Result := RecList[i];
      FRecIndex := i;
      Break;
    end;
  end;
end;

procedure TPMDataSet.SetEdit;
begin
  SetState(dsEdit);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.HasValue
  作者:      李锋
  日期:      2010.05.05
  参数:      FieldName: string; Rec: Pointer
  返回值:    Boolean
  功能描述:  判断Rec记录的字段FieldName 是否设置过值
  ------------------------------------------------------------------------------- }

function TPMDataSet.HasValue(FieldName: string; Rec: Pointer): Boolean;
begin
  { Result := True;
    if Rec = nil then Exit;
    try
    with TFieldRWBase(FObjectFieldHash.Items[FieldName]) do
    begin
    FindRecIndex(Rec);
    if Field.DataType <> ftMemo then
    begin
    if Data.Items[FieldIndex].HasValues[RecIndex] = #1 then
    Result := True
    end
    else
    begin
    if BlobList.Count - 1 < RecIndex then Exit;

    if pstring(BlobList.Items[RecIndex])^ <> '' then
    Result := True;
    end;
    end;
    except
    end; }
    Result:=True;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SaveViewToXML
  作者:      lifeng
  日期:      2010.08.04
  参数:      FileName: string; AView: TPMDataView
  返回值:    无
  功能描述:  保存视图文件至XML
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SaveViewToXML(FileName: string; AView: IPMDataView;
  AAttKeys: array of string; AValues: array of string);
var
  sxml: TStringList;
  StrDire: string;
begin
  StrDire := ExtractFilePath(FileName);
  if StrDire <> '' then
    ForceDirectories(StrDire);
  sxml := TStringList.Create;
  try
    sxml.Text := GetViewToXmlSource(AView, AAttKeys, AValues);
  finally
    sxml.SaveToFile(FileName);
    sxml.Free;
  end;
end;

function TPMDataSet.GetViewToXmlSource(AView: IPMDataView;
  AAttKeys: array of string; AValues: array of string): string;
var
  sxml: TStringList;
  i, j: Integer;
  Node: IPMNode;
  S, Field, AttValue: string;

  function _ConvertEscapeChar(AStr: string): string;
  var
    I, iCount: Integer;
  begin
    Result := StringReplace(AStr, '&', '&amp;', [rfReplaceAll]);
    Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
    Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
    Result := StringReplace(Result, '''', '&apos;', [rfReplaceAll]);
    Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
    // 计价规则.jjgz 导出xml时 许多字段中有 #0 导致导出结果不正确 这里替换成空格
    iCount := Length(Result);
    for I := 1 to iCount do
    begin
      if Result[I] = #0 then
        Result[I] := #32; // 空格
    end;
  end;
begin
  Result := '';
  sxml := TStringList.Create;
  try
    sxml.Add('<?xml version="1.0" encoding="gb2312" ?>');
    AttValue := '';
    for i := 0 to High(AAttKeys) do
    begin
      AttValue := AttValue + AAttKeys[i] + '="' + AValues[i] + '" ';
    end;
    if AttValue <> '' then
      sxml.Add(Format('<Module %s>', [AttValue]))
    else
      sxml.Add('<Module>');
    for i := 0 to AView.GetRecCount - 1 do
    begin
      Node := AView.PMNodeList[i];
      S := '';
      for j := 0 to AView.GetFieldList.Count - 1 do
      begin
        Field := AView.GetFieldList.Strings[j];
        S := S + Format(' %s="%s" ', [Field, _ConvertEscapeChar(Node.GetValueAsString(Field, ''))]);
      end;
      S := Format('  <Item %s />', [S]);
      sxml.Add(S);
    end;
    sxml.Add('</Module>');
  finally
    Result := sxml.Text;
    sxml.Free;
  end;

end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SaveViewToFile
  作者:      lifeng
  日期:      2010.08.04
  参数:      FileName: string; AView: IPMDataView
  返回值:    无
  功能描述:  保存视图中数据到文件
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SaveViewToFile(FileName: string; AView: TPMDataView);
var
  Stream: TMemoryStream;
  ViewWrite: TPmViewStreamWrite;
  Attsize: Integer;
  bSaveResult: Boolean;
begin
  Stream := TMemoryStream.Create;
  try
    if AView.FStatus = vDefault then
      SaveStream(Stream)
    else
    begin
      Attsize := SaveAttributeToStream(Stream);
      Attsize := Attsize + SaveStructureToStream(Stream, bSaveResult);
      ViewWrite := TPmViewStreamWrite.Create(Self, Stream);
      ViewWrite.DataView := AView;
      try
        ViewWrite.RealSize := 0;
        ViewWrite.RealSize := Attsize;
        ViewWrite.FieldHash := FFieldHash;
        try
          ViewWrite.SaveData;
        except
          InternalLog('保存数据流错误！！！');
        end;
      finally
        ViewWrite.Free;
      end;
    end;
    Stream.SaveToFile(FileName);
  finally
    Stream.Free;
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SaveStream
  作者:      李锋
  日期:      2010.05.05
  参数:      Stream: TStream
  返回值:    无
  功能描述:  保存DataSet入流
  ------------------------------------------------------------------------------- }

function TPMDataSet.SaveStream(Stream: TStream): Boolean;
var
  AMemDataStreamWriter: TdxMemDataStreamWriter;
  Attsize: Integer;
  bSaveResult: Boolean;
begin
  Result := False;
  if FDataEmpty then
   Exit;
  // InternalClearStreamHash; //清理索引hash表 里记录 但不清理  hash本身  在savedata中 会序列化 记录位置 到该hash表
  AMemDataStreamWriter := TdxMemDataStreamWriter.Create(Self, Stream);
  try
    try
      Attsize := SaveAttributeToStream(Stream);
      Attsize := Attsize + SaveStructureToStream(Stream, bSaveResult);
      if Not bSaveResult then
        Exit;
      AMemDataStreamWriter.RealSize := 0;
      AMemDataStreamWriter.RealSize := Attsize;
      AMemDataStreamWriter.FieldHash := FFieldHash;
      AMemDataStreamWriter.SaveData;
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ED_0002 + e.Message);
        Exit;
      end;
    end;
    // InternalClearStreamHash; //释放对象
    Result := True;
  finally
    AMemDataStreamWriter.Free;
  end;

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SaveDataToFile
  作者:      lifeng
  日期:      2010.08.04
  参数:      FileName: string
  返回值:    无
  功能描述:  保存数据集到文件
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SaveDataToFile(FileName: string);
var
  Stream: TMemoryStream;
  Dir: string;
begin
  if FileExists(FileName) then
    DeleteFile(FileName);
  Stream := TMemoryStream.Create;
  try
    SaveStream(Stream);
    Dir := ExtractFileDir(FileName);
    if Dir <> '' then
      ForceDirectories(Dir);
    Stream.SaveToFile(FileName);
  finally
    Stream.Free
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.LoadStream
  作者:      李锋
  日期:      2010.05.05
  参数:      Stream: TStream
  返回值:    无
  功能描述:  从流中加载数据到DataSet
  ------------------------------------------------------------------------------- }

function TPMDataSet.LoadStream(Stream: TStream): Boolean;
var
  AMemReader: TdxMemDataStreamReader;
  TempStatus: Boolean;
begin
  if FLoadIndex then
  begin
    Active := False;
    Active := True;
  end;
  AMemReader := TdxMemDataStreamReader.Create(Self, Stream);
  TempStatus := FNotifyChanged; // 保存notify状态
  FNotifyChanged := False; // 不通知
  try
    LoadAttribute(Stream);
    Result := LoadStructure(Stream);
    if not Result then
      Exit;
    AMemReader.FieldHash := FFieldHash;
    try
      LoadFromStream(Stream, AMemReader);
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ED_0009 + e.Message);
      end;
    end;
    DeserializeState; // 恢复Statelist数据
    DeserializeRec; // 反序列化 Rec
    if FAttributeHash.Exists(DataSetatt_Key_MaxField) then
      SetMaxValueFile(FAttributeHash.Items[DataSetatt_Key_MaxField]);
  finally
    AMemReader.Free;
    FNotifyChanged := TempStatus;
  end;

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.LoadDataFromFile
  作者:      lifeng
  日期:      2010.08.04
  参数:      FileName: string
  返回值:    无
  功能描述:  从文件中载入数据
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.LoadDataFromFile(FileName: string);
var
  Stream: TMemoryStream;
begin
  if not FileExists(FileName) then
    Exit;
  Stream := TMemoryStream.Create;
  try
    Stream.LoadFromFile(FileName);
    LoadStream(Stream);
  finally
    Stream.Free;
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.ViewDelete
  作者:      李锋
  日期:      2010.05.05
  参数:      PMView: TPMDataView
  返回值:    无
  功能描述:  删除视图
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.DeleteView(PMView: TPMDataView);
var
  index: Integer;
begin
  index := FDataViewList.IndexOf(PMView);
  if index >= 0 then
    FDataViewList.Delete(index);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetAttAsBoolean
  作者:      李锋
  日期:      2010.05.05
  参数:      Key: string
  返回值:    Boolean
  功能描述:  取布尔类型的DataSet属性
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetAttAsBoolean(Key: string): Boolean;
begin
  Result := False;
  if Key = '' then
    Exit;
  if FAttributeHash.Exists(Key) then
    Result := StrToBoolDef(FAttributeHash.Items[Key], False);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetAttAsInteger
  作者:      李锋
  日期:      2010.05.05
  参数:      Key: string
  返回值:    Integer
  功能描述:  取整数类型的DataSet属性
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetAttAsInteger(Key: string): Integer;
begin
  Result := -1;
  if Key = '' then
    Exit;
  if FAttributeHash.Exists(Key) then
    Result := StrToIntDef(FAttributeHash.Items[Key], 0);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetAttAsString
  作者:      李锋
  日期:      2010.05.05
  参数:      Key: string
  返回值:    string
  功能描述:  取字符串类型的DataSet属性
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetAttAsString(Key: string): string;
begin
  Result := '';
  if Key = '' then
    Exit;
  if FAttributeHash.Exists(Key) then
    Result := FAttributeHash.Items[Key];
end;

function TPMDataSet.GetAttribute(Key: string): string;
begin
  Result := '';
  if Key = '' then
    Exit;
  if FAttributeHash.Exists(Key) then
    Result := FAttributeHash.Items[Key];
end;

function TPMDataSet.GetAttributesAsString: string;
var
  Key, Value: string;
begin
  Result := '';
  FAttributeHash.Restart;
  while FAttributeHash.Next do
  begin
    Key := FAttributeHash.CurrentKey;
    Value := FAttributeHash.Items[Key];
    Result := Result + Key + ':' + Value + '|';
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetAttribute
  作者:      李锋
  日期:      2010.05.05
  参数:      Value: Variant; Key: string
  返回值:    无
  功能描述:  设置DataSet的属性
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetAttribute(Value: Variant; Key: string);
begin
  if (FAttributeHash.Exists(Key)) and (FAttributeHash.Items[Key] = Value) then
    Exit;
  FAttributeHash.Items[Key] := Value;
  DataChangedEvent(cUpdate);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.LoadAttribute
  作者:      李锋
  日期:      2010.05.05
  参数:      Stream: TStream
  返回值:    无
  功能描述:  从流中加载 DataSet的 属性
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.LoadAttribute(Stream: TStream);
var
  attLen: Integer;
  S: AnsiString;
  temps, Key, Value: string;
  i: Integer;
begin
  if Stream = nil then
    Exit;
  Stream.Position := 0;
  FAttributeHash.Clear;
  Stream.Read(attLen, SizeOf(Integer));
  if attLen > 0 then
  begin
    S := '';
    SetLength(S, attLen);
    Stream.Read(PAnsiChar(S)^, attLen);
    for i := 0 to ColCount(S, '|') - 1 do
    begin
      temps := GetCol(S, i, '|');
      if Pos(':', temps) > 0 then
      begin
        Key := GetCol(temps, 0, ':');
        Value := GetCol(temps, 1, ':');
        if Key <> '' then
        begin
          FAttributeHash.Items[Key] := Value;
          if Key = TableName then
            FTableName := Value;
        end
      end;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SaveAttributeToStream
  作者:      李锋
  日期:      2010.05.05
  参数:      Stream: TStream
  返回值:    Integer
  功能描述:  保存DataSet的属性到流中
  ------------------------------------------------------------------------------- }

function TPMDataSet.SaveAttributeToStream(Stream: TStream): Integer;
var
  attLen: Integer;
  Key, Value: string;
  S: AnsiString;
begin
  Result := 0;
  Stream.Position := 0;
  S := '';
  FAttributeHash.Restart;
  while FAttributeHash.Next do
  begin
    Key := FAttributeHash.CurrentKey;
    Value := FAttributeHash.Items[Key];
    S := S + Key + ':' + Value + '|';
  end;
  attLen := Length(S);
  Stream.write(attLen, SizeOf(Integer));
  Result := Result + SizeOf(Integer);
  if S <> '' then
  begin
    Stream.write(PAnsiChar(S)^, attLen);
    Result := Result + attLen;
  end;
end;

function TPMDataSet.GetInstance: TDataSet;
begin
  Result := Self;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetNotifyChanged
  作者:      李锋
  日期:      2010.05.05
  参数:      value: Boolean
  返回值:    无
  功能描述:  设置 当DataSet变动时 是否通知视图
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetNotifyChanged(Value: Boolean);
begin
  FNotifyChanged := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.RefreshViews
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    无
  功能描述:  刷新视图
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.RefreshViews;
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList.Items[i]).RefreshViews;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetChangedView
  作者:      李锋
  日期:      2010.05.05
  参数:      P: Pointer
  返回值:    无
  功能描述:  设置 变动的视图
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetChangedView(P: Pointer);
begin
  FChangedView := P;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetDataState
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    TList
  功能描述:  取State列表
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetDataState: TInterfaceList;
begin
  Result := FDataStateList;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetMarkState
  作者:      李锋
  日期:      2010.05.05
  参数:      value: Boolean
  返回值:    无
  功能描述:  设置是否记录数据变动情况
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetMarkState(const Value: Boolean);
begin
  FMarkState := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.LoadFromCustomFile
  作者:      李锋
  日期:      2010.05.05
  参数:      FileName: string; cMark: char
  返回值:    无
  功能描述:  从自定义文件中导入数据
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.LoadFromCustomFile(FileName: string; cMark: char);
var
  Ts: TStringList;
  Rec, i, FieC: Integer;
  S: string;
  function CreateField(sField: string): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    case FFieTypeByImport of
      ftAuto:
        begin
          for i := 0 to ColCount(sField, cMark) - 1 do
            AddField('Field' + IntToStr(i), fStr);
          Result := 0;
        end;
      ftSelfAdd:
        Result := 0;
      ftAppointFirst:
        begin
          for i := 0 to ColCount(sField, cMark) - 1 do
            AddField(GetCol(sField, i, cMark), fStr);
          Result := 1;
        end;
    end;
  end;

begin
  if cMark = '' then
    cMark := '|';
  Ts := TStringList.Create;
  try
    Ts.LoadFromFile(FileName);
    i := CreateField(Ts.Strings[0]);
    if Fields.Count = 1 then
      Exit;
    for Rec := i to Ts.Count - 1 do
    begin
      S := Ts.Strings[Rec];
      InsertAfter(nil);
      for FieC := 2 to FieldCount - 1 do
        SetFieldValue(Fields.Fields[FieC].FieldName,
          GetCol(S, FieC - 2, cMark), nil)
    end;
  finally
    Ts.Free;
  end;
end;

procedure TPMDataSet.SaveToCustomFile(FileName: string; cMark: char);
begin
  ShowMessage('未开放该功能');
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetFieTypeByImport
  作者:      李锋
  日期:      2010.05.05
  参数:      Value: TFieldTypeByImport
  返回值:    无
  功能描述:  设置数据导入方式
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetFieTypeByImport(Value: TFieldTypeByImport);
begin
  FFieTypeByImport := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.BeginState
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    无
  功能描述:  开始记录数据的变动情况
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.BeginState;
begin
  if (FMarkState) and (FDataStateManger = nil) then
    FDataStateManger := TDataStateManger.Create(Self);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.EndState
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    无
  功能描述:  结束记录数据变动
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.EndState;
begin
  if FDataStateManger <> nil then
  begin
    if FDataStateManger.Count > 0 then
    begin
      if Assigned(FPushStateList) then
        FPushStateList(FDataStateManger);
      FDataStateList.Add(FDataStateManger);
      Inc(FManageStateCount);
    end
    else
    begin
      try
        FreeAndNil(FDataStateManger);
      except
        on e: Exception do
        begin
          AppendFiledata(cst_logname, cst_error_ED_0040 + e.Message);
        end;
      end;
    end;
    FDataStateManger := nil;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.LoadStructure
  作者:      李锋
  日期:      2010.05.05
  参数:      Stream: TStream
  返回值:    无
  功能描述:  从流中载入 数据结构
  ------------------------------------------------------------------------------- }

function TPMDataSet.LoadStructure(Stream: TStream): Boolean;
var
  StrucLen, attLen: Integer;
  S: AnsiString;
  temps, FieldName, DataType, Caption: string;
  i: Integer;
  FieldType: TPMFieldType;
  function CreateFieldType(Value: string): TPMFieldType;
  begin
    Result := fStr;
    if Value = 'ftMemo' then
      Result := fStr
    else if Value = 'ftInteger' then
      Result := fInt
    else if Value = 'ftFloat' then
      Result := fDou
    else if Value = 'ftBoolean' then
      Result := fBoo
    else if Value = GetPMFieldTypeName(fWideStr) then
      Result := fWideStr;
  end;

begin
  Result := True;
  if Stream = nil then
    Exit;

  Stream.Position := 0;
  Stream.Read(attLen, SizeOf(Integer)); // 读属性存放长度
  Stream.Position := SizeOf(Integer) + attLen; // 设置  Position
  Stream.Read(StrucLen, SizeOf(Integer)); // 表结构长度
  // if Fields.FieldByName(StateField) <> nil then
  // FbHaveStateField := True;
  if (StrucLen > 0) and (Fields.Count <= 3) then
  begin
    S := '';
    SetLength(S, StrucLen);
    Stream.Read(PAnsiChar(S)^, StrucLen);
    if Pos('|', S) <= 0 then
      S := Lf_Base64ToStr(S);
    for i := 0 to ColCount(S, '|') - 1 do
    begin
      temps := GetCol(S, i, '|');
      if Pos(':', temps) > 0 then
      begin
        FieldName := GetCol(temps, 0, ':');
        DataType := GetCol(temps, 1, ':');
        Caption := GetCol(temps, 2, ':');
        if FieldName <> '' then
        begin
          if CheckFieldExit(FieldName) then
            Continue;
          if DataType = '' then
            FieldType := fStr
          else
            FieldType := CreateFieldType(DataType);

          if FieldName = StateField then
          begin
            if not FbHaveStateField then
            begin
              FbHaveStateField := True;
              AddField(FieldName, FieldType, Caption);
            end;
          end
          else
            AddField(FieldName, FieldType, Caption);
        end;
      end;
    end;
    CreateStateField;
    // 由于在工程刚打开时 需要数据升级，所以若数据升级了则 内部修改为TRUE
    // update  2012. 12.11 lifeng
    FInternalChanged := False;
    if Assigned(FAfterLoadStruct) then
      Result := FAfterLoadStruct(Self);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SaveStructureToStream
  作者:      李锋
  日期:      2010.05.05
  参数:      Stream: Tstream
  返回值:    Integer
  功能描述:  保存数据结构到流中
  ------------------------------------------------------------------------------- }

function TPMDataSet.SaveStructureToStream(Stream: TStream; var bSaveResult:
  Boolean): Integer;
var
  i, len: Integer;
  S: AnsiString;
  Field, DisplayName: string;
  LField: TField;
begin
  bSaveResult := True;
  Result := 0;
  try
    S := '';
    for i := 1 to Fields.Count - 1 do
    begin
      LField := Fields.Fields[i];
      Field := LField.FieldName;
      DisplayName := GetDisplayName(Field);
      if Assigned(FBeforeSaveStruct) then
        Field := FBeforeSaveStruct(Field);
      // 因 fWideStr 和 fStr 都是用 TMemoField 故这里需要对 字段类型名称 进行区分
      if FObjectFieldHash.Exist(Field) and (TFieldRWBase(
        FObjectFieldHash.GetObject(Field)).FieldType = fWideStr) then
        S := S + Field + ':' + GetPMFieldTypeName(fWideStr)                            + ':' + Field + '|'
      else
        S := S + Field + ':' + GetEnumName(Typeinfo(TFieldType), Ord(LField.DataType)) + ':' + Field + '|';
    end;
    len := Length(S);
    Stream.write(len, SizeOf(Integer));
    if len > 0 then
      Stream.write(PAnsiChar(S)^, len);
    // Stream.Write(s[1],len)   ;
    Result := SizeOf(Integer) + len;
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0001 + e.Message);
      bSaveResult := False;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetMarkState
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    Boolean
  功能描述:  获取 是否记录变动
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetMarkState: Boolean;
begin
  Result := FMarkState;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.Clear
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    无
  功能描述:  清理数据
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.Clear;
var
  i, l: Integer;
begin
  FbHaveStateRecord := False;

  for i := 0 to FDataViewList.Count - 1 do
  begin // 清理 view中的数据
    TPMDataView(FDataViewList[i]).FRecList.Clear;
    for l := 0 to TPMDataView(FDataViewList[i]).FRecIndexList.Count - 1 do
      FreeMem(Pointer(TPMDataView(FDataViewList[i]).FRecIndexList[l]));
  end;

  FDataViewList.Clear;
  for i := 0 to RecList.Count - 1 do
    TPmRec(RecList[i]).Free;
  RecList.Clear; // 清理 reclist
  FAttributeHash.Clear; // 属性表
  FFieldList.Clear; // 字段列表
  FFieldHash.Clear; // 字段HASH

  // FreeDglObjecHash(FObjectFieldHash);
  FObjectFieldHash.Free; // 字段对应读写对象表
  FObjectFieldHash := TStrIntHashMgr_Dic.Create;
  FAttributeObjectHast.Clear;
  InternalFreeIndexObject;
  FFieldClassList.Clear;

  // *****************************************************以上清理继承后的对象中的数据

  SetState(dsEdit);
  ClearBuffers; // dataset的buffer清理
  DestroyFields; // 释放字段
  Active := False; // 真实 释放fdata中记录 和bloblist中记录
  // *************************************************************清理dataset数据

  FTempStateChangedRecList.Clear;
  InternalInit; // 初始化
  RecIdField := nil;
  CreateRecIDField; // 创建recid字段
  FDataEmpty := True; // 数据集此时为空
  // **************************************************************初始化数据集
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.RefreshRec
  作者:      李锋
  日期:      2010.05.05
  参数:      Rec, AData: Pointer
  Rec：目前队列中的指针
  AData:原来队列中的指针
  返回值:    无
  功能描述:  刷新视图中的 一条记录
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.RefreshRec(PmNode: IPMNode; AData: Pointer);
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList[i]).RefreshRec(PmNode);
end;

function TPMDataSet.GetFieldValueByRec(FieldName: string; Rec: Pointer)
  : Variant;
begin

end;

procedure TPMDataSet.StateInsertRec(Rec: Pointer);
begin

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.FreeRec
  作者:      李锋
  日期:      2010.05.05
  参数:      Rec, blobRec: Pointer
  返回值:    无
  功能描述:  释放记录内存
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.FreeRec(Rec: Pointer; bAddToTeampList: Boolean = False);
begin
  if (bAddToTeampList) and (FbHaveStateField) and
    (GetFieldValueAsInt(StateField, 0, Rec) = 1) then // 该值 在 有修改的撤销队列
  begin
    FTempStateChangedRecList.Add(Rec);
  end;

  FreeMem(Pointer(TPmRec(Rec).Rec));
  if BlobList.Count >= 0 then
  begin
    if (TPmRec(Rec).BlobRec <> nil) then
    begin
      FinalizeBlobData(TPmRec(Rec).BlobRec);
      FreeMem(Pointer(TPmRec(Rec).BlobRec));
    end;
  end;
  TPmRec(Rec).Free;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.DataChangedEvent
  作者:      李锋
  日期:      2010.05.05
  参数:      Event: TPMChangType; KeyValue: string = ''; Rec: Pointer = nil; RecIndex: Integer = -1
  返回值:    无
  功能描述:  数据变动事件
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.DataChangedEvent(Event: TPMChangType; Rec: Pointer = nil;
  FieldName: string = ''; NewValue: string = ''; OldValue: string = '';
  bInternal: Boolean = False);
var
  Key: string;

  procedure DeleteRecFromHash(Value: string; AHash: TObjectHashMapMgr);
  var
    i: Integer;
    TempRec: TTempRec;
  begin
    if Value = '' then
      Exit;
    TempRec := TTempRec(AHash.GetObject(Value));
    if TempRec = nil then
      Exit;
    i := TempRec.PmRecList.IndexOf(Rec);
    if i >= 0 then
      TempRec.PmRecList.Delete(i);
    if TempRec.PmRecList.Count = 0 then
    begin
      AHash.Remove(Value);
    end;
  end;

  procedure AddRecToHash(Value: string; Rec: Pointer; AHash: TObjectHashMapMgr);
  var
    TempRec: TTempRec;
  begin
    if Value = '' then
      Exit;
    if not AHash.Exist(Value) then
    begin
      TempRec := TTempRec.Create;
      AHash.AddObject(Value, TempRec);
    end
    else
      TempRec := TTempRec(AHash.GetObject(Value));
    TempRec.AddToList(Rec, RecList);
  end;

begin
  if not FChanged then
    FChanged := True;
  FInternalChanged := True;
  if not FNotifyChangeEvent then
    Exit;
  case Event of
    cDelete:
      begin
        FFieldHash_RecHash.Restart;
        while FFieldHash_RecHash.Next do
        begin
          Key := FFieldHash_RecHash.CurrentKey;
          DeleteRecFromHash(GetFieldValueAsString(Key, '', Rec),
            TObjectHashMapMgr(FFieldHash_RecHash.Items[Key]));
        end;
      end;
    cAddAfter, cAddBefore:
      begin
        if bInternal then // 内部撤销 恢复队列
        begin
          FFieldHash_RecHash.Restart;
          while FFieldHash_RecHash.Next do
          begin
            Key := FFieldHash_RecHash.CurrentKey;
            AddRecToHash(GetFieldValueAsString(Key, '', Rec), Rec,
              TObjectHashMapMgr(FFieldHash_RecHash.Items[Key]));
          end;
        end;
      end;
    cUpdate:
      begin
        if OldValue = NewValue then
          Exit;

        if Assigned(FOnAfterSetValue) and (FNotifyValueChanged) then
          FOnAfterSetValue(Rec, Self, OldValue, NewValue, FieldName);

        if FMaxValueField = FieldName then
        begin
          if StrToIntDef(NewValue, 0) > FMaxValue then
            FMaxValue := StrToIntDef(NewValue, 0);
        end;

        if FFieldHash_RecHash.ItemCount > 0 then
        begin
          FFieldHash_RecHash.Restart;
          while FFieldHash_RecHash.Next do
          begin
            Key := FFieldHash_RecHash.CurrentKey;
            if Key = FieldName then
            begin
              DeleteRecFromHash(OldValue,
                TObjectHashMapMgr(FFieldHash_RecHash.Items[Key]));
              AddRecToHash(GetFieldValueAsString(Key, '', Rec), Rec,
                TObjectHashMapMgr(FFieldHash_RecHash.Items[Key]));
            end;
          end;
        end;
      end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CheckDataHasChanged
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    Boolean
  功能描述:  判断数据集是否进行了变动
  ------------------------------------------------------------------------------- }

function TPMDataSet.CheckDataHasChanged: Boolean;
begin
  Result := FChanged;
end;

procedure TPMDataSet.SetDataChangeStatus(Value: Boolean);
begin
  FChanged := Value;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetMasterField
  作者:      李锋
  日期:      2010.05.05
  参数:      Value: string
  返回值:    无
  功能描述:  设置父表关联字段    从表设置
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetMasterField(Value: string);
var
  Rec: Pointer;
  Guid: string;
  i: Integer;
begin
  if Pos('=', Value) > 0 then
  begin
    FADOKeyValue := Trim(GetCol(Value, 0, '='));
    FADOMasterField := Trim(GetCol(Value, 1, '='));
    Filter := '';
    FMasterDataLink.FieldNames := FADOMasterField;
    FMasterDataLink.OnMasterChange := MasterChanged;
    FMasterDataLink.OnMasterDisable := MasterDisabled;
    if FMasterData <> nil then
    begin
      if FMasterData.GetRecordCount = 0 then
      begin
        try
          Rec := FMasterData.InsertAfter(nil);
          Guid := NewGuid;
          FMasterData.SetFieldValue(FADOMasterField, Guid, Rec);
          if FMasterData.CheckFieldExit('mc') then
            FMasterData.SetFieldValue('mc', 'BLANK', Rec);
          for i := 0 to RecList.Count - 1 do
          begin
            Rec := RecList[i];
            SetFieldValue(FADOKeyValue, Guid, Rec);
          end;
        except
          on e: Exception do
          begin
            AppendFiledata(cst_logname, cst_error_ED_0036 + e.Message);
          end;
        end;
      end;
    end;
  end
  else
  begin
    FADOKeyValue := '';
    FADOMasterField := '';
    IsFiltered := False;
    FMasterDataLink.FieldNames := '';
    FMasterDataLink.DataSource := nil;
    FMasterDataLink.OnMasterChange := nil;
    FMasterDataLink.OnMasterDisable := nil;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetMasterField
  作者:      李锋
  日期:      2010.05.06
  参数:      无
  返回值:    string
  功能描述:  取与父表的关联字段
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetMasterField: string;
begin
  Result := FADOMasterField;
  if FADOKeyValue <> '' then
    Result := FADOKeyValue + '=' + FADOMasterField;
end;

function TPMDataSet.GetMasterDataSource: TDataSource;
begin
  Result := FMasterSource;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetMasterDataSource
  作者:      李锋
  日期:      2010.05.05
  参数:      ASource: TDataSource
  返回值:    无
  功能描述:  设置父表关联DataSet    从表设置
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetMasterDataSet(ADataSet: TDataSet);
begin
  if ADataSet.DataSource = nil then
  begin
    FDataSource := TDataSource.Create(nil);
    FDataSource.DataSet := ADataSet;
    FMasterSource := FDataSource;
  end
  else
    FMasterSource := ADataSet.DataSource;
  FMasterData := TPMDataSet(ADataSet);

  if IsLinkedTo(DataSource) then
    DatabaseError(SCircularDataLink, Self);
  FMasterDataLink.DataSource := FDataSource;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetMasterDataSource
  作者:      李锋
  日期:      2010.05.05
  参数:      ASource: TDataSource
  返回值:    无
  功能描述:  设置父表关联DataSource
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetMasterDataSource(ASource: TDataSource);
begin
  // FMasterSource := ASource;
  // if IsLinkedTo(ASource) then DatabaseError(SCircularDataLink, Self);
  // FMasterDataLink.DataSource := ASource;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.MasterChanged
  作者:      李锋
  日期:      2010.05.05
  参数:      Sender: TObject
  返回值:    无
  功能描述:  父表数据变动事件
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.MasterChanged(Sender: TObject);
var
  newFilter: string;
begin
  FPMFilterRecordEvent := OnFilterprocedure;
  if TField(FMasterDataLink.Fields[0]).Value <> null then
    newFilter := TField(FMasterDataLink.Fields[0]).Value
  else
    newFilter := '';
  if Filter <> newFilter then
  begin
    Filter := newFilter;
    UpdateFilters;
  end;
  IsFiltered := True;
end;

procedure TPMDataSet.MasterDisabled(Sender: TObject);
begin

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.OnFilterprocedure
  作者:      李锋
  日期:      2010.05.05
  参数:      DataSet: TDataSet; Index: Integer; var Accept: Boolean
  返回值:    无
  功能描述:  过滤
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.OnFilterprocedure(DataSet: IPMDataset; Index: Integer;
  var Accept: Boolean);
var
  Value: string;
begin
  if Accept then
  begin
    if FADOKeyValue <> '' then
    begin
      Value := DataSet.GetFieldValue(FADOKeyValue, '', Index);
      // if value = Filter then
      // Accept := True;
      if Value <> Filter then
        Accept := False;
    end;
    if Accept then
      if Assigned(Self.OnFilterRecord) then
        Self.OnFilterRecord(Self, Accept);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetDetailDataset
  作者:      李锋
  日期:      2010.05.05
  参数:      AData: TPMDataSet
  返回值:    无
  功能描述:  设置从表
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetDetailDataset(AData: TPMDataSet);
begin
  FDetailDataSet := AData;
end;

procedure TPMDataSet.CreateRecHash(Field: string; Hash: TObjectHashMapMgr);
var
  i: Integer;
  RecValue: string;
  Temp: TTempRec;
begin
  for i := 0 to RecList.Count -1 do
  begin
    RecValue := GetFieldValue(Field, '', RecList[i]);
    if RecValue <> '' then
    begin
      if not Hash.Exist(RecValue) then
      begin
        Temp := TTempRec.Create;
        Hash.AddObject(RecValue, Temp);
      end
      else
        Temp := TTempRec(Hash.GetObject(RecValue));
      Temp.PmRecList.Add(RecList[i]);
    end;
  end;
end;
{
  var
  i, iValue, iRecValue: Integer;
  RecValue: string;
  Temp: TTempRec;
  objectHash: TObjectHash;
  strListHash: THashedStringList;
  dglHash: TStrIntHashMap;
  dglIntHash: TIntHashMultiMap;
  itMap: IStrIntMapIterator;
  itIntMap: IIntMapIterator;
  tempHash: TPMRECHashMod;
  bString: Boolean;
  begin
  tempHash := FHashMod;
  FHashMod := AHashMode;
  bString := True;
  case FHashMod of
  phHash2:
  begin
  ClearObjectHash(TObjectHash(Hash));
  objectHash := TObjectHash(Hash);
  objectHash.Clear;
  end;
  phIniFile:
  begin
  strListHash := THashedStringList(Hash);
  ClearHasdStrList(strListHash);
  strListHash.Clear;
  end;
  phDGl:
  begin
  if Hash is TIntHashMultiMap then
  begin
  dglIntHash := TIntHashMultiMap(Hash);
  FreeDglIntObjecHash(dglIntHash);
  bString := False;
  end
  else
  begin
  dglHash := TStrIntHashMap(Hash);
  FreeDglObjecHash(dglHash);
  end;
  end;
  end;
  for i := 0 to RecList.Count - 1 do
  begin
  if bString then
  RecValue := GetFieldValueAsString(Field, '', RecList[i])
  else
  begin
  iRecValue := GetFieldValueAsInt(Field, -1000, RecList[i]);
  RecValue := 't';
  end;
  if RecValue <> '' then
  begin
  case FHashMod of
  phHash2:
  begin
  if not objectHash.Exists(RecValue) then
  begin
  Temp := TTempRec.Create;
  objectHash.Items[RecValue] := Temp;
  end
  else
  Temp := TTempRec(objectHash.Items[RecValue]);
  Temp.PmRecList.Add(RecList[i]);
  end;
  phIniFile:
  strListHash.AddObject(RecValue, TObject(RecList[i]));
  phDGl:
  begin
  if Hash is TIntHashMultiMap then
  begin
  iValue := iRecValue;
  itIntMap := dglIntHash.Find(iValue);
  if itIntMap.IsEqual(dglIntHash.itEnd) then
  begin
  Temp := TTempRec.Create;
  dglIntHash.Insert(iValue, Integer(Temp));
  end
  else
  Temp := TTempRec(PInteger(itIntMap.Value));
  Temp.PmRecList.Add(RecList[i]);
  end
  else
  begin
  itMap := dglHash.Find(RecValue);
  if itMap.IsEqual(dglHash.itEnd) then
  begin
  Temp := TTempRec.Create;
  dglHash.Insert(RecValue, Integer(Temp));
  end
  else
  Temp := TTempRec(PInteger(itMap.Value));
  Temp.PmRecList.Add(RecList[i]);
  end;
  end;
  end;
  end;
  end;
  FHashMod := tempHash;
  end; }
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetDetailMaster
  作者:      李锋
  日期:      2010.05.05
  参数:      Value: string
  返回值:    无
  功能描述:  设置从表关联字段
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetDetailMaster(Value: string);
var
  dglHash: TObjectHashMapMgr;
begin
  FDetailMaster := Value;
  if Pos('=', Value) > 0 then
  begin
    FDetailField := Trim(GetCol(Value, 0, '='));
    FMasterField := Trim(GetCol(Value, 1, '='));
    case GetFieldTypeByName(FDetailField) of
      fInt:
        dglHash := TIntHashMgr_Dic.Create;
    else
      dglHash := TStrIntHashMgr_Dic.Create;
    end;

    CreateRecHash(FDetailField, dglHash);
    if FFieldHash_RecHash.Exists(FDetailField) then
      FFieldHash_RecHash.Items[FDetailField].Free;
    FFieldHash_RecHash.Items[FDetailField] := dglHash;
  end;
end;

function TPMDataSet.GetDetailMaster: string;
begin
  Result := FDetailMaster;
end;

function TPMDataSet.GetDetailField: string;
begin
  Result := FDetailField;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetDetailView
  作者:      李锋
  日期:      2010.05.05
  参数:      DetailField: string; ADetaiData: TPMDataSet; Rec: Pointer; iRecIndex: Integer
  返回值:    TPMDataView
  功能描述:  通过从表DataSet,关联字段和记录 获取 该记录从表视图
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetDetailView(DetailMasterField: string;
  ADetaiData: IPMDataset; Rec: Pointer): IPMDataView;
var
  AView: TPMLinkView;
begin
  Result := nil;
  if ADetaiData = nil then
    Exit;
  if Trim(DetailMasterField) = '' then
    Exit;
  if Rec = nil then
    Exit;
  if ADetaiData.GetDetailMaster <> DetailMasterField then
    ADetaiData.SetDetailMaster(DetailMasterField);
  AView := TPMLinkView.Create(nil);
  AView.FDetailField := ADetaiData.GetDetailField;
  AView.SetDataSet(TPMDataSet(ADetaiData.GetObject), False);
  AView.FKeyValue := GetFieldValueAsString(ADetaiData.GetPmMasterField,
    '', Rec);
  AView.AssignedRec(False);
  Result := AView;
end;

function TPMDataSet.GetObject: Pointer;
begin
  Result := Self;
end;

function TPMDataSet.CreateView(AViewType: TPMViewType): IPMDataView;
begin
  case AViewType of
    tDefault:
      Result := TPMDataView.Create(Self);
    tLinkVertical:
      Result := TPMLinkView.Create(Self);
    tLinkRow:
      Result := TPMLinkDetailView.Create(Self);
    tLinkRecView:
      Result := TPmExtractDataView.Create(Self);
  end;
end;

function TPMDataSet.GetExitView(bCreate: Boolean = True;
  AViewType: TPMViewType = tDefault): IPMDataView;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to FDataViewList.Count - 1 do
  begin
    Result := TPMDataView(FDataViewList[i]);
    case Result.GetState of
      vDefault:
        Exit;
    end;
    Result := nil;
  end;
  if (Result = nil) and (bCreate) then
    Result := CreateView(AViewType);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetDetailView
  作者:      李锋
  日期:      2010.05.25
  参数:
  返回值:    string
  功能描述:  取PM模式下的 Massterfield
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetPmMasterField: string;
begin
  Result := FMasterField;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetDataEmptyStatus
  作者:      李锋
  日期:      2010.06.02
  参数:      无
  返回值:    Boolean
  功能描述:  获取当前Dataset是否为空记录 空字段状态
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetDataEmptyStatus: Boolean;
begin
  Result := FDataEmpty;
end;

function TPMDataSet.GetTableName: string;
begin
  Result := FTableName;
end;

procedure TPMDataSet.SetTableName(const Value: string);
begin
  FTableName := Value;
  FAttributeHash.Items[TableName] := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SerializedRec
  作者:      李锋
  日期:      2010.06.21
  参数:      无
  返回值:    无
  功能描述:  序列化记录中的 stateinfo字段   当数据集clear时调用
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SerializedRec;
var
  i, iAdress: Integer;
begin
  FbHaveStateRecord := True;
  for i := 0 to RecList.Count - 1 do
  begin

    // 注   该代码 因为暂时 不垮工程节点 撤销 所以  切换节点时 释放所有撤销对象
    // InternalSetFieldValue(StateField, null, RecList[i]);
    try
      iAdress := GetFieldValue(StateField, -1, RecList[i]);
      if iAdress > 0 then
      begin
        with TStateInfo(PInteger(iAdress)) do
        begin
          State := sStream;
          SelfBuffer := nil;
          Free; // 释放
        end;
      end;
      InternalSetFieldValue(StateField, null, RecList[i]);
      // 设置   StateField字段值为空
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ED_0035 + e.Message);
        // 设置   StateField字段值为空
        InternalSetFieldValue(StateField, null, RecList[i]);
      end;
    end;
  end;
  FRecStatus := recTempClear;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SerializedRecIndex
  作者:      李锋
  日期:      2010.06.08
  参数:      无
  返回值:    无
  功能描述:  序列化 记录Index 到recid字段中
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SerializedRecIndex;
var
  i: Integer;
  procedure SerializedStateList;
  var
    i, Index: Integer;
  begin
    for i := 0 to FStateIndexList.Count - 1 do
    begin
      Index := Integer(FStateIndexList[i]);
      TDataStateManger(FSelfManageStateList[index])
        .SaveRecIndex(FStateChangRecIndexList[i]);
    end;
  end;

begin
  // 先遍历 state列表 判断 有没修改的 对象 如果有 记录index  再决定是否要 记录 recid
  FreeStateIndexList;
  for i := 0 to FSelfManageStateList.Count - 1 do
    if TDataStateManger(FSelfManageStateList[i])
      .isHaveChangRec(FStateChangRecIndexList) then
      FStateIndexList.Add(Pointer(i));
  if FStateIndexList.Count <> FStateChangRecIndexList.Count then
    Exit;
  if FStateIndexList.Count > 0 then // 有Changer记录 遍历index 通过buffer保存
  begin
    FMarkState := False;
    for i := 0 to RecList.Count - 1 do
      SetFieldValue('RecId', i, i);
    SerializedStateList; // 序列化 state对象 保存记录的index到对象中 用来恢复
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CreateRecIDField
  作者:      李锋
  日期:      2010.06.08
  参数:      无
  返回值:    无
  功能描述:  创建recid字段
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.CreateRecIDField;
var
  IntFieldRw: TIntFieldRW;
begin
  inherited CreateRecIDField;
  IntFieldRw := TIntFieldRW.Create(Self);
  IntFieldRw.FieldIndex := 0;
  IntFieldRw.Field := RecIdField;
  FObjectFieldHash.AddObject(RecIdField.FieldName, IntFieldRw);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.FreeStateIndexList
  作者:      李锋
  日期:      2010.06.08
  参数:      无
  返回值:    无
  功能描述:  释放stateindexlIST内存
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.FreeStateIndexList;
var
  i: Integer;
begin
  for i := 0 to FStateChangRecIndexList.Count - 1 do
    TList(FStateChangRecIndexList[i]).Free;
  FStateIndexList.Clear;
  FStateChangRecIndexList.Clear;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.DeserializeState
  作者:      李锋
  日期:      2010.06.08
  参数:      无
  返回值:    无
  功能描述:  反序列化 statelist 中的changer
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.DeserializeState;
var
  i: Integer;
begin
  for i := 0 to FStateIndexList.Count - 1 do
    TDataStateManger(FSelfManageStateList[Integer(FStateIndexList[i])])
      .RecoverRecBufferByIndex(FStateChangRecIndexList[i]);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.DeserializeRec
  作者:      李锋
  日期:      2010.06.21
  参数:      无
  返回值:    无
  功能描述:  反序列化 记录中的statefield
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.DeserializeRec;
var
  i, iAdress: Integer;
begin
  FRecStatus := recDefault; // 记录状态 默认状态
  if FbHaveStateRecord then
  begin
    for i := 0 to RecList.Count - 1 do
    begin
      iAdress := GetFieldValue(StateField, -1, RecList[i]);
      if iAdress > 0 then
        with TStateInfo(PInteger(iAdress)) do
        begin
          case State of
            sStream:
              begin
                State := sMemery;
                SelfBuffer := RecList[i];
              end;
            sFree:
              begin
                Free; // 释放
                InternalSetFieldValue(StateField, null, RecList[i]); // 设置为空
              end;
          end;
        end;
    end;
  end
  else
    for i := 0 to RecList.Count - 1 do
      InternalSetFieldValue(StateField, null, RecList[i]); // 设置为空
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CreateStateField
  作者:      李锋
  日期:      2010.06.18
  参数:      无
  返回值:    无
  功能描述:  创建   StateField 字段
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.CreateStateField;
begin
  if not FbHaveStateField then
  begin
    AddField(StateField, fInt);
    FbHaveStateField := True;
  end;
end;

procedure TPMDataSet.SetManageStateCount(Value: Integer);
begin
  // if FRecStatus = recDefault then
  FManageStateCount := Value;
end;

function TPMDataSet.GetRecList: TList;
begin
  Result := RecList;
end;

procedure TPMDataSet.SetLogStatus(Value: Boolean);
begin
  FLog := Value;
end;

procedure TPMDataSet.SetLogFile(FileName: string);
begin
  FLogFile := FileName;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalLog
  作者:      李锋
  日期:      2010.06.30
  参数:      Msg: string
  返回值:    无
  功能描述:  记录日记文件
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.InternalLog(Msg: string);
begin
  if FLog then
  begin
    if FLogFile = '' then
    begin
      FLogFile := 'Log\DataSet\';
      if FTableName <> '' then
        FLogFile := FLogFile + FTableName + '\'
      else
        FLogFile := FLogFile + DefaultFile + '\';
      FLogFile := FLogFile + FGuid + '.Log';
    end;
    AppendFiledata(FLogFile, Msg);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CheckFiletrRecodrd
  作者:      lifeng
  日期:      2010.07.20
  参数:      index: Integer; var Accepted: Boolean
  返回值:    无
  功能描述:  抛出过滤
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.CheckFiletrRecodrd(index: Integer; var Accepted: Boolean);
begin
  // Modified by hwf Time:2011-7-19 下午 08:19:39 Directions:对于一个数据集的情况
  if Assigned(FPMFilterRecordEvent) then
    FPMFilterRecordEvent(Self, index, Accepted)
  else
  begin
    if Accepted then
      if Assigned(OnFilterRecord) then
        OnFilterRecord(Self, Accepted);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CheckFieldExit
  作者:      lifeng
  日期:      2010.07.20
  参数:      Field: string
  返回值:    Boolean
  功能描述:  检查字段是否存在
  ------------------------------------------------------------------------------- }

function TPMDataSet.CheckFieldExit(Field: string): Boolean;
begin
  if FFieldList.Count = 0 then
    GetFieldList;
  Result := FObjectFieldHash.GetObject(Field) <> nil;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalCopyData
  作者:      lifeng
  日期:      2010.07.20
  参数:      ASource, ADest: Pointer
  返回值:    无
  功能描述:  复制数据
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.InternalCopyData(ASource, ADest: Pointer);
var
  i: Integer;
  Field: string;
begin
  if (ASource = nil) or (ADest = nil) then
    Exit;
  try
    for i := 0 to FFieldList.Count - 1 do
    begin
      Field := FFieldList.Strings[i];
      // if Field = StateField then
      // Continue;
      SetFieldValue(Field, GetFieldValue(Field, '', ASource), ADest);
    end;
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0034 + e.Message);
    end;
  end;
end;

procedure TPMDataSet.InternalCopyData(ASource, ADest: Pointer;
  ExceptField: array of string);
var
  i: Integer;
  Field: string;
  function CheckFieldInExcept(AField: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 0 to High(ExceptField) do
      if AField = ExceptField[i] then
      begin
        Result := True;
        Break;
      end;
  end;

begin
  if (ASource = nil) or (ADest = nil) then
    Exit;
  try
    for i := 0 to FFieldList.Count - 1 do
    begin
      Field := FFieldList.Strings[i];
      if Field = StateField then
        Continue;
      if CheckFieldInExcept(Field) then
        Continue;
      SetFieldValue(Field, GetFieldValueAsString(Field, '', ASource), ADest);
    end;
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0033 + e.Message);
    end;
  end;

end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.DeleteAllRec
  作者:      lifeng
  日期:      2010.07.28
  参数:      无
  返回值:    无
  功能描述:   删除所有记录
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.DeleteAllRec;
var
  TempNotif: Boolean;
begin
  { if (FOwner <> nil) and (not FbBeginChang) and (FOwner is TPmLibDataSet) then
    begin
    FbBeginChang := True;
    try
    TPmLibDataSet(FOwner).DeleteAllRec;
    finally
    FbBeginChang := False;
    end;
    end
    else
    begin }
  TempNotif := FNotifyChanged;
  FNotifyChanged := False;
  while True do
  begin
    if RecList.Count = 0 then
      Break;
    DeleteRow(RecList.Last);
  end;
  FNotifyChanged := TempNotif;
  if FNotifyChanged then
    RefreshViews; // 刷新
  // end;
end;

function TPMDataSet.GetLevelStatus: Boolean;
begin
  Result := FLevel;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.MoveRecByLevel
  作者:      lifeng
  日期:      2010.08.05
  参数:      Rec: Pointer; AMoveMode: TMoveMode
  返回值:    无
  功能描述:  根据层次移动数据
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.MoveRecByLevel(Rec: Pointer; AMoveMode: TMoveMode);
var
  Index: Integer;
  MoveList: TList;
begin
  Index := RecList.IndexOf(Rec);
  if Index < 0 then
    Exit;
  MoveList := TList.Create;
  try
    MoveList.Add(RecList);
    MoveList.Add(Data.Values);
    if BlobList.Count > 0 then
      MoveList.Add(BlobList);
    MovePMListByLevel(RecList, Index, Self, MoveList, AMoveMode,
      ((FMarkState) and (FDataStateManger <> nil)));
    FChanged := True;
    FInternalChanged := True;
    //
    DeleteAllIndex;
  finally
    MoveList.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.MoveSingleRecCross
  作者:      lifeng
  日期:      2010.08.16
  参数:      Rec: Pointer; AMoveMode: TMoveMode
  返回值:    无
  功能描述:  跨界单条记录移动
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.MoveSingleRecCross(Rec: Pointer; AMoveMode: TMoveMode);
var
  Index, Level, iTemp: Integer;
begin
  Index := RecList.IndexOf(Rec);
  if Index < 0 then
    Exit;
  FChanged := True;
  FInternalChanged := True;
  if not FLevel then
    MoveRecByLevel(Rec, AMoveMode)
  else
  begin
    Level := GetFieldValue(RecordLevel, 0, Rec);
    case AMoveMode of
      mmUp:
        begin
          if Index = 0 then
            Exit;
          if Level <= GetFieldValue(RecordLevel, 0, index - 1) then
            MoveRecByLevel(Rec, AMoveMode) // 与上一个等级相等  或比上一个小
          else
          begin
            iTemp := Index - 2; // 跳过一条记录往上找
            while True do
            begin
              if iTemp <= 0 then
                Exit;
              if Level >= GetFieldValue(RecordLevel, 0, iTemp) then
                Break;
              Dec(iTemp);
            end;
            RecList.Delete(Index);
            RecList.Insert(iTemp + 1, Rec);
            Data.Values.Delete(Index);
            Data.Values.Insert(iTemp + 1, TPmRec(Rec).Rec);
            BlobList.Delete(Index);
            BlobList.Insert(iTemp + 1, TPmRec(Rec).BlobRec);
          end;
        end;
      mmDown:
        begin
          if Index = RecList.Count - 1 then
            Exit;
          if Level <= GetFieldValue(RecordLevel, 0, index + 1) then
            MoveRecByLevel(Rec, AMoveMode) // 与下一个等级相等  或比下一个小
          else
          begin
            iTemp := Index + 2; // 跳过一条记录往下找
            if iTemp >= RecList.Count then
            begin
              RecList.Delete(Index);
              RecList.Add(Rec);
              Data.Values.Delete(Index);
              Data.Values.Add(TPmRec(Rec).Rec);
              BlobList.Delete(Index);
              BlobList.Add(TPmRec(Rec).BlobRec);
            end
            else
            begin
              RecList.Insert(iTemp, Rec);
              RecList.Delete(Index);
              Data.Values.Insert(iTemp, TPmRec(Rec).Rec);
              Data.Values.Delete(Index);
              BlobList.Insert(iTemp, TPmRec(Rec).BlobRec);
              BlobList.Delete(Index);

            end;

          end;
        end;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SerializeRecIndex
  作者:      lifeng
  日期:      2010.08.09
  参数:      BeginSize, EndSize: Integer
  返回值:    无
  功能描述:  序列化索引
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SerializeRecIndex(BeginSize, EndSize: Integer;
  RecIndex: Integer = -1; Rec: Pointer = nil);
// var
// Hash: THashedStringList;
// Key, Value: string;
// RecIndexInfo: TRecIndexInfo;
begin
  inherited;
  { if FRecIndexHash.ItemCount > 0 then
    begin
    FRecIndexHash.Restart;
    RecIndexInfo := TRecIndexInfo.Create;
    RecIndexInfo.BeginPosion := BeginSize;
    RecIndexInfo.EndPosion := EndSize;
    while FRecIndexHash.Next do
    begin
    Key := FRecIndexHash.CurrentKey;
    Hash := THashedStringList(FRecIndexHash.Items[Key]);
    if RecIndex >= 0 then
    Value := GetFieldValue(Key, '', RecIndex)
    else if Rec <> nil then
    Value := GetFieldValue(Key, '', Rec);
    if Value = '' then
    Value := '@dft@';
    Hash.AddObject(Value, RecIndexInfo);
    end;
    end; }
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetFieldRecIndex
  作者:      lifeng
  日期:      2010.08.09
  参数:      FieldName: string
  返回值:    无
  功能描述:  设置索引字段
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SetIndexInSream(FieldName: string);
// var
// RecHash: THashedStringList;
begin
  { if FieldName = '' then Exit;
    if FRecIndexHash.Exists(FieldName) then Exit;
    RecHash := THashedStringList.Create;
    FRecIndexHash.Items[FieldName] := RecHash; }
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalClear
  作者:      lifeng
  日期:      2010.08.09
  参数:      无
  返回值:    无
  功能描述:  清理记录索引hash表    存放在 FRecIndexHash中的对象是  THashedStringList
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.InternalClearStreamHash;
// var
// Key: string;
// i: Integer;
// hash: THashedStringList;
// bFirstFree: Boolean;
// bFirstFree: Boolean;
begin
  { FRecIndexHash.Restart;
    bFirstFree := True; //该参数 是因为  当保持时 hash中保存的对象 只有一份
    while FRecIndexHash.Next do
    begin
    Key := FRecIndexHash.CurrentKey;
    hash := THashedStringList(FRecIndexHash.Items[key]);
    if bFirstFree then
    begin
    for i := 0 to hash.Count - 1 do
    hash.Objects[i].Free;

    bFirstFree := False;
    end;
    hash.Clear;
    end; }
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalClearStreamHashObject
  作者:      lifeng
  日期:      2010.11.19
  参数:      bFreeHash: Boolean = True
  返回值:    无
  功能描述:   存放在  FRecIndexHash 中的对象是   TObjectHash
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.InternalClearStreamHashObject;
// var
// Key: string;
// hash: TObjectHash;
begin
  { FRecIndexHashInUser.Restart;
    while FRecIndexHashInUser.Next do
    begin
    Key := FRecIndexHashInUser.CurrentKey;
    hash := TObjectHash(FRecIndexHashInUser.Items[key]);
    ClearObjectHash(hash);
    hash.Free;
    end; }
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SaveRecIndexToStream
  作者:      lifeng
  日期:      2010.08.09
  参数:      无
  返回值:    无
  功能描述:  序列化索引表到留中
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.SaveRecIndexToStream(Stream: TStream);
// var
// key, Value: string;
// bPosion, keyPosion, lenKey, lenValue, Count: Integer;
// Hash: THashedStringList;
// i: Integer;
begin
  { if FRecIndexHash.ItemCount > 0 then
    begin
    Hash := nil;
    FRecIndexHash.Restart;
    Key := '';
    bPosion := Stream.Size;
    Stream.Position := Stream.Size;
    while FRecIndexHash.Next do
    begin //存key和value
    key := FRecIndexHash.CurrentKey;
    Hash := THashedStringList(FRecIndexHash.Items[key]);
    if Hash.Count = 0 then Continue;
    lenKey := Length(Key);
    Stream.Write(lenKey, SizeOf(Integer));
    Stream.Write(PAnsiChar(Key)^, lenKey);
    Count := Hash.Count;
    Stream.Write(Count, SizeOf(Integer));
    for i := 0 to Hash.Count - 1 do
    begin
    Value := Hash.Strings[i];
    lenValue := Length(Value);
    Stream.Write(lenValue, SizeOf(Integer));
    Stream.Write(PAnsiChar(Value)^, lenValue);
    end;
    end;
    keyPosion := Stream.Position;
    if Hash <> nil then
    begin
    for i := 0 to Hash.Count - 1 do //保存 记录在流中的位置
    with TRecIndexInfo(Hash.Objects[i]) do
    begin
    Stream.Write(BeginPosion, SizeOf(Integer));
    Stream.Write(EndPosion, SizeOf(Integer));
    end;
    end;
    Stream.Write(bPosion, SizeOf(Integer));
    Stream.Write(keyPosion, SizeOf(Integer));
    end; }
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.LoadRecIndex
  作者:      lifeng
  日期:      2010.08.10
  参数:      Stream: TStream
  返回值:    无
  功能描述:  加载索引列表，不加载数据
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.LoadRecIndex(Stream: TStream);
// var
// bPosion, kPosion, lenK, lenV, Count: Integer;
// Key, Value: string;
// i, Index: Integer;
// RecIndexInfo: TRecIndexInfo;
// IndexList: TList;
// TempRec: TTempRec;
// obHash: TObjectHash;
begin
  { if Stream = nil then Exit;
    LoadStructure(Stream);
    LoadAttribute(Stream);
    Close;
    Open;
    Stream.Position := Stream.Size - 8;
    Stream.Read(bPosion, SizeOf(Integer));
    Stream.Read(kPosion, SizeOf(Integer));
    if bPosion = kPosion then Exit; //无索引
    if kPosion = Stream.Size then Exit; //无记录
    IndexList := TList.Create;
    try
    Stream.Position := kPosion;
    while True do
    begin
    if Stream.Position >= Stream.Size then Break;
    RecIndexInfo := TRecIndexInfo.Create;
    Stream.Read(RecIndexInfo.BeginPosion, SizeOf(Integer));
    Stream.Read(RecIndexInfo.EndPosion, SizeOf(Integer));
    IndexList.Add(RecIndexInfo);
    end;

    Stream.Position := bPosion;
    while True do
    begin
    if Stream.Position >= kPosion then Break;
    Stream.Read(lenK, SizeOf(Integer));
    SetLength(Key, lenK);
    Stream.Read(pAnsiChar(key)^, lenK);
    //      Hash := THashedStringList.Create;
    obHash := TObjectHash.Create;
    FRecIndexHashInUser.Items[Key] := obHash;
    Stream.Read(Count, SizeOf(Integer));
    for i := 0 to Count - 1 do
    begin
    try
    Stream.Read(lenV, SizeOf(Integer));
    SetLength(Value, lenV);
    Stream.Read(PAnsiChar(Value)^, lenV);
    if obHash.Exists(Value) then
    TempRec := TTempRec(obHash.Items[Value])
    else
    begin
    TempRec := TTempRec.Create;
    TempRec.bObjectInList := True;
    obHash.Items[Value] := TempRec;
    end;
    TempRec.PmRecList.Add(TRecIndexInfo(IndexList[i]));
    except
    end;
    end;
    end;
    FStream := Stream;
    FLoadIndex := True;
    finally
    IndexList.Free;
    end; }
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetRecByIndex
  作者:      lifeng
  日期:      2010.08.10
  参数:      FieldName, Value: string
  返回值:    Pointer
  功能描述:  在不全部加载数据的情况下 通过索引取记录
  ------------------------------------------------------------------------------- }

// function TPMDataSet.FindRecByIndexFromStream(FieldName, Value: string): Pointer;
// var
// Hash: TObjectHash;
// index, attlen, StrucLen: Integer;
// RecIndexInfo: TRecIndexInfo;
// TempRec: TTempRec;
// begin
{ Result := nil;
  if FieldName = '' then Exit;
  if not FRecIndexHashInUser.Exists(FieldName) then Exit;
  //  SetIndex(FieldName);
  Result := FindRec(FieldName, Value, True); // 内存中查找
  if Result = nil then
  begin // 在数据流中查找
  Hash := TObjectHash(FRecIndexHashInUser.Items[FieldName]);

  if Hash.Exists(Value) then
  begin
  if FReadStream = nil then
  begin
  FStream.Position := 0;
  FStream.Read(attlen, SizeOf(Integer)); //读属性存放长度
  FStream.Position := SizeOf(Integer) + attlen; // 设置  Position
  FStream.Read(StrucLen, SizeOf(Integer)); //表结构长度
  FStream.Position := FStream.Position + StrucLen;

  FReadStream := TdxMemDataStreamReader.Create(Self, FStream);
  FReadStream.FieldHash := FFieldHash;
  FReadStream.ReadVerNoFromStream;
  FReadStream.ReadFieldsFromStream;
  FReadStream.FillFieldList;
  end;

  TempRec := TTempRec(Hash.Items[Value]);
  if TempRec.PmRecList.Count > 0 then
  begin
  RecIndexInfo := TRecIndexInfo(TempRec.PmRecList[0]);
  FStream.Position := RecIndexInfo.BeginPosion;
  FReadStream.ReadRecordFromStream;
  FReadStream.AddRecord;

  Result := RecList.Last;
  SetIndex(FieldName);
  DataChangedEvent(cUpdate, Result, FieldName, Value, ''); //数据集记录修改 维护索引
  end;
  end;
  end; }
// end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.FindRecListByIndexFromStream
  作者:      lifeng
  日期:      2010.11.19
  参数:      FieldName, Value: string; ARecList: TList
  返回值:    无
  功能描述:  在stream中查找列表
  ------------------------------------------------------------------------------- }

// procedure TPMDataSet.FindRecListByIndexFromStream(FieldName, Value: string; ARecList: TList);
// var
// Hash: TObjectHash;
// index, attlen, StrucLen, i: Integer;
// RecIndexInfo: TRecIndexInfo;
// TempRec: TTempRec;
// begin
{ if ARecList = nil then Exit;
  if FieldName = '' then Exit;
  ARecList.Clear;
  if not FRecIndexHashInUser.Exists(FieldName) then Exit;
  FindRecList(FieldName, Value, ARecList); // 内存中查找
  if ARecList.Count = 0 then
  begin // 在数据流中查找
  Hash := TObjectHash(FRecIndexHashInUser.Items[FieldName]);
  if Hash.Exists(Value) then
  begin
  if FReadStream = nil then
  begin
  FStream.Position := 0;
  FStream.Read(attlen, SizeOf(Integer)); //读属性存放长度
  FStream.Position := SizeOf(Integer) + attlen; // 设置  Position
  FStream.Read(StrucLen, SizeOf(Integer)); //表结构长度
  FStream.Position := FStream.Position + StrucLen;

  FReadStream := TdxMemDataStreamReader.Create(Self, FStream);
  FReadStream.FieldHash := FFieldHash;
  FReadStream.ReadVerNoFromStream;
  FReadStream.ReadFieldsFromStream;
  FReadStream.FillFieldList;
  end;

  TempRec := TTempRec(Hash.Items[Value]);
  if TempRec.PmRecList.Count > 0 then
  begin
  for i := 0 to TempRec.PmRecList.Count - 1 do
  begin
  RecIndexInfo := TRecIndexInfo(TempRec.PmRecList[i]);
  FStream.Position := RecIndexInfo.BeginPosion;
  FReadStream.ReadRecordFromStream;
  FReadStream.AddRecord;
  ARecList.Add(RecList.Last);
  DataChangedEvent(cUpdate, RecList.Last, FieldName, Value, ''); //数据集记录修改 维护索引
  end;
  SetIndex(FieldName);
  end;
  end;
  end; }

// end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.FindRec
  作者:      lifeng
  日期:      2010.08.11
  参数:      FieldName: string; Value: Variant
  返回值:    Pointer
  功能描述:  根据索引查找记录
  ------------------------------------------------------------------------------- }

function TPMDataSet.FindRec(FieldName, Value: string;
  bCreateIndex: Boolean = True): Pointer;
var

  TempRec: TTempRec;
  Hash: TObjectHashMapMgr;
begin
  Result := nil;
  if FieldName = '' then
    Exit;
  if GetRecordCount = 0 then
    Exit;
  if not FFieldHash_RecHash.Exists(FieldName) then
    if bCreateIndex then
      SetIndex(FieldName);

  if FFieldHash_RecHash.Exists(FieldName) then
  begin
    Hash := TObjectHashMapMgr(FFieldHash_RecHash.Items[FieldName]);
    TempRec := TTempRec(Hash.GetObject(Value));
    if TempRec = nil then
      Exit;
    Result := TempRec.PmRecList.First;
  end
  else
  begin
    if not CheckFieldExit(FieldName) then
      Exit;
    Result := GetRecByFieldValue(FieldName, Value);
  end;
end;

function TPMDataSet.FindRec(FieldName: string; Value: Integer): Pointer;
begin
  Result := FindRec(FieldName, IntToStr(Value));
end;

procedure TPMDataSet.FindRecList(FieldName: string; Value: Integer;
  var RecList: TList);
// 查找记录 列表
begin
  FindRecList(FieldName, IntToStr(Value), RecList);
end;

procedure TPMDataSet.FindRecList(FieldName, Value: string; var RecList: TList;
  bCreateIndex: Boolean = True);
// 查找记录 列表
// 查找记录 列表
var
  Hash: TObjectHashMapMgr;
  i: Integer;
  TempRec: TTempRec;
begin
  if FieldName = '' then
    Exit;
  if GetRecordCount = 0 then
    Exit;
  if not FFieldHash_RecHash.Exists(FieldName) then
    if bCreateIndex then
      SetIndex(FieldName);

  if FFieldHash_RecHash.Exists(FieldName) then
  begin
    Hash := TObjectHashMapMgr(FFieldHash_RecHash.Items[FieldName]);
    TempRec := TTempRec(Hash.GetObject(Value));
    if TempRec = nil then
      Exit;
    for i := 0 to TempRec.PmRecList.Count - 1 do
      RecList.Add(TempRec.PmRecList.Items[i]);
  end;

end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.SetIndex
  作者:      lifeng
  日期:      2010.08.11
  参数:      FieldName: string
  返回值:    无
  功能描述:   建索引
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.DeleteIndex(FieldName: string; bDelete: Boolean = True);
var
  Hash: TObjectHashMapMgr;
begin
  if FieldName = '' then
    Exit;
  if FFieldHash_RecHash.Exists(FieldName) then
  begin
    Hash := TObjectHashMapMgr(FFieldHash_RecHash.Items[FieldName]);
    Hash.Free;
    if bDelete then
      FFieldHash_RecHash.Delete(FieldName);
  end;

end;

procedure TPMDataSet.DeleteAllIndex;
var
  Key: string;
begin
  FFieldHash_RecHash.Restart;
  try
    while FFieldHash_RecHash.Next do
    begin
      Key := FFieldHash_RecHash.CurrentKey;
      DeleteIndex(Key, False);
    end;
  finally
    FFieldHash_RecHash.Clear;
  end;

  FDetailField := '';
  FMasterField := '';
  FDetailMaster := '';
end;

procedure TPMDataSet.SetIndex(FieldName: string;
  AHashMode: TPMRECHashMod = phNone; bReSet: Boolean = False);
var
  Hash: TObjectHashMapMgr;
begin
  if FieldName = '' then
    Exit;
  if GetRecordCount = 0 then
    Exit;
  if FFieldHash_RecHash.Exists(FieldName) then
  begin
    if not bReSet then
      Exit;
    Hash := TObjectHashMapMgr(FFieldHash_RecHash.Items[FieldName]);
    Hash.Free;
    FFieldHash_RecHash.Delete(FieldName);
  end;
  if not CheckFieldExit(FieldName) then
    Exit;

  case GetFieldTypeByName(FieldName) of
    fInt:
      Hash := TIntHashMgr_Dic.Create;
  else
    Hash := TStrIntHashMgr_Dic.Create;
  end;
  CreateRecHash(FieldName, Hash);
  FFieldHash_RecHash.Items[FieldName] := Hash;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetFieldType
  作者:      lifeng
  日期:      2010.08.19
  参数:      FieldName: string
  返回值:    TPMFieldType
  功能描述:  取字段类型
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetFieldTypeByName(FieldName: string): TPMFieldType;
var
  FieldRw: TFieldRWBase;
begin
  Result := fStr;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw <> nil then
    Result := FieldRw.FieldType;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.NotifyUpdate
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec: Pointer; PmNode: IPMNode; NewValue, OldValue, FieldName: string
  返回值:    无
  功能描述:  通知视图数据修改
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.NotifyUpdate(Rec: Pointer; PmNode: IPMNode;
  NewValue, OldValue, FieldName: string);
var
  i: Integer;
  View: TPMDataView;
begin
  if FNotifyChanged then
  begin
    for i := 0 to FDataViewList.Count - 1 do
    begin
      try
        if i >= FDataViewList.Count then
          Break; // 尝试解决：bdcu 生成时 View 可能减少 导致的报错
        View := TPMDataView(FDataViewList.Items[i]);
        if (FChangedView <> nil) and (FChangedView <> View) then
          Continue;
        View.DataChanged(Rec);
        View.OnDataUpdate(Rec, PmNode, NewValue, OldValue, FieldName);
      except
        on e: Exception do
        begin
          AppendFiledata(cst_logname, cst_error_ED_0032 + e.Message);
        raise Exception.Create('修改记录，刷新视图出错！！！FieldName:' + FieldName +
           ' ; tablename:' + FTableName);
        end;
      end;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.NotifyDelete
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec: Pointer; RecIndex: Integer
  返回值:    无
  功能描述:  通知视图 数据删除
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.NotifyDelete(Rec: Pointer; RecIndex: Integer;
  bInternal: Boolean = False);
var
  i: Integer;
  View: TPMDataView;
  Index: Integer;
begin
  if FNotifyChanged then
  begin
    for i := 0 to FDataViewList.Count - 1 do
    begin
      try
        if i >= FDataViewList.Count then
          Break; // 尝试解决：bdcu 生成时 View 可能减少 导致的报错
        View := TPMDataView(FDataViewList.Items[i]);
        if (FChangedView <> nil) and (FChangedView <> View) then
          Continue;
        View.DataChanged(Rec);
        // if FTableName = 'fbfxdehl' then
        // FTableName := 'fbfxdehl';
        View.OnDataDetete(Rec, RecIndex, bInternal, Index);
      except
        on e: Exception do
        begin
          AppendFiledata(cst_logname, cst_error_ED_0031 + e.Message);
          raise Exception.Create('删除记录，刷新视图出错！！' );
        end;
      end;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.NotifyAdd
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec, OppRec: Pointer; RecIndex, OppRecIndex: Integer; ChangType: TPMChangType; bInternal: Boolean
  返回值:    无
  功能描述:  通知视图数据添加
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.NotifyAdd(Rec, OppRec: Pointer;
  RecIndex, OppRecIndex: Integer; ChangType: TPMChangType; bInternal: Boolean);
var
  i: Integer;
  View: TPMDataView;
begin
  if FNotifyChanged then
  begin
    for i := 0 to FDataViewList.Count - 1 do
    begin
      try
        if i >= FDataViewList.Count then
          Break; // 尝试解决：bdcu 生成时 View 可能减少 导致的报错
        View := TPMDataView(FDataViewList.Items[i]);
        if (FChangedView <> nil) and (FChangedView <> View) then
          Continue;

        View.DataChanged(Rec);
        View.OnDataAdd(Rec, OppRec, RecIndex, OppRecIndex, ChangType,
          bInternal);
      except
        on e: Exception do
        begin
          AppendFiledata(cst_logname, cst_error_ED_0030 + e.Message);
            raise Exception.Create('添加记录，刷新视图出错！！！');
        end;
      end;
    end;
  end;
end;

procedure TPMDataSet.SetOnAfterUnReDo(Value: TOnAfterUnReDo);
begin
  FOnAfterUnReDo := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CreateNewDataSet
  作者:      lifeng
  日期:      2010.08.31
  参数:      无
  返回值:    IPMDataset
  功能描述:  创建新的数据集（无关任何操作）
  ------------------------------------------------------------------------------- }

function TPMDataSet.CreateNewDataSet: IPMDataset;
begin
  Result := TPMDataSet.Create(nil);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalFreeIndexObject
  作者:      lifeng
  日期:      2010.09.08
  参数:      无
  返回值:    无
  功能描述:  释放字段索引对象
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.InternalFreeIndexObject;
var
  Key: string;
begin
  FFieldHash_RecHash.Restart;
  while FFieldHash_RecHash.Next do
  begin
    Key := FFieldHash_RecHash.CurrentKey;
    FFieldHash_RecHash.Items[Key].Free;
  end;
  FFieldHash_RecHash.Clear;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalSetFieldValue
  作者:      lifeng
  日期:      2010.09.13
  参数:      FieldName: string; Value: Variant; Rec: Pointer
  返回值:    无
  功能描述:  设置内部使用字段
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.InternalSetFieldValue(FieldName: string; Value: Variant;
  Rec: Pointer);
var
  FieldRw: TFieldRWBase;
begin
  if Rec = nil then
    Exit;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  FieldRw.write(Value, TPmRec(Rec), VarIsNull(Value));
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.MoveTo
  作者:      lifeng
  日期:      2010.09.19
  参数:      ASouRec, ADestRec: Pointer; AMoveMode: TMoveMode
  返回值:    无
  功能描述:  移动记录到指定位置
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.MoveTo(ASourceNode, ADestNode: IPMNode;
  AMoveMode: TMoveMode);
  procedure Move(ASouRec, ADestRec: Pointer; AMoveMode: TMoveMode);
  var
    lsRecList, lsBList, lsVlist, MoveList, DestList: TList;
    Index, Level, DestIndex: Integer;
    Rec, OppRec: Pointer;
    bBlob: Boolean;
  begin
    if (ASouRec = nil) or (ADestRec = nil) then
      Exit;
    // if IsChildRec(ASouRec, ADestRec) then Exit;
    Index := RecList.IndexOf(ASouRec);

    bBlob := BlobList.Count > 0;
    if Index < 0 then
      Exit;
    lsRecList := TList.Create;
    lsBList := TList.Create;
    lsVlist := TList.Create;
    MoveList := TList.Create;
    DestList := TList.Create;
    try
      Level := InternalGetLevel(ASouRec);
      while True do
      begin
        lsRecList.Add(RecList[index]);
        if bBlob then
          lsBList.Add(BlobList[index]);
        lsVlist.Add(Data.Values[index]);
        if (FMarkState) and (FDataStateManger <> nil) then
        begin
          Rec := RecList[index];
          if Index = 0 then
            OppRec := nil
          else
            OppRec := RecList[index - 1];
          FDataStateManger.Notify(Rec, OppRec, '', '', cMove, 0);
        end;
        RecList.Delete(Index);
        if bBlob then
          BlobList.Delete(Index);
        Data.Values.Delete(Index);
        if Index = RecList.Count then
          Break;
        if InternalGetLevel(RecList[index]) <= Level then
          Break;
      end;

      DestIndex := RecList.IndexOf(ADestRec);
      if DestIndex < 0 then
      begin
        DestIndex := Index - 1;
        if DestIndex < 0 then
          DestIndex := 0;
        ADestRec := RecList[DestIndex];
      end;

      MoveList.Add(lsRecList);
      if bBlob then
        MoveList.Add(lsBList);
      MoveList.Add(lsVlist);
      DestList.Add(RecList);
      if bBlob then
        DestList.Add(BlobList);
      DestList.Add(Data.Values);
      MoveRecs(ASouRec, ADestRec, MoveList, lsRecList, DestList, DestIndex,
        Self, mmUp);
      FChanged := True;
      FInternalChanged := True;
    finally
      lsRecList.Free;
      lsBList.Free;
      lsVlist.Free;
      MoveList.Free;
      DestList.Free;
    end;
  end;
  procedure SaveToFile(AData: IPMDataset);
  var
    strList: TStringList;
    i: Integer;
  begin
    strList := TStringList.Create;
    try
      for i := 0 to AData.GetRecordCount - 1 do
      begin
        strList.Add(Format('level=%s,mc=%s',
          [AData.GetFieldValueAsString(RecordLevel, '0', AData.GetRecList[i]),
          AData.GetFieldValueAsString('mc', '', AData.GetRecList[i])]));

      end;
      strList.SaveToFile(NewGuid + '.txt');
    finally
      strList.Free;
    end;
  end;

begin
  if AMoveMode = mmSibling then
  begin
    // 移动到兄弟节点  则移动到该节点的 最后一个子节点后面 再通知视图进行层次的升级
    if ASourceNode.IsChildNode(ADestNode) then
      Exit;
    Move(ASourceNode.GetRec, ADestNode.GetChildLastestNode.GetRec, mmNothing);
    // SaveToFile(Self);
  end
  else
    Move(ASourceNode.GetRec, ADestNode.GetRec, AMoveMode);
  //删除所有索引
  DeleteAllIndex;
  NotifyMoveto(ASourceNode, ADestNode, AMoveMode); // 通知视图 移动
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CloneData
  作者:      lifeng
  日期:      2010.09.29
  参数:      ADest: IPMDataset
  返回值:    无
  功能描述:  复制数据
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.CloneData(ASource: IPMDataset;
  bCloneField: Boolean = True);
var
  i, l: Integer;
  Rec, sRec: Pointer;
  FList: TStringList;
  sField: string;
begin
  if ASource = nil then
    Exit;
  FInternalChanged := True;
  if (bCloneField) or (Self.GetFieldList.Count < 2) then
  begin
    Self.Clear;
    CopyDataField(ASource, Self); // copy字段
  end
  else
    Self.DeleteAllRec;

  CopyAtt(ASource); // copy属性
  FList := TStringList.Create;
  try
    FList.Assign(ASource.GetFieldList);
    for i := FList.Count - 1 downto 0 do
    begin
      sField := FList.Strings[i];
      if not CheckFieldExit(sField) then
        FList.Delete(i);
    end;

    for i := 0 to ASource.GetRecList.Count - 1 do
    begin
      Rec := InsertAfter(nil);
      sRec := ASource.GetCurrentRec(i);
      for l := 0 to FList.Count - 1 do
      begin
        sField := FList.Strings[l];
        case GetFieldTypeByName(sField) of

          fDou:
            SetFieldValue(sField, ASource.GetFieldValueAsDouble(sField, 0,
              sRec), Rec);
          fInt:
            SetFieldValue(sField, ASource.GetFieldValue(sField, '', sRec), Rec);
          // SetFieldValue(sField, ASource.GetFieldValueAsInt(sField, 0, sRec), Rec);
          fBoo:
            SetFieldValue(sField, ASource.GetFieldValue(sField, '', sRec), Rec);
        else
          SetFieldValue(sField, ASource.GetFieldValueAsString(sField, '',
            sRec), Rec);
        end;
      end;
    end;
  finally
    FList.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CopyData
  作者:      lifeng
  日期:      2011.01.06
  参数:      ASource: IPMDataset
  返回值:    无
  功能描述:   拷贝所有数据
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.CopyData(ASource: IPMDataset);
var
  i, l: Integer;
  Rec: Pointer;
  dFList: TStringList;
  Field: string;
begin
  // CopyDataField(ASource, Self); //copy字段
  FInternalChanged := True;
  dFList := GetFieldList;
  for i := 0 to ASource.GetRecList.Count - 1 do
  begin
    Rec := InsertAfter(nil);
    for l := 0 to dFList.Count - 1 do
    begin
      Field := dFList.Strings[l];
      if ASource.CheckFieldExit(Field) then
        SetFieldValue(Field, ASource.GetFieldValue(Field, '', i), Rec);
    end;
  end;
end;

function TPMDataSet.InternalGetLevel(Rec: Pointer): Integer;
begin
  Result := 0;
  if FLevel then
  begin
    Result := GetFieldValue(RecordLevel, 0, Rec);
  end;
end;

function TPMDataSet.Clone: IPMDataset;
var
  Data: IPMDataset;
begin
  Result := nil;
  Data := TPmLibDataSet.Create;
  Data.CloneData(Self);
  Result := Data;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CloseAllViewDisplayUi
  作者:      lifeng
  日期:      2010.12.03
  参数:      无
  返回值:    无
  功能描述:   开始或者关闭 视图刷新界面
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.CloseAllViewDisplayUi;
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList[i]).SetDisplayUi(False);
  FDisplayUiState := False;
end;

procedure TPMDataSet.OpenAllViewDisplayUi;
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList[i]).SetDisplayUi(True);
  FDisplayUiState := True;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.RefreshViewsUi
  作者:      lifeng
  日期:      2010.12.03
  参数:      无
  返回值:    无
  功能描述:  不对VIew重新copy数据 仅仅刷新界面
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.RefreshViewsUi;
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
  begin
    TPMDataView(FDataViewList.Items[i]).InternalReConstructTree;
    TPMDataView(FDataViewList.Items[i]).RefreshViewsUi(
      GetAttAsBoolean(DataSetAtt_Key_ReBuild));
  end;

end;

procedure TPMDataSet.SetNotifyAfterLoadStruct(AEvent: TNotifyAfterLoadStruct);
begin
  FAfterLoadStruct := AEvent;
end;

function TPMDataSet.GetObjectAttribute(Key: string): TObject;
begin
  Result := nil;
  if FAttributeObjectHast.Exists(Key) then
    Result := FAttributeObjectHast.Items[Key];
end;

procedure TPMDataSet.SetAttribute(Key: string; AObject: TObject);
begin
  if AObject = nil then
    Exit;
  FAttributeObjectHast.Items[Key] := AObject;

end;

function TPMDataSet.GetDisplayName(FieldName: string): string;
var
  FieldRw: TFieldRWBase;
begin
  Result := '';
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  Result := FieldRw.DisplayName;
end;

procedure TPMDataSet.SetDisplayName(DisplayName, FieldName: string);
var
  FieldRw: TFieldRWBase;
begin
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  FieldRw.DisplayName := DisplayName;
end;

function TPMDataSet.GetUserName: string;
begin
  if FAttributeHash.Exists(DataSetAtt_Key_UserName) then
    Result := FAttributeHash.Items[DataSetAtt_Key_UserName]
  else
    Result := FTableName;
end;

procedure TPMDataSet.SetUserName(const Value: string);
begin
  FAttributeHash.Items[DataSetAtt_Key_UserName] := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.CopyAtt
  作者:      lifeng
  日期:      2011.01.05
  参数:      ASource: IPMDataset
  返回值:    无
  功能描述:  拷贝数据集属性
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.CopyAtt(ASource: IPMDataset);
var
  Key: string;
  Data: TPMDataSet;
begin
  if ASource = nil then
    Exit;
  Data := TPMDataSet(ASource.GetObject);
  Data.FAttributeHash.Restart;
  while Data.FAttributeHash.Next do
  begin
    Key := Data.FAttributeHash.CurrentKey;
    FAttributeHash.Items[Key] := Data.FAttributeHash.Items[Key];
  end;
end;

procedure TPMDataSet.SetFieldVisible(FieldName: string; Value: Boolean);
var
  FieldRw: TFieldRWBase;
begin
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  FieldRw.Field.Visible := Value;
end;

function TPMDataSet.GetFieldVisible(FieldName: string): Boolean;
var
  FieldRw: TFieldRWBase;
begin
  Result := False;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  Result := FieldRw.Field.Visible;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.AddRecordData
  作者:      lifeng
  日期:      2011.01.07
  参数:      ASourceData: IPMDataset; ARecList: TList
  返回值:    无
  功能描述:   添加  记录
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.AddRecordData(ASourceData: IPMDataset; ARecList: TList);
var
  i, j: Integer;
  NewRec, Rec: Pointer;
  Field: string;
  Fields, sourceFields: TStringList;
begin
  if (ASourceData = nil) or (ARecList.Count = 0) then
    Exit;
  Fields := TStringList.Create;
  sourceFields := GetFieldList;
  try
    for i := 0 to sourceFields.Count - 1 do
    begin
      Field := sourceFields.Strings[i];
      if ASourceData.CheckFieldExit(Field) then
        Fields.Add(Field);
    end;
    for i := 0 to ARecList.Count - 1 do
    begin
      Rec := ARecList[i];
      NewRec := InsertAfter(nil);
      for j := 0 to Fields.Count - 1 do
      begin
        Field := Fields.Strings[j];
        SetFieldValue(Field, ASourceData.GetFieldValueAsString(Field, '',
          Rec), NewRec);
      end;
    end;
  finally
    Fields.Free;
  end;
end;

function TPMDataSet.GetViewCount: Integer;
begin
  Result := FDataViewList.Count;
end;

procedure TPMDataSet.SetAttribute(Key: string; AIntf: IInterface);
begin
  FAttributeObjectHast.Items[Key] := TObject(Pointer(AIntf));

end;

function TPMDataSet.GetInfAttribute(Key: string): IUnknown;
begin
  Result := nil;
  if FAttributeObjectHast.Exists(Key) then
    Result := IUnknown(Pointer(FAttributeObjectHast.Items[Key]));
end;

procedure TPMDataSet.DoSortByField(List: TList; sField: string;
  ExhangeList: TList; ComparType: TPmComparerType);

  function CompareNodes(const ABuffer1, ABuffer2: Pointer): Integer;
  var
    // hasValue1, hasValue2: string;
    S1, S2: string;
    int1, Int2: Integer;
  begin
    Result:=0;
    case ComparType of
      cmInteger:
        begin
          int1 := GetFieldValueAsInt(sField, 0, ABuffer1);
          Int2 := GetFieldValueAsInt(sField, 0, ABuffer2);
          if (int1 > Int2) then
            Result := 1
          else if (int1 = Int2) then
            Result := 0
          else
            Result := -1;
        end;
      cmString:
        begin
          S1 := GetFieldValue(sField, '', ABuffer1);
          S2 := GetFieldValue(sField, '', ABuffer2);
          if (S1 > S2) then
            Result := 1
          else if (S1 = S2) then
            Result := 0
          else
            Result := -1;
        end;
    end;

  end;

  procedure QuickSort(l: TList; iLo, iHi: Integer);
  var
    Lo, Hi: Integer;
    i: Integer;
    Mid: Pointer;
  begin
    Lo := iLo;
    Hi := iHi;
    Mid := l[(Lo + Hi) div 2];
    repeat
      while (Lo < iHi) do
      begin
        if CompareNodes(l[Lo], Mid) < 0 then
          Inc(Lo)
        else
          Break;
      end;
      while (Hi > iLo) do
      begin
        if CompareNodes(l[Hi], Mid) > 0 then
          Dec(Hi)
        else
          Break;
      end;
      if Lo <= Hi then
      begin
        l.Exchange(Lo, Hi);
        if (ExhangeList <> nil) then
        begin
          for i := 0 to ExhangeList.Count - 1 do
            TList(ExhangeList.List[i]).Exchange(Lo, Hi);
        end;
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then
      QuickSort(l, iLo, Hi);
    if Lo < iHi then
      QuickSort(l, Lo, iHi);
  end;

begin
  if List.Count > 0 then
    QuickSort(List, 0, List.Count - 1);
end;

procedure TPMDataSet.SetSortField(AField: string; ComparType: TPmComparerType);
var
  ExcList: TList;
begin
  FSortField := AField;
  if AField = '' then
    Exit;
  if not CheckFieldExit(AField) then
    Exit;
  ExcList := TList.Create;
  try

    if BlobList.Count > 0 then
      ExcList.Add(BlobList);
    ExcList.Add(Data.Values);
    DoSortByField(RecList, AField, ExcList, ComparType);
  finally
    ExcList.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.FindRecByEF
  作者:      lifeng
  日期:      2011.02.12
  参数:      FieldName: string; Value: Integer
  返回值:    Pointer
  功能描述:   二分法查找记录  该字段必须有序排序
  ------------------------------------------------------------------------------- }
{
  function TPMDataSet.FindRecByEF(FieldName: string;
  Value: Integer): Pointer;

  function FindRec(MinIndex, MaxIndex: Integer): Pointer;
  var
  Index: Integer;
  Rec: Pointer;
  ComVale: Integer;
  begin
  Result := nil;
  if MinIndex > MaxIndex then Exit;
  if MinIndex = MaxIndex then
  begin
  Rec := RecList[MaxIndex];
  ComVale := GetFieldValue(FieldName, 0, Rec);
  if Value = ComVale then Result := Rec;
  Exit;
  end
  else
  begin
  Rec := RecList[MaxIndex];
  ComVale := GetFieldValue(FieldName, 0, Rec);
  if Value = ComVale then Result := Rec;
  if Value > ComVale then Exit;
  end;
  Index := (MinIndex + MaxIndex) div 2;
  Rec := RecList[index];
  ComVale := GetFieldValue(FieldName, 0, Rec);
  if Value = ComVale then Result := Rec;
  if Result <> nil then Exit;

  if Value > ComVale then
  Result := FindRec(Index + 1, MaxIndex)
  else if Value < ComVale then
  Result := FindRec(0, Index - 1)
  end;
  begin
  Result := nil;
  if RecList.Count <= 0 then Exit;
  Result := FindRec(0, RecList.Count - 1);

  end; }
{
  function TPMDataSet.FindRecListByEF(FieldName: string; Value: Integer;
  ARecList: TList): Pointer;
  var
  index, i: Integer;
  Rec: Pointer;
  StrList: TStringList;
  procedure FindLowRec(Index: Integer);
  var
  i: Integer;
  begin
  if Index <= 0 then Exit;
  i := Index - 1;
  while i >= 0 do
  begin

  if GetFieldValue(FieldName, 0, i) = Value then
  begin
  StrList.Add(IntToStr(i));
  i := i - 1;
  end
  else
  Break;
  end;
  end;
  procedure FindHihRec(Index: Integer);
  var
  i: Integer;
  begin
  if Index >= RecList.Count - 1 then Exit;
  i := Index + 1;
  while i <= RecList.Count - 1 do
  begin

  if GetFieldValue(FieldName, 0, i) = Value then
  begin
  StrList.Add(IntToStr(i));
  i := i + 1;
  end
  else
  Break;
  end;
  end;
  begin
  index := FindRecIndexByEF(FieldName, Value);
  if index < 0 then Exit;
  StrList := TStringList.Create;
  try
  StrList.Add(IntToStr(index));
  FindLowRec(index);
  FindHihRec(index);
  for i := 0 to StrList.Count - 1 do
  ARecList.Add(RecList[strtoint(StrList.Strings[i])])
  finally
  StrList.Free;
  end;
  end;
}
{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.FindRecIndexByEF
  作者:      lifeng
  日期:      2011.02.12
  参数:      FieldName: string; Value: Integer
  返回值:    Integer
  功能描述:  二分法查找记录 索引值
  ------------------------------------------------------------------------------- }

{ function TPMDataSet.FindRecIndexByEF(FieldName: string;
  Value: Integer): Integer;
  function FindRec(MinIndex, MaxIndex: Integer): Integer;
  var
  Index: Integer;
  Rec: Pointer;
  ComVale: Integer;
  begin
  Result := -1;
  if MinIndex > MaxIndex then Exit;
  if MinIndex = MaxIndex then
  begin
  Rec := RecList[MaxIndex];
  ComVale := GetFieldValue(FieldName, 0, Rec);
  if Value = ComVale then Result := MaxIndex;
  Exit;
  end
  else
  begin
  Rec := RecList[MaxIndex];
  ComVale := GetFieldValue(FieldName, 0, Rec);
  if Value = ComVale then Result := MaxIndex;
  if Value > ComVale then Exit;
  end;
  Index := (MinIndex + MaxIndex) div 2;
  Rec := RecList[index];
  ComVale := GetFieldValue(FieldName, 0, Rec);
  if Value = ComVale then Result := Index;
  if Result >= 0 then Exit;

  if Value > ComVale then
  Result := FindRec(Index + 1, MaxIndex)
  else if Value < ComVale then
  Result := FindRec(0, Index - 1)
  end;
  begin
  Result := -1;
  if RecList.Count <= 0 then Exit;
  Result := FindRec(0, RecList.Count - 1);

  end; }

function TPMDataSet.IsExitsAtt(Key: string): Boolean;
begin
  Result := FAttributeHash.Exists(Key);
end;

procedure TPMDataSet.SetMaxValueFile(AField: string);
begin
  if CheckFieldExit(AField) then
    if FMaxValueField <> AField then
    begin
      FMaxValueField := AField;
      FindMaxValue;
      FAttributeHash.Items[DataSetatt_Key_MaxField] := AField;
    end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.FindMaxValue
  作者:      lifeng
  日期:      2011.03.01
  参数:      无
  返回值:    无
  功能描述:  根据 字读找最大值
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.FindMaxValue;
var
  i, Value: Integer;
begin
  FMaxValue := 0;
  for i := 0 to RecList.Count - 1 do
  begin
    Value := GetFieldValueAsInt(FMaxValueField, 0, RecList[i]);
    if Value > FMaxValue then
      FMaxValue := Value;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.MaxValue
  作者:      lifeng
  日期:      2011.09.02
  参数:      无
  返回值:    Integer
  功能描述:  取最大值
  ------------------------------------------------------------------------------- }

function TPMDataSet.MaxValue: Integer;
begin
  if FMaxValueField = '' then
    if FAttributeHash.Exists(DataSetatt_Key_MaxField) then
    begin
      FMaxValueField := FAttributeHash.Items[DataSetatt_Key_MaxField];
      FindMaxValue;
    end;
  Result := FMaxValue + 1;
end;

procedure TPMDataSet.SetHashMod(AValue: TPMRECHashMod);
begin
  if FFieldHash_RecHash.ItemCount = 0 then
    FHashMod := AValue;
end;

function TPMDataSet.GetDisplayUiStatus: Boolean;
begin
  Result := FDisplayUiState;
end;

procedure TPMDataSet.PmDoAFterScroll(ACurIndex: Integer);
begin
  inherited;
  // if Assigned(FOnAfterMasterScroll) then
  // FOnAfterMasterScroll(RecList[ACurIndex], Self);
end;

procedure TPMDataSet.OnAfterMasterScroll(ARec: Pointer;
  AMasterData: IPMDataset);
begin
  Filter := AMasterData.GetFieldValue(FADOMasterField, '', ARec);
  Filtered := False;
  Filtered := True;
  //
end;

procedure TPMDataSet.PostAllViewEdit;
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList[i]).PostTreeEdit;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.Exchanger
  作者:      lifeng
  日期:      2011.03.10
  参数:      index1, Index2:Integer
  返回值:    无
  功能描述:  交换位置
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.Exchanger(index1, Index2: Integer);
begin
  RecList.Exchange(index1, Index2);
  BlobList.Exchange(index1, Index2);
  Data.Values.Exchange(index1, Index2);
end;

function TPMDataSet.GetViewByKeyValue(AKey, Value: string): IPMDataView;
var
  RecList: TList;
  DataView: TPMLinkView;
begin
  DataView := TPMLinkView.Create(nil);
  DataView.SetDataSet(Self, False);
  RecList := TList.Create;
  try
    FindRecList(AKey, Value, RecList);
    DataView.ReAddRec(RecList);
  finally
    RecList.Free;
    Result := DataView;
  end;
end;

procedure TPMDataSet.BeginUpdataUi;
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList.Items[i]).InternalBeginUpdataUi;
end;

procedure TPMDataSet.EndUpdataui;
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList.Items[i]).InternalEndUpdataUi;

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.NotfiyViewReConstructTree
  作者:      lifeng
  日期:      2011.04.06
  参数:      无
  返回值:    无
  功能描述: 通知所有视图重新构建树
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.NotfiyViewReConstructTree;
var
  i: Integer;
  View: TPMDataView;
begin
  for i := 0 to FDataViewList.Count - 1 do
  begin
    View := TPMDataView(FDataViewList.Items[i]);
    View.InternalReConstructTree;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.InternalMoveSigleRec
  作者:      lifeng
  日期:      2011.04.06
  参数:      Rec, OppRec: Pointer
  返回值:    无
  功能描述:  内部移动  撤销操作时使用
  ------------------------------------------------------------------------------- }

function TPMDataSet.InternalMoveSigleRec(Rec, OppRec: Pointer): Pointer;
var
  CurIndex, OppIndex, DestIndex: Integer;
  List: TList;
  procedure Move(AList: TList);
  var
    mList: TList;
    i: Integer;
    ARec: Pointer;
  begin
    for i := 0 to AList.Count - 1 do
    begin
      mList := TList(AList[i]);
      if CurIndex > DestIndex then
      begin
        ARec := mList[CurIndex];
        mList.Delete(CurIndex);
        mList.Insert(DestIndex, ARec);
      end
      else if CurIndex < DestIndex then
      begin
        ARec := mList[CurIndex];
        mList.Insert(DestIndex, ARec);
        mList.Delete(CurIndex);
      end;
    end;
  end;

begin
  Result := OppRec;
  if Rec = nil then
    Exit;
  CurIndex := RecList.IndexOf(Rec);
  if CurIndex < 0 then
    Exit;

  if OppRec = nil then
    OppIndex := -1
  else
  begin
    OppIndex := RecList.IndexOf(OppRec);
    if OppIndex < 0 then
      Exit;
  end;

  if CurIndex = 0 then
    Result := nil
  else
    Result := RecList[CurIndex - 1];

  DestIndex := OppIndex + 1;

  List := TList.Create;
  try
    List.Add(RecList);
    List.Add(Data.Values);
    if BlobList.Count > 0 then
      List.Add(BlobList);
    Move(List);
  finally
    List.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.NotifyMoveto
  作者:      lifeng
  日期:      2011.04.18
  参数:      SoucRec, DestRec: Pointer; AMoveMode: TMoveMode
  返回值:    无
  功能描述:  通知移动
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.NotifyMoveto(SoucNode, DestNode: IPMNode;
  AMoveMode: TMoveMode);
var
  i: Integer;
  View: TPMDataView;
begin
  if FNotifyChanged then
  begin
    for i := 0 to FDataViewList.Count - 1 do
    begin
      try
        if i >= FDataViewList.Count then
          Break; // 尝试解决：bdcu 生成时 View 可能减少 导致的报错
        View := TPMDataView(FDataViewList.Items[i]);
        if (FChangedView <> nil) and (FChangedView <> View) then
          Continue;

        View.OnMoveTo(SoucNode, DestNode, AMoveMode);
      except
        on e: Exception do
        begin
          AppendFiledata(cst_logname, cst_error_ED_0029 + e.Message);
          raise Exception.Create('移动出错！！！');
        end;
      end;
    end;
  end;

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.IsChildRec
  作者:      lifeng
  日期:      2011.04.21
  参数:      AFatherRec, AChildRec: Pointer
  返回值:    Boolean
  功能描述:   判断是否 为自己的子节点
  ------------------------------------------------------------------------------- }

function TPMDataSet.IsChildRec(AFatherRec, AChildRec: Pointer): Boolean;
var
  iFIndex, iCIndex, iFLevel: Integer;
begin
  Result := False;
  if not FLevel then
    Exit;
  iFLevel := GetFieldValue(RecordLevel, 0, AFatherRec);
  if iFLevel >= GetFieldValue(RecordLevel, 0, AChildRec) then
    Exit;
  iFIndex := RecList.IndexOf(AFatherRec);
  iCIndex := RecList.IndexOf(AChildRec);
  if (iFIndex < 0) or (iCIndex < 0) then
    Exit;
  if iFIndex >= iCIndex then
    Exit;

  while True do
  begin
    iFIndex := iFIndex + 1;
    if RecList.Count - 1 = iFIndex then
      Exit;
    if GetFieldValue(RecordLevel, 0, iFIndex) <= iFLevel then
      Exit;
    if iFIndex = iCIndex then
    begin
      Result := True;
      Exit;
    end;
  end;

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.RefreshField
  作者:      lifeng
  日期:      2011.05.03
  参数:      AFieldName: string
  返回值:    无
  功能描述:  刷新列
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.RefreshField(AFieldName: string);
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList[i]).RefreshField(AFieldName);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.FastSetFieldValue
  作者:      lifeng
  日期:      2011.05.04
  参数:      FieldName: string; Value: Variant; Rec: Pointer
  返回值:    无
  功能描述:  快速 写
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.FastSetFieldValue(FieldName: string; Value: Variant;
  Rec: Pointer);
var
  FieldRw: TFieldRWBase;
  bNull: Boolean;
  sOldValue, sNewValue: string;
begin
  bNull := False;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  try
    if (FDisplayUiState) or (FMarkState and (FDataStateManger <> nil)) then
    begin
      sOldValue := FieldRw.Read(Rec, '');
      if VarIsNull(Value) then
      begin
        sNewValue := '';
        bNull := True;
      end
      else
        sNewValue := Value;
    end;
    // Inc(_WirteRecCount);
    FieldRw.write(Value, TPmRec(Rec), bNull);
    if FMarkState and (FDataStateManger <> nil) then
      FDataStateManger.Notify(Rec, nil, sNewValue, sOldValue, cUpdate, -1,
        FieldName);
    if FDisplayUiState then
      NotifyUpdate(Rec, nil, sNewValue, sOldValue, FieldName);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0008 + e.Message);
      raise Exception.Create('设置字段 "' + FieldName + '" 错误!!! tablenaem:' +
        FTableName);
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetFiedlValueAsBoolean
  作者:      lifeng
  日期:      2011.05.04
  参数:      FieldName: string; DValue: Boolean; Rec: Pointer
  返回值:    Boolean
  功能描述:  读取boolean类型
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetFieldValueAsBoolean(FieldName: string; DValue: Boolean;
  Rec: Pointer): Boolean;
var
  FieldRw: TFieldRWBase;
begin
  Result := DValue;
  if Rec = nil then
    Exit;
  if FieldName = '' then
    Exit;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  try
    if FieldRw is TBooFieldRW then
      Result := TBooFieldRW(FieldRw).ReadAsBoolean(TPmRec(Rec), DValue)
    else
      Result := StrToBoolDef(VarToStrDef(FieldRw.Read(TPmRec(Rec), DValue),
        ''), DValue);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0007 + e.Message);
      raise Exception.Create('读取字段 "' + FieldName + '" 错误!!! tablenaem:' +
        FTableName);
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetFiedlValueAsDouble
  作者:      lifeng
  日期:      2011.05.04
  参数:      FieldName: string; DValue: Double; Rec: Pointer
  返回值:    Double
  功能描述:  读取double类型字段
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetFieldValueAsDouble(FieldName: string; DValue: Double;
  Rec: Pointer): Double;
var
  FieldRw: TFieldRWBase;
begin
  Result := DValue;
  if Rec = nil then
    Exit;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  try
    if FieldRw is TDouFieldRW then
    begin
      Result := TDouFieldRW(FieldRW).ReadAsDouble(TPMRec(Rec), DValue);
      if IsNan(Result) then
        Result := 0;
    end
    else
      Result := StrToFloatDef(VarToStrDef(FieldRw.Read(TPmRec(Rec), DValue),
        ''), DValue);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0006 + e.Message);
      raise Exception.Create('读取字段 "' + FieldName + '" 错误!!! tablenaem:' +
        FTableName);
    end;
  end;
end;

function TPMDataSet.GetFieldValueAsInt(FieldName: string; DValue: Integer;
  Rec: Pointer): Integer;
var
  FieldRw: TFieldRWBase;
begin
  Result := DValue;
  if Rec = nil then
    Exit;
  if FieldName = '' then
    Exit;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  try
    if FieldRw is TIntFieldRW then
      Result := TIntFieldRW(FieldRw).ReadAsInteger(TPmRec(Rec), DValue)
    else
      Result := StrToIntDef(VarToStrDef(FieldRw.Read(TPmRec(Rec), DValue),
        ''), DValue);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0005 + e.Message);
      raise Exception.Create('读取字段 "' + FieldName + '" 错误!!! tablenaem:' +
        FTableName);
    end;
  end;
end;

function TPMDataSet.GetFieldValueAsString(FieldName, DValue: string;
  Rec: Pointer): string;
var
  FieldRw: TFieldRWBase;
begin
  Result := DValue;
  if Rec = nil then
    Exit;
  if FieldName = '' then
    Exit;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  try
    if FieldRw is TMemFieldRW then
      Result := TMemFieldRW(FieldRw).ReadAsString(TPmRec(Rec), DValue)
    {else if FieldRw is TMemFieldRW_Wide then
      Result := TMemFieldRW_Wide(FieldRw).ReadAsString(TPmRec(Rec), DValue)  // }
    else
      Result := VarToStrDef(FieldRw.Read(TPmRec(Rec), DValue), DValue);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0004 + e.Message);
      raise Exception.Create('读取字段 "' + FieldName + '" 错误!!! tablenaem:' +
        FTableName);
    end;
  end;
end;

function TPMDataSet.GetRwCount: string;
begin
  Result := IntToStr(_RedCount) + #13#10 + IntToStr(_WirteRecCount);
end;

procedure TPMDataSet.InitRWCount;
begin
  _RedCount := 0;
  _WirteRecCount := 0;
end;

function TPMDataSet.GetFieldValueAsDouble(FieldIndex: Integer; DValue: Double;
  Rec: Pointer): Double;
var
  FieldRw: TFieldRWBase;
begin
  Result := DValue;
  if Rec = nil then
    Exit;

  if (FieldIndex < 0) or (FieldIndex >= FFieldClassList.Count) then
    Exit;
  FieldRw := TFieldRWBase(FFieldClassList[FieldIndex]);
  if FieldRw is TDouFieldRW then
    Result := TDouFieldRW(FieldRw).ReadAsDouble(TPmRec(Rec), DValue)
  else
    Result := StrToFloatDef(VarToStrDef(FieldRw.Read(TPmRec(Rec), DValue),
      ''), DValue);
end;

procedure TPMDataSet.SetFieldValueAsDouble(FieldName: string; Value: Double;
  Rec: Pointer; PmNode: IPMNode);
var
  FieldRw: TFieldRWBase;
  dOldValue: Double;
  bNull: Boolean;
  sNewValue, sOldValue: string;
begin
  bNull := False;
  FieldRw := TFieldRWBase(FObjectFieldHash.GetObject(FieldName));
  if FieldRw = nil then
    Exit;
  try
    if FieldRw is TDouFieldRW then
    begin
      dOldValue := TDouFieldRW(FieldRw).ReadAsDouble(Rec, 0);
      if dOldValue = Value then
        Exit;
      TDouFieldRW(FieldRw).writeAsDouble(Value, TPmRec(Rec), bNull);
      sOldValue := FloatToStr(dOldValue);
    end
    else
    begin
      FieldRw.write(Value, TPmRec(Rec), bNull);
      sOldValue := FieldRw.Read(TPMRec(Rec),0)
    end;
    sNewValue := FloatToStr(Value);

    if FMarkState and (FDataStateManger <> nil) then
      FDataStateManger.Notify(Rec, nil, sNewValue, sOldValue, cUpdate, -1,
        FieldName);
    DataChangedEvent(cUpdate, Rec, FieldName, sNewValue, sOldValue);
    // NotifyUpdate(Rec, PmNode, sNewValue, sOldValue, FieldName);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0028 + e.Message);
      raise Exception.Create('设置字段 "' + FieldName + '" 错误!!!');
    end;
  end;
end;


function TPMDataSet.GetRecHash: TObject;
begin
  Result := nil;
  if FFieldHash_RecHash.Exists(FDetailField) then
    Result := FFieldHash_RecHash.Items[FDetailField];
end;

procedure TPMDataSet.SetNotifyChangeEvent(Value: Boolean);
begin
  FNotifyChangeEvent := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.ReConstrTree
  作者:      lifeng
  日期:      2011.06.17
  参数:      无
  返回值:    无
  功能描述:  重新构建视图树状
  ------------------------------------------------------------------------------- }

procedure TPMDataSet.ReConstructTree;
var
  i: Integer;
begin
  for i := 0 to FDataViewList.Count - 1 do
    TPMDataView(FDataViewList.Items[i]).InternalReConstructTree;
end;

function TPMDataSet.GetTableVariable: string;
begin
  Result := GetAttAsString(DataSetAtt_Key_Variable);
end;

procedure TPMDataSet.SetTableVariable(const Value: string);
begin
  SetAttribute(Value, DataSetAtt_Key_Variable);
end;

procedure TPMDataSet.DeleteAtt(Key: string);
begin
  FAttributeHash.Delete(Key);
  FInternalChanged := True;
end;

function TPMDataSet.GetViewByIndex(AIndex: Integer): IPMDataView;
begin
  Result := nil;
  if FDataViewList.Count = 0 then
    Exit;
  if FDataViewList.Count <= AIndex then
    Exit;
  Result := TPMDataView(FDataViewList[AIndex]);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetRecByFieldValue
  作者:      lifeng
  日期:      2012.03.05
  参数:      AFields, AValues: array of string
  返回值:    Pointer
  数据集多条件查找
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetRecByFieldValues(AFields,
  AValues: array of string): Pointer;
var
  i, j: Integer;
begin
  Result := nil;
  if Length(AFields) <> Length(AValues) then
    Exit;
  for i := 0 to RecList.Count - 1 do
  begin
    Result := RecList[i];
    for j := 0 to Length(AFields) - 1 do
    begin
      if GetFieldValueAsString(AFields[j], '', Result) <> AValues[j] then
      begin
        Result := nil;
        Break;
      end;
    end;
    if Result <> nil then
      Exit;
  end;
end;

procedure TPMDataSet.SetOnFieldValueChanged(AEvent: TOnFieldValueChanged);
begin
  FOnAfterSetValue := AEvent;
  FNotifyValueChanged := True;
end;

procedure TPMDataSet.SetNotifyFieldValueChangedStatus(AValue: Boolean);
begin
  FNotifyValueChanged := AValue;
end;

procedure TPMDataSet.AfterAddFieldByFromDataSet(AField: TField);
var
  IntFieldRw: TIntFieldRW;
  DouFieldRw: TDouFieldRW;
  BooFieldRw: TBooFieldRW;
  MemFieldRw: TMemFieldRW;
  MemFieldRw_Wide: TMemFieldRW_Wide;
  procedure Add(FieldRw: TFieldRWBase; index: Integer);
  begin
    FieldRw.FieldIndex := index;
    FieldRw.Field := AField;
    FObjectFieldHash.AddObject(AField.FieldName, FieldRw);
  end;

begin
  inherited;
  if Active then
    Active := False;
  FDataEmpty := False;
  case AField.DataType of
    ftBlob, ftMemo:
      begin
        MemFieldRw := TMemFieldRW.Create(Self);
        MemFieldRw.FOffSet := FBlobOffSetIndex;
        MemFieldRw.FieldType := fStr;
        FFieldClassList.Add(MemFieldRw);
        Add(MemFieldRw, -1);
        Inc(FBlobOffSetIndex);
      end;
    ftWideMemo: { 注：AfterAddFieldByFromDataSet 貌似从来没用到 故-未能验证 此函数关于 fWideStr 的修改的正确性 }
      begin
        MemFieldRw_Wide := TMemFieldRW_Wide.Create(Self);
        MemFieldRw_Wide.FOffSet := FBlobOffSetIndex;
        MemFieldRw_Wide.FieldType := fWideStr;
        FFieldClassList.Add(MemFieldRw_Wide);
        Add(MemFieldRw_Wide, -1);
        Inc(FBlobOffSetIndex);//共用一个
      end;
    ftFloat:
      begin
        DouFieldRw := TDouFieldRW.Create(Self);
        DouFieldRw.FieldType := fDou;
        Add(DouFieldRw, FHashIndex);
        FFieldClassList.Add(DouFieldRw);
      end;
    ftInteger:
      begin
        IntFieldRw := TIntFieldRW.Create(Self);
        IntFieldRw.FieldType := fInt;
        FFieldClassList.Add(IntFieldRw);
        Add(IntFieldRw, FHashIndex);
      end;
    ftBoolean:
      begin
        BooFieldRw := TBooFieldRW.Create(Self);
        BooFieldRw.FieldType := fBoo;
        FFieldClassList.Add(BooFieldRw);
        Add(BooFieldRw, FHashIndex);
      end;
    ftLargeint:
      begin
        IntFieldRw := TIntFieldRW.Create(Self);
        IntFieldRw.FieldType := fLargeint;
        FFieldClassList.Add(IntFieldRw);
        Add(IntFieldRw, FHashIndex);
      end;
  else
    begin
      MemFieldRw := TMemFieldRW.Create(Self);
      MemFieldRw.FOffSet := FBlobOffSetIndex;
      MemFieldRw.FieldType := fStr;
      FFieldClassList.Add(MemFieldRw);
      Add(MemFieldRw, -1);
      Inc(FBlobOffSetIndex);
    end;
  end;

  if AField.FieldName = RecordLevel then
    FLevel := True;

  if AField.DataType in [ftFloat, ftInteger, ftBoolean, ftLargeint] then
  begin
    FFieldHash.Items[AField.FieldName] := FHashIndex;
    Inc(FHashIndex);
  end;
  FFieldList.Add(AField.FieldName);
end;

procedure TPMDataSet.SetCustomMaxValue(AValue: Integer);
begin
  FMaxValue := AValue;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataSet.GetFilterRecList
  作者:      lifeng
  日期:      2012.11.12
  参数:      AFilterList, AFilterBuffList: TList
  返回值:    Boolean
  主从过滤时  取过滤值
  ------------------------------------------------------------------------------- }

function TPMDataSet.GetFilterRecList(AFilterList, AFilterBuffList
  : TList): Boolean;
var
  Recs: TList;
  i, fCount: Integer;
  Accepted: Boolean;
begin
  Result := False;
  if FADOKeyValue = '' then
    Exit;
  Recs := TList.Create;
  FindRecList(FADOKeyValue, Filter, Recs);
  try
    for i := 0 to Recs.Count - 1 do
    begin

      fCount := RecList.IndexOf(Recs[i]) + 1;
      if fCount = 0 then
        Continue;
      if Assigned(OnFilterRecord) then
      begin
        Accepted := False;

        RecNo := fCount;
        // MoveCurRecordTo(fCount);
        OnFilterRecord(Self, Accepted);
        if Accepted then
        begin
          AFilterBuffList.Add(Recs[i]);
          AFilterList.Add(TValueBuffer(fCount));
        end;
      end
      else
      begin
        AFilterBuffList.Add(Recs[i]);
        AFilterList.Add(TValueBuffer(fCount));
      end;
      // AFilterList.Add(TValueBuffer(i + 1));
    end;
  finally
    Result := Recs.Count > 0;
    Recs.Free;
  end;

end;

procedure TPMDataSet.InternalClose;
begin
  inherited;
  InternalFreeIndexObject;
end;

{ TPMDataView }

constructor TPMDataView.Create(ADataSet: IPMDataset);
begin
  FToKen := NewGuid;
  FTag := 0;
  FRoot := TPMNode.Create(Self, nil);
  FStructTree := True;
  FFilter := False;
  FDisplayUi := True;
  FPMNodeList := TInterfaceList.Create;
  FRecIndexList := TList.Create;
  FRecList := TList.Create;
  FDeleteChild := True;
  FFieldList := TStringList.Create;
  FCurRecIndex := 0;
  if ADataSet <> nil then
    SetDataSet(ADataSet, True);
  FRefeshUiRef := 0;

end;

destructor TPMDataView.Destroy;
begin
  try
    if FDataSet <> nil then
      FDataSet.DeleteView(Self);
    FRecList.Free;
    FRecIndexList.Free;
    ClearPmNode;
    FPMNodeList.Clear;
    FPMNodeList.Free;
    FFieldList.Free;
    FRoot := nil;
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0027 + e.Message);
    end;
    // AppendFiledata('freeLog.txt', FToKen + ' ----view');
  end;
  inherited Destroy;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.InsertAfter
  作者:      李锋
  日期:      2010.06.04
  参数:      Rec: Pointer; Level: Integer
  返回值:    Pointer
  功能描述:  往后添加记录
  ------------------------------------------------------------------------------- }

function TPMDataView.InsertAfter(PmNode: IPMNode; Level: Integer): IPMNode;
var
  TempLevel: Integer;
  TempPmNode: IPMNode;
begin
  FAlawysAdd := True;
  try
    if PmNode <> nil then
    begin
      if FLevel then
      begin
        TempLevel := PmNode.GetValue(RecordLevel, -1); // 取level

        TempPmNode := PmNode.GetChildLastestNode; // 取相对位置的node
        if TempPmNode <> nil then
          PmNode := TempPmNode;
        if Level = 0 then
          Level := TempLevel;
      end;
      FDataSet.InsertAfter(PmNode.GetRec, Level);
    end
    else
      FDataSet.InsertAfter(nil, Level);

    Result := FTempNode;
  finally
    FAlawysAdd := False;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.AddChild
  作者:      lifeng
  日期:      2010.07.22
  参数:      PmNode: Pointer
  返回值:    Pointer
  功能描述:  添加子节点
  ------------------------------------------------------------------------------- }

function TPMDataView.AddChild(PmNode: IPMNode): IPMNode;
var
  Level: Integer;
  TempPmNode: IPMNode;
begin
  Result := nil;
  if PmNode = nil then
    Exit;
  if FLevel then
  begin
    TempPmNode := PmNode.FindLastChildNode;
    if TempPmNode = nil then
    begin
      TempPmNode := PmNode;
      Level := TempPmNode.Level;
      Inc(Level);
    end
    else
      Level := TempPmNode.Level;

    if Level >= 0 then
    begin
      InsertAfter(TempPmNode, Level);
      Result := FTempNode;
    end;
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.InsertBefore
  作者:      李锋
  日期:      2010.06.04
  参数:      Rec: Pointer; Level: Integer
  返回值:    Pointer
  功能描述:  向前添加记录
  ------------------------------------------------------------------------------- }

function TPMDataView.InsertBefore(PmNode: IPMNode; Level: Integer): IPMNode;
var
  TempLevel: Integer;
begin
  FAlawysAdd := True;
  try
    if PmNode <> nil then
    begin
      if FLevel then
      begin
        TempLevel := PmNode.GetValue(RecordLevel, -1);
        if Level = 0 then
          Level := TempLevel;
      end;
      FDataSet.InsertBefore(PmNode.GetRec, Level)
    end
    else
      FDataSet.InsertBefore(nil, Level);

    Result := FTempNode;
  finally
    FAlawysAdd := False;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.DeleteRow
  作者:      李锋
  日期:      2010.06.04
  参数:      Rec: Pointer
  返回值:    无
  功能描述:  删除记录
  ------------------------------------------------------------------------------- }

procedure TPMDataView.DeleteRow(PmNode: IPMNode);
begin
  if PmNode = nil then
    Exit;
  if not FDeleteChild then
  begin
    PmNode.DeleteStatus := True; // Node删除状态
    FDataSet.DeleteRow(PmNode.GetRec)
  end
  else
    PmNode.DeleteAll; // 删除全部子节点
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetFieldValue
  作者:      李锋
  日期:      2010.06.04
  参数:      FieldName: string; DValue: Variant; Rec: Pointer
  返回值:    Variant
  功能描述:  取值 根据字段名 取的对象 如果为关联字段 则去关联的view中取值
  ------------------------------------------------------------------------------- }

function TPMDataView.GetFieldValue(FieldName: string; DValue: Variant;
  PmNode: IPMNode): Variant;
var
  P: Pointer;
begin
  P := nil;
  if PmNode <> nil then
    P := PmNode.GetRec;
  Result := FDataSet.GetFieldValue(FieldName, DValue, P)
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SetFieldValue
  作者:      李锋
  日期:      2010.06.04
  参数:      FieldName: string; Value: Variant; Rec: Pointer
  返回值:    Boolean
  功能描述:  设置值 若为关联字段 则 到关联的view中设置值
  ------------------------------------------------------------------------------- }

function TPMDataView.SetFieldValue(FieldName: string; Value: Variant;
  PmNode: IPMNode): Boolean;
var
  P: Pointer;
begin
  P := nil;
  if PmNode <> nil then
    P := PmNode.GetRec;
  Result := FDataSet.SetFieldValue(FieldName, Value, P, PmNode);

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SetDataSet
  作者:      李锋
  日期:      2010.05.05
  参数:      const Value: TPMDataSet
  返回值:    无
  功能描述:  设置观察的数据集
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SetDataSet(const Value: IPMDataset;
  CopyData: Boolean = True);
var
  i, iCount: Integer;
  ADataSet: TPMDataSet;
  sFieldList: TStringList;
begin
  if Value <> nil then
  begin
    ADataSet := TPMDataSet(Value.GetObject);
    if FDataSet <> nil then
      FDataSet.DeleteView(Self);
    FDataSet := ADataSet;
    FDataSet.FDataViewList.Add(Self);
    FLevel := FDataSet.FLevel;
    FFieldList.Clear;

    sFieldList := FDataSet.GetFieldList;
    iCount := sFieldList.Count;
    for i := 0 to iCount - 1 do
      FFieldList.Add(sFieldList.Strings[i]); // copy 字段列表
    if CopyData then
      AssignedRec;
    if (FDataSource <> nil) and (FDisplayUi) then
      FDataSource.RefreshViews;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetAttribute   SetAttribute
  作者:      李锋
  日期:      2010.06.04
  参数:      Key: string
  返回值:    string
  功能描述:  设置和取表的属性
  ------------------------------------------------------------------------------- }

function TPMDataView.GetAttribute(Key: string): string;
begin
  Result := FDataSet.GetAttribute(Key);
end;

procedure TPMDataView.SetAttribute(Value, Key: string);
begin
  FDataSet.SetAttribute(Value, Key);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.RefreshViews
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    无
  功能描述:  刷新界面
  ------------------------------------------------------------------------------- }

procedure TPMDataView.RefreshViews;
begin
  SetFilterStatus(FFilter); // 过滤
  SetSortedField(FSortedField); // 排序
  if (FDataSource <> nil) and (FDisplayUi) then
    if FDataSet.GetAttAsBoolean(DataSetAtt_Key_ReBuild) then
      FDataSource.ReDispalyUI
    else
      FDataSource.DispalyUI;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.DataChanged
  作者:      李锋
  日期:      2010.05.05
  返回值:    无
  功能描述:  响应数据集 的数据变动
  ------------------------------------------------------------------------------- }

procedure TPMDataView.DataChanged(Rec: Pointer);
begin
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetFieldList
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    TStringList
  功能描述:  取 字段列表 包含关联字段
  ------------------------------------------------------------------------------- }

function TPMDataView.GetFieldList: TStringList;
begin
  Result := FFieldList;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SetFilter
  作者:      李锋
  日期:      2010.05.05
  参数:      value: string
  返回值:    无
  功能描述:  设置过滤
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SetFilterStatus(Value: Boolean);
begin
  if Value = False then
  begin
    FRecList.Clear;
    ClearPmNode;
    FPMNodeList.Clear;
    FRoot.GetChildNodeList.Clear;
    AssignedRec;
    FStatus := vDefault;
    Exit;
  end;
  FFilter := Value;
  FDataSet.PMFilterRecordEvent := FPMFilterRecordEvent;
  FDataSet.Filtered := False;
  FDataSet.Filtered := True;
  FDataSet.IsFiltered := False;
  ReAddRec(FDataSet.FilterBufferList);
  FDataSet.PMFilterRecordEvent := nil;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetRecCount
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    Integer
  功能描述:  取记录数
  ------------------------------------------------------------------------------- }

function TPMDataView.GetRecCount: Integer;
begin
  Result := FRecList.Count;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SetSortedField
  作者:      李锋
  日期:      2010.05.05
  参数:      value: string
  返回值:    无
  功能描述:  设置排序字段
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SetSortedField(Value: string);
var
  mField: TdxMemField;
  tempList: TList;
  i: Integer;
begin
  if Trim(Value) <> '' then
  begin
    FSortedField := Value;
    try
      mField := FDataSet.Data.Items[FDataSet.FFieldHash.Items[Value]];
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ED_0026 + e.Message);
        raise Exception.Create('"' + Value + '"无该字段！！！');
      end;
    end;
    if mField <> nil then
    begin
      tempList := TList.Create;
      if FStatus = vDefault then
      begin
        FRecIndexList.Clear;
        FRecIndexList.Capacity := FRecList.Capacity;
        for i := 0 to FRecList.Count - 1 do
          FRecIndexList.Add(Pointer(i + 1));
      end;
      tempList.Add(FRecIndexList);
      FDataSet.DoSort(FRecList, mField, FSortOptions, tempList);
      if FStatus = vFiler then
        FStatus := vSortFiler
      else
        FStatus := vSort;
    end;
  end;
end;

procedure TPMDataView.SetDataSource(ASource: Pointer);
begin
  FDataSource := TBaseDataSource(ASource);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SetNotifyChanged
  作者:      李锋
  日期:      2010.06.04
  参数:      Value: Boolean
  返回值:    无
  功能描述:  设置是否通知视图
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SetNotifyChanged(Value: Boolean);
begin
  FDataSet.bNotifyChanged := Value;
end;

procedure TPMDataView.SetChangedView;
begin
  FDataSet.SetChangedView(Self);
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SetOnFilter
  作者:      李锋
  日期:      2010.06.04
  参数:      OnFilter: TFilterRecordEvent
  返回值:    无
  功能描述:  设置过滤响应过程
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SetOnFilter(OnFilter: TPMFilterRecordEvent);
begin
  FPMFilterRecordEvent := OnFilter;
  // FDataSet.PMFilterRecordEvent := OnFilter;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.RefreshRec
  作者:      李锋
  日期:      2010.05.05
  参数:      Rec, AData: Pointer
  返回值:    无
  功能描述:  刷新单条记录
  ------------------------------------------------------------------------------- }

procedure TPMDataView.RefreshRec(PmNode: IPMNode);
var
  Node: Pointer;
begin
  if FDisplayUi then
  begin
    if (FDataSource = nil) or (PmNode = nil) then
      Exit;
    // FDataSource.BeginUpdate;
    try
      if (PmNode.GetUiNode <> nil) and (FDataSource.IsExitsUiNode(PmNode)) then
        Node := PmNode.GetUiNode
      else
        Node := FDataSource.FindNodeByData(PmNode);
      if (Node <> nil) and (FDisplayUi) then
        FDataSource.DispalyData(Node, PmNode);
    finally
      // FDataSource.EndUpdatae;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.BeginState EndState
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    无
  功能描述:  记录一次 操作 undo redo用到
  ------------------------------------------------------------------------------- }

procedure TPMDataView.BeginState;
begin
  // if FMarkStateStatus = mDefault then
  // begin
  FDataSet.BeginState;
  // FMarkStateStatus := Value;
  // end;
end;

procedure TPMDataView.EndState;
begin
  // if FMarkStateStatus = Value then
  // begin
  FDataSet.EndState;
  // FMarkStateStatus := mDefault;
  // end;
end;

function TPMDataView.GetObject: Pointer;
begin
  Result := Self;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.ReAddRec
  作者:      lifeng
  日期:      2010.08.24
  参数:      无
  返回值:    无
  功能描述:   过滤后重新加载 记录
  ------------------------------------------------------------------------------- }

procedure TPMDataView.ReAddRec(BufferList: TList);
var
  i: Integer;
begin
  FRecList.Clear; // 清理Reclist
  FRecIndexList.Clear;
  FRoot.GetChildNodeList.Clear;
  ClearPmNode;
  FPMNodeList.Clear; // 清理pmnodelist
  FTempNode := nil;
  for i := 0 to BufferList.Count - 1 do
  begin
    FRecList.Add(BufferList[i]); // 添加过滤后的reclist
    ConstructorNode(BufferList[i]); // 生成PMNODELIST
  end;
  FStatus := vFiler; // 过滤状态
  if (FDataSource <> nil) and (FDisplayUi) then
    FDataSource.DispalyUI;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.AssignedRec
  作者:      李锋
  日期:      2010.05.05
  参数:      bDefault: Boolean = True
  返回值:    无
  功能描述:  copy 数据集记录到view中的队列
  ------------------------------------------------------------------------------- }

procedure TPMDataView.AssignedRec(bDefault: Boolean = True);
var
  i: Integer;
  TempRec: TTempRec;
  Hash: TObjectHashMapMgr;
begin
  if FDataSet = nil then
    Exit;
  FRecList.Clear;
  FRecIndexList.Clear;
  ClearPmNode;
  FPMNodeList.Clear;
  FTempNode := nil;
  if bDefault then
    for i := 0 to FDataSet.GetRecList.Count - 1 do
    begin
      FRecList.Add(FDataSet.GetRecList[i]);
      ConstructorNode(FDataSet.GetRecList[i]);
    end
  else
  begin
    FStatus := vFiler;
    if FKeyValue = '' then
      Exit;
    if FDataSet.RecHash = nil then
      Exit;
    Hash := TObjectHashMapMgr(FDataSet.RecHash);

    TempRec := TTempRec(Hash.GetObject(FKeyValue));
    if TempRec = nil then
      Exit;
    for i := 0 to TempRec.PmRecList.Count - 1 do
    begin
      if FRecList.Count = 0 then
        FTempNode := nil
      else
        FTempNode := GetPMNodeIntf(FRecList.Count - 1);
      FRecList.Add(TempRec.PmRecList[i]);
      ConstructorNode(TempRec.PmRecList[i]);
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SortByRecIndex
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    无
  功能描述:  通过记录的index 排序
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SortByRecIndex;
var
  tempList: TList;
  function CompareNodes(const ABuffer1, ABuffer2: TRecordBuffer): Integer;
  var
    hasValue1, hasValue2: Integer;
  begin
    hasValue1 := Integer(ABuffer1);
    hasValue2 := Integer(ABuffer2);

    if (hasValue1 > hasValue2) then
      Result := 1
    else if (hasValue1 = hasValue2) then
      Result := 0
    else
      Result := -1;
    Exit;

  end;

  procedure QuickSort(l: TList; iLo, iHi: Integer);
  var
    Lo, Hi: Integer;
    i: Integer;
    Mid: TRecordBuffer;
  begin
    Lo := iLo;
    Hi := iHi;
    Mid := TRecordBuffer(l[(Lo + Hi) div 2]);
    repeat
      while (Lo < iHi) do
      begin
        if CompareNodes(TRecordBuffer(l[Lo]), Mid) < 0 then
          Inc(Lo)
        else
          Break;
      end;
      while (Hi > iLo) do
      begin
        if CompareNodes(TRecordBuffer(l[Hi]), Mid) > 0 then
          Dec(Hi)
        else
          Break;
      end;
      if Lo <= Hi then
      begin
        l.Exchange(Lo, Hi);
        if (tempList <> nil) then
        begin
          for i := 0 to tempList.Count - 1 do
          begin
            if TObject(tempList.List[i]) is TList then
              TList(tempList.List[i]).Exchange(Lo, Hi)
            else if TObject(tempList.List[i]) is TInterfaceList then
              TInterfaceList(tempList.List[i]).Exchange(Lo, Hi);
          end;
        end;
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then
      QuickSort(l, iLo, Hi);
    if Lo < iHi then
      QuickSort(l, Lo, iHi);
  end;

begin
  tempList := TList.Create;
  tempList.Add(FRecList);
  tempList.Add(FPMNodeList);
  if FRecIndexList.Count > 0 then
    QuickSort(FRecIndexList, 0, FRecIndexList.Count - 1);

end;

function TPMDataView.GetRecList: TList;
begin
  Result := FRecList;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.CheckLevel
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    Boolean
  功能描述:  判断 该数据集 是否有层次
  ------------------------------------------------------------------------------- }

function TPMDataView.CheckLevel: Boolean;
begin
  Result := False;
  if FLevel then
    Result := True;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetState
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    TViewStatus
  功能描述:  取视图的状态       GetDataSet取 dataset
  ------------------------------------------------------------------------------- }

function TPMDataView.GetState: TViewStatus;
begin
  Result := FStatus;
end;

function TPMDataView.GetDataSet: IPMDataset;
begin
  Result := FDataSet;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetDetailView
  作者:      李锋
  日期:      2010.06.04
  参数:      DetailMasterField: string; ADetaiData: IPMDataSet; Rec: Pointer; RecIndex: Integer
  返回值:    IPMDataView
  功能描述:  取从表视图
  ------------------------------------------------------------------------------- }

function TPMDataView.GetDetailView(DetailMasterField: string; ADetaiData:
  IPMDataset; AMainNode: IPMNode): IPMDataView;
begin
  Result := FDataSet.GetDetailView(DetailMasterField, ADetaiData,
    AMainNode.GetRec);
end;

function TPMDataView.GetDataState: TInterfaceList;
begin
  Result := FDataSet.FDataStateList;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetMarkState   SetMarkState
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    Boolean
  功能描述:  设置和取 markstate状态 （用来控制 是否记录 state）
  ------------------------------------------------------------------------------- }

function TPMDataView.GetMarkState: Boolean;
begin
  Result := FDataSet.GetMarkState
end;

procedure TPMDataView.SetMarkState(Value: Boolean);
begin
  FDataSet.SetMarkState(Value);
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SortByRecIndex
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    无
  功能描述:  设置  StructTree值 TRUE 则构建 树状NODE
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SetStructTree(Value: Boolean);
begin
  FStructTree := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.DealLevel
  作者:      李锋
  日期:      2010.06.29
  参数:      level: Integer; 记录的level值 用来构建树状
  PmNode: TPMNode
  返回值:    无
  功能描述:  处理 pmnode的 树状构建
  ------------------------------------------------------------------------------- }

procedure TPMDataView.DealLevel(Level: Integer; PmNode, lsNode: IPMNode);
var
  lsLevel: Integer;
begin
  lsLevel := FDataSet.GetFieldValueAsInt(RecordLevel, 0, lsNode.GetRec);
  if Level > lsLevel then // 等级比 上一个Node等级低
    lsNode.InternalAddFirstChild(PmNode)
  else if Level = lsLevel then // 等级相等
  begin
    if lsNode.ParentNode <> nil then
      lsNode.InternalAddNexSibling(PmNode)
  end
  else
  begin // 比上一个NODE等级大
    while Level < lsNode.Level do
    begin
      lsNode := lsNode.ParentNode;
      if lsNode = nil then
        Break;
    end;
    if lsNode <> nil then
      lsNode.InternalAddNexSibling(PmNode);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.StructTree
  作者:      lifeng
  日期:      2010.08.17
  参数:      Rec: Pointer; PmNode: IPMNode
  返回值:    无
  功能描述:  构建树状结构
  ------------------------------------------------------------------------------- }

procedure TPMDataView.StructTree(Rec: Pointer; PmNode: IPMNode);
var
  Level: Integer;
begin
  if (FLevel) and (FStructTree) then // 遍历树
  begin
    Level := FDataSet.GetFieldValueAsInt(RecordLevel, 0, Rec);
    if Level = 0 then
    begin
      if FTempNode = nil then
        FRoot.InternalAddChild(PmNode) // 顶级
      else
      begin
        FTempNode := FindSiblingNode(FTempNode, PmNode);
        if FTempNode <> nil then
          FTempNode.InternalAddNexSibling(PmNode);
      end;
    end
    else
    begin
      if FTempNode <> nil then
        DealLevel(Level, PmNode, FTempNode);
    end;

  end
  else
    FRoot.InternalAddChild(PmNode);
  FTempNode := PmNode;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SortByRecIndex
  作者:      李锋
  日期:      2010.05.05
  参数:      无
  返回值:    无
  功能描述:  按level等级 创建PMNode
  ------------------------------------------------------------------------------- }

function TPMDataView.ConstructorNode(Rec: Pointer; Index: Integer = -1)
  : IPMNode;
begin
  Result := TPMNode.Create(Self, Rec);
  Result.ParentNode := nil;

  // 该对象生命周期和该视图相同，（且另有视图再此后创建，则该对象无效 ） 使用慎重
  if Index < 0 then
    FPMNodeList.Add(Result)
  else
    FPMNodeList.Insert(Index, Result);
  StructTree(Rec, Result);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetPMNodeList
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    TList
  功能描述:  取 node列表
  Root:取 根节点
  ------------------------------------------------------------------------------- }

function TPMDataView.GetPMNodeList: TInterfaceList;
begin
  Result := FPMNodeList;
end;

function TPMDataView.Root: IPMNode;
begin
  Result := FRoot;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.DeleteRelation
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    无
  功能描述:  删除与数据集的关系
  ------------------------------------------------------------------------------- }

procedure TPMDataView.DeleteRelation;
begin
  if FDataSet <> nil then
    FDataSet.DeleteView(Self);
  FRoot := nil;
end;

function TPMDataView.GetTableName: string;
begin
  Result := FDataSet.GetTableName;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.OnDataDetete
  作者:      李锋
  日期:      2010.06.10
  参数:      Rec: Pointer; RecIndex: Integer; var Index: Integer
  返回值:    无
  功能描述:  记录删除 维护队列 刷新界面
  ------------------------------------------------------------------------------- }

procedure TPMDataView.OnDataDetete(Rec: Pointer; RecIndex: Integer;
  bInternal: Boolean; var Index: Integer);
var
  PmNode: IPMNode;
begin
  if (not bInternal) and (FStatus = vDefault) then
    Index := RecIndex
  else
    Index := FRecList.IndexOf(Rec); // 删除记录改变 index
  if Index >= 0 then
  begin
    if Index > FRecList.Count - 1 then
    begin
      Index := -1;
      Exit;
    end;
    FRecList.Delete(Index);
    if FPMNodeList.Count <= Index then
      Exit;
    PmNode := FPMNodeList[Index] as IPMNode;

    try
      FPMNodeList.Delete(Index);
      if FDataSource <> nil then
        FDataSource.OnSourceDataDelete(PmNode, FDisplayUi);
      PmNode.RemoveParent;
      PmNode.DetailView := nil;
      PMNode.SetRec(nil);
      PmNode := nil;
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ED_0025 + e.Message);
      end;
//      AppendFiledata('DataError.log', '视图PMNODE与RECLIST错位！！');
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.OnDataAdd
  作者:      李锋
  日期:      2010.06.10
  参数:      Rec, OppRec: Pointer; OppRecIndex: Integer; ChangType: TPMChangType
  bInter 是否内部 变更 即撤销时的操作
  返回值:    TPMNode
  功能描述:  记录添加 维护队列 刷新界面
  ------------------------------------------------------------------------------- }

function TPMDataView.OnDataAdd(Rec, OppRec: Pointer;
  RecIndex, OppRecIndex: Integer; ChangType: TPMChangType;
  bInter: Boolean): IPMNode;
var
  PmNode, oppNode: IPMNode;
  iAddIndx, Index: Integer;
  bfirst: Boolean;
  procedure AddLast;
  begin
    FRecList.Add(Rec);
    CreateTempNode;
    PmNode := ConstructorNode(Rec);
  end;

begin
  oppNode := nil;
  PmNode := nil;
  bfirst := False;
  Index := -1;
  iAddIndx := -1;
  FTempNode := nil;
  if OppRec = nil then
    AddLast
  else
  begin
    if not bInter then
    begin
      if FStatus = vDefault then
        Index := OppRecIndex
      else
        Index := FRecList.IndexOf(OppRec); // 相对记录的index
    end
    else
    begin
      while True do
      begin
        Index := FRecList.IndexOf(OppRec);
        if Index >= 0 then
          Break;
        Inc(OppRecIndex);
        if OppRecIndex >= FDataSet.GetRecList.Count then
          Break;
        OppRec := FDataSet.GetRecList[OppRecIndex];
      end;
      if Index < 0 then
      begin
        if FPMNodeList.Count > 0 then
          oppNode := IPMNode(FPMNodeList.Last) // 最后一条
        else
          oppNode := nil;
        AddLast;
      end;
    end;

    if Index >= 0 then
    begin
      case ChangType of
        cAddAfter:
          begin
            iAddIndx := Index + 1;
            oppNode := IPMNode(FPMNodeList[Index]); // 相对的PMNODE
          end;
        cAddBefore:
          begin
            iAddIndx := Index;
            if Index = 0 then
            begin
              oppNode := IPMNode(FPMNodeList[Index]);
              bfirst := True; // 第一条添加
            end
            else
            begin // 相对PMNODE都按照 向后插入操作
              Dec(Index);
              if FPMNodeList.Count > 0 then
                oppNode := IPMNode(FPMNodeList[Index])
              else
                oppNode := nil;
            end;
          end;
      end;
      if iAddIndx <= FRecList.Count - 1 then
      begin
        CreateTempNode(Index, ChangType);
        PmNode := ConstructorNode(Rec, iAddIndx);
        FRecList.Insert(iAddIndx, Rec);
      end
      else
      begin
        CreateTempNode;
        PmNode := ConstructorNode(Rec);
        FRecList.Add(Rec);
      end;
    end;
  end;

  OnSourceDataInsert(PmNode, oppNode, ChangType, bfirst);
  Result := PmNode;
  FTempNode := Result;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.OnDataUpdate
  作者:      李锋
  日期:      2010.06.10
  参数:      Rec, PmNode: Pointer; RecIndex: Integer; FieldName: string
  返回值:    无
  功能描述:  记录修改 刷新界面
  ------------------------------------------------------------------------------- }

function TPMDataView.OnDataUpdate(Rec: Pointer; PmNode: IPMNode;
  NewValue, OldValue, FieldName: string): Integer;
begin
  Result := -1;
  if not FDisplayUi then
    Exit;
  if FDataSource = nil then
    Exit;
  { if (PmNode = nil) or (PmNode.GetRec <> Rec) or (PmNode.GetView.GetObject <> Self) then
    // pmnode 在修改关联字段的情况 有可能不为 本身view中记录
    // 更新不同的view的时候 也有可能不为自己的view
    begin
    PmNode := nil;
    Result := FRecList.IndexOf(Rec);
    if Result >= 0 then
    PmNode := (FPMNodeList[Result] as IPMNode);
    end;
    if PmNode <> nil then
    begin
    if PmNode.GetRec <> Rec then Exit;
    FDataSource.OnSourceDataChanger(PmNode, FieldName, NewValue);
    end; }
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SetOnAfterSet   SetOnbeforeSet
  作者:      李锋
  日期:      2010.06.10
  参数:      Value: TOnAfterSet
  返回值:    无
  功能描述:  对记录进行修改 前和后 响应的事件
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SetOnAfterSet(Value: TOnAfterSet);
begin
  FOnAfterSet := Value;
end;

procedure TPMDataView.SetOnbeforeSet(Value: TOnBeforeSet);
begin
  FOnBeforeSet := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.ClearRef
  作者:      李锋
  日期:      2010.06.10
  参数:      无
  返回值:    无
  功能描述:  删除 接口引用关系
  ------------------------------------------------------------------------------- }

procedure TPMDataView.ClearRef;
begin
  FDataSet.DeleteView(Self);
  ClearPmNode;
  FPMNodeList.Clear;
  FRoot.GetChildNodeList.Clear;
end;

procedure TPMDataView.CreateTempNode(Index: Integer; ChangType: TPMChangType);
begin
  try
    if FPMNodeList.Count = 0 then
      Exit;
    if Index < 0 then
    begin
      FTempNode := IPMNode(FPMNodeList.Last);
      Exit;
    end;
    FTempNode := IPMNode(FPMNodeList[Index]);
    { case ChangType of
      cAddAfter: FTempNode := IPMNode(FPMNodeList[Index]);
      cAddBefore:
      begin
      if Index = 0 then
      FTempNode := nil
      else
      FTempNode := IPMNode(FPMNodeList[Index - 1]);
      end;
      end; }
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0024 + e.Message);
    end;
  end;
end;

function TPMDataView.GetPMNodeIntf(Index: Integer): IPMNode;
begin
  Result := FPMNodeList[index] as IPMNode;
end;

function TPMDataView.GetOnAfterSet: TOnAfterSet;
begin
  Result := FOnAfterSet;
end;

function TPMDataView.GetOnBeforeSet: TOnBeforeSet;
begin
  Result := FOnBeforeSet;
end;

function TPMDataView.GetUiNode(APMNode: IPMNode): Pointer;
begin
  Result := nil;
  if APMNode = nil then
    Exit;
  try
    Result := APMNode.GetUiNode;
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0023 + e.Message);
      raise Exception.Create('取界面NODE指针错误！！！');
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetRecByFieldValue
  作者:      lifeng
  日期:      2010.08.04
  参数:      FieldName: string; Value: Variant
  返回值:    IPMNode
  功能描述:  定位单条记录
  ------------------------------------------------------------------------------- }

function TPMDataView.GetRecByFieldValue(FieldName: string; Value: Variant;
  BeginCurRec: Boolean = False): IPMNode;
var
  i, BeginIndex: Integer;
  S: string;
begin
  Result := nil;
  if VarIsNull(Value) then
    Exit;
  S := Value;
  if BeginCurRec then
    BeginIndex := FCurRecIndex + 1
  else
    BeginIndex := 0;
  FCurRecIndex := 0;
  for i := BeginIndex to FPMNodeList.Count - 1 do
  begin
    if S = (FPMNodeList[i] as IPMNode).GetValue(FieldName, '') then
    begin
      Result := FPMNodeList[i] as IPMNode;
      FCurRecIndex := i;
      Break;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.StructNodeTree
  作者:      lifeng
  日期:      2010.08.04
  参数:      无
  返回值:    无
  功能描述:  重新构建PMNODE的上下级关系
  ------------------------------------------------------------------------------- }

procedure TPMDataView.StructNodeTree;
var
  i: Integer;
  PmNode: IPMNode;
begin
  FRoot.GetChildNodeList.Clear;
  for i := 0 to FPMNodeList.Count - 1 do
  begin
    PmNode := IPMNode(FPMNodeList[i]);
    if i = 0 then
      FTempNode := PmNode;
    PmNode.GetChildNodeList.Clear;
    if FLevel then
    begin
      PmNode.Level := GetFieldValue(RecordLevel, 0, PmNode);
      if PmNode.Level = 0 then
        FRoot.InternalAddChild(PmNode)
      else
        DealLevel(PmNode.Level, PmNode, FTempNode);
    end
    else
      FRoot.InternalAddChild(PmNode);
  end;
end;

function TPMDataView.GetFieldHash: TStringHash;
begin
  Result := nil;
end;

function TPMDataView.GetForeignKey: string;
begin
  Result := '';
end;

function TPMDataView.GetLinkRec(Value: string): Pointer;
begin
  Result := nil;
end;

function TPMDataView.GetPrimaryKey: string;
begin
  Result := '';
end;

procedure TPMDataView.SetForeignKey(FieldName: string);
begin
end;

procedure TPMDataView.SetLinkField(FieldName, LinkFieldName: string;
  ALinkView: IPMDataView);
begin
end;

procedure TPMDataView.SetPrimaryKey(FieldName: string);
begin
end;

function TPMDataView.GetFilterStatus: Boolean;
begin
  Result := FFilter;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.PasteRecData
  作者:      lifeng
  日期:      2010.07.20
  参数:      ASourceNode, ADestNode: Pointer
  返回值:    无
  功能描述:   粘帖数据
  ------------------------------------------------------------------------------- }

procedure TPMDataView.CopyRecData(ASourceNode, ADestNode: IPMNode);
var
  i: Integer;
  Field: string;
  FieldList: TStringList;
begin

  if (ASourceNode = nil) or (ADestNode = nil) then
    Exit;
  FieldList := ASourceNode.GetView.GetFieldList;
  try
    for i := 0 to FieldList.Count - 1 do
    begin
      Field := FieldList.Strings[i];
      if ADestNode.GetView.GetDataSet.CheckFieldExit(Field) then
        ADestNode.SetValue(ASourceNode.GetValue(Field, ''), Field);
    end;
    RefreshRec(ADestNode); // 刷新界面
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0022 + e.Message);
      raise Exception.Create('复制记录出错，字段不存在');
    end;
  end;
end;

procedure TPMDataView.CopyRecData(ASourceNode: IPMNode; ADestNode: IPMNode;
  ExceptField: array of string);
var
  i: Integer;
  Field: string;
  FieldList: TStringList;
  function CheckFieldInExcept(AField: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 0 to High(ExceptField) do
      if AField = ExceptField[i] then
      begin
        Result := True;
        Break;
      end;
  end;

begin
  if (ASourceNode = nil) or (ADestNode = nil) then
    Exit;
  try

    FieldList := ASourceNode.GetView.GetFieldList;
    for i := 0 to FieldList.Count - 1 do
    begin
      Field := FieldList.Strings[i];
      if (CheckFieldInExcept(Field)) and
        (ADestNode.GetView.GetDataSet.CheckFieldExit(Field)) then
        ADestNode.SetValue(ASourceNode.GetValue(Field, ''), Field);
    end;
    RefreshRec(ADestNode); // 刷新界面
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0021 + e.Message);
      raise Exception.Create('复制记录出错，字段不存在');
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.FindPmNode
  作者:      lifeng
  日期:      2010.10.15
  参数:      AKeyValueList: TStringList
  返回值:    IPMNode
  功能描述:  查找Node
  ------------------------------------------------------------------------------- }

function TPMDataView.FindPmNode(AKeyValueList: TStringList): IPMNode;
var
  i, Count: Integer;
  Field, Value, S: string;
begin
  Result := nil;
  try
    for Count := 0 to RecordCount - 1 do
    begin
      for i := 0 to AKeyValueList.Count - 1 do
      begin
        S := AKeyValueList.Strings[i];
        Field := Trim(GetCol(S, 0, '='));
        Value := Trim(GetCol(S, 1, '='));

        if LowerCase(GetFieldValue(Field, '', GetPMNodeIntf(Count))) <>
          LowerCase(Value) then
        begin
          Result := nil;
          Break;
        end;
        Result := IPMNode(FPMNodeList[Count]);
      end;
      if Result <> nil then
        Exit;
    end;
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, 'TPMDataView.FindPmNode2:' + e.Message);
    end;
  end;
end;

function TPMDataView.GetDeleteChild: Boolean;
begin
  Result := FDeleteChild;
end;

procedure TPMDataView.SetDeleteChild(Value: Boolean);
begin
  FDeleteChild := Value;
end;

function TPMDataView.FindLinkView(FieldName: string;
  var AView: IPMDataView): Boolean;
begin
  Result := False;
  AView := Self;
end;

procedure TPMDataView.ADDStateList(AState: IDataState);
begin
  FDataSet.FDataStateList.Add(AState);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SaveViewToFile
  作者:      lifeng
  日期:      2010.08.04
  参数:      FileName: string
  返回值:    无
  功能描述:  保存视图到文件
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SaveViewToFile(FileName: string);
begin
  if FileExists(FileName) then
    DeleteFile(FileName);
  FDataSet.SaveViewToFile(FileName, Self);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.SaveViewToXml
  作者:      lifeng
  日期:      2010.08.04
  参数:      FileName: string
  返回值:    无
  功能描述:  保存数据至XML格式
  ------------------------------------------------------------------------------- }

procedure TPMDataView.SaveViewToXML(FileName: string);
begin
  if FileExists(FileName) then
    DeleteFile(FileName);
  FDataSet.SaveViewToXML(FileName, Self, [], []);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.ExchangeParent
  作者:      lifeng
  日期:      2010.08.04
  参数:      PmNode: IPMNode; AMoveMode: TMoveMode
  返回值:    Boolean
  功能描述:  父级节点的移动
  ------------------------------------------------------------------------------- }

function TPMDataView.ExChangeParent(PmNode: IPMNode;
  AMoveMode: TMoveMode): Boolean;
var
  Index: Integer;
begin
  Result := not FLevel;
  if Result then
    Exit;
  Result := False;

  Index := PmNode.ParentNode.GetChildNodeList.IndexOf(Pointer(PmNode));
  if Index < 0 then
    Exit;
  case AMoveMode of
    mmUp:
      begin
        if Index = 0 then
          Exit;
        PmNode.ParentNode.GetChildNodeList.Exchange(Index, Index - 1);
      end;
    mmDown:
      begin
        if Index = PmNode.ParentNode.GetChildNodeList.Count - 1 then
          Exit;
        PmNode.ParentNode.GetChildNodeList.Exchange(Index, Index + 1);
      end;
  end;
  Result := True;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.ExChangParentCross
  作者:      lifeng
  日期:      2010.08.16
  参数:      PmNode: IPMNode; AMoveMode: TMoveMode
  返回值:    Boolean
  功能描述:  跨界移动 只支持没有子节点的记录
  ------------------------------------------------------------------------------- }

function TPMDataView.ExChangParentCross(PmNode: IPMNode;
  AMoveMode: TMoveMode): Boolean;
var
  Index, ListIndex, TempIndex: Integer;
  Node, nParent: IPMNode;

begin
  Result := False;
  Index := PmNode.ParentNode.GetChildNodeList.IndexOf(Pointer(PmNode));
  ListIndex := FPMNodeList.IndexOf(PmNode);
  if Index < 0 then
    Exit;
  case AMoveMode of
    mmUp:
      begin
        if Index > 0 then
        begin
          PmNode.ParentNode.GetChildNodeList.Exchange(Index, Index - 1);
          FRecList.Exchange(ListIndex, ListIndex - 1);
          FPMNodeList.Exchange(ListIndex, ListIndex - 1);
        end
        else
        begin
          nParent := PmNode.ParentNode;
          if nParent = nil then
            Exit;
          Node := nParent.GetPrevSibling;
          if Node = nil then
            Exit;
          if Node.FindLastChildNode = nil then
            TempIndex := FPMNodeList.IndexOf(Node)
          else
            TempIndex := FPMNodeList.IndexOf(Node.FindLastChildNode);
          nParent.GetChildNodeList.Delete(Index);
          Node.InternalAddChild(PmNode);
          FPMNodeList.Delete(ListIndex);
          FPMNodeList.Insert(TempIndex + 1, PmNode);
          FRecList.Delete(ListIndex);
          FRecList.Insert(TempIndex + 1, PmNode.GetRec);
        end;
      end;
    mmDown:
      begin
        if Index = PmNode.ParentNode.GetChildNodeList.Count - 1 then
        begin
          Node := PmNode.ParentNode.GetNextSibling;
          if Node = nil then
            Exit;
          TempIndex := FPMNodeList.IndexOf(Node);

          PmNode.ParentNode.GetChildNodeList.Delete(Index);

          Node.InternalAddFirstChild(PmNode);

          if TempIndex = FPMNodeList.Count - 1 then
          begin
            FPMNodeList.Add(PmNode);
            FPMNodeList.Delete(ListIndex);
            FRecList.Add(PmNode.GetRec);
            FRecList.Delete(ListIndex);
          end
          else
          begin
            FPMNodeList.Insert(TempIndex + 1, PmNode);
            FPMNodeList.Delete(ListIndex);
            FRecList.Insert(TempIndex + 1, PmNode.GetRec);
            FRecList.Delete(ListIndex);
          end;
        end
        else
        begin
          PmNode.ParentNode.GetChildNodeList.Exchange(Index, Index + 1);
          FRecList.Exchange(ListIndex, ListIndex + 1);
          FPMNodeList.Exchange(ListIndex, ListIndex + 1);
        end;
      end;
  end;
  Result := True;

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.ExChangeRecList
  作者:      lifeng
  日期:      2010.08.05
  参数:      PmNode: IPMNode; AMoveMode: TMoveMode; var Index: Integer
  返回值:    Boolean
  功能描述:  移动reclist记录
  ------------------------------------------------------------------------------- }

function TPMDataView.ExChangeRecList(PmNode: IPMNode; AMoveMode: TMoveMode;
  var Index: Integer): Boolean;
var
  MoveList: TList;
begin
  Result := False;
  Index := FRecList.IndexOf(PmNode.GetRec);
  if Index < 0 then
    Exit;
  MoveList := TList.Create;
  try
    MoveList.Add(FRecList);
    MoveList.Add(FPMNodeList);
    MovePMListByLevel(FRecList, Index, FDataSet, MoveList, AMoveMode);
    FDataSet.MoveRecByLevel(PmNode.GetRec, AMoveMode);
    if Self is TPMLinkView then
      if (TPMLinkView(Self).FDetailField <> '') and
        (TPMLinkView(Self).FDetailField = FDataSet.FDetailField) then
        // 该视图为 明细视图 调整位置 必须调整hash记录中的位置
        ExChangerHashList(PmNode.GetRec, AMoveMode);
  finally
    MoveList.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.MoveDown
  作者:      lifeng
  日期:      2010.08.04
  参数:      PmNode: IPMNode
  返回值:    无
  功能描述:  视图移动 同个层次下
  ------------------------------------------------------------------------------- }

procedure TPMDataView.Move(PmNode: IPMNode; AMoveMode: TMoveMode);
var
  Index: Integer;
begin
  if PmNode = nil then
    Exit;
  if ExChangeParent(PmNode, AMoveMode) then
  begin
    ExChangeRecList(PmNode, AMoveMode, Index);
    if (FDataSource <> nil) and (FDisplayUi) then
      FDataSource.InternalUiMove(PmNode, AMoveMode);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    MoveCross
  作者:      lifeng
  日期:      2010.08.16
  参数:      PmNode: IPMNode; AMoveMode: TMoveMode
  返回值:    无
  功能描述:  单条记录越界移动
  ------------------------------------------------------------------------------- }

procedure TPMDataView.MoveCross(PmNode: IPMNode; AMoveMode: TMoveMode);
var
  Index: Integer;
begin
  if PmNode = nil then
    Exit;
  Index := PmNode.ParentNode.GetChildNodeList.IndexOf(Pointer(PmNode));
  case AMoveMode of
    mmUp:
      begin
        if Index > 0 then
        begin
          Move(PmNode, AMoveMode);
          Exit;
        end
      end;
    mmDown:
      begin
        if Index < PmNode.ParentNode.GetChildNodeList.Count - 1 then
        begin
          Move(PmNode, AMoveMode);
          Exit;
        end;
      end;
  end;

  if PmNode.GetChildNodeList.Count > 0 then
    Exit; // 不支持 带子节点的移动
  if ExChangParentCross(PmNode, AMoveMode) then // 父级 pmnodelist reclist移动
  begin
    FDataSet.MoveSingleRecCross(PmNode.GetRec, AMoveMode); // 数据集中移动
    if FDataSource <> nil then
      FDataSource.InternalUiMoveCross(PmNode, AMoveMode);
  end;
  // end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.Clear
  作者:      lifeng
  日期:      2010.08.05
  参数:      无
  返回值:    无
  功能描述:  清理dataview数据
  ------------------------------------------------------------------------------- }

procedure TPMDataView.Clear;
begin
  FRecList.Clear;
  FRecIndexList.Clear;
  FRoot.GetChildNodeList.Clear;
  ClearPmNode;
  FPMNodeList.Clear;
end;

function TPMDataView.FindPmNode(Conditions: array of string): IPMNode;
var
  i, Count: Integer;
  Field, Value: string;
begin
  Result := nil;
  try
    for Count := 0 to RecordCount - 1 do
    begin
      i := 0;
      while True do
      begin
        if High(Conditions) < i then
          Break;
        Field := Conditions[i];
        Inc(i);
        Value := Conditions[i];
        Inc(i);
        if (Field = '') or (Value = '') then
          Break;
        if LowerCase(GetFieldValue(Field, '', GetPMNodeIntf(Count))) <>
          LowerCase(Value) then
        begin
          Result := nil;
          Break;
        end;
        Result := IPMNode(FPMNodeList[Count]);
      end;

      if Result <> nil then
        Exit;
    end;

  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, 'TPMDataView.FindPmNode1:' + e.Message);
    end;
  end;
end;

function TPMDataView.FindPmNode(AKey, AValue: string): IPMNode;
var
  Rec: Pointer;
  Index: Integer;
begin
  Result := nil;
  if FStatus = vDefault then
  begin
    Rec := FDataSet.FindRec(AKey, AValue);
    if Rec = nil then
      Exit;
    Index := FRecList.IndexOf(Rec);
    if Index < 0 then
      Exit;
    Result := IPMNode(FPMNodeList[Index]);
    if Result.GetRec <> Rec then
      Result := FindPmNode([AKey, AValue]);
  end
  else
    Result := FindPmNode([AKey, AValue]);
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.CopyFromDataView
  作者:      lifeng
  日期:      2010.08.16
  参数:      ASourceView: IPMDataView
  返回值:    无
  功能描述:  复制view数据
  ------------------------------------------------------------------------------- }

procedure TPMDataView.CopyFromDataView(ASourceView: IPMDataView;
  CopyRecBefore: TCopyRecBefor; CopyRecAfter: TCopyRecAfter);
var
  iCount, iField: Integer;
  Field: string;
  TePMNode, PmNode, copyNode: IPMNode;
  bCopy: Boolean;
begin
  if ASourceView = nil then
    Exit;
  if ASourceView.GetObject = Self then
    Exit;
  for iCount := 0 to ASourceView.GetRecCount - 1 do
  begin
    if FPMNodeList.Count = 0 then
      TePMNode := nil
    else
      TePMNode := IPMNode(FPMNodeList.Last);
    copyNode := ASourceView.PMNodeList[iCount];
    bCopy := True;
    if Assigned(CopyRecBefore) then
      bCopy := CopyRecBefore(Self, copyNode);
    if bCopy then
    begin
      PmNode := InsertAfter(TePMNode, copyNode.Level);
      for iField := 0 to ASourceView.GetFieldList.Count - 1 do
      begin
        Field := ASourceView.GetFieldList.Strings[iField];
        if Self.CheckFieldExist(Field) then
          PmNode.SetValue(copyNode.GetValue(Field, ''), Field);
      end;
      if Assigned(CopyRecAfter) then
        CopyRecAfter(Self, PmNode);
    end;
  end;
end;

function TPMDataView.GetForeigLinkRec(Value: string): IPMNode;
begin
  Result := nil;
end;

function TPMDataView.GetDetailPrimaryField: string;
begin
  Result := '';
end;

function TPMDataView.GetDetailView(DetailMasterField: string;
  ADetaiData: IPMDataSet; AMainRec: Pointer): IPMDataView;
begin
  Result := FDataSet.GetDetailView(DetailMasterField, ADetaiData, AMainRec);
end;

function TPMDataView.GetHideNoChildNode: Boolean;
begin
  Result := False;
end;

function TPMDataView.GetMasterPrimaryField: string;
begin
  Result := '';
end;

procedure TPMDataView.setDetailPrimaryField(const Value: string);
begin
end;

procedure TPMDataView.SetHideNoChildNode(const Value: Boolean);
begin
end;

procedure TPMDataView.SetMasterPrimaryField(const Value: string);
begin
end;

procedure TPMDataView.SetDetailView(AView: IPMDataView);
begin

end;

function TPMDataView.CheckFieldExist(Field: string): Boolean;
begin
  Result := False;
  if FFieldList.IndexOf(Field) >= 0 then
    Result := True;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.OnSourceDataInsert
  作者:      lifeng
  日期:      2010.08.20
  参数:      PMNode, oppNode: IPMNode; ChangType: TPMChangType
  返回值:    无
  功能描述:   数据源响应添加事件
  ------------------------------------------------------------------------------- }

procedure TPMDataView.OnSourceDataInsert(PmNode, oppNode: IPMNode;
  ChangType: TPMChangType; bFrist: Boolean = False);
begin
  if not FDisplayUi then
    Exit;
  if FDataSource <> nil then
    FDataSource.OnSourceDataInsert(PmNode, oppNode, ChangType, bFrist);
end;

procedure TPMDataView.SetLinkRecrdAdd(Value: Boolean);
begin

end;

{ procedure TPMDataView.BeginUpdate;
  begin
  SetNotifyChanged(False);
  end;

  procedure TPMDataView.EndUpdate;
  begin
  SetNotifyChanged(True);
  RefreshViews;
  end; }

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetView
  作者:      lifeng
  日期:      2010.08.31
  参数:      FieldName, Value: string
  返回值:    IPMDataView
  功能描述:  根据条件返回视图
  ------------------------------------------------------------------------------- }

procedure TPMDataView.GetFilterView(FieldName, Value: string;
  AView: TPMDetailView);
var
  i: Integer;
  procedure AddToNewView(Index: Integer);
  begin
    AView.FRecList.Add(Self.FRecList[Index]);
    AView.ConstructorNode(Self.FRecList[Index]);
  end;

begin
  AView.FRecList.Clear;
  AView.ClearPmNode;
  AView.FPMNodeList.Clear;
  AView.FRoot.GetChildNodeList.Clear;

  AView.SetDataSet(FDataSet, False);
  for i := 0 to GetRecCount - 1 do
  begin
    if GetFieldValue(FieldName, '', GetPMNodeIntf(i)) = Value then
      AddToNewView(i);
  end;
  // if AView.RecordCount = 0 then Exit;
  AView.FDetailField := FieldName; // 设置从表主键字段名
  AView.FKeyValue := Value; // 设置从表主键值
  AView.FMasterView := Self;
  AView.FStatus := vFiler; // 设置过滤属性
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetDisplayUi
  作者:      lifeng
  日期:      2010.08.31
  参数:      无
  返回值:    Boolean
  功能描述:  是否刷新datasource
  ------------------------------------------------------------------------------- }

function TPMDataView.GetDisplayUi: Boolean;
begin
  Result := FDisplayUi;
end;

procedure TPMDataView.SetDisplayUi(const Value: Boolean);
begin
  FDisplayUi := Value;
end;

procedure TPMDataView.DeleteAll;
var
  tempList: TList;
  i: Integer;
begin
  tempList := TList.Create;
  try
    for i := 0 to FRecList.Count - 1 do
      tempList.Add(FRecList[i]);

    for i := tempList.Count - 1 downto 0 do
      FDataSet.DeleteRow(tempList[i]);
  finally
    tempList.Free;
  end;
end;

function TPMDataView.GetToken: string;
begin
  Result := FToKen;
end;

procedure TPMDataView.SetToKen(const Value: string);
begin
  FToKen := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.FindPmNodeList
  作者:      lifeng
  日期:      2010.09.09
  参数:      FieldName, Value: string; bCreateIndex: Boolean
  返回值:    TList
  功能描述:  查找记录 列表
  ------------------------------------------------------------------------------- }

procedure TPMDataView.FindRecList(FieldName, Value: string; var RecList: TList;
  bCreateIndex: Boolean = False);
var
  lsList: TList;
  i: Integer;
begin
  lsList := TList.Create;
  try
    FDataSet.FindRecList(FieldName, Value, lsList, bCreateIndex);
    if lsList.Count > 0 then
    begin
      if FStatus = vDefault then
        for i := 0 to lsList.Count - 1 do
          RecList.Add(lsList[i])
      else
        for i := 0 to FRecList.Count - 1 do
        begin
          if lsList.IndexOf(FRecList[i]) >= 0 then
            RecList.Add(FRecList[i]);
        end;
    end;
  finally
    lsList.Free;
  end;
end;

procedure TPMDataView.FindRecList(FieldName, Value: string;
  var RecList: TInterfaceList; bCreateIndex: Boolean);
var
  lsList: TList;
  i, index: Integer;
begin
  lsList := TList.Create;
  try
    FDataSet.FindRecList(FieldName, Value, lsList, bCreateIndex);
    if lsList.Count > 0 then
    begin
      for i := 0 to lsList.Count - 1 do
      begin
        index := FRecList.IndexOf(lsList[i]);
        if index >= 0 then
          RecList.Add(FPMNodeList[index]);
      end;
    end;
  finally
    lsList.Free;
  end;

end;

procedure TPMDataView.BeginUpdateUi;
begin
  if FDataSet <> nil then
    FDataSet.BeginUpdataUi;
end;

procedure TPMDataView.EndUpdateUi;
begin
  if FDataSet <> nil then
    FDataSet.EndUpdataui;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.ReConstructTree
  作者:      lifeng
  日期:      2010.09.17
  参数:      无
  返回值:    无
  功能描述:  根据pmnodelist 重新构建树状 关系
  ------------------------------------------------------------------------------- }

procedure TPMDataView.ReConstructTree;
begin
  if FDataSet <> nil then
    FDataSet.ReConstructTree;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.MoveTo
  作者:      lifeng
  日期:      2010.09.17
  参数:      ASourceNode, ADestNode: IPMNode
  返回值:    无
  功能描述:  移动
  ------------------------------------------------------------------------------- }

function TPMDataView.MoveTo(ASourceNode, ADestNode: IPMNode;
  AMoveMod: TMoveMode): Boolean;
begin
  Result:=True;
  FDataSet.MoveTo(ASourceNode, ADestNode, AMoveMod);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.InternalChangeLevel
  作者:      lifeng
  日期:      2010.09.19
  参数:      ASourceNode: IPMNode; AChangMod: TLevelChangMod
  返回值:    无
  功能描述:  改变level值
  ------------------------------------------------------------------------------- }

procedure TPMDataView.InternalChangeLevel(APMNode: IPMNode;
  AChangMod: TLevelChangMod);
var
  DifferLevel, i: Integer;
  PmNode: IPMNode;
  NodeList: TInterfaceList;
  procedure AddCNode(NList: TInterfaceList; ANode: IPMNode);
  var
    i: Integer;
  begin
    for i := 0 to ANode.Count - 1 do
    begin
      NList.Add(ANode.ChildNodes[i]);
      AddCNode(NList, ANode.ChildNodes[i]);
    end;
  end;

begin
  if APMNode = FPMNodeList.First then
    Exit; // 第一个Node 不允许升级降级
  if (APMNode = APMNode.ParentNode.FindFirstChildNode) and
    (AChangMod = lcDrop) then
    Exit; // 第一个子节点不允许降级
  if (APMNode.Level = 0) and (AChangMod = lcRise) then
    Exit; // 最高级别不允许升级
  DifferLevel:= 0;
  case AChangMod of
    lcRise:
      DifferLevel := -1;
    lcDrop:
      DifferLevel := 1;
  end;
  NodeList := TInterfaceList.Create;
  try
    NodeList.Add(APMNode);
    for i := 0 to APMNode.Count - 1 do
    begin
      PmNode := IPMNode(APMNode.ChildNodes[i]);
      NodeList.Add(PmNode);
      AddCNode(NodeList, PmNode);
    end;
    for i := 0 to NodeList.Count - 1 do
    begin
      PmNode := IPMNode(NodeList.Items[i]);
      PmNode.Level := PmNode.Level + DifferLevel;
    end;
  finally
    NodeList.Free;
  end;
  FDataSet.NotfiyViewReConstructTree; // 通知所有视图 重新构建 树状
  if (FDataSource <> nil) and (FDisplayUi) then
  begin
    FDataSource.ReDispalyUI;
    if (APMNode.UINode <> nil) and (FDataSource.PmTree <> nil) then
      FDataSource.PmTree.ExpandNode(APMNode.UINode, True);
    FDataSource.SetFocusNode(APMNode);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.RiseLevel
  作者:      lifeng
  日期:      2010.09.19
  参数:      APMNode: IPMNode
  返回值:    无
  功能描述:  升级
  ------------------------------------------------------------------------------- }

procedure TPMDataView.RiseLevel(APMNode: IPMNode);
begin
  InternalChangeLevel(APMNode, lcRise);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.DorpLevel
  作者:      lifeng
  日期:      2010.09.19
  参数:      APMNode: IPMNode
  返回值:    无
  功能描述:   降级
  ------------------------------------------------------------------------------- }

procedure TPMDataView.DorpLevel(APMNode: IPMNode);
begin
  InternalChangeLevel(APMNode, lcDrop);
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.DropSingle
  作者:      lifeng
  日期:      2010.11.15
  参数:      APMNode: IPMNode
  返回值:    无
  功能描述:  单个降级
  ------------------------------------------------------------------------------- }

procedure TPMDataView.DropSingle(APMNode: IPMNode);
begin
  if APMNode = FPMNodeList.First then
    Exit; // 第一个Node 不允许升级降级
  if APMNode = APMNode.ParentNode.FindFirstChildNode then
    Exit; // 第一个子节点不允许降级
  APMNode.Level := APMNode.Level + 1;
  FDataSet.NotfiyViewReConstructTree; // 重新构建 树状
  if (FDataSource <> nil) and (FDisplayUi) then
  begin
    FDataSource.DispalyUI;
    FDataSource.SetFocusNode(APMNode);
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.GetPmNodeByRec
  作者:      lifeng
  日期:      2010.10.13
  参数:      ARec: Pointer
  返回值:    IPMNode
  功能描述:  通过记录指针 找PMNode
  ------------------------------------------------------------------------------- }

function TPMDataView.GetPmNodeByRec(ARec: Pointer): IPMNode;
var
  Index: Integer;
begin
  Result := nil;
  if ARec = nil then
    Exit;
  Index := FRecList.IndexOf(ARec);
  if Index < 0 then
    Exit;
  Result := IPMNode(FPMNodeList[Index]);
  if Result.GetRec <> ARec then
    Result := nil;
end;

function TPMDataView.GetSortedField: string;
begin
  Result := FSortedField;
end;

function TPMDataView.GetSortOptions: TPMSortOptions;
begin
  Result := FSortOptions;
end;

procedure TPMDataView.SetSortOptions(Value: TPMSortOptions);
begin
  FSortOptions := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.Exchanger
  作者:      lifeng
  日期:      2010.10.19
  参数:      Index1, Index2: Integer
  返回值:    无
  功能描述:  交换数据
  ------------------------------------------------------------------------------- }

procedure TPMDataView.Exchanger(index1, Index2: Integer);
var
  FNode, sNode, TempNode: IPMNode;
  First, second, TempIndex: Integer;
  PmNode1, PmNode2: IPMNode;
begin
  if index1 = Index2 then
    Exit;
  if (index1 < 0) or (Index2 < 0) then
    Exit;
  if (FRecList.Count - 1 < index1) or (FRecList.Count - 1 < Index2) then
    Exit;

  PmNode1 := IPMNode(FPMNodeList[index1]);
  PmNode2 := IPMNode(FPMNodeList[Index2]);

  if index1 > Index2 then
  begin
    First := Index2;
    second := index1;
  end
  else
  begin
    First := index1;
    second := Index2;
  end;

  FNode := IPMNode(FPMNodeList[First]);
  sNode := IPMNode(FPMNodeList[second]);
  TempNode := sNode.GetChildLastestNode;
  if TempNode = nil then
    TempIndex := -1
  else
    TempIndex := FPMNodeList.IndexOf(TempNode);
  if FNode.Level <> sNode.Level then
    Exit;
  MoveTo(sNode, FNode, mmSibling);
  if TempIndex >= 0 then
  begin
    TempNode := IPMNode(FPMNodeList[TempIndex]);
    while True do
    begin
      if TempNode.Level = FNode.Level then
        Break;
      TempNode := TempNode.ParentNode;
      if TempNode = nil then
        Exit;
      if TempNode = FRoot then
        Exit;
    end;
    MoveTo(FNode, TempNode, mmSibling);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.FilterByKeyValue
  作者:      lifeng
  日期:      2010.11.03
  参数:      Keys, Values: array of string
  返回值:    无
  功能描述:  通过keyvalue 过滤视图数据
  ------------------------------------------------------------------------------- }

procedure TPMDataView.FilterByKeyValue(Keys, Values: array of string);
var
  i, l: Integer;
  BufferList: TList;
  Rec: Pointer;
  Key, Value: string;
  bSucc: Boolean;
begin
  if High(Keys) <> High(Values) then
    Exit;
  BufferList := TList.Create;
  try
    for i := 0 to FRecList.Count - 1 do
    begin
      try
        bSucc := False;
        Rec := FRecList[i];
        for l := 0 to High(Keys) do
        begin
          Key := Keys[l];
          Value := Values[l];
          if FDataSet.GetFieldValue(Key, '', Rec) <> Value then
          begin
            bSucc := False;
            Break;
          end;
          bSucc := True;
        end;
        if bSucc then
        BufferList.Add(Rec);
      except
        on e: Exception do
        begin
          AppendFiledata(cst_logname, cst_error_ED_0020 + e.Message);
        end;
      end;

    end;
    ReAddRec(BufferList);
  finally
    BufferList.Free;
  end;
end;

procedure TPMDataView.SetPmLibDataSet(APmLibDataSet: IPMDataset);
begin
  FPmLibDataSet := APmLibDataSet;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.RefreshViewsUI
  作者:      lifeng
  日期:      2010.12.03
  参数:      无
  返回值:    无
  功能描述:  重新刷新界面
  ------------------------------------------------------------------------------- }

procedure TPMDataView.RefreshViewsUi(bReBuild: Boolean = False);
begin
  if (FDataSource <> nil) and (FDisplayUi) then
  begin
    if not bReBuild then
      FDataSource.DispalyUI
    else
      FDataSource.ReDispalyUI;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.ExChangerHashList
  作者:      lifeng
  日期:      2010.12.16
  参数:      ARec: Pointer; AMoveMode: TMoveMode
  返回值:    无
  功能描述:  调整子表hash中的记录
  ------------------------------------------------------------------------------- }

procedure TPMDataView.ExChangerHashList(ARec: Pointer; AMoveMode: TMoveMode);
var
  Index: Integer;
  MoveList: TList;
  Value: string;
  Temp: TTempRec;
  Hash: TObjectHashMapMgr;
begin
  if ARec = nil then
    Exit;
  MoveList := TList.Create;
  try
    Value := FDataSet.GetFieldValueAsString(FDataSet.FDetailField, '', ARec);
    Hash := TObjectHashMapMgr(FDataSet.RecHash);
    Temp := TTempRec(Hash.GetObject(Value));
    Index := Temp.PmRecList.IndexOf(ARec);
    if Index < 0 then
      Exit;
    MoveList.Add(Temp.PmRecList);
    MovePMListByLevel(Temp.PmRecList, Index, FDataSet, MoveList, AMoveMode);

  finally
    MoveList.Free;
  end;
end;

function TPMDataView.GetPmNode(ARec: Pointer): IPMNode;
var
  Index: Integer;
begin
  Result := nil;
  Index := FRecList.IndexOf(ARec);
  if Index < 0 then
    Exit;
  Result := IPMNode(FPMNodeList[Index]);
  if Result.GetRec <> ARec then
    Result := nil;
end;

function TPMDataView.FindSiblingNode(ASourceNode, APosNode: IPMNode): IPMNode;
var
  TempNode: IPMNode;
begin
  Result := ASourceNode;
  if ASourceNode.Level = APosNode.Level then
    Exit;
  if ASourceNode.Level < APosNode.Level then
    Exit;
  if ASourceNode.Level > APosNode.Level then
  begin
    TempNode := ASourceNode;
    while TempNode.Level > APosNode.Level do
    begin
      TempNode := TempNode.ParentNode;
      if TempNode = nil then
        Break;
      if TempNode.GetRec = nil then
        Exit;
      if TempNode.Level = 0 then
        Break;
    end;
    ASourceNode := TempNode;
  end;
  Result := ASourceNode;

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.ClearPmNode
  作者:      lifeng
  日期:      2011.03.08
  参数:      无
  返回值:    无
  功能描述:  清空NODE中的 对象
  ------------------------------------------------------------------------------- }

procedure TPMDataView.ClearPmNode;
var
  i: Integer;
begin
  for i := 0 to FPMNodeList.Count - 1 do
  begin
    IPMNode(FPMNodeList[i]).SetRec(nil);
    IPMNode(FPMNodeList[i]).UINode := nil;
    IPMNode(FPMNodeList[i]).ParentNode := nil;
  end;
end;

procedure TPMDataView.PostTreeEdit;
begin
  if FDataSource <> nil then
    FDataSource.PostTreeEdit;
end;

function TPMDataView.GetPmDataSource: Pointer;
begin
  Result := FDataSource;
end;

procedure TPMDataView.DisConnect;
begin
  FDataSet := nil;
  FRecList.Clear;
  ClearPmNode;
  FPMNodeList.Clear;
  FRoot.GetChildNodeList.Clear;
  FRecIndexList.Clear;
end;

procedure TPMDataView.InternalBeginUpdataUi;
begin
  if FDataSource <> nil then
    FDataSource.BeginUpdate;
end;

procedure TPMDataView.InternalEndUpdataUi;
begin
  if FDataSource <> nil then
    FDataSource.EndUpdatae;
end;

procedure TPMDataView.InternalReConstructTree;
var
  i: Integer;
  PmNode, lsNode: IPMNode;
begin
  FRoot.GetChildNodeList.Clear;
  FRoot.GetChildNodeList.Count := 0;
  lsNode := nil;
  // 判断 位置是否对应正确
  // CheckNodeRec;
  for i := 0 to FPMNodeList.Count - 1 do
  begin
    PmNode := IPMNode(FPMNodeList[i]);
    if (PmNode = nil) or (PmNode.GetRec = nil) then
      continue;
    if PmNode.DeleteStatus then
      Continue;
    if FDataSet.GetRecList.IndexOf(PmNode.GetRec) < 0 then
      Continue;

    // PmNode.UINode := nil;
    PmNode.ParentNode := nil;
    PmNode.GetChildNodeList.Clear;
    PmNode.GetChildNodeList.Count := 0;
    if PmNode.Level = 0 then
      FRoot.InternalAddChild(PmNode)
    else
    begin
      if lsNode = nil then
        AppendFiledata(cst_logname, 'lsNode = nil PMNode.Level=' + IntToStr(PmNode.Level));
      if PmNode.Level = lsNode.Level then
        lsNode.ParentNode.InternalAddChild(PmNode)
      else if PmNode.Level > lsNode.Level then
        lsNode.InternalAddChild(PmNode)
      else if PmNode.Level < lsNode.Level then
      begin
        while PmNode.Level < lsNode.Level do
        begin
          lsNode := lsNode.ParentNode;
          if lsNode = nil then
            Break;
        end;
        if lsNode <> nil then
          lsNode.InternalAddNexSibling(PmNode);
      end;
    end;
    lsNode := PmNode;
  end;
end;

procedure TPMDataView.CheckNodeRec;
var
  i: Integer;
  TempNode, PmNode: IPMNode;
  Rec: Pointer;
begin
  TempNode := nil;
  for i := 0 to FRecList.Count - 1 do
  begin
    Rec := FRecList[i];
    PmNode := IPMNode(FPMNodeList[i]);
    if PmNode.GetRec <> Rec then
      ShowMessage('错位！！！！');
    if TempNode <> nil then
      if (PmNode.Level - TempNode.Level) > 1 then
      begin
        // ShowMessage('层次错位！！！！');
      end;
    TempNode := PmNode;
  end;

end;

function TPMDataView.MoveToNotiy(ASourceNode, ADestNode: IPMNode;
  AMoveMod: TMoveMode): Boolean;
begin

  FDataSet.MoveTo(ASourceNode, ADestNode, AMoveMod);
  Result:=True;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataView.OnMoveTo
  作者:      lifeng
  日期:      2011.04.18
  参数:      SourceRec, DestRec: Pointer; AMoveMod: TMoveMode
  返回值:    无
  功能描述:
  ------------------------------------------------------------------------------- }

function TPMDataView.OnMoveTo(SourceNode, DestNode: IPMNode;
  AMoveMod: TMoveMode): Boolean;
var
  lsNodeList: TInterfaceList;
  lsRecList, MoveList, DestList: TList;
  Index, Level, DestIndex: Integer;
  ASourceNode, ADestNode: IPMNode;
  SourceRec, DestRec: Pointer;
begin
  SourceRec := SourceNode.GetRec;
  DestRec := DestNode.GetRec;
  Result := True;
  if (SourceRec = nil) or (DestRec = nil) then
    Exit;
  case AMoveMod of
    mmSibling: // 如果是移动到兄弟节点 则先移动到 最后一个子节点后面 再进行 层次的变更
      begin
        Index := FRecList.IndexOf(SourceRec);
        if Index < 0 then
          Exit;
        ASourceNode := IPMNode(FPMNodeList[Index]);
        Index := FRecList.IndexOf(DestRec);
        if Index < 0 then
          Exit;
        ADestNode := IPMNode(FPMNodeList[Index]);

        OnMoveTo(ASourceNode, ADestNode.GetChildLastestNode, mmNothing);

        while True do
        begin
          if ASourceNode.Level = ADestNode.Level then
            Break;
          if ASourceNode.Level > ADestNode.Level then
            ASourceNode.Rise
          else
            ASourceNode.Drop;
          if ASourceNode.Level = 0 then
            Exit;
        end;
        ReConstructTree;
      end;
  else
    begin
      Index := FRecList.IndexOf(SourceRec);
      if Index < 0 then
        Exit;
      ASourceNode := IPMNode(FPMNodeList[Index]);
      lsRecList := TList.Create;
      lsNodeList := TInterfaceList.Create;
      MoveList := TList.Create;
      DestList := TList.Create;
      try
        Level := ASourceNode.Level;
        while True do
        begin
          lsRecList.Add(FRecList[index]);
          lsNodeList.Add(FPMNodeList[index]);
          FRecList.Delete(Index);
          FPMNodeList.Delete(index);
          if Index = FRecList.Count then
            Break;
          if IPMNode(FPMNodeList[Index]).Level <= Level then
            Break;
        end;
        DestIndex := FRecList.IndexOf(DestRec);
        if DestIndex < 0 then
        begin

          DestIndex := Index - 1;
          if DestIndex < 0 then
            DestIndex := 0;
          DestRec := FRecList[DestIndex];
        end;

        MoveList.Add(lsRecList);
        MoveList.Add(lsNodeList);
        DestList.Add(FRecList);
        DestList.Add(FPMNodeList);
        MoveRecs(SourceRec, DestRec, MoveList, lsRecList, DestList, DestIndex,
          FDataSet, AMoveMod);

        ReConstructTree; // 重新构建树
        if (FDataSource <> nil) and (FDisplayUi) then // 移动界面
          FDataSource.DispalyUI;
      finally
        lsRecList.Free;
        lsNodeList.Free;
        MoveList.Free;
        DestList.Free;
      end;
    end;
  end;
end;

procedure TPMDataView.RefreshField(AFieldName: string);
begin
  if (FDisplayUi) and (FDataSource <> nil) then
    FDataSource.RefreshField(AFieldName);
end;

function TPMDataView.GetFieldValueAsString(FieldName, DValue: string;
  PmNode: IPMNode): string;
begin
  Result := FDataSet.GetFieldValueAsString(FieldName, DValue, PmNode.GetRec);
end;

function TPMDataView.GetTag: Integer;
begin
  Result := FTag;
end;

procedure TPMDataView.SetTag(const ATag: Integer);
begin
  FTag := ATag;
end;

function TPMDataView.GetFieldValueAsBoolean(FieldName: string; DValue: Variant;
  PmNode: IPMNode): Boolean;
begin
  Result := FDataSet.GetFieldValueAsBoolean(FieldName, DValue, PmNode.GetRec);
end;

function TPMDataView.GetFieldValueAsDouble(FieldName: string; DValue: Variant;
  PmNode: IPMNode): Double;
begin
  Result := FDataSet.GetFieldValueAsDouble(FieldName, DValue, PmNode.GetRec);
end;

function TPMDataView.GetFieldValueAsInt(FieldName: string; DValue: Variant;
  PmNode: IPMNode): Integer;
begin
  Result := FDataSet.GetFieldValueAsInt(FieldName, DValue, PmNode.GetRec);
end;

{ TDataStateBase }

constructor TDataStateBase.Create(ARec: Pointer);
begin
  // FStateInfo := TStateInfo.Create;
  // FStateInfo.SelfBuffer := ARec;
  FRec := ARec;
end;

function TDataStateBase.GetRecord: Pointer;
begin
Result:=nil;
  // Result := FStateInfo.SelfBuffer;
end;

procedure TDataStateBase.SetRecord(Value: Pointer);
begin
  // FStateInfo.SelfBuffer := Value;
end;

function TDataStateBase.FindAdress(AData: TPMDataSet): Integer;
begin
  Result := -1;
  if Rec <> nil then
    Result := AData.GetFieldValue(StateField, -1, Rec);
end;

procedure TDataStateBase.CheckFree(AData: TPMDataSet;
  StateStatus: TPMStateStatus);
begin
  if Self is TRecordDelete then
    case StateStatus of
      stDefault, stReDo:
        try
          if AData.FTempStateChangedRecList.IndexOf(Rec) < 0 then
            AData.FreeRec(Rec);
        except
          on e: Exception do
          begin
            AppendFiledata(cst_logname, cst_error_ED_0018 + e.Message);
          end;
        end;
    end;
  if Self is TRecordInsert then
    case StateStatus of
      stUnDo:
        try
          if AData.FTempStateChangedRecList.IndexOf(Rec) < 0 then
            AData.FreeRec(Rec);
        except
          on e: Exception do
          begin
            AppendFiledata(cst_logname, cst_error_ED_0019 + e.Message);
          end;
        end;
    end;
end;

procedure TDataStateBase.DecStateInfo(AData: TPMDataSet;
  StateStatus: TPMStateStatus);
begin
  // if FStateInfo.DetetRef(AData) then
  // begin
  if Self is TRecordDelete then
    case StateStatus of
      stDefault, stReDo:
        try
          if AData.FTempStateChangedRecList.IndexOf(Rec) < 0 then
            AData.FreeRec(Rec);
        except
          on e: Exception do
          begin
            AppendFiledata(cst_logname, cst_error_ED_0017 + e.Message);
          end;
        end;
    end;
  if Self is TRecordInsert then
    case StateStatus of
      stUnDo:
        try
          if AData.FTempStateChangedRecList.IndexOf(Rec) < 0 then
            AData.FreeRec(Rec);
        except
          on e: Exception do
          begin
            AppendFiledata(cst_logname, cst_error_ED_0016 + e.Message);
          end;
        end;
    end;
  // FStateInfo.Free;
  // end;

end;

destructor TDataStateBase.Destroy;
begin
  inherited;
end;

{ -------------------------------------------------------------------------------
  过程名:    TDataStateBase.CheckStateInfo
  作者:      李锋
  日期:      2010.06.22
  参数:      AData: TPMDataSet
  返回值:    无
  功能描述:  判断该记录是否 有 state历史记录
  ------------------------------------------------------------------------------- }

procedure TDataStateBase.CheckStateInfo(AData: TPMDataSet);
begin
end;

{ TDataChanged }

procedure TRecordChanged.ReadBufferIndex(AData: TPMDataSet);
begin
  // FRecIndex := -1;
  // if (Rec <> nil) and (AData <> nil) then
  // FRecIndex := AData.GetFieldValue('RecId', -1, Rec);
end;

procedure TRecordChanged.ReDo(AData: TPMDataSet);
var
  TempNotifChange: Boolean;
begin
  if AData.FTempStateChangedRecList.IndexOf(Rec) >= 0 then
    Exit;
  TempNotifChange := AData.FNotifyValueChanged;
  AData.FNotifyValueChanged := False;
  AData.SetFieldValue(FFiledName, FNewValue, Rec);
  AData.FNotifyValueChanged := TempNotifChange;
end;

procedure TRecordChanged.UnDo(AData: TPMDataSet);
var
  TempNotifChange: Boolean;
begin
  if AData.FTempStateChangedRecList.IndexOf(Rec) >= 0 then
    Exit;
  TempNotifChange := AData.FNotifyValueChanged;
  AData.FNotifyValueChanged := False;
  AData.SetFieldValue(FFiledName, FOldValue, Rec);
  AData.FNotifyValueChanged := TempNotifChange;
end;

procedure TDataStateBase.ReDo(AData: TPMDataSet);
begin

end;

procedure TDataStateBase.UnDo(AData: TPMDataSet);
begin
end;

{ TRecordDelete }

procedure TRecordDelete.ReDo(AData: TPMDataSet);
begin
  if AData.FTempStateChangedRecList.IndexOf(Rec) >= 0 then
    Exit;
  FOppRec := AData.InternalDeleteRow(Rec);
end;

procedure TRecordDelete.UnDo(AData: TPMDataSet);
begin
  if AData.FTempStateChangedRecList.IndexOf(Rec) >= 0 then
    Exit;
  AData.InternalInsertBefore_ByOppRec(Rec, FOppRec);
end;

{ TRecordInsert }

procedure TRecordInsert.ReDo(AData: TPMDataSet);
begin
  if AData.FTempStateChangedRecList.IndexOf(Rec) >= 0 then
    Exit;
  AData.InternalInsertBefore_ByOppRec(Rec, FOppRec);
end;

procedure TRecordInsert.UnDo(AData: TPMDataSet);
begin
  if AData.FTempStateChangedRecList.IndexOf(Rec) >= 0 then
    Exit;
  FOppRec := AData.InternalDeleteRow(Rec);
end;

{ TDataStateManger }

{ -------------------------------------------------------------------------------
  过程名:    TDataStateManger.Add
  作者:      李锋
  日期:      2010.06.22
  参数:      DataState: TDataStateBase
  返回值:    无
  功能描述:  添加state记录 并检查更新 stateinfo
  ------------------------------------------------------------------------------- }

procedure TDataStateManger.Add(DataState: TDataStateBase);
begin
  FStateList.Add(DataState);
  // DataState.CheckStateInfo(FOwner);
  // 2011 3.8 由于只要实现 单个专业工作的撤销工作， 为了使程序 稳定 去掉 state_info 字段中的   TStateInfo 类存放信息
end;

constructor TDataStateManger.Create(AData: TPMDataSet);
begin
  FOwner := AData;
  FStateList := TList.Create;
end;

destructor TDataStateManger.Destroy;
var
  i: Integer;
begin
  for i := 0 to FStateList.Count - 1 do
  begin
    // TDataStateBase(FStateList.Items[i]).DecStateInfo(FOwner, FStatus); //stateinfo 引用计数减一
    TDataStateBase(FStateList.Items[i]).CheckFree(FOwner, FStatus);
    TDataStateBase(FStateList.Items[i]).Free;
  end;
  if Assigned(FOwner) then
    FOwner.ManageStateCount := FOwner.ManageStateCount - 1; // stateCount计数减一
  FStateList.Free;
  inherited Destroy;
end;

function TDataStateManger.GetCount: Integer;
begin
  Result := FStateList.Count;
end;

function TDataStateManger.GetState: TPMStateStatus;
begin
  Result := FStatus;
end;

{ -------------------------------------------------------------------------------
  过程名:    TDataStateManger.isHaveChangRec
  作者:      李锋
  日期:      2010.06.08
  参数:      IndexList: TList
  返回值:    Boolean
  功能描述:  判断 该记录中是否有 修改记录的 事件 有则记录    在清空数据集  适应全局撤销时用到
  ------------------------------------------------------------------------------- }

function TDataStateManger.isHaveChangRec(IndexList: TList): Boolean;
var
  i: Integer;
  List: TList;
begin
  Result := False;
  List := nil;
  for i := 0 to FStateList.Count - 1 do
  begin
    if TDataStateBase(FStateList[i]).ClassType = TRecordChanged then
    begin
      if List = nil then
        List := TList.Create;
      List.Add(Pointer(i));
      Result := True;
    end;
  end;
  if Result then
    IndexList.Add(List);
end;

{ -------------------------------------------------------------------------------
  过程名:    TDataStateManger.Notify
  作者:      李锋
  日期:      2010.06.22
  参数:      Rec: Pointer; Value, NewValue: Variant; ChangType: TPMChangType; RecIndex: Integer; FieldName: string
  Rec:记录指针
  blobRec：memo类型记录指针
  Value：老值
  NewValue：新值
  ChangType：变动类型
  FieldName：字段名
  level：树状等级
  返回值: 无
  功能描述: 通知 产生state记录
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }

procedure TDataStateManger.Notify(Rec, OppRec: Pointer;
  NewValue, OldValue: string; ChangType: TPMChangType; RecIndex: Integer;
  FieldName: string);
var
  recDelete: TRecordDelete;
  RecAdd: TRecordInsert;
  RecChanged: TRecordChanged;
  RecMove: TRecordMove;
begin
  case ChangType of
    cDelete:
      begin
        recDelete := TRecordDelete.Create(Rec);
        recDelete.FOppRec := OppRec;
        Add(recDelete);
      end;
    cAddAfter, cAddBefore:
      begin
        RecAdd := TRecordInsert.Create(Rec);
        // RecAdd.FRecIndex := RecIndex;
        Add(RecAdd);
      end;
    cUpdate:
      begin
        if FieldName = StateField then
          Exit; // 设置 state字段 不记录
        if NewValue <> OldValue then
        begin
          FOwner.SetFieldValue(StateField, 1, Rec); // 修改事件标识
          RecChanged := TRecordChanged.Create(Rec);
          RecChanged.FFiledName := FieldName;
          RecChanged.FNewValue := NewValue;
          RecChanged.FOldValue := OldValue;
          Add(RecChanged);
        end;
      end;
    cMove:
      begin
        RecMove := TRecordMove.Create(Rec);
        RecMove.FOppRec := OppRec; // 移动前的 前一个记录
        Add(RecMove)
      end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TDataStateManger.RecoverRecBufferByIndex   SaveRecIndex
  作者:      李锋
  日期:      2010.06.22
  参数:      AList: Pointer
  返回值:    无
  功能描述:  通过buffer 保存 index 和通过index 恢复buffer指针  2010.6.22版本改动后 该功能弃用
  ------------------------------------------------------------------------------- }

procedure TDataStateManger.RecoverRecBufferByIndex(AList: Pointer);
// var
// i: Integer;
begin
  // for i := 0 to TList(AList).Count - 1 do
  // (TDataStateBase(FStateList[Integer(TList(AList)[i])]) as TRecordChanged).CopyBufferByIndex(FOwner);
end;

procedure TDataStateManger.SaveRecIndex(AList: Pointer);
var
  i: Integer;
begin
  for i := 0 to TList(AList).Count - 1 do
    (TDataStateBase(FStateList[Integer(TList(AList)[i])]) as TRecordChanged)
      .ReadBufferIndex(FOwner);
end;

{ -------------------------------------------------------------------------------
  过程名:    TDataStateManger.ReDo
  作者:      李锋
  日期:      2010.06.22
  参数:      无
  返回值:    无
  功能描述:  反撤销
  ------------------------------------------------------------------------------- }

procedure TDataStateManger.ReDo;
var
  i: Integer;
  TempMarkState: Boolean;
begin
  TempMarkState := FOwner.FMarkState;
  FOwner.FMarkState := False;
  try
    for i := 0 to FStateList.Count - 1 do
      TDataStateBase(FStateList.Items[i]).ReDo(FOwner);
    if IsHaveMoveStats then
      FOwner.RefreshViews;
  finally
    FStatus := stReDo;
    FOwner.FMarkState := TempMarkState;
    if Assigned(FOwner.OnAfterUnReDo) then
      FOwner.OnAfterUnReDo(FOwner);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TDataStateManger.UnDo
  作者:      李锋
  日期:      2010.06.22
  参数:      无
  返回值:    无
  功能描述:  撤销
  ------------------------------------------------------------------------------- }

procedure TDataStateManger.UnDo;
var
  i: Integer;
  TempMarkState: Boolean;
begin
  TempMarkState := FOwner.FMarkState;
  FOwner.FMarkState := False;
  try
    for i := FStateList.Count - 1 downto 0 do
      TDataStateBase(FStateList.Items[i]).UnDo(FOwner);
    if IsHaveMoveStats then
      FOwner.RefreshViews;
  finally
    FStatus := stUnDo;
    FOwner.FMarkState := TempMarkState;
    if Assigned(FOwner.OnAfterUnReDo) then
      FOwner.OnAfterUnReDo(FOwner);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TDataStateManger.IsHaveMoveStats
  作者:      lifeng
  日期:      2011.04.08
  参数:      无
  返回值:    Boolean
  功能描述:  判断是否有移动的撤销指令
  ------------------------------------------------------------------------------- }

function TDataStateManger.IsHaveMoveStats: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := FStateList.Count - 1 downto 0 do
  begin
    if TDataStateBase(FStateList.Items[i]) is TRecordMove then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

{ TFieldLinkView }

constructor TFieldLinkView.Create;
begin
  FLinked := False;
end;

{ -------------------------------------------------------------------------------
  过程名:    TFieldLinkView.GetValue
  作者:      李锋
  日期:      2010.06.22
  参数:      KeyValue: string; DefaultValue: Variant; Rec: Pointer
  返回值:    Variant
  功能描述:   关联字段 取值
  ------------------------------------------------------------------------------- }

destructor TFieldLinkView.Destroy;
begin
  inherited;
end;

function TFieldLinkView.GetValue(KeyValue: string; DefaultValue: Variant;
  Rec: Pointer): Variant;
var
  PmNode: IPMNode;
  DataSet: IPMDataset;
  linkRec: Pointer;
  RecList: TList;
begin
  Result := DefaultValue;
  if FView.GetDataSet = nil then
    Exit;
  if FLinked then
  begin
    if KeyValue = '' then
      Exit;
    DataSet := FView.GetDataSet;
    if DataSet = nil then
      Exit;
    RecList := TList.Create;
    try
      DataSet.FindRecList(FView.FPrimaryKey, KeyValue, RecList);
      if RecList.Count = 1 then
      begin
        linkRec := RecList[0];
        Result := DataSet.GetFieldValue(FFieldName, DefaultValue, linkRec);
      end
      else
      begin
        PmNode := FView.FindPmNode(FView.FPrimaryKey, KeyValue);
        if PmNode <> nil then
          Result := FView.GetDataSet.GetFieldValue(FFieldName, DefaultValue,
            PmNode.GetRec);
      end;

    finally
      RecList.Free;
    end;
  end
  else
    Result := FView.GetDataSet.GetFieldValue(FFieldName, DefaultValue, Rec);
end;

{ -------------------------------------------------------------------------------
  过程名:    TFieldLinkView.SetValue
  作者:      李锋
  日期:      2010.06.22
  参数:      Value: Variant; KeyValue: string; Rec, PMNode: Pointer
  返回值:    无
  功能描述:  关联字段设置值
  ------------------------------------------------------------------------------- }

procedure TFieldLinkView.SetValue(Value: Variant; KeyValue: string;
  Rec: Pointer; PmNode: IPMNode);
var
  pNode: IPMNode;
  linkRec: Pointer;
  ds: IPMDataset;
  RecList: TList;
begin
  if FView.GetDataSet = nil then
    Exit;
  if FLinked then
  begin // 该字段关联时的处理
    if KeyValue = '' then
      Exit;
    ds := FView.GetDataSet;
    if ds = nil then
      Exit;
    RecList := TList.Create;
    try
      ds.FindRecList(FView.FPrimaryKey, KeyValue, RecList);
      if RecList.Count = 1 then
      begin
        linkRec := RecList[0];
        ds.SetFieldValue(FFieldName, Value, linkRec);
      end
      else
      begin
        pNode := FView.FindPmNode(FView.FPrimaryKey, KeyValue);
        if pNode <> nil then
          pNode.SetValue(Value, FFieldName);
      end;
    finally
      RecList.Free;
    end;
  end
  else // 没有关联的字段处理
    FView.GetDataSet.SetFieldValue(FFieldName, Value, Rec, PmNode);
end;

{ TLinkViewVertical }

constructor TPMLinkView.Create(ADataSet: IPMDataset);
begin
  inherited Create(ADataSet);
  FLinked := False;
  FToLinked := False;
  FField_LinkField := TStringHash.Create;
  FField_LinkObject := TObjectHash.Create;
  // FRecHashByPrimaryKey := THashedStringList.Create;
  // FRecHashByForeignKey := THashedStringList.Create;
  FLinkedViewList := TInterfaceList.Create;
  FToLinkView := TList.Create;
end;

destructor TPMLinkView.Destroy;
var
  i, index: Integer;
  lsView: TPMLinkView;
begin
  // FRecHashByPrimaryKey.Free;
  // FRecHashByForeignKey.Free;
  if FField_LinkObject <> nil then
  begin
    ClearObjectHash(FField_LinkObject);
    FField_LinkObject.Free;
  end;
  for i := 0 to FLinkedViewList.Count - 1 do
  begin // 清理关联View中关系
    lsView := TPMLinkView(IPMDataView(FLinkedViewList[i]).GetObject);
    index := lsView.FToLinkView.IndexOf(Self);
    if index >= 0 then
      lsView.FToLinkView.Delete(index);
  end;
  FLinkedViewList.Clear;
  FLinkedViewList.Free;
  FField_LinkField.Free;
  FToLinkView.Free;
  inherited Destroy;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMLinkView.ReAddRec
  作者:      lifeng
  日期:      2010.08.24
  参数:      无
  返回值:    无
  功能描述:  过滤后重新加载数据， 关联视图 清空hash表  - 重新生成hash
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.ReAddRec(BufferList: TList);
begin
  // FRecHashByPrimaryKey.Clear;
  // FRecHashByForeignKey.Clear;
  inherited ReAddRec(BufferList);
  SetForeignKey(FForeignKey);
  SetPrimaryKey(FPrimaryKey);
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.CreateSelfField
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    无
  功能描述:  当 该view字段需要关联的时候 预先建好 hash表
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.CreateSelfField;
var
  i: Integer;
  FieldLinkView: TFieldLinkView;
begin
  for i := 0 to FFieldList.Count - 1 do
  begin
    FieldLinkView := TFieldLinkView.Create;
    FieldLinkView.FieldName := FFieldList.Strings[i];
    FieldLinkView.View := Self;
    FField_LinkObject.Items[FFieldList.Strings[i]] := FieldLinkView;
  end;
end;

procedure TPMLinkView.CreateSelfFieldHash;
begin

end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.SetLinkField
  作者:      李锋
  日期:      2010.06.04
  参数:      FieldName, LinkFieldName: string; ALinkView: IPMDataView
  返回值:    无
  功能描述:  设置 2个数据集的关联字段
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.SetLinkField(FieldName, LinkFieldName: string;
  ALinkView: IPMDataView);
var
  FieldLinkView: TFieldLinkView;
begin
  if (LinkFieldName = '') or (ALinkView = nil) then
    Exit;
  if not FLinked then
  begin
    CreateSelfField;
    FLinked := True;
  end;
  try
    if Trim(FieldName) = '' then
    begin // 无对应关系
      FieldName := LinkFieldName;
      if FField_LinkObject.Exists(FieldName) then // 是否已经存在
        FieldLinkView := TFieldLinkView(FField_LinkObject.Items[FieldName])
      else
      begin
        FieldLinkView := TFieldLinkView.Create;
        FField_LinkObject.Items[FieldName] := FieldLinkView;
      end;
      if FFieldList.IndexOf(LinkFieldName) < 0 then
        FFieldList.Add(LinkFieldName); // 虚拟字段
    end
    else
    begin
      FieldLinkView := TFieldLinkView(FField_LinkObject.Items[FieldName]);
      FField_LinkField.Items[FieldName] := LinkFieldName;
    end;

    FieldLinkView.FieldName := LinkFieldName;
    FieldLinkView.View := TPMLinkView(ALinkView.GetObject);
    FieldLinkView.Linked := True;
    ALinkView.GetFieldHash.Items[LinkFieldName] := FieldName;
    // field和linkfield对应表
    if FLinkedViewList.IndexOf(ALinkView) < 0 then
    begin
      FLinkedViewList.Add(ALinkView); // 关联view列表
      TPMLinkView(ALinkView.GetObject).ToLinkView.Add(Self);
      // 设置关联View  被关联的VIEW 字段值改变时 同步显示到 关联的view视图中
    end;
    CreateSelfFieldHash
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0015 + e.Message);
      raise Exception.Create('字段名 “' + FieldName + '”不存在');
    end;
  end;
end;

function TPMLinkView.GetPrimaryKey: string;
begin
  Result := FPrimaryKey;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.GetPrimaryKey   SetPrimaryKey
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    string
  功能描述:  获取 和设置 主键 字段
  被关联VIEW 设置主键   生成hash表
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.SetPrimaryKey(FieldName: string);
begin
  if FFieldList.IndexOf(FieldName) >= 0 then
  begin
    FPrimaryKey := FieldName;
    FToLinked := True;
  end
  else
  begin
    if FieldName = '' then
      FToLinked := False
    else
      raise Exception.Create('字段“' + FieldName + '”不存在！！！');
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.GetForeignKey    SetForeignKey
  作者:      李锋
  日期:      2010.06.04
  参数:      无
  返回值:    string
  功能描述: 获取和 设置 外键 字段   当该View 需要 关联别的VIEW的字段时 设置
  ------------------------------------------------------------------------------- }

function TPMLinkView.GetForeignKey: string;
begin
  Result := FForeignKey;
end;

procedure TPMLinkView.SetForeignKey(FieldName: string);
begin
  // if FForeignKey = FieldName then Exit;
  if FieldName = '' then
    Exit;
  if FFieldList.IndexOf(FieldName) >= 0 then
  begin
    FForeignKey := FieldName;
    // CreateRecHash(FRecHashByForeignKey, FForeignKey);
  end
  else
    raise Exception.Create('设置外键出错！字段名“' + FieldName + '”不存在！！！');

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.GetLinkRec
  作者:      李锋
  日期:      2010.06.04
  参数:      Value: string
  返回值:    Pointer
  功能描述:  通过 主键字段的值 查找 记录
  ------------------------------------------------------------------------------ }

function TPMLinkView.GetLinkRec(Value: string): Pointer;
begin
  Result := nil;

  if FPrimaryKey = '' then
    Exit;
  Result := FDataSet.FindRec(FPrimaryKey, Value);
  // index := FRecHashByPrimaryKey.IndexOf(Value);
  // if index >= 0 then
  // Result := IPMNode(Pointer((FRecHashByPrimaryKey.Objects[index])));

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.SetFieldValue
  作者:      李锋
  日期:      2010.06.04
  参数:      FieldName: string; Value: Variant; Rec: Pointer
  返回值:    Boolean
  功能描述:  设置值 若为关联字段 则 到关联的view中设置值
  ------------------------------------------------------------------------------- }

function TPMLinkView.SetFieldValue(FieldName: string; Value: Variant;
  PmNode: IPMNode): Boolean;
var
  P: Pointer;
  FieldLinkView: TFieldLinkView;
  KeyValue: string;
begin
  Result := False;
  P := nil;
  if PmNode <> nil then
    P := PmNode.GetRec;
  if not FLinked then // 没有关联
    Result := FDataSet.SetFieldValue(FieldName, Value, P, PmNode)
  else
  begin
    if FField_LinkObject.Exists(FieldName) then
    begin
      FieldLinkView := TFieldLinkView(FField_LinkObject.Items[FieldName]);
      // 根据字段名取对象
      KeyValue := '';
      if FieldLinkView.Linked then // 该字段为关联字段
        KeyValue := FDataSet.GetFieldValueAsString(FForeignKey, '', P);
      FieldLinkView.SetValue(Value, KeyValue, P, PmNode);
    end
    else
      Result := FDataSet.SetFieldValue(FieldName, Value, P, PmNode)
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.GetFieldValue
  作者:      李锋
  日期:      2010.06.04
  参数:      FieldName: string; DValue: Variant; Rec: Pointer
  返回值:    Variant
  功能描述:  取值 根据字段名 取的对象 如果为关联字段 则去关联的view中取值
  ------------------------------------------------------------------------------- }

function TPMLinkView.GetFieldValue(FieldName: string; DValue: Variant;
  PmNode: IPMNode): Variant;
var
  P: Pointer;
  FieldLinkView: TFieldLinkView;
  KeyValue: string;
begin
  P := nil;
  if PmNode <> nil then
    P := PmNode.GetRec;
  if not FLinked then
    Result := FDataSet.GetFieldValue(FieldName, DValue, P)
  else
  begin
    if FField_LinkObject.Exists(FieldName) then
    begin
      FieldLinkView := TFieldLinkView(FField_LinkObject.Items[FieldName]);
      KeyValue := '';
      if FieldLinkView.Linked then
        KeyValue := FDataSet.GetFieldValueAsString(FForeignKey, '', P);
      Result := FieldLinkView.GetValue(KeyValue, DValue, P);
    end
    else
      Result := FDataSet.GetFieldValue(FieldName, DValue, P);
  end;
end;

function TPMLinkView.OnDataAddBefore(Rec: Pointer): Boolean;
begin
  Result := True;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.OnDataAdd
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec, OppRec: Pointer; RecIndex, OppRecIndex: Integer; ChangType: TPMChangType; bInter: Boolean
  返回值:    IPMNode
  功能描述:  关联view 响应数据添加
  ------------------------------------------------------------------------------- }

function TPMLinkView.OnDataAdd(Rec, OppRec: Pointer;
  RecIndex, OppRecIndex: Integer; ChangType: TPMChangType;
  bInter: Boolean): IPMNode;
begin
  if OnDataAddBefore(Rec) then
  begin
    FTempNode := inherited OnDataAdd(Rec, OppRec, RecIndex, OppRecIndex,
      ChangType, bInter);
    OnDetailViewAdd(Rec, FTempNode);
    // OnDetailViewAdd(Rec, FTempNode);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.OnDataDetete
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec: Pointer; RecIndex: Integer; var Index: Integer
  返回值:    无
  功能描述:   字段管理view 响应 数据删除
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.OnDataDetete(Rec: Pointer; RecIndex: Integer;
  bInternal: Boolean; var Index: Integer);
var
  TempIndex: Integer;
begin
  inherited OnDataDetete(Rec, RecIndex, bInternal, TempIndex);
  OnDetailViewDelete;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.OnDataUpdate
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec: Pointer; PmNode: IPMNode; NewValue, OldValue, FieldName: string
  返回值:    无
  功能描述:   响应数据修改
  ------------------------------------------------------------------------------- }

function TPMLinkView.OnDataUpdate(Rec: Pointer; PmNode: IPMNode;
  NewValue, OldValue, FieldName: string): Integer;
var
  Index: Integer;
begin
  Result := -1;
  Index := -1;
  if FToLinked then // 被关联时
  else
  begin
    if (FDataSource <> nil) and (FDisplayUi) then
    begin
      if (PmNode = nil) or (PmNode.GetRec <> Rec) or
        (PmNode.GetView.GetObject <> Self) then
      // pmnode 在修改关联字段的情况 有可能不为 本身view中记录
      // 更新不同的view的时候 也有可能不为自己的view
      begin
        PmNode := nil;
        Index := FRecList.IndexOf(Rec);
        if Index >= 0 then
          PmNode := (FPMNodeList[Index] as IPMNode);
      end;
      if PmNode <> nil then
      begin
        if PmNode.GetRec <> Rec then
          Exit;
        FDataSource.OnSourceDataChanger(PmNode, FieldName, NewValue);
      end;
    end;
  end;

  OnDetailViewUpdate(Rec, PmNode, index, OldValue, NewValue, FieldName);

end;

procedure TPMLinkView.OnDetailViewUpdate(Rec: Pointer; PmNode: IPMNode;
  RecIndex: Integer; OldValue, NewValue, FieldName: string);
begin

end;

procedure TPMLinkView.OnDetailViewAdd(Rec: Pointer; PmNode: IPMNode);
begin

end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.DataChanged
  作者:      李锋
  日期:      2010.05.05
  参数:      Rec: Pointer;
  返回值:    无
  功能描述:  响应数据集 的数据变动
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.DataChanged(Rec: Pointer);
begin
  try
    FPriValue := '';
    FForeValue := '';
    if FPrimaryKey <> '' then // 取 主键值和外键值
      FPriValue := FDataSet.GetFieldValueAsString(FPrimaryKey, '', Rec);
    if FForeignKey <> '' then
      FForeValue := FDataSet.GetFieldValueAsString(FForeignKey, '', Rec);
  except
    on e: Exception do
    begin
      AppendFiledata(cst_logname, cst_error_ED_0014 + e.Message);
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.SetDataSource
  作者:      李锋
  日期:      2010.06.10
  参数:      ASource: Pointer
  返回值:    无
  功能描述:  重载 SetDataSource 给关联的view也设置同个source 用来刷新界面  所以关联view 不能单独用来刷界面
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.SetDataSource(ASource: Pointer);
begin
  inherited SetDataSource(ASource);
end;

function TPMLinkView.GetFieldHash: TStringHash;
begin
  Result := FField_LinkField;
end;

procedure TPMLinkView.ClearRef;
begin
  inherited ClearRef;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.FindLinkView
  作者:      lifeng
  日期:      2010.07.26
  参数:      FieldName: string; var AView: IPMDataView
  返回值:    Boolean
  功能描述:  通过字段名查找真正 包含此字段值的view
  ------------------------------------------------------------------------------- }

function TPMLinkView.FindLinkView(FieldName: string;
  var AView: IPMDataView): Boolean;
var
  FieldLinkView: TFieldLinkView;
begin
  Result := False;
  AView := Self;
  if FLinked then
  begin
    try
      FieldLinkView := TFieldLinkView(FField_LinkObject.Items[FieldName]);
      if FieldLinkView.Linked then
      begin
        Result := True;
        AView := FieldLinkView.View;
      end;
    except
      on e: Exception do
      begin
        AppendFiledata(cst_logname, cst_error_ED_0013 + e.Message);
      end;
    end;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkView.GetForeigLinkRec
  作者:      lifeng
  日期:      2010.07.27
  参数:      Value: string
  返回值:    IPMNode
  功能描述:   通过外键值 查找记录   当该view为被关联view时 同步更新需要用到
  ------------------------------------------------------------------------------- }

function TPMLinkView.GetForeigLinkRec(Value: string): IPMNode;
begin
  Result := nil;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMLinkView.AssignedLink
  作者:      lifeng
  日期:      2010.08.24
  参数:      ASource: TPMDataView
  返回值:    无
  功能描述:  复制列关联关系  关联别的表的情况下
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.AssignedLink(ASource: TPMLinkView);
var
  Key: string;
  Flv: TFieldLinkView;
begin
  Self.SetForeignKey(ASource.FForeignKey);
  ASource.FField_LinkObject.Restart;
  while ASource.FField_LinkObject.Next do
  begin
    Key := ASource.FField_LinkObject.CurrentKey;
    Flv := TFieldLinkView(ASource.FField_LinkObject.Items[Key]);
    if Flv.FView <> ASource then
    begin
      if not FDataSet.CheckFieldExit(Key) then
        Key := '';
      SetLinkField(Key, Flv.FieldName, Flv.View);
    end;
  end;

end;

procedure TPMLinkView.OnDetailViewDelete;
begin

end;
{ TPMNode }

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.AddChild
  作者:      lifeng
  日期:      2010.08.25
  参数:      APMNode: IPMNode
  返回值:    无
  功能描述:   添加子记录
  ------------------------------------------------------------------------------- }

procedure TPMNode.InternalAddChild(APMNode: IPMNode);
begin
  if FChildNodeList <> nil then
  begin
    FChildNodeList.Add(Pointer(APMNode));
    APMNode.ParentNode := Self;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.AddFirstChild
  作者:      lifeng
  日期:      2010.08.25
  参数:      APMNode: IPMNode
  返回值:    无
  功能描述:   添加到子记录中的第一条
  ------------------------------------------------------------------------------- }

procedure TPMNode.InternalAddFirstChild(APMNode: IPMNode);
begin
  // if Self = FOwenView.Root.GetSelfPointer then Exit;
  if FChildNodeList <> nil then
  begin
    FChildNodeList.Insert(0, Pointer(APMNode));
    // FChildNodeList.Add(APMNode.GetSelfPointer);
    APMNode.ParentNode := Self;
  end;
end;

constructor TPMNode.Create(AView: TPMDataView; Rec: Pointer);
begin
  FOwenView := AView;
  FRec := Rec;
  FChildNodeList := TList.Create;
  FNode := nil;
  FDelete := False;
end;

destructor TPMNode.Destroy;
begin
  FChildNodeList.Free;
  inherited;
end;

function TPMNode.GetView: IPMDataView;
begin
  Result := FOwenView;
end;

function TPMNode.GetRec: Pointer;
begin
  Result := FRec;
end;

function TPMNode.GetParentNode: IPMNode;
begin
  // Result := nil;
  // if FParentNode = FOwenView.Root.GetSelfPointer then Exit;
  Result := FParentNode;

end;

procedure TPMNode.SetParentNode(ANode: IPMNode);
begin
  if ANode = nil then
    FParentNode := nil
  else
    FParentNode := TPMNode(ANode.GetSelfPointer);
end;

procedure TPMNode.SetRec(ARec: Pointer);
begin
  // if ARec <> nil then
  FRec := ARec;
end;

function TPMNode.GetChildNodeList: TList;
begin
  Result := FChildNodeList;
end;

function TPMNode.GetValue(FieldName: string; DefaultValue: Variant): Variant;
begin
  Result := DefaultValue;
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FRec = nil then
     Exit;
  Result := FOwenView.GetFieldValue(FieldName, DefaultValue, Self);
end;

function TPMNode.GetValueAsBoolean(FieldName: string;
  DefaultValue: Boolean): Boolean;
var
  S: string;
begin
  Result := DefaultValue;
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FRec = nil then
     Exit;
  if FOwenView.ClassName = 'TPMDataView' then
    Result := FOwenView.GetFieldValueAsBoolean(FieldName, DefaultValue, Self)
  else
  begin
    S := FOwenView.GetFieldValue(FieldName, '', Self);
    Result := StrToBoolDef(S, DefaultValue);
  end;
end;

function TPMNode.GetValueAsDouble(FieldName: string;
  DefaultValue: Double): Double;
var
  S: string;
begin
  Result := DefaultValue;
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FRec = nil then
     Exit;
  if FOwenView.ClassName = 'TPMDataView' then
    Result := FOwenView.GetFieldValueAsDouble(FieldName, DefaultValue, Self)
  else
  begin
    S := FOwenView.GetFieldValue(FieldName, '', Self);
    if S = '' then
      Exit;
    Result := StrToFloatDef(S, DefaultValue);
  end;
end;

function TPMNode.GetValueAsInt(FieldName: string;
  DefaultValue: Integer): Integer;
var
  S: string;
begin
  Result := DefaultValue;
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FRec = nil then
     Exit;
  if FOwenView.ClassName = 'TPMDataView' then
    Result := FOwenView.GetFieldValueAsInt(FieldName, DefaultValue, Self)
  else
  begin
    S := FOwenView.GetFieldValue(FieldName, '', Self);
    if S = '' then
      Result := DefaultValue
    else
      Result := StrToIntDef(S, DefaultValue);
  end;
end;

function TPMNode.GetValueAsString(FieldName, DefaultValue: string): string;
begin
  Result := DefaultValue;
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FRec = nil then
     Exit;
  if FOwenView.ClassName = 'TPMDataView' then
    Result := FOwenView.GetFieldValueAsString(FieldName, DefaultValue, Self)
  else
    Result := FOwenView.GetFieldValue(FieldName, DefaultValue, Self);
end;

procedure TPMNode.SetValue(Value: Variant; FieldName: string);
begin
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  FOwenView.SetFieldValue(FieldName, Value, Self);
end;

procedure TPMNode.SetValueAsBoolean(Value: Boolean; FieldName: string);
begin
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  FOwenView.SetFieldValue(FieldName, Value, Self);
end;

procedure TPMNode.SetValueAsDouble(Value: Double; FieldName: string);
begin
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  FOwenView.SetFieldValue(FieldName, Value, Self);
end;

procedure TPMNode.SetValueAsInt(Value: Integer; FieldName: string);
begin
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  FOwenView.SetFieldValue(FieldName, Value, Self);
end;

procedure TPMNode.SetValueAsString(Value, FieldName: string);
begin
  if (FOwenView = nil) or (FOwenView.Root = nil) then
    Exit;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  FOwenView.SetFieldValue(FieldName, Value, Self);
end;

function TPMNode.GetChildCount: Integer;
begin
  Result := FChildNodeList.Count;
end;

function TPMNode.GetChildNode(Index: Integer): IPMNode;
begin
  Result := IPMNode(FChildNodeList[Index]);
end;

function TPMNode.GetLevel: Integer;
begin
  Result := 0;
  if Self = FOwenView.FRoot.GetSelfPointer then
  begin
    Result := -1;
    Exit;
  end;
  if FOwenView.FLevel then
    Result := FOwenView.GetFieldValue(RecordLevel, 0, Self);
end;

procedure TPMNode.SetLevel(Value: Integer);
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.FLevel then
    FOwenView.SetFieldValue(RecordLevel, Value, Self);
end;

function TPMNode.GetUiNode: Pointer;
begin
  Result := FNode;
end;

procedure TPMNode.SetNode(Value: Pointer);
begin
  FNode := Value;
end;

function TPMNode.GetSelfPointer: Pointer;
begin
  Result := Self;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.FindLastChildNode
  作者:      lifeng
  日期:      2010.07.22
  参数:      无
  返回值:    TPMNode
  功能描述:  取子节点的最后一条记录
  ------------------------------------------------------------------------------- }

function TPMNode.FindLastChildNode: IPMNode;
begin
  Result := nil;
  if FChildNodeList = nil then
    Exit;
  if FChildNodeList.Count = 0 then
    Exit;
  Result := IPMNode(FChildNodeList.Last);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.GetChildLastestNode
  作者:      lifeng
  日期:      2010.07.22
  参数:      无
  返回值:    TPMNode
  功能描述:   取该节点下拉平的 最后一条 记录
  ------------------------------------------------------------------------------- }

function TPMNode.GetChildLastestNode: IPMNode;
begin
  Result := Self;
  if FChildNodeList = nil then
    Exit;
  if FChildNodeList.Count = 0 then
    Exit;
  Result := IPMNode(FChildNodeList.Last);
  Result := Result.GetChildLastestNode;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.DeleteAll
  作者:      lifeng
  日期:      2010.07.26
  参数:      无
  返回值:    无
  功能描述:  删除该节点下的所有记录 包括自己
  ------------------------------------------------------------------------------- }

procedure TPMNode.DeleteAll;
var
  PmNode: IPMNode;
  TempState: Boolean;
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  TempState := FOwenView.GetDeleteChild;
  FOwenView.SetDeleteChild(False); // 设置view的删除节点状态为false
  while True do
  begin // 从下往上删除
    PmNode := GetChildLastestNode; // 取最后最小一条记录
    if TPMNode(PmNode.GetSelfPointer) = Self then
      Break;
    FOwenView.DeleteRow(PmNode);
  end;
  FOwenView.DeleteRow(Self);
  FOwenView.SetDeleteChild(TempState); // 设置View状态为原先值
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.RemoveParent
  作者:      lifeng
  日期:      2010.07.26
  参数:      无
  返回值:    无
  功能描述:  删除自身在父级节点中的关系
  ------------------------------------------------------------------------------- }

procedure TPMNode.RemoveParent;
begin
  if FParentNode = nil then
    Exit;
  FParentNode.InternalDeleteChild(Self);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.DeleteChild
  作者:      lifeng
  日期:      2010.07.26
  参数:      PMNode: IPMNode
  返回值:    无
  功能描述:  删除 子记录
  ------------------------------------------------------------------------------- }

procedure TPMNode.DeleteChild;
var
  i: Integer;
  tempList: TList;
begin
  tempList := TList.Create;
  try
    for i := 0 to FChildNodeList.Count - 1 do
      tempList.Add(FChildNodeList[i]);
    for i := tempList.Count - 1 downto 0 do
      FOwenView.DeleteRow(IPMNode(tempList[i]));
  finally
    tempList.Free;
  end;
end;

function TPMNode.GetDelete: Boolean;
begin
  Result := FDelete;
end;

procedure TPMNode.SetDelete(Value: Boolean);
begin
  FDelete := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.getPrevSibling
  作者:      lifeng
  日期:      2010.08.16
  参数:      无
  返回值:    IPMNode
  功能描述:  取前一个同级Node
  ------------------------------------------------------------------------------- }

function TPMNode.GetPrevSibling: IPMNode;
var
  Index: Integer;
begin
  Result := nil;
  if GetParentNode = nil then
    Exit;
  Index := GetParentNode.GetChildNodeList.IndexOf(Pointer(Self as IPMNode));
  if Index <= 0 then
    Exit;
  Result := GetParentNode.GetChildNode(Index - 1);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.GetNextSibling
  作者:      lifeng
  日期:      2010.08.16
  参数:      无
  返回值:    IPMNode
  功能描述:   取下一个同级NODE
  ------------------------------------------------------------------------------- }

function TPMNode.GetNextSibling: IPMNode;
var
  Index: Integer;
begin
  Result := nil;
  if GetParentNode = nil then
    Exit;
  Index := GetParentNode.GetChildNodeList.IndexOf(Pointer(Self as IPMNode));
  if (Index < 0) or (Index = GetParentNode.GetChildNodeList.Count - 1) then
    Exit;

  Result := FParentNode.ChildNodes[Index + 1];
end;

function TPMNode.GetDetailLinkView: IPMDataView;
begin
  Result := nil;
end;

procedure TPMNode.SetDetailLinkView(const Value: IPMDataView);
begin

end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.AddNexSibling
  作者:      lifeng
  日期:      2010.08.25
  参数:      APMNode: IPMNode
  返回值:    无
  功能描述:  添加下一个同级记录
  ------------------------------------------------------------------------------- }

procedure TPMNode.InternalAddNexSibling(APMNode: IPMNode);
var
  Index: Integer;
begin
  if FParentNode = nil then
    Exit;
  if FParentNode.GetChildNodeList.Count = 0 then
    FParentNode.InternalAddChild(APMNode)
  else
  begin
    if FParentNode.GetChildNodeList.Last = Pointer(Self as IPMNode) then
      FParentNode.InternalAddChild(APMNode)
    else
    begin
      Index := FParentNode.GetChildNodeList.IndexOf(Pointer(Self as IPMNode));
      if Index < 0 then
        Exit;
      if Index < FParentNode.GetChildNodeList.Count - 1 then
      begin
        FParentNode.GetChildNodeList.Insert(Index + 1, Pointer(APMNode));
        APMNode.ParentNode := FParentNode;
      end
      else
        FParentNode.InternalAddChild(APMNode);
    end;
  end;
end;

{ TStateInfo }

procedure TStateInfo.AddRef;
begin
  Inc(FRef);
end;

constructor TStateInfo.Create;
begin
  FRef := 1;
end;

{ -------------------------------------------------------------------------------
  过程名:    TStateInfo.DetetRef
  作者:      lifeng
  日期:      2010.07.26
  参数:      AData: TPMDataSet
  返回值:    无
  功能描述:  引用计数减一
  ------------------------------------------------------------------------------- }

function TStateInfo.DetetRef(AData: TPMDataSet): Boolean;
begin
  Result := False;
  Dec(FRef);
  if FRef <= 0 then
    case AData.RecStatus of
      recDefault:
        begin
          AData.InternalSetFieldValue(StateField, null, FSelfBuffer);
          // AData.SetFieldValue(StateField, null, FSelfBuffer); //设置空 并释放内存
          Result := True;
        end;
      recTempClear:
        FState := sFree;
    end;
end;

{ TPmViewStreamWrite }

constructor TPmViewStreamWrite.Create(AMemData: TdxCustomMemData;
  AStream: TStream);
begin
  inherited Create(AMemData, AStream);

end;

{ -------------------------------------------------------------------------------
  过程名:    TPmViewStreamWrite.SaveData
  作者:      lifeng
  日期:      2010.08.04
  参数:      无
  返回值:    无
  功能描述:  保存VIEW到流中
  ------------------------------------------------------------------------------- }

procedure TPmViewStreamWrite.SaveData;
var
  i: Integer;
  attLen: Integer;
begin
//  Stream.Read(attLen, SizeOf(Integer));
  WriteMemDataVersion;
  FillFieldList;
  WriteFields;
  Size := MAXSTREAMSIZE;
  Stream.Size := MAXSTREAMSIZE;
  for i := 0 to FDataView.RecList.Count - 1 do
    WriteRecordByBuffer(FDataView.RecList[i]);
  Stream.Size := RealSize;
end;

{ TPMDataLinkDetailView }

constructor TPMLinkDetailView.Create(ADataSet: IPMDataset);
begin
  FFieldHashList := TIntegerHash.Create;
  inherited Create(ADataSet);
  FHideNoChildNode := False;
end;

destructor TPMLinkDetailView.Destroy;
begin
  FFieldHashList.Free;
  inherited;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.FindDetailView
  作者:      lifeng
  日期:      2010.08.20
  参数:      PmNode: IPMNode
  返回值:    无
  功能描述:  取记录detailview
  ------------------------------------------------------------------------------- }

procedure TPMLinkDetailView.FindDetailView(PmNode: IPMNode);
var
  View: IPMDataView;
  NewView: TPMDetailView;
begin
  View := nil;
  if (FDetailView <> nil) and (FMasterPrimaryField <> '') and
    (FDetailPrimaryField <> '') then
  begin
    NewView := TPMDetailView.Create(nil);
    TPMDataView(FDetailView.GetObject).GetFilterView(FDetailPrimaryField,
      PmNode.GetValue(FMasterPrimaryField, ''), NewView);
    View := NewView;
    if View <> nil then
    begin
      View.ForeignKey := FDetailView.ForeignKey; // 该从表只关联别的表 而不被别表关联
      TPMLinkView(View.GetObject)
        .AssignedLink(TPMLinkView(FDetailView.GetObject)); // 主表的 列关联关系 传递给从表
      PmNode.DetailView := View;
      TPMDetailView(View.GetObject).FShowLinkDetail := True;
      TPMDetailView(View.GetObject).FMasterNode :=
        TPMNode(PmNode.GetSelfPointer);
    end;
  end;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.ConstructorNode
  作者:      lifeng
  日期:      2010.08.17
  参数:      Rec: Pointer; Index: Integer
  返回值:    IPMNode
  功能描述:  创建 TPMLinkDetailNode 含有 从表view的NODE
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.ConstructorNode(Rec: Pointer;
  Index: Integer = -1): IPMNode;
begin
  Result := TPMLinkDetailNode.Create(Self, Rec);
  Result.ParentNode := nil;
  if Index < 0 then
    FPMNodeList.Add(Result)
  else
    FPMNodeList.Insert(Index, Result);
  StructTree(Rec, Result);
  FindDetailView(Result);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.GetFieldValue
  作者:      lifeng
  日期:      2010.08.17
  参数:      FieldName: string; DValue: Variant; PmNode: IPMNode
  返回值:    Variant
  功能描述:   取值
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.GetFieldValue(FieldName: string; DValue: Variant;
  PmNode: IPMNode): Variant;
begin
  if PmNode = nil then
    Exit;
  if PmNode.GetView.GetObject = Self then
    Result := inherited GetFieldValue(FieldName, DValue, PmNode)
  else
    Result := PmNode.GetValue(FieldName, DValue);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.SetFieldValue
  作者:      lifeng
  日期:      2010.08.17
  参数:      FieldName: string; Value: Variant; PmNode: IPMNode
  返回值:    Boolean
  功能描述:   设置值
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.SetFieldValue(FieldName: string; Value: Variant;
  PmNode: IPMNode): Boolean;
begin
  Result := True;
  if PmNode = nil then
    Exit;
  if PmNode.GetView.GetObject = Self then
    inherited SetFieldValue(FieldName, Value, PmNode)
  else
    PmNode.SetValue(Value, FieldName);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.GetDetailPrimaryField
  作者:      lifeng
  日期:      2010.08.17
  参数:      无
  返回值:    string
  功能描述:  设置，取值 从表的主键值 该值 存在主表对象上
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.GetDetailPrimaryField: string;
begin
  Result := FDetailPrimaryField;
end;

procedure TPMLinkDetailView.setDetailPrimaryField(const Value: string);
begin
  FDetailPrimaryField := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.GetMasterPrimaryField
  作者:      lifeng
  日期:      2010.08.17
  参数:      无
  返回值:    string
  功能描述:   设置 取值 主表 主键值
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.GetMasterPrimaryField: string;
begin
  Result := FMasterPrimaryField;
end;

procedure TPMLinkDetailView.SetMasterPrimaryField(const Value: string);
begin
  FMasterPrimaryField := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.SetDetailView
  作者:      lifeng
  日期:      2010.08.17
  参数:      AView: IPMDataView
  返回值:    无
  功能描述:  设置 从表VIEW
  ------------------------------------------------------------------------------- }

procedure TPMLinkDetailView.SetDetailView(AView: IPMDataView);
var
  i: Integer;
  Field: string;
begin
  if AView = nil then
  begin
    FDetailView := nil;
    Exit;
  end;
  if FDetailView = AView then
    Exit;
  if not(TObject(AView.GetObject) is TPMLinkDetailView) then
    raise Exception.Create('视图类型不匹配：从表关联必须创建对应的视图类型！！！');
  FDetailView := AView;

  for i := 0 to FDetailView.GetFieldList.Count - 1 do
  begin
    Field := FDetailView.GetFieldList.Strings[i];
    if FFieldList.IndexOf(Field) < 0 then
      FFieldList.Add(Field);
  end;
  AssignedRec;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.GetHideNoChildNode  SetHideNoChildNode
  作者:      lifeng
  日期:      2010.08.18
  参数:      无
  返回值:    Boolean
  功能描述:  取值 设值  是否隐藏 没有从表记录的Hide
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.GetHideNoChildNode: Boolean;
begin
  Result := FHideNoChildNode;
end;

procedure TPMLinkDetailView.SetHideNoChildNode(const Value: Boolean);
begin
  FHideNoChildNode := Value;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.SetDataSet
  作者:      lifeng
  日期:      2010.08.18
  参数:      const Value: IPMDataSet; CopyData: Boolean
  返回值:    无
  功能描述:  重载 setdataset  维护字段hash表
  ------------------------------------------------------------------------------- }

procedure TPMLinkDetailView.SetDataSet(const Value: IPMDataset;
  CopyData: Boolean);
begin
  inherited;
  CreateSelfFieldHash;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMLinkDetailView.CreateSelfFieldHash
  作者:      lifeng
  日期:      2010.09.01
  参数:      无
  返回值:    无
  功能描述:   自身字段hash表 包含该View的 列关联VIEW的字段
  ------------------------------------------------------------------------------- }

procedure TPMLinkDetailView.CreateSelfFieldHash;
var
  i: Integer;
begin
  FFieldHashList.Clear;
  for i := 0 to FFieldList.Count - 1 do
    FFieldHashList.Items[FFieldList.Strings[i]] := i;
end;

procedure TPMLinkDetailView.OnDetailViewUpdate(Rec: Pointer; PmNode: IPMNode;
  RecIndex: Integer; OldValue, NewValue, FieldName: string);
var
  bFindPmNodeInList: Boolean;
  Index: Integer;
begin
  if FieldName = '' then
    Exit;
  bFindPmNodeInList := True;
  if FieldName = FMasterPrimaryField then
  begin
    if NewValue = OldValue then
      Exit;
    if PmNode <> nil then
    begin
      if PmNode.GetRec = Rec then
        bFindPmNodeInList := False;
    end;
    if bFindPmNodeInList then
    begin // 找到PMNODE
      if RecIndex < 0 then
        Index := FRecList.IndexOf(Rec)
      else
        Index := RecIndex;
      if Index < 0 then
        Exit;
      PmNode := GetPMNodeIntf(Index);
    end;
    PmNode.DetailView := nil;
    FindDetailView(PmNode);
    if FDisplayUi then
      FDataSource.RefreshRec(PmNode);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.OnDetailViewAdd
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec: Pointer; PmNode: IPMNode
  返回值:    无
  功能描述:  添加
  ------------------------------------------------------------------------------- }

procedure TPMLinkDetailView.OnDetailViewAdd(Rec: Pointer; PmNode: IPMNode);
begin
  if FMasterPrimaryField = '' then
    Exit;
  if PmNode.GetValue(FMasterPrimaryField, '') = '' then
    Exit;
  if PmNode.DetailView = nil then
    FindDetailView(PmNode);
  if FDisplayUi then
    FDataSource.RefreshRec(PmNode);
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.CheckFieldExist
  作者:      lifeng
  日期:      2010.08.18
  参数:      Field: string
  返回值:    Boolean
  功能描述:   检查字段是否为本身字段
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.CheckFieldExist(Field: string): Boolean;
begin
  Result := False;
  if Field = '' then
    Exit;
  if FFieldHashList.Exists(Field) then
    Result := True;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.AddChild
  作者:      lifeng
  日期:      2010.08.20
  参数:      PmNode: IPMNode
  返回值:    IPMNode
  功能描述:  添加行记录
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.AddChild(PmNode: IPMNode): IPMNode;
begin
  if PmNode = nil then
    Exit;
  if PmNode.GetView.GetObject = Self then
    Result := inherited AddChild(PmNode)
  else
    Result := PmNode.GetView.AddChild(PmNode);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.DeleteRow
  作者:      lifeng
  日期:      2010.08.20
  参数:      PmNode: IPMNode
  返回值:    无
  功能描述:  删除记录
  ------------------------------------------------------------------------------- }

procedure TPMLinkDetailView.DeleteRow(PmNode: IPMNode);
begin
  if PmNode = nil then
    Exit;
  if PmNode.GetView.GetObject = Self then
    inherited DeleteRow(PmNode)
  else
    PmNode.GetView.DeleteRow(PmNode);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.InsertAfter
  作者:      lifeng
  日期:      2010.08.20
  参数:      PmNode: IPMNode; Level: Integer
  返回值:    IPMNode
  功能描述:  向后插入数据
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.InsertAfter(PmNode: IPMNode; Level: Integer)
  : IPMNode;
begin
  if PmNode = nil then
    Result := inherited InsertAfter(PmNode, Level)
  else
  begin
    if PmNode.GetView.GetObject = Self then
      Result := inherited InsertAfter(PmNode, Level)
    else
      PmNode.GetView.InsertAfter(PmNode, Level);
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataLinkDetailView.InsertBefore
  作者:      lifeng
  日期:      2010.08.20
  参数:      PmNode: IPMNode; Level: Integer
  返回值:    IPMNode
  功能描述:  向前插入数据
  ------------------------------------------------------------------------------- }

function TPMLinkDetailView.InsertBefore(PmNode: IPMNode;
  Level: Integer): IPMNode;
begin
  if PmNode = nil then
    Result := inherited InsertBefore(PmNode, Level)
  else
  begin
    if PmNode.GetView.GetObject = Self then
      Result := inherited InsertBefore(PmNode, Level)
    else
      PmNode.GetView.InsertBefore(PmNode, Level);
  end;
end;

{ TPMLinkDetailNode }

constructor TPMLinkDetailNode.Create(AView: TPMDataView; Rec: Pointer);
begin
  inherited Create(AView, Rec);
  FDetailView := nil;
end;

function TPMLinkDetailNode.GetDetailLinkView: IPMDataView;
begin
  Result := FDetailView;
end;

procedure TPMLinkDetailNode.SetDetailLinkView(const Value: IPMDataView);
begin
  FDetailView := Value;
end;
{ -------------------------------------------------------------------------------
  过程名:    TPMLinkDetailNode.GetValue
  作者:      lifeng
  日期:      2010.08.18
  参数:      FieldName: string; DefaultValue: Variant
  返回值:    Variant
  功能描述:  取值，判断字段是否存在
  ------------------------------------------------------------------------------- }

function TPMLinkDetailNode.GetValue(FieldName: string;
  DefaultValue: Variant): Variant;
begin
  Result := DefaultValue;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    Result := inherited GetValue(FieldName, DefaultValue);
end;

function TPMLinkDetailNode.GetValueAsBoolean(FieldName: string;
  DefaultValue: Boolean): Boolean;
begin
  Result := DefaultValue;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    Result := inherited GetValueAsBoolean(FieldName, DefaultValue);
end;

function TPMLinkDetailNode.GetValueAsDouble(FieldName: string;
  DefaultValue: Double): Double;
begin
  Result := DefaultValue;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    Result := inherited GetValueAsDouble(FieldName, DefaultValue);
end;

function TPMLinkDetailNode.GetValueAsInt(FieldName: string;
  DefaultValue: Integer): Integer;
begin
  Result := DefaultValue;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    Result := inherited GetValueAsInt(FieldName, DefaultValue);
end;

function TPMLinkDetailNode.GetValueAsString(FieldName,
  DefaultValue: string): string;
begin
  Result := DefaultValue;
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    Result := inherited GetValueAsString(FieldName, DefaultValue);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMLinkDetailNode.SetValue
  作者:      lifeng
  日期:      2010.08.18
  参数:      value: Variant; FieldName: string
  返回值:    无
  功能描述:   设置值   判断字段是否存在
  ------------------------------------------------------------------------------- }

procedure TPMLinkDetailNode.SetValue(Value: Variant; FieldName: string);
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    inherited SetValue(Value, FieldName);
end;

procedure TPMLinkDetailNode.SetValueAsBoolean(Value: Boolean;
  FieldName: string);
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    inherited SetValueAsBoolean(Value, FieldName);
end;

procedure TPMLinkDetailNode.SetValueAsDouble(Value: Double; FieldName: string);
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    inherited SetValueAsDouble(Value, FieldName);
end;

procedure TPMLinkDetailNode.SetValueAsInt(Value: Integer; FieldName: string);
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    inherited SetValueAsInt(Value, FieldName);
end;

procedure TPMLinkDetailNode.SetValueAsString(Value, FieldName: string);
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Exit;
  if FOwenView.CheckFieldExist(FieldName) then
    inherited SetValueAsString(Value, FieldName);
end;

{ TPMDataDetailView }

constructor TPMDetailView.Create(ADataSet: IPMDataset);
begin
  inherited Create(ADataSet);
  FShowLinkDetail := False;
  FLinkRecrdAdd := False;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataDetailView.OnDataAddBefore
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec: Pointer
  返回值:    Boolean
  功能描述:  添加记录前事件 （从表的VIEW 在插入一条数据 若不 符合主表记录的条件 则不需要操作）
  ------------------------------------------------------------------------------- }

function TPMDetailView.OnDataAddBefore(Rec: Pointer): Boolean;
begin
  Result := True;
  if FAlawysAdd then
    Exit;
  if not FShowLinkDetail then // 一般从表显示界面
  begin
    if FLinkRecrdAdd then
    begin
      Result := False;
      if (FDetailField = '') or (FKeyValue = '') then
        Exit;
      if FDataSet.GetFieldValue(FDetailField, '', Rec) = FKeyValue then
        Result := True;
    end
    else
      Result := True;
  end
  else
  begin // 与主表一起显示界面的从表视图
    Result := False;
    if (FDetailField = '') or (FKeyValue = '') then
      Exit;
    if FDataSet.GetFieldValue(FDetailField, '', Rec) = FKeyValue then
      Result := True;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMDataDetailView.OnDetailViewUpdate
  作者:      lifeng
  日期:      2010.08.20
  参数:      Rec: Pointer; PmNode: IPMNode; RecIndex: Integer; OldValue, NewValue, FieldName: string
  返回值:    无
  功能描述:  从表修改值 维护
  ------------------------------------------------------------------------------- }

procedure TPMDetailView.OnDetailViewDelete;
begin
  { if (FRecList.Count = 0) and (FDisplayUi) and (FDataSource <> nil) then
    begin
    FDataSource.DispalyUI;
    if FMasterNode <> nil then
    FMasterNode.UINode := nil;
    end; }
end;

procedure TPMDetailView.OnDetailViewUpdate(Rec: Pointer; PmNode: IPMNode;
  RecIndex: Integer; OldValue, NewValue, FieldName: string);
var
  Index: Integer;
  APMNode, NewNode: IPMNode;
begin
  if FieldName = '' then
    Exit;
  if FieldName = FDetailField then
  begin
    if OldValue = NewValue then
      Exit;
    if FKeyValue <> NewValue then // 不符合条件的 从表记录 删除
    begin
      if RecIndex < 0 then
        Index := FRecList.IndexOf(Rec)
      else
        Index := RecIndex;

      if Index >= 0 then
      begin
        APMNode := GetPMNodeIntf(Index);
        if APMNode.GetRec <> Rec then
          Exit;
        if FDataSource <> nil then
          FDataSource.OnSourceDataDelete(APMNode, FDisplayUi);

        // -----维护 字段关联主键外键hash 表
        // if FForeignKey <> '' then
        // ManageHashDelete(FRecHashByForeignKey, FDataSet.GetFieldValue(FForeignKey, '', Rec));
        // if FPrimaryKey <> '' then
        // ManageHashDelete(FRecHashByPrimaryKey, FDataSet.GetFieldValue(FPrimaryKey, '', Rec));
        // -----

        // ------删除记录
        FRecList.Delete(Index);
        APMNode.RemoveParent;
        FPMNodeList.Delete(Index);
        if (FPMNodeList.Count = 0) and (FDataSource <> nil) then
        begin
          FDataSource.DispalyUI;
          if FMasterNode <> nil then
            FMasterNode.UINode := nil;
        end;
        // -----------没有记录则刷新
      end;
    end;
    if FKeyValue = NewValue then // 符合条件 添加记录
    begin
      if FRecList.IndexOf(Rec) < 0 then
      begin
        FRecList.Add(Rec);
        if FPMNodeList.Count = 0 then
          FTempNode := nil
        else
          FTempNode := IPMNode(FPMNodeList.Last);
        NewNode := ConstructorNode(Rec);
        // if FForeignKey <> '' then
        // FRecHashByForeignKey.AddObject(NewNode.GetValue(FForeignKey, ''), Pointer(NewNode));
        // if FPrimaryKey <> '' then
        // FRecHashByPrimaryKey.AddObject(NewNode.GetValue(FPrimaryKey, ''), Pointer(NewNode))
      end;

      if (FDisplayUi) and (FDataSource <> nil) then
      begin
        if not FShowLinkDetail then
          FDataSource.RefreshViews // 刷新纪录
        else
          FDataSource.RefreshRec(FMasterNode); // 刷新行记录
      end;
    end;
  end;
end;

procedure TPMDetailView.OnSourceDataInsert(PmNode, oppNode: IPMNode;
  ChangType: TPMChangType; bFrist: Boolean = False);
begin
  if PmNode = nil then
    Exit;
  if FDataSource <> nil then
    if FDisplayUi then
      FDataSource.OnSourceDataInsert(PmNode, oppNode, ChangType, bFrist);
end;

procedure TPMDetailView.SetLinkRecrdAdd(Value: Boolean);
begin
  FLinkRecrdAdd := Value;
end;

destructor TPMLinkDetailNode.Destroy;
begin
  // AppendFiledata('freeNodeLog.txt', FToken);
  inherited;
end;

procedure TPMLinkDetailNode.SetToKen(Value: string);
begin
  FToKen := Value;
end;

{ TTempRec }

{ -------------------------------------------------------------------------------
  过程名:    TTempRec.AddToList
  作者:      lifeng
  日期:      2010.10.13
  参数:      ARec: Pointer; AList: TList
  返回值:    无
  功能描述:  添加到hash表中   记录需要维护顺序
  ------------------------------------------------------------------------------- }

procedure TTempRec.AddToList(ARec: Pointer; AList: TList);
var
  i: Integer;
  NIndex, OppIndex: Integer;
  Rec: Pointer;
begin
  // PmRecList.Add(ARec);

  if PmRecList.Count = 0 then
    PmRecList.Add(ARec)
  else
  begin
    NIndex := AList.IndexOf(ARec);
    if NIndex < 0 then
      Exit;
    if NIndex = 0 then
      PmRecList.Insert(0, ARec) // 第一条
    else
    begin
      OppIndex := AList.IndexOf(PmRecList[0]);
      if OppIndex > NIndex then
        PmRecList.Insert(0, ARec)
      else
      begin
        for i := PmRecList.Count - 1 downto 0 do
        begin
          Rec := PmRecList[i];
          OppIndex := AList.IndexOf(Rec);
          if OppIndex < 0 then
            Exit;
          if OppIndex < NIndex then
          begin
            if i = PmRecList.Count - 1 then
              PmRecList.Add(ARec)
            else
              PmRecList.Insert(i + 1, ARec);
            Break;
          end;
        end;
      end;
    end;
  end;
end;

constructor TTempRec.Create;
begin
  PmRecList := TList.Create;
  bObjectInList := False;
end;

destructor TTempRec.Destroy;
var
  i: Integer;
begin
  if bObjectInList then
  begin
    for i := 0 to PmRecList.Count - 1 do
      TObject(PmRecList[i]).Free;
  end;
  PmRecList.Free;
  inherited;
end;

function TPMNode.AddChildPmNode: IPMNode;
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Result := FOwenView.InsertAfter(nil)
  else
    Result := FOwenView.AddChild(Self);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.InitialValue
  作者:      lifeng
  日期:      2010.08.26
  参数:      无
  返回值:    无
  功能描述:  初始化该记录数据
  ------------------------------------------------------------------------------- }

procedure TPMNode.InitialValue;
var
  i, iCount: Integer;
  Field: string;
  TempNotfiy: Boolean;
  Fields: TStringList;
begin
  TempNotfiy := FOwenView.FDataSet.FNotifyChanged;
  FOwenView.FDataSet.FNotifyChanged := False;
  Fields := FOwenView.GetDataSet.GetFieldList;
  iCount := Fields.Count;
  for i := 0 to iCount - 1 do
  begin
    Field := Fields.Strings[i];
    if (Field = RecordLevel) or (Field = StateField) then
      Continue;
    SetValue(null, Field);
  end;
  FOwenView.FDataSet.FNotifyChanged := TempNotfiy;
  // FOwenView.FDataSet.RefreshRec(Self, Self.FRec);
end;

function TPMNode.AddNexSibling: IPMNode;
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Result := FOwenView.InsertAfter(nil)
  else
    Result := FOwenView.InsertAfter(Self)
end;

function TPMNode.AddPrevSibling: IPMNode;
begin
  if Self = FOwenView.Root.GetSelfPointer then
    Result := FOwenView.InsertAfter(nil)
  else
    Result := FOwenView.InsertBefore(Self);
end;

function TPMNode.AddFirstChild: IPMNode;
begin
  if Self = FOwenView.Root.GetSelfPointer then
  begin
    if FChildNodeList.Count = 0 then
      Result := FOwenView.InsertAfter(nil)
    else
      Result := FOwenView.InsertBefore(GetChildNode(0));
  end
  else
  begin
    if FChildNodeList.Count = 0 then
      Result := FOwenView.AddChild(Self)
    else
      Result := FOwenView.InsertBefore(GetChildNode(0));
  end;
end;

procedure TPMNode.InternalDeleteChild(PmNode: IPMNode);
var
  Index: Integer;
begin
  if FChildNodeList = nil then
    Exit;
  if PmNode = nil then
    Exit;
  Index := FChildNodeList.IndexOf(Pointer(PmNode));
  if (Index >= 0) and (Index < FChildNodeList.Count) then
    FChildNodeList.Delete(Index);
end;

function TPMNode.GetDetailView(DetailMasterField: string;
  ADetaiData: IPMDataset): IPMDataView;
begin
  Result := FOwenView.GetDetailView(DetailMasterField, ADetaiData, Self);
end;

function TPMNode.FindFirstChildNode: IPMNode;
begin
  Result := nil;
  if FChildNodeList.Count = 0 then
    Exit;
  Result := IPMNode(FChildNodeList[0]);
end;

procedure TPMNode.SetToKen(Value: string);
begin

end;
{
  function TPMNode.GetNextNode: IPMNode;
  begin
  Result := FNextNode;
  end;

  function TPMNode.GetPrevNode: IPMNode;
  begin
  Result := FPrevNode;
  end;

  procedure TPMNode.SetNextNode(Value: IPMNode);
  begin
  if Value = nil then
  FNextNode := nil
  else
  FNextNode := TPMNode(Value.GetSelfPointer);
  end;

  procedure TPMNode.SetPrevNode(Value: IPMNode);
  begin
  if Value = nil then
  FPrevNode := nil
  else
  FPrevNode := TPMNode(Value.GetSelfPointer);
  end;
}

procedure TPMNode.MoveToChild(ADestNode: IPMNode);
begin
  if ADestNode = nil then
    Exit;
  FOwenView.MoveTo(Self, ADestNode, mmChild);
end;

procedure TPMNode.MoveToSibling(ADestNode: IPMNode);
begin
  if ADestNode = nil then
    Exit;
  if ADestNode.GetRec = FRec then
    Exit;
  FOwenView.MoveTo(Self, ADestNode, mmSibling);
end;

procedure TPMNode.MoveToNext(ADestNode: IPMNode);
begin
  if ADestNode = nil then
    Exit;
  FOwenView.MoveTo(Self, ADestNode, mmNothing);
end;

procedure TPMNode.Drop;
begin
  FOwenView.DorpLevel(Self);
end;

procedure TPMNode.Rise;
begin
  FOwenView.RiseLevel(Self);
end;

function TDataStateManger.GetDataSet: IPMDataset;
begin
  Result := FOwner;
end;

function TFieldRWBase.GetDisplayName: string;
begin
  Result := FDisplayName;
  if FDisplayName = '' then
    Result := FField.FieldName;
end;

procedure TFieldRWBase.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

procedure TFieldRWBase.SetField(const Value: TField);
begin
  FField := Value;
  FField.Visible := False;
end;

procedure TPMNode.MoveToLastChild(ADestNode: IPMNode);
var
  DestNode: IPMNode;
begin
  if ADestNode = nil then
    Exit;
  if ADestNode.Count = 0 then
  begin
    DestNode := ADestNode;
    FOwenView.MoveTo(Self, DestNode, mmChild);
  end
  else
  begin
    DestNode := ADestNode.FindLastChildNode;
    FOwenView.MoveTo(Self, DestNode, mmSibling);
  end;
end;

procedure TPMLinkView.SetDisplayUi(const Value: Boolean);
var
  i: Integer;
begin
  inherited;
  FDisplayUi := Value;
  for i := 0 to FLinkedViewList.Count - 1 do
    IPMDataView(FLinkedViewList[i]).SetDisplayUi(Value);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.GetNext
  作者:      lifeng
  日期:      2011.02.23
  参数:      无
  返回值:    IPMNode
  功能描述:  取下一个节点
  ------------------------------------------------------------------------------- }

function TPMNode.GetNext: IPMNode;
var
  Index: Integer;
begin
  Result := nil;
  if Self = FOwenView.FRoot.GetSelfPointer then
  begin
    if FOwenView.GetRecCount > 0 then
      Result := IPMNode(FOwenView.FPMNodeList[0]);
    Exit;
  end;
  index := FOwenView.FRecList.IndexOf(FRec);
  if (index < 0) or (index >= FOwenView.FRecList.Count - 1) then
    Exit;
  Result := FOwenView.GetPMNodeIntf(index + 1);
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMNode.GetPrev
  作者:      lifeng
  日期:      2011.02.23
  参数:      无
  返回值:    IPMNode
  功能描述:  取上一个节点
  ------------------------------------------------------------------------------- }

function TPMNode.GetPrev: IPMNode;
var
  Index: Integer;
begin
  Result := nil;
  index := FOwenView.FRecList.IndexOf(FRec);
  if (index <= 0) then
    Exit;
  Result := FOwenView.GetPMNodeIntf(index - 1);

end;

procedure TPMLinkDetailView.RefreshViewsUi(bReBuild: Boolean = False);
var
  i: Integer;
  PmNode: IPMNode;
begin
  for i := 0 to FPMNodeList.Count - 1 do
  begin
    PmNode := IPMNode(FPMNodeList[i]);
    if PmNode.DetailView <> nil then
    begin
      if PmNode.DetailView.DataSource <> nil then
        TBaseDataSource(PmNode.DetailView.DataSource)
          .SetBeginUpdateStatus(False);
      PmNode.DetailView.Filter := False;
      PmNode.DetailView.Filter := True;
      if PmNode.DetailView.DataSource <> nil then
        TBaseDataSource(PmNode.DetailView.DataSource)
          .SetBeginUpdateStatus(True);
    end;
  end;
  inherited;
end;

{ TRecordMove }

procedure TRecordMove.ReDo(AData: TPMDataSet);
begin
  inherited;
  FOppRec := AData.InternalMoveSigleRec(Rec, FOppRec);
end;

procedure TRecordMove.UnDo(AData: TPMDataSet);
begin
  inherited;
  FOppRec := AData.InternalMoveSigleRec(Rec, FOppRec);
end;

procedure TPMLinkView.DisConnect;
begin
  inherited DisConnect;
  FDataSet := nil;
  FToLinkView.Clear;
  FField_LinkField.Clear;
  FField_LinkObject.Clear;
  FLinkedViewList.Clear;
  // FRecHashByPrimaryKey.Clear;
  // FRecHashByForeignKey.Clear;
end;

function TPMNode.IsChildNode(ANode: IPMNode): Boolean;
begin
  Result := False;
  if ANode.Level <= Self.Level then
    Exit;
  while True do
  begin
    if ANode.ParentNode.GetSelfPointer = Self then
      Result := True;
    if Result then
      Exit;
    ANode := ANode.ParentNode;
    if (ANode = nil) or (ANode.ParentNode = nil) then
      Exit;
  end;
end;

{ -------------------------------------------------------------------------------
  过程名:    TPMLinkView.RefreshViews
  作者:      lifeng
  日期:      2011.04.20
  参数:      无
  返回值:    无
  功能描述:  刷新视图
  ------------------------------------------------------------------------------- }

procedure TPMLinkView.RefreshViews;
begin
  inherited RefreshViews;
end;

{ TPmExtractDataView }

function TPmExtractDataView.ConstructorNode(Rec: Pointer;
  Index: Integer): IPMNode;
begin
  Result := inherited ConstructorNode(Rec, Index);
  TPmRec(Rec).TempNode := Pointer(Result);
end;

function TPmExtractDataView.ExtractPmNode(ARec: Pointer): IPMNode;
begin
  Result := nil;
  if ARec = nil then
    Exit;
  if TPmRec(ARec).TempNode = nil then
    Exit;
  Result := IPMNode(TPmRec(ARec).TempNode);
end;

procedure TPMNode.SetFoce;
begin
  if (FOwenView <> nil) and (FOwenView.FDataSource <> nil) then
    FOwenView.FDataSource.SetFocusAndVisble(Self);
end;

procedure TPMNode.Refresh;
begin
  TPMDataSet(FOwenView.GetDataSet.GetObject).RefreshRec(Self, Self.GetRec)
  // FOwenView.RefreshRec(Self);
end;

{ TFieldMgr_Dic }

procedure TStrIntHashMgr_Dic.AddObject(AKey: string; AObject: TObject);
begin
  if FList.ContainsKey(AKey) then
    Exit;
  FList.Add(AKey, AObject);
end;

constructor TStrIntHashMgr_Dic.Create;
begin
  FList := TDictionary<string, TObject>.Create;
end;

destructor TStrIntHashMgr_Dic.Destroy;
begin
  FreeObject;
  FreeAndNil(FList);
  inherited;
end;

function TStrIntHashMgr_Dic.Exist(AKey: string): Boolean;
begin
  Result := FList.ContainsKey(AKey);
end;

procedure TStrIntHashMgr_Dic.FreeObject;
begin
  with FList.GetEnumerator do
  try
    while MoveNext do
    begin
      if Assigned(Current.Value) then
        TObject(Current.Value).Free;
    end;
  finally
    Free;
  end;
end;

function TStrIntHashMgr_Dic.GetObject(AKey: string): TObject;
begin
  Result := nil;
  if not FList.ContainsKey(AKey) then
    Exit;
  Result := FList.Items[AKey];
end;

procedure TStrIntHashMgr_Dic.Remove(AKey: string);
begin
  if FList.ContainsKey(AKey) then
    FList.Items[AKey].Free;
  FList.Remove(AKey);
end;

{ TIntHashMgr_Dic }

procedure TIntHashMgr_Dic.AddObject(AKey: string; AObject: TObject);
begin
  if FList.ContainsKey(StrToIntDef(AKey, -1)) then
    Exit;
  FList.Add(StrToIntDef(AKey, -1), AObject);
end;

constructor TIntHashMgr_Dic.Create;
begin
  FList := TDictionary<Integer, TObject>.Create;
end;

destructor TIntHashMgr_Dic.Destroy;
begin
  FreeObject;
  FreeAndNil(FList);
  inherited;
end;

function TIntHashMgr_Dic.Exist(AKey: string): Boolean;
begin
  Result := FList.ContainsKey(StrToIntDef(AKey, -1));
end;

procedure TIntHashMgr_Dic.FreeObject;
begin
  with FList.GetEnumerator do
  try
    while MoveNext do
    begin
      if Assigned(Current.Value) then
        TObject(Current.Value).Free;
    end;
  finally
    Free;
  end;
end;

function TIntHashMgr_Dic.GetObject(AKey: string): TObject;
begin
  Result := nil;
  if not FList.ContainsKey(StrToIntDef(AKey, -1)) then
    Exit;
  Result := FList.Items[StrToIntDef(AKey, -1)];
end;

procedure TIntHashMgr_Dic.Remove(AKey: string);
begin
  if FList.ContainsKey(StrToIntDef(AKey, -1)) then
    FList.Items[StrToIntDef(AKey, -1)].Free;
  FList.Remove(StrToIntDef(AKey, -1));
end;

{ TMemFieldRW_Wide }

function TMemFieldRW_Wide.Read(PmRec: TPmRec; DefaultValue: Variant; RecIndex:
  Integer): Variant;
begin
  Result := ReadAsString(PmRec, VarToStrDef(DefaultValue, ''));
end;

function TMemFieldRW_Wide.ReadAsString(PmRec: TPmRec; DefaultValue: string):
  string;
var
  str_ansi: TMemBlobData;
begin
  Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := DefaultValue;
  if PmRec = nil then
    Exit;
  str_ansi := DataSet.GetBlobData(PmRec.BlobRec, FOffSet);
//  Result := dxAnsiStringToString(str_ansi, CP_UTF8);
  Result := UTF8Decode(str_ansi)
end;

function TMemFieldRW_Wide.write(Value: Variant; PmRec: TPmRec; bNull: Boolean;
  RecIndex: Integer = -1): TPmRec;
var
  str: string;
  str_ansi: TMemBlobData;
begin
   Assert(PmRec.Owen = Pointer(FDataSet), '记录指针与数据集不匹配！');
  Result := PmRec;
  if PmRec = nil then
    Exit;
  if bNull then
    Value := '';
  str := VarToStrDef(Value, '');
  str_ansi := UTF8Encode(str);
  DataSet.SetInternalBlobData(PmRec.BlobRec, FOffSet, str_ansi);
end;

end.
