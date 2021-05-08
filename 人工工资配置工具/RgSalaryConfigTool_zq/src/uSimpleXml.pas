// This is SimpleXml-NativeXml wrapper
// It creates a full functional wrapper from obsolete simplexml to other xml parser.
unit uSimpleXml;

interface

uses
  Windows, Classes, Graphics, SysUtils, NativeXml, Generics.Collections;

type
  TXmlElementType = NativeXml.TsdElementType;
  TBinaryEncodingType = NativeXml.TsdBinaryEncoding;
  TStringEncodingType =(
    seAnsi,      // Ansi encoding, e.g. "Windows-1252" or other codepage (1 byte per character)
    seUTF8,      // utf-8 (1, 2, 3 or 4 bytes per character)
    seUTF16BE,   // utf-16 Big Endian (2 or 4 bytes per character)
    seUTF16LE,   // utf-16 Little Endian (2 or 4  bytes per character)
    seUTF32BE,   // ucs-4 Big Endian (4 bytes per character)
    seUTF32LE,   // ucs-4 Little Endian (4 bytes per character)
    seUCS4_2143, // ucs-4 unusual octet order - 2143 (4 bytes per character)
    seUCS4_3412, // ucs-4 unusual octet order - 3412 (4 bytes per character)
    seEBCDIC,     // Extended Binary Coded Decimal Interchange Code (1 byte per character)
    se8bit = 0
  );
  TPointer = Pointer;

