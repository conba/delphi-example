//**************************************************************************
//*���ܲ�ѯ�ؼ�2.01
//*
//*ȥ����1.1�������bug�������˶�Delphi5��֧�֡����õ������Լ�ȥ��
//*��Ҫ��ȥ����Delphi5�в�֧�ֶ�Delphi6�д��ڵĿؼ��������ԣ��ܼ򵥡�
//*
//*��Delphi6�����Ա༭���ڱ���ʱ��������һᾡ���ṩ�µİ汾�ġ�
//*
//*����wr960204��ϡ�ɣ�2002-3-15
//*Email:wr_960204@x263.net
//*QQ:42088303
//**************************************************************************
//*20020326
//*(U)���ַ����͵�����������ģ����ѯ����Like
//*(+)�����˿���QryDlg���������С������QryFormFontSize
//*(+)�����˿���QryDlg������������QryFormCaption
//*��¶(Pely Gan) 2002-3-26
//*Email:pelygan@sina.com
//*QQ:Not Visiable to you
//**************************************************************************
unit WNADOCQuery;

interface

uses
  WNADOQDlg, Dialogs,
  Windows, Messages, SysUtils, Classes, ADODB, DB;

type
  ConnectString = WideString;
  TWNADOCQuery = class(TComponent)
  private
    { Private declarations }
    FAutoLogin: boolean;
    Fdateseperate: Char;
    FMyConnection: TADOConnection;
    FMyQuery: TADOQuery;
    FMyDataSet: TADODataSet;
    FMyConnectionString: ConnectString;
    FField: TStrings;
    FTabName: WideString;
    FFieldInf: array of WNField;
    FQryFormFontSize : Integer;  //* add by pely 20020325
    FQryFormCaption : String;   //* add by pely 20020325
    procedure SetConnectionString(Value: WideString);
    function GetFieldType(FieldName: string): Integer;
    procedure SetField(Value: TStrings);
    procedure SetTabName(Value: WideString);
    procedure SetDateSeperate(Value: Char);
    procedure SetAutoLogin(Value: Boolean);
    function GetFileGut(FieldName: string): string;
  protected
    { Protected declarations }
  public
    { Public declarations }
    QUeryTerm: WideString;
    function Execute(CanSelect: Boolean): Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property AutoLogin: boolean read FAutoLogin write SetAutoLogin;
    property TabName: WideString read FTabName write SetTabName;
    property ConnectionString: WideString read FMyConnectionString write SetConnectionString;
    property Field: TStrings read FField write SetField;
    property DateSeperate: Char read FDateSeperate write SetDateSeperate; //���ڷָ���Ĭ��Ϊ�����ŵ�����Access��Ϊ'#'
    property QryFormFontSize: Integer read FQryFormFontSize write FQryFormFontSize default 12;  //* add by pely 20020325
    property QryFormCaption: String read FQryFormCaption write FQryFormCaption ;  //* add by pely 20020325
  end;

procedure Register;

implementation

function TWNADOCQuery.GetFileGut(FieldName: string): string;
begin
  Result := '';
  with FMyQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'Select ' + FieldName + ' from ' + FTabName;
    Open;
    First;
    while not eof do
    begin
      Result := Result + FieldByName(FieldName).AsString + #13;
      Next;
    end;
  end;
end;

procedure TWNADOCQuery.SetAutoLogin(Value: Boolean);
begin
  if FAutoLogin <> Value then
  begin
    FAutoLogin := not FAutoLogin;
    FMyConnection.LoginPrompt := not FAutoLogin;
  end;

end;

procedure TWNADOCQuery.SetDateSeperate(Value: Char);
begin
  if FDateSeperate <> Value then
    FDateSeperate := Value;
end;

procedure TWNADOCQuery.SetTabName(Value: WideString);
begin
  if FTabName <> Value then
  begin
    FTabName := Value;
    FMyDataSet.Close;
    FMyDataSet.CommandText := FTabName;
  end;
end;

procedure TWNADOCQuery.SetField(Value: TStrings);
begin
  if FField.Text <> Value.Text then
  begin
    FField.Text := Value.Text;

  end;
