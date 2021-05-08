unit WNADOQDlg;

interface

uses
  Clipbrd,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  WNField = record
    FieldName: string[255];
    FieldShowName: string[255];
    FieldType: Integer;
    FieldGut: string;
  end;

type
  TForm_WNADOQDlg = class;
  TWNNumberEdit = class;
  TWNNumberEdit = class(TCustomEdit)
  private
      { Private-Deklarationen }
    FAutoFormat: Boolean;
    FDigits: byte;
    FMin, FMax: extended;
    fdec: char;
    Fertext: string;
    foldval: extended;
    procedure setvalue(Value: extended);
    procedure setmin(Value: extended);
    procedure setmax(Value: extended);
    procedure SetAutoFormat(Value: Boolean);
    procedure setdigits(Value: byte);
    function getvalue: extended;
    procedure CheckPaste(var msg: tmessage); message WM_PASTE;
  protected
      { Protected-Deklarationen }

    procedure KeyPress(var Key: Char); override;
    procedure doexit; override;
    procedure doEnter; override;
  public
      { Public-Deklarationen }
    property Parent;
    constructor create(aowner: TComponent); override;
    destructor Destroy; override;
  published
      { Published-Deklarationen }

    property Align;
    property BorderStyle;
    property BevelKind default bkNone;
    property Color;
    property Ctl3D;
    property Font;
    property HideSelection;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property Visible;
    property AutoFormat: Boolean read FAutoFormat write SetAutoFormat;
    property Digits: byte read FDigits write setDigits;
    property Value: extended read getvalue write setValue;
    property Min: extended read Fmin write setMin;
    property Max: extended read Fmax write setmax;
    property ErrorMessage: string read fertext write fertext;
    property OnEnter;
    property OnExit;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

  TForm_WNADOQDlg = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    GroupBox2: TGroupBox;
    ListBox_Term: TListBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_logic: TComboBox;
    Edit_Compare: TComboBox;
    Edit_Gut: TComboBox;
    Edit_Date: TDateTimePicker;
    Edit_Str: TEdit;
    Edit_Select: TComboBox;
    Check_Select: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit_GutChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Check_SelectClick(Sender: TObject);
  private
    { Private declarations }
    FField: array of WNField;
    FTerm, FShowTerm: TStrings;
    procedure SetValue; //���ñȽ�ֵ������
  public
    { Public declarations }
    date_seperate: Char;
    QueryStr: string;
    ISOK: Boolean;
    CanSelect: Boolean;
    procedure Open(Field: array of WNField);
  end;
const
  notext = ''; //��ʾ
var
  Form_WNADOQDlg: TForm_WNADOQDlg;
  Edit_Num: TWNNumberEdit;
implementation

{$R *.dfm}



constructor TWNNumberEdit.create(aowner: TComponent);
begin
  inherited create(aowner);
  fdec := decimalseparator;
  FAutoFormat := False;
  BevelKind := bkFlat;
  BorderStyle := bsNone;
  fdigits := 1;
  fmin := 0.00;
  fmax := 99999999.99;
  fertext := notext;
  setvalue(0.0);
end;

destructor TWNNumberEdit.Destroy;
begin
  inherited Destroy;
end;

procedure TWNNumberEdit.doenter;
begin
  foldval := getvalue;
  inherited;
end;

procedure TWNNumberEdit.CheckPaste(var msg: tmessage);
var
  Tmp: string;
  result: extended;
  WNClipBord: TClipboard;
begin
  WNClipBord := TClipboard.Create;
  tmp := WNClipBord.AsText;
  WNClipBord.Free;
  try
    result := strtofloat(tmp);
    inherited;
  except
    MessageBeep($FFFFFFFF);
  end;
end;

procedure TWNNumberEdit.SetAutoFormat(Value: Boolean);
begin
  if FAutoFormat <> Value then
  begin
    FAutoFormat := not FAutoFormat;
    SetValue(strtofloat(Text));
  end;
end;

procedure TWNNumberEdit.doexit;
var
  ts: string;
  result: extended;
