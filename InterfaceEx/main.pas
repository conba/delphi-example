unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  IMyInterface = interface
    ['{FE5A34E5-21AB-4120-971B-FDC3241AD55D}']
    function SayHello: string;
  end;

  IMyInterface2 = interface
    ['{3FD6CFDF-E028-4FD6-9834-299404C15FFF}']
    function SayHello2: string;
  end;

  TMyObject2 = class(TInterfacedObject, IMyInterface2)
    function SayHello2: string;
  end;

  TMyObject = class(TInterfacedObject, IMyInterface, IMyInterface2)
  private
    FDelgateObj: TMyObject2;
  public
    property DelgateObj: TMyObject2 read FDelgateObj implements IMyInterface2;
    constructor Create;
    function SayHello: string;
  end;
//  TMyObject = class(TEdit, IMyInterface)
//    function SayHello: string;
//  end;

  TForm13 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DoSayHello(Intf: IMyInterface);
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
var
  Obj: TMyObject;
  Intf1: IMyInterface;
  Intf2: IMyInterface2;
begin
  Obj := TMyObject.Create();
//  Obj.GetInterface(IMyInterface, Intf);
//  DoSayHello(Intf);
  if Supports(Obj, IMyInterface, Intf1) then
    ShowMessage(Intf1.SayHello);
  if Supports(Obj, IMyInterface2, Intf2) then
    ShowMessage(Intf2.SayHello2);

end;

procedure TForm13.DoSayHello(Intf: IMyInterface);
begin
  ShowMessage(Intf.SayHello);
end;

{ TMyObject }

constructor TMyObject.Create;
begin
  FDelgateObj := TMyObject2.Create;
end;

function TMyObject.SayHello: string;
begin
  Result:='I am Object1';
end;

{ TMyObject2 }

function TMyObject2.SayHello2: string;
begin
  Result:='I am Object2';
end;

end.

