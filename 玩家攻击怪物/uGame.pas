unit uGame;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  uPlayer, uPlayerA, uWeapon, uMonster, uSword, uBow, uGosla;

type
  TGame = class
  private
    FPlayerNum: Integer; //��Ϸʣ���������
    FMonsterNum: Integer;//��Ϸ����ʣ������
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
  ShowMessage('��Ϸ����������');
end;

procedure TGame.GameGoOn;
begin
  while FMonster1.HP > 0 do
  begin
    FPlayer1.Attack(FMonster1);
  end;
  {������԰���������һ��߹����ͷŵ�}
  FMonsterNum := FMonsterNum - 1;
  if ISGameOver then
    exit;
end;

procedure TGame.GameInit;
begin
  ShowMessage('��Ϸ����������');
  ShowMessage('��һ��������ڴ���');
  FPlayer1 := TPlayerA.Create;
  FPlayerNum := 1;
  ShowMessage('��һ�����ﴴ���ɹ�');
  FMonster1 := TGosla.create;
  FMonsterNum := 1;
  ShowMessage('��Ϸ�����ɹ���');
end;

procedure TGame.GameStart;
begin
  ShowMessage('��Ϸ��ʼ��');
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
