unit uQtxmCalculatorBusiness;

interface

type
  TQtXmCalc = class
  private
    // ����ֵ
    FInValue: Double;
    // ���ֵ
    FOutValue: Double;
    // �Ƿ����Ĭ��ϵ��
    FDefalutXsChecked: Boolean;
    // ����ʽ
    FJss: String;
  protected
//    procedure Calc(); virtual;
  end;

  TXmJsGlfCalc = class(TQtXmCalc)
  protected
    procedure Calc(); override;
  end;


implementation

{ TXmJsGlfCalc }

procedure TXmJsGlfCalc.Calc;
var
  sInValue: string;
begin
//  sInValue := (FInValue);
//  // �������ʽ
//  StringReplace(FJss, 'x', , [rfReplaceAll])
end;

end.
