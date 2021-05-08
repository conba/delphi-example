unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
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
  UnitYXForm, Unit2;
{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  ff: TForm;
begin
  ff := TForm2.Create(nil);
  YXForm_FromFile(ff, 'c:/format.ico');
  ff.Show;
end;

end.
