{*******************************************************}
{                                                       }
{       异形窗口                                        }
{                                                       }
{       2009.12.4 王  锐                                }
{                                                       }
{*******************************************************}


unit UnitYXForm;

interface
uses
  Windows, Forms, Classes, Graphics;

//从文件加载PNG
procedure YXForm_FromFile(AForm : TForm; AFileName : String);
//从资源加载PNG
procedure YXForm_FromResource(AForm : TForm; ResName : String; ResType : PWideChar; Instance : HINST = 0);
//从图像对象加载
procedure YXForm_FromGraphic(AForm : TForm; AGraphic : TGraphic);

implementation

procedure YXForm_FromFile(AForm : TForm; AFileName : String);
var
  wic : TWICImage;
begin
  wic := TWICImage.Create;
  wic.LoadFromFile(AFileName);
  YXForm_FromGraphic(AForm, wic);
  wic.Free;
end;

procedure YXForm_FromResource(AForm : TForm; ResName : String;ResType : PWideChar; Instance : HINST);
var
  wic : TWICImage;
  r : TResourceStream;
begin
  if Instance = 0 then
    Instance := HInstance;
  r := TResourceStream.Create(Instance, ResName, ResType);
  wic := TWICImage.Create;
  wic.LoadFromStream(r);

  YXForm_FromGraphic(AForm, wic);
  wic.Free;
  r.Free;
end;

procedure YXForm_FromGraphic(AForm : TForm; AGraphic : TGraphic);
var
  ptDst, ptSrc: TPoint;
  Size: TSize;
  BlendFunction: TBlendFunction;
  bmp : TBitmap;
begin
  bmp := TBitmap.Create;
  bmp.Assign(AGraphic);
  ptDst := Point(AForm.Left, AForm.Top);
  ptSrc := Point(0, 0);
  Size.cx := AGraphic.Width;
  Size.cy := AGraphic.Height;

  BlendFunction.BlendOp := AC_SRC_OVER;
  BlendFunction.BlendFlags := 0;
  BlendFunction.SourceConstantAlpha := $FF; // 透明度
  BlendFunction.AlphaFormat := AC_SRC_ALPHA;

  SetWindowLong(AForm.Handle, GWL_EXSTYLE, GetWindowLong(AForm.Handle,
      GWL_EXSTYLE) or WS_EX_LAYERED);
  UpdateLayeredWindow(AForm.Handle,
     AForm.Canvas.Handle,
     @ptDst,
     @Size,
     bmp.Canvas.Handle,
     @ptSrc,
     0,
     @BlendFunction,
     ULW_ALPHA);
  bmp.Free();
end;

end.
