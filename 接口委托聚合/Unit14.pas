unit Unit14;

interface
uses
  SysUtils, Variants, Classes;
type
  IMyIntf = interface
    procedure SayHello;
  end;

  TMyClass = class(TInterfacedObject, IMyIntf)
  private
    FMyField: integer;
  public
    procedure SayHello; virtual; abstract;
  end;
implementation

end.
