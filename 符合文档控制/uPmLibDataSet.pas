unit uPmLibDataSet;

interface
uses Classes, SysUtils, uPMDataIntf, uPMData, uPMDataConst, DB;
type

  TPmLibDataSet = class(TInterfacedObject, IPmdataSet)
  private
    FDataSet: TPMDataset;
  public
    procedure InternalSetFieldValue(FieldName: string; Value: Variant; Rec: Pointer);
    function GetTableName: string;
    //取表名
    procedure SetTableName(const Value: string);
    //设置表名
    function GetTableVariable: string;
    procedure SetTableVariable(const Value: string);
    function GetUserName: string;
    procedure SetUserName(const Value: string);
    procedure SetFieldVisible(FieldName: string; Value: Boolean);
   //设置字段显示
    function GetFieldVisible(FieldName: string): Boolean;
    function GetAttributesAsString: string;
    function GetAttribute(Key: string): string;
    //通过KEY 取表的属性
    procedure DeleteAtt(Key: string);
    procedure SetAttribute(Key: string; AIntf: IUnknown); overload;
    function GetInfAttribute(Key: string): IUnknown;
    function GetAttAsString(Key: string): string;
    //通过KEY 取表的字符串属性
    function GetAttAsBoolean(Key: string): Boolean;
    function GetAttAsInteger(Key: string): Integer;
    procedure SetAttribute(Value: Variant; Key: string); overload;
    //设置表属性 key value形式
    function IsExitsAtt(Key: string): Boolean;

    procedure SetAttribute(Key: string; AObject: TObject); overload;
    function GetObjectAttribute(Key: string): TObject;
    function GetDisplayName(FieldName: string): string;
    procedure SetDisplayName(DisplayName, FieldName: string);
    function GetRecList: TList;
    //记录列表
    function GetFieldValue(FieldName: string; DValue: Variant; Rec: Pointer = nil): Variant; overload;
    //取字段值
    function GetFieldValue(FieldName: string; DValue: Variant; RecIndex: Integer): Variant; overload;
    //取字段值
    function SetFieldValue(FieldName: string; Value: Variant; Rec: Pointer; PmNode: IPMNode = nil): Boolean; overload; virtual;
    //设置字段值
    function SetFieldValue(FieldName: string; Value: Variant; RecIndex: Integer; PmNode: IPMNode = nil): Boolean; overload; virtual;
    //设置字段值
    procedure SetFieldValueAsDouble(FieldName: string; Value: Double; Rec: Pointer; PmNode: IPMNode = nil); virtual;
    function GetFieldValueAsDouble(FieldName: string; DValue: Double; Rec: Pointer): Double; overload;
    function GetFieldValueAsDouble(FieldIndex: Integer; DValue: Double; Rec: Pointer): Double; overload;
    function GetFieldValueAsInt(FieldName: string; DValue: Integer; Rec: Pointer): Integer;
    function GetFieldValueAsBoolean(FieldName: string; DValue: Boolean; Rec: Pointer): Boolean;
    function GetFieldValueAsString(FieldName: string; DValue: string; Rec: Pointer): string;
    procedure FastSetFieldValue(FieldName: string; Value: Variant; Rec: Pointer);

    function InsertAfter(Rec: Pointer; Level: Integer = 0): Pointer; virtual;
    //往后插入记录 rec=nil的情况下自动最后添加    若数据集有层次 插入数据时必须提供level值
    function InsertBefore(Rec: Pointer; Level: Integer = 0): Pointer; virtual;
    //往前插入记录 rec=nil的情况下自动最后添加     若数据集有层次 插入数据时必须提供level值
    procedure DeleteRow(Rec: Pointer; bFreeRec: Boolean = True); virtual;
    //删除指定记录   bFreeRec为true时 释放内存 false时不释放内存 （在需要记录state时 不释放内存）
    procedure DeleteAllRec; virtual;
    //删除所有记录
    procedure Clear;
    //清除数据集的记录和字段 不释放数据集
    function GetExitView(bCreate: Boolean = True; AViewType: TPMViewType = tDefault): IPMDataView;
    function HasValue(FieldName: string; Rec: Pointer): Boolean;
    //判断记录的某个字段是否有值
    function CheckDataHasChanged: Boolean;
    //判断数据集是否变动过
    procedure SetDataChangeStatus(Value: Boolean);
    //设置数据集 变动状态
    procedure SetNotifyChanged(Value: Boolean);
    //设置通知视图状态 true通知 false不通知
    procedure SetMarkState(const Value: Boolean);
    //设置记录 state 状态 true记录 false 不记录
    function GetMarkState: Boolean;
    //取 state状态
    procedure SetOnAfterUnReDo(Value: TOnAfterUnReDo);
    //设置 撤销和前进后的响应事件
    procedure BeginState;
    //开始记录撤销列表
    procedure EndState;
    //结束记录一次撤销
    function GetCurrentRec(RecIndex: Integer = -1): Pointer;
    //通过index获取指定记录指针
    function GetRecordCount: Integer;
    //取记录条数
    function GetDisplayUiStatus: Boolean;
    function GetFieldList: TStringList;
    //取字段列表
    function GetFieldTypeByName(FieldName: string): TPMFieldType;
    //取字段类型
    function GetDataState: TInterfaceList;
    //取state列表
    procedure LoadAttribute(Stream: TStream);
    //保存表属性到数据流中
    function SaveAttributeToStream(Stream: TStream): Integer;
    //从数据流中加载表属性
    function LoadStructure(Stream: TStream): Boolean;
    //保存表属性到数据流中
    function SaveStream(Stream: TStream): Boolean;
    //保存数据集到数据流中
    function LoadStream(Stream: TStream): Boolean;
    //从数据流中加载表
    procedure LoadRecIndex(Stream: TStream);
    //从数据流中加载索引
    procedure SaveDataToFile(FileName: string);
    //保存数据到文件中
    procedure SaveViewToXML(FileName: string; AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string);
    function GetViewToXmlSource(AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string): string;
    procedure LoadDataFromFile(FileName: string);
    //从文件中加载数据
    procedure SaveToTextFile(FileName: string);
    //保存数据集到text格式文件
    procedure LoadFromTextFile(FileName: string);
    //从text文件中加载表
    procedure SaveToCustomFile(FileName: string; cMark: char);
    //保存数据集到自定义文件
    procedure LoadFromCustomFile(FileName: string; cMark: char);
    //从自定义文件中加载表
    procedure SetFieTypeByImport(Value: TFieldTypeByImport);
    //设置字段生成方式
    procedure SetDetailMaster(Value: string);
    //设置主从字段 id=id 样式
    function GetDetailField: string;
    //取从表字段值
    function GetDetailMaster: string;
    //取主从字段值
    function GetPmMasterField: string;
    //取适应PM数据集主从模式的 主表字段
    procedure SetMasterField(Value: string);
    //设置主表字段
    function GetMasterField: string;
    //获取主表字段
    procedure SetMasterDataSource(ASource: TDataSource);
    //设置ADO模式下的 主表datasource
    procedure SetMasterDataSet(ADataSet: TDataSet);
    //设置ADO模式下的 主表 dataset
    function GetMasterDataSource: TDataSource;
    //获取ADO模式下的 主表 datasetsource
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet; Rec: Pointer): IPMDataView;
    //获取从表dataview PM模式   DetailMasterField（id=id样式）  ADetaiData从表数据集  Rec主表当前记录buffer
    function CreateView(AViewType: TPMViewType = tDefault): IPMDataView;
    //创建 此数据集的 视图
    function GetInstance: TDataSet;
    //获取 父级对象dataset
    function GetObject: Pointer;
    //获取对象指针
    function GetDataEmptyStatus: Boolean;
    //获取数据集是否情况状态 true清空 false不清空
    function GetRecByFieldValue(FieldName: string; Value: Variant; BeginCurRec: Boolean = False): Pointer;
    //通过字段和字段值定位到某条记录
    function GetRecByFieldValues(AFields: array of string; AValues: array of string): Pointer;
