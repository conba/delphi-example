unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses GdiPlus, GdiPlusHelpers;

//从窗口句柄获取 IGPGraphics
procedure TForm1.btn1Click(Sender: TObject);
var
  Graphics: IGPGraphics;
  Pen: IGPPen;
begin
  Graphics := TGPGraphics.Create(Handle);
  Pen := TGPPen.Create(TGPColor.Red, 2);
  Graphics.DrawEllipse(Pen, 20, 10, 150, 40);
end;

//从 HDC 获取 IGPGraphics
procedure TForm1.Btn2Click(Sender: TObject);
var
  Graphics: IGPGraphics;
  Pen: IGPPen;
begin
  Graphics := TGPGraphics.Create(Canvas.Handle);
  Pen := TGPPen.Create(TGPColor.Green, 2);
  Graphics.DrawEllipse(Pen, 20, 40, 150, 40);
end;

//使用 GdiPlusHelpers 为 Canvas 添加的 ToGPGraphics 方法获取 IGPGraphics
procedure TForm1.btn3Click(Sender: TObject);
var
  Graphics: IGPGraphics;
  Pen: IGPPen;
begin
  Graphics := Canvas.ToGPGraphics;
  Pen := TGPPen.Create(TGPColor.Blue, 2);
  Graphics.DrawEllipse(Pen, 20, 70, 150, 40);
end;

//从图像建立 IGPGraphics
procedure TForm1.btn4Click(Sender: TObject);
var
  GraphicsImg: IGPGraphics;
  Pen: IGPPen;
  Image: IGPImage;
begin
  Image := TGPBitmap.Create(152, 42);
  GraphicsImg := TGPGraphics.Create(Image);
  Pen := TGPPen.Create(TGPColor.Fuchsia, 2);
  GraphicsImg.DrawEllipse(Pen, 0, 0, Image.Width-2, Image.Height-2);

  Canvas.ToGPGraphics.DrawImage(Image, 20, 100);
end;

end.
