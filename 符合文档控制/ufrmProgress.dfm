object frmProgress: TfrmProgress
  Left = 286
  Top = 287
  BorderStyle = bsNone
  Caption = 'frmProgress'
  ClientHeight = 64
  ClientWidth = 348
  Color = 15856113
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object pnlContainer: TShape
    Left = 0
    Top = 0
    Width = 348
    Height = 64
    Align = alClient
    Brush.Color = 16448250
    Pen.Color = 16448250
  end
  object lblTitle: TLabel
    Left = 6
    Top = 3
    Width = 48
    Height = 12
    Caption = 'lblTitle'
    Transparent = True
  end
  object Label1: TLabel
    Left = 6
    Top = 19
    Width = 60
    Height = 12
    Caption = #35831#31245#20505'....'
    Transparent = True
  end
  object lblPer: TLabel
    Left = 315
    Top = 20
    Width = 12
    Height = 12
    Caption = '  '
    Transparent = True
  end
  object ProgressBar: TProgressBar
    Left = 6
    Top = 38
    Width = 333
    Height = 18
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 88
    Top = 8
  end
end
