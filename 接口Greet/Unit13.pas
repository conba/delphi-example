unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uSayHello;

type
  TForm13 = class(TForm)
    btn1: TButton;
    btnCN: TButton;
    btnUSA: TButton;
    edtName: TEdit;
    edtSkinColor: TEdit;
    edtLanguage: TEdit;
    btnET: TButton;
    btnRobot: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btnCNClick(Sender: TObject);
    procedure btnETClick(Sender: TObject);
    procedure btnRobotClick(Sender: TObject);
    procedure btnUSAClick(Sender: TObject);
  private
    { Private declarations }
    procedure SayHello(AMan: TMan); overload;
    procedure SayHello(Greeting: IGreetable);overload;
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
var
  AStr: string;
  APChar: PChar;
  i: Integer;
begin
  AStr := 'li';
  APChar := 'lil';
  for I := 0 to 3 do
    ShowMessage(APChar[i]);
end;

procedure TForm13.btnCNClick(Sender: TObject);
begin
  SayHello(TChinese.Create);
end;

procedure TForm13.btnETClick(Sender: TObject);
begin
  SayHello(TET.Create);
end;

procedure TForm13.btnRobotClick(Sender: TObject);
begin
  SayHello(TRobot.Create);
end;

procedure TForm13.btnUSAClick(Sender: TObject);
begin
  SayHello(TAmerican.Create);
end;

procedure TForm13.SayHello(AMan: TMan);
begin
  edtName.Text := AMan.Name;
  edtLanguage.Text := AMan.Language;
  edtSkinColor.Text := AMan.SkinColor;
end;

procedure TForm13.SayHello(Greeting: IGreetable);
begin
  edtName.Text := Copy(Greeting.SayHello, 1, 6);
  edtLanguage.Text := Copy(Greeting.SayHello, 7, 4);
  edtSkinColor.Text := Copy(Greeting.SayHello, 11, 6);
  Application.MessageBox(Greeting.SayHello, 'Œ ∫Ú', MB_ICONINFORMATION+MB_OK);
end;

end.
