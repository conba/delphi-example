object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 327
  ClientWidth = 635
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
  object edt1: TEdit
    Left = 384
    Top = 40
    Width = 121
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
    TabOrder = 0
    Text = #31649
  end
  object btn1: TButton
    Left = 528
    Top = 38
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 1
    OnClick = btn1Click
  end
  object lst1: TPMTreeList
    Left = 16
    Top = 40
    Width = 369
    Height = 233
    Bands = <
      item
      end>
    DefaultRowHeight = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Navigator.Buttons.CustomButtons = <>
    OptionsBehavior.ExpandOnDblClick = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Deleting = False
    OptionsView.GridLines = tlglBoth
    ParentFont = False
    TabOrder = 2
    BookMark = False
    CanEditOpration = True
    ShowIndicatorRowIndex = False
    Data = {
      00000500710200000F00000044617461436F6E74726F6C6C6572310300000012
      000000546378537472696E6756616C7565547970651200000054637853747269
      6E6756616C75655479706512000000546378537472696E6756616C7565547970
      6502000000445855464D54000006000000610073006400610073006400000600
      0000610073006400610073006400000600000061007300640061007300640044
      5855464D540000020000003100320000BB0000007B005C007200740066003100
      5C0061006E00730069005C00640065006600660030007B005C0066006F006E00
      7400740062006C007B005C00660030005C0066006E0069006C005C0066006300
      68006100720073006500740031003300340020005C002700630062005C002700
      630065005C002700630063005C002700650035003B007D007B005C0066003100
      5C0066006E0069006C0020005C002700630062005C002700630065005C002700
      630063005C002700650035003B007D007D000D000A007B005C002A005C006700
      65006E0065007200610074006F00720020004D00730066007400650064006900
      7400200035002E00340031002E00320031002E0032003500310030003B007D00
      5C0076006900650077006B0069006E00640034005C007500630031005C007000
      6100720064005C006C0061006E00670032003000350032005C00660030005C00
      660073003100380020003100320031005C00660031005C007000610072000D00
      0A007D000D000A0000000002000000310032000200000000000000080A000000
      0000000000FFFFFFFFFFFFFFFFFFFFFFFF01000000080A0000000000000000FF
      FFFFFFFFFFFFFFFFFFFFFF1A0802000000}
    object pmtrlstclmnlst1PMTreeListColumn1: TPMTreeListColumn
      PropertiesClassName = 'TcxRichEditProperties'
      RepositoryItem = richitem1
      DataBinding.ValueType = 'String'
      Options.Moving = False
      Options.Sorting = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object pmtrlstclmnlst1PMTreeListColumn2: TPMTreeListColumn
      PropertiesClassName = 'TcxRichEditProperties'
      DataBinding.ValueType = 'String'
      Options.Moving = False
      Options.Sorting = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object pmtrlstclmnlst1PMTreeListColumn3: TPMTreeListColumn
      DataBinding.ValueType = 'String'
      Options.Moving = False
      Options.Sorting = False
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object re1: TRichEdit
    Left = 391
    Top = 67
    Width = 170
    Height = 157
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
    Lines.Strings = (
      're1'
      'asdasdasdasdasdasdasdasdasd'
      '1.'#23433#35013#37096#20301':'#31649#20117
      '2.'#20171#36136':'#20919#27700
      '3.'#26448#36136':'#26080#35268#20849#32858#32858#19993#28911'(PP-R)'
      #32473#27700#31649' S4'#31995#21015
      '4.'#35268#26684':De25'
      '5.'#36830#25509#24418#24335':'#28909#29076#36830#25509
      '6.'#21387#21147#35797#39564#21450#20914#27927#12289#28040#27602)
    ParentFont = False
    TabOrder = 3
  end
  object btn2: TButton
    Left = 168
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 4
    OnClick = btn2Click
  end
  object redt1: TPMRichEdit
    Left = 391
    Top = 230
    Properties.OnChange = redt1PropertiesChange
    Lines.Strings = (
      'redt1')
    TabOrder = 5
    Height = 89
    Width = 226
  end
  object btn3: TButton
    Left = 376
    Top = 9
    Width = 75
    Height = 25
    Caption = 'btn3'
    TabOrder = 6
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 272
    Top = 294
    Width = 75
    Height = 25
    Caption = 'btn4'
    TabOrder = 7
    OnClick = btn4Click
  end
  object re11: TcxRichEdit
    Left = 72
    Top = 160
    Lines.Strings = (
      're1'
      'asdasdasdasdasdasdasdasdasd')
    TabOrder = 8
    Height = 89
    Width = 185
  end
  object cxEditRepository1: TcxEditRepository
    Left = 512
    Top = 160
    object richitem1: TcxEditRepositoryRichItem
      Properties.PlainText = True
    end
  end
end
