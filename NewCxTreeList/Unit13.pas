unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTextEdit, cxTLdxBarBuiltInMenu, cxEdit,
  cxEditRepositoryItems, cxClasses, cxInplaceContainer, Generics.Collections,
  StdCtrls, uTreeListTable;

type

  //树列
  TTreeName = (xc_Xmmc, xc_Zylx);

  TForm13 = class(TForm)
    lst1: TcxTreeList;
    clXmmc: TcxTreeListColumn;
    clZylx: TcxTreeListColumn;
    EditRepo: TcxEditRepository;
    ZyType: TcxEditRepositoryComboBoxItem;
    btn1: TButton;
    mmo1: TMemo;
    btn2: TButton;
    EditRep: TcxEditRepository;
    EditRptBtnEdt: TcxEditRepositoryButtonItem;
    btn3: TButton;
    btn4: TButton;
    clCheckBox: TcxTreeListColumn;
    btn5: TButton;
    btn6: TButton;
    EditRptCBK: TcxEditRepositoryCheckBoxItem;
    EditRepCMB: TcxEditRepositoryComboBoxItem;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure lst1CustomDrawDataCell(Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
        AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure lst1InitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit);
  private
    { Private declarations }
    FZyId_ZyMcList, FZyMc_DxMcList, FDxId_DxMcList: TDictionary<string, string>;
    FZyTypeId_DxMcList: TDictionary<integer, string>;
    procedure InitXmmc;
    procedure InitZyId_ZyMc;
    procedure InitDxId_DxMc;
    procedure OnDrawBackground(Sender: TcxCustomEditViewInfo; ACanvas: TcxCanvas;
      var AHandled: Boolean);
  protected
    FMyTreeListTable: TMyTreeListTable;
  public
    { Public declarations }
  end;


var
  Form13: TForm13;

