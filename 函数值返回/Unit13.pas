unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm13 = class(TForm)
    btn_text: TButton;
    procedure btn_textClick(Sender: TObject);
  private
    { Private declarations }
    IntVar : integer;
    procedure test(AIntVar:Integer);
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btn_textClick(Sender: TObject);
begin
  IntVar := 2;
  test(IntVar);
  ShowMessage(VarToStr(IntVar));
end;

procedure TForm13.test(var AIntVar: Integer);
begin
  AIntVar := 1;
end;

end.
