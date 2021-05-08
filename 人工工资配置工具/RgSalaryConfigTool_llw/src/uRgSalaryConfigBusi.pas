unit uRgSalaryConfigBusi;

interface

uses
  uPMTreeListIntf, uSimpleXml, SysUtils, cxTL, Classes, uRgSalaryConfigToolConst,
  Generics.Collections, cxExtEditRepositoryItems, cxCheckComboBox;

type
  TRgSalaryBusi = class
  private
    FIndexTree, FMainDataTree: IPMTreeList;
    FFileName: string;
    FXmlObj: TSimpleXml;
    FRootNode, FRulesNode, FBMListNode: TXmlNode;
    FRuleXmlNodeDic: TDictionary<string, TXmlNode>;
    FRglxStrList: TStringList;
    procedure BuildMainData(AFileToken, AreaToken: string);
    procedure ClearIndexData; overload;
    procedure ClearMainData;
    procedure ClearIndexData(ANode: TcxTreeListNode); overload;
    procedure InitRules(ARuleNode: TXmlNode);
    function GetKey(AFileToken, AreaToken: string): string;
    /// <summary>
    /// 通过文件标识删除xml中Rule的子节点
    /// </summary>
    procedure DeleteRulesItemsByFileToken(AFileToken: string);
    /// <summary>
    /// 通过文件标识和地区标识删除中Rule的子节点
    /// </summary>
    procedure DeleteRulesItemsByFileAndAreaToken(AFileToken, AReaToken: string);
    procedure WriteMainNodeDefaultValue(AMainXmlNode: TXmlNode);
  public
    constructor Create(const AFileName: string; AIndexTree, AMainDataTree:
        IPMTreeList; RglxStrList: TStringList);
    destructor Destroy; override;
    procedure LoadIndexData;
    procedure ReFreshNode(AFocusedNode: TcxTreeListNode);
    procedure SaveData;
    procedure UpdateMainDataValue(ANode: TcxTreeListNode; AMainColumnLx:
        TMainTreeColumns);
    procedure UpdateIndexDataValue(ANode: TcxTreeListNode; AIndexColumnLx:
        TIndexTreeColumns);
    /// <summary>
    /// 添加文件
    /// </summary>
    procedure AddFile(AFocusedNode: TcxTreeListNode);
    /// <summary>
    /// 添加新地区
    /// </summary>
    procedure AddNewArea(AFocusedNode: TcxTreeListNode);
    /// <summary>
    /// 删除文件列表节点
    /// </summary>
    procedure DeleteIndexNode(AFocuseNode: TcxTreeListNode);
    /// <summary>
    /// 移动文件列表节点
    /// </summary>
    procedure MoveIndexNode(ASrcNode, ADstNode: TcxTreeListNode; AMoveType:
        TNodeMoveType);
    /// <summary>
    /// 添加主界面记录
    /// </summary>
    procedure AddMainRecord(AIndexNode, AMainFocusedNode: TcxTreeListNode);

  end;


implementation

uses
  Variants;

function GetMbId(AZyMc: string): string;
begin
  Result := '1';
  if SameStr(AZyMc, '建筑') then
    Result := '1'
  else if SameStr(AZyMc, '装饰') then
    Result := '2'
  else if SameStr(AZyMc, '安装') then
    Result := '3'
  else if SameStr(AZyMc, '市政') then
    Result := '4'
  else if SameStr(AZyMc, '园林') then
    Result := '5'
end;

function GetGcLx(AGcLxName: string): Integer;
begin
  Result := 0;
  if SameStr(AGcLxName, '包工包料工程') then
    Result := 0
  else if SameStr(AGcLxName, '包工不包料工程') then
    Result := 1
  else if SameStr(AGcLxName, '点工') then
    Result := 2
end;

function NewGuid: string;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := GUIDToString(Guid);
end;

{ TRgSalaryBusi }

