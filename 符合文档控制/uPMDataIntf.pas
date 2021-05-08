{*******************************************************}
{                                                       }
{ PMSS5.0                                               }
{ Author:���                                           }
{ ʱ��:2010                                             }
{ ��������:pmDataSet,pmDataView�ӿڶ��嵥Ԫ             }
{ ��Ȩ���� (C) 2010 PmSoft                              }
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
    //ȡ����
    function GetTableName: string;
    //���ñ���
    procedure SetTableName(const Value: string);
    //ȡ�����
    function GetTableVariable: string;
    //���ñ���
    procedure SetTableVariable(const Value: string);
    //ȡ��ʾ����
    function GetUserName: string;
     //������ʾ����
    procedure SetUserName(const Value: string);
    function GetAttributesAsString: string;
    //ͨ��KEY ȡ�������
    function GetAttribute(Key: string): string;
     //ͨ��KEY ȡ����ַ�������
    function GetAttAsString(Key: string): string;
    //ɾ������
    procedure DeleteAtt(Key: string);

    function GetAttAsBoolean(Key: string): Boolean;
    function GetAttAsInteger(Key: string): Integer;
    //���ñ����� key value��ʽ
    procedure SetAttribute(Value: Variant; Key: string); overload;
    function IsExitsAtt(Key: string): Boolean;

    procedure SetAttribute(Key: string; AObject: TObject); overload;
    //��ȡ������ ������������
    function GetObjectAttribute(Key: string): TObject;

    procedure SetAttribute(Key: string; AIntf: IUnknown); overload;
    //��ȡ���� �ӿ���������
    function GetInfAttribute(Key: string): IUnknown;
   //���ö�ȡ �ֶζ�Ӧ��ʾ����
    function GetDisplayName(FieldName: string): string;
    procedure SetDisplayName(DisplayName, FieldName: string);
    //�����ֶ���ʾ
    procedure SetFieldVisible(FieldName: string; Value: Boolean);
    function GetFieldVisible(FieldName: string): Boolean;
     //��¼�б�
    function GetRecList: TList;
     //ȡ�ֶ�ֵ
    function GetFieldValue(FieldName: string; DValue: Variant; Rec: Pointer): Variant; overload;
    //ȡ�ֶ�ֵ
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
    //�����ֶ�ֵ
    function SetFieldValue(FieldName: string; Value: Variant; RecIndex: Integer; PmNode: IPMNode = nil): Boolean; overload;
    //�����ֶ�ֵ
    procedure SetFieldValueAsDouble(FieldName: string; Value: Double; Rec: Pointer; PmNode: IPMNode = nil);

    //����ֶ�
    procedure AddField(FieldName: string; AType: TPMFieldType; Caption: string = '');
    //��������¼ rec=nil��������Զ�������    �����ݼ��в�� ��������ʱ�����ṩlevelֵ
    function InsertAfter(Rec: Pointer; Level: Integer = 0): Pointer;
     //��ǰ�����¼ rec=nil��������Զ�������     �����ݼ��в�� ��������ʱ�����ṩlevelֵ
    function InsertBefore(Rec: Pointer; Level: Integer = 0): Pointer;
    //��Ӽ�¼�б�
    procedure AddRecordData(ASourceData: IPMDataset; ARecList: TList);
    //ɾ��ָ����¼   bFreeRecΪtrueʱ �ͷ��ڴ� falseʱ���ͷ��ڴ� ������Ҫ��¼stateʱ ���ͷ��ڴ棩
    procedure DeleteRow(Rec: Pointer; bFreeRec: Boolean = True);
    //ɾ�����м�¼
    procedure DeleteAllRec;
    //ɾ����������
    procedure DeleteAllIndex;
    //������ݼ��ļ�¼���ֶ� ���ͷ����ݼ�
    procedure Clear;
    //�жϼ�¼��ĳ���ֶ��Ƿ���ֵ
    function HasValue(FieldName: string; Rec: Pointer): Boolean;
    //�ж����ݼ��Ƿ�䶯��
    function CheckDataHasChanged: Boolean;
    //�������ݼ� �䶯״̬
    procedure SetDataChangeStatus(Value: Boolean);
    //����֪ͨ��ͼ״̬ true֪ͨ false��֪ͨ
    procedure SetNotifyChanged(Value: Boolean);

    procedure SetNotifyChangeEvent(Value: Boolean);
    //���ü�¼ state ״̬ true��¼ false ����¼
    procedure SetMarkState(const Value: Boolean);
    //ȡ state״̬
    function GetMarkState: Boolean;
     //���� ������ǰ�������Ӧ�¼�
    procedure SetOnAfterUnReDo(Value: TOnAfterUnReDo);
    //��ʼ��¼�����б�
    procedure BeginState;
    //������¼һ�γ���
    procedure EndState;
    //ͨ��index��ȡָ����¼ָ��
    function GetCurrentRec(RecIndex: Integer = -1): Pointer;
    //ȡ��¼����
    function GetRecordCount: Integer;
    //ȡ�ֶ��б�
    function GetFieldList: TStringList;
    //ȡ�ֶ�����
    function GetFieldTypeByName(FieldName: string): TPMFieldType;
    //ȡstate�б�
    function GetDataState: TInterfaceList;
    //���������м��ر�����
    procedure LoadAttribute(Stream: TStream);
    //��������Ե���������
    function LoadStructure(Stream: TStream): Boolean;
    //��������Ե���������
    function SaveAttributeToStream(Stream: TStream): Integer;
    //�������ݼ�����������
    function SaveStream(Stream: TStream): Boolean;
    //���������м��ر�
    function LoadStream(Stream: TStream): Boolean;
    //���������м�������
    procedure LoadRecIndex(Stream: TStream);
    //�������ݵ��ļ���
    procedure SaveDataToFile(FileName: string);
    //���ļ��м�������
    procedure LoadDataFromFile(FileName: string);
    //�������ݼ���text��ʽ�ļ�
    procedure SaveToTextFile(FileName: string);
    //�����ļ���XML��ʽ
    procedure SaveViewToXML(FileName: string; AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string);
    //ȡ�ļ�XMl��ʽԴ
    function GetViewToXmlSource(AView: IPMDataView;
      AAttKeys: array of string; AValues: array of string): string;
    //��text�ļ��м��ر�
    procedure LoadFromTextFile(FileName: string);
    //�������ݼ����Զ����ļ�
    procedure SaveToCustomFile(FileName: string; cMark: char);
     //���Զ����ļ��м��ر�
    procedure LoadFromCustomFile(FileName: string; cMark: char);
   //�����ֶ����ɷ�ʽ
    procedure SetFieTypeByImport(Value: TFieldTypeByImport);
     //���������ֶ� id=id ��ʽ
    procedure SetDetailMaster(Value: string);
     //ȡ�ӱ��ֶ�ֵ
    function GetDetailField: string;
    //ȡ�����ֶ�ֵ
    function GetDetailMaster: string;
    //ȡ��ӦPM���ݼ�����ģʽ�� �����ֶ�
    function GetPmMasterField: string;
    //���������ֶ�
    procedure SetMasterField(Value: string);
    //��ȡ�����ֶ�
    function GetMasterField: string;
    //����ADOģʽ�µ� ����datasource
    procedure SetMasterDataSource(ASource: TDataSource);
     //����ADOģʽ�µ� ���� dataset
    procedure SetMasterDataSet(ADataSet: TDataSet);
    //��ȡADOģʽ�µ� ���� datasetsource
    function GetMasterDataSource: TDataSource;
    //��ȡ�ӱ�dataview PMģʽ   DetailMasterField��id=id��ʽ��  ADetaiData�ӱ����ݼ�  Rec����ǰ��¼buffer
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet; Rec: Pointer): IPMDataView;
      //���� �����ݼ��� ��ͼ
    function CreateView(AViewType: TPMViewType = tDefault): IPMDataView;
      //��ȡ�Ѿ����ڵ� û�й��˵���ͼ
    function GetExitView(bCreate: Boolean = True; AViewType: TPMViewType = tDefault): IPMDataView;
     //��ȡ ��������dataset
    function GetInstance: TDataSet;
     //��ȡ����ָ��
    function GetObject: Pointer;
   //��ȡ���ݼ��Ƿ����״̬ true��� false�����
    function GetDataEmptyStatus: Boolean;
    //ͨ���ֶκ��ֶ�ֵ��λ��ĳ����¼
    function GetRecByFieldValue(FieldName: string; Value: Variant; BeginCurRec: Boolean = False): Pointer;

    function GetRecByFieldValues(AFields: array of string; AValues: array of string): Pointer;

