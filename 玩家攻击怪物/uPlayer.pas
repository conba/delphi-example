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
    FHP: Integer; //生命值
    FMP: integer; //魔法值
    FWeapon: TWeapon; //武器
  public
    procedure Attack(AMonster: TMonster); virtual; abstract;
    procedure ShowPlayerInfo; virtual; abstract;
  end;

implementation

end.