procedure TRgSalaryBusi.AddFile(AFocusedNode: TcxTreeListNode);
var
  NewFileNode: TcxTreeListNode;
  NewIndexNodeItem: TIndexNodeItem;
  FileListNode, NewXmlNode: TXmlNode;
  sFileToken:string;
begin
  FileListNode := FRootNode.FindNode(cst_Config_NodeName_FileList);
  if FileListNode = nil then
    Exit;
  //添加xml文件节点
  NewXmlNode := FileListNode.NewNode(cst_Config_NodeName_File);
  sFileToken := NewGuid;
  NewXmlNode.WriteAttributeString(cst_Config_Attribute_Key, sFileToken);
  NewXmlNode.WriteAttributeString(cst_Config_Attribute_FileName, '');
  NewIndexNodeItem := TIndexNodeItem.Create(NewXmlNode);
  NewIndexNodeItem.FileToken := sFileToken;
  NewIndexNodeItem.AreaToken := '';
  //添加界面节点
  NewFileNode := TcxTreeListNode(FIndexTree.Add_PM);
  NewFileNode.Values[Ord(itc_FileName)] := '';
  NewFileNode.Values[Ord(itc_FileToken)] := sFileToken;
  NewFileNode.Values[Ord(itc_AreaToken)] := '';
  NewFileNode.Data := Pointer(NewIndexNodeItem);
end;

procedure TRgSalaryBusi.AddMainRecord(AIndexNode, AMainFocusedNode:
    TcxTreeListNode);
var
  IndexItem: TIndexNodeItem;
  ItemsXmlNode, NewMainXmlNode: TXmlNode;
  sFileToken, sAreaToken: string;
  FocusedMainItem, NewMainItem: TMainDataNodeItem;
  NewUiNode: TcxTreeListNode;
begin
  if AIndexNode.Data = nil then
    Exit;
  IndexItem := TIndexNodeItem(AIndexNode.Data);
  sFileToken := IndexItem.FileToken;
  sAreaToken := IndexItem.AreaToken;
  if not FRuleXmlNodeDic.ContainsKey(GetKey(sFileToken, sAreaToken)) then
    Exit;
  ItemsXmlNode := FRuleXmlNodeDic.Items[GetKey(sFileToken, sAreaToken)];
  if ItemsXmlNode = nil then
    Exit;
  //添加XMl节点
  if AMainFocusedNode = nil then
  begin
    NewMainXmlNode := ItemsXmlNode.NewNode(cst_Config_NodeName_Item);
    NewUiNode := FMainDataTree.Add_PM;
  end
  else
  begin
    if AMainFocusedNode.Data = nil then
      Exit;
    FocusedMainItem := TMainDataNodeItem(AMainFocusedNode.Data);
    NewMainXmlNode := ItemsXmlNode.NewNodeAtIndex(FocusedMainItem.Node.IndexInParent,
      cst_Config_NodeName_Item);
    NewUiNode := FMainDataTree.AddNextSibling(AMainFocusedNode);
  end;
  WriteMainNodeDefaultValue(NewMainXmlNode);
  NewMainItem := TMainDataNodeItem.Create(NewMainXmlNode);
  NewUiNode.Values[ord(mtc_AreaToken)] := sAreaToken;
  NewUiNode.Values[ord(mtc_FileToken)] := sFileToken;
  NewUiNode.Data := Pointer(NewMainItem);
end;

procedure TRgSalaryBusi.AddNewArea(AFocusedNode: TcxTreeListNode);
var
  NewFileNode: TcxTreeListNode;
  FocuseNodeItem, NewIndexNodeItem: TIndexNodeItem;
  NewXmlNode, NewItemsNode: TXmlNode;
  sAreaToken, sFileToken:string;
  bAddChild: Boolean;
