unit uSnapshot;

interface
uses
  SysUtils, mtReaper, Classes;
type
  ISnapshot = interface
    ['{209D1905-4896-4898-A6A6-28A4E5C8C62D}']
    procedure Restore;
  end;

  TSnapshot = class(TInterfacedObject, ISnapshot)
  private
    FOriginal: TPersistent;
    FTarget: TPersistent;
    FReaper: ImtReaper;
  public
    constructor Create(Target: TPersistent);
    destructor Destroy; override;
    procedure Restore;
  end;

implementation

{ TSnapshot }

constructor TSnapshot.Create(Target: TPersistent);
begin
  FOriginal := TPersistent(Target.ClassType.Create);
  FReaper := TmtReaper.Create(FOriginal);
  FTarget := Target;
  FOriginal.Assign(Target);
end;

destructor TSnapshot.Destroy;
begin
  Restore;
  inherited;
end;

procedure TSnapshot.Restore;
begin
  if FTarget <> nil then
    FTarget.Assign(FOriginal);
end;

end.
