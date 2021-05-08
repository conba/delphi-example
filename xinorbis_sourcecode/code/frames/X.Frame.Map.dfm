object FrameMap: TFrameMap
  Left = 0
  Top = 0
  Width = 1064
  Height = 408
  DoubleBuffered = True
  Color = 3355443
  ParentBackground = False
  ParentColor = False
  ParentDoubleBuffered = False
  TabOrder = 0
  Visible = False
  DesignSize = (
    1064
    408)
  object pMap: TPanel
    Left = 10
    Top = 60
    Width = 1032
    Height = 333
    Cursor = crHandPoint
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1064
    Height = 54
    Align = alTop
    TabOrder = 1
    DesignSize = (
      1064
      54)
    object lMapFolder: TLabel
      Left = 260
      Top = 4
      Width = 4
      Height = 13
      Caption = '.'
    end
    object lMapDetails: THTMLabel
      Left = 260
      Top = 20
      Width = 809
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HTMLText.Strings = (
        '.')
      ParentColor = False
      ParentFont = False
      Transparent = True
      Version = '2.1.0.0'
    end
    object lMapDetails2: THTMLabel
      Left = 260
      Top = 36
      Width = 800
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HTMLText.Strings = (
        '.')
      ParentColor = False
      ParentFont = False
      Transparent = True
      Version = '2.1.0.0'
    end
    object lMapSize: TLabel
      Left = 8
      Top = 32
      Width = 4
      Height = 13
      Caption = '.'
    end
    object shapeMap: TShape
      Left = 222
      Top = 2
      Width = 32
      Height = 46
    end
    object cbMapSize: TAdvOfficeRadioButton
      Left = 10
      Top = 0
      Width = 100
      Height = 20
      Hint = 'graph by size of files'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = cbMapSizeClick
      Alignment = taLeftJustify
      Caption = '.'
      Checked = True
      ReturnIsTab = False
      Version = '1.5.0.9'
    end
    object cbMapQuantity: TAdvOfficeRadioButton
      Left = 116
      Top = 0
      Width = 100
      Height = 20
      Hint = 'graph by number of files'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cbMapSizeClick
      Alignment = taLeftJustify
      Caption = '.'
      ReturnIsTab = False
      Version = '1.5.0.9'
    end
    object cbMapSizeSelect: TComboBox
      Left = 72
      Top = 27
      Width = 38
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'A'
      OnChange = cbMapSizeSelectChange
      Items.Strings = (
        'A'
        'B')
    end
    object cbHighlightMode: TAdvOfficeCheckBox
      Left = 148
      Top = 27
      Width = 21
      Height = 20
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = cbHighlightModeClick
      Alignment = taLeftJustify
      Caption = ''
      ReturnIsTab = False
      State = cbChecked
      Version = '1.5.0.9'
    end
  end
end