//    function FindRecByIndexFromStream(FieldName, Value: string): Pointer;
    //通过索引取记录， 在不加载数据 只加载 索引的情况下使用
//    procedure FindRecListByIndexFromStream(FieldName, Value: string; ARecList: TList);
     //通过索引取记录， 在不加载数据 只加载 索引的情况下使用
    function FindRec(FieldName, Value: string; bCreateIndex: Boolean = True): Pointer; overload;
    function FindRec(FieldName: string; Value: Integer): Pointer; overload;
    procedure FindRecList(FieldName: string; Value: Integer; var RecList: TList); overload;
    procedure FindRecList(FieldName, Value: string; var RecList: TList; bCreateIndex: Boolean = True); overload;
    //查找记录 列表
    procedure SetIndexInSream(FieldName: string);
    // 设置 序列化时 需要建索引的字读
    procedure SetIndex(FieldName: string; AHashMode: TPMRECHashMod = phNone; bReSet: Boolean = False);
    procedure DeleteIndex(FieldName: string; bDelete: Boolean = True);
    procedure DeleteAllIndex;
    //设置数据集索引字段
    function CheckFieldExit(Field: string): Boolean;
    //是否有GUID字段
    function GetLevelStatus: Boolean;
    //取 是否有层次
    procedure RefreshField(AFieldName: string);
    function CreateNewDataSet: IPMDataset;
    //创建新的数据集，（与本身无任何联系）
    procedure CloneData(ASource: IPMDataset; bCloneField: Boolean = True);
    //克隆数据集
    procedure CopyData(ASource: IPMDataset); virtual;

    procedure CloseAllViewDisplayUi;
    //关闭视图 刷新界面
    procedure OpenAllViewDisplayUi;
    //开始视图刷新界面
    procedure RefreshViewsUI;
    //刷新界面
    procedure ReConstructTree;
    function GetViewByKeyValue(AKey, Value: string): IPMDataView;
    procedure RefreshViews;
    procedure SetMaxValueFile(AField: string);
    function MaxValue: Integer;

    procedure Exchanger(index1, Index2: Integer);
    procedure PostAllViewEdit;
    function Clone: IPMDataset;
