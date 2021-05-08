unit uPMDataIntf;

interface
uses
  Classes;
type
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

//    function GetView: IPMDataView;

//    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet): IPMDataView;
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

//    function GetDetailLinkView: IPMDataView;
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

end.
