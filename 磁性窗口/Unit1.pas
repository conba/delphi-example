unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MagnetForm, StdCtrls;

type
  TForm1 = class(TCustomMagnetForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  Unit2;
{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  form2.Show;
end;

end.