//    function FindRecByIndexFromStream(FieldName, Value: string): Pointer;
    //ͨ������ȡ��¼�� �ڲ��������� ֻ���� �����������ʹ��
//    procedure FindRecListByIndexFromStream(FieldName, Value: string; ARecList: TList);
     //ͨ������ȡ��¼�� �ڲ��������� ֻ���� �����������ʹ��

    //���ٲ��Ҽ�¼
    function FindRec(FieldName, Value: string; bCreateIndex: Boolean = True): Pointer; overload;
    function FindRec(FieldName: string; Value: Integer): Pointer; overload;
    procedure FindRecList(FieldName: string; Value: Integer; var RecList: TList); overload;
    procedure FindRecList(FieldName, Value: string; var RecList: TList; bCreateIndex: Boolean = True); overload;
//    function FindRecByEF(FieldName: string; Value: Integer): Pointer;
    // ���ַ����Ҽ�¼
//    function FindRecListByEF(FieldName: string; Value: Integer; ARecList: TList): Pointer;
    // ���ַ����Ҽ�¼

//    procedure SetIndexInSream(FieldName: string);
    // ���� ���л�ʱ ��Ҫ���������ֶ�

    //�������ݼ������ֶ�
    procedure SetIndex(FieldName: string; AHashMode: TPMRECHashMod = phNone; bReSet: Boolean = False);
     //ɾ�������ֶ�
    procedure DeleteIndex(FieldName: string; bDelete: Boolean = True);
    //�Ƿ��и��ֶ�
    function CheckFieldExit(Field: string): Boolean;
    //ȡ �Ƿ��в��
    function GetLevelStatus: Boolean;
    //�����ֶ�hash��ģʽ
