unit Unit14;

interface
uses
  Windows, SysUtils, Classes, Controls, Forms;

type
//  TControlClass = class of TControl;
  TControlFactory = class
  private
    FControlObj: TControl;
  public
//    class function CreateControlObj(AOwner: TWinControl;
//                      ControlClass: TControlClass): TControl;
    constructor Create(AOwner: TWinControl; ControlClass: TControlClass);
  end;
implementation

//class function TControlFactory.CreateControlObj(AOwner: TWinControl;
//                                  ControlClass: TControlClass): TControl;
//var
//  FControlObj: TControl;
//begin
//  FControlObj := ControlClass.Create(AOwner);
//  FControlObj.Parent := AOwner;
//  FControlObj.Name := FControlObj.ClassName;
//  FControlObj.SetBounds(10,10,350,150);
//  result := FControlObj;
//end;

{ TControlFactory }

constructor TControlFactory.Create(AOwner: TWinControl;
  ControlClass: TControlClass);
begin
  FControlObj := ControlClass.Create(AOwner);
  FControlObj.Parent := AOwner;
  FControlObj.Name := FControlObj.ClassName;
  FControlObj.SetBounds(10, 10, 250, 150);
  //Self := TControlFactory(FControlObj);
end;

end.
