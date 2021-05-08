object FrmWeapon: TFrmWeapon
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #36873#25321#27494#22120
  ClientHeight = 114
  ClientWidth = 139
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
  object rgWeapon: TRadioGroup
    Left = 0
    Top = 0
    Width = 139
    Height = 81
    Align = alTop
    Caption = #27494#22120#31181#31867
    Items.Strings = (
      #21073
      #24339)
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 32
    Top = 87
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOKClick
  end
end
