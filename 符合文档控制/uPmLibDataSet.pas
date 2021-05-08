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
    //ȡ����
    procedure SetTableName(const Value: string);
    //���ñ���
    function GetTableVariable: string;
    procedure SetTableVariable(const Value: string);
    function GetUserName: string;
    procedure SetUserName(const Value: string);
    procedure SetFieldVisible(FieldName: string; Value: Boolean);
   //�����ֶ���ʾ
    function GetFieldVisible(FieldName: string): Boolean;
    function GetAttributesAsString: string;
    function GetAttribute(Key: string): string;
    //ͨ��KEY ȡ�������
    procedure DeleteAtt(Key: string);
    procedure SetAttribute(Key: string; AIntf: IUnknown); overload;
    function GetInfAttribute(Key: string): IUnknown;
    function GetAttAsString(Key: string): string;
    //ͨ��KEY ȡ����ַ�������
    function GetAttAsBoolean(Key: string): Boolean;
    function GetAttAsInteger(Key: string): Integer;
    procedure SetAttribute(Value: Variant; Key: string); overload;
    //���ñ����� key value��ʽ
    function IsExitsAtt(Key: string): Boolean;

    procedure SetAttribute(Key: string; AObject: TObject); overload;
    function GetObjectAttribute(Key: string): TObject;
    function GetDisplayName(FieldName: string): string;
    procedure SetDisplayName(DisplayName, FieldName: string);
    function GetRecList: TList;
    //��¼�б�
    function GetFieldValue(FieldName: string; DValue: Variant; Rec: Pointer = nil): Variant; overload;
    //ȡ�ֶ�ֵ
    function GetFieldValue(FieldName: string; DValue: Variant; RecIndex: Integer): Variant; overload;
    //ȡ�ֶ�ֵ
    function SetFieldValue(FieldName: string; Value: Variant; Rec: Pointer; PmNode: IPMNode = nil): Boolean; overload; virtual;
    //�����ֶ�ֵ
    function SetFieldValue(FieldName: string; Value: Variant; RecIndex: Integer; PmNode: IPMNode = nil): Boolean; overload; virtual;
    //�����ֶ�ֵ
    procedure SetFieldValueAsDouble(FieldName: string; Value: Double; Rec: Pointer; PmNode: IPMNode = nil); virtual;
    function GetFieldValueAsDouble(FieldName: string; DValue: Double; Rec: Pointer): Double; overload;
    function GetFieldValueAsDouble(FieldIndex: Integer; DValue: Double; Rec: Pointer): Double; overload;
    function GetFieldValueAsInt(FieldName: string; DValue: Integer; Rec: Pointer): Integer;
    function GetFieldValueAsBoolean(FieldName: string; DValue: Boolean; Rec: Pointer): Boolean;
    function GetFieldValueAsString(FieldName: string; DValue: string; Rec: Pointer): string;
    procedure FastSetFieldValue(FieldName: string; Value: Variant; Rec: Pointer);

    function InsertAfter(Rec: Pointer; Level: Integer = 0): Pointer; virtual;
    //��������¼ rec=nil��������Զ�������    �����ݼ��в�� ��������ʱ�����ṩlevelֵ
    function InsertBefore(Rec: Pointer; Level: Integer = 0): Pointer; virtual;
    //��ǰ�����¼ rec=nil��������Զ�������     �����ݼ��в�� ��������ʱ�����ṩlevelֵ
    procedure DeleteRow(Rec: Pointer; bFreeRec: Boolean = True); virtual;
    //ɾ��ָ����¼   bFreeRecΪtrueʱ �ͷ��ڴ� falseʱ���ͷ��ڴ� ������Ҫ��¼stateʱ ���ͷ��ڴ棩
    procedure DeleteAllRec; virtual;
    //ɾ�����м�¼
    procedure Clear;
    //������ݼ��ļ�¼���ֶ� ���ͷ����ݼ�
    function GetExitView(bCreate: Boolean = True; AViewType: TPMViewType = tDefault): IPMDataView;
    function HasValue(FieldName: string; Rec: Pointer): Boolean;
    //�жϼ�¼��ĳ���ֶ��Ƿ���ֵ
    function CheckDataHasChanged: Boolean;
    //�ж����ݼ��Ƿ�䶯��
    procedure SetDataChangeStatus(Value: Boolean);
    //�������ݼ� �䶯״̬
    procedure SetNotifyChanged(Value: Boolean);
    //����֪ͨ��ͼ״̬ true֪ͨ false��֪ͨ
    procedure SetMarkState(const Value: Boolean);
    //���ü�¼ state ״̬ true��¼ false ����¼
    function GetMarkState: Boolean;
    //ȡ state״̬
    procedure SetOnAfterUnReDo(Value: TOnAfterUnReDo);
    //���� ������ǰ�������Ӧ�¼�
    procedure BeginState;
    //��ʼ��¼�����б�
    procedure EndState;
    //������¼һ�γ���
    function GetCurrentRec(RecIndex: Integer = -1): Pointer;
    //ͨ��index��ȡָ����¼ָ��
    function GetRecordCount: Integer;
    //ȡ��¼����
    function GetDisplayUiStatus: Boolean;
    function GetFieldList: TStringList;
    //ȡ�ֶ��б�
    function GetFieldTypeByName(FieldName: string): TPMFieldType;
    //ȡ�ֶ�����
    function GetDataState: TInterfaceList;
    //ȡstate�б�
    procedure LoadAttribute(Stream: TStream);
    //��������Ե���������
    function SaveAttributeToStream(Stream: TStream): Integer;
    //���������м��ر�����
    function LoadStructure(Stream: TStream): Boolean;
    //��������Ե���������
    function SaveStream(Stream: TStream): Boolean;
    //�������ݼ�����������
    function LoadStream(Stream: TStream): Boolean;
    //���������м��ر�
    procedure LoadRecIndex(Stream: TStream);
    //���������м�������
    procedure SaveDataToFile(FileName: string);
    //�������ݵ��ļ���
    procedure SaveViewToXML(FileName: string; AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string);
    function GetViewToXmlSource(AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string): string;
    procedure LoadDataFromFile(FileName: string);
    //���ļ��м�������
    procedure SaveToTextFile(FileName: string);
    //�������ݼ���text��ʽ�ļ�
    procedure LoadFromTextFile(FileName: string);
    //��text�ļ��м��ر�
    procedure SaveToCustomFile(FileName: string; cMark: char);
    //�������ݼ����Զ����ļ�
    procedure LoadFromCustomFile(FileName: string; cMark: char);
    //���Զ����ļ��м��ر�
    procedure SetFieTypeByImport(Value: TFieldTypeByImport);
    //�����ֶ����ɷ�ʽ
    procedure SetDetailMaster(Value: string);
    //���������ֶ� id=id ��ʽ
    function GetDetailField: string;
    //ȡ�ӱ��ֶ�ֵ
    function GetDetailMaster: string;
    //ȡ�����ֶ�ֵ
    function GetPmMasterField: string;
    //ȡ��ӦPM���ݼ�����ģʽ�� �����ֶ�
    procedure SetMasterField(Value: string);
    //���������ֶ�
    function GetMasterField: string;
    //��ȡ�����ֶ�
    procedure SetMasterDataSource(ASource: TDataSource);
    //����ADOģʽ�µ� ����datasource
    procedure SetMasterDataSet(ADataSet: TDataSet);
    //����ADOģʽ�µ� ���� dataset
    function GetMasterDataSource: TDataSource;
    //��ȡADOģʽ�µ� ���� datasetsource
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet; Rec: Pointer): IPMDataView;
    //��ȡ�ӱ�dataview PMģʽ   DetailMasterField��id=id��ʽ��  ADetaiData�ӱ����ݼ�  Rec����ǰ��¼buffer
    function CreateView(AViewType: TPMViewType = tDefault): IPMDataView;
    //���� �����ݼ��� ��ͼ
    function GetInstance: TDataSet;
    //��ȡ ��������dataset
    function GetObject: Pointer;
    //��ȡ����ָ��
    function GetDataEmptyStatus: Boolean;
    //��ȡ���ݼ��Ƿ����״̬ true��� false�����
    function GetRecByFieldValue(FieldName: string; Value: Variant; BeginCurRec: Boolean = False): Pointer;
    //ͨ���ֶκ��ֶ�ֵ��λ��ĳ����¼
    function GetRecByFieldValues(AFields: array of string; AValues: array of string): Pointer;