begin
  ts := text;
  inherited;
  try
    result := strtofloat(ts);
  except
    if fertext <> notext then
      showmessage(fertext);
    setvalue(foldval);
    selectall;
    setfocus;
    exit;
  end;
  if (result < fmin) or (result > fmax) then
  begin
    if fertext <> notext then
      showmessage(fertext);
    setvalue(foldval);
    selectall;
    setfocus;
    exit;
  end;

  text := floattostrf(Value, fffixed, 18, fdigits);
  value := strtofloat(text);
  inherited;
end;

procedure TWNNumberEdit.setvalue(Value: extended);
var
  tmp: string;
begin
  if Value > fmax then
  begin
    if fertext <> notext then
      showmessage(fertext);
    Value := fmax;
  end;
  if Value < fmin then
  begin
    if fertext <> notext then
      showmessage(fertext);
    Value := fmin;
  end;
  if FAutoFormat then
    tmp := floattostrf(Value, fffixed, 18, fdigits)
  else
    tmp := floattostr(strtofloat(floattostrf(Value, fffixed, 18, fdigits)));
  text := tmp;
end;

function TWNNumberEdit.getvalue: extended;
var
  ts: string;
begin
  ts := text;
  if (ts = '-') or (ts = fdec) or (ts = '') then
    ts := '0';
  try
    result := strtofloat(ts);
  except
    result := fmin;
  end;
  if result < fmin then
  begin
    result := fmin;
  end;
  if result > fmax then
  begin
    result := fmax;
  end;
end;

procedure TWNNumberEdit.setdigits(Value: byte);
begin
  if fdigits <> Value then
  begin
    if Value > 18 then
      Value := 18;
    fdigits := Value;
    setvalue(getvalue);
  end;
end;

procedure TWNNumberEdit.setmin(Value: extended);
begin
  if fmin <> Value then
  begin
    if Value > fmax then
    begin
      showmessage('��Сֵ���ܹ��������ֵ!');
      Value := fmin;
    end;
    fmin := Value;
    setvalue(getvalue);
  end;
end;

procedure TWNNumberEdit.setmax(Value: extended);
begin
  if fmax <> Value then
  begin
    if fmin > Value then
    begin
      showmessage('���ֵ���ܹ�С����Сֵ!');
      Value := fmax;
    end;
    fmax := Value;
    setvalue(getvalue);
  end;
end;

procedure TWNNumberEdit.keypress;
var
  ts: string;
   //   result:extended;
begin
  if key = #27 then
  begin
    setvalue(foldval);
    selectall;
    inherited;
    exit;
  end;
  if key < #32 then
  begin
    inherited;
    exit;
  end;
  ts := copy(text, 1, selstart) + copy(text, selstart + sellength + 1, 500);
  if (key < '0') or (key > '9') then
    if (key <> fdec) and (key <> '-') then
    begin
      inherited;
      key := #0;
      exit;
    end;
  if key = fdec then
    if pos(fdec, ts) <> 0 then
    begin
      inherited;
      key := #0;
      exit;
    end;
  if key = '-' then
    if pos('-', ts) <> 0 then
    begin
      inherited;
      key := #0;
      exit;
    end;
  if key = '-' then
    if fmin >= 0 then
    begin
      inherited;
      key := #0;
      exit;
    end;
  if key = fdec then
    if fdigits = 0 then
    begin
      inherited;
      key := #0;
      exit;
    end;
   //
  ts := copy(text, 1, selstart) + key + copy(text, selstart + sellength + 1, 500);
   //
  if key > #32 then
    if pos(fdec, ts) <> 0 then
    begin
      if length(ts) - pos(fdec, ts) > fdigits then
      begin
        inherited;
        key := #0;
        exit;
      end;
    end;
  if key = '-' then
    if pos('-', ts) <> 1 then
    begin
      inherited;
      key := #0;
      exit;
    end;

  if ts = '' then
  begin
    inherited;
    key := #0;
    text := floattostrf(fmin, fffixed, 18, fdigits);
    selectall;
    exit;
  end;
  if ts = '-' then
  begin
    inherited;
    key := #0;
    text := '-0';
    selstart := 1;
    sellength := 1;
    exit;
  end;
  if ts = fdec then
  begin
    inherited;
    key := #0;
    text := '0' + fdec + '0';
    selstart := 2;
    sellength := 1;
    exit;
  end;
  inherited;