type
  TSimpleXml = class;
  TXmlNode = class;
  TNativeXmlNode = NativeXml.TXmlNode; // 定义别名，方便区分使用。
  TNativeXmlNodeAccess = class(TNativeXmlNode);

  TXmlNodeEvent = procedure(Sender: TObject; Node: TXmlNode) of object;
  TXmlProgressEvent = procedure(Sender: TObject; Size: integer) of object;
  TXmlNodeCompareEvent = function(Sender: TObject; Node1, Node2: TXmlNode;
    Info: TPointer): integer of object;
  TXMLNodeCompareFunction = function(Node1, Node2: TXmlNode;
    Info: TPointer): integer;

  TNodeMap = TDictionary<TNativeXmlNode, TXmlNode>;

  TNodePool = class
  private
  var
    FNodePool: TNodeMap;
    FOwner: TSimpleXml;
  protected
    function XmlNodeFromNative(NativeNode: TNativeXmlNode): TXmlNode;
    procedure Add(ANode: TXmlNode);
    procedure Remove(ANode: TXmlNode);
    procedure FreeNode(ANode: TXmlNode);
    procedure Clear;
    constructor Create(Owner: TSimpleXml);
    destructor Destroy; override;
  end;

  TXmlNode = class(TPersistent)
  private
    FNode: TNativeXmlNode;
    FOwner: TSimpleXml;
    FbEscapeString: Boolean;
    FValue: string;
    // functions to filter unused subnode count such as attribute node.
    function FilteredCount(Index: integer): integer;
    function UnfilteredCount(Index: integer): integer;

    constructor Create(NativeNode: TNativeXmlNode; Owner: TSimpleXml); overload;

    function GetAttributeByName(const AName: string): string;
    function GetAttributeByNameWide(const AName: string): widestring;
    function GetAttributeCount: integer;
    function GetAttributeName(Index: integer): string;
    function GetAttributePair(Index: integer): string;
    function GetAttributeValue(Index: integer): string;
    function GetAttributeValueAsInteger(Index: integer): integer;
    function GetAttributeValueAsWidestring(Index: integer): widestring;
    function GetBinaryEncoding: TBinaryEncodingType;
    function GetBinaryString: string;
    function GetCascadedName: string;
    function GetFullPath: string;
    function GetNextSibling: TXmlNode;
    function GetNodeCount: integer;
    function GetNodes(Index: integer): TXmlNode;
    function GetPriorSibling: TXmlNode;
    function GetTotalNodeCount: integer;
    function GetTreeDepth: integer;
    function GetValueAsBool: Boolean;
    function GetValueAsDateTime: TDateTime;
    function GetValueAsFloat: double;
    function GetValueAsInt64: int64;
    function GetValueAsInteger: integer;
    function GetValueAsString: string;
    function GetValueAsWidestring: widestring;
    function GetWriteOnDefault: Boolean;
    procedure SetAttributeByName(const AName, Value: string);
    procedure SetAttributeByNameWide(const AName: string;
      const Value: widestring);
    procedure SetAttributeName(Index: integer; const Value: string);
    procedure SetAttributeValue(Index: integer; const Value: string);
    procedure SetAttributeValueAsInteger(Index: integer; const Value: integer);
    procedure SetAttributeValueAsWidestring(Index: integer;
      const Value: widestring);
    procedure SetBinaryEncoding(const Value: TBinaryEncodingType);
    procedure SetBinaryString(const Value: string);
    procedure SetName(const Value: string);
    procedure SetValueAsBool(const Value: Boolean);
    procedure SetValueAsDateTime(const Value: TDateTime);
    procedure SetValueAsFloat(const Value: double);
    procedure SetValueAsInt64(const Value: int64);
    procedure SetValueAsInteger(const Value: integer);
    procedure SetValueAsString(const Value: string);
    procedure SetValueAsWidestring(const Value: widestring);

    function GetName: string;
    function GetDocument: TSimpleXml;
    function GetElementType: TXmlElementType;
    function GetParent: TXmlNode;
    function GetTag: integer;
    procedure SetDocument(const Value: TSimpleXml);
    procedure SetElementType(const Value: TXmlElementType);
    procedure SetParent(const Value: TXmlNode);
    procedure SetTag(const Value: integer);

    function OnCompareNodeWrapper(Node1, Node2: TNativeXmlNode): integer;

    function NativeToSimple(ANativeNode: TNativeXmlNode): TXmlNode;
  public
    constructor Create(ADocument: TSimpleXml); overload; virtual;
    constructor Create(ADocument: TSimpleXml; const AName: string);
      overload; virtual;
    constructor Create(ADocument: TSimpleXml; const AName, AValue: string);
      overload; virtual;
    constructor CreateType(ADocument: TSimpleXml;
      AType: TXmlElementType); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure Delete; virtual;
    procedure DeleteEmptyNodes;
    destructor Destroy; override;

    procedure AddAttribute(const AName: string; AValue: integer); overload;
    procedure AddAttribute(const AName, AValue: string); overload;
    procedure DeleteAttribute(Index: integer);
    procedure ExchangeAttribute(Index1, Index2: integer);
    function AttributeIndexByname(const AName: string): integer;
    procedure ClearAttributes; virtual;
    procedure BufferRead(var Buffer; Count: integer); virtual;
    procedure BufferWrite(const Buffer; Count: integer); virtual;
    function BufferLength: integer; virtual;
    procedure Clear; virtual;
    function FindNode(const NodeName: string): TXmlNode;
    procedure FindNodes(const NodeName: string; const AList: TList);
    function FromAnsiString(const s: string): string;
    function FromWidestring(const W: widestring): string;
    function HasAttribute(const AName: string): Boolean; virtual;
    function IndexInParent: integer;
    function IsClear: Boolean; virtual;
    function IsEmpty: Boolean; virtual;
    function IsEqualTo(ANode: TXmlNode; Options: TXmlCompareOptions;
      MismatchNodes: TList = nil): Boolean;
    function AddNode(ANode: TXmlNode): integer; virtual;
    function NodeByAttributeValue(const NodeName, AttribName,
      AttribValue: string; ShouldRecurse: Boolean = True): TXmlNode;
    function NodeByElementType(ElementType: TXmlElementType): TXmlNode;
    function NodeByName(const AName: string): TXmlNode; virtual;
    procedure DeleteNode(Index: integer); virtual;
    procedure ExchangeNode(Index1, Index2: integer);
    function ExtractNode(ANode: TXmlNode): TXmlNode; virtual;
    function NodeFindOrCreate(const AName: string): TXmlNode; virtual;
    function NodeIndexByName(const AName: string): integer; virtual;
    function NodeIndexByNameFrom(const AName: string; AFrom: integer)
      : integer; virtual;
    function NodeIndexOf(ANode: TXmlNode): integer;
    procedure InsertNode(Index: integer; ANode: TXmlNode); virtual;
    function NewNode(const AName: string): TXmlNode; virtual;
    function NewNodeAtIndex(Index: integer; const AName: string)
      : TXmlNode; virtual;
    function RemoveNode(ANode: TXmlNode): integer;
    procedure ClearNodes; virtual;
    procedure NodesByName(const AName: string; const AList: TList);
    function ReadAttributeBool(const AName: string; ADefault: Boolean = False)
      : Boolean; virtual;
    function ReadAttributeInteger(const AName: string; ADefault: integer = 0)
      : integer; virtual;
    function ReadAttributeInt64(const AName: string; ADefault: int64 = 0)
      : int64; virtual;
    function ReadAttributeFloat(const AName: string;
      ADefault: double = 0): double;
    function ReadAttributeString(const AName: string;
      const ADefault: string = ''): string; virtual;
    function ReadBool(const AName: string; ADefault: Boolean = False)
      : Boolean; virtual;
{$IFDEF USEGRAPHICS}
    procedure ReadBrush(const AName: string; ABrush: TBrush); virtual;
    function ReadColor(const AName: string; ADefault: TColor = clBlack)
      : TColor; virtual;
    procedure ReadFont(const AName: string; AFont: TFont); virtual;
    procedure ReadPen(const AName: string; APen: TPen); virtual;
{$ENDIF}
    function ReadDateTime(const AName: string; ADefault: TDateTime = 0)
      : TDateTime; virtual;
    function ReadFloat(const AName: string; ADefault: double = 0.0)
      : double; virtual;
    function ReadInt64(const AName: string; ADefault: int64 = 0)
      : int64; virtual;
    function ReadInteger(const AName: string; ADefault: integer = 0)
      : integer; virtual;
    function ReadString(const AName: string; const ADefault: string = '')
      : string; virtual;
    function ReadWidestring(const AName: string;
      const ADefault: widestring = ''): widestring; virtual;
    procedure SortChildNodes(Compare: TXMLNodeCompareFunction = nil;
      Info: TPointer = nil);
    function ToAnsiString(const s: string): string;
    function ToWidestring(const s: string): widestring;
    function ValueAsBoolDef(ADefault: Boolean): Boolean; virtual;
    function ValueAsDateTimeDef(ADefault: TDateTime): TDateTime; virtual;
    function ValueAsFloatDef(ADefault: double): double; virtual;
    function ValueAsInt64Def(ADefault: int64): int64; virtual;
    function ValueAsIntegerDef(ADefault: integer): integer; virtual;
    procedure WriteAttributeBool(const AName: string; AValue: Boolean;
      ADefault: Boolean = False); virtual;
    procedure WriteAttributeInteger(const AName: string; AValue: integer;
      ADefault: integer = 0); virtual;
    procedure WriteAttributeFloat(const AName: string; AValue: double;
      ADefault: double = 0); virtual;
    procedure WriteAttributeString(const AName: string; const AValue: string;
      const ADefault: string = ''); virtual;
    procedure WriteBool(const AName: string; AValue: Boolean;
      ADefault: Boolean = False); virtual;
{$IFDEF USEGRAPHICS}
    procedure WriteBrush(const AName: string; ABrush: TBrush); virtual;
    procedure WriteColor(const AName: string; AValue: TColor;
      ADefault: TColor = clBlack); virtual;
    procedure WriteFont(const AName: string; AFont: TFont); virtual;
    procedure WritePen(const AName: string; APen: TPen); virtual;
{$ENDIF}
    procedure WriteDateTime(const AName: string; AValue: TDateTime;
      ADefault: TDateTime = 0); virtual;
    procedure WriteFloat(const AName: string; AValue: double;
      ADefault: double = 0.0); virtual;
    procedure WriteHex(const AName: string; AValue: integer; Digits: integer;
      ADefault: integer = 0); virtual;
    procedure WriteInt64(const AName: string; AValue: int64;
      ADefault: int64 = 0); virtual;
    procedure WriteInteger(const AName: string; AValue: integer;
      ADefault: integer = 0); virtual;
    procedure WriteString(const AName, AValue: string;
      const ADefault: string = ''); virtual;
    function WriteToString: string; virtual;
    procedure WriteWidestring(const AName: string; const AValue: widestring;
      const ADefault: widestring = ''); virtual;
    property AttributeByName[const AName: string]: string
      read GetAttributeByName write SetAttributeByName;
    property AttributeByNameWide[const AName: string]: widestring
      read GetAttributeByNameWide write SetAttributeByNameWide;
    property AttributeCount: integer read GetAttributeCount;
    property AttributeName[Index: integer]: string read GetAttributeName
      write SetAttributeName;
    property AttributePair[Index: integer]: string read GetAttributePair;
    property AttributeValue[Index: integer]: string read GetAttributeValue
      write SetAttributeValue;
    property AttributeValueAsWidestring[Index: integer]: widestring
      read GetAttributeValueAsWidestring write SetAttributeValueAsWidestring;
    property AttributeValueAsInteger[Index: integer]: integer
      read GetAttributeValueAsInteger write SetAttributeValueAsInteger;
    property BinaryEncoding: TBinaryEncodingType read GetBinaryEncoding
      write SetBinaryEncoding;
    property BinaryString: string read GetBinaryString write SetBinaryString;
    property CascadedName: string read GetCascadedName;
    property Document: TSimpleXml read GetDocument write SetDocument;
    property ElementType: TXmlElementType read GetElementType
      write SetElementType;
    property FullPath: string read GetFullPath;
    property Name: string read GetName write SetName;
    property Parent: TXmlNode read GetParent write SetParent;
    property NodeCount: integer read GetNodeCount;
    property Nodes[Index: integer]: TXmlNode read GetNodes; default;
    property Tag: integer read GetTag write SetTag;
    property TotalNodeCount: integer read GetTotalNodeCount;
    property TreeDepth: integer read GetTreeDepth;
    property ValueAsBool: Boolean read GetValueAsBool write SetValueAsBool;
    property ValueAsDateTime: TDateTime read GetValueAsDateTime
      write SetValueAsDateTime;
    property ValueAsInt64: int64 read GetValueAsInt64 write SetValueAsInt64;
    property ValueAsInteger: integer read GetValueAsInteger
      write SetValueAsInteger;
    property ValueAsFloat: double read GetValueAsFloat write SetValueAsFloat;
    property ValueAsString: string read GetValueAsString write SetValueAsString;
    property ValueAsWidestring: widestring read GetValueAsWidestring
      write SetValueAsWidestring;
    property ValueDirect: string read FValue write FValue;
    property WriteOnDefault: Boolean read GetWriteOnDefault;
    property NextSibling: TXmlNode read GetNextSibling;
    property PriorSibling: TXmlNode read GetPriorSibling;

    property bEscapeString: Boolean read FbEscapeString write FbEscapeString;
  end;

  TSimpleXml = class(TPersistent)
  private
    FXml: TNativeXml;
    FParserWarnings: Boolean;
    FOnCompareNode: TXmlNodeCompareEvent;
    FOnLoadedNode: TXmlNodeEvent;
    FDropCommentsOnParse: Boolean;
    FOnUnicodeLoss: TNotifyEvent;
    FAbortParsing: Boolean;
    FXmlFormat: TXmlFormatType;
    FUseFullNodes: Boolean;
    FSortAttributes: Boolean;
    FOnNewNode: TXmlNodeEvent;
    FFloatAllowScientific: Boolean;
    FWriteOnDefault: Boolean;
    FFloatSignificantDigits: integer;
    FRootNodes: TXmlNode;
    FBinaryEncoding: TBinaryEncodingType;
    FOnProgress: TXmlProgressEvent;
    FIndentString: string;
    FNodePool: TNodePool;

    function GetCommentString: string;
    procedure SetCommentString(const Value: string);
    function GetEntityByName(AName: string): string;
    function GetRoot: TXmlNode;
    function GetEncodingString: string;
    procedure SetEncodingString(const Value: string);
    function GetExternalCodepage: Integer;
    procedure SetExternalCodepage(const Value: integer);
    function GetVersionString: string;
    procedure SetVersionString(const Value: string);
    function GetStyleSheetNode: TXmlNode;
    // functions to manager wrapper node
    function NewOrGetNode(ANode: TNativeXmlNode): TXmlNode;
    procedure ManagedNodeRemove(ANode: TXmlNode);
    // make a wrapper node managed by this document.
    procedure ManagedNodeAdd(ANode: TXmlNode);
    // Unmanage a node, thus, the creator need to destroy it manually

    // functions to manipulate wrapper node.
    procedure OnNodeNewWrapper(Sender: TObject; ANode: TNativeXmlNode);
    procedure OnNodeLoadWrapper(Sender: TObject; ANode: TNativeXmlNode);
    procedure OnXmlProgressEventWrapper(Sender: TObject; Position: int64);
    procedure InitWrapperFunctions();

    function GetExternalEncoding: TStringEncodingType;
    procedure SetExternalEncoding(const Value: TStringEncodingType);
    function GetUtf8Encoded: Boolean;
    procedure SetUtf8Encoded(const Value: Boolean);
  public
    constructor Create; virtual;
    constructor CreateName(const ARootName: string); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear; virtual;
    function IsEmpty: Boolean; virtual;
    procedure LoadFromStream(Stream: TStream); virtual;
    procedure LoadFromFile(const FileName: string); virtual;
    procedure ReadFromString(const AValue: string); virtual;
    procedure ResolveEntityReferences;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure SaveToFile(const FileName: string); virtual;
    function WriteToString: string; virtual;
    property AbortParsing: Boolean read FAbortParsing write FAbortParsing;
    property BinaryEncoding: TBinaryEncodingType read FBinaryEncoding
      write FBinaryEncoding;
    property CommentString: string read GetCommentString write SetCommentString;
    property DropCommentsOnParse: Boolean read FDropCommentsOnParse
      write FDropCommentsOnParse;
    property EncodingString: string read GetEncodingString
      write SetEncodingString;
    property ExternalCodepage: Integer read GetExternalCodepage
      write SetExternalCodepage;
    property EntityByName[AName: string]: string read GetEntityByName;
    property ExternalEncoding: TStringEncodingType read GetExternalEncoding
      write SetExternalEncoding;
    property FloatAllowScientific: Boolean read FFloatAllowScientific
      write FFloatAllowScientific;
    property FloatSignificantDigits: integer read FFloatSignificantDigits
      write FFloatSignificantDigits;
    property IndentString: string read FIndentString write FIndentString;
    property Root: TXmlNode read GetRoot;
    property RootNodeList: TXmlNode read FRootNodes;
    property StyleSheetNode: TXmlNode read GetStyleSheetNode;
    property UseFullNodes: Boolean read FUseFullNodes write FUseFullNodes;
    property Utf8Encoded: Boolean read GetUtf8Encoded write SetUtf8Encoded;
    property VersionString: string read GetVersionString write SetVersionString;
    property WriteOnDefault: Boolean read FWriteOnDefault write FWriteOnDefault;
    property XmlFormat: TXmlFormatType read FXmlFormat write FXmlFormat;
    property ParserWarnings: Boolean read FParserWarnings write FParserWarnings;
    property SortAttributes: Boolean read FSortAttributes write FSortAttributes;
    property OnCompareNode: TXmlNodeCompareEvent read FOnCompareNode
      write FOnCompareNode;
    property OnNewNode: TXmlNodeEvent read FOnNewNode write FOnNewNode;
    property OnLoadedNode: TXmlNodeEvent read FOnLoadedNode write FOnLoadedNode;
    property OnProgress: TXmlProgressEvent read FOnProgress write FOnProgress;
    property OnUnicodeLoss: TNotifyEvent read FOnUnicodeLoss
      write FOnUnicodeLoss;
  end;

