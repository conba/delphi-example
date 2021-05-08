unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  IMyInterface = interface
    ['{030C1C9A-841F-48FC-B788-2EE56FB77B52}']
    function SayHello:string;
  end;

  IOneInterface = interface
    ['{8A6AFFF1-2890-4772-A13E-4AAE9BEFC1B2}']
    function GetA: string;
  end;

  TMyObject = class(TInterfacedObject, IMyInterface, IOneInterface)
    function SayHello: string;
    function GetA: string;
  end;

  TForm13 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DoSayHello(Intf: IMyInterface);
    procedure DoSayA(Intf: IOneInterface);
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
  Intf: IMyInterface;
  IntfA: IOneInterface;
begin
  Obj := TMyObject.Create;
  Intf := (Obj as IMyInterface);
  DoSayHello(Intf);
  IntfA := (Intf as IOneInterface);
  DoSayA(IntfA);
end;

{ TForm13 }

procedure TForm13.DoSayA(Intf: IOneInterface);
begin
  ShowMessage(Intf.GetA);
end;

procedure TForm13.DoSayHello(Intf: IMyInterface);
begin
  ShowMessage(Intf.SayHello);
end;

{ TMyObject }

function TMyObject.GetA: string;
begin
  Result := 'A';
end;

function TMyObject.SayHello: string;
begin
  Result := 'Hello';
end;

end.