end;

procedure TForm_WNADOQDlg.FormShow(Sender: TObject);
begin
  Edit_Date.Date := Now;
  Check_Select.Visible:=CanSelect;
  Edit_Num := TWNNumberEdit.create(Self);
  Edit_Num.Parent := Self;
  Edit_Num.SetBounds(Edit_Str.Left, Edit_Str.Top, Edit_Str.Width, Edit_Str.Height);
  Edit_Num.Visible := False;
  Edit_Date.Visible := False;
  SetValue;


end;

procedure TForm_WNADOQDlg.Open(Field: array of WNField);
var
  i: Integer;
begin
  Edit_Gut.Items.Clear;
  SetLength(FField, high(Field) + 1);
  for i := Low(Field) to high(Field) do
  begin
    Edit_Gut.Items.Add(Field[i].FieldShoWName);
    FField[i] := Field[i];
  end;
  if Edit_Gut.Items.Count <> 0 then
    Edit_Gut.ItemIndex := 0;
end;

procedure TForm_WNADOQDlg.SpeedButton4Click(Sender: TObject);
begin
  IsOK := False;
  Self.QueryStr := '';
  Self.Close;
end;

procedure TForm_WNADOQDlg.SetValue; //���ñȽ�ֵ������
begin
//
    Edit_Select.Items.Text := FField[Edit_Gut.ItemIndex].FieldGut;
    if Edit_Select.Items.Count <> 0 then
      Edit_Select.ItemIndex := 0;
  Edit_Compare.ItemIndex:=0;  //* add by pely 20020325
  with Edit_Compare do
  begin
    if items.Count=7 then
       items.Delete(6);
  end;    // with
  if CanSelect then
  begin
    Edit_Str.Hide;
    Edit_Date.Hide;
    Edit_Num.Hide;
    Edit_Select.Show;
    Edit_Select.SetFocus; //* add by pely 20020325

  end
  else
  begin
   //showmessage(inttostr(FField[Edit_Gut.ItemIndex].FieldType));
    Edit_Select.Hide;
    case FField[Edit_Gut.ItemIndex].FieldType of
      0: //�ַ���
        begin
          ShowMessage('���ɲ�ѯ�����ݿ��ֶ�����!');
          QueryStr := '';
          Self.Close;
        end;
      1: //�ַ���
        begin
          Edit_Compare.Items.Add('����');
          Edit_Compare.ItemIndex:=0;  //* add by pely 20020325
          Edit_Str.Show;
          Edit_Str.SetFocus;  //* add by pely 20020325

          Edit_Date.Hide;
          Edit_Num.Hide;
        end;
      2: //����
        begin
          Edit_Str.Hide;
          Edit_Date.Hide;
          Edit_Num.Digits := 0;
          Edit_Num.Show;
          Edit_Num.SetFocus; //* add by pely 20020325
        end;
      3: //�����ͣ��������ͣ�
        begin
          Edit_Str.Hide;
          Edit_Date.Hide;
          Edit_Num.Digits := 10;
          Edit_Num.Show;
          Edit_Num.SetFocus; //* add by pely 20020325
        end;
      4: //����ʱ����
        begin
          Edit_Str.Hide;
          Edit_Date.Show;
          Edit_Num.Hide;
          Edit_Date.SetFocus; //* add by pely 20020325
        end;

    end;
  end;

end;

procedure TForm_WNADOQDlg.Edit_GutChange(Sender: TObject);
begin
  SetValue;
end;

procedure TForm_WNADOQDlg.FormCreate(Sender: TObject);
begin
  FTerm := TStringList.Create;
  FShowTerm := TStringList.Create;
  IsOK := False;
end;

procedure TForm_WNADOQDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FTerm.Free;
  FShowTerm.Free;
end;

procedure TForm_WNADOQDlg.SpeedButton1Click(Sender: TObject);
var
  Logic, ShowLogic, Gut, ShowGut, Compare, ShowCompare, Value, ShoWValue: string;