implementation

{ TXmlNode }

procedure TXmlNode.AddAttribute(const AName, AValue: string);
begin
  FNode.AttributeAdd(AName, AValue);
end;

procedure TXmlNode.AddAttribute(const AName: string; AValue: integer);
begin
  Self.AddAttribute(AName, IntToStr(AValue));
end;

function TXmlNode.AddNode(ANode: TXmlNode): integer;
begin
  FNode.NodeAdd(ANode.FNode);
end;

procedure TXmlNode.Assign(Source: TPersistent);
begin
  inherited;
  FNode.Assign(Source);
end;

function TXmlNode.AttributeIndexByname(const AName: string): integer;
begin
  Result := FNode.AttributeIndexByname(AName);
end;

function TXmlNode.BufferLength: integer;
begin
  Result := FNode.BufferLength;
end;

procedure TXmlNode.BufferRead(var Buffer; Count: integer);
begin
  FNode.BufferRead(Buffer, Count);
end;

procedure TXmlNode.BufferWrite(const Buffer; Count: integer);
begin
  FNode.BufferWrite(Buffer, Count);
end;

procedure TXmlNode.Clear;
begin
  FNode.Clear;
end;

procedure TXmlNode.ClearAttributes;
begin
  FNode.AttributesClear;
end;

procedure TXmlNode.ClearNodes;
begin
  FNode.NodesClear;
