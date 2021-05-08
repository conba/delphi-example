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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnOne: TButton
    Left = 48
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnOne'
    TabOrder = 0
    OnClick = btnOneClick
  end
  object btnTwo: TButton
    Left = 48
    Top = 48
    Width = 75
    Height = 25
    Caption = 'btnTwo'
    TabOrder = 1
    OnClick = btnTwoClick
  end
  object btnSet: TButton
    Left = 48
    Top = 87
    Width = 75
    Height = 25
    Caption = 'btnSet'
    TabOrder = 2
    OnClick = btnSetClick
  end
  object mmo: TMemo
    Left = 144
    Top = 8
    Width = 185
    Height = 104
    ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
    TabOrder = 3
  end
  object btnshowComponentcount: TButton
    Left = 48
    Top = 128
    Width = 75
    Height = 25
    Caption = 'btnshowComponentcount'
    TabOrder = 4
    OnClick = btnshowComponentcountClick
  end
  object dlgFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 312
    Top = 144
  end
end
