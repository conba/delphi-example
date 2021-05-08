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
  dxSkinXmas2008Blue, cxInplaceContainer, cxClasses, cxEdit, cxTextEdit,
  cxButtonEdit;

type
  TForm13 = class(TForm)
    lst1: TcxTreeList;
    cxdtrpstry: TcxEditRepository;
    cxtrlstclmnclo: TcxTreeListColumn;
    procedure cxtrlstclmncloGetEditProperties(Sender: TcxTreeListColumn; ANode:
        TcxTreeListNode; var EditProperties: TcxCustomEditProperties);
    procedure FormShow(Sender: TObject);
    procedure cxtrlstclmncloPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
uses
  Unit14;
var
  EditRepositoryItem: TcxEditRepositoryItem;
{$R *.dfm}

procedure TForm13.cxtrlstclmncloGetEditProperties(Sender: TcxTreeListColumn;
    ANode: TcxTreeListNode; var EditProperties: TcxCustomEditProperties);
begin
  //ShowMessage(EditProperties.ClassName);
  if (ANode.Values[0] = 0) and (Assigned(EditRepositoryItem)) then
    EditProperties := EditRepositoryItem.Properties;
end;

procedure TForm13.cxtrlstclmncloPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  EditRepositoryItem := Crtfrm.Create(lst1);
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  lst1.Add;
  lst1.Add;
end;

end.
