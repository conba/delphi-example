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
  FName := '��˹��';
  FHP := 300;
  FColor := '��ɫ';
end;

end.
