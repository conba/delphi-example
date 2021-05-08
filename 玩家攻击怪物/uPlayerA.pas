unit uPlayerA;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  uPlayer, uWeapon, uMonster, uSword, uBow;
type
  TPlayerA = class(TPlayer)
  private
    FProfession: string;   //职业
  public
    constructor Create();
    destructor Destroy(); override;
    procedure Attack(AMonster: TMonster); override;
    procedure ShowPlayerInfo(); override;
  end;

implementation
uses
  uFrmWeapon, uConst;
{ TPlayerA }

procedure TPlayerA.Attack(AMonster: TMonster);
begin
  ShowMessage(FName + '拿着' + FWeapon.Name + '攻击' + '怪物' + AMonster.Name);
  AMonster.HP := AMonster.HP - FWeapon.Damage;
  ShowMessage('使用' + FWeapon.Name + '攻击' + AMonster.Name + ', 受到' +
        IntToStr(FWeapon.Damage) + '伤害，怪物还剩' + IntToStr(AMonster.HP) + '血量。');
end;

constructor TPlayerA.Create;
var
  WeaponIndex: Integer;
begin
  CrtWeaponfrm(WeaponIndex);
  FName := '剑圣';
  FHP := 100;
  FMP := 50;
  FProfession := '剑士';
  FWeapon := WeaponArray[WeaponIndex].create;
  FWeapon.Action;
end;

destructor TPlayerA.Destroy;
begin
  FreeAndNil(FWeapon);
  inherited;
end;

procedure TPlayerA.ShowPlayerInfo;
begin
  ShowMessage('姓名：' + FName + #13#10 + '生命值：' + IntToStr(FHP) + #13#10 +
              '魔法值：' + IntToStr(FMP) + #13#10 + '武器：' + FWeapon.Name +
              #13#10 + '职业：' + FProfession);
end;

end.