end;

constructor TXmlNode.Create(ADocument: TSimpleXml);
begin
  inherited Create();
  FNode := TNativeXmlNode.CreateParent(ADocument.FXml, nil);
end;

constructor TXmlNode.Create(ADocument: TSimpleXml; const AName: string);
begin
  Create(ADocument);
  FNode.Name := AName;
end;

constructor TXmlNode.Create(ADocument: TSimpleXml; const AName, AValue: string);
begin
  Create(ADocument, AName);
  FNode.Value := AValue;
end;

constructor TXmlNode.Create(NativeNode: TNativeXmlNode; Owner: TSimpleXml);
begin
  inherited Create();
  FNode := NativeNode;
  FOwner := Owner;
end;

procedure TXmlNode.Delete;
begin
  FNode.Delete;
  // Todo: Delete wrapper node itself.
end;

procedure TXmlNode.DeleteAttribute(Index: integer);
begin
  FNode.AttributeDelete(Index);
end;

procedure TXmlNode.DeleteEmptyNodes;
begin
  FNode.DeleteEmptyNodes;
end;

procedure TXmlNode.DeleteNode(Index: integer);
begin
  FNode.NodeDelete(UnfilteredCount(Index));
  // todo: delete correspoding wrapper node from parent's pool.
end;

destructor TXmlNode.Destroy;
begin
  if not Assigned(FOwner) then // Unmanaged TNativeXml Node;
    FNode.Free;
  inherited;
end;

procedure TXmlNode.ExchangeAttribute(Index1, Index2: integer);
begin
  // Todo:
end;

procedure TXmlNode.ExchangeNode(Index1, Index2: integer);
begin
  FNode.NodeExchange(UnFilteredCount(Index1), UnFilteredCount(Index2));
end;

function TXmlNode.ExtractNode(ANode: TXmlNode): TXmlNode;
begin
  Result := NativeToSimple(FNode.NodeExtract(ANode.FNode));
end;

function TXmlNode.FilteredCount(Index: integer): integer;
begin
  if Index >= FNode.AttributeCount then
    Result := Index - FNode.AttributeCount
  else
    Result := Index;
end;

function TXmlNode.FindNode(const NodeName: string): TXmlNode;
begin
  Result := NativeToSimple(FNode.FindNode(NodeName));
end;

procedure TXmlNode.FindNodes(const NodeName: string; const AList: TList);
var
  I: integer;
