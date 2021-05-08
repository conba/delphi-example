object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Json'#25991#20214#35835#21462
  ClientHeight = 329
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 296
    Width = 663
    Height = 33
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 3
      Top = 0
      Width = 115
      Height = 33
      Align = alCustom
      Caption = #36873#25321#25991#20214
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 128
      Top = 0
      Width = 115
      Height = 33
      Align = alCustom
      Caption = 'ISuperObject'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 253
      Top = 0
      Width = 115
      Height = 33
      Caption = #20889
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 378
      Top = 0
      Width = 115
      Height = 33
      Caption = #35835
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 296
    Align = alClient
    TabOrder = 1
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 336
      Height = 294
      Align = alLeft
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Memo2: TMemo
      Left = 337
      Top = 1
      Width = 325
      Height = 294
      Align = alClient
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      Lines.Strings = (
        '')
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
end