begin
  if AFocusedNode.Data = nil then
    Exit;
  FocuseNodeItem := TIndexNodeItem(AFocusedNode.Data);
  if FocuseNodeItem = nil then
    Exit;
  bAddChild := FocuseNodeItem.Node.Name  = cst_Config_NodeName_File;
  //添加xml文件节点
  if bAddChild then
  begin
    sFileToken := FocuseNodeItem.Node.AttributeByName[cst_Config_Attribute_Key];
    NewXmlNode := FocuseNodeItem.Node.NewNode(cst_Config_NodeName_Item)
  end
  else
  begin
    sFileToken := FocuseNodeItem.Node.Parent.AttributeByName[cst_Config_Attribute_Key];
    NewXmlNode := FocuseNodeItem.Node.Parent.NewNodeAtIndex(FocuseNodeItem.Node.IndexInParent + 1,
      cst_Config_NodeName_Item);
  end;
  sAreaToken := NewGuid;
  NewXmlNode.WriteAttributeString(cst_Config_Attribute_Name, '');
  NewXmlNode.WriteAttributeString(cst_Config_Attribute_Guid, sAreaToken);
  NewIndexNodeItem := TIndexNodeItem.Create(NewXmlNode);
  NewIndexNodeItem.FileToken := sFileToken;
  NewIndexNodeItem.AreaToken := sAreaToken;
  //添加界面节点
  if bAddChild then
    NewFileNode := TcxTreeListNode(FIndexTree.AddChild_PM(Pointer(AFocusedNode)))
  else
    NewFileNode := TcxTreeListNode(FIndexTree.AddNextSibling(Pointer(AFocusedNode)));
  NewFileNode.Values[Ord(itc_FileName)] := '';
  NewFileNode.Values[Ord(itc_FileToken)] := sFileToken;
  NewFileNode.Values[Ord(itc_AreaToken)] := sAreaToken;
  NewFileNode.Data := Pointer(NewIndexNodeItem);
  //添加 XMl中 Rules节点
  if not FRuleXmlNodeDic.ContainsKey(GetKey(sFileToken, sAreaToken)) then
  begin
    NewItemsNode := FRulesNode.NewNode(cst_Config_NodeName_Items);
    NewItemsNode.WriteAttributeString(cst_Config_Attribute_Key, sFileToken);
    NewItemsNode.WriteAttributeString(cst_Config_Attribute_Guid, sAreaToken);
    FRuleXmlNodeDic.Add(GetKey(sFileToken, sAreaToken), NewItemsNode);
  end;
end;

procedure TRgSalaryBusi.BuildMainData(AFileToken, AreaToken: string);
var
  RuleNode, ItemsNode, ItemNode: TXmlNode;
  I: Integer;
  sFileToken, sAreaToken: string;
  J: Integer;
  NewNode: TcxTreeListNode;
  MainNodeItem: TMainDataNodeItem;
begin
  RuleNode := FRootNode.FindNode(cst_Config_NodeName_Rules);
  if RuleNode = nil then
    Exit;
  FMainDataTree.BeginUpdate_PM;
  try
    for I := 0 to RuleNode.NodeCount - 1 do
    begin
      ItemsNode := RuleNode.Nodes[I];
      sFileToken := ItemsNode.AttributeByName[cst_Config_Attribute_Key];
      sAreaToken := ItemsNode.AttributeByName[cst_Config_Attribute_Guid];
      if not SameStr(sFileToken, AFileToken) then
        Continue;
      if not SameStr(AreaToken, sAreaToken) then
        Continue;
      for J := 0 to ItemsNode.NodeCount - 1 do
      begin
        ItemNode := ItemsNode.Nodes[J];
        NewNode := TcxTreeListNode(FMainDataTree.Add_PM);
        NewNode.Values[Ord(mtc_Bm)] := ItemNode.AttributeByName[cst_Config_Attribute_Bm];
        NewNode.Values[Ord(mtc_Mc)] := ItemNode.AttributeByName[cst_Config_Attribute_rgName];
        NewNode.Values[Ord(mtc_Zy)] := ItemNode.AttributeByName[cst_Config_Attribute_ZyMc];
        NewNode.Values[Ord(mtc_Gclx)] := ItemNode.AttributeByName[cst_Config_Attribute_GclxName];
        NewNode.Values[Ord(mtc_Price)] := ItemNode.AttributeByName[cst_Config_Attribute_Value];
        NewNode.Values[Ord(mtc_Bz)] := ItemNode.AttributeByName[cst_Config_Attribute_Bz];
        NewNode.Values[Ord(mtc_AreaToken)] := sAreaToken;
        NewNode.Values[Ord(mtc_FileToken)] := sFileToken;

        MainNodeItem := TMainDataNodeItem.Create(ItemNode);
        NewNode.Data := Pointer(MainNodeItem);
      end;
    end;
  finally
    FMainDataTree.EndUpdate_PM;
  end;
