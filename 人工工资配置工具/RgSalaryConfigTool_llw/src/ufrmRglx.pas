unit ufrmRglx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxCheckListBox, uPMCheckListBox, ExtCtrls, cxTextEdit;

type
  TFrmRglx = class(TForm)
    pnlRglx: TPanel;
    CLBRgLx: TPMCheckListBox;
    edtRglx: TcxTextEdit;
    procedure CLBRgLxEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    FInit: Boolean;
  public
    { Public declarations }
    procedure Popup(Sender: TObject; Rglx: string; AllRgxl: string);
    procedure CloseUp(Sender: TObject; out Rglx: string);
  end;
  procedure PopUp(Sender: TObject; Rglx: string; AllRgxl: string);
  procedure CloseUp(Sender: TObject; out Rglx: string);

implementation
uses
  cxDropDownEdit;
var
  FrmRglx: TFrmRglx;
{$R *.dfm}

procedure PopUp(Sender: TObject; Rglx: string; AllRgxl: string);
begin
  if not Assigned(FrmRglx) then
    FrmRglx := TFrmRglx.Create(nil);
  FrmRglx.Popup(Sender, Rglx, AllRgxl);
end;

procedure CloseUp(Sender: TObject; out Rglx: string);
begin
  if not Assigned(FrmRglx) then
    Exit;
  FrmRglx.CloseUp(Sender, Rglx);
  FreeAndNil(FrmRglx);
end;

procedure TFrmRglx.CLBRgLxEditValueChanged(Sender: TObject);
var
  I: Integer;
  StrList: TStringList;
begin
  if not FInit then
    Exit;
  StrList := TStringList.Create;
  try
    for I := 0 to CLBRgLx.Count - 1 do
    begin
      if CLBRgLx.Items[i].Checked then
        StrList.Add(CLBRgLx.Items[i].Text);
    end;
    StrList.Delimiter := '|';
    edtRglx.Text := StrList.DelimitedText;
  finally
    StrList.Free;
  end;
end;

{ TFrmRglx }

procedure TFrmRglx.CloseUp(Sender: TObject; out Rglx: string);
begin
  if Sender is TcxPopupEdit then
  begin
    Rglx := edtRglx.Text;
  end;
end;

procedure TFrmRglx.Popup(Sender: TObject; Rglx: string; AllRgxl: string);
var
  StrList: TStringList;
  I, J: Integer;
begin
  FInit := False;
  edtRglx.Text := Rglx;
  CLBRgLx.Clear;
  StrList := TStringList.Create;
  try
    StrList.Delimiter := '|';
    StrList.DelimitedText := AllRgxl;
    for I := 0 to StrList.Count - 1 do
    begin
      CLBRgLx.AddItem(StrList[i]);
      CLBRgLx.Items[i].Checked := False;
    end;

    StrList.Clear;
    StrList.DelimitedText := Rglx;
    for I := 0 to StrList.Count - 1 do
    begin
      for J := 0 to CLBRgLx.Count - 1 do
      begin
        if StrList[i] = CLBRgLx.Items[J].Text then
        begin
          CLBRgLx.Items[J].Checked := True;
          Break;
        end;
      end;
    end;
  finally
    StrList.Free;
  end;

  if Sender is TcxPopupEdit then
  begin
    TcxPopupEdit(Sender).Properties.PopupControl := pnlRglx;
  end;
  FInit := True;
end;


end.
