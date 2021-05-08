unit frmDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Demo;

type
  TForm13 = class(TForm)
    btnBicycle: TButton;
    btnCar: TButton;
    btnClose: TButton;
    chkGPS: TCheckBox;
    procedure btnBicycleClick(Sender: TObject);
    procedure btnCarClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure chkGPSClick(Sender: TObject);
  private
    { Private declarations }
    FGPSReceiver: TGPSReceiver;
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btnBicycleClick(Sender: TObject);
var
  Bicycle: TBicycle;
begin
  Bicycle := TBicycle.create;
  try
    Bicycle.ride;
  finally
    Bicycle.Free;
  end;
end;

procedure TForm13.btnCarClick(Sender: TObject);
var
  MyCar: TCar;
begin
  MyCar := TCar.create(FGPSReceiver, '黑色', '红旗', 200);
  try
    MyCar.drive;
  finally
    MyCar.Free;
  end;
end;

procedure TForm13.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TForm13.chkGPSClick(Sender: TObject);
begin
  if chkGPS.Checked then
    FGPSReceiver := TGPSReceiver.Create
  else
    FreeAndNil(FGPSReceiver);
  if Assigned(FGPSReceiver) then
    ShowMessage('导航系统开启')
  else
    ShowMessage('导航系统关闭');
end;

end.