end;

procedure TRgSalaryBusi.ClearIndexData;
var
  IndexNode: TcxTreeListNode;
begin
  if FIndexTree.TopNode = nil then
    Exit;
  FIndexTree.BeginUpdate_PM;
  try
    IndexNode := TcxTreeListNode(FIndexTree.TopNode);
    while IndexNode <> nil do
    begin
      if IndexNode.Data <> nil then
        TIndexNodeItem(IndexNode.Data).Free;
      IndexNode := IndexNode.GetNext;
    end;
    FIndexTree.Clear_PM;
  finally
    FIndexTree.EndUpdate_PM;
  end;
end;

constructor TRgSalaryBusi.Create(const AFileName: string; AIndexTree,
    AMainDataTree: IPMTreeList; RglxStrList: TStringList);
begin
  FFileName := AFileName;
  FIndexTree := AIndexTree;
  FMainDataTree := AMainDataTree;
  FXmlObj := TSimpleXml.Create;
  FRuleXmlNodeDic := TDictionary<string, TXmlNode>.Create;
  if Assigned(RglxStrList) then
    FRglxStrList := RglxStrList;
//  (FMainDataTree.Column[Ord(mtc_Mc)].Properties) as
end;

procedure TRgSalaryBusi.DeleteIndexNode(AFocuseNode: TcxTreeListNode);
var
  IndexNodeItem: TIndexNodeItem;
  bDeleteChild: Boolean;
  iNodeIndex: Integer;
  sFileToken, sAreaToken: string;
begin
  if AFocuseNode.Data = nil then
    Exit;
  IndexNodeItem := TIndexNodeItem(AFocuseNode.Data);
  //删除的是文件还是地区 True：删除文件及地区 False：只删除地区
  bDeleteChild := IndexNodeItem.Node.Name = cst_Config_NodeName_File;
  //删除xml <FileList>数据
  iNodeIndex := IndexNodeItem.Node.Parent.NodeIndexOf(IndexNodeItem.Node);
  IndexNodeItem.Node.Parent.DeleteNode(iNodeIndex);
  //删除xml <Rules>数据
  sFileToken := IndexNodeItem.FileToken;
  sAreaToken := IndexNodeItem.AreaToken;
  if bDeleteChild then
    DeleteRulesItemsByFileToken(sFileToken)
  else
    DeleteRulesItemsByFileAndAreaToken(sFileToken, sAreaToken);
  //清除指针数据
  ClearIndexData(AFocuseNode);
   //清除主界面数据
  ClearMainData;
  //删除界面节点
  FIndexTree.DeleteNode(Pointer(AFocuseNode));
end;

procedure TRgSalaryBusi.DeleteRulesItemsByFileAndAreaToken(AFileToken,
  AReaToken: string);
var
  iIndex: Integer;
  sKey: string;
  ItemsNode: TXmlNode;
begin
  sKey := GetKey(AFileToken, AReaToken);
  if FRuleXmlNodeDic.ContainsKey(sKey) then
  begin
    ItemsNode := FRuleXmlNodeDic.Items[sKey];
    iIndex := ItemsNode.IndexInParent;
    ItemsNode.Parent.DeleteNode(iIndex);
    FRuleXmlNodeDic.Remove(sKey);
  end;