//    function FindRecByEF(FieldName: string; Value: Integer): Pointer;
//    function FindRecListByEF(FieldName: string; Value: Integer; ARecList: TList): Pointer;
//    procedure SetHashMod(AValue: TPMRECHashMod);

    procedure SetNotifyAfterLoadStruct(AEvent: TNotifyAfterLoadStruct);
    //数据集加载数据结构结束后的通知事件
    function GetViewCount: Integer;
    procedure AddRecordData(ASourceData: IPMDataset; ARecList: TList); virtual;
    procedure InternalCopyData(ASource, ADest: Pointer); overload;
    procedure InternalCopyData(ASource, ADest: Pointer; ExceptField: array of string); overload;
    procedure SetChangedView(P: Pointer);

    procedure InitRWCount;
    function GetRwCount: string;


    procedure BeginUpdataUi;
    procedure EndUpdataui;

    procedure SetNotifyChangeEvent(Value: Boolean);
    procedure SetSortField(AField: string; ComparType: TPmComparerType);
    procedure SetOnFieldValueChanged(AEvent: TOnFieldValueChanged);
    procedure SetNotifyFieldValueChangedStatus(AValue: Boolean);

    procedure CopyFromDataSet(ADataSet: TDataSet);

    procedure SetCustomMaxValue(AValue: Integer);
  public
    procedure AddField(FieldName: string; AType: TPMFieldType; Caption: string = '');
    //添加字段
    constructor Create; virtual;
    destructor Destroy; override;
    property DataSet: TPMDataset read FDataSet;
  end;
implementation

procedure TPmLibDataSet.SetNotifyChangeEvent(Value: Boolean);
begin
  FDataSet.SetNotifyChangeEvent(Value);
end;

procedure TPmLibDataSet.AddField(FieldName: string; AType: TPMFieldType; Caption: string = '');
begin
  FDataSet.AddField(FieldName, AType, Caption);
end;

procedure TPmLibDataSet.AddRecordData(ASourceData: IPMDataset;
  ARecList: TList);
begin
  FDataSet.AddRecordData(ASourceData, ARecList);
end;

procedure TPmLibDataSet.BeginState;
begin
  FDataSet.BeginState;
end;

function TPmLibDataSet.CheckDataHasChanged: Boolean;
begin
  Result := FDataSet.CheckDataHasChanged;
end;