begin
  FNode.FindNodes(NodeName, AList);
  for I := 0 to AList.Count - 1 do
    AList.Items[I] := NativeToSimple(TNativeXmlNode(AList.Items[I]));
end;

function TXmlNode.FromAnsiString(const s: string): string;
begin
  // Todo:
  // FNode.Utf8ToWide()
end;

function TXmlNode.FromWidestring(const W: widestring): string;
begin
  // Todo:
end;

function TXmlNode.GetAttributeByName(const AName: string): string;
begin
  Result := FNode.AttributeValueByName[AName];
end;

function TXmlNode.GetAttributeByNameWide(const AName: string): widestring;
begin
  Result := FNode.AttributeValueByNameWide[AName];
end;

function TXmlNode.GetAttributeCount: integer;
begin
  Result := FNode.AttributeCount;
end;

function TXmlNode.GetAttributeName(Index: integer): string;
begin
  Result := FNode.AttributeName[Index];
end;

function TXmlNode.GetAttributePair(Index: integer): string;
begin
  Result := FNode.Attributes[Index].Content;
end;

function TXmlNode.GetAttributeValue(Index: integer): string;
begin
  Result := FNode.AttributeValue[Index];
end;

function TXmlNode.GetAttributeValueAsInteger(Index: integer): integer;
begin
  Result := FNode.AttributeValueAsInteger[Index];
end;

function TXmlNode.GetAttributeValueAsWidestring(Index: integer): widestring;
begin
  // Todo: check implemetation later.
  Result := FNode.AttributeValueByNameWide[GetAttributeName(Index)];
end;

function TXmlNode.GetBinaryEncoding: TBinaryEncodingType;
begin
  // Todo:
end;

function TXmlNode.GetBinaryString: string;
begin
  Result := FNode.BinaryString;
end;

function TXmlNode.GetCascadedName: string;
var
  AName: string;
begin
  // Implementation from original simplexml.
  AName := Format('%s%.4d', [Name, StrToIntDef(AttributeByName['Index'], 0)]);
  if Assigned(Parent) then
    Result := Format('%s_%s', [Parent.CascadedName, AName])
  else
    Result := AName;
end;

function TXmlNode.GetDocument: TSimpleXml;
begin
end;

function TXmlNode.GetElementType: TXmlElementType;
begin
  Result := FNode.ElementType;
end;

function TXmlNode.GetFullPath: string;
begin
  Result := FNode.FullPath;
end;

function TXmlNode.GetName: string;
begin
  Result := FNode.Name;
end;

function TXmlNode.GetNextSibling: TXmlNode;
begin
  Result := NativeToSimple(FNode.NextSibling(FNode));
end;

function TXmlNode.GetNodeCount: integer;
begin
  Result := FilteredCount(FNode.NodeCount);
end;

function TXmlNode.GetNodes(Index: integer): TXmlNode;
begin
  Result := NativeToSimple(FNode.Nodes[UnfilteredCount(Index)]);
end;

function TXmlNode.GetParent: TXmlNode;
begin
  Result := NativeToSimple(FNode.Parent);
end;

function TXmlNode.GetPriorSibling: TXmlNode;
begin
  // Todo:
end;

function TXmlNode.GetTag: integer;
begin

end;

function TXmlNode.GetTotalNodeCount: integer;
var
  I: integer;
begin
  Result := NodeCount;
  for I := 0 to NodeCount - 1 do
    inc(Result, Nodes[I].TotalNodeCount);
end;

function TXmlNode.GetTreeDepth: integer;
begin
  Result := FNode.TreeDepth;
end;

function TXmlNode.GetValueAsBool: Boolean;
begin
  Result := FNode.ValueAsBool;
end;

function TXmlNode.GetValueAsDateTime: TDateTime;
begin
  Result := FNode.ValueAsDateTime;
end;

function TXmlNode.GetValueAsFloat: double;
begin
  Result := FNode.ValueAsFloat;
end;

function TXmlNode.GetValueAsInt64: int64;
begin
  Result := FNode.ValueAsInt64;
end;

function TXmlNode.GetValueAsInteger: integer;
begin
  Result := FNode.ValueAsInteger;
end;

function TXmlNode.GetValueAsString: string;
begin
  Result := FNode.Value;
end;

function TXmlNode.GetValueAsWidestring: widestring;
begin
  Result := FNode.ValueUnicode;
end;

function TXmlNode.GetWriteOnDefault: Boolean;
begin
  // Todo ???
end;

function TXmlNode.HasAttribute(const AName: string): Boolean;
begin
  Result := FNode.HasAttribute(AName);
end;

function TXmlNode.IndexInParent: integer;
begin
  if Assigned(Parent) then
    Result := Parent.FilteredCount(FNode.IndexInParent)
  else
    Result := FNode.IndexInParent;
end;

procedure TXmlNode.InsertNode(Index: integer; ANode: TXmlNode);
begin
  FNode.NodeInsert(UnfilteredCount(Index), ANode.FNode);
end;

function TXmlNode.IsClear: Boolean;
begin
  Result := FNode.IsClear;
end;

function TXmlNode.IsEmpty: Boolean;
begin
  Result := FNode.IsEmpty;
end;

function TXmlNode.IsEqualTo(ANode: TXmlNode; Options: TXmlCompareOptions;
  MismatchNodes: TList): Boolean;
var
  wrapperList: TList;
  I: integer;
begin
  wrapperList := TList.Create; // create wrapper list
  for I := 0 to MismatchNodes.Count - 1 do
    wrapperList.Add(TXmlNode(MismatchNodes[I]).FNode);
  Result := FNode.IsEqualTo(ANode.FNode, Options, wrapperList);
  wrapperList.Free;
end;

function TXmlNode.NativeToSimple(ANativeNode: TNativeXmlNode): TXmlNode;
begin
  if Assigned(FOwner) then
    Result := FOwner.NewOrGetNode(ANativeNode)
  else
    Result := TXmlNode.Create(ANativeNode, nil);
end;

