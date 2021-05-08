unit uEnglishImpl;

interface
uses uManImpl,uSpeakEnglishIntf;

type
  TEnglish = class(TMan, ISpeakEnglish)
  private
    FSkinColor: string;
    function SayHello: string;
  public
    constructor create;
    property SkinColor: string read FSkinColor write FSkinColor;
  end;

implementation

{ TEnglish }

constructor TEnglish.create;
begin
  SkinColor := '��ɫ';
end;

function TEnglish.SayHello: string;
begin
  Result := 'hello!';
end;

end.
