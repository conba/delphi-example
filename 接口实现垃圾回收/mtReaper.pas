unit mtReaper;

interface
type
  ImtReaper = interface
    ['{F26AC46F-466E-4D9E-97FF-0D1146758EF6}']
  end;

  TmtReaper = class(TInterfacedObject, ImtReaper)
  private
    FObject: TObject;
  public
    constructor Create(AObject: TObject);
    destructor Destroy; override;
  end;

implementation
uses
  SysUtils;

{ TmtReaper }

constructor TmtReaper.Create(AObject: TObject);
begin
  FObject := AObject;
end;

destructor TmtReaper.Destroy;
begin
  FreeAndNil(FObject);
  inherited;
end;

end.
