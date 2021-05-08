object frmPoolOfThreadEditor: TfrmPoolOfThreadEditor
  Left = 497
  Top = 214
  BorderStyle = bsDialog
  Caption = 'Pool of thread properties'
  ClientHeight = 215
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 109
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 224
      Height = 13
      Caption = 'Count of threads dynamically changed between'
    end
    object Label2: TLabel
      Left = 68
      Top = 32
      Width = 18
      Height = 13
      Caption = 'and'
    end
    object Label3: TLabel
      Left = 148
      Top = 32
      Width = 136
      Height = 13
      Caption = 'depending of request activity'
    end
    object Label4: TLabel
      Left = 12
      Top = 64
      Width = 286
      Height = 13
      Caption = 'Thread will be considered to be dead after processing single '
    end
    object Label5: TLabel
      Left = 12
      Top = 84
      Width = 88
      Height = 13
      Caption = 'request more then '
    end
    object Label7: TLabel
      Left = 168
      Top = 84
      Width = 40
      Height = 13
      Caption = 'seconds'
    end
    object seMin: TSpinEdit
      Left = 12
      Top = 28
      Width = 53
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object seMax: TSpinEdit
      Left = 92
      Top = 28
      Width = 53
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object seDeadTimeOut: TSpinEdit
      Left = 104
      Top = 80
      Width = 61
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 109
    Width = 316
    Height = 106
    Align = alClient
    TabOrder = 1
    object StaticText1: TLabel
      Left = 8
      Top = 4
      Width = 193
      Height = 39
      AutoSize = False
      Caption = 
        'Free for noncommercial use.'#13#10'Please contact with author for use ' +
        'in commercial projects.'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 8
      Top = 68
      Width = 193
      Height = 29
      AutoSize = False
      Caption = 
        'P.S. Components author is interested in remote job or developmen' +
        't contracts.'
      WordWrap = True
    end
    object btOK: TBitBtn
      Left = 211
      Top = 32
      Width = 100
      Height = 28
      TabOrder = 0
      Kind = bkOK
    end
    object btCancel: TBitBtn
      Left = 211
      Top = 64
      Width = 100
      Height = 28
      TabOrder = 1
      Kind = bkCancel
    end
    object StaticText2: TStaticText
      Left = 8
      Top = 48
      Width = 179
      Height = 17
      Cursor = crHandPoint
      Caption = 'Aleksej Petrov, AKPetrov@pisem.net'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 2
      OnClick = StaticText2Click
    end
  end
end
