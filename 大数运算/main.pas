unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uPMButton, uLargeNumOperator;

type
  TForm1 = class(TForm)
    PMButton1: TPMButton;
    procedure PMButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.PMButton1Click(Sender: TObject);
var
  Str1, Str2, Str: string;
begin
  Str1 := '0.2';
  Str2 := '0.2';
  Str := TLargeNumOperator.MUL(Str1, Str2);
  showmessage(Str);
end;

end.
