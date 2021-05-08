unit uConst;

interface
uses
  uWeapon, uSword, uBow, uPlayerA, uWindRunner, uPlayer;

type
  WeaponName = (tulongdao);
const
  WeaponArray: array[0..1] of TWeaponClass = (TSword, TBow);
  PlayerArray: array[0..1] of TPlayerClass = (TPlayerA, TWindRunner);

implementation

end.