function TXmlNode.NewNode(const AName: string): TXmlNode;
begin
  Result := NativeToSimple(FNode.NodeNew(AName));
end;

function TXmlNode.NewNodeAtIndex(Index: integer; const AName: string): TXmlNode;
begin
  Result := NativeToSimple(FNode.NodeNewAtIndex(UnFilteredCount(Index), AName));
end;

function TXmlNode.NodeByAttributeValue(const NodeName, AttribName,
  AttribValue: string; ShouldRecurse: Boolean): TXmlNode;
begin
  Result := NativeToSimple(FNode.NodeByAttributeValue(NodeName, AttribName,
    AttribValue, ShouldRecurse));
end;

function TXmlNode.NodeByElementType(ElementType: TXmlElementType): TXmlNode;
begin
  Result := NativeToSimple(FNode.FirstNodeByType(ElementType));
end;

function TXmlNode.NodeByName(const AName: string): TXmlNode;
begin
  Result := NativeToSimple(FNode.NodeByName(AName));
end;

function TXmlNode.NodeFindOrCreate(const AName: string): TXmlNode;
begin
  Result := NativeToSimple(FNode.NodeFindOrCreate(AName));
end;

function TXmlNode.NodeIndexByName(const AName: string): integer;
var
  ANode: TNativeXmlNode;
begin
  ANode := FNode.NodeByName(AName);
  if ANode <> nil then
    Result := FilteredCount(FNode.NodeIndexOf(ANode))
  else
    Result := -1;
end;

function TXmlNode.NodeIndexByNameFrom(const AName: string;
  AFrom: integer): integer;
begin
  // uSimpleXml implementation.
  Result := UnfilteredCount(AFrom);
  while Result < NodeCount do
  begin
    if AnsiCompareText(Nodes[Result].Name, AName) = 0 then
      exit;
    inc(Result);
  end;
  Result := FilteredCount(Result);
  if Result = NodeCount then
    Result := -1;
end;

function TXmlNode.NodeIndexOf(ANode: TXmlNode): integer;
begin
  Result := FilteredCount(FNode.NodeIndexOf(ANode.FNode));
end;

procedure TXmlNode.NodesByName(const AName: string; const AList: TList);
var
  I: integer;
begin
  FNode.NodesByName(AName, AList);
  for I := 0 to AList.Count - 1 do
    AList[I] := NativeToSimple(TNativeXmlNode(AList[I]));
end;

function TXmlNode.OnCompareNodeWrapper(Node1, Node2: TNativeXmlNode): integer;
begin
  //
end;

function TXmlNode.ReadAttributeBool(const AName: string;
  ADefault: Boolean): Boolean;
begin
  Result := FNode.ReadAttributeBool(AName, ADefault);
end;

function TXmlNode.ReadAttributeFloat(const AName: string;
  ADefault: double): double;
begin
  Result := FNode.ReadAttributeFloat(AName, ADefault);
end;

function TXmlNode.ReadAttributeInt64(const AName: string;
  ADefault: int64): int64;
begin
  Result := FNode.ReadAttributeInt64(AName, ADefault);
end;

function TXmlNode.ReadAttributeInteger(const AName: string;
  ADefault: integer): integer;
begin
  Result := FNode.ReadAttributeInteger(AName, ADefault);
end;

function TXmlNode.ReadAttributeString(const AName, ADefault: string): string;
begin
  Result := FNode.ReadAttributeString(AName, ADefault);
end;

function TXmlNode.ReadBool(const AName: string; ADefault: Boolean): Boolean;
begin
  Result := FNode.ReadBool(AName, ADefault);
end;

function TXmlNode.ReadDateTime(const AName: string; ADefault: TDateTime)
  : TDateTime;
begin
  Result := FNode.ReadDateTime(AName, ADefault);
end;

function TXmlNode.ReadFloat(const AName: string; ADefault: double): double;
begin
  Result := FNode.ReadFloat(AName, ADefault);
end;

function TXmlNode.ReadInt64(const AName: string; ADefault: int64): int64;
begin
  Result := FNode.ReadInt64(AName, ADefault);
end;

function TXmlNode.ReadInteger(const AName: string; ADefault: integer): integer;
begin
  Result := FNode.ReadInteger(AName, ADefault);
end;

function TXmlNode.ReadString(const AName, ADefault: string): string;
begin
  Result := FNode.ReadString(AName, ADefault);
end;

function TXmlNode.ReadWidestring(const AName: string;
  const ADefault: widestring): widestring;
begin
  Result := FNode.ReadUnicodeString(AName, ADefault);
end;

function TXmlNode.RemoveNode(ANode: TXmlNode): integer;
begin
  Result := NodeIndexOf(ANode);
  if Result >= 0 then
    FNode.NodeRemove(ANode.FNode);
end;

procedure TXmlNode.SetAttributeByName(const AName, Value: string);
begin
  if not FNode.HasAttribute(AName) then
    FNode.AttributeAdd(AName, Value); // workaround
  FNode.AttributeValueByName[AName] := Value;
end;

procedure TXmlNode.SetAttributeByNameWide(const AName: string;
  const Value: widestring);
begin
  if not FNode.HasAttribute(AName) then
    FNode.AttributeAdd(AName, Value); // workaround
  FNode.AttributeValueByNameWide[AName] := Value
end;

procedure TXmlNode.SetAttributeName(Index: integer; const Value: string);
begin
  FNode.AttributeName[Index] := Value;
end;

procedure TXmlNode.SetAttributeValue(Index: integer; const Value: string);
begin
  FNode.AttributeValue[Index] := Value;
end;

procedure TXmlNode.SetAttributeValueAsInteger(Index: integer;
  const Value: integer);
begin
  FNode.AttributeValueAsInteger[Index] := Value;
end;

procedure TXmlNode.SetAttributeValueAsWidestring(Index: integer;
  const Value: widestring);
begin
  FNode.AttributeValueByNameWide[FNode.AttributeName[Index]] := Value;
end;

procedure TXmlNode.SetBinaryEncoding(const Value: TBinaryEncodingType);
begin
  // Todo:
