unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.btn2Click(Sender: TObject);
begin
  SendMessage(Self.Handle, WM_CLOSE, 0, 0);
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_CLOSE, 0, 0);
end;

procedure TForm2.btn4Click(Sender: TObject);
begin
  Self.Perform(WM_CLOSE, 0, 0)
end;

end.