implementation
uses
  uTreeCol;
{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
begin
//  lst1.CustomDrawBackgroundCell;
end;

procedure TForm13.btn2Click(Sender: TObject);
var
  temp_string: array[0..15] of Char;
begin
  temp_string := 'I am now here';
  mmo1.SetSelTextBuf(temp_string);
end;

procedure TForm13.btn3Click(Sender: TObject);
var
  ColObj: TScj_Col;
begin
  ColObj := TScj_Col.create(nil);
  FMyTreeListTable.RegisterColObject('scj', ColObj);
  ColObj.CheckBox := EditRptCBK.Properties;
  ColObj.BtnEdit := EditRptBtnEdt.Properties;
  ColObj.Combox := EditRepCMB.Properties;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  InitXmmc;
  FZyId_ZyMcList := TDictionary<string, string>.Create();
  FZyMc_DxMcList := TDictionary<string, string>.Create();
  FDxId_DxMcList := TDictionary<string, string>.Create();
  FZyTypeId_DxMcList := TDictionary<Integer, string>.Create();
  InitZyId_ZyMc;
  FMyTreeListTable := FMyTreeListTable.Create(lst1);
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  lst1.FullExpand;
end;

procedure TForm13.InitDxId_DxMc;
begin
  FDxId_DxMcList.Add('01', '房屋建筑与装饰工程');
  FDxId_DxMcList.Add('02', '仿古工程');
  FDxId_DxMcList.Add('03', '安装工程');
end;

procedure TForm13.InitXmmc;
var
  TreeNode, TreeChildNode, TreeCChildNode: TcxTreeListNode;
begin
  TreeNode := lst1.Add;
  TreeNode.Texts[ord(xc_Xmmc)] := '武汉18一般计税';
  TreeChildNode := TreeNode.AddChild;
  TreeChildNode.Texts[Ord(xc_Xmmc)] := '单项工程1';
  TreeCChildNode := TreeChildNode.AddChild;
  TreeCChildNode.Texts[Ord(xc_Xmmc)] := '建筑';
  TreeCChildNode := TreeChildNode.AddChild;
  TreeCChildNode.Texts[Ord(xc_Xmmc)] := '装饰';
  TreeCChildNode := TreeChildNode.AddChild;
  TreeCChildNode.Texts[Ord(xc_Xmmc)] := '安装';
  TreeChildNode := TreeNode.AddChild;
  TreeChildNode.Texts[Ord(Xc_Xmmc)] := '单项工程2';
  TreeCChildNode := TreeChildNode.AddChild;
  TreeCChildNode.Texts[Ord(xc_Xmmc)] := '绿化工程';
end;

procedure TForm13.InitZyId_ZyMc;
begin
  FZyId_ZyMcList.Add('0101', '建筑（土建）工程');
  FZyId_ZyMcList.Add('0102', '地基处理工程');
  FZyId_ZyMcList.Add('0201', '仿古建筑工程');
  FZyId_ZyMcList.Add('0202', '仿古装饰工程');
  FZyId_ZyMcList.Add('0301', '电器工程');
  FZyId_ZyMcList.Add('0302', '电梯工程');
end;

procedure TForm13.lst1Click(Sender: TObject);
begin
  btn1.Click;
end;

procedure TForm13.lst1CustomDrawDataCell(Sender: TcxCustomTreeList; ACanvas:
    TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
var
  Rect, ARect: TRect;
  i: Integer;
begin
//  Rect := Sender.CellRect(Sender.TopVisibleNode, Sender.Columns[0]);
////  Rect := AViewInfo.BoundsRect;
//  i := Rect.Left;
//  i := Rect.Top;
//  i := Rect.Right;
//  i := Rect.Bottom;

//  ARect.TopLeft.X := Rect.TopLeft.X + 5;
//  ARect.TopLeft.Y := Rect.TopLeft.Y + 5;
//  ARect.BottomRight.X := Rect.BottomRight.X +

//  ACanvas.SetBrushColor(clRed);
//  ACanvas.FillRect(ARect, clRed);
//  ADone := True;
//
//  if Sender.Columns[0].Name = 'clXmmc' then
//  begin
////    ShowMessage('a');
////    Rect := AViewInfo.BoundsRect;
////      ACanvas.FillRect(Rect, clRed);
////    ACanvas.Brush.Color := clRed;
////      ADone := True;
////    i := Rect.Left;
////    i := Rect.Top;
////    i := Rect.Right;
////    i := Rect.Bottom;
////  ShowMessage(IntToStr(Rect.Left));
////  ShowMessage(IntToStr(Rect.Top));
////  ShowMessage(IntToStr(Rect.Right));
////  ShowMessage(IntToStr(Rect.Bottom));
//    Rect := AViewInfo.EditRect;
//    ARect.TopLeft.X := Rect.TopLeft.X + 5;
//    ARect.TopLeft.Y := Rect.TopLeft.Y + 20;
//    ACanvas.FillRect(ARect, clRed);
//  end;
  AViewInfo.EditViewInfo.OnDrawBackground := OnDrawBackground;
end;

procedure TForm13.lst1InitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit);
var
  temp_string: array[0..15] of Char;
begin
  temp_string := 'I am now here';
//  AEdit.SetSelTextBuf(temp_string);
  AEdit.SetTextBuf(temp_string);
end;

procedure TForm13.OnDrawBackground(Sender: TcxCustomEditViewInfo;
  ACanvas: TcxCanvas; var AHandled: Boolean);
var
  x, y: Integer;
  PointA, PointB, PointC: TPoint;
begin
  ACanvas.Pen.Color := clRed;
  x := Sender.InnerEditRect.Right;
  y := Sender.InnerEditRect.Top;

  PointA := Point(x, y);
  PointB := Point(x - 6, y);
  PointC := Point(x, y + 6);

  ACanvas.Brush.Color := clRed;
  ACanvas.Polygon([PointA, PointB, PointC]);
end;

end.
