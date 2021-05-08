unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, StdCtrls, ExtCtrls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWExtCtrls, dxGDIPlusClasses;

type
  TForm1 = class(TForm)
    btn1: TButton;
    img1: TImage;
    mmo1: TMemo;
    IWImage1: TIWImage;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure snapscreen(a,b,c,d:Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  pt1, pt2: TPoint;
  WicImg: TWICImage;
begin
  pt1 := Point(mmo1.Left, mmo1.Top);
  pt1 := ClientToScreen(pt1);
  pt2 := Point(mmo1.Left + mmo1.Width, mmo1.Top + mmo1.Height);
  Pt2 := ClientToScreen(pt2);
//  snapscreen(self.Left,self.Top,self.Left+self.Width,self.Top+self.Height);
  snapscreen(pt1.x,pt1.y,pt2.x,pt2.y);
  img1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'tmp.jpg');
  Canvas.Draw();
end;

{ TForm1 }

procedure TForm1.snapscreen(a, b, c, d: Integer);
var
  bmpscreen: Tbitmap;
  jpegscreen: Tjpegimage;
  FullscreenCanvas: TCanvas;
  dc: HDC;
  sourceRect, destRect: TRect;
begin
  try
    dc := getdc(0);
    FullscreenCanvas := Tcanvas.Create;
    FullscreenCanvas.Handle := dc;
    bmpscreen := Tbitmap.create;
    bmpscreen.Width := c - a;
    bmpscreen.Height := d - b;
    sourceRect := rect(0, 0, c - a, d - b);
    destRect := rect(a, b, c, d);
    bmpscreen.Canvas.CopyRect(sourceRect, FullscreenCanvas, destRect);
    jpegscreen := Tjpegimage.Create;
    jpegscreen.Assign(bmpscreen);
    jpegscreen.CompressionQuality := 100;
    jpegscreen.SaveToFile(ExtractFilePath(ParamStr(0)) + 'tmp.jpg');
    FullscreenCanvas.Free;
    bmpscreen.Free;
    jpegscreen.Free;
    ReleaseDC(0, dc);
  except
  end;
end;

end.
