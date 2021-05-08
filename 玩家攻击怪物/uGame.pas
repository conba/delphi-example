unit uGame;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  uPlayer, uPlayerA, uWeapon, uMonster, uSword, uBow, uGosla;

type
  TGame = class
  private
    FPlayerNum: Integer; //游戏剩余玩家数量
    FMonsterNum: Integer;//游戏怪物剩余数量
    FPlayer1: TPlayer;
    FMonster1: TMonster;
    procedure GameInit;
    procedure GameGoOn;
  public
    property PlayerName: Integer read FPlayerNum;
    property MonsterNum: Integer read FMonsterNum;
    constructor Create;
    destructor Destroy; override;
    procedure GameStart;
    procedure GameEnd;
    function ISGameOver: Boolean;
  end;

implementation

{ TGame }

constructor TGame.Create;
begin
  GameInit;
end;

destructor TGame.Destroy;
begin
  FPlayer1.Free;
  FMonster1.Free;
  inherited;
end;

procedure TGame.GameEnd;
begin
  FreeAndNil(FPlayer1);
  FreeAndNil(FMonster1);
  ShowMessage('游戏正常结束！');
end;

procedure TGame.GameGoOn;
begin
  while FMonster1.HP > 0 do
  begin
    FPlayer1.Attack(FMonster1);
  end;
  {在这可以把死亡的玩家或者怪物释放掉}
  FMonsterNum := FMonsterNum - 1;
  if ISGameOver then
    exit;
end;

procedure TGame.GameInit;
begin
  ShowMessage('游戏正在启动！');
  ShowMessage('第一个玩家正在创建');
  FPlayer1 := TPlayerA.Create;
  FPlayerNum := 1;
  ShowMessage('第一个怪物创建成功');
  FMonster1 := TGosla.create;
  FMonsterNum := 1;
  ShowMessage('游戏启动成功！');
end;

procedure TGame.GameStart;
begin
  ShowMessage('游戏开始！');
  FPlayer1.ShowPlayerInfo;
  GameGoOn;
end;

function TGame.ISGameOver: Boolean;
begin
  Result := false;
  if (FMonsterNum = 0) or (FPlayerNum = 0) then
    Result := True;
end;

end.
