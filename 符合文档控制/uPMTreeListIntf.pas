{******************************************************}
{ 产品名称：PMSS5.0                                    }
{ 单元描述：控件TPMTreeListColumn、TPMTreeList接口     }
{ 单元作者：Wenxh                                      }
{ 创建时间：2010.07.06                                 }
{ 备    注：                                           }
{ 修改记录：                                           }
// 2015-06-23 yhx TPMTreeList增加跳到上一个兄弟节点或者下一个兄弟节点方法
{******************************************************}

unit uPMTreeListIntf;

interface

uses
  Classes, Windows, SysUtils, cxTL, Graphics;

type
  TDataNodeAttachMode = (dnamAdd, dnamAddFirst, dnamAddChild, dnamAddChildFirst, dnamInsert);
  TDataNodeAddMode = (dnnaAdd, dnnaAddFirst, dnnaInsert);
  TAlignmentVert = (avTop, avBottom, avCenter);
  //cxEditRepositoryItems
  TPropertiesType = (ptTextEdit, ptButtonEdit, ptImage, ptComboBox, ptPopupEdit,
    ptCalcEdit, ptDateEdit, ptCurrencyEdit, ptSpinEdit, ptMemo, ptCheckBox, ptCurrencyIntEdit);
  TPmFixedKindType = (pmTlbfNone, pmTlbfLeft, pmTlbfRight);

  IPMTreeList = interface;

  IPMTreeListColumn = interface;

  TOnPMTreeListEdited = procedure(Sender: TObject; AColumn: IPMTreeListColumn; bEnter: Boolean = False) of object;
  TOnPmTreeListInitEdit = function(AFieldName: string; PmNode: Pointer): Variant of object;
  TOnPmTreeListKeyPress = procedure(Sender: TObject; AColumn: IPMTreeListColumn; var Key: Char) of object;
  TOnPmTreeListEditChanged = procedure(Sender: TObject; AColumn: IPMTreeListColumn) of object;

  TOnPmGetDisplayText = function(AFieldName: string; PmNode: Pointer): string of object;

  TOnPmTreeListAfterColumnClear = procedure() of object;

  IPMTreeListColumn = interface
    ['{DCCA9579-3ABB-485B-8DB6-344C49453A96}']
    procedure SetFieldName(const Value: string);
    procedure SetWidth(const value: Integer);
    procedure SetCaptionText(const Value: string);
    procedure SetDataBindingValueType(const Value: string);
    procedure SetColumnName(const Value: string);
    procedure SetColumnVisible(const Value: Boolean);
    procedure SetCaptionAlignHorz(const Value: TAlignment);
    procedure SetCaptionAlignVert(const Value: TAlignmentVert);
    procedure SetPropertiesClass(const Value: TPropertiesType);
    procedure SetPositionBandIndex(const Value: Integer);
    procedure SetPositionRowIndex(const Value: Integer);
    procedure SetPositionColIndex(const Value: Integer);
    procedure SetVirtual(const Value: Boolean);
    procedure SetEditing(const Value: Boolean);
    procedure SetDqfs(Value: string);
    function GetDqfs: string;
    function GetVirtual: Boolean;
    function GetPositionBandIndex: Integer;
    function GetPositionRowIndex: Integer;
    function GetPositionColIndex: Integer;
    function GetFieldName: string;
    function GetItemIndex: Integer;
    function GetWidth: Integer;
    function GetCaptionText: string;
    function GetDataBindingValueType: string;
    function GetColumnName: string;
    function GetColumnVisible: Boolean;
    function GetObject: TObject;
    function GetEditing: Boolean;
    procedure Standard_Pm;
    procedure SetShowEditButton(Value: Boolean);
    function GetPropertiesClass: TPropertiesType;
    function GetProperties: Pointer;
    function GetBandVisible: Boolean;
    procedure SetBandVisible(Value: Boolean);
    procedure SetOnPmDispalyText(AValue: TOnPmGetDisplayText);
    function GetOnPmDispayText: TOnPmGetDisplayText;
    function GetDefaultWidth: Integer;
    procedure SetDefaultWidth(const Value: Integer);
    {Property}
    property ColumnName: string read GetColumnName write SetColumnName;
    property CaptionText: string read GetCaptionText write SetCaptionText;
    property FieldName: string read GetFieldName write SetFieldName;
    property Width: Integer read GetWidth write SetWidth;
    property Visible: Boolean read GetColumnVisible write SetColumnVisible;
    property DataBindingValueType: string read GetDataBindingValueType
      write SetDataBindingValueType;
    property CaptionAlignHorz: TAlignment write SetCaptionAlignHorz;
    property CaptionAlignVert: TAlignmentVert write SetCaptionAlignVert;
    property PropertiesType: TPropertiesType read GetPropertiesClass write SetPropertiesClass;
    property Properties: Pointer read GetProperties;
    property RowIndex: Integer read GetPositionRowIndex write SetPositionRowIndex;
    property BandIndex: Integer read GetPositionBandIndex write SetPositionBandIndex;
    property ColIndex: Integer read GetPositionColIndex write SetPositionColIndex;
    property FieldVirtual: Boolean read GetVirtual write SetVirtual; //虚拟字段
    property BandVisible: Boolean read GetBandVisible write SetBandVisible;
    property Dqfs: string read GetDqfs write SetDqfs;
    property DefaultWidth: Integer read GetDefaultWidth write SetDefaultWidth;
  end;

  IPMTreeListBand = interface
    ['{CE36D42D-84AA-4050-9CDE-67F96EC8F23A}']
    function GetObject: Pointer;
    procedure SetCaptionText(Value: string);
    procedure SetFixedKind(Value: TPmFixedKindType);
    function GetVisible: Boolean;
    procedure SetVisible(Value: Boolean);

    property Visible: Boolean read GetVisible write SetVisible;
  end;

  IPMTreeListBands = interface
    ['{63D05A0B-7F66-4F08-9129-6367F1F70EDA}']
    function Add: IPMTreeListBand;
  end;

  IPMTreeList = interface
    ['{C10898C4-131A-4112-BC26-DE4D8D25CE01}']
    //设置列获取焦点
    procedure SetFocusedColumn_PM(Value: IPMTreeListColumn);
    //返回的是TPMNode 即TreeListNode.Data
    function GetFocusedNode_PM: Pointer;
    //当前处于焦点状态的列
    function GetFocusedColumn_PM: IPMTreeListColumn;
    //最顶层可见节点
    function GetTopVisibleNode_PM: Pointer;
    //最顶层节点
    function GetTopNode_PM: Pointer;
    //选中的具体的节点
    function GetSelectedNodes(nIndex: Integer): Pointer;
    //获取选中的记录
    function GetSelectedCount: Integer;
    //获取记录数
    function GetItemCount: Integer;
    //获取列数
    function GetColumnCount: Integer;
    //焦点指定到第一条记录
    procedure FocusedTopNode;
    //全选
    procedure SelectAll_PM;
    //反选
    procedure ReverseSelect;
    //到首行
    procedure GotoTopNode;
    //到尾行
    procedure GotoLastNode;
    //上一行
    procedure GotoPrevNode;
    //下一行
    procedure GotoNextNode;
    //下一个同级节点
    procedure GotoNextSibling;
    //上一个同级节点
    procedure GotoPrevSibling;
    //设置书签(ANode: TcxTreeListNode)
    procedure SetBookMarkEx(ANode: Pointer);
    //上一个书签
    procedure GotoPrevBookMark(ANode: Pointer);
    //下一个书签
    procedure GotoNextBookMark(ANode: Pointer);
    //清除书签
    procedure ClearBookMark;
    //复制行
    procedure CopyNode;
    //粘贴行
    procedure PasteNode;
    //剪切行
    procedure CutNode;
    //删除行
    procedure DelNode;
    //表格列设置
    procedure SetColumns;
    function GetObject: TcxTreeList;
    //导出Excel
    procedure ExportToExcel;
    /// <summary>
    /// 查找和替换
    /// </summary>
    procedure FindReplace;

    function GetBookMark: Boolean;
    procedure SetBookMark(const Value: Boolean);
    function GetShowRoot: Boolean;
    procedure SetShowRoot(const Value: Boolean);
    {}
    function Add_PM: Pointer; overload;
    function Add_PM(ASibling: Pointer; AData: Pointer = nil): Pointer; overload;
    function AddChild_PM(AParent: Pointer; AData: Pointer = nil): Pointer;
    function AddChildFirst_PM(AParent: Pointer; AData: Pointer = nil): Pointer;
    function AddFirst_PM: Pointer; overload;
    function AddFirst_PM(ASibling: Pointer; AData: Pointer = nil): Pointer; overload;
    function AddNextSibling(ASibling: Pointer; AData: Pointer = nil): Pointer;
    function AddNode_PM(ANode, ARelative: Pointer;
      AData: Pointer; AttachMode: TDataNodeAttachMode): Pointer;
    function Insert_PM(ASibling: Pointer; AData: Pointer = nil): Pointer;
    procedure MoveTo_PM(ASourceNode, ADestNode: Pointer; AMode: TDataNodeAttachMode);
    function CreateColumn_PM(ABand: IPMTreeListBand = nil): IPMTreeListColumn;
    procedure BeginUpdate_PM;
    procedure EndUpdate_PM;
    function LocateNode(AData: Pointer; Recurse: Boolean = True): Boolean;
    procedure SetFocusedNode_PM(ANode: Pointer);
    procedure SetTagValue_PM(Value: Integer);
    procedure SetFocus_PM;
    procedure DealBandsShow;
   //以下 add by lifeng
    function Find_PM(AData: Pointer): Pointer;
    procedure DeleteNode(ANode: Pointer);
    procedure DeleteAllChind(ANode: Pointer);
    procedure SetNodeValue(ANode: Pointer; index: Integer; Value: string); overload;
    procedure SetNodeValue(ANode: Pointer; index: Integer; Value: string; AColumn: IPMTreeListColumn); overload;
    procedure SetNodeData(ANode: Pointer; Data: Pointer);
    function GetItem_PM(Index: Integer): Pointer;
    function GetBand_PM(Index: Integer): IPMTreeListBand;
    function GetColumn_PM(Index: Integer): IPMTreeListColumn;
    procedure Clear_PM;
    procedure Clear_Column;
    procedure Clear_Bands;
    procedure SetShowBands(Value: Boolean);
    function GetNodeVale(ANode: Pointer; index: Integer): string;
    function GetNodeData(ANode: Pointer): Pointer;
    function GetNodeByAbsolIndex(AIndex: Integer): Pointer;
    procedure SetTopVisibNode(ANode: Pointer);
    function GetEditingValue: string;
    function GetNext(ANode: Pointer): Pointer;
    function GetPrev(ANode: Pointer): Pointer;
    function LastNode_PM: Pointer;
    function GetNextSibling_PM(ANode: Pointer): Pointer;
    function GetPrevSibling_PM(ANode: Pointer): Pointer;
    function AddNodeChild(ANode: Pointer): Pointer;
    function AddNodeChildFirst(ANode: Pointer): Pointer;
    function GetNodeParent(ANode: Pointer): Pointer;
    procedure SetOnEdited(Value: TOnPMTreeListEdited);
    procedure SetOnKeyPress(Value: TOnPmTreeListKeyPress);
    procedure SetOnEditChanged(Value: TOnPmTreeListEditChanged);
    procedure SetPmTreeListInitEdit(AValue: TOnPmTreeListInitEdit);
    procedure SetOnPmTreeListAfterColumnClear(Value: TOnPmTreeListAfterColumnClear);
    function GetFocusedRealNode: Pointer;
    function GetRoot: Pointer;
    procedure FullExpand_pm;
    function GetAbsoluteIndex(ANode: Pointer): Integer;
    procedure SetAbsoluteNodeFocAndFix(Index: Integer);
    procedure ExpandNode(ANode: Pointer; bExpand: Boolean);
    procedure ExpandAllNodes(bExpand: Boolean);
    function FindColumnByFieldName(FieldName: string): IPMTreeListColumn;

    function CreateBand_Pm: IPMTreeListBand;
    procedure MoveUp(ANode: Pointer);
    procedure MoveDown(ANode: Pointer);
    procedure MoveUpCross(ANode: Pointer);
    procedure MoveDownCross(ANode: Pointer);
    procedure SetToken(Value: string);
    function GetToken: string;
    procedure SetEditing(Value: Boolean);
    procedure SetSelectNode(ANode: Pointer; bSelect: Boolean = True);
    procedure PostEditValue;
    procedure SetEnabled_Pm(Value: Boolean);
    procedure ExpandParentNode(ANode: Pointer; bExpand: Boolean = True);
    procedure SetFontSize(Value: Integer = 9);
    procedure SetAutoHeight(Value: Boolean);
    function GetSelf: Pointer;
    procedure DeleteColumn(AColumn: IPMTreeListColumn);
    procedure SetCreateColumnStatus(Value: Boolean);
    function GetCreateColumnStatus: Boolean;
    function HasChildNode(ANode: Pointer): Boolean;
    procedure SetNodeVisble(ANode: Pointer; Visble: Boolean);
    procedure SetEnter(Value: Boolean);
    function isNodeOwner(ANode: Pointer): Boolean;
    procedure SetPmCustomSort(Value: Boolean);
    procedure SetTopNodeFoces;
    procedure UnInitNodeData;
    function GetTopVisiblNodeAbsolIndex: Integer;
    procedure SetOppoFocNode(ANode: Pointer);
    function GetCanFocus_PM: Boolean;
    procedure SetColSizeChangedEventEnabled(const Value: Boolean);
    {property}
    property SelectedCount: Integer read GetSelectedCount;
    property SelectedNodes[Index: Integer]: Pointer read GetSelectedNodes;
    property Items[Index: Integer]: Pointer read GetItem_PM;
    property Bands[Index: Integer]: IPMTreeListBand read GetBand_PM;
    /// <summary>
    /// 当前焦点数据,即Node.Data数据, 原函数可访问GetFocusedRealNode
    /// </summary>
    property FocusedNode: Pointer read GetFocusedNode_PM;
    property FocusedColumn: IPMTreeListColumn read GetFocusedColumn_PM
      write SetFocusedColumn_PM;
    property TopVisibleNode: Pointer read GetTopVisibleNode_PM;
    property TopNode: Pointer read GetTopNode_PM;
    property ItemCount: Integer read GetItemCount;
    property ColumnCount: Integer read GetColumnCount;
    property Column[Index: Integer]: IPMTreeListColumn read GetColumn_PM;
    property Token: string read GetToken write SetToKen;
    property BookMark: Boolean read GetBookMark write SetBookMark;
    property ShowRoot: Boolean read GetShowRoot write SetShowRoot;
    property CanFocus: Boolean read GetCanFocus_PM;
    property ColSizeChangedEventEnabled: Boolean write SetColSizeChangedEventEnabled;
  end;

  /// <summary>
  /// 用于主窗体 回调给 TreeList
  ///  提供了可以根据设置处理控件的能力
  /// </summary>
  IPMTreeList_MainCallBack = interface
    ['{BD711459-22FA-4A3A-B42D-6F7D4989A163}']
    /// <summary>
    /// 获取选中节点刷子颜色
    ///  -bugId 17388 的另一种实现形式，可以处理全部 TPMTreeList 控件
    ///  (这里暂时不起用，用小蔡修改的版本)
    /// </summary>
    /// <param name="AbIsTreeActive: Boolean">树是否被激活</param>
    /// <returns>TColor: 刷子颜色</returns>
    function GetSelectedNodeBrushColor(AbIsTreeActive: Boolean): TColor;
  end;

implementation

end.