end;

function TWNADOCQuery.GetFieldType(FieldName: string): Integer;
begin
  if FMyDataSet.CommandText <> '' then
  begin

    FMyDataSet.Open;
    try
      case FMyDataSet.FieldByName(FieldName).DataType of
        ftString, ftMemo, ftFmtMemo, ftFixedChar, ftWideString:
          begin
            Result := 1; //�ַ��� 1
          end;
        ftSmallint, ftInteger, ftWord,
          ftAutoInc, ftLargeInt, ftArray:
          begin
            Result := 2; //����2
          end;
        ftFloat, ftCurrency, ftBCD:
          begin
            Result := 3; //�����ͣ��������ͣ�3
          end;
        ftDate, ftDateTime:
          begin
            Result := 4; //����ʱ����4
          end;
      else
        begin
          Result := 0; //����δ֪
        end;

      end;
    except
      showmessage(Format('�ֶ�%s������!', [FieldName]));
    end;
  end
  else
  begin
    showmessage('������Ϊ��!');

  end;
end;

function TWNADOCQuery.Execute(CanSelect: Boolean): Boolean;
var
  i: Integer;
  TmpName: string;
  IsPos: Integer;
begin
  SetLength(FFieldInf, (FField.Count));
  for i := 0 to (FField.Count - 1) do
  begin
    TmpName := FField[i];
    IsPos := pos('=', TmpName);
    if IsPos <> 0 then
    begin
      FFieldInf[i].FieldShowName := copy(TmpName, 1, (IsPos - 1));
      FFieldInf[i].FieldName := copy(TmpName, (IsPos + 1), Length(TmpName));
    end
    else
    begin
      FFieldInf[i].FieldShowName := TmpName;
      FFieldInf[i].FieldName := TmpName;
    end;
    FFieldInf[i].FieldType := Self.GetFieldType(FFieldInf[i].FieldName);
    if CanSelect then
      FFieldInf[i].FieldGut := Self.GetFileGut(FFieldInf[i].FieldName);
  end;
  Form_WNADOQDlg := TForm_WNADOQDlg.Create(Self);
  Form_WNADOQDlg.Open(FFieldInf);
  Form_WNADOQDlg.date_seperate := FDateSeperate;
  Form_WNADOQDlg.CanSelect := CanSelect;
  Form_WNADOQDlg.Font.Size := FQryFormFontSize;  //* add by pely 20020325
  Form_WNADOQDlg.Caption := FQryFormCaption;     //* add by pely 20020325
  Form_WNADOQDlg.ShowModal;
  Result := Form_WNADOQDlg.ISOK;
  QUeryTerm := Form_WNADOQDlg.QueryStr;
  Form_WNADOQDlg.Free;
end;

procedure TWNADOCQuery.SetConnectionString(Value: WideString);
begin
  if FMyConnectionString <> Value then
  begin
    FMyConnectionString := Value;
    FMyConnection.Close;
    FMyConnection.ConnectionString := FMyConnectionString;
  end;
end;

constructor TWNADOCQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FField := TStringList.Create;
  FMyConnection := TADOConnection.Create(Self);
  FMyQuery := TADOQuery.Create(Self);
  FMyQuery.Connection := FMyConnection;
  FAutoLogin := False;
  FMyConnection.LoginPrompt := not FAutoLogin;
  FMyDataSet := TADODataSet.Create(Self);
  FMyDataSet.Connection := FMyConnection;
  FMyDataSet.CommandType := cmdTable;
  FDateSeperate := #39;
  FQryFormCaption :='��ѯ';  //* add by pely 20020325
  FQryFormFontSize :=12;     //* add by pely 20020325
end;

destructor TWNADOCQuery.Destroy;

begin

  FMyQuery.Free;
  FMyDataSet.Free;
  FMyConnection.Free;
  FField.Free;
  inherited Destroy;
end;

procedure Register;
begin
  RegisterComponents('WRCtrl', [TWNADOCQuery]);
end;

end.
