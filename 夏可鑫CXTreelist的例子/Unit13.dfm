object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lst1: TcxTreeList
    Left = 8
    Top = 8
    Width = 297
    Height = 169
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    TabOrder = 0
    object cxtrlstclmnclo: TcxTreeListColumn
      PropertiesClassName = 'TcxButtonEditProperties'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxtrlstclmncloPropertiesButtonClick
      DataBinding.ValueType = 'String'
      Options.ShowEditButtons = eisbAlways
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
      OnGetEditProperties = cxtrlstclmncloGetEditProperties
    end
  end
  object cxdtrpstry: TcxEditRepository
    Left = 312
    Top = 152
  end
end
