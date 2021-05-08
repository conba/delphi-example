{*******************************************************}
{                                                       }
{ PMSS5.0                                               }
{ Author:李锋                                           }
{ 时间:2010                                             }
{ 功能描述:pmDataSet,pmDataView接口定义单元             }
{ 版权所有 (C) 2010 PmSoft                              }
{*******************************************************}
unit uPMDataIntf;

interface
uses
  Classes, DB, Hashes2, uPMTreeListIntf, uPMDataConst;
type
  IPMDataView = interface;
  IPMDataset = interface;
  IPMNode = interface;
  IDataState = interface;

  TCopyRecAfter = procedure(AView: IPMDataView; PmNode: IPMNode) of object;
  TCopyRecBefor = function(AView: IPMDataView; PmNode: IPMNode): Boolean of object;
  TOnBeforeSet = procedure(AView: IPMDataView; ATree: IPMTreeList; ANode: Pointer; ACloumn: IPMTreeListColumn;
    NewValue, OldValue: string; bEnter: Boolean; var Accept: Boolean) of object;
  TOnAfterSet = procedure(AView: IPMDataView; ATree: IPMTreeList; ANode: Pointer; ACloumn: IPMTreeListColumn;
    NewValue, OldValue: string; var Accept: Boolean) of object;
  TPMFilterRecordEvent = procedure(ADataSet: IPMDataset; Index: Integer;
    var Accept: Boolean) of object;
  TOnAfterUnReDo = procedure(ADataSet: IPMDataset) of object;
  TOnAfterMasterScroll = procedure(ARec: Pointer; AData: IPmDataSet) of object;
  TNotifyAfterLoadStruct = function(ADataSet: IPMDataset): Boolean of object;

  TOnFieldValueChanged = procedure(ARec: Pointer; AData: IPmDataSet;
    AOldValue, ANewValue, AFieldName: string) of object;

  IPMDataset = interface
    ['{9D7BD35D-0F9D-41E1-AFD3-27212FD25A7B}']
    //取表名
    function GetTableName: string;
    //设置表名
    procedure SetTableName(const Value: string);
    //取表表量
    function GetTableVariable: string;
    //设置变量
    procedure SetTableVariable(const Value: string);
    //取显示名称
    function GetUserName: string;
     //设置显示名称
    procedure SetUserName(const Value: string);
    function GetAttributesAsString: string;
    //通过KEY 取表的属性
    function GetAttribute(Key: string): string;
     //通过KEY 取表的字符串属性
    function GetAttAsString(Key: string): string;
    //删除属性
    procedure DeleteAtt(Key: string);

    function GetAttAsBoolean(Key: string): Boolean;
    function GetAttAsInteger(Key: string): Integer;
    //设置表属性 key value形式
    procedure SetAttribute(Value: Variant; Key: string); overload;
    function IsExitsAtt(Key: string): Boolean;

    procedure SetAttribute(Key: string; AObject: TObject); overload;
    //读取，设置 对象类型属性
    function GetObjectAttribute(Key: string): TObject;

    procedure SetAttribute(Key: string; AIntf: IUnknown); overload;
    //读取设置 接口类型属性
    function GetInfAttribute(Key: string): IUnknown;
   //设置读取 字段对应显示名称
    function GetDisplayName(FieldName: string): string;
    procedure SetDisplayName(DisplayName, FieldName: string);
    //设置字段显示
    procedure SetFieldVisible(FieldName: string; Value: Boolean);
    function GetFieldVisible(FieldName: string): Boolean;
     //记录列表
    function GetRecList: TList;
     //取字段值
    function GetFieldValue(FieldName: string; DValue: Variant; Rec: Pointer): Variant; overload;
    //取字段值
    function GetFieldValue(FieldName: string; DValue: Variant; RecIndex: Integer): Variant; overload;

    function GetFieldValueAsDouble(FieldName: string; DValue: Double;
      Rec: Pointer): Double; overload;
    function GetFieldValueAsDouble(FieldIndex: Integer; DValue: Double;
      Rec: Pointer): Double; overload;
    function GetFieldValueAsInt(FieldName: string; DValue: Integer; Rec: Pointer): Integer;
    function GetFieldValueAsBoolean(FieldName: string; DValue: Boolean; Rec: Pointer): Boolean;
    function GetFieldValueAsString(FieldName: string; DValue: string; Rec: Pointer): string;
    procedure FastSetFieldValue(FieldName: string; Value: Variant; Rec: Pointer);
    function SetFieldValue(FieldName: string; Value: Variant; Rec: Pointer; PmNode: IPMNode = nil): Boolean; overload;
    //设置字段值
    function SetFieldValue(FieldName: string; Value: Variant; RecIndex: Integer; PmNode: IPMNode = nil): Boolean; overload;
    //设置字段值
    procedure SetFieldValueAsDouble(FieldName: string; Value: Double; Rec: Pointer; PmNode: IPMNode = nil);

    //添加字段
    procedure AddField(FieldName: string; AType: TPMFieldType; Caption: string = '');
    //往后插入记录 rec=nil的情况下自动最后添加    若数据集有层次 插入数据时必须提供level值
    function InsertAfter(Rec: Pointer; Level: Integer = 0): Pointer;
     //往前插入记录 rec=nil的情况下自动最后添加     若数据集有层次 插入数据时必须提供level值
    function InsertBefore(Rec: Pointer; Level: Integer = 0): Pointer;
    //添加记录列表
    procedure AddRecordData(ASourceData: IPMDataset; ARecList: TList);
    //删除指定记录   bFreeRec为true时 释放内存 false时不释放内存 （在需要记录state时 不释放内存）
    procedure DeleteRow(Rec: Pointer; bFreeRec: Boolean = True);
    //删除所有记录
    procedure DeleteAllRec;
    //删除所有索引
    procedure DeleteAllIndex;
    //清除数据集的记录和字段 不释放数据集
    procedure Clear;
    //判断记录的某个字段是否有值
    function HasValue(FieldName: string; Rec: Pointer): Boolean;
    //判断数据集是否变动过
    function CheckDataHasChanged: Boolean;
    //设置数据集 变动状态
    procedure SetDataChangeStatus(Value: Boolean);
    //设置通知视图状态 true通知 false不通知
    procedure SetNotifyChanged(Value: Boolean);

    procedure SetNotifyChangeEvent(Value: Boolean);
    //设置记录 state 状态 true记录 false 不记录
    procedure SetMarkState(const Value: Boolean);
    //取 state状态
    function GetMarkState: Boolean;
     //设置 撤销和前进后的响应事件
    procedure SetOnAfterUnReDo(Value: TOnAfterUnReDo);
    //开始记录撤销列表
    procedure BeginState;
    //结束记录一次撤销
    procedure EndState;
    //通过index获取指定记录指针
    function GetCurrentRec(RecIndex: Integer = -1): Pointer;
    //取记录条数
    function GetRecordCount: Integer;
    //取字段列表
    function GetFieldList: TStringList;
    //取字段类型
    function GetFieldTypeByName(FieldName: string): TPMFieldType;
    //取state列表
    function GetDataState: TInterfaceList;
    //从数据流中加载表属性
    procedure LoadAttribute(Stream: TStream);
    //保存表属性到数据流中
    function LoadStructure(Stream: TStream): Boolean;
    //保存表属性到数据流中
    function SaveAttributeToStream(Stream: TStream): Integer;
    //保存数据集到数据流中
    function SaveStream(Stream: TStream): Boolean;
    //从数据流中加载表
    function LoadStream(Stream: TStream): Boolean;
    //从数据流中加载索引
    procedure LoadRecIndex(Stream: TStream);
    //保存数据到文件中
    procedure SaveDataToFile(FileName: string);
    //从文件中加载数据
    procedure LoadDataFromFile(FileName: string);
    //保存数据集到text格式文件
    procedure SaveToTextFile(FileName: string);
    //保存文件到XML格式
    procedure SaveViewToXML(FileName: string; AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string);
    //取文件XMl格式源
    function GetViewToXmlSource(AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string): string;
    //从text文件中加载表
    procedure LoadFromTextFile(FileName: string);
    //保存数据集到自定义文件
    procedure SaveToCustomFile(FileName: string; cMark: char);
     //从自定义文件中加载表
    procedure LoadFromCustomFile(FileName: string; cMark: char);
   //设置字段生成方式
    procedure SetFieTypeByImport(Value: TFieldTypeByImport);
     //设置主从字段 id=id 样式
    procedure SetDetailMaster(Value: string);
     //取从表字段值
    function GetDetailField: string;
    //取主从字段值
    function GetDetailMaster: string;
    //取适应PM数据集主从模式的 主表字段
    function GetPmMasterField: string;
    //设置主表字段
    procedure SetMasterField(Value: string);
    //获取主表字段
    function GetMasterField: string;
    //设置ADO模式下的 主表datasource
    procedure SetMasterDataSource(ASource: TDataSource);
     //设置ADO模式下的 主表 dataset
    procedure SetMasterDataSet(ADataSet: TDataSet);
    //获取ADO模式下的 主表 datasetsource
    function GetMasterDataSource: TDataSource;
    //获取从表dataview PM模式   DetailMasterField（id=id样式）  ADetaiData从表数据集  Rec主表当前记录buffer
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet; Rec: Pointer): IPMDataView;
      //创建 此数据集的 视图
    function CreateView(AViewType: TPMViewType = tDefault): IPMDataView;
      //获取已经存在的 没有过滤的视图
    function GetExitView(bCreate: Boolean = True; AViewType: TPMViewType = tDefault): IPMDataView;
     //获取 父级对象dataset
    function GetInstance: TDataSet;
     //获取对象指针
    function GetObject: Pointer;
   //获取数据集是否情况状态 true清空 false不清空
    function GetDataEmptyStatus: Boolean;
    //通过字段和字段值定位到某条记录
    function GetRecByFieldValue(FieldName: string; Value: Variant; BeginCurRec: Boolean = False): Pointer;

    function GetRecByFieldValues(AFields: array of string; AValues: array of string): Pointer;

