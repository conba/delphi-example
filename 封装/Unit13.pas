unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ExtCtrls, StdCtrls, DBCtrls;

type
  TSkinColor = (scWhite, scYellow, scBlack, scDark);
  TMan = class(TObject)
  private
    FAge: Integer;
    FLanguage: string;
    FMale: Boolean;
    FName: string;
    FSkinColor: TSkinColor;
    FValidData: Boolean;
    function GetAge: Integer;
    function GetColor: TSkinColor;
    function GetLanguage: string;
    function GetMale: Boolean;
    function GetName: string;
    procedure SetAge(Value: Integer);
    procedure SetLanguage(Value: string);
    procedure SetName(Value: string);
    procedure SetMale(Value: Boolean);
    procedure SetColor(Value: TSkinColor);
  public
    function Retrieve: Boolean;
    function Save: Boolean;
    procedure SayHello(words: PChar);
    property Age: Integer read GetAge write SetAge;
    property Language: string read GetLanguage write SetLanguage;
    property Male: Boolean read GetMale write SetMale;
    property Name: string read GetName write SetName;
    property SkinColor: TSkinColor read GetColor write SetColor;
    property ValidDate: Boolean read FValidData write FValidData;
  end;

  TCDSMan = class(TClientDataSet)
  private
    FMan: TMan;
    function GetData_Man: TMan;
    procedure SetData_Man(Value: TMan);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Data_Man: TMan read GetData_Man write SetData_Man;
  end;

  TForm13 = class(TForm)
    grp1: TGroupBox;
    lblName: TLabel;
    edtName: TEdit;
    lblAge: TLabel;
    edtAge: TEdit;
    lblLanguage: TLabel;
    edtLanguage: TEdit;
    chkMale: TCheckBox;
    rgColor: TRadioGroup;
    dsInfo: TDataSource;
    btnAdd: TButton;
    btnEdit: TButton;
    btnGreet: TButton;
    btnDelete: TButton;
    dbnvgrInfo: TDBNavigator;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnGreetClick(Sender: TObject);
    procedure dbnvgrInfoClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    procedure WriteInfo;
    procedure ReadInfo;
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
var
  AMan: TMan;
  CDSMan: TCDSMan;

{$R *.dfm}

{ TMan }

function TMan.GetAge: Integer;
begin
  Result := FAge;
end;

function TMan.GetColor: TSkinColor;
begin
  Result := FSkinColor;
end;

function TMan.GetLanguage: string;
begin
  Result := FLanguage;
end;

function TMan.GetMale: Boolean;
begin
  Result := FMale;
end;

function TMan.GetName: string;
begin
  Result := FName;
end;

function TMan.Retrieve: Boolean;
begin

end;

function TMan.Save: Boolean;
begin

end;

procedure TMan.SayHello(words: PChar);
begin
  ShowMessage(words);
end;

procedure TMan.SetAge(Value: Integer);
begin
  if (Value > 0) and (Value < 120) then
    FAge := Value
  else
    FValidData := False;
end;

procedure TMan.SetColor(Value: TSkinColor);
begin
  if (Value <> FSkinColor) then
    FSkinColor := Value;
end;

procedure TMan.SetLanguage(Value: string);
begin
  if (Value <> FLanguage) then
    FLanguage := Value;
end;

procedure TMan.SetMale(Value: Boolean);
begin
  if (Value <> FMale) then
    FMale := Value;
end;

procedure TMan.SetName(Value: string);
begin
  if (Value <> FName) then
    FName := Value;
end;

{ TCDSMan }

constructor TCDSMan.Create(AOwner: TComponent);
begin
  inherited;
  LoadFromFile('ManData');
  Open;
end;

destructor TCDSMan.Destroy;
begin
  FMan.Free;
  SaveToFile('ManData');
  inherited;
end;

function TCDSMan.GetData_Man: TMan;
begin
  if FMan = nil then
    FMan := TMan.Create;
  //Setman
  if RecordCount > 0 then
  begin
    FMan.Name := FieldByName('Name').Value;
    FMan.Age := FieldbyName('Age').value;
    FMan.Language := FieldByName('Language').Value;
    FMan.SkinColor := FieldByName('SkinColor').Value;
    FMan.Male := FieldByName('Male').Value;
  end
  else
  begin
    FMan.Name := '新用户';
    FMan.Language := '中文';
    FMan.SkinColor := scYellow;
    FMan.Age := 20;
    FMan.Male := True;
  end;
  Result := FMan;
end;

procedure TCDSMan.SetData_Man(Value: TMan);
begin
  if Value = nil then
  begin
    FMan.Free;
    FMan := nil;
    Exit;
  end;
  if not Active then open;
  Insert;
  FieldByName('Name').Value := FMan.Name;
  FieldByName('Age').Value := FMan.Age;
  FieldByName('Language').Value := FMan.Language;
  FieldByName('SkinColor').Value := FMan.SkinColor;
  FieldByName('Male').Value := FMan.Male;
  Post;
end;

procedure TForm13.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CDSMan);
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  CDSMan := TCDSMan.Create(nil);
  dsInfo.DataSet := CDSMan;
  ReadInfo;
end;

procedure TForm13.btnAddClick(Sender: TObject);
begin
  WriteInfo;
end;

procedure TForm13.btnDeleteClick(Sender: TObject);
begin
  dsInfo.DataSet.Delete;
  ReadInfo;
end;

procedure TForm13.btnEditClick(Sender: TObject);
begin
  Close;
end;

procedure TForm13.btnGreetClick(Sender: TObject);
begin
  AMan.SayHello('你好！');
end;

procedure TForm13.dbnvgrInfoClick(Sender: TObject; Button: TNavigateBtn);
begin
  ReadInfo;
end;

procedure TForm13.ReadInfo;
begin
  AMan := CDSMan.Data_Man;
  edtName.Text := AMan.Name;
  edtAge.Text := IntToStr(AMan.Age);
  edtLanguage.Text := AMan.Language;
  rgColor.ItemIndex := ord(AMan.SkinColor);
  chkMale.Checked := AMan.Male;
end;

procedure TForm13.WriteInfo;
begin
  AMan.ValidDate := True;
  AMan.Name := edtName.Text;
  AMan.Age := StrToInt(edtAge.Text);
  AMan.Language := edtLanguage.Text;
  AMan.Male := chkMale.Checked;
  if AMan.ValidDate then
    CDSMan.Data_Man := AMan
  else
    Application.MessageBox('输入了非法数据，请检查','提示信息',0);
end;

end.
