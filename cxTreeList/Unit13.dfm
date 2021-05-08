object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 489
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lst1: TcxTreeList
    Left = 168
    Top = 8
    Width = 409
    Height = 225
    Cursor = crHandPoint
    Hint = 'wrwerwerwer'
    Bands = <
      item
        Caption.Text = #22522#26412#20449#24687
        FixedKind = tlbfLeft
        Styles.Footer = cxStyle1
        Width = 168
      end
      item
        Caption.AlignHorz = taCenter
        Caption.Text = #35814#32454#20449#24687
      end>
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = 'Coffee'
    Navigator.Buttons.CustomButtons = <>
    OptionsBehavior.AlwaysShowEditor = True
    OptionsBehavior.FooterHints = True
    OptionsCustomizing.RowSizing = True
    OptionsData.SummaryNullIgnore = True
    OptionsView.BandLineHeight = 21
    OptionsView.Bands = True
    OptionsView.ExtPaintStyle = True
    OptionsView.Footer = True
    OptionsView.GridLineColor = clHighlight
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.ShowRoot = False
    PopupMenu = pm1
    TabOrder = 0
    OnBandHeaderClick = lst1BandHeaderClick
    OnBeginDragNode = lst1BeginDragNode
    OnCanFocusNode = lst1CanFocusNode
    OnCanSelectNode = lst1CanSelectNode
    OnCollapsed = lst1Collapsed
    OnCollapsing = lst1Collapsing
    OnColumnHeaderClick = lst1ColumnHeaderClick
    OnInitEdit = lst1InitEdit
    OnInitEditValue = lst1InitEditValue
    object cxtrlstclmnlst1Column1: TcxTreeListColumn
      Caption.Text = #24207#21495
      DataBinding.ValueType = 'String'
      Width = 56
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object Col2: TcxTreeListColumn
      PropertiesClassName = 'TcxComboBoxProperties'
      Properties.Items.Strings = (
        '222'
        '8555'
        '855')
      Caption.Text = #29305#21521
      DataBinding.ValueType = 'String'
      Width = 60
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtrlstclmnlst1Column3: TcxTreeListColumn
      Caption.Text = #32534#21495
      DataBinding.ValueType = 'String'
      Width = 52
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
      OnGetEditProperties = cxtrlstclmnlst1Column3GetEditProperties
    end
    object cxtrlstclmnlst1Column4: TcxTreeListColumn
      Caption.Text = #35745#31639#24335
      DataBinding.ValueType = 'String'
      Width = 60
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 1
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtrlstclmnlst1Column5: TcxTreeListColumn
      Caption.Text = #24037#31243#37327
      DataBinding.ValueType = 'String'
      Width = 49
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 1
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtrlstclmnlst1Column6: TcxTreeListColumn
      Caption.Text = #24635#21644#21333#20215
      DataBinding.ValueType = 'String'
      Width = 59
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 1
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxtrlstclmnlst1Column7: TcxTreeListColumn
      Caption.Text = #24635#21644#21512#20215
      DataBinding.ValueType = 'String'
      Width = 62
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 1
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object btnAddCol: TButton
    Left = 8
    Top = 39
    Width = 89
    Height = 25
    Caption = 'btnAddCol'
    TabOrder = 1
    OnClick = btnAddColClick
  end
  object btnAddNode: TButton
    Left = 8
    Top = 70
    Width = 89
    Height = 25
    Caption = 'btnAddNode'
    TabOrder = 2
    OnClick = btnAddNodeClick
  end
  object btnAddSonNode: TButton
    Left = 8
    Top = 101
    Width = 89
    Height = 25
    Caption = 'btnAddSonNode'
    TabOrder = 3
    OnClick = btnAddSonNodeClick
  end
  object btnAddBand: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    Caption = 'btnAddBand'
    TabOrder = 4
  end
  object btnBandCount: TButton
    Left = 8
    Top = 132
    Width = 89
    Height = 25
    Caption = 'btnBandCount'
    TabOrder = 5
    OnClick = btnBandCountClick
  end
  object btntes: TButton
    Left = 8
    Top = 194
    Width = 89
    Height = 25
    Caption = 'btntest'
    TabOrder = 6
  end
  object btnExchangeNode: TButton
    Left = 8
    Top = 163
    Width = 89
    Height = 25
    Caption = 'btnExchangeNode'
    TabOrder = 7
    OnClick = btnExchangeNodeClick
  end
  object btnDelete: TButton
    Left = 8
    Top = 225
    Width = 89
    Height = 25
    Caption = 'btnDelete'
    TabOrder = 8
    OnClick = btnDeleteClick
  end
  object btnColumnValueCount: TButton
    Left = 8
    Top = 256
    Width = 113
    Height = 25
    Caption = 'btnColumnValueCount'
    TabOrder = 9
    OnClick = btnColumnValueCountClick
  end
  object btnDelCol: TButton
    Left = 8
    Top = 287
    Width = 89
    Height = 25
    Caption = 'btnDelCol'
    TabOrder = 10
    OnClick = btnDelColClick
  end
  object btnGetNextSibling: TButton
    Left = 8
    Top = 318
    Width = 113
    Height = 25
    Caption = 'btnGetNextSibling'
    TabOrder = 11
    OnClick = btnGetNextSiblingClick
  end
  object btnShenJi: TButton
    Left = 8
    Top = 349
    Width = 89
    Height = 25
    Caption = 'btnShenJi'
    TabOrder = 12
    OnClick = btnShenJiClick
  end
  object btnGetNode: TButton
    Left = 8
    Top = 380
    Width = 89
    Height = 25
    Caption = 'btnGetNode'
    TabOrder = 13
    OnClick = btnGetNodeClick
  end
  object btnDelNode: TButton
    Left = 8
    Top = 411
    Width = 89
    Height = 25
    Caption = 'btnDelNode'
    TabOrder = 14
    OnClick = btnDelNodeClick
  end
  object btnVisibleCount: TButton
    Left = 144
    Top = 256
    Width = 89
    Height = 25
    Caption = 'btnVisibleCount'
    TabOrder = 15
    OnClick = btnVisibleCountClick
  end
  object btn1: TButton
    Left = 144
    Top = 287
    Width = 89
    Height = 25
    Caption = 'btnFullCollape'
    TabOrder = 16
    OnClick = btn1Click
  end
  object btnFullExopand: TButton
    Left = 144
    Top = 318
    Width = 89
    Height = 25
    Caption = 'btnFullExopand'
    TabOrder = 17
    OnClick = btnFullExopandClick
  end
  object btn_OnInitEdit: TButton
    Left = 144
    Top = 349
    Width = 89
    Height = 25
    Caption = 'btn_OnInitEdit'
    TabOrder = 18
    OnClick = btn_OnInitEditClick
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 128
    Top = 16
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS UI Gothic'
      Font.Style = []
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Styles.Background = cxStyle1
      BuiltIn = True
    end
  end
  object pm1: TPopupMenu
    Left = 128
    Top = 120
  end
  object edtRepo: TcxEditRepository
    Left = 128
    Top = 72
    object cxEditRepository1ComboBoxItem1: TcxEditRepositoryComboBoxItem
      Properties.Items.Strings = (
        'sfs'
        'swer'
        'stwew'
        'fdgw'
        'erq'
        'werqr'
        'qtrwert')
    end
    object cxEditRepository1PopupItem1: TcxEditRepositoryPopupItem
    end
    object cxdtrpstrydtmDate: TcxEditRepositoryDateItem
    end
  end
end
