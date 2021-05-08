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
    FWeaponKind: TWeaponKind; //��������
    FDamage: Integer;         //�˺�
  public
    constructor Create; virtual;
    procedure Action(); virtual; abstract;   //��������
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
