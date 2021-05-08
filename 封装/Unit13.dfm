object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 341
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 451
    Height = 325
    TabOrder = 0
    object lblName: TLabel
      Left = 24
      Top = 40
      Width = 36
      Height = 12
      Caption = #22995#21517#65306
    end
    object lblAge: TLabel
      Left = 24
      Top = 72
      Width = 36
      Height = 12
      Caption = #24180#40836#65306
    end
    object lblLanguage: TLabel
      Left = 24
      Top = 104
      Width = 36
      Height = 12
      Caption = #35821#35328#65306
    end
    object edtName: TEdit
      Left = 60
      Top = 36
      Width = 121
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
      TabOrder = 0
    end
    object edtAge: TEdit
      Left = 60
      Top = 68
      Width = 121
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
      TabOrder = 1
    end
    object edtLanguage: TEdit
      Left = 60
      Top = 100
      Width = 121
      Height = 20
      ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
      TabOrder = 2
    end
    object chkMale: TCheckBox
      Left = 264
      Top = 38
      Width = 41
      Height = 17
      Caption = #30007
      TabOrder = 3
    end
    object rgColor: TRadioGroup
      Left = 224
      Top = 72
      Width = 185
      Height = 105
      Caption = #32932#33394
      Items.Strings = (
        #30333#33394
        #40657#33394
        #40644#33394
        #28145#33394)
      TabOrder = 4
    end
    object btnAdd: TButton
      Left = 52
      Top = 264
      Width = 49
      Height = 25
      Caption = #28155#21152
      TabOrder = 5
      OnClick = btnAddClick
    end
    object btnEdit: TButton
      Left = 190
      Top = 264
      Width = 45
      Height = 25
      Caption = #36864#20986
      TabOrder = 6
      OnClick = btnEditClick
    end
    object btnGreet: TButton
      Left = 147
      Top = 264
      Width = 43
      Height = 25
      Caption = #38382#20505
      TabOrder = 7
      OnClick = btnGreetClick
    end
    object btnDelete: TButton
      Left = 101
      Top = 264
      Width = 46
      Height = 25
      Caption = #21024#38500
      TabOrder = 8
      OnClick = btnDeleteClick
    end
    object dbnvgrInfo: TDBNavigator
      Left = 52
      Top = 233
      Width = 184
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 9
      OnClick = dbnvgrInfoClick
    end
  end
  object dsInfo: TDataSource
    Left = 336
    Top = 240
  end
end
