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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'test_implicit'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'test_Explicit'
    TabOrder = 1
    OnClick = btn2Click
  end
end
