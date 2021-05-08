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
  ShowMessage('������' + FName + #13#10 + '���ȣ�' + IntToStr(FLength) +
                #13#10 + '�˺���' + IntToStr(FDamage) + #13#10 + '��Ϊ���ӿ�');
end;

constructor TSword.create;
begin
  FName := '���콣';
  FWeaponKind := wkPhysical;
  FDamage := 20;
  FLength := 30;
end;

end.
