unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm13 = class(TForm)
    btnExcept: TButton;
    procedure btnExceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btnExceptClick(Sender: TObject);
begin
  try
    raise Exception.Create('hello');
  except
    on E: Exception do
    begin
      ShowMessage(E.UnitName);
    end;
  end;
end;

end.
