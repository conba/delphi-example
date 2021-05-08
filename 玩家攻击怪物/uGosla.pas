unit uGosla;

interface
uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs, uMonster;
type
  TGosla = class(TMonster)
  private
    FColor: string;
  public
    constructor create;
  end;

implementation

{ TGosla }

constructor TGosla.create;
begin
  FName := '¸çË¹À­';
  FHP := 300;
  FColor := '»ÒÉ«';
end;

end.