//    function FindRecByIndexFromStream(FieldName, Value: string): Pointer;
    //通过索引取记录， 在不加载数据 只加载 索引的情况下使用
//    procedure FindRecListByIndexFromStream(FieldName, Value: string; ARecList: TList);
     //通过索引取记录， 在不加载数据 只加载 索引的情况下使用

    //快速查找记录
    function FindRec(FieldName, Value: string; bCreateIndex: Boolean = True): Pointer; overload;
    function FindRec(FieldName: string; Value: Integer): Pointer; overload;
    procedure FindRecList(FieldName: string; Value: Integer; var RecList: TList); overload;
    procedure FindRecList(FieldName, Value: string; var RecList: TList; bCreateIndex: Boolean = True); overload;
//    function FindRecByEF(FieldName: string; Value: Integer): Pointer;
    // 二分法查找记录
//    function FindRecListByEF(FieldName: string; Value: Integer; ARecList: TList): Pointer;
    // 二分法查找记录

//    procedure SetIndexInSream(FieldName: string);
    // 设置 序列化时 需要建索引的字读

    //设置数据集索引字段
    procedure SetIndex(FieldName: string; AHashMode: TPMRECHashMod = phNone; bReSet: Boolean = False);
     //删除索引字段
    procedure DeleteIndex(FieldName: string; bDelete: Boolean = True);
    //是否有该字段
    function CheckFieldExit(Field: string): Boolean;
    //取 是否有层次
    function GetLevelStatus: Boolean;
    //设置字段hash的模式
