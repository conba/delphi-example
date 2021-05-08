object main: Tmain
  Left = 0
  Top = 0
  Caption = 'main'
  ClientHeight = 300
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object lblResult: TLabel
    Left = 256
    Top = 160
    Width = 137
    Height = 12
  end
  object btnAdd: TButton
    Left = 72
    Top = 96
    Width = 65
    Height = 25
    Caption = #21152
    TabOrder = 0
  end
  object edtNumOne: TEdit
    Left = 72
    Top = 48
    Width = 89
    Height = 20
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 1
  end
  object edtNumTwo: TEdit
    Left = 189
    Top = 48
    Width = 76
    Height = 20
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 2
  end
  object btnSub: TButton
    Tag = 1
    Left = 143
    Top = 96
    Width = 65
    Height = 25
    Caption = #20943
    TabOrder = 3
  end
  object btnMul: TButton
    Tag = 2
    Left = 214
    Top = 96
    Width = 65
    Height = 25
    Caption = #20056
    TabOrder = 4
  end
  object btnDiv: TButton
    Tag = 3
    Left = 285
    Top = 96
    Width = 65
    Height = 25
    Caption = #38500
    TabOrder = 5
  end
  object rbObjectDelegate: TRadioButton
    Left = 72
    Top = 152
    Width = 89
    Height = 17
    Caption = #23545#35937#30340#22996#25176
    TabOrder = 6
    OnClick = rbObjectDelegateClick
  end
  object rbRegulaDeletete: TRadioButton
    Left = 72
    Top = 175
    Width = 108
    Height = 17
    Caption = #19968#33324#20989#25968#30340#22996#25176
    TabOrder = 7
    OnClick = rbRegulaDeleteteClick
  end
end
