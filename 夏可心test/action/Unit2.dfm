object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
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
  object btn1: TButton
    Left = 223
    Top = 120
    Width = 75
    Height = 25
    Action = act1
    Caption = '1'
    TabOrder = 0
  end
  object btn2: TButton
    Left = 352
    Top = 120
    Width = 75
    Height = 25
    Action = act1
    Caption = '2'
    TabOrder = 1
  end
  object alActions: TActionList
    Left = 304
    Top = 168
    object act1: TAction
      OnExecute = act1Execute
    end
  end
end
