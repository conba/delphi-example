unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  IMyTask = Interface
    ['{1B9D204E-1662-4280-A8E6-D7F518A425F5}']
    function SayHello: string;
  End;

  TMyClass = class(TInterfacedObject, IMyTask)
  private

  public
    function SayHello: string;
  end;

  TMyPlan = class(TInterfacedObject, IMyTask)
  private
    FMyClass: IMyTask;
  public
    constructor Create;
    property MyTask: IMyTask read FMyClass implements IMyTask;
  end;

  TForm13 = class(TForm)
    btn1: TButton;
    lbl1: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
var
  MyPlan: IMyTask;
begin
//MyPlan继承自IMyTask接口，但是并没有实现接口中的方法，
  MyPlan := TMyPlan.Create;
  lbl1.Caption := MyPlan.SayHello;
  MyPlan := nil;
end;

{ TMyClass }

function TMyClass.SayHello: string;
begin
  Result := 'Hello';
end;

{ TMyPlan }

constructor TMyPlan.Create;
begin
  inherited;
  FMyClass := TMyClass.Create as IMyTask;
end;

end.
