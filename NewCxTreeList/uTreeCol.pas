unit uTreeCol;

interface
uses
  cxTL, cxEdit;
type
  TScj_Col = class(TcxTreeListColumn)
  protected
    FCheckBox: TcxCustomEditProperties;
    FBtnEdit: TcxCustomEditProperties;
    FCombox: TcxCustomEditProperties;
  public
    // 设置控件属性，例如只读等
    property CheckBox: TcxCustomEditProperties read FCheckBox write FCheckBox;
    property BtnEdit: TcxCustomEditProperties read FBtnEdit write FBtnEdit;
    property Combox: TcxCustomEditProperties read FCombox write FCombox;
  end;

implementation

end.
