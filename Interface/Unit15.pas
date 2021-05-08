unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  IMyinterface = interface
    ['{EB72487A-011C-45C7-8E5D-FA6831EDF154}']
    function GetSayHello: string;
    property SayHello: string read GetSayHello;
  end;

  IMyInterface2 = interface
    ['{7A1E33D1-D82A-4BF4-9BFA-C6A0D442E929}']
    function GetSayHello2: string;
    property SayHello2: string read GetSayHello2;
  end;

  TMyObjct2 = class(TInterfacedObject, IMyInterface2)
    function GetSayHello2: string;
  end;

  TMyObject = class(TInterfacedObject, IMyinterface, IMyInterface2)
  private
    FDelgateObj: IMyInterface2;
  public
    property DelgateObj: IMyInterface2 read FDelgateObj write FDelgateObj
            implements IMyInterface2;
    constructor Create;
    function GetSayHello: string;
  end;

  TForm15 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

end.
