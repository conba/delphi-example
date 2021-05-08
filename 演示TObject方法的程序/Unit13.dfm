object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 305
  ClientWidth = 396
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
  object lstInfo: TListBox
    Left = 8
    Top = 8
    Width = 241
    Height = 289
    ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
    ItemHeight = 13
    TabOrder = 0
  end
  object btnTest: TButton
    Left = 272
    Top = 24
    Width = 75
    Height = 25
    Caption = 'btnTest'
    TabOrder = 1
    OnClick = btnTestClick
  end
  object edtTest: TEdit
    Left = 272
    Top = 80
    Width = 75
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
    TabOrder = 2
    Text = 'edtTest'
    OnClick = edtTestClick
  end
  object chkTest: TCheckBox
    Left = 272
    Top = 120
    Width = 75
    Height = 17
    Caption = 'chkTest'
    TabOrder = 3
    OnClick = chkTestClick
  end
  object rbTest: TRadioButton
    Left = 272
    Top = 160
    Width = 75
    Height = 17
    Caption = 'rbTest'
    TabOrder = 4
    OnClick = rbTestClick
  end
end
