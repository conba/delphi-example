unit uTreeListTable;

interface
uses
  cxTL, Hashes2;

type
  TMyTreeListTable = class
  private
    FTreeList: TcxTreeList;
    FColHash: TObjectHash;
  protected
  public
    constructor Create(TreeList: TcxTreeList);
    destructor Destroy; override;
    procedure RegisterColObject(ColName: string; ColObj: TcxTreeListColumn);
  end;

implementation

{ TMyTreeListTable }

constructor TMyTreeListTable.Create(TreeList: TcxTreeList);
begin
  FTreeList := TreeList;
  FColHash := TObjectHash.Create;
end;

destructor TMyTreeListTable.Destroy;
begin
  FColHash.Free;
  FColHash := nil;
  inherited;
end;

procedure TMyTreeListTable.RegisterColObject(ColName: string;
  ColObj: TcxTreeListColumn);
begin
  FColHash.Items[ColName] := ColObj;
end;

end.