function TPmLibDataSet.CheckFieldExit(Field: string): Boolean;
begin
  Result := FDataSet.CheckFieldExit(Field);
end;

procedure TPmLibDataSet.Clear;
begin
  FDataSet.Clear;
end;

function TPmLibDataSet.Clone: IPMDataset;
begin
  Result := FDataSet.Clone;
end;

procedure TPmLibDataSet.CloneData(ASource: IPMDataset; bCloneField: Boolean = True);
begin
  FDataSet.CloneData(ASource, bCloneField);
end;

procedure TPmLibDataSet.CloseAllViewDisplayUi;
begin
  FDataSet.CloseAllViewDisplayUi;
end;

procedure TPmLibDataSet.CopyData(ASource: IPMDataset);
begin
  FDataSet.CopyData(ASource);
end;

constructor TPmLibDataSet.Create;
begin
  FDataSet := TPMDataSet.Create(nil);

end;

function TPmLibDataSet.CreateNewDataSet: IPMDataset;
begin
  Result := FDataSet.CreateNewDataSet;
end;

function TPmLibDataSet.CreateView(AViewType: TPMViewType): IPMDataView;
begin
  Result := FDataSet.CreateView(AViewType);
  Result.PmLibDataSet := Self;
end;

procedure TPmLibDataSet.DeleteAllRec;
begin
  FDataSet.DeleteAllRec;
end;

procedure TPmLibDataSet.DeleteRow(Rec: Pointer; bFreeRec: Boolean);
begin
  FDataSet.DeleteRow(Rec, bFreeRec);
end;

destructor TPmLibDataSet.Destroy;
begin
  FDataSet.Free;
  inherited;
end;

procedure TPmLibDataSet.EndState;
begin
  FDataSet.EndState;
end;

function TPmLibDataSet.FindRec(FieldName, Value: string;
  bCreateIndex: Boolean): Pointer;
begin
  Result := FDataSet.FindRec(FieldName, Value, bCreateIndex);
end;

//function TPmLibDataSet.FindRecByEF(FieldName: string;
//  Value: Integer): Pointer;
//begin
//  Result := FDataSet.FindRecByEF(FieldName, Value);
//end;

//function TPmLibDataSet.FindRecByIndexFromStream(FieldName,
//  Value: string): Pointer;
//begin
//  Result := FDataSet.FindRecByIndexFromStream(FieldName, Value);
//end;

procedure TPmLibDataSet.FindRecList(FieldName, Value: string;
  var RecList: TList; bCreateIndex: Boolean);
begin
  FDataSet.FindRecList(FieldName, Value, RecList, bCreateIndex);
end;

//function TPmLibDataSet.FindRecListByEF(FieldName: string; Value: Integer;
//  ARecList: TList): Pointer;
//begin
//  FDataSet.FindRecListByEF(FieldName, Value, ARecList);
//end;

//procedure TPmLibDataSet.FindRecListByIndexFromStream(FieldName,
//  Value: string; ARecList: TList);
//begin
//  FDataSet.FindRecListByIndexFromStream(FieldName, Value, ARecList);
//end;

function TPmLibDataSet.GetAttAsBoolean(Key: string): Boolean;
begin
  Result := FDataSet.GetAttAsBoolean(Key);
end;

function TPmLibDataSet.GetAttAsInteger(Key: string): Integer;
begin
  Result := FDataSet.GetAttAsInteger(Key);
end;

function TPmLibDataSet.GetAttAsString(Key: string): string;
begin
  Result := FDataSet.GetAttAsString(Key);
end;

function TPmLibDataSet.GetAttribute(Key: string): string;
begin
  Result := FDataSet.GetAttribute(Key);
end;

function TPmLibDataSet.GetAttributesAsString: string;
begin
  Result := FDataSet.GetAttributesAsString;
end;

function TPmLibDataSet.GetCurrentRec(RecIndex: Integer): Pointer;
begin
  Result := FDataSet.GetCurrentRec(RecIndex);
end;

function TPmLibDataSet.GetDataEmptyStatus: Boolean;
begin
  Result := FDataSet.GetDataEmptyStatus;
end;

function TPmLibDataSet.GetDataState: TInterfaceList;
begin
  Result := FDataSet.GetDataState;
end;

