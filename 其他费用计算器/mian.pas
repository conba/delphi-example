unit mian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxContainer, cxEdit, cxLabel, ComCtrls, cxPC, uPMPageControl,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, Unit2, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, StdCtrls;

type
  TForm1 = class(TForm)
    cxPopupEdit1: TcxPopupEdit;
    cxComboBox1: TcxComboBox;
    cxLookupComboBox1: TcxLookupComboBox;
    cxCheckBox1: TcxCheckBox;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure cxPopupEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure cxPopupEdit1PropertiesCloseUp(Sender: TObject);
    procedure cxComboBox1PropertiesInitPopup(Sender: TObject);
    procedure cxLookupComboBox1PropertiesInitPopup(Sender: TObject);
    procedure cxLookupComboBox1PropertiesPopup(Sender: TObject);
    procedure cxPopupEdit1Click(Sender: TObject);
    procedure cxPopupEdit1ContextPopup(Sender: TObject; MousePos: TPoint; var
        Handled: Boolean);
    procedure cxPopupEdit1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cxPopupEdit1DragOver(Sender, Source: TObject; X, Y: Integer; State:
        TDragState; var Accept: Boolean);
    procedure cxPopupEdit1PropertiesInitPopup(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TAAA = class
  private
    AAA: string;
  constructor Create();
  end;

  TBBB = class(TAAA)
  protected
    BBB: string;
  public
    procedure hhh();
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  B: TBBB;
begin
  B := TBBB.Create;
  try
    B.hhh;
  finally
    B.Free;
  end;
end;

procedure TForm1.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  ShowMessage('check')
end;

procedure TForm1.cxComboBox1PropertiesInitPopup(Sender: TObject);
begin
  Form2.Popp(Sender);
end;

procedure TForm1.cxLookupComboBox1PropertiesInitPopup(Sender: TObject);
begin
  Form2.Popp(Sender);
end;

procedure TForm1.cxLookupComboBox1PropertiesPopup(Sender: TObject);
begin
  Form2.Popp(Sender);
end;

procedure TForm1.cxPopupEdit1Click(Sender: TObject);
begin
//  ShowMessage('1');
  Form2.Popp(Sender);
end;

procedure TForm1.cxPopupEdit1ContextPopup(Sender: TObject; MousePos: TPoint;
    var Handled: Boolean);
begin
  ShowMessage('1')
end;

procedure TForm1.cxPopupEdit1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  ShowMessage('1');
  Form2.Popp(Sender);
end;

procedure TForm1.cxPopupEdit1DragOver(Sender, Source: TObject; X, Y: Integer;
    State: TDragState; var Accept: Boolean);
begin
  ShowMessage('over');
end;

procedure TForm1.cxPopupEdit1PropertiesCloseUp(Sender: TObject);
begin
  Form2.Closeup(Sender);
end;

procedure TForm1.cxPopupEdit1PropertiesEditValueChanged(Sender: TObject);
begin
//  ShowMessage('changge');
end;

procedure TForm1.cxPopupEdit1PropertiesInitPopup(Sender: TObject);
begin
//  Form2.Popp(Sender);
end;

{ TBBB }

procedure TBBB.hhh;
begin
  ShowMessage(AAA);
end;

{ TAAA }

constructor TAAA.Create;
begin
  AAA := 'AAA';
end;

end.
