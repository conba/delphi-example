unit uSword;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  uWeapon;
type
  TSword = class(TWeapon)
  private
    FLength: Integer;
  public
    constructor create; override;
    procedure Action(); override;
  end;

implementation

{ TSword }

procedure TSword.Action;
begin
  ShowMessage('剑名：' + FName + #13#10 + '长度：' + IntToStr(FLength) +
                #13#10 + '伤害：' + IntToStr(FDamage) + #13#10 + '行为：挥砍');
end;

constructor TSword.create;
begin
  FName := '倚天剑';
  FWeaponKind := wkPhysical;
  FDamage := 20;
  FLength := 30;
end;

end.