function TPmLibDataSet.GetDetailField: string;
begin
  Result := FDataSet.GetDetailField;
end;

function TPmLibDataSet.GetDetailMaster: string;
begin
  Result := FDataSet.GetDetailMaster;
end;

function TPmLibDataSet.GetDetailView(DetailMasterField: string;
  ADetaiData: IPMDataSet; Rec: Pointer): IPMDataView;
begin
  Result := FDataSet.GetDetailView(DetailMasterField, ADetaiData, Rec);
end;

function TPmLibDataSet.GetDisplayName(FieldName: string): string;
begin
  Result := FDataSet.GetDisplayName(FieldName);
end;

function TPmLibDataSet.GetFieldList: TStringList;
begin
  Result := FDataSet.GetFieldList
end;

function TPmLibDataSet.GetFieldTypeByName(FieldName: string): TPMFieldType;
begin
  Result := FDataSet.GetFieldTypeByName(FieldName);
end;

function TPmLibDataSet.GetFieldValue(FieldName: string; DValue: Variant;
  RecIndex: Integer): Variant;
begin
  Result := FDataSet.GetFieldValue(FieldName, DValue, RecIndex);
end;

function TPmLibDataSet.GetFieldValue(FieldName: string; DValue: Variant;
  Rec: Pointer): Variant;
begin
  Result := FDataSet.GetFieldValue(FieldName, DValue, Rec);
end;

function TPmLibDataSet.GetFieldVisible(FieldName: string): Boolean;
begin
  Result := FDataSet.GetFieldVisible(FieldName);
end;

function TPmLibDataSet.GetInfAttribute(Key: string): IUnknown;
begin
  Result := FDataSet.GetInfAttribute(Key);
end;

function TPmLibDataSet.GetInstance: TDataSet;
begin
  Result := FDataSet.GetInstance;
end;

function TPmLibDataSet.GetLevelStatus: Boolean;
begin
  Result := FDataSet.GetLevelStatus;
end;

function TPmLibDataSet.GetMarkState: Boolean;
begin
  Result := FDataSet.GetMarkState;
end;

function TPmLibDataSet.GetMasterDataSource: TDataSource;
begin
  Result := FDataSet.GetMasterDataSource;
end;

function TPmLibDataSet.GetMasterField: string;
begin
  Result := FDataSet.GetMasterField;
end;

function TPmLibDataSet.GetObject: Pointer;
begin
  Result := FDataSet.GetObject;
end;

function TPmLibDataSet.GetObjectAttribute(Key: string): TObject;
begin
  Result := FDataSet.GetObjectAttribute(Key);
end;

function TPmLibDataSet.GetPmMasterField: string;
begin
  Result := FDataSet.GetPmMasterField;
end;

function TPmLibDataSet.GetRecByFieldValue(FieldName: string;
  Value: Variant; BeginCurRec: Boolean): Pointer;
begin
  Result := FDataSet.GetRecByFieldValue(FieldName, Value, BeginCurRec);
end;

function TPmLibDataSet.GetRecList: TList;
begin
  Result := FDataSet.GetRecList;
end;

function TPmLibDataSet.GetRecordCount: Integer;
begin
  Result := FDataSet.GetRecordCount;
end;

function TPmLibDataSet.GetTableName: string;
begin
  Result := FDataSet.GetTableName;
end;

function TPmLibDataSet.GetUserName: string;
begin
  Result := FDataSet.GetUserName;
end;

function TPmLibDataSet.GetViewCount: Integer;
begin
  Result := FDataSet.GetViewCount;
end;

function TPmLibDataSet.HasValue(FieldName: string; Rec: Pointer): Boolean;
begin
  Result := FDataSet.HasValue(FieldName, Rec);
end;

function TPmLibDataSet.InsertAfter(Rec: Pointer; Level: Integer): Pointer;
begin
  Result := FDataSet.InsertAfter(Rec, Level);
end;

function TPmLibDataSet.InsertBefore(Rec: Pointer; Level: Integer): Pointer;
begin
  Result := FDataSet.InsertBefore(Rec, Level);
end;

procedure TPmLibDataSet.InternalCopyData(ASource, ADest: Pointer);
begin
  FDataSet.InternalCopyData(ASource, ADest);
end;

