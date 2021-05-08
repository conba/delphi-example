unit uManImpl;

interface
type
  TMan = class(TInterfacedObject)
  private
    FName: string;
  public
    property Name: string read FName write FName;
  end;

implementation

end.
