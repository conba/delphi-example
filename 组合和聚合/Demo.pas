unit Demo;

interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TGPSReceiver = class(TObject)
  public
    procedure Navigate;
  end;

  TEngine = class(TObject)
  private
    FCapacity: Integer;
    FPower: Integer;
  public
    constructor create;
    procedure start;
    procedure stop;
  end;

  TWheel = class(TObject)
  private
  { private declarations }
    FNO: Integer;
    FSize: Integer;
    FTypeName: string;
    procedure check;
  protected
  { protected declarations }
  public
  { public declarations }
    constructor create(size: Integer; TypeName: string; No: Integer);
  published
  { published declarations }
  end;

  TVehicle = class(TObject)
  private
  { private declarations }
  protected
  { protected declarations }
    FColor: string;
    FMake: string;
    FTopSpeed: integer;
   // Fwheel: TWheel;
    FWheels: TList;
    procedure SlowDown;
    procedure SpeedUp;
    procedure Start;
    procedure Stop;
  public
  { public declarations }

  published
  { published declarations }
  end;

  TBicycle = class(TVehicle)
  private

  protected

  public
    constructor create;
    destructor Destroy;
    procedure ride;
  published

  end;

  TCar = class(TVehicle)
  private
    FGPSReceiver: TGPSReceiver;
    FTopSpeed: Integer;
  protected
    FEngine: TEngine;
  public
    constructor create(GPS: TGPSReceiver; color: string; Make: string;
          TopSpeed: Integer);
    destructor Destroy;
    procedure drive;
    property GPSReceiver: TGPSReceiver read FGPSReceiver write FGPSReceiver;
    property TopSpeed: Integer read FTopSpeed write FTopSpeed;
  published

  end;

implementation

{ TEngine }

constructor TEngine.create;
begin
  FCapacity := 1500;
  FPower := 130;
end;

procedure TEngine.start;
begin
  ShowMessage(IntToStr(FCapacity) + 'cc,' + IntToStr(FPower)
                        + '匹马力的发动机发动了');
end;

procedure TEngine.stop;
begin
  ShowMessage('发动机关闭');
end;

{ TBicycle }

constructor TBicycle.create;
var
  i: Integer;
begin
  FColor := '白色';
  FMake := '永久';
  FTopSpeed := 20;
  ShowMessage(FColor + FMake + '车，最高时速：' + IntToStr(FTopSpeed));
  FWheels := TList.Create;
  for I := 1 to 2 do
    FWheels.Add(TWheel.create(21, 'B型自行车车轮',i));
end;

destructor TBicycle.Destroy;
var
  i: Integer;
begin
  for I := 1 to 2 do
    TWheel(FWheels.Items[i]).Free;
  inherited;
end;

procedure TBicycle.ride;
begin
  Start;
  SpeedUp;
  ShowMessage('自行车形式中');
  SlowDown;
  Stop;
end;

{ TCar }

constructor TCar.create(GPS: TGPSReceiver; color: string; Make: string;
    TopSpeed: Integer);
var
  I: Integer;
begin
  inherited create;
  FEngine := TEngine.create;
  //假设最高时速与发动机属性有逻辑关系
  FEngine.FCapacity := TopSpeed + 1000;
  FEngine.FPower := TopSpeed - 70;
  FColor := Color;
  FMake := Make;
  FTopSpeed := TopSpeed;
  ShowMessage(FColor + FMake + '车，最高时速：' + IntToStr(FTopSpeed));
  FWheels := TList.Create;
  for I := 1 to 4 do
    Fwheels.Add(TWheel.create(36, 'A型汽车车轮', I));
  GPSReceiver := GPS;
end;

destructor TCar.Destroy;
var
  I: Integer;
begin
  for I := 1 to 4 do
    TWheel(FWheels.Items[i]).Free;
  FEngine.Free;
  inherited;
end;

procedure TCar.drive;
begin
  Start;
  if Assigned(GPSReceiver) then
    GPSReceiver.Navigate;
  FEngine.start;
  SpeedUp;
  ShowMessage('汽车形式中');
  SlowDown;
  FEngine.stop;
  Stop;
end;

{ TVehicle }

procedure TVehicle.SlowDown;
begin
  ShowMessage('正在减速……');
end;

procedure TVehicle.SpeedUp;
begin
  ShowMessage('正在加速……');
end;

procedure TVehicle.Start;
begin
  ShowMessage('车子开始启动……');
end;

procedure TVehicle.Stop;
begin
  ShowMessage('车子停下……');
end;

{ TWheel }

procedure TWheel.check;
begin
  ShowMessage('检查第' + IntToStr(FNo) + '个车轮。型号：' + FTypeName
                    + '大小：' + IntToStr(FSize));
end;

constructor TWheel.create(size: Integer; TypeName: string; No: Integer);
begin
  FSize := size;
  FTypeName := TypeName;
  FNO := No;
  check;
end;

{ TGPSReceiver }

procedure TGPSReceiver.Navigate;
begin
  ShowMessage('使用GPS');
end;

end.