//    procedure SetHashMod(AValue: TPMRECHashMod);
    //�����µ����ݼ������뱾�����κ���ϵ��
//    function CreateNewDataSet: IPMDataset;
    //��¡���ݼ�
    procedure CloneData(ASource: IPMDataset; bCloneField: Boolean = True);
    //�������ݼ����ֶκ� ��¼
    procedure CopyData(ASource: IPMDataset);
    //��¡���ݼ� �Թ������ݼ�
    function Clone: IPMDataset;
      //���� ���ڲ�������ͼ���� �����ù���ֵ�� ֵ�Ը���ͼ����֪ͨ���£�
    procedure SetChangedView(P: Pointer);
    //�ر���ͼ ˢ�½���
    procedure CloseAllViewDisplayUi;
    //��ʼ��ͼˢ�½���
    procedure OpenAllViewDisplayUi;
    //ˢ�½���
    procedure RefreshViewsUI;
    //���¹���������ͼ��״
    procedure ReConstructTree;

    procedure RefreshViews;
    procedure RefreshField(AFieldName: string);
    //���ݼ��������ݽṹ�������֪ͨ�¼�
    procedure SetNotifyAfterLoadStruct(AEvent: TNotifyAfterLoadStruct);
    //����λ��
    procedure Exchanger(index1, Index2: Integer);
   //�������ݼ�¼
    procedure InternalCopyData(ASource, ADest: Pointer); overload;
    procedure InternalCopyData(ASource, ADest: Pointer; ExceptField: array of string); overload;

    //�ֶ����ֵ
    procedure SetMaxValueFile(AField: string);
    function MaxValue: Integer;
     //��ͼ��ʾ����״̬
    function GetDisplayUiStatus: Boolean;
     //�ύ���а󶨸����ݼ������ؼ��༭��
    procedure PostAllViewEdit;

