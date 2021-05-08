unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxEditRepositoryItems, cxEdit;

type
  TForm14 = class(TForm)
    lst1: TListBox;
    procedure lst1DblClick(Sender: TObject);
  private
    { Private declarations }
    AEditRepositoryItem: TcxEditRepositoryItemclass;
  public
    { Public declarations }
  end;
  function Crtfrm(): TcxEditRepositoryItemClass;

implementation

{$R *.dfm}
function Crtfrm(): TcxEditRepositoryItemClass;
begin
  with TForm14.Create(nil) do
  try
    ShowModal;
    Result := AEditRepositoryItem;
  finally
    Free;
  end;
end;

procedure TForm14.lst1DblClick(Sender: TObject);
begin
  if lst1.ItemIndex = 0 then
    AEditRepositoryItem := TcxEditRepositoryBlobItem
  else if lst1.ItemIndex = 1 then
    AEditRepositoryItem := TcxEditRepositoryCalcItem;
  Close;
end;

end.
