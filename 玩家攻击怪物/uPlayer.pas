unit uPlayer;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  uWeapon, uMonster;
type
  TPlayerClass = class of TPlayer;
  TPlayer = class
  protected
    FName: string;
    FHP: Integer; //����ֵ
    FMP: integer; //ħ��ֵ
    FWeapon: TWeapon; //����
  public
    procedure Attack(AMonster: TMonster); virtual; abstract;
    procedure ShowPlayerInfo; virtual; abstract;
  end;

implementation

end.