end;

procedure TRgSalaryBusi.DeleteRulesItemsByFileToken(AFileToken: string);
var
  I, iIndex: Integer;
  ItemsNode: TXmlNode;
  sFileToken, sAreaToken: string;
begin
  if FRulesNode = nil then
    Exit;
  for I := FRulesNode.NodeCount - 1 downto 0 do
  begin
    ItemsNode := FRulesNode.Nodes[I];
    sFileToken := ItemsNode.AttributeByName[cst_Config_Attribute_Key];
    sAreaToken := ItemsNode.AttributeByName[cst_Config_Attribute_Guid];
    if SameStr(AFileToken, sFileToken) then
    begin
      iIndex := ItemsNode.IndexInParent;
      FRulesNode.DeleteNode(iIndex);
      FRuleXmlNodeDic.Remove(GetKey(sFileToken, sAreaToken));
    end;
  end;
end;

destructor TRgSalaryBusi.Destroy;
begin
  ClearIndexData;
  ClearMainData;
  FreeAndNil(FXmlObj);
  FRuleXmlNodeDic.Clear;
  FRuleXmlNodeDic.Free;
  inherited;
end;

function TRgSalaryBusi.GetKey(AFileToken, AreaToken: string): string;
begin
  Result := AFileToken + '|' + AreaToken;
end;

procedure TRgSalaryBusi.InitRules(ARuleNode: TXmlNode);
var
  I: Integer;
  ItemsNode: TXmlNode;
  sFileToken, sAreaToken: string;
begin
  if ARuleNode = nil then
    Exit;
  FRuleXmlNodeDic.Clear;
  for I := 0 to ARuleNode.NodeCount - 1 do
  begin
    ItemsNode := ARuleNode.Nodes[I];
    sFileToken := ItemsNode.AttributeByName[cst_Config_Attribute_Key];
    sAreaToken := ItemsNode.AttributeByName[cst_Config_Attribute_Guid];
    FRuleXmlNodeDic.AddOrSetValue(GetKey(sFileToken, sAreaToken), ItemsNode);
  end;
end;

procedure TRgSalaryBusi.ClearIndexData(ANode: TcxTreeListNode);
var
  I: Integer;
  ChildNode: TcxTreeListNode;
begin
  if ANode.Count > 0 then
  begin
    for I := 0 to ANode.Count - 1 do
    begin
      ChildNode := ANode.Items[I];
      ClearIndexData(ChildNode);
    end;
  end;
  if ANode.Data <> nil then
    TIndexNodeItem(ANode.Data).Free;
end;

procedure TRgSalaryBusi.ClearMainData;
var
  I: Integer;
begin
  FMainDataTree.BeginUpdate_PM;
  try
    for I := 0 to FMainDataTree.ItemCount - 1 do
    begin
      TMainDataNodeItem(TcxTreeListNode(FMainDataTree.Items[i]).Data).Free;
    end;
    FMainDataTree.Clear_PM;
  finally
    FMainDataTree.EndUpdate_PM;
  end;
end;

procedure TRgSalaryBusi.LoadIndexData;
var
  FileListNode, ChildNode, AreaNode: TXmlNode;
  I: Integer;
  cxFileNode, cxAreaNode: TcxTreeListNode;
  FileNodeItem, AreaNodeItem: TIndexNodeItem;
  J: Integer;
  sAreaName, sAreaKey: string;
  CcbItem: TcxCheckComboBoxItem;
