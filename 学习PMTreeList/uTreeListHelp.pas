unit uTreeListHelp;

interface
uses
  SysUtils, cxTextEdit, uPMTreeList, Hashes2, cxTL, cxEdit, uPMDataIntf;

type
  TTreeListColumnObject = class
  private
    FEditPro: TcxTextEditProperties;
    FbGetInitEditValue: Boolean;
  protected
    function GetIsEditing: Boolean; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    function GetFieldValue(Node: IPMNode; FieldValue: Variant): Variant; virtual;
    function GetDisplayText(Node: IPMNode; FieldValue: Variant): Variant; virtual;
    function GetEditProper(Node: IPMNode; AColumnIndex: Integer): TcxCustomEditProperties; virtual;
    // ÖØ»æÊÂ¼þ
    procedure OnCustomDrawDataCell(Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean); virtual;
    function GetEditingState(Node: IPMNode): Boolean; virtual;
    property IsEditing: Boolean read GetIsEditing;
    property DefaultEdit: TcxTextEditProperties read FEditPro;
    property bGetInitEditValue: Boolean read FbGetInitEditValue write FbGetInitEditValue;
  end;

  TTreeListTable = class
  private
    FTreeList: TPMTreeList;
    FColumns: TObjectHash;
  protected
    function IsColumnExist(FieldName: string): Boolean;
    function GetColumnObject(FieldName: string): TTreeListColumnObject;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure RegisterTreeListObject(ColumnName: string; ColumnObject: TTreeListColumnObject);
    procedure Init(TreeList: TPMTreeList); virtual;
    procedure UnInit(TreeList: TPMTreeList);

    procedure GetEditingState(Sender: TcxCustomTreeList; AColumn:
      TcxTreeListColumn; var Allow: Boolean);
    procedure GetEditingText(Sender, AItem: TObject; AEdit: TcxCustomEdit; var
        AValue: TcxEditValue);
    procedure GetDisplayText(Sender: TcxTreeListColumn; ANode: TcxTreeListNode; var Value: string);
    procedure GetEditProperties(Sender: TcxTreeListColumn; ANode: TcxTreeListNode; var EditProperties: TcxCustomEditProperties); virtual;
  end;

implementation

end.
