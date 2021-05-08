unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTextEdit, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, StdCtrls, cxGridTableView, cxClasses,
  cxDropDownEdit, Menus, cxEdit, cxEditRepositoryItems, dxSkinscxPCPainter,
  cxFilter, cxData, cxDataStorage, cxNavigator, DB, cxDBData,
  cxGridCustomTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView,
  cxGrid, uPMTreeList, ComCtrls;

type
  TForm13 = class(TForm)
    lst1: TcxTreeList;
    cxtrlstclmnlst1Column1: TcxTreeListColumn;
    Col2: TcxTreeListColumn;
    btnAddCol: TButton;
    btnAddNode: TButton;
    btnAddSonNode: TButton;
    btnAddBand: TButton;
    btnBandCount: TButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxtrlstclmnlst1Column3: TcxTreeListColumn;
    cxtrlstclmnlst1Column4: TcxTreeListColumn;
    cxtrlstclmnlst1Column5: TcxTreeListColumn;
    cxtrlstclmnlst1Column6: TcxTreeListColumn;
    cxtrlstclmnlst1Column7: TcxTreeListColumn;
    pm1: TPopupMenu;
    edtRepo: TcxEditRepository;
    cxEditRepository1ComboBoxItem1: TcxEditRepositoryComboBoxItem;
    cxEditRepository1PopupItem1: TcxEditRepositoryPopupItem;
    btntes: TButton;
    cxdtrpstrydtmDate: TcxEditRepositoryDateItem;
    btnExchangeNode: TButton;
    btnDelete: TButton;
    btnColumnValueCount: TButton;
    btnDelCol: TButton;
    btnGetNextSibling: TButton;
    btnShenJi: TButton;
    btnGetNode: TButton;
    btnDelNode: TButton;
    btnVisibleCount: TButton;
    btn1: TButton;
    btnFullExopand: TButton;
    btn_OnInitEdit: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btnAddColClick(Sender: TObject);
    procedure btnAddNodeClick(Sender: TObject);
    procedure btnAddSonNodeClick(Sender: TObject);
    procedure btnBandCountClick(Sender: TObject);
    procedure btnColumnValueCountClick(Sender: TObject);
    procedure btnDelColClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDelNodeClick(Sender: TObject);
    procedure btnExchangeNodeClick(Sender: TObject);
    procedure btnFullExopandClick(Sender: TObject);
    procedure btnGetNextSiblingClick(Sender: TObject);
    procedure btnGetNodeClick(Sender: TObject);
    procedure btnShenJiClick(Sender: TObject);
    procedure btnVisibleCountClick(Sender: TObject);
    procedure btn_OnInitEditClick(Sender: TObject);
    procedure cxtrlstclmnlst1Column3GetEditProperties(Sender: TcxTreeListColumn;
        ANode: TcxTreeListNode; var EditProperties: TcxCustomEditProperties);
    procedure lst1BandHeaderClick(Sender: TcxCustomTreeList; ABand:
        TcxTreeListBand);
    procedure lst1BeginDragNode(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
        var Allow: Boolean);
    procedure lst1CanFocusNode(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
        var Allow: Boolean);
    procedure lst1CanSelectNode(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
        var Allow: Boolean);
    procedure lst1Collapsed(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
    procedure lst1Collapsing(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var
        Allow: Boolean);
    procedure lst1ColumnHeaderClick(Sender: TcxCustomTreeList; AColumn:
        TcxTreeListColumn);
    procedure lst1InitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit);
    procedure lst1InitEditValue(Sender, AItem: TObject; AEdit: TcxCustomEdit; var
        AValue: Variant);
  private
    { Private declarations }
    procedure GetEditingText(Sender, AItem: TObject; AEdit: TcxCustomEdit);
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
uses
  Unit1;