procedure TPmLibDataSet.InternalCopyData(ASource, ADest: Pointer;
  ExceptField: array of string);
begin
  FDataSet.InternalCopyData(ASource, ADest, ExceptField);
end;

function TPmLibDataSet.IsExitsAtt(Key: string): Boolean;
begin
  Result := FDataSet.IsExitsAtt(Key);
end;

procedure TPmLibDataSet.LoadAttribute(Stream: TStream);
begin
  FDataSet.LoadAttribute(Stream);
end;

procedure TPmLibDataSet.LoadDataFromFile(FileName: string);
begin
  FDataSet.LoadDataFromFile(FileName);
end;

procedure TPmLibDataSet.LoadFromCustomFile(FileName: string; cMark: char);
begin
  FDataSet.LoadFromCustomFile(FileName, cMark);
end;

procedure TPmLibDataSet.LoadFromTextFile(FileName: string);
begin
  FDataSet.LoadFromTextFile(FileName);
end;

procedure TPmLibDataSet.LoadRecIndex(Stream: TStream);
begin
  FDataSet.LoadRecIndex(Stream);
end;

function TPmLibDataSet.LoadStream(Stream: TStream): Boolean;
begin
  Result := FDataSet.LoadStream(Stream);
end;

function TPmLibDataSet.LoadStructure(Stream: TStream): Boolean;
begin
  Result := FDataSet.LoadStructure(Stream);
end;

procedure TPmLibDataSet.OpenAllViewDisplayUi;
begin
  FDataSet.OpenAllViewDisplayUi;
end;

procedure TPmLibDataSet.RefreshViews;
begin
  FDataSet.RefreshViews;
end;

procedure TPmLibDataSet.RefreshViewsUI;
begin
  FDataSet.RefreshViewsUi;
end;

function TPmLibDataSet.SaveAttributeToStream(Stream: TStream): Integer;
begin
  FDataSet.SaveAttributeToStream(Stream);
end;

procedure TPmLibDataSet.SaveDataToFile(FileName: string);
begin
  FDataSet.SaveDataToFile(FileName);
end;

function TPmLibDataSet.SaveStream(Stream: TStream): Boolean;
begin
  Result := FDataSet.SaveStream(Stream);
end;

procedure TPmLibDataSet.SaveToCustomFile(FileName: string; cMark: char);
begin
  FDataSet.SaveToCustomFile(FileName, cMark);
end;

procedure TPmLibDataSet.SaveToTextFile(FileName: string);
begin
  FDataSet.SaveToTextFile(FileName);
end;

procedure TPmLibDataSet.SetAttribute(Value: Variant; Key: string);
begin
  FDataSet.SetAttribute(Value, Key);
end;

procedure TPmLibDataSet.SaveViewToXML(FileName: string;
  AView: IPMDataView; AAttKeys: array of string; AValues: array of string);
begin
  FDataSet.SaveViewToXML(FileName, AView, AAttKeys, AValues);
end;

procedure TPmLibDataSet.SetAttribute(Key: string; AObject: TObject);
begin
  FDataSet.SetAttribute(Key, AObject);
end;

procedure TPmLibDataSet.SetAttribute(Key: string; AIntf: IInterface);
begin
  FDataSet.SetAttribute(Key, AIntf);
end;

procedure TPmLibDataSet.SetDataChangeStatus(Value: Boolean);
begin
  FDataSet.SetDataChangeStatus(Value);
end;

procedure TPmLibDataSet.SetDetailMaster(Value: string);
begin
  FDataSet.SetDetailMaster(Value);
end;

procedure TPmLibDataSet.SetDisplayName(DisplayName, FieldName: string);
begin
  FDataSet.SetDisplayName(DisplayName, FieldName);
end;

function TPmLibDataSet.SetFieldValue(FieldName: string; Value: Variant;
  RecIndex: Integer; PmNode: IPMNode): Boolean;
begin
Result:= FDataSet.SetFieldValue(FieldName, Value, RecIndex, PmNode);
end;

function TPmLibDataSet.SetFieldValue(FieldName: string; Value: Variant;
  Rec: Pointer; PmNode: IPMNode): Boolean;
begin
 Result:= FDataSet.SetFieldValue(FieldName, Value, Rec, PmNode);
end;

