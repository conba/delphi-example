unit Unit14;

interface
uses
  Windows, SysUtils, Classes, Controls, Forms;
type
  TControlClass = class of TControl;
  TControlFactory = class
  public
    class function createControlObj(AOwner: TWinControl;
                      ControlClass: TControlClass): TControl;
  end;

implementation

class function TControlFactory.createControlObj(AOwner: TWinControl;
                              ControlClass: TControlClass): TControl;
var
  FControlObj: TControl;
begin
  FControlObj := ControlClass.Create(AOwner);
  FControlObj.Parent := AOwner;
  FControlObj.Name := FControlObj.ClassName;
  FControlObj.SetBounds(10, 10, 250, 150);
  Result := FControlObj;
end;
end.
