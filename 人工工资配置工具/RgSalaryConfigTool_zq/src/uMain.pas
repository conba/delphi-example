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
  cxCheckComboBox, cxCheckGroup, cxCheckBox, cxExtEditRepositoryItems;

type
  TFrmMain = class(TForm)
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    PMBarManager: TPMBarManager;
    PMBarManagerBar1: TdxBar;
    StatusBar: TdxRibbonStatusBar;
    pnlIndex: TPanel;
    pnlData: TPanel;
    tlIndex: TPMTreeList;
    tlData: TPMTreeList;
    splMain: TSplitter;
    imgList: TcxImageList;
    BarLargeImageList: TcxImageList;
    BarImageList: TcxImageList;
    ColFileName: TPMTreeListColumn;
    ColFileToken: TPMTreeListColumn;
    ToolBar: TdxBar;
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
    pmMainData: TPMBarPopupMenu;
    ActionList: TActionList;
    act_Index_AddFile: TAction;
    act_Index_AddArea: TAction;
    act_Index_Delete: TAction;
    act_Index_MoveUp: TAction;
    act_Index_MoveDown: TAction;
    act_Main_Add: TAction;
    cbbMainName: TcxEditRepositoryComboBoxItem;
    cbbMainBm: TcxEditRepositoryComboBoxItem;
    act_Main_Delete: TAction;
    act_Main_MoveUp: TAction;
    act_Main_MoveDown: TAction;
    act_Main_Copy: TAction;
    cbbMainRgName: TcxEditRepositoryCheckComboBox;
    act_Main_Paste: TAction;
    act_Main_Cut: TAction;
    btnOpen: TdxBarLargeButton;
    btnSaveData: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    pmi_Main_Add: TdxBarButton;
    pmi_Main_Delete: TdxBarButton;
    pmi_Main_MoveUp: TdxBarButton;
    pmi_Main_MoveDown: TdxBarButton;
    pmi_Main_Copy: TdxBarButton;
    pmi_Main_Cut: TdxBarButton;
    pmi_Main_Paste: TdxBarButton;
    pmi_Index_AddFile: TdxBarButton;
    pmi_Index_AddArea: TdxBarButton;
    pmi_Index_Delete: TdxBarButton;
    pmi_Index_MoveUp: TdxBarButton;
    pmi_Index_MoveDown: TdxBarButton;
    pmiExpandAll: TdxBarButton;
    pmiCollape: TdxBarButton;
    dxBarButton1: TdxBarButton;
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
    procedure Col_McPropertiesEditValueChanged(Sender: TObject);
    procedure Col_PricePropertiesEditValueChanged(Sender: TObject);
    procedure Col_ZyNamePropertiesEditValueChanged(Sender: TObject);
    procedure Col_GcLxNamePropertiesEditValueChanged(Sender: TObject);
    procedure pmiCollapeClick(Sender: TObject);
    procedure ColFileNamePropertiesEditValueChanged(Sender: TObject);
    procedure cbbMainBmPropertiesEditValueChanged(Sender: TObject);
    procedure act_Main_DeleteExecute(Sender: TObject);
    procedure act_Main_MoveUpExecute(Sender: TObject);
    procedure act_Main_MoveUpUpdate(Sender: TObject);
    procedure act_Main_MoveDownUpdate(Sender: TObject);
    procedure act_Main_MoveDownExecute(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure act_Main_CopyUpdate(Sender: TObject);
    procedure act_Main_CopyExecute(Sender: TObject);
    procedure Col_ZyNamePropertiesCloseUp(Sender: TObject);
    procedure cbbMainRgNamePropertiesCloseUp(Sender: TObject);
    procedure act_Main_PasteExecute(Sender: TObject);
    procedure act_Main_CutExecute(Sender: TObject);
    procedure act_Main_CutUpdate(Sender: TObject);
    procedure pmiExpandAllClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FRgSalaryBuis: TRgSalaryBusi;
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

procedure TFrmMain.act_Index_AddAreaExecute(Sender: TObject);
begin
  if tlIndex.FocusedNode = nil then
    Exit;
  if FRgSalaryBuis <> nil then
  begin
    tlIndex.BeginUpdate;
    try
      FRgSalaryBuis.AddNewArea(tlIndex.FocusedNode);
      tlIndex.FocusedNode.Expand(True);
    finally
//      tlIndex.ExpandAllNodes(True);
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
        nmt_IndexMoveDown);
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
        nmt_IndexMoveUp);
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

procedure TFrmMain.act_Main_CopyExecute(Sender: TObject);
begin
  if FRgSalaryBuis = nil then
    Exit;
  if tlData.SelectionCount = 0 then
    Exit;
  FRgSalaryBuis.ClipboardMainRecordList(tlData.SelectionList, tct_Copy);
end;

procedure TFrmMain.act_Main_CopyUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (tlData.SelectionCount > 0);
end;

procedure TFrmMain.act_Main_CutExecute(Sender: TObject);
begin
  if FRgSalaryBuis = nil then
    Exit;
  tlData.BeginUpdate;
  try
    FRgSalaryBuis.ClipboardMainRecordList(tlData.SelectionList, tct_Cut);
  finally
    tlData.EndUpdate;
  end;
