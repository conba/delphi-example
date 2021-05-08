unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxDBLookupComboBox;

type
  TForm2 = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Popp(Sender: TObject);
    procedure Closeup(Sender: TObject);
  end;

var
  Form2: TForm2;

implementation
uses
  cxDropDownEdit;
{$R *.dfm}

{ TForm2 }

procedure TForm2.Closeup(Sender: TObject);
begin
  if Sender is TcxPopupEdit then
    TcxPopupEdit(Sender).Text := '1';
end;

procedure TForm2.Popp(Sender: TObject);
begin
  if (Sender is TcxPopupEdit) then
  begin
    TcxPopupEdit(Sender).Properties.PopupControl := pnl1;
  end;
//  if  (Sender is TcxLookupComboBox) then
//    TcxLookupComboBox(Sender).PopupMenu
  if (Sender is TcxComboBox) then
    TcxComboBox(Sender).PopupMenu := pnl1;

end;

end.
