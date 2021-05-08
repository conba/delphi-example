unit ufmQtxmCalculator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, ExtCtrls, cxControls, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxTLdxBarBuiltInMenu, dxBarBuiltInMenu, cxSplitter, uPMSplitter, cxPC,
  cxInplaceContainer, uPMTreeList, uPMPageControl, cxContainer, cxEdit,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLabel, cxGroupBox, cxRadioGroup,
  uPMRadioButton;

type
  TfmQtxmCalculator = class(TForm)
    pnlTree: TPanel;
    pnl1: TPanel;
    btnFileSource: TcxButton;
    btnApply: TcxButton;
    XmjgTree: TPMTreeList;
    PCXmData: TPMPageControl;
    Coltoken: TPMTreeListColumn;
    ColName: TPMTreeListColumn;
    TSXmjsGlf: TcxTabSheet;
    SplitterXmTree: TPMSplitter;
    pnl2: TPanel;
    TSJsglQtf: TcxTabSheet;
    pnl4: TPanel;
    SplitterJsGlf: TPMSplitter;
    JsglfTree: TPMTreeList;
    ColJsglf_BzGcfy: TPMTreeListColumn;
    ColJsglf_BzFl: TPMTreeListColumn;
    ColJsglf_SlGcfy: TPMTreeListColumn;
    Coljsglf_SlFee: TPMTreeListColumn;
    lblJsxmGlf_Gcfy: TcxLabel;
    PopEdtJsxmGlf: TcxPopupEdit;
    lblXmjsGlf_Fee: TcxLabel;
    edtXmjsGlf: TcxTextEdit;
    ckbJsGlfXs: TcxCheckBox;
    lblXmjsglf_DW: TcxLabel;
    SplitterQtf: TPMSplitter;
    GlqtfTree: TPMTreeList;
    ColGlQtf_Gcfy: TPMTreeListColumn;
    coGlQtf_Fl: TPMTreeListColumn;
    ColGlQtf_Fee: TPMTreeListColumn;
    ColGlQtf_JsxmFee: TPMTreeListColumn;
    lblGlQtf_Gcfy: TcxLabel;
    PopEdtGlQtf: TcxPopupEdit;
    lblGlQtf_Dw: TcxLabel;
    lblGlQtf_Xs: TcxLabel;
    EdtGlqtf: TcxTextEdit;
    ckbGlQtfXs: TcxCheckBox;
    TSJlf: TcxTabSheet;
    pnl3: TPanel;
    GcJlfTree: TPMTreeList;
    CoGcjlf_Gcfy: TPMTreeListColumn;
    ColGcjlf_Sfjj: TPMTreeListColumn;
    ColGcjlf_Gcjlf: TPMTreeListColumn;
    SplitterJlf: TPMSplitter;
    lblJlf_Gcfy: TcxLabel;
    PopedtJlf: TcxPopupEdit;
    lblJlf_Dw: TcxLabel;
    lblJlf_Gcfzxs: TcxLabel;
    edtJlfXs: TcxTextEdit;
    CkbXs: TcxCheckBox;
    lblGcJlf: TcxLabel;
    edtJlf: TcxTextEdit;
    lblJlfDw: TcxLabel;
    TSZxf: TcxTabSheet;
    pnl5: TPanel;
    lblZxf_Gcfy: TcxLabel;
    PopEdtZxfGcfy: TcxPopupEdit;
    lblZxf_Dw: TcxLabel;
    lblZxf_HytzXs: TcxLabel;
    lblZxf_GcfzXs: TcxLabel;
    EdtZxfFzXs: TcxTextEdit;
    lblZxfDw: TcxLabel;
    ckbZxfXs: TcxCheckBox;
    lblJlxBz: TcxLabel;
    lbl1: TcxLabel;
    ckbBzxmJys: TcxCheckBox;
    ckbBzxmkxx: TcxCheckBox;
    lblJsxmZxf: TcxLabel;
    edtZxf: TcxTextEdit;
    PMTreeList1: TPMTreeList;
    ColZxf_Gcfy: TPMTreeListColumn;
    ColZxf_Field1: TPMTreeListColumn;
    ColZxf_Field2: TPMTreeListColumn;
    SplitterZxf: TPMSplitter;
    lblZxfBz: TcxLabel;
    ColZxf_Field3: TPMTreeListColumn;
    ColZxf_Field4: TPMTreeListColumn;
    ColZxf_Field5: TPMTreeListColumn;
    ColZxf_Field6: TPMTreeListColumn;
    ColZxf_Field7: TPMTreeListColumn;
    ColZxf_Ckyj: TPMTreeListColumn;
    ColJsglfCkyj: TPMTreeListColumn;
    ColQtfCkyj: TPMTreeListColumn;
    cxTabSheet1: TcxTabSheet;
    pnl6: TPanel;
    lblGcSjf_Gcfy: TcxLabel;
    PopEdtSjfGcfy: TcxPopupEdit;
    lblGcsjf_Dw: TcxLabel;
    lblGcsjf_ZytzXs: TcxLabel;
    EdtSjf_TzXs: TcxTextEdit;
    lblGcsjf_GcfzXs: TcxLabel;
    EdtSjf_FzXs: TcxTextEdit;
    lblGcsjfDW: TcxLabel;
    lbl8: TcxLabel;
    EdtSjf: TcxTextEdit;
    lblGcsjfBz: TcxLabel;
    PMSplitter1: TPMSplitter;
    PMTreeList2: TPMTreeList;
    ColSjf_Gcfy: TPMTreeListColumn;
    ColSjf_Sfjj: TPMTreeListColumn;
    ColSjf_Ckyj: TPMTreeListColumn;
    TSHjyxPjf: TcxTabSheet;
    EdtZxfTzXs: TcxTextEdit;
    pnl7: TPanel;
    lblPjf_Gcfy: TcxLabel;
    PopEdtPjfGcfy: TcxPopupEdit;
    lblPjf_Dw: TcxLabel;
    lblPjf_HytzXs: TcxLabel;
    EdtPjfTzXs: TcxTextEdit;
    lblPjfTzXs: TcxLabel;
    EdtPjfMgXs: TcxTextEdit;
    lblPjfDw: TcxLabel;
    lblPjf_Lb: TcxLabel;
    CkbPjf_Bgs: TcxCheckBox;
    CkbPjf_Bgb: TcxCheckBox;
    lbl9: TcxLabel;
    EdtPjf: TcxTextEdit;
    lblPjfBz: TcxLabel;
    PMSplitter2: TPMSplitter;
    PMTreeList3: TPMTreeList;
    PMTreeListColumn1: TPMTreeListColumn;
    ColPjf_Field1: TPMTreeListColumn;
    ColPjf_Field2: TPMTreeListColumn;
    ColPjf_Field3: TPMTreeListColumn;
    ColPjf_Field4: TPMTreeListColumn;
    ColPjf_Field5: TPMTreeListColumn;
    ColPjf_Field6: TPMTreeListColumn;
    ColPjf_Ckyj: TPMTreeListColumn;
    cxTabSheet2: TcxTabSheet;
    pnl8: TPanel;
    lbl4: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    PMSplitter3: TPMSplitter;
    PMTreeList4: TPMTreeList;
    ColPgf_Lb: TPMTreeListColumn;
    ColPgf_Size: TPMTreeListColumn;
    ColPgf_Bz: TPMTreeListColumn;
    ColPgf_SlSize: TPMTreeListColumn;
    lblPgjLb: TcxLabel;
    RdbPgf_Myjz: TPMRadioButton;
    PMRadioButton1: TPMRadioButton;
    lblPgfDw: TcxLabel;
    lblPgf: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    lblPgf_Dw: TcxLabel;
    ColPgf_Fee: TPMTreeListColumn;
    cxTabSheet3: TcxTabSheet;
    pnl9: TPanel;
    lblJNPgf_XS: TcxLabel;
    EdtJNPgfXs: TcxTextEdit;
    lblJNPgf: TcxLabel;
    EdtJNPgf: TcxTextEdit;
    lblJNPgfDw: TcxLabel;
    lblJNPgf_NH: TcxLabel;
    PopEdtJNPgfNh: TcxPopupEdit;
    lblJNPgf_NHDw: TcxLabel;
    PMSplitter4: TPMSplitter;
    PMTreeList5: TPMTreeList;
    ColJNPgf_NH: TPMTreeListColumn;
    ColJNPgf_Bz: TPMTreeListColumn;
    ColJNPgf_Ckyj: TPMTreeListColumn;
    lblJNPgfBz: TcxLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQtxmCalculator: TfmQtxmCalculator;

