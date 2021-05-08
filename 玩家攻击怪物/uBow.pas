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
  ShowMessage('������' + FName + #13#10 + '��ɫ��' + FColor +
                #13#10 + '�˺���' + IntToStr(FDamage) + #13#10 +'��Ϊ�����');
end;

constructor TBow.create;
begin
  FName := '�������չ�';
  FWeaponKind := wkPhysical;
  FDamage := 30;
  FColor := '��ɫ';
end;

end.
