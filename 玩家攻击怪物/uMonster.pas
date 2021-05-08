unit uMonster;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs;
type
  TMonster = class
  protected
    FName: string;
    FHP: Integer;
  public
    property Name: string read FName;
    property HP: Integer read FHP write FHP;
  end;

implementation

end.
