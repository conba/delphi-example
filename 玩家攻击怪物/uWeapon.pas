unit uWeapon;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs;
type
  TWeaponClass = Class of TWeapon;
  TWeaponKind = (wkPhysical, wkMagic);

  TWeapon = class
  protected
    FName: string;
    FWeaponKind: TWeaponKind; //武器类型
    FDamage: Integer;         //伤害
  public
    constructor Create; virtual;
    procedure Action(); virtual; abstract;   //攻击动作
    property Name: string read FName;
    property Damage: Integer read FDamage;
  end;

implementation

{ TWeapon }

constructor TWeapon.Create;
begin
//
end;

end.