var
  ANode1: TcxTreeListNode;
{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
begin
  lst1.FullCollapse;
end;

procedure TForm13.btnAddColClick(Sender: TObject);
var
  vColumn: TcxTreeListColumn;
begin
  vColumn := lst1.CreateColumn();
  vColumn.Caption.Text := 'li';
  vColumn.Caption.AlignHorz := taCenter;
  vColumn.Tag := 1;
  vColumn.Name := 'sfsf';
end;

procedure TForm13.btnAddNodeClick(Sender: TObject);
var
  ANewNode: TcxTreeListNode;
  ANode: TcxTreeListNode;
begin
  ANewNode := lst1.Add;
  ANewNode.Values[0] := '0';
  ANewNode.Values[1] := '1';
//  ANode := lst1.AddChild(ANewNode);
//  ANode.Values[0] := 'aa';
//  ANode.Values[1] := 'bb';
  ANewNode.Expanded := True;
  //ANewNode.Values[2] := '2';
end;

procedure TForm13.btnAddSonNodeClick(Sender: TObject);
var
  ANewNode: TcxTreeListNode;
  i: Integer;
begin
  if lst1.FocusedNode.HasChildren then
  begin
    ANewNode := lst1.FocusedNode.AddChild;
    for I := 0 to ANewNode.ValueCount - 1 do
    begin
      ANewNode.Values[i] := 'cc';
    end;
  end
  else
  begin
    ANewNode := lst1.FocusedNode.AddChild;
//    ANewNode.Values[0] := 'aa';
//    ANewNode.Values[1] := 'bb';
    for I := 0 to ANewNode.ValueCount - 1 do
    begin
      ANewNode.Values[i] := IntToStr(i);
    end;
  end;
  lst1.FocusedNode.Expanded := true;
  ShowMessage(IntToStr(lst1.FocusedNode.ValueCount));
end;

procedure TForm13.btnBandCountClick(Sender: TObject);
begin
  ShowMessage(IntToStr(lst1.Bands.Count));
  //lst1.ColumnCount[cxtrlstclmnlst1Column1.ItemIndex]
  ShowMessage(IntToStr(Col2.ItemIndex));
end;

procedure TForm13.btnColumnValueCountClick(Sender: TObject);
begin
  ShowMessage(IntToStr(lst1.ColumnCount));
  ShowMessage(IntToStr(lst1.FocusedColumn.ValueCount));
end;

procedure TForm13.btnDelColClick(Sender: TObject);
begin
  lst1.FocusedColumn.Destroy;
end;

procedure TForm13.btnDeleteClick(Sender: TObject);
begin
  lst1.FocusedNode.Delete;
  //lst1.Items[0].Delete;
end;

procedure TForm13.btnDelNodeClick(Sender: TObject);
begin
  lst1.FocusedNode.Delete;

end;

procedure TForm13.btnExchangeNodeClick(Sender: TObject);
var
  ANewNode: TcxTreeListNode;
  ANewNode1: TcxTreeListNode;
begin
  ANewNode := lst1.FocusedNode.GetNext;
  ANewNode.Values[4] := '22';
//  ANewNode1 := ANewNode.getNextSibling;
//  ShowMessage(ANewNode1.Values[1]);
//  ANewNode1 := lst1.AddChildFirst(lst1.FocusedNode);
//  ANewNode1.Values[0] := '123124';
  //ANewNode1 := lst1.AddNode()
end;

procedure TForm13.btnFullExopandClick(Sender: TObject);
begin
  lst1.FullExpand;
end;

procedure TForm13.btnGetNextSiblingClick(Sender: TObject);
var
  ANewNode: TcxTreeListNode;
begin
  ANewNode := lst1.FocusedNode.getNextSibling;
  ShowMessage(ANewNode.Values[1]);
end;

procedure TForm13.btnGetNodeClick(Sender: TObject);
begin
  ANode1 := lst1.FocusedNode;
end;

procedure TForm13.btnShenJiClick(Sender: TObject);
begin
  if lst1.FocusedNode.HasAsParent(ANode1) then
    ShowMessage('上一个节点是该节点的父节点')
  else
    ShowMessage('上一个节点不是该节点的父节点');
end;

procedure TForm13.btnVisibleCountClick(Sender: TObject);
begin
  ShowMessage(IntToStr(lst1.VisibleCount));
end;

procedure TForm13.btn_OnInitEditClick(Sender: TObject);
begin
//  lst1.OnInitEdit
end;

procedure TForm13.cxtrlstclmnlst1Column3GetEditProperties(Sender:
    TcxTreeListColumn; ANode: TcxTreeListNode; var EditProperties:
    TcxCustomEditProperties);
begin
  if ANode.Values[0] = '0' then
    EditProperties := cxEditRepository1ComboBoxItem1.Properties;
end;

procedure TForm13.GetEditingText(Sender, AItem: TObject; AEdit: TcxCustomEdit);
begin

end;

procedure TForm13.lst1BandHeaderClick(Sender: TcxCustomTreeList; ABand:
    TcxTreeListBand);
begin
//  ShowMessage('band头被点击了');
end;

procedure TForm13.lst1BeginDragNode(Sender: TcxCustomTreeList; ANode:
    TcxTreeListNode; var Allow: Boolean);
begin
  ShowMessage('正在拖拽单元格');
end;

procedure TForm13.lst1CanFocusNode(Sender: TcxCustomTreeList; ANode:
    TcxTreeListNode; var Allow: Boolean);
begin
//  ShowMessage('正在选取焦点');
end;

procedure TForm13.lst1CanSelectNode(Sender: TcxCustomTreeList; ANode:
    TcxTreeListNode; var Allow: Boolean);
begin
//  ShowMessage('正在选取节点');
end;

procedure TForm13.lst1Collapsed(Sender: TcxCustomTreeList; ANode:
    TcxTreeListNode);
begin
//  ShowMessage('已经收缩完了');
end;

procedure TForm13.lst1Collapsing(Sender: TcxCustomTreeList; ANode:
    TcxTreeListNode; var Allow: Boolean);
begin
//  ShowMessage('正在收缩');
end;

procedure TForm13.lst1ColumnHeaderClick(Sender: TcxCustomTreeList; AColumn:
    TcxTreeListColumn);
begin
//  ShowMessage('列头被点击了');
  ShowMessage(IntToStr(AColumn.ItemIndex));
end;

procedure TForm13.lst1InitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit);
begin
  ShowMessage('InitEdit');
end;

procedure TForm13.lst1InitEditValue(Sender, AItem: TObject; AEdit:
    TcxCustomEdit; var AValue: Variant);
begin
//  ShowMessage('InitEditValue');
  if Sender is TcxTreeList then
    ShowMessage('TreeList');
  ShowMessage(AItem.ClassName);


  AValue := '1';
end;

end.