procedure TPmLibDataSet.SetFieldVisible(FieldName: string; Value: Boolean);
begin
  FDataSet.SetFieldVisible(FieldName, Value);
end;

procedure TPmLibDataSet.SetFieTypeByImport(Value: TFieldTypeByImport);
begin
  FDataSet.SetFieTypeByImport(Value);
end;

procedure TPmLibDataSet.SetIndex(FieldName: string; AHashMode: TPMRECHashMod = phNone; bReSet: Boolean = False);
begin
  FDataSet.SetIndex(FieldName, AHashMode, bReSet);
end;

procedure TPmLibDataSet.SetIndexInSream(FieldName: string);
begin
  FDataSet.SetIndexInSream(FieldName);
end;

procedure TPmLibDataSet.SetMarkState(const Value: Boolean);
begin
  FDataSet.SetMarkState(Value);
end;

procedure TPmLibDataSet.SetMasterDataSet(ADataSet: TDataSet);
begin
  FDataSet.SetMasterDataSet(ADataSet);
end;

procedure TPmLibDataSet.SetMasterDataSource(ASource: TDataSource);
begin
  FDataSet.SetMasterDataSource(ASource);
end;

procedure TPmLibDataSet.SetMasterField(Value: string);
begin
  FDataSet.SetMasterField(Value);
end;

procedure TPmLibDataSet.SetNotifyAfterLoadStruct(
  AEvent: TNotifyAfterLoadStruct);
begin
  FDataSet.SetNotifyAfterLoadStruct(AEvent);
end;

procedure TPmLibDataSet.SetNotifyChanged(Value: Boolean);
begin
  FDataSet.SetNotifyChanged(Value);
end;

procedure TPmLibDataSet.SetOnAfterUnReDo(Value: TOnAfterUnReDo);
begin
  FDataSet.SetOnAfterUnReDo(Value);
end;

procedure TPmLibDataSet.SetTableName(const Value: string);
begin
  FDataSet.SetTableName(Value);
end;

procedure TPmLibDataSet.SetUserName(const Value: string);
begin
  FDataSet.SetUserName(Value);
end;

function TPmLibDataSet.MaxValue: Integer;
begin
  Result := FDataSet.MaxValue;
end;

procedure TPmLibDataSet.SetMaxValueFile(AField: string);
begin
  FDataSet.SetMaxValueFile(AField);
end;


//procedure TPmLibDataSet.SetHashMod(AValue: TPMRECHashMod);
//begin
//  FDataSet.SetHashMod(AValue);
//end;

function TPmLibDataSet.GetDisplayUiStatus: Boolean;
begin
  Result := FDataSet.GetDisplayUiStatus;
end;

procedure TPmLibDataSet.PostAllViewEdit;
begin
  FDataSet.PostAllViewEdit;
end;

procedure TPmLibDataSet.Exchanger(index1, Index2: Integer);
begin
  FDataSet.Exchanger(index1, Index2);
end;

function TPmLibDataSet.GetViewByKeyValue(AKey, Value: string): IPMDataView;
begin
  Result := FDataSet.GetViewByKeyValue(AKey, Value);
end;

procedure TPmLibDataSet.SetChangedView(P: Pointer);
begin
  FDataSet.SetChangedView(p);
end;

procedure TPmLibDataSet.BeginUpdataUi;
begin
  FDataSet.BeginUpdataUi;
end;

procedure TPmLibDataSet.EndUpdataui;
begin
  FDataSet.EndUpdataui;
end;

procedure TPmLibDataSet.RefreshField(AFieldName: string);
begin
  FDataSet.RefreshField(AFieldName);
end;

procedure TPmLibDataSet.FastSetFieldValue(FieldName: string;
  Value: Variant; Rec: Pointer);
begin
  FDataSet.FastSetFieldValue(FieldName, Value, Rec);
end;

function TPmLibDataSet.GetFieldValueAsBoolean(FieldName: string;
  DValue: Boolean; Rec: Pointer): Boolean;
begin
  Result := FDataSet.GetFieldValueAsBoolean(FieldName, DValue, Rec);
end;

function TPmLibDataSet.GetFieldValueAsDouble(FieldName: string;
  DValue: Double; Rec: Pointer): Double;
