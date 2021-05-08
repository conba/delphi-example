unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  uChineseImpl, uEnglishImpl, uManImpl,
  uSpeakChineseIntf, uSpeakEnglishIntf;

type
  TClass1 = class
  private
    FName: string;
  public
    constructor create; virtual;
    property Name: string read FName write FName;
    procedure PrintMSG; virtual;
  end;

  TClass2 = class(TClass1)
  public
    constructor create; override;
    procedure PrintMSG; override;
  end;

  TAmericanChinese = class(TChinese, ISpeakChinese, ISpeakEnglish)
  public
    constructor create;
    function SayHello: string; override;
  end;

  TAmericanChinese1 = class(TChinese, ISpeakEnglish)
    function TomSayHello: string;
  end;

  TForm13 = class(TForm)
    btnAmericanChinese: TButton;
    btnClassTest: TButton;
    procedure btnAmericanChineseClick(Sender: TObject);
    procedure btnClassTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

{ TAmericanChinese }

constructor TAmericanChinese.create;
begin
  inherited;
  Name := 'Tom';
end;

function TAmericanChinese.SayHello: string;
var
  Dad: ISpeakChinese;
  Mum: ISpeakEnglish;
begin
  Dad := TChinese.create;
  Mum := TEnglish.create;
  Result := Dad.SayHello + Mum.SayHello;
end;

procedure TForm13.btnAmericanChineseClick(Sender: TObject);
var
  Tom: TChinese;
begin
  Tom := TAmericanChinese.create;
  try
    ShowMessage(Tom.Name);
    ShowMessage(Tom.SkinColor);
    ShowMessage(Tom.SayHello);
  finally
    Tom.Free;
  end;
end;

procedure TForm13.btnClassTestClick(Sender: TObject);
var
  Class1: TClass1;
begin
  Class1 := TClass2.create;
  try
    class1.PrintMSG;
  finally
    Class1.Free;
  end;
end;

{ TClass1 }

constructor TClass1.create;
begin
  ShowMessage('Class1');
end;

procedure TClass1.PrintMSG;
begin
  ShowMessage('Class1MSG');
end;

{ Tclass2 }

constructor Tclass2.create;
begin
  ShowMessage('class2');
  inherited;
end;

procedure TClass2.PrintMSG;
begin
  ShowMessage('class2MSG');
end;

{ TAmericanChinese1 }

function TAmericanChinese1.TomSayHello: string;
var
  Mum: ISpeakEnglish;
begin
  Mum := TEnglish.create;
  Result := SayHello + Mum.SayHello;
end;

end.
