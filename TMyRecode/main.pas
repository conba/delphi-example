unit main;

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

  TMyRecord = record
    FName: string;
    FAge: Integer;
  private
    FGender: Integer;
    function GetGender: Integer;
  public
    procedure init();
    constructor Create(a: Integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TMyRecord }

constructor TMyRecord.Create(a: Integer);
begin
  FName := 'liliangwei';
  FAge := 24;
  FGender := 1;
end;

function TMyRecord.GetGender: Integer;
begin
  Result := FGender;
end;

procedure TMyRecord.init;
begin
  FName := 'liliangwei';
  FAge := 24;
  FGender := 1;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  MySelf: TMyRecord;
  i: Integer;
begin
  MySelf.init;
  MySelf.GetGender;
//  ShowMessage(MySelf.FName + IntToStr(MySelf.FAge));
  ShowMessage(IntToStr(MySelf.FGender));
end;

end.
