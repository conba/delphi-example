unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngextra, ActnList;

type
  TForm1 = class(TForm)
    shp1: TShape;
    btnClose: TPNGButton;
    btnNewDefaultPrj: TPNGButton;
    PNGButton1: TPNGButton;
    actlst1: TActionList;
    act1: TAction;
    procedure act1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
    function IsPointInRect(const APoint: TSmallPoint; const Region: TRect): Boolean;
    function ClientRectToScreen(): TRect;
  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.act1Execute(Sender: TObject);
begin
  Application.Terminate();
end;

function TForm1.ClientRectToScreen: TRect;
begin
  Result.Left := Self.Left + Self.shp1.Left;
  Result.Right := Self.Left + Self.shp1.Left + Self.shp1.Width;
  Result.Top := Self.Top + Self.shp1.Top;
  Result.Bottom := Self.Top + Self.shp1.Top + Self.shp1.Height;
end;

procedure TForm1.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.Style := Params.Style or WS_POPUP and not WS_CAPTION;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  shp1.Brush.Color := clGray;
end;

function TForm1.IsPointInRect(const APoint: TSmallPoint;
  const Region: TRect): Boolean;
begin
  Result := (APoint.X >= Region.Left) and (APoint.X < Region.Right) and (APoint.Y >= Region.Top) and (APoint.Y < Region.Bottom);
end;

procedure TForm1.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
  if (Msg.Result = HTCLIENT) and
    self.isPointInRect(Msg.Pos, Self.ClientRectToScreen()) then
    Msg.Result := HTCAPTION;
end;

end.
