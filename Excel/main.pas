unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
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
  ComObj, OleServer, Excel2000;
{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  EApp: Variant;
  FExcelFileName: string;
  i, j: Integer;
begin
  FExcelFileName := 'C:\DeK\市政养护Page.xlsx';
  EApp := CreateOleObject('Excel.Application');
//  EApp.Visible := True;
  EApp.Workbooks.Open(FExcelFileName);
  i := EApp.worksheets.Count;
  j := EApp.WorkSheets[i].UsedRange.Rows.Count;
  edt1.Text := EApp.Cells[2,2].value;
end;

end.
