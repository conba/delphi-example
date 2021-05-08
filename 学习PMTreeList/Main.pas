unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, ExtCtrls,
  cxInplaceContainer, uPMTreeList, cxEdit, cxEditRepositoryItems, cxClasses,
  uPMEditRepository;

type
  TForm1 = class(TForm)
    PMTreeList1: TPMTreeList;
    pnl1: TPanel;
    PMEditRepository1: TPMEditRepository;
    PMEditRepository1ImageItem1: TcxEditRepositoryImageItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