begin
  if not FileExists(FFileName) then
    Exit;
  FXmlObj.LoadFromFile(FFileName);
  if FXmlObj.Root = nil then
    Exit;
  FRootNode := FXmlObj.Root;
  FileListNode := FRootNode.FindNode(cst_Config_NodeName_FileList);
  FRulesNode := FRootNode.FindNode(cst_Config_NodeName_Rules);
  FBMListNode := FRootNode.FindNode(cst_Config_NodeName_BmList);
  InitRules(FRulesNode);
  FIndexTree.BeginUpdate_PM;
  try
    for I := 0 to FileListNode.NodeCount - 1 do
    begin
      ChildNode := FileListNode.Nodes[I];
      cxFileNode := TcxTreeListNode(FIndexTree.Add_PM);
      cxFileNode.Values[Ord(itc_FileName)] := ChildNode.AttributeByName[cst_Config_Attribute_FileName];
      cxFileNode.Values[Ord(itc_FileToken)] := ChildNode.AttributeByName[cst_Config_Attribute_Key];
      FileNodeItem := TIndexNodeItem.Create(ChildNode);
      FileNodeItem.FileToken := ChildNode.AttributeByName[cst_Config_Attribute_Key];
      FileNodeItem.AreaToken := '';
      cxFileNode.Data := Pointer(FileNodeItem);
      if ChildNode.NodeCount > 0 then
      begin
        for J := 0 to ChildNode.NodeCount -1 do
        begin
          AreaNode := ChildNode.Nodes[J];
          sAreaName := AreaNode.AttributeByName[cst_Config_Attribute_Name];
          sAreaKey := AreaNode.AttributeByName[cst_Config_Attribute_Guid];
          cxAreaNode := TcxTreeListNode(FIndexTree.AddChild_PM(Pointer(cxFileNode)));
          cxAreaNode.Values[Ord(itc_FileName)] := sAreaName;
          //文件标识
          cxAreaNode.Values[Ord(itc_FileToken)] := ChildNode.AttributeByName[cst_Config_Attribute_Key];
          //地区标识
          cxAreaNode.Values[Ord(itc_AreaToken)] := AreaNode.AttributeByName[cst_Config_Attribute_Guid];

          AreaNodeItem := TIndexNodeItem.Create(AreaNode);
          AreaNodeItem.FileToken := ChildNode.AttributeByName[cst_Config_Attribute_Key];
          AreaNodeItem.AreaToken := AreaNode.AttributeByName[cst_Config_Attribute_Guid];
          cxAreaNode.Data := Pointer(AreaNodeItem);
        end;
      end;
    end;

    if Assigned(FRglxStrList) then
    begin
      for I := 0 to FBMListNode.NodeCount - 1 do
        FRglxStrList.Add(FBMListNode.Nodes[i].AttributeByName[cst_Config_Attribute_Name]);
    end;
  finally
    FIndexTree.ExpandAllNodes(True);
    FIndexTree.EndUpdate_PM;
  end;
end;

procedure TRgSalaryBusi.MoveIndexNode(ASrcNode, ADstNode: TcxTreeListNode;
    AMoveType: TNodeMoveType);
var
  FocuseNodeItem, PreNodeItem: TIndexNodeItem;
  ParentXmlNode, SrcXmlNode, DstXmlNode: TXmlNode;
begin
  if ASrcNode.Data = nil then
    Exit;
  if ADstNode.Data = nil then
    Exit;
  FocuseNodeItem := TIndexNodeItem(ASrcNode.Data);
  PreNodeItem := TIndexNodeItem(ADstNode.Data);
  SrcXmlNode := FocuseNodeItem.Node;
  DstXmlNode := PreNodeItem.Node;
  ParentXmlNode := SrcXmlNode.Parent;
  if (SrcXmlNode= nil) or (DstXmlNode= nil) or (ParentXmlNode= nil) then
    Exit;
  //xml节点移动
  ParentXmlNode.ExchangeNode(SrcXmlNode.IndexInParent, DstXmlNode.IndexInParent);
  //界面节点移动
  case AMoveType of
    nmt_MoveUp: FIndexTree.MoveUp(ASrcNode);
    nmt_MoveDown: FIndexTree.MoveDown(ASrcNode);
  end;
end;

procedure TRgSalaryBusi.ReFreshNode(AFocusedNode: TcxTreeListNode);
var
  NodeItem: TIndexNodeItem;
  I: Integer;
  sFileToken, sAreaToken: string;