end;

procedure TFrmMain.act_Main_CutUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (tlData.SelectionCount <> 0);
end;

procedure TFrmMain.act_Main_DeleteExecute(Sender: TObject);
var
  i: Integer;
  sText: string;
begin
  if FRgSalaryBuis = nil then
    Exit;
  if tlData.SelectionCount = 0 then
    Exit;
  tlData.BeginUpdate;
  try
    if Application.MessageBox('是否要删除记录？', '删除', MB_YESNO) = ID_NO then
      Exit;
    for i := (tlData.SelectionCount - 1) downto 0 do
    begin
      FRgSalaryBuis.DeleteMainRecord(tlData.Selections[i]);
    end;
  finally
    tlData.EndUpdate;
  end;
end;

procedure TFrmMain.act_Main_MoveDownExecute(Sender: TObject);
begin
  if tlData.FocusedNode = nil then
    Exit;
  if FRgSalaryBuis = nil then
    Exit;
  tlData.BeginUpdate;
  try
    FRgSalaryBuis.MoveMainRecord(tlData.FocusedNode, tlData.FocusedNode.getNextSibling, nmt_MainMoveDown);
  finally
    tlData.EndUpdate;
  end;
end;

procedure TFrmMain.act_Main_MoveDownUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (tlData.FocusedNode <> nil) and
    (tlData.FocusedNode.getNextSibling <> nil) and (tlData.SelectionCount = 1);
end;

procedure TFrmMain.act_Main_MoveUpExecute(Sender: TObject);
begin
  if tlData.FocusedNode = nil then
    Exit;
  if FRgSalaryBuis = nil then
    Exit;
  tlData.BeginUpdate;
  try
    FRgSalaryBuis.MoveMainRecord(tlData.FocusedNode, tlData.FocusedNode.getPrevSibling, nmt_MainMoveUp);
  finally
    tlData.EndUpdate;
  end;
end;

procedure TFrmMain.act_Main_MoveUpUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (tlData.FocusedNode <> nil) and
    (tlData.FocusedNode.getPrevSibling <> nil) and (tlData.SelectionCount = 1);
end;

procedure TFrmMain.act_Main_PasteExecute(Sender: TObject);
begin
  if FRgSalaryBuis = nil then
    Exit;
  if tlIndex.FocusedNode = nil then
    Exit;
  if tlIndex.FocusedNode.Level = 0 then
    Exit;
  tlData.BeginUpdate;
  try
    FRgSalaryBuis.PasteMainRecordList(tlIndex.FocusedNode, tlData.FocusedNode);
  finally
    tlData.EndUpdate;
  end;
end;

procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  if FRgSalaryBuis <> nil then
  begin
    case Application.MessageBox('是否保存？','退出', MB_YESNOCANCEL) of
      ID_YES:
        begin
          FRgSalaryBuis.SaveData;
          CanClose := True;
        end;
      ID_NO: CanClose := True;
      ID_CANCEL: Exit;
    end;
  end
  else
    CanClose := True;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  if FRgSalaryBuis <> nil then
    FreeAndNil(FRgSalaryBuis);
end;

procedure TFrmMain.btnCloseClick(Sender: TObject);
begin
  FrmMain.Close;
end;

procedure TFrmMain.btnOpenClick(Sender: TObject);
begin
  if FRgSalaryBuis <> nil then
  begin
    case Application.MessageBox('是否保存之前的工程文件？','打开文件', MB_YESNOCANCEL) of
      ID_YES:
        begin
          FRgSalaryBuis.SaveData;
        end;
      ID_CANCEL: Exit;
    end;
  end;
  with TOpenDialog.Create(nil) do
  try
    Filter := 'xml文件(*.xml)|*.xml';
    if Execute() then
    begin
      //销毁FRgSalaryBuis
      if Assigned(FRgSalaryBuis) then
      begin
        FRgSalaryBuis.Free;
        FRgSalaryBuis := nil;
      end;
      //清空目录和主界面
      if tlData.Count <> 0 then
        tlData.Clear;
      if tlIndex.Count <> 0 then
        tlIndex.Clear;

      //加载文件列表
      FRgSalaryBuis := TRgSalaryBusi.Create(FileName, tlIndex, tlData);
      FRgSalaryBuis.LoadIndexData;
      FrmMain.Caption := FileName;
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
//  SetMainColumnValue(tlData.FocusedNode, mtc_Bm);
end;

procedure TFrmMain.Col_BzPropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Bz);
end;

procedure TFrmMain.Col_GcLxNamePropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Gclx);
end;

procedure TFrmMain.Col_McPropertiesEditValueChanged(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Mc);
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

procedure TFrmMain.Col_ZyNamePropertiesCloseUp(Sender: TObject);
begin
  SetMainColumnValue(tlData.FocusedNode, mtc_Zy);
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
//  SetMainColumnValue(tlData.FocusedNode, mtc_Bm);
end;

procedure TFrmMain.cbbMainRgNamePropertiesCloseUp(Sender: TObject);
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
