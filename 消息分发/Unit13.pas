unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MsgDispTest, StdCtrls;

type
  TForm13 = class(TForm)
    btn2000: TButton;
    btn2001: TButton;
    btn2002: TButton;
    btnApplication: TButton;
    procedure btn2000Click(Sender: TObject);
    procedure btn2001Click(Sender: TObject);
    procedure btn2002Click(Sender: TObject);
    procedure btnApplicationClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;
  MsgAccept: TMsgAccepter;
implementation

{$R *.dfm}

procedure TForm13.btn2000Click(Sender: TObject);
var
  Msg: TMyMsg;
begin
  Msg.Msg := 2000;
  Msg.MsgText := 'Message 2000';
  MsgAccept.Dispatch(Msg);
end;

procedure TForm13.btn2001Click(Sender: TObject);
var
  Msg: TMyMsg;
begin
  Msg.Msg := 2001;
  Msg.MsgText := 'Message 2001';
  MsgAccept.Dispatch(Msg);
end;

procedure TForm13.btn2002Click(Sender: TObject);
var
  Msg: TMyMsg;
begin
  Msg.Msg := 2002;
  Msg.MsgText := 'Message 2002';
  MsgAccept.Dispatch(Msg);
end;

procedure TForm13.btnApplicationClick(Sender: TObject);
begin
  ShowMessage(Application.ExeName);
end;

procedure TForm13.FormDestroy(Sender: TObject);
begin
  MsgAccept.Free;
  MsgAccept := nil;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  MsgAccept := TMsgAccepter.Create;
end;

end.