//    function FindRecByIndexFromStream(FieldName, Value: string): Pointer;
    //ͨ������ȡ��¼�� �ڲ��������� ֻ���� �����������ʹ��
//    procedure FindRecListByIndexFromStream(FieldName, Value: string; ARecList: TList);
     //ͨ������ȡ��¼�� �ڲ��������� ֻ���� �����������ʹ��
    function FindRec(FieldName, Value: string; bCreateIndex: Boolean = True): Pointer; overload;
    function FindRec(FieldName: string; Value: Integer): Pointer; overload;
    procedure FindRecList(FieldName: string; Value: Integer; var RecList: TList); overload;
    procedure FindRecList(FieldName, Value: string; var RecList: TList; bCreateIndex: Boolean = True); overload;
    //���Ҽ�¼ �б�
    procedure SetIndexInSream(FieldName: string);
    // ���� ���л�ʱ ��Ҫ���������ֶ�
    procedure SetIndex(FieldName: string; AHashMode: TPMRECHashMod = phNone; bReSet: Boolean = False);
    procedure DeleteIndex(FieldName: string; bDelete: Boolean = True);
    procedure DeleteAllIndex;
    //�������ݼ������ֶ�
    function CheckFieldExit(Field: string): Boolean;
    //�Ƿ���GUID�ֶ�
    function GetLevelStatus: Boolean;
    //ȡ �Ƿ��в��
    procedure RefreshField(AFieldName: string);
    function CreateNewDataSet: IPMDataset;
    //�����µ����ݼ������뱾�����κ���ϵ��
    procedure CloneData(ASource: IPMDataset; bCloneField: Boolean = True);
    //��¡���ݼ�
    procedure CopyData(ASource: IPMDataset); virtual;

    procedure CloseAllViewDisplayUi;
    //�ر���ͼ ˢ�½���
    procedure OpenAllViewDisplayUi;
    //��ʼ��ͼˢ�½���
    procedure RefreshViewsUI;
    //ˢ�½���
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
    //���ݼ��������ݽṹ�������֪ͨ�¼�
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
    //����ֶ�
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

