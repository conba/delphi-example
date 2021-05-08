unit uMyIntf;

{------------------------------------------------------------------------
  �ӿ�ί�м������ڶ�̬��������ʾ���롣
  pcplayer 2017-5-31
------------------------------------------------------------------------}
interface

uses SysUtils, Variants, Classes;

type
  IMyIntf = interface
    ['{9FC4FAA4-04F1-4799-9C30-BB444214E292}']
    function Hello(const S: string): string;
  end;

  IHelloIndex = interface
    ['{C994DC32-D4CB-44F3-8A4D-7E3A6798A7DC}']
    procedure SetMyIndex(const Value: Integer);
    property MyIndex: Integer write SetMyIndex;
  end;


  TEngHello = class(TComponent, IMyIntf)
  public
    function Hello(const S: string): string;
  end;

  TChinaHello = class(TComponent, IMyIntf)
  public
    function Hello(const S: string): string;
  end;

  TMyHello = class(TComponent, IMyIntf, IHelloIndex)
  private
    FMyIntf: IMyIntf;
    FMyIndex: Integer;

    FEngHello: TEngHello;
    FChinaHello: TChinaHello;
    procedure SetMyIndex(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;

    property MyIntf: IMyIntf read FMyIntf implements IMyIntf;
    property MyIndex: Integer write SetMyIndex;
  end;

const
  IID_IHelloIndex: TGUID = '{C994DC32-D4CB-44F3-8A4D-7E3A6798A7DC}';
  IID_IMyIntf: TGUID = '{9FC4FAA4-04F1-4799-9C30-BB444214E292}';

implementation

{ TEngHello }

function TEngHello.Hello(const S: string): string;
begin
  Result := 'Hello, ' + S;
end;

{ TChinaHello }

function TChinaHello.Hello(const S: string): string;
begin
  Result := '���, ' + S + ', �Է�����';
end;

{ TMyHello }

constructor TMyHello.Create(AOwner: TComponent);
begin
  inherited;

  FEngHello := TEngHello.Create(AOwner);
  FEngHello.Name := 'EngHello';

  FChinaHello := TChinaHello.Create(AOwner);
  FChinaHello.Name := 'ChinaHello';

  FMyIntf := FEngHello as IMyIntf;
end;

procedure TMyHello.SetMyIndex(const Value: Integer);
begin
  FMyIndex := Value;
  case value of
    0: FMyIntf := FEngHello as IMyIntf;
    1: FMyIntf := FChinaHello as IMyIntf;
  end;
end;

end.

