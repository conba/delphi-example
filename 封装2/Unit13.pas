unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm13 = class(TForm)
    btnClassType: TButton;
    procedure btnClassTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btnClassTypeClick(Sender: TObject);
var
  S: TStringList;
  C: TClass;
begin
  S := TStringList.Create;
  C := S.ClassType;

  s.Free;
end;

end.
