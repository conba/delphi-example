unit uQtxmCalculatorBusiness;

interface

type
  TQtXmCalc = class
  private
    // 输入值
    FInValue: Double;
    // 输出值
    FOutValue: Double;
    // 是否计算默认系数
    FDefalutXsChecked: Boolean;
    // 计算式
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
//  // 计算计算式
//  StringReplace(FJss, 'x', , [rfReplaceAll])
end;

end.