//    procedure SetHashMod(AValue: TPMRECHashMod);
    //创建新的数据集，（与本身无任何联系）
//    function CreateNewDataSet: IPMDataset;
    //克隆数据集
    procedure CloneData(ASource: IPMDataset; bCloneField: Boolean = True);
    //拷贝数据集的字段和 记录
    procedure CopyData(ASource: IPMDataset);
    //克隆数据集 自管理数据集
    function Clone: IPMDataset;
      //设置 正在操作的视图对象 （设置过该值后， 值对该视图进行通知更新）
    procedure SetChangedView(P: Pointer);
    //关闭视图 刷新界面
    procedure CloseAllViewDisplayUi;
    //开始视图刷新界面
    procedure OpenAllViewDisplayUi;
    //刷新界面
    procedure RefreshViewsUI;
    //重新构成所有视图树状
    procedure ReConstructTree;

    procedure RefreshViews;
    procedure RefreshField(AFieldName: string);
    //数据集加载数据结构结束后的通知事件
    procedure SetNotifyAfterLoadStruct(AEvent: TNotifyAfterLoadStruct);
    //交换位置
    procedure Exchanger(index1, Index2: Integer);
   //拷贝数据记录
    procedure InternalCopyData(ASource, ADest: Pointer); overload;
    procedure InternalCopyData(ASource, ADest: Pointer; ExceptField: array of string); overload;

    //字段最大值
    procedure SetMaxValueFile(AField: string);
    function MaxValue: Integer;
     //视图显示界面状态
    function GetDisplayUiStatus: Boolean;
     //提交所有绑定该数据集的数控件编辑框
    procedure PostAllViewEdit;