end;

procedure TXmlNode.SetBinaryString(const Value: string);
begin
  FNode.BinaryString := Value;
end;

procedure TXmlNode.SetDocument(const Value: TSimpleXml);
begin
  if Assigned(FOwner) then
    FOwner.ManagedNodeRemove(Self);
  TNativeXmlNodeAccess(FNode).FOwner := Value.FXml;
  FOwner := Value;
  if Assigned(FOwner) then
    FOwner.ManagedNodeAdd(Self); // change wrapper ownership
end;

procedure TXmlNode.SetElementType(const Value: TXmlElementType);
begin

end;

procedure TXmlNode.SetName(const Value: string);
begin
  FNode.Name := Value;
end;

procedure TXmlNode.SetParent(const Value: TXmlNode);
begin
  TNativeXmlNodeAccess(FNode).FParent := Value.FNode;
end;

procedure TXmlNode.SetTag(const Value: integer);
begin
  // FNode.
end;

procedure TXmlNode.SetValueAsBool(const Value: Boolean);
begin
  FNode.ValueAsBool := Value;
end;

procedure TXmlNode.SetValueAsDateTime(const Value: TDateTime);
begin
  FNode.ValueAsDateTime := Value;
end;

procedure TXmlNode.SetValueAsFloat(const Value: double);
begin
  FNode.ValueAsFloat := Value;
end;

procedure TXmlNode.SetValueAsInt64(const Value: int64);
begin
  FNode.ValueAsInt64 := Value;
end;

procedure TXmlNode.SetValueAsInteger(const Value: integer);
begin
  FNode.ValueAsInteger := Value;
end;

procedure TXmlNode.SetValueAsString(const Value: string);
begin
  FNode.Value := Value;
end;

procedure TXmlNode.SetValueAsWidestring(const Value: widestring);
begin
  FNode.ValueUnicode := Value;
end;

procedure TXmlNode.SortChildNodes(Compare: TXMLNodeCompareFunction;
  Info: TPointer);
  function OnCompareNodeWrapper(Node1, Node2: TNativeXmlNode): integer;
  begin
    if Assigned(Compare) then
      Result := Compare(NativeToSimple(Node1), NativeToSimple(Node2), Info);
  end;

begin
  // todo: function wrapper needed.
  // FNode.SortChildNodes(OnCompareNodeWrapper);
end;

function TXmlNode.ToAnsiString(const s: string): string;
begin

end;

function TXmlNode.ToWidestring(const s: string): widestring;
begin

end;

function TXmlNode.UnfilteredCount(Index: integer): integer;
begin
  Result := Index + FNode.AttributeCount
end;

function TXmlNode.ValueAsBoolDef(ADefault: Boolean): Boolean;
begin
  Result := FNode.GetValueAsBoolDef(ADefault);
end;

function TXmlNode.ValueAsDateTimeDef(ADefault: TDateTime): TDateTime;
begin
  Result := FNode.GetValueAsDateTimeDef(ADefault);
end;

function TXmlNode.ValueAsFloatDef(ADefault: double): double;
begin
  Result := FNode.GetValueAsFloatDef(ADefault);
end;

function TXmlNode.ValueAsInt64Def(ADefault: int64): int64;
begin
  Result := FNode.GetValueAsInt64Def(ADefault);
end;

function TXmlNode.ValueAsIntegerDef(ADefault: integer): integer;
begin
  Result := FNode.GetValueAsIntegerDef(ADefault);
end;

procedure TXmlNode.WriteAttributeBool(const AName: string;
  AValue, ADefault: Boolean);
