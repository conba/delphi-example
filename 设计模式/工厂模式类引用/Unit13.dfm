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
  object lbl1: TLabel
    Left = 472
    Top = 200
    Width = 89
    Height = 25
    Caption = 'lbl1'
  end
  object rg1: TRadioGroup
    Left = 408
    Top = 24
    Width = 185
    Height = 105
    Caption = 'rg1'
    Items.Strings = (
      'TMonthCalendar'
      'TMemo'
      'TColorBox')
    TabOrder = 0
  end
  object btn1: TButton
    Left = 472
    Top = 152
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object cal1: TMonthCalendar
    Left = 8
    Top = 8
    Width = 218
    Height = 178
    Date = 43696.464329351850000000
    ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
    TabOrder = 2
  end
end