//    procedure SetSortField(AField: string; ComparType: TPmComparerType);
//     排序
   //排序
    procedure SetSortField(AField: string; ComparType: TPmComparerType);

    procedure BeginUpdataUi;
    procedure EndUpdataui;
    procedure InitRWCount;
    function GetRwCount: string;

    function GetViewByKeyValue(AKey, Value: string): IPMDataView;
    function GetViewCount: Integer;
    // 字段修改事件
    procedure SetOnFieldValueChanged(AEvent: TOnFieldValueChanged);
    procedure SetNotifyFieldValueChangedStatus(AValue: Boolean);

    property TableName: string read GetTableName write SetTableName;
    property Variable: string read GetTableVariable write SetTableVariable;
    property UserName: string read GetUserName write SetUserName;
    property MarkState: Boolean read GetMarkState write SetMarkState;
    property Level: Boolean read GetLevelStatus;
  end;

  IPMDataView = interface
    ['{2CF2EE52-F631-4607-8C37-12A3C8536B97}']
    //取表名
    function GetTableName: string;
    //保存视图数据到文件中
    procedure SaveViewToFile(FileName: string);
    //保存视图数据到XML文件中
    procedure SaveViewToXml(FileName: string);
    //取属性值
    function GetAttribute(Key: string): string;
    //设置属性值
    procedure SetAttribute(Value, Key: string);
    //记录列表
    function GetRecList: TList;
     //设置字段值
    function GetFieldValue(FieldName: string; DValue: Variant; PmNode: IPMNode): Variant;
    //取字段值
    function SetFieldValue(FieldName: string; Value: Variant; PmNode: IPMNode): Boolean;
     //删除指定记录
    procedure DeleteRow(PmNode: IPMNode);
    //删除所有记录
    procedure DeleteAll;
    //往后插入记录 PmNode=nil的情况下自动最后添加    若数据集有层次 插入数据时必须提供level值
    function InsertAfter(PmNode: IPMNode; Level: Integer = 0): IPMNode;
    //添加子节点
    function AddChild(PmNode: IPMNode): IPMNode;
     //往前插入记录 PmNode=nil的情况下自动最后添加     若数据集有层次 插入数据时必须提供level值
    function InsertBefore(PmNode: IPMNode; Level: Integer = 0): IPMNode;
    //刷新界面
    procedure RefreshViews;

    procedure RefreshField(AFieldName: string);
    //刷新单条记录
    procedure RefreshRec(PmNode: IPMNode);
    //视图清理数据
    procedure Clear;
    //设置自身 发起变更
    procedure SetChangedView;
    //是否记录state
    procedure SetMarkState(Value: Boolean);
     //取state状态 true 时 state激活
    function GetMarkState: Boolean;
     //判断 数据集有无层次关系
    function CheckLevel: Boolean;
     //排序 （ 在取 从表时用到）
    procedure SortByRecIndex;
    //设置过滤响应事件
    procedure SetOnFilter(OnFilter: TPMFilterRecordEvent);
     //通过KEY VALUE 过滤视图
    procedure FilterByKeyValue(Keys, Values: array of string);
    //开始记录state
    procedure BeginState;
    //结束记录state
    procedure EndState;
    //开始刷新界面
    procedure BeginUpdateUi;
    //结束刷新界面
    procedure EndUpdateUi;
    //取该视图中的记录条数
    function GetRecCount: Integer;
    //取视图对象指针
    function GetObject: Pointer;
     //取视图状态
    function GetState: TViewStatus;
    //设置绑定的 pmdatasource
    procedure SetDataSource(ASource: Pointer);
    //取字段列表
    function GetFieldList: TStringList;
    //取数据集
    function GetDataSet: IPMDataset;
     //取 state列表
    function GetDataState: TInterfaceList;
    /// <summary>
    /// 获取当前数据集AMainNode关联的从表数据集
    /// </summary>
    /// <param name="DetailMasterField">从表、主表匹配关键字</param>
    /// <param name="ADetaiData">从表数据</param>
    /// <param name="AMainNode">获取从表数据的主记录</param>
    /// <returns>从表数据集</returns>
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet;
      AMainNode: IPMNode): IPMDataView; overload;
    /// <summary>
    /// 获取当前数据集AMainRec关联的从表数据集
    /// </summary>
    /// <param name="DetailMasterField">从表、主表匹配关键字</param>
    /// <param name="ADetaiData">从表数据</param>
    /// <param name="AMainRec">获取从表数据的主记录</param>
    /// <returns>从表数据集</returns>
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet;
      AMainRec: Pointer): IPMDataView; overload;
   {DetailMasterField:string  主从字段关系 例：cid=zid}

    //设置是否构建pmnode的 树状结构 true为构建 false不构建 默认true
    procedure SetStructTree(Value: Boolean);

    //一次性构建 pmNode的层次关系
    procedure ReConstructTree;
    procedure StructNodeTree;
   //获取PMNode对象列表
    function GetPMNodeList: TInterfaceList;
    //获取pmnode对象指针
    function GetPMNodeIntf(Index: Integer): IPMNode;
    // 根节点
    function Root: IPMNode;
    //设置相应 设置值前事件
    procedure SetOnbeforeSet(Value: TOnBeforeSet);
    //设置相应 设置值后事件
    procedure SetOnAfterSet(Value: TOnAfterSet);
    //取OnBeforeSet事件
    function GetOnBeforeSet: TOnBeforeSet;
    //取  OnAfterSet事件
    function GetOnAfterSet: TOnAfterSet;
    //清空视图的引用关系
    procedure ClearRef;
    //取刷到界面上的NODE指针
    function GetUiNode(APMNode: IPMNode): Pointer;
    //通过字段和字段值定位到某条记录
    function GetRecByFieldValue(FieldName: string; Value: Variant; BeginCurRec: Boolean = False): IPMNode;
    //通过 字段=value 查找记录  akeyvaluelist(key=value key=value)
    function FindPmNode(AKeyValueList: TStringList): IPMNode; overload;
    //查找记录 [key,value,key,value] 样式参数
    function FindPmNode(Conditions: array of string): IPMNode; overload;

    function FindPmNode(AKey, AValue: string): IPMNode; overload;
    //查找记录 列表
    procedure FindRecList(FieldName, Value: string; var RecList: TList; bCreateIndex: Boolean = True); overload;
    //查找记录 列表 返回的是pmnode
    procedure FindRecList(FieldName, Value: string; var RecList: TInterfaceList; bCreateIndex: Boolean = True); overload;
    //设置dataset
    procedure SetDataSet(const Value: IPMDataSet; CopyData: Boolean = True);
   //复制数据
    procedure CopyRecData(ASourceNode: IPMNode; ADestNode: IPMNode); overload;
    procedure CopyRecData(ASourceNode: IPMNode; ADestNode: IPMNode; ExceptField: array of string); overload;
     //复制view数据
    procedure CopyFromDataView(ASourceView: IPMDataView; CopyRecBefore: TCopyRecBefor; CopyRecAfter: TCopyRecAfter);
    //外部手动添加 撤销列表
    procedure ADDStateList(AState: IDataState);
     //移动
    procedure Move(PmNode: IPMNode; AMoveMode: TMoveMode);
    //夸层次 单记录移动
    procedure MoveCross(PmNode: IPMNode; AMoveMode: TMoveMode);
    //移动指定记录
    function MoveTo(ASourceNode, ADestNode: IPMNode; AMoveMod: TMoveMode): Boolean;
     //交换记录
    procedure Exchanger(Index1, Index2: Integer);
    // 升级
    procedure RiseLevel(APMNode: IPMNode);
    //降级
    procedure DorpLevel(APMNode: IPMNode);
    //单个Node的降级
    procedure DropSingle(APMNode: IPMNode);

    procedure SetDeleteChild(Value: Boolean);
    function GetDeleteChild: Boolean;
    function GetFilterStatus: Boolean;
    procedure SetFilterStatus(Value: Boolean);
    //检查字段是否存在
    function CheckFieldExist(Field: string): Boolean;
     //设置 排序字段
    procedure SetSortedField(value: string);
    //取排序字段
    function GetSortedField: string;
    // 设置排序类型
    procedure SetSortOptions(Value: TPMSortOptions);
    //取排序类型
    function GetSortOptions: TPMSortOptions;


    function GetToken: string;
    procedure SetToKen(const Value: string);

    //设置是否显示 界面
    procedure SetDisplayUi(const Value: Boolean);
    function GetDisplayUi: Boolean;
    //通过记录指针取pmnode
    function GetPmNodeByRec(ARec: Pointer): IPMNode;
    //通过指针取PMNODE   (与前一个无区别)
    function GetPmNode(ARec: Pointer): IPMNode;

    procedure SetPmLibDataSet(APmLibDataSet: IPMDataset);

      //刷新界面
    procedure RefreshViewsUI(bReBuild: Boolean = False);

    //----------------------关联字段处理函数
    //根据字段名查找属于自己的真正的VIEW  在关联VIEW时使用
    function FindLinkView(FieldName: string; var AView: IPMDataView): Boolean;
    //设置关联字段
    procedure SetLinkField(AFieldName, ALinkFieldName: string; ALinkView: IPMDataView);
    {FieldName:自身字段，LinkFieldName：关联数据集的字段，ALinkView：关联数据集的View}


     //设置主键  当该数据集被别的数据集引用时  即被关联时  设置该字段
    procedure SetPrimaryKey(AFieldName: string);
     //取 主键
    function GetPrimaryKey: string;
    //设置外键 当该数据集需要关联其他数据集时设置该字段 用于定位记录
    procedure SetForeignKey(AFieldName: string);
    //取外键值
    function GetForeignKey: string;
     //通过主键的值 定位到记录   （被关联的View使用）
    function GetLinkRec(Value: string): Pointer;
     //通过 外键定位到记录 (关联的view使用)
    function GetForeigLinkRec(Value: string): IPMNode;
    //取字段hash
    function GetFieldHash: TStringHash;


    //----------------------从表关联处理函数
     //设置 主表主键
    procedure SetMasterPrimaryField(const Value: string);
     //取   主表主键 字段
    function GetMasterPrimaryField: string;
    //设置从表 主键字段
    procedure setDetailPrimaryField(const Value: string);
    //取   从表 主键
    function GetDetailPrimaryField: string;
    //是否隐藏无从表记录 的记录
    function GetHideNoChildNode: Boolean;

    procedure SetHideNoChildNode(const Value: Boolean);
     //从表添加记录 是否判断主键值
    procedure SetLinkRecrdAdd(Value: Boolean);
    //设置从表视图    这里的view 必须为 TPMLINKDETAILVIEW
    procedure SetDetailView(AView: IPMDataView);

    //-----------------------------------------
    procedure SetTag(const ATag: Integer);
    function GetTag: Integer;

    function GetPmDataSource: Pointer;
    property DeleteChild: Boolean read GetDeleteChild write SetDeleteChild;
    property PrimaryKey: string read GetPrimaryKey write SetPrimaryKey; //主键
    property ForeignKey: string read GetForeignKey write SetForeignKey; //外键
    property MarkState: Boolean read GetMarkState write SetMarkState; //记录状态
    property PMNodeList[Index: Integer]: IPMNode read GetPMNodeIntf; //pmnode
    property OnbeforeSet: TOnBeforeSet read GetOnBeforeSet write SetOnbeforeSet;
    property OnAfterSet: TOnAfterSet read GetOnAfterSet write SetOnAfterSet;
    property Filter: Boolean read GetFilterStatus write SetFilterStatus; //过滤
    property MasterPrimaryField: string read GetMasterPrimaryField write SetMasterPrimaryField; //主表主键
    property DetailPrimaryField: string read GetDetailPrimaryField write setDetailPrimaryField; //从表主键
    property HideNoChildNode: Boolean read GetHideNoChildNode write SetHideNoChildNode;
    property Token: string read GetToken write SetToKen;
    property SortField: string read GetSortedField write SetSortedField;
    property SortOpations: TPMSortOptions read GetSortOptions write SetSortOptions;
    property PmLibDataSet: IPMDataset write SetPmLibDataSet;
    property DataSource: Pointer read GetPmDataSource;
    property Tag: Integer read GetTag write SetTag;
  end;

  IExtractDataView = interface(IPMDataView)
    ['{B1E0C5BB-67BE-4086-BFC1-5C43D69269B2}']
    function ExtractPmNode(ARec: Pointer): IPmNode;
  end;

  IDataState = interface
    ['{22818851-8C2B-4DE7-B582-4A515D585AEF}']
    procedure UnDo;
    procedure ReDo;
    function GetState: TPMStateStatus;
    function GetDataSet: IPMDataset;
    function IsHaveMoveStats: Boolean;
  end;

  IPMNode = interface
    ['{395CA036-70D5-4E84-ACF5-7C6474964B90}']
     //设置与该NODE 绑定的数据集REC
    procedure SetRec(ARec: Pointer);
     //获取REC
    function GetRec: Pointer;
     //取父级NODE
    function GetParentNode: IPMNode;
     //取上一个同级Node
    function GetPrevSibling: IPMNode;
     //取下一个同级Node
    function GetNextSibling: IPMNode;
     //设置父级
    procedure SetParentNode(Value: IPMNode);
     //取子NODE列表
    function GetChildNodeList: TList;
     //添加子记录
    function AddChildPmNode: IPMNode;
    //添加第一个子记录
    function AddFirstChild: IPMNode;
    //添加下一个同级记录
    function AddNexSibling: IPMNode;
     //添加上一个同级记录
    function AddPrevSibling: IPMNode;
     //设值
    procedure SetValue(value: Variant; FieldName: string);

    procedure SetValueAsDouble(Value: Double; FieldName: string);
    procedure SetValueAsString(Value: string; FieldName: string);
    procedure SetValueAsInt(Value: Integer; FieldName: string);
    procedure SetValueAsBoolean(Value: Boolean; FieldName: string);
    //取值
    function GetValue(FieldName: string; DefaultValue: Variant): Variant;
    function GetValueAsString(FieldName: string; DefaultValue: string): string;
    function GetValueAsInt(FieldName: string; DefaultValue: Integer): Integer;
    function GetValueAsDouble(FieldName: string; DefaultValue: Double): Double;
    function GetValueAsBoolean(FieldName: string; DefaultValue: Boolean): Boolean;

    function GetView: IPMDataView;

    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet): IPMDataView;
    //取层次
    function GetLevel: Integer;
    //设置层次
    procedure SetLevel(Value: Integer);
    //取子NODE记录数
    function GetChildCount: Integer;
      //取子节点
    function GetChildNode(Index: Integer): IPMNode;
     //取界面NODE
    function GetUINode: Pointer;
    //设置界面NODE
    procedure SetNode(Value: Pointer);
    //找到最后一个子节点
    function FindLastChildNode: IPMNode;
    //找到第一个子节点
    function FindFirstChildNode: IPMNode;
    //找到 该级别下的层次最小最后的子节点
    function GetChildLastestNode: IPMNode;
    //删除该节点下的所有记录
    procedure DeleteAll;
    //删除自身在 父级节点中的 记录
    procedure RemoveParent;
    //删除子记录
    procedure DeleteChild;

    function GetSelfPointer: Pointer;
    //设置删除状态
    procedure SetDelete(Value: Boolean);
    //取记录是否在删除状态
    function GetDelete: Boolean;
     //初始化数据
    procedure InitialValue;
    //移动NODE到指定Node的下面 同级别
    procedure MoveToSibling(ADestNode: IPMNode);
    //移动NODE到指定Node的下面 addfirst模式
    procedure MoveToChild(ADestNode: IPMNode);
   //移动到指定NODE的下面 addlast 模式
    procedure MoveToLastChild(ADestNode: IPMNode);
   //移动到指定NODE的下一个 不改变层次
    procedure MoveToNext(ADestNode: IPMNode);
    //升级
    procedure Rise;
    //降级
    procedure Drop;

    procedure SetToken(value: string);
    //取下一个NODE
    function GetNext: IPMNode;
    //取上一个NODE
    function GetPrev: IPMNode;

    function GetDetailLinkView: IPMDataView;
    procedure InternalAddFirstChild(APMNode: IPMNode);
    procedure InternalAddNexSibling(APMNode: IPMNode);
    procedure InternalAddChild(APMNode: IPMNode);
    procedure InternalDeleteChild(PMNode: IPMNode);

    function IsChildNode(ANode: IPMNode): Boolean;

    procedure SetDetailLinkView(const Value: IPMDataView);

    procedure SetFoce;
    //刷新显示
    procedure Refresh;

    property DeleteStatus: Boolean read GetDelete write SetDelete;
    property Count: Integer read GetChildCount;
    property ChildNodes[Index: Integer]: IPMNode read GetChildNode;
    property UINode: Pointer read GetUINode write SetNode;
    property Level: Integer read GetLevel write SetLevel;
    property ParentNode: IPMNode read GetParentNode write SetParentNode;
    property DetailView: IPMDataView read GetDetailLinkView write SetDetailLinkView;
//    property NextNode: IPMNode read GetNextNode write SetNextNode;
//    property PrevNode: IPMNode read GetPrevNode write SetPrevNode;
  end;
implementation
   // exports GetPMDataSet
   //function GetPMDataSet: IPMDataset; stdcall
end.