begin
  ClearMainData;
  sFileToken := VarToStrDef(AFocusedNode.Values[Ord(itc_FileToken)], '');
  sAreaToken := VarToStrDef(AFocusedNode.Values[Ord(itc_AreaToken)], '');
  if (sFileToken = '') or (sAreaToken = '') then
    Exit;
  BuildMainData(sFileToken, sAreaToken);
end;

procedure TRgSalaryBusi.SaveData;
begin
  if Assigned(FXmlObj) then
    FXmlObj.SaveToFile(FFileName);
end;

procedure TRgSalaryBusi.UpdateIndexDataValue(ANode: TcxTreeListNode;
    AIndexColumnLx: TIndexTreeColumns);
var
  IndexItem: TIndexNodeItem;
  sBz, sValue, sAttributeName: string;
begin
  if ANode.Data = nil then
    Exit;
  IndexItem := TIndexNodeItem(ANode.Data);
  if IndexItem = nil then
    Exit;
  sValue := VarToStr(ANode.Values[Ord(AIndexColumnLx)]);
  if ANode.Level = 0 then
    sAttributeName := cst_Config_Attribute_FileName
  else
    sAttributeName := cst_Config_Attribute_Name;
  
  case AIndexColumnLx of
    itc_FileName:
        IndexItem.SetAttributeValue(sAttributeName, sValue);
  end;
end;

procedure TRgSalaryBusi.UpdateMainDataValue(ANode: TcxTreeListNode;
    AMainColumnLx: TMainTreeColumns);
var
  MainItem: TMainDataNodeItem;
  sBz, sValue, sAttributeName: string;
begin
  if ANode.Data = nil then
    Exit;
  MainItem := TMainDataNodeItem(ANode.Data);
  if MainItem = nil then
    Exit;
  sValue := VarToStr(ANode.Values[Ord(AMainColumnLx)]);
  case AMainColumnLx of
    mtc_Bm:
        MainItem.SetAttributeValue(cst_Config_Attribute_Bm, sValue);
    mtc_Mc:
        MainItem.SetAttributeValue(cst_Config_Attribute_Name, sValue);
    mtc_Zy:
      begin
        MainItem.SetAttributeValue(cst_Config_Attribute_ZyMc, sValue);
        MainItem.SetAttributeValue(cst_Config_Attribute_Mbid, GetMbId(sValue));
      end;
    mtc_Gclx:
      begin
        MainItem.SetAttributeValue(cst_Config_Attribute_GclxName, sValue);
        MainItem.SetAttributeValue(cst_Config_Attribute_Lx, IntToStr(GetGcLx(sValue)));
      end;
    mtc_Price:
      MainItem.SetAttributeValue(cst_Config_Attribute_Value, sValue);
    mtc_Bz:
        MainItem.SetAttributeValue(cst_Config_Attribute_Bz, sValue);
  end;
end;

procedure TRgSalaryBusi.WriteMainNodeDefaultValue(AMainXmlNode: TXmlNode);
begin
  //lx
  AMainXmlNode.WriteAttributeString(cst_Config_Attribute_Lx, '');
  //gclxname
  AMainXmlNode.WriteAttributeString(cst_Config_Attribute_GclxName, '');
  //mbid
  AMainXmlNode.WriteAttributeString(cst_Config_Attribute_Mbid, '');
  //zymc
  AMainXmlNode.WriteAttributeString(cst_Config_Attribute_ZyMc, '');
  //bm
  AMainXmlNode.WriteAttributeString(cst_Config_Attribute_Bm, '');
  //name
  AMainXmlNode.WriteAttributeString(cst_Config_Attribute_Name, '');
  //value
  AMainXmlNode.WriteAttributeString(cst_Config_Attribute_Value, '');
  //bz
  AMainXmlNode.WriteAttributeString(cst_Config_Attribute_Bz, '');
end;

end.
