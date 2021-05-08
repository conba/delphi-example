unit uFrmGameStart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmGame = class(TForm)
    btn1: TButton;
    btnGame: TButton;
    procedure btnGameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGame: TfrmGame;

implementation
uses
  uFrmWeapon, uGame;
{$R *.dfm}

procedure TfrmGame.btnGameClick(Sender: TObject);
var
  Game: TGame;
begin
  Game := TGame.Create;
  try
    Game.GameStart;
    Game.GameEnd;
  finally
    Game.Free;
  end;

end;

end.
