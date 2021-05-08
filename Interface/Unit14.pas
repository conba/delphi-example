unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  IMyInterface = interface
    ['{5A8C42DF-502B-48D1-9165-35F8F6412117}']
    function SayHello: string;
  end;

  IMyInterface2 = interface
    ['{D048539E-88A7-45DD-B56D-2D3CB62CF1EB}']
    function SayHello2: string;
  end;

  TMyObject2 = class(TInterfacedObject, IMyInterface2)
    function SayHello2: string;
  end;

  TMyObject = class(TInterfacedObject, IMyInterface, IMyInterface2)
  private
    FDelgateObj: TMyObject2;
  public
    property DelgateObj: TMyObject2 read FDelgateObj Implements IMyInterface2;
    constructor Create;
    function SayHello: string;
  end;

  TForm14 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.btn1Click(Sender: TObject);
var
  MyObject: TMyObject;
  Intf1: IMyInterface;
  Intf2: IMyInterface2;
begin
  MyObject := TMyObject.Create;
  if Supports(MyObject, IMyInterface, Intf1) then
    ShowMessage(Intf1.SayHello);
  if Supports(MyObject, IMyinterface2, Intf2) then
    ShowMessage(Intf2.SayHello2);
end;

{ TMyObject2 }

function TMyObject2.SayHello2: string;
begin
  Result := 'I am Object2';
end;

{ TMyObject }

constructor TMyObject.Create;
begin
  FDelgateObj := TMyObject2.Create;
end;

function TMyObject.SayHello: string;
begin
  Result := 'I am Object1';
end;

end.
