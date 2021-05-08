object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTest: TLabel
    Left = 84
    Top = 104
    Width = 31
    Height = 13
    Caption = 'lblTest'
  end
  object rgTest: TRadioGroup
    Left = 384
    Top = 40
    Width = 185
    Height = 105
    Caption = 'rgTest'
    TabOrder = 0
  end
  object btnTest: TButton
    Left = 40
    Top = 40
    Width = 75
    Height = 25
    Caption = 'btnTest'
    TabOrder = 1
    OnClick = btnTestClick
  end
  object btn1: TButton
    Left = 575
    Top = 40
    Width = 49
    Height = 25
    Caption = 'btn1'
    TabOrder = 2
    OnClick = btn1Click
  end
  object grp1: TGroupBox
    Left = 144
    Top = 12
    Width = 185
    Height = 105
    Caption = 'grp1'
    TabOrder = 3
    object btn2: TButton
      Left = 56
      Top = 40
      Width = 75
      Height = 25
      Caption = 'btn2'
      TabOrder = 0
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 80
      Top = 71
      Width = 75
      Height = 25
      Action = act1
      TabOrder = 1
    end
  end
  object pnl1: TPanel
    Left = 8
    Top = 160
    Width = 185
    Height = 41
    Caption = 'pnl1'
    TabOrder = 4
    object btn4: TButton
      Left = 56
      Top = 8
      Width = 75
      Height = 25
      Caption = 'btn4'
      TabOrder = 0
      OnClick = btn4Click
    end
  end
  object pnl2: TPanel
    Left = 8
    Top = 216
    Width = 185
    Height = 41
    Caption = 'pnl2'
    TabOrder = 5
  end
  object actlst1: TActionList
    Left = 440
    Top = 192
    object act1: TAction
      Caption = 'act1'
      OnExecute = act1Execute
    end
  end
end
