unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TNoisyDeath = class
  public
    destructor Destroy; override;
  end;
  TForm13 = class(TForm)
    btnOne: TButton;
    btnTwo: TButton;
    dlgFont: TFontDialog;
    btnSet: TButton;
    mmo: TMemo;
    btnshowComponentcount: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOneClick(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure btnshowComponentcountClick(Sender: TObject);
    procedure btnTwoClick(Sender: TObject);
  private
    { Private declarations }
    procedure WaitAWhile;
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
uses
  mtReaper, uSnapshot;
{$R *.dfm}

procedure TForm13.btnOneClick(Sender: TObject);
var
  NoisyDeath: TNoisyDeath;
begin
  NoisyDeath := TNoisyDeath.Create;
  try
    WaitAWhile;
  finally
    NoisyDeath.Free;
  end;
end;

{ TNoisyDeath }

destructor TNoisyDeath.Destroy;
begin
  ShowMessage('对象被销毁了');
  inherited;
end;

procedure TForm13.btnSetClick(Sender: TObject);
var
  FontSnapshot: TSnapshot;
begin
  FontSnapshot := TSnapshot.Create(mmo.Font);
  if dlgFont.Execute then
    mmo.Font := dlgFont.Font;
  mmo.Update;
  WaitAWhile;
end;

procedure TForm13.btnshowComponentcountClick(Sender: TObject);
begin
  ShowMessage(Self.Components);
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  mmo.Lines.Add('一个模拟对象状态改编后自动回复的例子');
end;

procedure TForm13.btnTwoClick(Sender: TObject);
var
  NoisyDeath: TNoisyDeath;
  girm: ImtReaper;
begin
  NoisyDeath := TNoisyDeath.Create;
  girm := TmtReaper.Create(NoisyDeath);
  WaitAWhile;
end;

procedure TForm13.WaitAWhile;
var
  i: Integer;
begin
  for I := 0 to 5000 do
  begin
    //Caption := IntToStr(i);
    caption := '状态恢复倒计时' + IntToStr(5000 - i);
  end;
end;

end.
