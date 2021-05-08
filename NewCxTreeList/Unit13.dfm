object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 500
  ClientWidth = 1162
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lst1: TcxTreeList
    Left = 72
    Top = 8
    Width = 433
    Height = 273
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    OptionsBehavior.CellHints = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.GridLines = tlglBoth
    TabOrder = 0
    OnClick = lst1Click
    OnCustomDrawDataCell = lst1CustomDrawDataCell
    OnInitEdit = lst1InitEdit
    object clXmmc: TcxTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #39033#30446#21517#31216
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Options.Moving = False
      Options.Sorting = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object clZylx: TcxTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #19987#19994#31867#22411
      DataBinding.ValueType = 'String'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object clCheckBox: TcxTreeListColumn
      Caption.Text = #21160#24577#25511#20214
      DataBinding.ValueType = 'String'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object btn1: TButton
    Left = 575
    Top = 384
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 832
    Top = 24
    Width = 329
    Height = 177
    ImeName = #20013#25991'('#31616#20307') - '#25163#24515#36755#20837#27861
    Lines.Strings = (
      'mmo1')
    TabOrder = 2
  end
  object btn2: TButton
    Left = 872
    Top = 256
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 72
    Top = 304
    Width = 217
    Height = 57
    Caption = #21021#22987#21270'TreeListTable'#21644'Col'#23545#35937
    TabOrder = 4
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 72
    Top = 367
    Width = 129
    Height = 65
    Caption = 'buttonEdit'
    TabOrder = 5
  end
  object btn5: TButton
    Left = 207
    Top = 367
    Width = 139
    Height = 65
    Caption = 'checkBox'
    TabOrder = 6
  end
  object btn6: TButton
    Left = 352
    Top = 367
    Width = 139
    Height = 65
    Caption = 'Combox'
    TabOrder = 7
  end
  object EditRepo: TcxEditRepository
    Left = 672
    Top = 80
    object ZyType: TcxEditRepositoryComboBoxItem
    end
  end
  object EditRep: TcxEditRepository
    Left = 608
    Top = 240
    object EditRptBtnEdt: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
    end
    object EditRptCBK: TcxEditRepositoryCheckBoxItem
    end
    object EditRepCMB: TcxEditRepositoryComboBoxItem
    end
  end
end
