object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 849
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxPopupEdit1: TcxPopupEdit
    Left = 168
    Top = 64
    Properties.PopupControl = Form2.pnl1
    Properties.OnCloseUp = cxPopupEdit1PropertiesCloseUp
    Properties.OnEditValueChanged = cxPopupEdit1PropertiesEditValueChanged
    Properties.OnInitPopup = cxPopupEdit1PropertiesInitPopup
    TabOrder = 0
    OnClick = cxPopupEdit1Click
    OnContextPopup = cxPopupEdit1ContextPopup
    OnDragDrop = cxPopupEdit1DragDrop
    OnDragOver = cxPopupEdit1DragOver
    Width = 121
  end
  object cxComboBox1: TcxComboBox
    Left = 584
    Top = 56
    Properties.OnInitPopup = cxComboBox1PropertiesInitPopup
    TabOrder = 1
    Text = 'cxComboBox1'
    Width = 121
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 344
    Top = 168
    Properties.ListColumns = <>
    Properties.OnInitPopup = cxLookupComboBox1PropertiesInitPopup
    Properties.OnPopup = cxLookupComboBox1PropertiesPopup
    TabOrder = 2
    Width = 145
  end
  object cxCheckBox1: TcxCheckBox
    Left = 552
    Top = 136
    Caption = 'cxCheckBox1'
    Properties.OnChange = cxCheckBox1PropertiesChange
    TabOrder = 3
  end
  object btn1: TButton
    Left = 400
    Top = 224
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 4
    OnClick = btn1Click
  end
end
