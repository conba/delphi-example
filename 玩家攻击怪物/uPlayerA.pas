unit uPlayerA;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  uPlayer, uWeapon, uMonster, uSword, uBow;
type
  TPlayerA = class(TPlayer)
  private
    FProfession: string;   //ְҵ
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
  ShowMessage(FName + '����' + FWeapon.Name + '����' + '����' + AMonster.Name);
  AMonster.HP := AMonster.HP - FWeapon.Damage;
  ShowMessage('ʹ��' + FWeapon.Name + '����' + AMonster.Name + ', �ܵ�' +
        IntToStr(FWeapon.Damage) + '�˺������ﻹʣ' + IntToStr(AMonster.HP) + 'Ѫ����');
end;

constructor TPlayerA.Create;
var
  WeaponIndex: Integer;
begin
  CrtWeaponfrm(WeaponIndex);
  FName := '��ʥ';
  FHP := 100;
  FMP := 50;
  FProfession := '��ʿ';
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
  ShowMessage('������' + FName + #13#10 + '����ֵ��' + IntToStr(FHP) + #13#10 +
              'ħ��ֵ��' + IntToStr(FMP) + #13#10 + '������' + FWeapon.Name +
              #13#10 + 'ְҵ��' + FProfession);
end;

end.