//    procedure SetSortField(AField: string; ComparType: TPmComparerType);
//     ����
   //����
    procedure SetSortField(AField: string; ComparType: TPmComparerType);

    procedure BeginUpdataUi;
    procedure EndUpdataui;
    procedure InitRWCount;
    function GetRwCount: string;

    function GetViewByKeyValue(AKey, Value: string): IPMDataView;
    function GetViewCount: Integer;
    // �ֶ��޸��¼�
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
    //ȡ����
    function GetTableName: string;
    //������ͼ���ݵ��ļ���
    procedure SaveViewToFile(FileName: string);
    //������ͼ���ݵ�XML�ļ���
    procedure SaveViewToXml(FileName: string);
    //ȡ����ֵ
    function GetAttribute(Key: string): string;
    //��������ֵ
    procedure SetAttribute(Value, Key: string);
    //��¼�б�
    function GetRecList: TList;
     //�����ֶ�ֵ
    function GetFieldValue(FieldName: string; DValue: Variant; PmNode: IPMNode): Variant;
    //ȡ�ֶ�ֵ
    function SetFieldValue(FieldName: string; Value: Variant; PmNode: IPMNode): Boolean;
     //ɾ��ָ����¼
    procedure DeleteRow(PmNode: IPMNode);
    //ɾ�����м�¼
    procedure DeleteAll;
    //��������¼ PmNode=nil��������Զ�������    �����ݼ��в�� ��������ʱ�����ṩlevelֵ
    function InsertAfter(PmNode: IPMNode; Level: Integer = 0): IPMNode;
    //����ӽڵ�
    function AddChild(PmNode: IPMNode): IPMNode;
     //��ǰ�����¼ PmNode=nil��������Զ�������     �����ݼ��в�� ��������ʱ�����ṩlevelֵ
    function InsertBefore(PmNode: IPMNode; Level: Integer = 0): IPMNode;
    //ˢ�½���
    procedure RefreshViews;

    procedure RefreshField(AFieldName: string);
    //ˢ�µ�����¼
    procedure RefreshRec(PmNode: IPMNode);
    //��ͼ��������
    procedure Clear;
    //�������� ������
    procedure SetChangedView;
    //�Ƿ��¼state
    procedure SetMarkState(Value: Boolean);
     //ȡstate״̬ true ʱ state����
    function GetMarkState: Boolean;
     //�ж� ���ݼ����޲�ι�ϵ
    function CheckLevel: Boolean;
     //���� �� ��ȡ �ӱ�ʱ�õ���
    procedure SortByRecIndex;
    //���ù�����Ӧ�¼�
    procedure SetOnFilter(OnFilter: TPMFilterRecordEvent);
     //ͨ��KEY VALUE ������ͼ
    procedure FilterByKeyValue(Keys, Values: array of string);
    //��ʼ��¼state
    procedure BeginState;
    //������¼state
    procedure EndState;
    //��ʼˢ�½���
    procedure BeginUpdateUi;
    //����ˢ�½���
    procedure EndUpdateUi;
    //ȡ����ͼ�еļ�¼����
    function GetRecCount: Integer;
    //ȡ��ͼ����ָ��
    function GetObject: Pointer;
     //ȡ��ͼ״̬
    function GetState: TViewStatus;
    //���ð󶨵� pmdatasource
    procedure SetDataSource(ASource: Pointer);
    //ȡ�ֶ��б�
    function GetFieldList: TStringList;
    //ȡ���ݼ�
    function GetDataSet: IPMDataset;
     //ȡ state�б�
    function GetDataState: TInterfaceList;
    /// <summary>
    /// ��ȡ��ǰ���ݼ�AMainNode�����Ĵӱ����ݼ�
    /// </summary>
    /// <param name="DetailMasterField">�ӱ�����ƥ��ؼ���</param>
    /// <param name="ADetaiData">�ӱ�����</param>
    /// <param name="AMainNode">��ȡ�ӱ����ݵ�����¼</param>
    /// <returns>�ӱ����ݼ�</returns>
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet;
      AMainNode: IPMNode): IPMDataView; overload;
    /// <summary>
    /// ��ȡ��ǰ���ݼ�AMainRec�����Ĵӱ����ݼ�
    /// </summary>
    /// <param name="DetailMasterField">�ӱ�����ƥ��ؼ���</param>
    /// <param name="ADetaiData">�ӱ�����</param>
    /// <param name="AMainRec">��ȡ�ӱ����ݵ�����¼</param>
    /// <returns>�ӱ����ݼ�</returns>
    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet;
      AMainRec: Pointer): IPMDataView; overload;
   {DetailMasterField:string  �����ֶι�ϵ ����cid=zid}

    //�����Ƿ񹹽�pmnode�� ��״�ṹ trueΪ���� false������ Ĭ��true
    procedure SetStructTree(Value: Boolean);

    //һ���Թ��� pmNode�Ĳ�ι�ϵ
    procedure ReConstructTree;
    procedure StructNodeTree;
   //��ȡPMNode�����б�
    function GetPMNodeList: TInterfaceList;
    //��ȡpmnode����ָ��
    function GetPMNodeIntf(Index: Integer): IPMNode;
    // ���ڵ�
    function Root: IPMNode;
    //������Ӧ ����ֵǰ�¼�
    procedure SetOnbeforeSet(Value: TOnBeforeSet);
    //������Ӧ ����ֵ���¼�
    procedure SetOnAfterSet(Value: TOnAfterSet);
    //ȡOnBeforeSet�¼�
    function GetOnBeforeSet: TOnBeforeSet;
    //ȡ  OnAfterSet�¼�
    function GetOnAfterSet: TOnAfterSet;
    //�����ͼ�����ù�ϵ
    procedure ClearRef;
    //ȡˢ�������ϵ�NODEָ��
    function GetUiNode(APMNode: IPMNode): Pointer;
    //ͨ���ֶκ��ֶ�ֵ��λ��ĳ����¼
    function GetRecByFieldValue(FieldName: string; Value: Variant; BeginCurRec: Boolean = False): IPMNode;
    //ͨ�� �ֶ�=value ���Ҽ�¼  akeyvaluelist(key=value key=value)
    function FindPmNode(AKeyValueList: TStringList): IPMNode; overload;
    //���Ҽ�¼ [key,value,key,value] ��ʽ����
    function FindPmNode(Conditions: array of string): IPMNode; overload;

    function FindPmNode(AKey, AValue: string): IPMNode; overload;
    //���Ҽ�¼ �б�
    procedure FindRecList(FieldName, Value: string; var RecList: TList; bCreateIndex: Boolean = True); overload;
    //���Ҽ�¼ �б� ���ص���pmnode
    procedure FindRecList(FieldName, Value: string; var RecList: TInterfaceList; bCreateIndex: Boolean = True); overload;
    //����dataset
    procedure SetDataSet(const Value: IPMDataSet; CopyData: Boolean = True);
   //��������
    procedure CopyRecData(ASourceNode: IPMNode; ADestNode: IPMNode); overload;
    procedure CopyRecData(ASourceNode: IPMNode; ADestNode: IPMNode; ExceptField: array of string); overload;
     //����view����
    procedure CopyFromDataView(ASourceView: IPMDataView; CopyRecBefore: TCopyRecBefor; CopyRecAfter: TCopyRecAfter);
    //�ⲿ�ֶ���� �����б�
    procedure ADDStateList(AState: IDataState);
     //�ƶ�
    procedure Move(PmNode: IPMNode; AMoveMode: TMoveMode);
    //���� ����¼�ƶ�
    procedure MoveCross(PmNode: IPMNode; AMoveMode: TMoveMode);
    //�ƶ�ָ����¼
    function MoveTo(ASourceNode, ADestNode: IPMNode; AMoveMod: TMoveMode): Boolean;
     //������¼
    procedure Exchanger(Index1, Index2: Integer);
    // ����
    procedure RiseLevel(APMNode: IPMNode);
    //����
    procedure DorpLevel(APMNode: IPMNode);
    //����Node�Ľ���
    procedure DropSingle(APMNode: IPMNode);

    procedure SetDeleteChild(Value: Boolean);
    function GetDeleteChild: Boolean;
    function GetFilterStatus: Boolean;
    procedure SetFilterStatus(Value: Boolean);
    //����ֶ��Ƿ����
    function CheckFieldExist(Field: string): Boolean;
     //���� �����ֶ�
    procedure SetSortedField(value: string);
    //ȡ�����ֶ�
    function GetSortedField: string;
    // ������������
    procedure SetSortOptions(Value: TPMSortOptions);
    //ȡ��������
    function GetSortOptions: TPMSortOptions;


    function GetToken: string;
    procedure SetToKen(const Value: string);

    //�����Ƿ���ʾ ����
    procedure SetDisplayUi(const Value: Boolean);
    function GetDisplayUi: Boolean;
    //ͨ����¼ָ��ȡpmnode
    function GetPmNodeByRec(ARec: Pointer): IPMNode;
    //ͨ��ָ��ȡPMNODE   (��ǰһ��������)
    function GetPmNode(ARec: Pointer): IPMNode;

    procedure SetPmLibDataSet(APmLibDataSet: IPMDataset);

      //ˢ�½���
    procedure RefreshViewsUI(bReBuild: Boolean = False);

    //----------------------�����ֶδ�����
    //�����ֶ������������Լ���������VIEW  �ڹ���VIEWʱʹ��
    function FindLinkView(FieldName: string; var AView: IPMDataView): Boolean;
    //���ù����ֶ�
    procedure SetLinkField(AFieldName, ALinkFieldName: string; ALinkView: IPMDataView);
    {FieldName:�����ֶΣ�LinkFieldName���������ݼ����ֶΣ�ALinkView���������ݼ���View}


     //��������  �������ݼ���������ݼ�����ʱ  ��������ʱ  ���ø��ֶ�
    procedure SetPrimaryKey(AFieldName: string);
     //ȡ ����
    function GetPrimaryKey: string;
    //������� �������ݼ���Ҫ�����������ݼ�ʱ���ø��ֶ� ���ڶ�λ��¼
    procedure SetForeignKey(AFieldName: string);
    //ȡ���ֵ
    function GetForeignKey: string;
     //ͨ��������ֵ ��λ����¼   ����������Viewʹ�ã�
    function GetLinkRec(Value: string): Pointer;
     //ͨ�� �����λ����¼ (������viewʹ��)
    function GetForeigLinkRec(Value: string): IPMNode;
    //ȡ�ֶ�hash
    function GetFieldHash: TStringHash;


    //----------------------�ӱ����������
     //���� ��������
    procedure SetMasterPrimaryField(const Value: string);
     //ȡ   �������� �ֶ�
    function GetMasterPrimaryField: string;
    //���ôӱ� �����ֶ�
    procedure setDetailPrimaryField(const Value: string);
    //ȡ   �ӱ� ����
    function GetDetailPrimaryField: string;
    //�Ƿ������޴ӱ��¼ �ļ�¼
    function GetHideNoChildNode: Boolean;

    procedure SetHideNoChildNode(const Value: Boolean);
     //�ӱ���Ӽ�¼ �Ƿ��ж�����ֵ
    procedure SetLinkRecrdAdd(Value: Boolean);
    //���ôӱ���ͼ    �����view ����Ϊ TPMLINKDETAILVIEW
    procedure SetDetailView(AView: IPMDataView);

    //-----------------------------------------
    procedure SetTag(const ATag: Integer);
    function GetTag: Integer;

    function GetPmDataSource: Pointer;
    property DeleteChild: Boolean read GetDeleteChild write SetDeleteChild;
    property PrimaryKey: string read GetPrimaryKey write SetPrimaryKey; //����
    property ForeignKey: string read GetForeignKey write SetForeignKey; //���
    property MarkState: Boolean read GetMarkState write SetMarkState; //��¼״̬
    property PMNodeList[Index: Integer]: IPMNode read GetPMNodeIntf; //pmnode
    property OnbeforeSet: TOnBeforeSet read GetOnBeforeSet write SetOnbeforeSet;
    property OnAfterSet: TOnAfterSet read GetOnAfterSet write SetOnAfterSet;
    property Filter: Boolean read GetFilterStatus write SetFilterStatus; //����
    property MasterPrimaryField: string read GetMasterPrimaryField write SetMasterPrimaryField; //��������
    property DetailPrimaryField: string read GetDetailPrimaryField write setDetailPrimaryField; //�ӱ�����
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
     //�������NODE �󶨵����ݼ�REC
    procedure SetRec(ARec: Pointer);
     //��ȡREC
    function GetRec: Pointer;
     //ȡ����NODE
    function GetParentNode: IPMNode;
     //ȡ��һ��ͬ��Node
    function GetPrevSibling: IPMNode;
     //ȡ��һ��ͬ��Node
    function GetNextSibling: IPMNode;
     //���ø���
    procedure SetParentNode(Value: IPMNode);
     //ȡ��NODE�б�
    function GetChildNodeList: TList;
     //����Ӽ�¼
    function AddChildPmNode: IPMNode;
    //��ӵ�һ���Ӽ�¼
    function AddFirstChild: IPMNode;
    //�����һ��ͬ����¼
    function AddNexSibling: IPMNode;
     //�����һ��ͬ����¼
    function AddPrevSibling: IPMNode;
     //��ֵ
    procedure SetValue(value: Variant; FieldName: string);

    procedure SetValueAsDouble(Value: Double; FieldName: string);
    procedure SetValueAsString(Value: string; FieldName: string);
    procedure SetValueAsInt(Value: Integer; FieldName: string);
    procedure SetValueAsBoolean(Value: Boolean; FieldName: string);
    //ȡֵ
    function GetValue(FieldName: string; DefaultValue: Variant): Variant;
    function GetValueAsString(FieldName: string; DefaultValue: string): string;
    function GetValueAsInt(FieldName: string; DefaultValue: Integer): Integer;
    function GetValueAsDouble(FieldName: string; DefaultValue: Double): Double;
    function GetValueAsBoolean(FieldName: string; DefaultValue: Boolean): Boolean;

    function GetView: IPMDataView;

    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet): IPMDataView;
    //ȡ���
    function GetLevel: Integer;
    //���ò��
    procedure SetLevel(Value: Integer);
    //ȡ��NODE��¼��
    function GetChildCount: Integer;
      //ȡ�ӽڵ�
    function GetChildNode(Index: Integer): IPMNode;
     //ȡ����NODE
    function GetUINode: Pointer;
    //���ý���NODE
    procedure SetNode(Value: Pointer);
    //�ҵ����һ���ӽڵ�
    function FindLastChildNode: IPMNode;
    //�ҵ���һ���ӽڵ�
    function FindFirstChildNode: IPMNode;
    //�ҵ� �ü����µĲ����С�����ӽڵ�
    function GetChildLastestNode: IPMNode;
    //ɾ���ýڵ��µ����м�¼
    procedure DeleteAll;
    //ɾ�������� �����ڵ��е� ��¼
    procedure RemoveParent;
    //ɾ���Ӽ�¼
    procedure DeleteChild;

    function GetSelfPointer: Pointer;
    //����ɾ��״̬
    procedure SetDelete(Value: Boolean);
    //ȡ��¼�Ƿ���ɾ��״̬
    function GetDelete: Boolean;
     //��ʼ������
    procedure InitialValue;
    //�ƶ�NODE��ָ��Node������ ͬ����
    procedure MoveToSibling(ADestNode: IPMNode);
    //�ƶ�NODE��ָ��Node������ addfirstģʽ
    procedure MoveToChild(ADestNode: IPMNode);
   //�ƶ���ָ��NODE������ addlast ģʽ
    procedure MoveToLastChild(ADestNode: IPMNode);
   //�ƶ���ָ��NODE����һ�� ���ı���
    procedure MoveToNext(ADestNode: IPMNode);
    //����
    procedure Rise;
    //����
    procedure Drop;

    procedure SetToken(value: string);
    //ȡ��һ��NODE
    function GetNext: IPMNode;
    //ȡ��һ��NODE
    function GetPrev: IPMNode;

    function GetDetailLinkView: IPMDataView;
    procedure InternalAddFirstChild(APMNode: IPMNode);
    procedure InternalAddNexSibling(APMNode: IPMNode);
    procedure InternalAddChild(APMNode: IPMNode);
    procedure InternalDeleteChild(PMNode: IPMNode);

    function IsChildNode(ANode: IPMNode): Boolean;

    procedure SetDetailLinkView(const Value: IPMDataView);

    procedure SetFoce;
    //ˢ����ʾ
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