begin
  FNode.WriteAttributeBool(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteAttributeFloat(const AName: string;
  AValue, ADefault: double);
begin
  FNode.WriteAttributeFloat(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteAttributeInteger(const AName: string;
  AValue, ADefault: integer);
begin
  FNode.WriteAttributeInteger(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteAttributeString(const AName, AValue, ADefault: string);
begin
  FNode.WriteAttributeString(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteBool(const AName: string; AValue, ADefault: Boolean);
begin
  FNode.WriteBool(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteDateTime(const AName: string;
  AValue, ADefault: TDateTime);
begin
  FNode.WriteDateTime(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteFloat(const AName: string; AValue, ADefault: double);
begin
  FNode.WriteFloat(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteHex(const AName: string;
  AValue, Digits, ADefault: integer);
begin
  FNode.WriteHex(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteInt64(const AName: string; AValue, ADefault: int64);
begin
  FNode.WriteInt64(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteInteger(const AName: string; AValue, ADefault: integer);
begin
  FNode.WriteInteger(AName, AValue, ADefault);
end;

procedure TXmlNode.WriteString(const AName, AValue, ADefault: string);
begin
  FNode.WriteString(AName, AValue, ADefault);
end;

function TXmlNode.WriteToString: string;
begin
  Result := FNode.WriteToString;
end;

procedure TXmlNode.WriteWidestring(const AName: string;
  const AValue, ADefault: widestring);
begin
  FNode.WriteUnicodeString(AName, AValue, ADefault);
end;

constructor TXmlNode.CreateType(ADocument: TSimpleXml; AType: TXmlElementType);
begin
  inherited Create();
  FNode := cNodeClass[AType].CreateParent(ADocument.FXml, nil);
end;

{ TNodePool }

procedure TNodePool.Add(ANode: TXmlNode);
begin
  FNodePool.AddOrSetValue(ANode.FNode, ANode);
end;

procedure TNodePool.Clear;
begin
  with FNodePool.GetEnumerator do
    try
      while MoveNext do
        Current.Value.Free;
    finally
      Free;
    end;
  FNodePool.Clear;
end;

constructor TNodePool.Create(Owner: TSimpleXml);
begin
  FNodePool := TNodeMap.Create;
  FOwner := Owner;
end;

destructor TNodePool.Destroy;
begin
  Clear;
  FNodePool.Free;
  inherited;
end;

procedure TNodePool.FreeNode(ANode: TXmlNode);
begin
  //
end;

procedure TNodePool.Remove(ANode: TXmlNode);
begin
  if FNodePool.ContainsKey(ANode.FNode) then
    FNodePool.Remove(ANode.FNode);
end;

function TNodePool.XmlNodeFromNative(NativeNode: TNativeXmlNode): TXmlNode;
begin
  Result := nil;
  if NativeNode = nil then
    Exit;
  if not FNodePool.ContainsKey(NativeNode) then
  begin
    Result := TXmlNode.Create(NativeNode, FOwner);
    FNodePool.AddOrSetValue(NativeNode, Result);
  end
  else
    Result := FNodePool[NativeNode];
end;

{ TSimpleXml }

procedure TSimpleXml.Assign(Source: TPersistent);
begin
  inherited;
  FXml.Assign(Source);
end;

procedure TSimpleXml.Clear;
begin
  FXml.Clear;
  FNodePool.Clear;
end;

constructor TSimpleXml.Create;
begin
  inherited Create();
  FNodePool := TNodePool.Create(Self);
  FXml := TNativeXml.Create(nil);
  FXml.XmlFormat := xfReadable;
  InitWrapperFunctions;
end;

constructor TSimpleXml.CreateName(const ARootName: string);
begin
  inherited Create();
  FNodePool := TNodePool.Create(Self);
  FXml := TNativeXml.CreateName(ARootName);
  FXml.XmlFormat := xfReadable;
  InitWrapperFunctions;
end;

destructor TSimpleXml.Destroy;
begin
  FNodePool.Free;
  FXml.Free;
  inherited;
end;

function TSimpleXml.GetCommentString: string;
begin
  Result := FXml.CommentString;
end;

function TSimpleXml.GetEncodingString: string;
begin
  // Result := FXml.ExternalEncoding.
end;

function TSimpleXml.GetEntityByName(AName: string): string;
begin
  // Result := FXml.
end;

function TSimpleXml.GetExternalCodepage: Integer;
begin
  Result := FXml.ExternalCodepage;
end;

function TSimpleXml.GetExternalEncoding: TStringEncodingType;
begin
  Result := TStringEncodingType(FXml.ExternalEncoding);
end;

function TSimpleXml.GetRoot: TXmlNode;
begin
  Result := NewOrGetNode(FXml.Root);
end;

function TSimpleXml.GetStyleSheetNode: TXmlNode;
begin
  Result := NewOrGetNode(FXml.StyleSheet)
end;

function TSimpleXml.GetUtf8Encoded: Boolean;
begin
  Result := TStringEncodingType(FXml.ExternalEncoding) = seUTF8;
end;

function TSimpleXml.GetVersionString: string;
begin
  Result := FXml.VersionString;
end;

procedure TSimpleXml.InitWrapperFunctions;
begin
  FXml.OnProgress := Self.OnXmlProgressEventWrapper;
  FXml.OnNodeNew := Self.OnNodeNewWrapper;
  FXml.OnNodeLoaded := Self.OnNodeLoadWrapper;
end;

function TSimpleXml.IsEmpty: Boolean;
begin
  Result := FXml.IsEmpty;
end;

procedure TSimpleXml.LoadFromFile(const FileName: string);
begin
  FXml.LoadFromFile(FileName);
  FNodePool.Clear;
end;

procedure TSimpleXml.LoadFromStream(Stream: TStream);
begin
  FXml.LoadFromStream(Stream);
  FNodePool.Clear;
end;

procedure TSimpleXml.ManagedNodeAdd(ANode: TXmlNode);
begin
  FNodePool.Add(ANode);
end;

procedure TSimpleXml.ManagedNodeRemove(ANode: TXmlNode);
begin
  FNodePool.Remove(ANode);
end;

function TSimpleXml.NewOrGetNode(ANode: TNativeXmlNode): TXmlNode;
begin
  Result := FNodePool.XmlNodeFromNative(ANode);
end;

procedure TSimpleXml.OnNodeLoadWrapper(Sender: TObject; ANode: TNativeXmlNode);
begin
  if Assigned(FOnLoadedNode) then
    FOnLoadedNode(Self, NewOrGetNode(ANode));
end;

procedure TSimpleXml.OnNodeNewWrapper(Sender: TObject; ANode: TNativeXmlNode);
begin
  if Assigned(FOnNewNode) then
    FOnNewNode(Self, NewOrGetNode(ANode));
end;

procedure TSimpleXml.OnXmlProgressEventWrapper(Sender: TObject;
  Position: int64);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Self, Position);
end;

procedure TSimpleXml.ReadFromString(const AValue: string);
begin
  FXml.ReadFromString(AValue);
  FNodePool.Clear;
end;

procedure TSimpleXml.ResolveEntityReferences;
begin

end;

procedure TSimpleXml.SaveToFile(const FileName: string);
begin
  FXml.SaveToFile(FileName);
end;

procedure TSimpleXml.SaveToStream(Stream: TStream);
begin
  FXml.SaveToStream(Stream);
end;

procedure TSimpleXml.SetCommentString(const Value: string);
begin
  FXml.CommentString := Value;
end;

procedure TSimpleXml.SetEncodingString(const Value: string);
begin
  //
end;

procedure TSimpleXml.SetExternalCodepage(const Value: integer);
begin
  FXml.ExternalCodepage := Value;
end;

procedure TSimpleXml.SetExternalEncoding(const Value: TStringEncodingType);
begin
  FXml.ExternalEncoding := NativeXml.TsdStringEncoding(Value);
end;

procedure TSimpleXml.SetUtf8Encoded(const Value: Boolean);
begin
  if Value then
    FXml.ExternalEncoding := NativeXml.TsdStringEncoding(seUTF8)
  else
    FXml.ExternalEncoding := NativeXml.TsdStringEncoding(seAnsi);
end;

procedure TSimpleXml.SetVersionString(const Value: string);
begin
  FXml.VersionString := Value;
end;

function TSimpleXml.WriteToString: string;
begin
  Result := FXml.WriteToString;
end;

end.
