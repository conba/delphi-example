unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := TClassTest.ClassName;
end;

end.
