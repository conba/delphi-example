unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyThread = class(TThread)
  protected
    procedure Execute; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function MyFunc(p: Pointer): Integer;
var
  I: Integer;
begin

  for I := 0 to 500000 do
  begin
    Form1.Canvas.Lock;
    Form1.Canvas.TextOut(10, 10, IntToStr(i));
    Form1.Canvas.Unlock;
  end;

  Result := 0;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  ID: THandle;
begin
//  CreateThread(nil, 0, @MyFunc, nil, 0, ID);
  TMyThread.Create(False);
end;

{ TMyThread }

procedure TMyThread.Execute;
var
  I: Integer;
begin
  FreeOnTerminate := True;
  for I := 0 to 500000 do
  begin
    Form1.Canvas.Lock;
    Form1.Canvas.TextOut(10, 10, IntToStr(i));
    Form1.Canvas.Unlock;
  end;
end;

end.
