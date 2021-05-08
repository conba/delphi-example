object Form1: TForm1
  Left = 240
  Top = 222
  Width = 641
  Height = 259
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 4
    Width = 197
    Height = 181
    Lines.Strings = (
      'Memo1'
      'alfksdjgf'
      'sdfjkgfsdkl'
      'fsdjkhfgsdl'
      'fgsldkf'
      'fsdhkgsdlf'
      'fsdjkgfsdfklg'
      'sdfhgfsdklg')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 128
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Add tasks'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 216
    Top = 0
    Width = 417
    Height = 232
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo2')
    TabOrder = 2
  end
  object PoolOfThreads1: TPoolOfThreads
    ThreadsMin = 1
    ThreadsMax = 7
    ThreadDeadTimeout = 39000
    OnProcessRequest = PoolOfThreads1ProcessRequest
    OnQueueEmpty = PoolOfThreads1QueueEmpty
    Left = 252
    Top = 32
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 196
    Top = 96
  end
end
