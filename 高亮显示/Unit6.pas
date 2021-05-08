unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTextEdit, cxTLdxBarBuiltInMenu, StdCtrls,
  cxInplaceContainer, uPMTreeList, RichEdit, cxRichEdit, ComCtrls, dxSkinsCore,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, cxEdit,
  cxExtEditRepositoryItems, cxClasses, Clipbrd, cxContainer, cxMemo, uPMRichEdit;

type
  TForm6 = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    lst1: TPMTreeList;
    pmtrlstclmnlst1PMTreeListColumn1: TPMTreeListColumn;
    pmtrlstclmnlst1PMTreeListColumn2: TPMTreeListColumn;
    pmtrlstclmnlst1PMTreeListColumn3: TPMTreeListColumn;
    re1: TRichEdit;
    btn2: TButton;
    cxEditRepository1: TcxEditRepository;
    richitem1: TcxEditRepositoryRichItem;
    redt1: TPMRichEdit;
    btn3: TButton;
    btn4: TButton;
    re11: TcxRichEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure redt1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.btn1Click(Sender: TObject);
var
  vCharFormat2: TCharFormat2;
  snr: string;
begin
  snr := edt1.Text;
 if not Assigned(re1) then Exit;
// FillChar(vCharFormat2, SizeOf(vCharFormat2), 0);
 vCharFormat2.cbSize := SizeOf(vCharFormat2);
 vCharFormat2.dwMask := CFM_BACKCOLOR;
 vCharFormat2.crBackColor := clWebYellow;
// redtre11.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@vCharFormat2));
  SendMessage(re1.Handle, EM_SETCHARFORMAT, SCF_SELECTION, Longint(@vCharFormat2));
 re1.SelectAll;
// re1.CopyToClipboard;
// redt1.PasteFromClipboard;
// redt1.Text := '1';
end;

procedure TForm6.btn2Click(Sender: TObject);
begin
  re1.SelStart := 1;
  re1.SelLength := 1;
end;

function Parse(text, sol, sag: string): String;
begin
  Delete(text, 1, Pos(sol, text) + Length(sol) - 1);
  Result := Copy(text, 1, Pos(sag, text) - 1);
end;

procedure TForm6.btn3Click(Sender: TObject);
begin
  Parse('123456789','12','89');
end;

procedure TForm6.btn4Click(Sender: TObject);
var
  vCharFormat2: TCharFormat2;
  Str: string;
  iPosition, iCount, iLength: Integer;
  StrList: TStringList;
  I: Integer;
begin
  lst1.SetFocus;
  iPosition := 0;
  iLength := 0;
  vCharFormat2.cbSize := SizeOf(vCharFormat2);
  vCharFormat2.dwMask := CFM_BACKCOLOR;
  vCharFormat2.crBackColor := clWebYellow;
  for I := 0 to re1.Lines.Count - 1 do
  begin
    iCount := 0;
    Str := re1.Lines[I];
    while Length(Str) > 0 do
    begin
      iPosition := Pos(Trim(edt1.Text), Str);
      if iPosition = 0 then
        break;

      re1.SelStart := iLength + iPosition - 1 + (iCount * Length(Trim(edt1.Text)));
      re1.SelLength := Length(Trim(edt1.Text));
      re1.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@vCharFormat2));
//      SendMessage(re11.Handle, EM_SETCHARFORMAT, SCF_SELECTION, Longint(@vCharFormat2));
       re1.Repaint;
      Delete(Str, iPosition, Length(Trim(edt1.Text)));
      Inc(iCount);
    end;
    iLength := iLength + Length(re1.Lines[I]) + 1;
  end;

//  edt1.Text := edt1.Text;
//  for i := 0 to (re1.Lines.Count) do
//  begin
//    bwhile := False;
//    istrsum := 0;
//    str1 := re1.Lines[i];
//    while str1 <> '' do
//    begin
//      iplace := Pos(str, str1);
//      if iplace <= 0 then
//        Break;
//      Delete(str1, iplace, Length(Str));
//      if bwhile then
//      begin
//        istrsum := istrsum + Length(str);
//        iplace := iplace + istrsum;
//      end;
//      re1.SelStart := isum + iplace - 1;
//      re1.SelLength := Length(str);
//      re1.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@vCharFormat2));
//      bwhile := True;
//    end;
//    isum := isum + Length(str1) + 1;
//  end;
//  while (Str <> '') do
//  begin
//    iPosition := Pos(Trim(edt1.Text), Str);
//    if iPosition = 0 then
//      Exit;
//
//    re1.SelStart := iPosition + (iCount * Length(Trim(edt1.Text))) - 1;
//    re1.SelLength := Length(Trim(edt1.Text));
//    re1.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@vCharFormat2));
//    Delete(Str, iPosition, iPosition + Length(Trim(edt1.Text)) - 1);
//    inc(iCount);
//  end;
end;

procedure TForm6.redt1PropertiesChange(Sender: TObject);
var
  i: Integer;
begin
  ShowMessage((Sender as TPMRichEdit).Text);
  i := Pos('re', (Sender as TPMRichEdit).Text);
  ShowMessage('1');
end;

end.
