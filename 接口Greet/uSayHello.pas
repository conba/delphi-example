unit uSayHello;

interface
type
  IGreetable = interface
    ['{C98355C2-95EE-4D1A-8781-D27F0A1EB157}']
    function SayHello: PChar;
  end;

  TMan = class(TInterfacedObject, IGreetable)
  private
    FLanguage: string;
    FMarried: Boolean;
    FName: string;
    FSkinColor: string;
  public
    constructor Create; virtual;
    property Language: string read FLanguage write FLanguage;
    property Married: Boolean read FMarried write FMarried;
    property Name: string read FName write FName;
    property SkinColor: string read FSkinColor write FSkinColor;
    function SayHello: PChar; virtual; abstract;
  end;

  TChinese = class(TMan)
  public
    constructor create; override;
  private
    function SayHello: PChar; override;
  end;

  TAmerican = class(TMan)
  public
    constructor Create; override;
  private
    function SayHello: PChar; override;
  end;

  TET = class(TInterfacedObject, IGreetable)
  private
    function SayHello: PChar;
  end;

  TRobot = class(TInterfacedObject, IGreetable)
  private
    function SayHello: PChar;
  end;

implementation

{ TMan }

constructor TMan.Create;
begin
  Name := '张三';
  Language := '中文';
  SkinColor := '黄色';
end;

{ TChinese }

constructor TChinese.create;
begin
  inherited;

end;

function TChinese.SayHello: PChar;
begin
  Result := '你好';
end;

{ TAmerican }

constructor TAmerican.Create;
begin
  Name := 'Lee';
  Language := '英文';
  SkinColor := '白色';
end;

function TAmerican.SayHello: PChar;
begin
  Result := 'Hello';
end;

{ TET }

function TET.SayHello: PChar;
begin
  Result := '外星人#$&*(#^(()&)(&(^^%$$$&%';
end;

{ TRobot }

function TRobot.SayHello: PChar;
begin
  Result := '机器人9089289048249823423424234208';
end;

end.