begin
  Result := FDataSet.GetFieldValueAsDouble(FieldName, DValue, Rec);
end;

function TPmLibDataSet.GetFieldValueAsInt(FieldName: string;
  DValue: Integer; Rec: Pointer): Integer;
begin
  Result := FDataSet.GetFieldValueAsInt(FieldName, DValue, Rec);
end;

function TPmLibDataSet.GetFieldValueAsString(FieldName, DValue: string;
  Rec: Pointer): string;
begin
  Result := FDataSet.GetFieldValueAsString(FieldName, DValue, Rec);
end;

function TPmLibDataSet.GetRwCount: string;
begin
  Result := FDataSet.GetRwCount;
end;

procedure TPmLibDataSet.InitRWCount;
begin
  FDataSet.InitRWCount;
end;

procedure TPmLibDataSet.SetFieldValueAsDouble(FieldName: string;
  Value: Double; Rec: Pointer; PmNode: IPMNode);
begin
  FDataSet.SetFieldValueAsDouble(FieldName, Value, Rec, PmNode);
end;

function TPmLibDataSet.GetFieldValueAsDouble(FieldIndex: Integer;
  DValue: Double; Rec: Pointer): Double;
begin
  Result := FDataSet.GetFieldValueAsDouble(FieldIndex, DValue, Rec)
end;


function TPmLibDataSet.FindRec(FieldName: string; Value: Integer): Pointer;
begin
  Result := FDataSet.FindRec(FieldName, Value);
end;

procedure TPmLibDataSet.FindRecList(FieldName: string; Value: Integer;
  var RecList: TList);
begin
  FDataSet.FindRecList(FieldName, Value, RecList);
end;

procedure TPmLibDataSet.DeleteIndex(FieldName: string; bDelete: Boolean = True);
begin
  FDataSet.DeleteIndex(FieldName, bDelete);
end;

function TPmLibDataSet.GetExitView(bCreate: Boolean;
  AViewType: TPMViewType): IPMDataView;
begin
  Result := FDataSet.GetExitView(bCreate, AViewType);
end;

procedure TPmLibDataSet.DeleteAllIndex;
begin
  FDataSet.DeleteAllIndex;
end;

procedure TPmLibDataSet.ReConstructTree;
begin
  FDataSet.ReConstructTree;
end;

function TPmLibDataSet.GetViewToXmlSource(AView: IPMDataView;
  AAttKeys: array of string; AValues: array of string): string;
begin
  Result := FDataSet.GetViewToXmlSource(AView, AAttKeys, AValues);
end;

function TPmLibDataSet.GetTableVariable: string;
begin
  Result := FDataSet.GetTableVariable;
end;

procedure TPmLibDataSet.SetTableVariable(const Value: string);
begin
  FDataSet.SetTableVariable(Value);
end;

procedure TPmLibDataSet.SetSortField(AField: string;
  ComparType: TPmComparerType);
begin
  FDataSet.SetSortField(AField, ComparType);
end;

procedure TPmLibDataSet.DeleteAtt(Key: string);
begin
  FDataSet.DeleteAtt(Key);
end;

function TPmLibDataSet.GetRecByFieldValues(AFields,
  AValues: array of string): Pointer;
begin
  Result := FDataSet.GetRecByFieldValues(AFields, AValues);
end;

procedure TPmLibDataSet.SetOnFieldValueChanged(
  AEvent: TOnFieldValueChanged);
begin
  FDataSet.SetOnFieldValueChanged(AEvent);
end;


procedure TPmLibDataSet.SetNotifyFieldValueChangedStatus(AValue: Boolean);
begin
  FDataSet.SetNotifyFieldValueChangedStatus(AValue);
end;

procedure TPmLibDataSet.CopyFromDataSet(ADataSet: TDataSet);
begin
  FDataSet.CopyFromDataSet(ADataSet);
end;

procedure TPmLibDataSet.SetCustomMaxValue(AValue: Integer);
begin
  FDataSet.SetCustomMaxValue(AValue);
end;

procedure TPmLibDataSet.InternalSetFieldValue(FieldName: string;
  Value: Variant; Rec: Pointer);
begin
  FDataSet.InternalSetFieldValue(FieldName, Value, Rec);
end;

end.

