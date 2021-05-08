object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 172
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtOne: TEdit
    Left = 32
    Top = 24
    Width = 65
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 0
  end
  object edtTwo: TEdit
    Left = 103
    Top = 24
    Width = 65
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 32
    Top = 64
    Width = 65
    Height = 25
    Caption = 'btnOK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object edtThree: TEdit
    Left = 174
    Top = 24
    Width = 65
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 3
  end
  object btnWeiTuo: TButton
    Left = 32
    Top = 95
    Width = 75
    Height = 25
    Caption = 'btnWeiTuo'
    TabOrder = 4
    OnClick = btnWeiTuoClick
  end
  object btnGetComputerName: TButton
    Left = 128
    Top = 96
    Width = 75
    Height = 25
    Caption = 'btnGetComputerName'
    TabOrder = 5
    OnClick = btnGetComputerNameClick
  end
  object btnParamTest: TButton
    Left = 32
    Top = 126
    Width = 75
    Height = 25
    Caption = 'btnParamTest'
    TabOrder = 6
    OnClick = btnParamTestClick
  end
end
