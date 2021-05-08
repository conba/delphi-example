unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxRibbonSkins, dxRibbonCustomizationForm, dxBar, uPMBar, cxClasses, dxRibbon,
  dxStatusBar, dxRibbonStatusBar,ExtCtrls,cxSplitter, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, uPMTreeList, ImgList, cxTextEdit,
  uRgSalaryConfigBusi, cxLabel, cxBarEditItem, dxBarExtItems,
  cxDropDownEdit, cxContainer, cxEdit, cxMaskEdit, Menus,
  cxEditRepositoryItems, uRgSalaryConfigToolConst, ActnList, cxCustomData,
  cxExtEditRepositoryItems, cxCheckBox, cxCheckComboBox, ufrmRglx;

type
  TFrmMain = class(TForm)
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    PMBarManager: TPMBarManager;
    PMBarManagerBar1: TdxBar;
    btnOpen: TdxBarLargeButton;
    dxBarContainerItem1: TdxBarContainerItem;
    StatusBar: TdxRibbonStatusBar;
    pnlIndex: TPanel;
    pnlData: TPanel;
    tlIndex: TPMTreeList;
    tlData: TPMTreeList;
    splMain: TSplitter;
    imgList: TcxImageList;
    BarLargeImageList: TcxImageList;
    BarImageList: TcxImageList;
    btnSaveData: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    ColFileName: TPMTreeListColumn;
    ColFileToken: TPMTreeListColumn;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    ToolBar: TdxBar;
    lblArea: TcxBarEditItem;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    btnAddDq: TdxBarButton;
    Col_Bm: TPMTreeListColumn;
    Col_Mc: TPMTreeListColumn;
    Col_ZyName: TPMTreeListColumn;
    Col_GcLxName: TPMTreeListColumn;
    Col_Price: TPMTreeListColumn;
    Col_AreaToken: TPMTreeListColumn;
    Col_Bz: TPMTreeListColumn;
    Col_FileToken: TPMTreeListColumn;
    cxEditRepository: TcxEditRepository;
    cbbArea: TcxEditRepositoryComboBoxItem;
    ColAreaToken: TPMTreeListColumn;
    pmIndex: TPMBarPopupMenu;
    pmiExpandAll: TdxBarButton;
    pmiCollape: TdxBarButton;
    pmMainData: TPMBarPopupMenu;
    pmiAddFile: TdxBarButton;
    pmiAddArea: TdxBarButton;
    ActionList: TActionList;
    act_Index_AddFile: TAction;
    act_Index_AddArea: TAction;
    pmiDelete: TdxBarButton;
    act_Index_Delete: TAction;
    pmiMoveUp: TdxBarButton;
    pmiMoveDown: TdxBarButton;
    act_Index_MoveUp: TAction;
    act_Index_MoveDown: TAction;
    act_Main_Add: TAction;
    pmi_Main_Add: TdxBarButton;
    cbbMainName: TcxEditRepositoryComboBoxItem;
    cbbMainBm: TcxEditRepositoryComboBoxItem;
    CCBRgName: TcxEditRepositoryCheckComboBox;
    procedure FormCreate(Sender: TObject);
    procedure act_Index_AddAreaExecute(Sender: TObject);
    procedure act_Index_AddAreaUpdate(Sender: TObject);
    procedure act_Index_AddFileExecute(Sender: TObject);
    procedure act_Index_AddFileUpdate(Sender: TObject);
    procedure act_Index_DeleteExecute(Sender: TObject);
    procedure act_Index_DeleteUpdate(Sender: TObject);
    procedure act_Index_MoveDownExecute(Sender: TObject);
    procedure act_Index_MoveDownUpdate(Sender: TObject);
    procedure act_Index_MoveUpExecute(Sender: TObject);
    procedure act_Index_MoveUpUpdate(Sender: TObject);
    procedure act_Main_AddExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure tlIndexCustomDrawDataCell(Sender: TcxCustomTreeList; ACanvas:
        TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tlIndexFocusedNodeChanged(Sender: TcxCustomTreeList;
        APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure btnSaveDataClick(Sender: TObject);
    procedure Col_BzPropertiesEditValueChanged(Sender: TObject);
    procedure Col_PricePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Col_BmPropertiesEditValueChanged(Sender: TObject);
    procedure Col_PricePropertiesEditValueChanged(Sender: TObject);
    procedure Col_ZyNamePropertiesEditValueChanged(Sender: TObject);
    procedure Col_GcLxNamePropertiesEditValueChanged(Sender: TObject);
    procedure pmiExpandAllClick(Sender: TObject);
    procedure pmiCollapeClick(Sender: TObject);
    procedure ColFileNamePropertiesEditValueChanged(Sender: TObject);
    procedure cbbMainNamePropertiesEditValueChanged(Sender: TObject);
    procedure cbbMainBmPropertiesEditValueChanged(Sender: TObject);
    procedure Col_McPropertiesInitPopup(Sender: TObject);
    procedure Col_McPropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }
    FRgSalaryBuis: TRgSalaryBusi;
    FRglxStrList: TStringList;
    procedure SetMainColumnValue(AFocusedNode: TcxTreeListNode; AColumnType:
        TMainTreeColumns);
    procedure SetIndexColumnValue(AFocusedNode: TcxTreeListNode; AColumnType:
        TIndexTreeColumns);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FRglxStrList := TStringList.Create;
  FRglxStrList.Delimiter := '|';
end;

procedure TFrmMain.act_Index_AddAreaExecute(Sender: TObject);
begin
  if tlIndex.FocusedNode = nil then
    Exit;
  if FRgSalaryBuis <> nil then
  begin
    tlIndex.BeginUpdate;
    try
      FRgSalaryBuis.AddNewArea(tlIndex.FocusedNode);
    finally
      tlIndex.ExpandAllNodes(True);
      tlIndex.EndUpdate;
    end;
  end;
end;

procedure TFrmMain.act_Index_AddAreaUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (tlIndex.FocusedNode <> nil);
end;

procedure TFrmMain.act_Index_AddFileExecute(Sender: TObject);
begin
  if FRgSalaryBuis <> nil then
    FRgSalaryBuis.AddFile(tlIndex.FocusedNode);
end;

procedure TFrmMain.act_Index_AddFileUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := True;
  if tlIndex.FocusedNode <> nil then
  begin
    (Sender as TAction).Enabled := tlIndex.FocusedNode.Level = 0;
  end;
end;

procedure TFrmMain.act_Index_DeleteExecute(Sender: TObject);
begin
  if tlIndex.FocusedNode = nil then
    Exit;
  if FRgSalaryBuis = nil then
    Exit;
  tlIndex.BeginUpdate;
  try
    FRgSalaryBuis.DeleteIndexNode(tlIndex.FocusedNode);
  finally
    tlIndex.EndUpdate;
  end;
end;

procedure TFrmMain.act_Index_DeleteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (tlIndex.FocusedNode <> nil);
end;

procedure TFrmMain.act_Index_MoveDownExecute(Sender: TObject);
begin
  if tlIndex.FocusedNode = nil then
    Exit;
  tlIndex.BeginUpdate;
  try
    if FRgSalaryBuis <> nil then
    begin
      FRgSalaryBuis.MoveIndexNode(tlIndex.FocusedNode, tlIndex.FocusedNode.getNextSibling,
        nmt_MoveDown);
    end;
  finally
    tlIndex.EndUpdate;
  end;
end;

procedure TFrmMain.act_Index_MoveDownUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (tlIndex.FocusedNode <> nil) and
    (tlIndex.FocusedNode.getNextSibling <> nil);
end;

procedure TFrmMain.act_Index_MoveUpExecute(Sender: TObject);
begin
  if tlIndex.FocusedNode = nil then
    Exit;
  tlIndex.BeginUpdate;
  try
    if FRgSalaryBuis <> nil then
    begin
      FRgSalaryBuis.MoveIndexNode(tlIndex.FocusedNode, tlIndex.FocusedNode.getPrevSibling,
        nmt_MoveUp);
    end;
  finally
    tlIndex.EndUpdate;
  end;
end;

procedure TFrmMain.act_Index_MoveUpUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (tlIndex.FocusedNode <> nil) and
    (tlIndex.FocusedNode.getPrevSibling <> nil);
end;

procedure TFrmMain.act_Main_AddExecute(Sender: TObject);
begin
  if FRgSalaryBuis = nil then
    Exit;
  if tlIndex.FocusedNode = nil then
    Exit;
  if tlIndex.FocusedNode.Level = 0 then
    Exit;
  tlData.BeginUpdate;
  try
    FRgSalaryBuis.AddMainRecord(tlIndex.FocusedNode, tlData.FocusedNode);
  finally
    tlData.EndUpdate;
  end;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  if FRgSalaryBuis <> nil then
    FreeAndNil(FRgSalaryBuis);
  if Assigned(FRglxStrList) then
    FreeAndNil(FRglxStrList);
end;

procedure TFrmMain.btnOpenClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  try
    options := options  +  [ofNoValidate];
    Filter := 'xml文件(*.xml)|*.xml';
    if Execute() then
    begin
      //加载文件列表
      FRgSalaryBuis := TRgSalaryBusi.Create(FileName, tlIndex, tlData, FRglxStrList);
//      CCBRgName
      FRgSalaryBuis.LoadIndexData;
      if tlIndex.TopNode <> nil then
        tlIndex.TopNode.Focused := True;
    end;
  finally
    Free;
  end;
end;

procedure TFrmMain.ColFileNamePropertiesEditValueChanged(Sender: TObject);
begin
  SetIndexColumnValue(tlIndex.FocusedNode, itc_FileName);
end;

procedure TFrmMain.Col_BmPropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Bm);
end;

