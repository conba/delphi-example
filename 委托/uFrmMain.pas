unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;


type
  TDelegateType = (dtObject,dtRegular);

  //����ĺ���ί��
  TObjectNumFuncs = function (const ANumOne: Double;
    const ANumTow: Double):Double of object;
  TRegularNumFuncs = function (const ANumOne: Double;
    const ANumTow: Double):Double;

  Tmain = class(TForm)
    btnAdd: TButton;
    edtNumOne: TEdit;
    edtNumTwo: TEdit;
    btnSub: TButton;
    btnMul: TButton;
    btnDiv: TButton;
    rbObjectDelegate: TRadioButton;
    lblResult: TLabel;
    procedure rbObjectDelegateClick(Sender: TObject);
    procedure rbRegulaDeleteteClick(Sender: TObject);
    procedure MyButtonClick(Sender: TObject);
  private
    { Private declarations }
    //ָʾ��ǰʹ�ö��������ǷǶ�����
    FDelegateType:TDelegateType;

    { �������б� }
    function Add(const ANumOne: Double; const ANumTwo: Double): Double;
    function Sub(const ANumOne: Double; const ANumTwo: Double): Double;
    function Mul(const ANumOne: Double; const ANumTwo: Double): Double;
    function Divde(const ANumOne: Double; const ANumTwo: Double):Double;
    function DoObjectCalc(const ANumOne: Double;
      const ANumTwo: Double; AMethod: TObjectNumFuncs): Double;
    { ����ĺ����б���� }
  public
    { Public declarations }

  end;

  { �Ƕ���(һ��)�ĺ����б� }
  function Add(const ANumOne: Double; const ANumTwo: Double): Double;
  function Sub(const ANumOne: Double; const ANumTwo: Double): Double;
  function Mul(const ANumOne: Double; const ANumTwo: Double): Double;
  function Divde(const ANumOne: Double; const ANumTwo: Double): Double;
  function DoRegularCalc(const ANumOne: Double;
    const ANumTwo: Double; AMethod: TRegularNumFuncs): Double;
  { �Ƕ���ĺ����б���� }
var
  main: Tmain;

implementation

{$R *.dfm}

  { �Ƕ���(һ��)�ĺ����б� }
  function Add(const ANumOne: Double; const ANumTwo: Double): Double;
  begin
    Result := ANumOne + ANumTwo;
  end;

  function Sub(const ANumOne: Double; const ANumTwo: Double): Double;
  begin
    Result := ANumOne - ANumTwo;
  end;

  function Mul(const ANumOne: Double; const ANumTwo: Double): Double;
  begin
    Result := ANumOne * ANumTwo;
  end;

  function Divde(const ANumOne: Double; const ANumTwo: Double): Double;
  begin
    try
      Result := ANumOne / ANumTwo;
    except
      on E:EZeroDivide  do
      begin
        main.edtNumTwo.SetFocus;
        main.lblResult.Caption := '��������Ϊ0';
        Abort;
      end;
    end;
  end;

  function DoRegularCalc(const ANumOne: Double;
    const ANumTwo: Double; AMethod: TRegularNumFuncs): Double;
  begin
    Result := AMethod(ANumOne, ANumTwo);
  end;
  { �Ƕ���ĺ����б���� }

{ TFrmMain }

{ �������б� }
function Tmain.Add(const ANumOne, ANumTwo: Double): Double;
begin
  Result := ANumOne + ANumTwo;
end;

function Tmain.Divde(const ANumOne, ANumTwo: Double): Double;
begin
  try
    Result := ANumOne / ANumTwo;
  except
    on E: EZeroDivide  do
    begin
      edtNumTwo.SetFocus();
      lblResult.Caption := '��������Ϊ0';
      Abort;
    end;
  end;
end;

function Tmain.DoObjectCalc(const ANumOne, ANumTwo: Double;
  AMethod: TObjectNumFuncs): Double;
begin
  Result := AMethod(ANumOne, ANumTwo);
end;

function Tmain.Mul(const ANumOne, ANumTwo: Double): Double;
begin
  Result := ANumOne * ANumTwo;
end;

procedure Tmain.MyButtonClick(Sender: TObject);
var
  dblNumOne, dblNumTwo, dblResult: Double;
begin
  if not (Sender is TButton) then Exit;
  dblNumOne := StrToFloatDef(Trim(edtNumOne.Text), 0.0);
  dblNumTwo := StrToFloatDef(Trim(edtNumTwo.Text), 0.0);

  case (Sender as TButton).Tag of
    0: //��
      begin
        case Self.FDelegateType of
          dtObject:
            begin
              dblResult := Self.DoObjectCalc(dblNumOne, dblNumTwo, Self.Add);
              //��Ϊ
              //dblResult := Self.DoObjectCalc(dblNumOne, dblNumTwo, UnitFrmTest.Add);
              //�����ʾ���´���
              //E2009 Incompatible types: 'regular procedure and method pointer'
            end;
          dtRegular:
            begin
              dblResult := DoRegularCalc(dblNumOne, dblNumTwo, uFrmMain.Add);
              //��Ϊ
              //dblResult := DoRegularCalc(dblNumOne, dblNumTwo, Self.Add);
              //�����ʾ���´���
              //E2009 Incompatible types: 'regular procedure and method pointer'
            end;
        end;
      end;
    1: //��
      begin
        case Self.FDelegateType of
          dtObject:
            begin
              dblResult := Self.DoObjectCalc(dblNumOne, dblNumTwo, Self.Sub);
            end;
          dtRegular:
            begin
              dblResult := DoRegularCalc(dblNumOne, dblNumTwo, uFrmMain.Sub);
            end;
        end;

      end;
    2: //��
      begin
        case Self.FDelegateType of
          dtObject:
            begin
              dblResult := Self.DoObjectCalc(dblNumOne, dblNumTwo, Self.Mul);
            end;
          dtRegular:
            begin
              dblResult := DoRegularCalc(dblNumOne, dblNumTwo, uFrmMain.Mul);
            end;
        end;

      end;
    3: //��
      begin
        case Self.FDelegateType of
          dtObject:
            begin
              dblResult := Self.DoObjectCalc(dblNumOne, dblNumTwo, Self.Divde);
            end;
          dtRegular:
            begin
              dblResult := DoRegularCalc(dblNumOne, dblNumTwo, uFrmMain.Divde);
            end;
        end;

      end;

  end;
  lblResult.Caption := '�����' + FloatToStr(dblResult);
end;

procedure Tmain.rbObjectDelegateClick(Sender: TObject);
begin
  FDelegateType := dtObject;
end;

procedure Tmain.rbRegulaDeleteteClick(Sender: TObject);
begin
  FDelegateType := dtRegular;
end;

function Tmain.Sub(const ANumOne, ANumTwo: Double): Double;
begin
  Result := ANumOne - ANumTwo;
end;
{ �������б���� }
end.
