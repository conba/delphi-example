unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  TJjmb_Info = record
    sj: string;
  end;
  TJjgz_Info = record
    s: string;
    Jjmb_Info: TJjmb_Info;
  end;
  /// <summary>
  /// �Ƽ۹��� ��Ϣ
  /// </summary>
  PJjgz_Info = ^TJjgz_Info;
  /// <summary>
  /// �½����� ��Ϣ
  /// </summary>
  TNewPrj_Info = record
    sXmBh: string; // ��Ŀ��� [xmbh]
    Jjgz: PJjgz_Info; // �Ƽ۹�����Ϣ
    recJjgz: TJjgz_Info; // �Ƽ۹�����Ϣ
  end;
  PNewPrj_Info = ^TNewPrj_Info;
  TMyClass = class
  private
    FPrjInfo: PNewPrj_Info;
    FPrjInfoRec: TNewPrj_Info;
  public
    constructor Create;
    property PrjInfo: PNewPrj_Info read FPrjInfo write FPrjInfo;
    property recPrjInfo: TNewPrj_Info read FPrjInfoRec write FPrjInfoRec;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  My: TMyClass;
begin
  My := TMyClass.Create;
  My.PrjInfo.Jjgz.s := '';
  My.PrjInfo.recJjgz.s := 'fsdf';
  My.PrjInfo.recJjgz.Jjmb_Info.sj := 'asdf';
  My.recPrjInfo.Jjgz.s := '';
  My.recPrjInfo.recJjgz.s := '';
  My.recPrjInfo.sXmBh := 'asdf';
end;

{ TMyClass }

constructor TMyClass.Create;
begin
  inherited;
  New(FPrjInfo);
end;

end.