begin
   //FTerm
  case Edit_Logic.ItemIndex of
    0:
      begin
        Logic := ' and '; //ռ4����
        ShowLogic := '����';
      end;
    1:
      begin
        Logic := ' or  '; //ռ4����
        ShowLogic := '����';
      end;
  end;

  Gut := ' '+FField[Edit_Gut.ItemIndex].FieldName;
  ShowGut := ' ' + FField[Edit_Gut.ItemIndex].FieldShowName;

  case Edit_Compare.ItemIndex of
    0:
      begin
        Compare := '  =   ';
        ShowCompare := ' Ϊ ';
      end;
    1:
      begin
        Compare := '  <>  ';
        ShowCompare := ' ��Ϊ ';
      end;
    2:
      begin
        Compare := '  >   ';
        ShowCompare := ' ���� ';
      end;
    3:
      begin
        Compare := '  >=  ';
        ShowCompare := ' ���ڵ��� ';
      end;
    4:
      begin
        Compare := '  <   ';
        ShowCompare := ' С�� ';
      end;
    5:
      begin
        Compare := '  <=  ';
        ShowCompare := ' С�ڵ��� ';
      end;
    6:
      begin
        Compare := ' LIKE ';
        ShowCompare := ' ����� ';
      end;

  end;
  case FField[Edit_Gut.ItemIndex].FieldType of
    1: //�ַ���
      begin
        if CanSelect then
        begin
          if Edit_Compare.ItemIndex<>6 then
             Value := #39 + Edit_Select.Text + #39
          else
             Value := #39 + '%'+Edit_Select.Text+'%' + #39;
          if Edit_Select.Text <> '' then
              ShowValue := Edit_Select.Text
          else
            ShowValue := '"��ֵ"';
        end
        else
        begin
          if Edit_Compare.ItemIndex<>6 then
             Value := #39 + Edit_Str.Text + #39
          else
             Value := #39 + '%'+Edit_Str.Text+'%' + #39 ;
          if Edit_Str.Text <> '' then
            ShowValue := Edit_Str.Text
          else
            ShowValue := '"��ֵ"';
        end;
      end;
    2: //����
      begin
        if CanSelect then
        begin
          Value := (Edit_Select.Text);
          ShowValue := (Edit_Select.Text);
        end
        else
        begin
          Value := floattostr(Edit_Num.Value);
          ShowValue := floattostr(Edit_Num.Value);
        end;
      end;
    3: //�����ͣ��������ͣ�
      begin
        if CanSelect then
        begin
          Value := (Edit_Select.Text);
          ShowValue := (Edit_Select.Text);
        end
        else
        begin
          Value := floattostr(Edit_Num.Value);
          ShowValue := floattostr(Edit_Num.Value);
        end;
      end;
    4: //����ʱ����
      begin
        if CanSelect then
        begin
          Value := date_seperate + (Edit_Select.Text) + date_seperate;
          ShowValue := FormatDateTime('yyyy"--"mm"--"dd"--"', Strtodate(Edit_Select.Text));
        end
        else
        begin
          Value := date_seperate + DateToStr(Edit_Date.Date) + date_seperate;
          ShowValue := FormatDateTime('yyyy"--"mm"--"dd"--"', Edit_Date.Date);
        end;
      end;

  end;
  FTerm.Add(Logic + Gut + Compare + Value);
  FShowTerm.Add(ShowLogic + ShowGut + ShowCompare + ShowValue);
  ListBox_Term.Items.Text := copy(FShowTerm.Text, 5, Length(FShowTerm.Text));
end;

procedure TForm_WNADOQDlg.SpeedButton2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := (ListBox_Term.Items.Count - 1) downto 0 do
  begin
    if ListBox_Term.Selected[i] then
    begin
      FTerm.Delete(i);
      FShowTerm.Delete(i);
      if ListBox_Term.Items.Count <> 0 then
        ListBox_Term.Items.Text := copy(FShowTerm.Text, 5, Length(FShowTerm.Text))
      else
        ListBox_Term.Items.Text := '';
    end;

  end;
end;

procedure TForm_WNADOQDlg.SpeedButton3Click(Sender: TObject);
begin
  IsOK := True;
  QueryStr := copy(FTerm.Text, 5, Length(FTerm.Text));
  Self.Close;
end;

procedure TForm_WNADOQDlg.Check_SelectClick(Sender: TObject);
begin
  CanSelect:=Check_Select.Checked;
  SetValue;
end;

end.
