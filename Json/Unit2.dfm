object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 288
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PMTreeList1: TPMTreeList
    Left = 32
    Top = 8
    Width = 409
    Height = 193
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
    ParentFont = False
    TabOrder = 0
    BookMark = False
    CanEditOpration = True
    ShowIndicatorRowIndex = False
    object PMTreeList1PMTreeListColumn1: TPMTreeListColumn
      Caption.Text = '111'
      DataBinding.ValueType = 'String'
      Options.Moving = False
      Options.Sorting = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object PMTreeList1PMTreeListColumn2: TPMTreeListColumn
      Caption.Text = '222'
      DataBinding.ValueType = 'String'
      Options.Moving = False
      Options.Sorting = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object PMTreeList1PMTreeListColumn3: TPMTreeListColumn
      Caption.Text = '333'
      DataBinding.ValueType = 'String'
      Options.Moving = False
      Options.Sorting = False
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object PMTreeList1PMTreeListColumn4: TPMTreeListColumn
      Caption.Text = '444'
      DataBinding.ValueType = 'String'
      Options.Moving = False
      Options.Sorting = False
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object Button1: TButton
    Left = 184
    Top = 233
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
