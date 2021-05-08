unit uRgSalaryConfigToolConst;

interface

uses
  Classes, uSimpleXml;

const
  cst_Config_NodeName_FileList = 'FileList';
  cst_Config_NodeName_Rules = 'Rules';
  cst_Config_NodeName_BmList = 'BmList';
  cst_Config_NodeName_File = 'File';
  cst_Config_NodeName_Item = 'Item';
  cst_Config_NodeName_Items = 'Items';
  cst_Config_NodeName_FileSourcePath  = 'FileSource';
  cst_Config_Attribute_Name = 'name';
  cst_Config_Attribute_Key = 'key';
  cst_Config_Attribute_FileName = 'filename';
  cst_Config_Attribute_Index = 'index';
  cst_Config_Attribute_Guid = 'guid';
  cst_Config_Attribute_Lx = 'lx';
  cst_Config_Attribute_Mbid = 'mbid';
  cst_Config_Attribute_Bm = 'bm';
  cst_Config_Attribute_Value = 'value';
  cst_Config_Attribute_ZyMc = 'zymc';
  cst_Config_Attribute_GclxName = 'gclxname';
  cst_Config_Attribute_Bz = 'bz';
  cst_Config_Attribute_rgName = 'rgname';
  cst_Config_Attribute_rglx = 'rglx';


type
  /// <summary>
  /// 索引界面列
  /// </summary>
  TIndexTreeColumns = (itc_FileName = 0, itc_FileToken, itc_AreaToken);
  /// <summary>
  /// 数据主界面列
  /// </summary>
  TMainTreeColumns = (mtc_Bm = 0, mtc_Mc, mtc_Zy, mtc_Gclx, mtc_Price,
    mtc_Bz, mtc_AreaToken, mtc_FileToken);
  /// <summary>
  /// 节点移动类型
  /// </summary>
  TNodeMoveType = (nmt_MoveUp, nmt_MoveDown);

  /// <summary>
  /// 文件列表节点数据
  /// </summary>
  TIndexNodeItem = class
  private
    FNode: TXmlNode;
    FFileToken: string;
    FAreaToken: string;
  public
    constructor Create(AIndexNode: TXmlNode);
    destructor Destroy; override;
    procedure SetAttributeValue(AttributeName, AttributeValue: string);
    property Node: TXmlNode read FNode write FNode;
    /// <summary>
    /// 文件标识
    /// </summary>
    property FileToken: string read FFileToken write FFileToken;
    /// <summary>
    /// 地区标识
    /// </summary>
    property AreaToken: string read FAreaToken write FAreaToken;
  end;

  /// <summary>
  /// 主界面节点数据
  /// </summary>
  TMainDataNodeItem = class
  private
    FNode: TXmlNode;
    FBm: string;
    FMc: string;
    FPrice: string;
    FZy: string;
    FGcLx: string;
    FBz: string;
  public
    constructor Create(AXmlNode: TXmlNode);
    destructor Destroy; override;
    procedure SetAttributeValue(AttributeName, AttributeValue: string);
    property Bm: string read FBm write FBm;
    property Mc: string read FMc write FMc;
    property Price: string read FPrice write FPrice;
    property Zy: string read FZy write FZy;
    property GcLx: string read FGcLx write FGcLx;
    property Bz: string read FBz write FBz;
    property Node: TXmlNode read FNode write FNode;
  end;

implementation

{ TIndexNodeItem }

constructor TIndexNodeItem.Create(AIndexNode: TXmlNode);
begin
  FNode := AIndexNode;
end;

destructor TIndexNodeItem.Destroy;
begin
  
  inherited;
end;

procedure TIndexNodeItem.SetAttributeValue(AttributeName,
  AttributeValue: string);
begin
  if FNode <> nil then
  begin
    if FNode.HasAttribute(AttributeName) then
      FNode.WriteAttributeString(AttributeName, AttributeValue);
  end;
end;

{ TMainDataNodeItem }

constructor TMainDataNodeItem.Create(AXmlNode: TXmlNode);
begin
  FNode := AXmlNode;
end;

destructor TMainDataNodeItem.Destroy;
begin

  inherited;
end;

procedure TMainDataNodeItem.SetAttributeValue(AttributeName, AttributeValue:
    string);
begin
  if FNode <> nil then
  begin
    if FNode.HasAttribute(AttributeName) then
      FNode.WriteAttributeString(AttributeName, AttributeValue);
  end;
end;

end.
