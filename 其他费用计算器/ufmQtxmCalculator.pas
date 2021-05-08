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
  cst_Gcjlf_Bz = 'ע'+#13#10+
                 '1.���̸���ϵ���ﵽIII���������ر�ע���Ĺ��̿��ڴ˷���'+#13#10+
                 '�����ϳ��Ը���ϵ��1.15~1.25'+#13#10+
                 '2.�����շѱ�׼�ɸ��ݹ��̷����ڶ�Ӧ���������ò��뷨����';
  cst_Zxf_Bz = 'ע'+#13#10+
                 '1.���̷�����ָ��ĿͶ�ʹ����еĽ��蹤�̷��á�'+#13#10+
                 '2.������Ŀ�ľ����շѱ�׼�����ݹ���Ͷ���й��̷��������Ӧ���������ò��뷨���㡣'+#13#10+
                 '3.�������о��ѼƷѻ���ԭ�����Թ��̷���Ϊ׼�������Ƶ�λʵ�ʷ������ط��ò�����Ϊ����������ɼ������ط��á�';
  cst_Gcsjf_Bz = 'ע'+#13#10+
                 '1.�ƷѶ����2000000Ԫ�ģ��ԼƼ۶����1.36%���շ��ʼ����շѻ��ۡ�'+#13#10+
                 '2.���ͽ�������ָ20001�O�����ϵĽ���������ָ5001~20000�O�Ľ�����С��ָ5000�O�����µĽ�����';

  cst_Pjf_Bz = 'ע'+#13#10+
                 '1.������������Ϊ����������Ϊ������'+#13#10+
                 '2.�������б��ƻ���Ӱ�챨����շѱ�׼Ϊ��������ר���׼�ۣ�ÿ����һ��ר�����50%��'+#13#10+
                 '3.�����в�����ҡ�ˣ�ң�⣬�綯���ԣ���Ⱦ����۲⣬ʾ��ʵ�飬��̽����̽������ͼƬ�������Ҫ���ô����ɻ�'+#13#10+
                 '�ȵ�������ȷ���';
  // ���������ѱ�ע
  cst_JNPjf_Bz = 'ע'+#13#10+
                 '1.���÷ֵ��۽��շѡ�'+#13#10+
                 '2.������������1000t�����µ���Ŀ��������Ŀ��0.5��~1.2�������շѡ�';

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
