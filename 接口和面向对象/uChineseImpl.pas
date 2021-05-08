unit uChineseImpl;

interface
uses uManImpl, uSpeakChineseIntf;
type
  TChinese = class(TMan, ISpeakChinese)
  private
    FSkinColor: string;
  public
    constructor create;
    function SayHello:string; virtual;
    property SkinColor: string read FSkinColor write FSkinColor;
  end;

implementation


{ TChinese }

constructor TChinese.Create;
begin
  SkinColor := '��ɫ';
end;

function TChinese.SayHello: string;
begin
  Result := '��ã�';
end;

end.