implementation
const
  cst_Gcjlf_Bz = '注'+#13#10+
                 '1.工程复杂系数达到III级或者有特别注明的工程可在此费用'+#13#10+
                 '基础上乘以复杂系数1.15~1.25'+#13#10+
                 '2.具体收费标准可根据工程费用在对应的区间内用插入法计算';
  cst_Zxf_Bz = '注'+#13#10+
                 '1.工程费用是指项目投资估算中的建设工程费用。'+#13#10+
                 '2.建设项目的具体收费标准，根据估算投资中工程费用在相对应的区间内用插入法计算。'+#13#10+
                 '3.可行性研究费计费基数原则上以工程费用为准，若编制单位实际发生土地费用测试行为，计算基数可计入土地费用。';
  cst_Gcsjf_Bz = '注'+#13#10+
                 '1.计费额大于2000000元的，以计价额乘以1.36%的收费率计算收费基价。'+#13#10+
                 '2.大型建筑工程指20001㎡及以上的建筑，中型指5001~20000㎡的建筑，小型指5000㎡及以下的建筑。';

  cst_Pjf_Bz = '注'+#13#10+
                 '1.表中数字下限为不含，上限为包含。'+#13#10+
                 '2.本表所列编制环境影响报告表收费标准为不设评价专题基准价，每增加一个专题加收50%。'+#13#10+
                 '3.本表中不包括摇杆，遥测，风动测试，污染气象观测，示踪实验，地探，物探，卫星图片解读，需要动用船、飞机'+#13#10+
                 '等的特殊检测等费用';
  // 节能评估费备注
  cst_JNPjf_Bz = '注'+#13#10+
                 '1.采用分档累进收费。'+#13#10+
                 '2.年用能总量在1000t爆以下的项目，单个项目在0.5万~1.2万区间收费。';

{$R *.dfm}

procedure TfmQtxmCalculator.FormCreate(Sender: TObject);
begin
  lblJlxBz.Caption := cst_Gcjlf_Bz;
  lblZxfBz.Caption := cst_Zxf_Bz;
  lblGcsjfBz.Caption := cst_Gcsjf_Bz;
  lblPjfBz.Caption := cst_Pjf_Bz;
  lblJNPgfBz.Caption := cst_JNPjf_Bz;
end;

end.
