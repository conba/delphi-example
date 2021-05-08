unit uWindRunner;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  uPlayer, uWeapon, uMonster, uSword, uBow;

type
  TWindRunner = class(TPlayer)
  private
    FColor: string;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure Attack(AMonster: TMonster); override;
    procedure ShowPlayerInfo(); override;
  end;

implementation
uses
  uFrmWeapon, uConst;
{ TWindRunner }

procedure TWindRunner.Attack(AMonster: TMonster);
begin
  ShowMessage(FName + '����' + FWeapon.Name + '����' + '����' + AMonster.Name);
  AMonster.HP := AMonster.HP - FWeapon.Damage;
  ShowMessage('ʹ��' + FWeapon.Name + '����' + AMonster.Name + ', �ܵ�' +
        IntToStr(FWeapon.Damage) + '�˺������ﻹʣ' + IntToStr(AMonster.HP) + 'Ѫ����');
end;

constructor TWindRunner.Create;
var
  WeaponIndex: Integer;
begin
  CrtWeaponfrm(WeaponIndex);
  FName := '��ʥ';
  FHP := 100;
  FMP := 50;
  FColor := '��ɫ';
  FWeapon := WeaponArray[WeaponIndex].create;
  FWeapon.Action;
end;

destructor TWindRunner.Destroy;
begin
  FreeAndNil(FWeapon);
  inherited;
end;

procedure TWindRunner.ShowPlayerInfo;
begin
  ShowMessage('������' + FName + #13#10 + '����ֵ��' + IntToStr(FHP) + #13#10 +
              'ħ��ֵ��' + IntToStr(FMP) + #13#10 + '������' + FWeapon.Name +
              #13#10 + '��ɫ��' + FColor);
end;

end.
