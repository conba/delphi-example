unit uFrmWeapon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uSword, uBow, uWeapon;

type
  TFrmWeapon = class(TForm)
    rgWeapon: TRadioGroup;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FWeaponIndex: Integer;
  public
    { Public declarations }
  end;

  procedure CrtWeaponfrm(var AWeaponIndex: Integer);

implementation

{$R *.dfm}

procedure TFrmWeapon.btnOKClick(Sender: TObject);
begin
  if rgWeapon.ItemIndex = -1 then
    ShowMessage('«Î—°‘ÒŒ‰∆˜')
  else
  begin
    FWeaponIndex := rgWeapon.ItemIndex;
    Close;
  end;
end;

procedure CrtWeaponfrm(var AWeaponIndex: Integer);
begin
  with TFrmWeapon.Create(nil) do
  try
    ShowModal;
    AWeaponIndex := FWeaponIndex;
  finally
    Free;
  end;
end;

end.