procedure TFrmMain.Col_BzPropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Bz);
end;

procedure TFrmMain.Col_GcLxNamePropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Gclx);
end;

procedure TFrmMain.Col_McPropertiesCloseUp(Sender: TObject);
var
  Str: string;
begin
//  FrmRglx.CloseUp(Sender, Str);
  CloseUp(Sender, Str);
  tldata.FocusedNode.Texts[Ord(mtc_Mc)] := Str;
end;

procedure TFrmMain.Col_McPropertiesInitPopup(Sender: TObject);
var
  sRglx: String;
begin
  sRglx := tldata.FocusedNode.Texts[Ord(mtc_Mc)];
//  FrmRglx.Popup(Sender, sRglx, FRglxStrList.DelimitedText);
  PopUp(Sender, sRglx, FRglxStrList.DelimitedText);
end;

procedure TFrmMain.Col_PricePropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Price);
end;

procedure TFrmMain.Col_PricePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  dNewValue: Double;
  sDisplayValue: string;
begin
  sDisplayValue := VarToStrDef(DisplayValue, '');
  if not TryStrToFloat(sDisplayValue, dNewValue) then
    DisplayValue := 0;
end;

procedure TFrmMain.Col_ZyNamePropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Zy);
end;

procedure TFrmMain.btnSaveDataClick(Sender: TObject);
begin
  try
    if FRgSalaryBuis <> nil then
    begin
      tlIndex.PostEditValue;
      tlData.PostEditValue;
      FRgSalaryBuis.SaveData;
      MessageBox(Self.Handle, '保存文件成功！', '提示', 0)
    end;
  except
    MessageBox(Self.Handle, '保存失败！', '警告', 0)
  end;
