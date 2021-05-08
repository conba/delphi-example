object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 326
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnBicycle: TButton
    Left = 32
    Top = 40
    Width = 75
    Height = 25
    Caption = #33258#34892#36710
    TabOrder = 0
    OnClick = btnBicycleClick
  end
  object btnCar: TButton
    Left = 32
    Top = 88
    Width = 75
    Height = 25
    Caption = #27773#36710
    TabOrder = 1
    OnClick = btnCarClick
  end
  object btnClose: TButton
    Left = 32
    Top = 136
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object chkGPS: TCheckBox
    Left = 176
    Top = 44
    Width = 41
    Height = 17
    Caption = 'GPS'
    TabOrder = 3
    OnClick = chkGPSClick
  end
end
