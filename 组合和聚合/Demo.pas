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
                        + 'ƥ�����ķ�����������');
end;

procedure TEngine.stop;
begin
  ShowMessage('�������ر�');
end;

{ TBicycle }

constructor TBicycle.create;
var
  i: Integer;
begin
  FColor := '��ɫ';
  FMake := '����';
  FTopSpeed := 20;
  ShowMessage(FColor + FMake + '�������ʱ�٣�' + IntToStr(FTopSpeed));
  FWheels := TList.Create;
  for I := 1 to 2 do
    FWheels.Add(TWheel.create(21, 'B�����г�����',i));
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
  ShowMessage('���г���ʽ��');
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
  //�������ʱ���뷢�����������߼���ϵ
  FEngine.FCapacity := TopSpeed + 1000;
  FEngine.FPower := TopSpeed - 70;
  FColor := Color;
  FMake := Make;
  FTopSpeed := TopSpeed;
  ShowMessage(FColor + FMake + '�������ʱ�٣�' + IntToStr(FTopSpeed));
  FWheels := TList.Create;
  for I := 1 to 4 do
    Fwheels.Add(TWheel.create(36, 'A����������', I));
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
  ShowMessage('������ʽ��');
  SlowDown;
  FEngine.stop;
  Stop;
end;

{ TVehicle }

procedure TVehicle.SlowDown;
begin
  ShowMessage('���ڼ��١���');
end;

procedure TVehicle.SpeedUp;
begin
  ShowMessage('���ڼ��١���');
end;

procedure TVehicle.Start;
begin
  ShowMessage('���ӿ�ʼ��������');
end;

procedure TVehicle.Stop;
begin
  ShowMessage('����ͣ�¡���');
end;

{ TWheel }

procedure TWheel.check;
begin
  ShowMessage('����' + IntToStr(FNo) + '�����֡��ͺţ�' + FTypeName
                    + '��С��' + IntToStr(FSize));
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
  ShowMessage('ʹ��GPS');
end;

end.