end;

procedure TFrmMain.cbbMainBmPropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Bm);
end;

procedure TFrmMain.cbbMainNamePropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Mc);
end;

procedure TFrmMain.pmiCollapeClick(Sender: TObject);
begin
  tlIndex.ExpandAllNodes(False);
end;

procedure TFrmMain.pmiExpandAllClick(Sender: TObject);
begin
  tlIndex.ExpandAllNodes(True);
end;

procedure TFrmMain.SetIndexColumnValue(AFocusedNode: TcxTreeListNode;
    AColumnType: TIndexTreeColumns);
begin
  tlIndex.PostEditValue;
  if FRgSalaryBuis <> nil then
    FRgSalaryBuis.UpdateIndexDataValue(AFocusedNode, AColumnType);
end;

procedure TFrmMain.SetMainColumnValue(AFocusedNode: TcxTreeListNode;
    AColumnType: TMainTreeColumns);
begin
  tlData.PostEditValue;
  if FRgSalaryBuis <> nil then
    FRgSalaryBuis.UpdateMainDataValue(AFocusedNode, AColumnType);
end;

procedure TFrmMain.tlIndexCustomDrawDataCell(Sender: TcxCustomTreeList;
    ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone:
    Boolean);
begin
  if AViewInfo.Node <> nil then
  begin
    if AViewInfo.Node.Selected then
      ACanvas.Brush.Color := clHighlight;
  end;
end;

procedure TFrmMain.tlIndexFocusedNodeChanged(Sender: TcxCustomTreeList;
    APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if AFocusedNode = nil then
    Exit;
  FRgSalaryBuis.ReFreshNode(AFocusedNode);
end;

end.
