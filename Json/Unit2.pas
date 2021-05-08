unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, StdCtrls,
  cxInplaceContainer, uPMTreeList, cxTextEdit, uPMTreeListIntf;

type
  TForm2 = class(TForm)
    PMTreeList1: TPMTreeList;
    Button1: TButton;
    PMTreeList1PMTreeListColumn1: TPMTreeListColumn;
    PMTreeList1PMTreeListColumn2: TPMTreeListColumn;
    PMTreeList1PMTreeListColumn3: TPMTreeListColumn;
    PMTreeList1PMTreeListColumn4: TPMTreeListColumn;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  sNode, sNode1, sNode2: TcxTreeListNode;
  Rec: Pointer;
begin
  sNode := PMTreeList1.Add;
  sNode.Values[0] := '0';
  sNode1 := PMTreeList1.Add;
  sNode1.Values[0] := '1';
  Rec := Pointer(sNode1);
  sNode2 := PMTreeList1.AddNode(nil, sNode1, Rec, tlamInsert);
  sNode2.Values[0] := '2';
//  sNode2[]
end;

end.
