unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList;

type
  TForm1 = class(TForm)
    btn1: TButton;
    pnl1: TPanel;
    pgc1: TPageControl;
    ilImages: TImageList;
    ts1: TTabSheet;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  iPageCount: Integer;
  TabSheet: TTabSheet;
  width: TBorderWidth;
  TabPosition: TTabPosition;
begin
  width := 100;
  TabSheet := TTabSheet.Create(nil);
  try
    TabSheet.Visible := True;
    TabSheet.Align := alClient;
    TabSheet.PageControl := pgc1;
    TabSheet.Caption := IntToStr(pgc1.PageCount);
    pgc1.Images := ilImages;
    pgc1.ActivePage.ImageIndex := 1;
//    TabSheet.ImageIndex := ilImag;
//    TabSheet.BorderWidth := width;
    TabSheet.Hint := IntToStr(pgc1.PageCount + 1);
    TabSheet.ShowHint := True;
//    ShowMessage(TabSheet.Parent.ClassName);
    pgc1.TabWidth := 60;
    pgc1.TabHeight := 30;
    pgc1.TabPosition := tpTop;

  finally

  end;
//  iPageCount := pgc1.PageCount;
//  ShowMessage(IntToStr(iPageCount));
end;

end.
