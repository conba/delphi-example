unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, StdCtrls, cxInplaceContainer, cxTextEdit, cxClasses,
  cxContainer, cxEdit, Menus, cxMaskEdit, cxDropDownEdit;

type
  TForm13 = class(TForm)
    lst: TcxTreeList;
    btnAddNode: TButton;
    cxtrlstclmnColumn1: TcxTreeListColumn;
    cxtrlstclmnColumn2: TcxTreeListColumn;
    lstColumn1: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxPopupEdit1: TcxPopupEdit;
    pm1: TPopupMenu;
    da1: TMenuItem;
    dsafa1: TMenuItem;
    procedure btnAddNodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btnAddNodeClick(Sender: TObject);
var
  ANode: TcxTreeListNode;
  bb: TcxTreeListNode;
begin
  if lst.Count > 0 then
  begin
    bb := lst.Items[0];
    ANode := lst.Insert(bb);
  end
  else
  begin
    ANode := lst.Add;
    ANode.Values[0] := 'aaa';
    ANode.Values[1] := 'bbb';
    ANode.Values[2] := 'ccc';
  end;
end;

end.
