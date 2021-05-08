object FrmRglx: TFrmRglx
  Left = 0
  Top = 0
  Caption = #20154#24037#31867#22411
  ClientHeight = 225
  ClientWidth = 161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRglx: TPanel
    Left = 0
    Top = 0
    Width = 161
    Height = 225
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object CLBRgLx: TPMCheckListBox
      Left = 2
      Top = 23
      Width = 157
      Height = 200
      Align = alClient
      ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
      Items = <>
      TabOrder = 0
      OnEditValueChanged = CLBRgLxEditValueChanged
    end
    object edtRglx: TcxTextEdit
      Left = 2
      Top = 2
      Align = alTop
      TabOrder = 1
      Width = 157
    end
  end
end
