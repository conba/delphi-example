unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, uPMTreeList;

type
  TForm1 = class(TForm)
    TL1: TPMTreeList;
    procedure TL1InitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit);
    procedure TL1InitEditValue(Sender, AItem: TObject; AEdit: TcxCustomEdit; var
        AValue: Variant);
    procedure TL1PmInitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit; var
        AValue: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TL1InitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit);
var
  i: Integer;
begin
  i := 1;
end;

procedure TForm1.TL1InitEditValue(Sender, AItem: TObject; AEdit: TcxCustomEdit;
    var AValue: Variant);
var
  i: Integer;
begin
  i := 1;
end;

procedure TForm1.TL1PmInitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit;
    var AValue: Variant);
var
  i: Integer;
begin
  i := 1;
end;


end.
