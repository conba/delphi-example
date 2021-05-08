unit uPMDataIntf;

interface
uses
  Classes;
type
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

//    function GetView: IPMDataView;

//    function GetDetailView(DetailMasterField: string; ADetaiData: IPMDataSet): IPMDataView;
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

//    function GetDetailLinkView: IPMDataView;
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

end.
