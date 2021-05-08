unit uBow;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  uWeapon;
type
  TBow = class(TWeapon)
  private
    FColor: string;
  public
    constructor create; override;
    procedure Action(); override;
  end;

implementation

{ TBow }

procedure TBow.Action;
begin
  ShowMessage('弓名：' + FName + #13#10 + '颜色：' + FColor +
                #13#10 + '伤害：' + IntToStr(FDamage) + #13#10 +'行为：射箭');
end;

constructor TBow.create;
begin
  FName := '后羿射日弓';
  FWeaponKind := wkPhysical;
  FDamage := 30;
  FColor := '金色';
end;

end.
