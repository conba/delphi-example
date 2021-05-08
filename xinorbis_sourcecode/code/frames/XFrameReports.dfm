object FrameReports: TFrameReports
  Left = 0
  Top = 0
  Width = 1570
  Height = 763
  Align = alClient
  TabOrder = 0
  OnResize = pMainReportsResize
  ExplicitWidth = 451
  ExplicitHeight = 304
  object pMainReports: TAdvSmoothTabPager
    Left = 0
    Top = 0
    Width = 1570
    Height = 763
    Margins.Right = 1
    Fill.Color = 16575452
    Fill.ColorTo = 16571329
    Fill.ColorMirror = clNone
    Fill.ColorMirrorTo = clNone
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 13542013
    Fill.Rounding = 0
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Transparent = False
    Align = alClient
    ActivePage = tsTable
    TabPosition = tpTopLeft
    TabTextOrientation = toHorizontal
    TabSettings.StartMargin = 4
    TabReorder = False
    OnChange = pMainReportsChange
    TabOrder = 0
    ExplicitWidth = 451
    ExplicitHeight = 304
    object tsTable: TAdvSmoothTabPage
      AlignWithMargins = True
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      ImageIndex = 0
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Alignment = taLeftJustify
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 0
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object splitTable: TAdvSplitter
        Left = 316
        Top = 26
        Height = 707
        OnCanResize = splitTableCanResize
        OnMoved = splitTableMoved
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 344
        ExplicitTop = 280
        ExplicitHeight = 100
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 1564
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        Color = clWhite
        FullRepaint = False
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 445
        object sbMainPie: TSpeedButton
          Tag = 1
          Left = 0
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Down = True
          Flat = True
          NumGlyphs = 2
          OnClick = sbMainPieClick
        end
        object sbMainBar: TSpeedButton
          Tag = 1
          Left = 24
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Flat = True
          OnClick = sbMainBarClick
        end
        object sbMainConfig: TSpeedButton
          Tag = 1
          Left = 52
          Top = 1
          Width = 24
          Height = 22
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C21E0000C21E00000000000000000000FFFFFF5199FF
            2981FF217DFF63A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4995FFA0C7FF
            83B7FF7FB4FF97C2FF5399FF67A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
            A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1CAFF79B3FF
            A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
            C5FF599EFF70ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7CDFF7EB7FFA9CEFFA8CDFF70
            ACFF5F9AEE8C8C8CEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
            87979797C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9CFFF84B6F794
            9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989C8C8C8FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1939393D4D4D4C8C8C8BCBCBCBABA
            BAC2C2C2C4C4C4999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AE4E4E4CFCFCFACACACFFFF
            FF8E8E8E8C8C8C8C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFABABABE2E2E2E7E7E7B9B9B9939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D49F9F9FE4E4E4EEEEEE9696
            96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFD4D4D4ACACAC9D9D9D9B9B9BFFFFFFFFFFFFFFFFFF}
          OnClick = sbMainConfigClick
        end
        object cbGraphSize: TAdvOfficeRadioButton
          Left = 90
          Top = 3
          Width = 100
          Height = 20
          Hint = 'graph by size of files'
          TabOrder = 0
          TabStop = True
          OnClick = cbGraphSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
        object cbGraphQuantity: TAdvOfficeRadioButton
          Left = 195
          Top = 3
          Width = 100
          Height = 20
          Hint = 'graph by number of files'
          TabOrder = 1
          OnClick = cbGraphSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
      end
      object sgMainReport: TAdvStringGrid
        Left = 2
        Top = 26
        Width = 314
        Height = 707
        Cursor = crDefault
        Hint = 'double click to see all files belonging to the category'
        Align = alLeft
        ColCount = 11
        DefaultRowHeight = 17
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        PopupMenu = puTable
        ScrollBars = ssBoth
        TabOrder = 1
        OnDblClick = sgMainReportDblClick
        OnDrawCell = sgMainReportDrawCell
        GridLineColor = 15527152
        GridFixedLineColor = 13947601
        HoverRowCells = [hcNormal, hcSelected]
        OnCanSort = sgMainReportCanSort
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 16575452
        ActiveCellColorTo = 16571329
        Bands.Active = True
        Bands.PrimaryColor = 16381426
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientMirrorFrom = 16049884
        ControlLook.FixedGradientMirrorTo = 16247261
        ControlLook.FixedGradientHoverFrom = 16710648
        ControlLook.FixedGradientHoverTo = 16446189
        ControlLook.FixedGradientHoverMirrorFrom = 16049367
        ControlLook.FixedGradientHoverMirrorTo = 15258305
        ControlLook.FixedGradientDownFrom = 15853789
        ControlLook.FixedGradientDownTo = 15852760
        ControlLook.FixedGradientDownMirrorFrom = 15522767
        ControlLook.FixedGradientDownMirrorTo = 15588559
        ControlLook.FixedGradientDownBorder = 14007466
        ControlLook.ControlStyle = csWinXP
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDown.TextChecked = 'Checked'
        FilterDropDown.TextUnChecked = 'Unchecked'
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedRowHeight = 17
        FixedRowAlways = True
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clBlack
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        Look = glWin7
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        PrintSettings.PrintGraphics = True
        SearchFooter.Color = 16645370
        SearchFooter.ColorTo = 16247261
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SearchFooter.ResultFormat = '(%d of %d)'
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        SortSettings.HeaderColor = 16579058
        SortSettings.HeaderColorTo = 16579058
        SortSettings.HeaderMirrorColor = 16380385
        SortSettings.HeaderMirrorColorTo = 16182488
        Version = '8.2.2.0'
        ExplicitHeight = 248
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
        RowHeights = (
          17
          17)
      end
      object vtcMain: TChart
        Left = 319
        Top = 26
        Width = 1247
        Height = 707
        AllowPanning = pmNone
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Gradient.EndColor = 15719898
        Gradient.Visible = True
        LeftWall.Color = clGray
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginBottom = 0
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 0
        Title.Font.Style = [fsItalic]
        Title.Text.Strings = (
          '.....')
        AxisVisible = False
        ClipPoints = False
        Frame.Visible = False
        LeftAxis.Inverted = True
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        Zoom.Allow = False
        Align = alClient
        BevelOuter = bvLowered
        Color = clSilver
        TabOrder = 2
        OnMouseDown = vtcMainMouseDown
        OnMouseMove = vtcMainMouseMove
        ExplicitWidth = 128
        ExplicitHeight = 248
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TPieSeries
          Marks.Arrow.Color = clBlack
          Marks.BackColor = clWhite
          Marks.Callout.Arrow.Color = clBlack
          Marks.Color = clWhite
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          Gradient.Balance = 10
          Gradient.Direction = gdDiagonalUp
          Gradient.EndColor = 919731
          Gradient.StartColor = 919731
          Gradient.Visible = True
          OtherSlice.Legend.Visible = False
          OtherSlice.Text = 'Other'
          PiePen.Visible = False
        end
      end
    end
    object tsFileTypes: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Alignment = taLeftJustify
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 1
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object splitterTree: TAdvSplitter
        Left = 435
        Top = 26
        Height = 707
        OnCanResize = splitterTreeCanResize
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 472
        ExplicitTop = 336
        ExplicitHeight = 100
      end
      object Panel10: TPanel
        Left = 2
        Top = 2
        Width = 1564
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        FullRepaint = False
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 445
        object sbTreePie: TSpeedButton
          Tag = 2
          Left = 0
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Down = True
          Flat = True
          OnClick = sbMainPieClick
        end
        object sbTreeBar: TSpeedButton
          Tag = 2
          Left = 24
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Flat = True
          OnClick = sbMainBarClick
        end
        object SpeedButton14: TSpeedButton
          Tag = 2
          Left = 52
          Top = 1
          Width = 24
          Height = 22
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C21E0000C21E00000000000000000000FFFFFF5199FF
            2981FF217DFF63A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4995FFA0C7FF
            83B7FF7FB4FF97C2FF5399FF67A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
            A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1CAFF79B3FF
            A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
            C5FF599EFF70ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7CDFF7EB7FFA9CEFFA8CDFF70
            ACFF5F9AEE8C8C8CEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
            87979797C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9CFFF84B6F794
            9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989C8C8C8FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1939393D4D4D4C8C8C8BCBCBCBABA
            BAC2C2C2C4C4C4999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AE4E4E4CFCFCFACACACFFFF
            FF8E8E8E8C8C8C8C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFABABABE2E2E2E7E7E7B9B9B9939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D49F9F9FE4E4E4EEEEEE9696
            96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFD4D4D4ACACAC9D9D9D9B9B9BFFFFFFFFFFFFFFFFFF}
          OnClick = sbMainConfigClick
        end
        object cbTreeSize: TAdvOfficeRadioButton
          Left = 90
          Top = 3
          Width = 100
          Height = 20
          Hint = 'graph by size of files'
          TabOrder = 0
          TabStop = True
          OnClick = cbTreeSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
        object cbTreeQuantity: TAdvOfficeRadioButton
          Left = 195
          Top = 3
          Width = 100
          Height = 20
          Hint = 'graph by number of files'
          TabOrder = 1
          OnClick = cbTreeSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
      end
      object vtcTree: TChart
        Tag = 2
        Left = 438
        Top = 26
        Width = 1128
        Height = 707
        AllowPanning = pmNone
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = 15719898
        Gradient.Visible = True
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginBottom = 0
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 0
        Title.Text.Strings = (
          '.....')
        AxisVisible = False
        ClipPoints = False
        Frame.Visible = False
        LeftAxis.Inverted = True
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        Zoom.Allow = False
        Align = alClient
        BevelOuter = bvLowered
        PopupMenu = puCharts
        TabOrder = 1
        ExplicitWidth = 9
        ExplicitHeight = 248
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object PieSeries2: TPieSeries
          Marks.Arrow.Color = clBlack
          Marks.BackColor = clWhite
          Marks.Callout.Arrow.Color = clBlack
          Marks.Color = clWhite
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          Gradient.Balance = 10
          Gradient.Direction = gdDiagonalUp
          Gradient.EndColor = 919731
          Gradient.StartColor = 919731
          Gradient.Visible = True
          OtherSlice.Legend.Visible = False
          OtherSlice.Text = 'Other'
          PiePen.Visible = False
        end
      end
      object pTree: TPanel
        Left = 2
        Top = 26
        Width = 433
        Height = 707
        Align = alLeft
        TabOrder = 2
        ExplicitHeight = 248
        object sgFileTypes: TAdvStringGrid
          Left = 1
          Top = 544
          Width = 431
          Height = 162
          Cursor = crDefault
          Hint = 'double click any attribute to see all files with that attribute'
          Align = alBottom
          ColCount = 8
          DefaultRowHeight = 17
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 9
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnDblClick = sgFileTypesDblClick
          OnDrawCell = sgFileTypesDrawCell
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 16575452
          ActiveCellColorTo = 16571329
          Bands.Active = True
          Bands.PrimaryColor = 16381426
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientMirrorFrom = 16049884
          ControlLook.FixedGradientMirrorTo = 16247261
          ControlLook.FixedGradientHoverFrom = 16710648
          ControlLook.FixedGradientHoverTo = 16446189
          ControlLook.FixedGradientHoverMirrorFrom = 16049367
          ControlLook.FixedGradientHoverMirrorTo = 15258305
          ControlLook.FixedGradientDownFrom = 15853789
          ControlLook.FixedGradientDownTo = 15852760
          ControlLook.FixedGradientDownMirrorFrom = 15522767
          ControlLook.FixedGradientDownMirrorTo = 15588559
          ControlLook.FixedGradientDownBorder = 14007466
          ControlLook.ControlStyle = csWinXP
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Tahoma'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDown.TextChecked = 'Checked'
          FilterDropDown.TextUnChecked = 'Unchecked'
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Larger than'
            'Smaller than'
            'Clear')
          FixedRowHeight = 17
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clBlack
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          HoverButtons.Buttons = <>
          HoverButtons.Position = hbLeftFromColumnLeft
          HTMLSettings.ImageFolder = 'images'
          HTMLSettings.ImageBaseName = 'img'
          Look = glWin7
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'MS Sans Serif'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          SearchFooter.Color = 16645370
          SearchFooter.ColorTo = 16247261
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'MS Sans Serif'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurrence'
          SearchFooter.HintFindPrev = 'Find previous occurrence'
          SearchFooter.HintHighlight = 'Highlight occurrences'
          SearchFooter.MatchCaseCaption = 'Match case'
          SearchFooter.ResultFormat = '(%d of %d)'
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '8.2.2.0'
          ExplicitTop = 513
          ColWidths = (
            64
            64
            64
            64
            64
            64
            64
            64)
          RowHeights = (
            17
            17
            17
            17
            17
            17
            17
            17
            17)
        end
        object tvFileTypes: THTMLTreeview
          Left = 1
          Top = 1
          Width = 431
          Height = 543
          Hint = 'double click any extension to see a list of files'
          ItemHeight = 16
          SelectionNFColor = clSilver
          SelectionNFFontColor = clBlack
          Align = alClient
          Indent = 19
          PopupMenu = puType
          TabOrder = 1
          OnClick = tvFileTypesClick
          OnDblClick = tvFileTypesDblClick
          Version = '1.4.1.3'
          ExplicitHeight = 84
        end
      end
    end
    object tsExtensions: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 2
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object Panel38: TPanel
        Left = 2
        Top = 2
        Width = 1564
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 445
        object cbExtensionsAll: TAdvOfficeCheckBox
          Left = 4
          Top = 2
          Width = 110
          Height = 20
          Checked = True
          TabOrder = 0
          OnClick = cbExtensionsAllClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          State = cbChecked
          Version = '1.4.1.1'
        end
        object cbExtensionsOther: TAdvOfficeCheckBox
          Left = 237
          Top = 3
          Width = 127
          Height = 20
          Checked = True
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = ''
          ReturnIsTab = False
          State = cbChecked
          Version = '1.4.1.1'
        end
        object cbExtensionsCustom: TAdvOfficeCheckBox
          Left = 230
          Top = 35
          Width = 113
          Height = 20
          Checked = True
          TabOrder = 2
          Alignment = taLeftJustify
          Caption = ''
          ReturnIsTab = False
          State = cbChecked
          Version = '1.4.1.1'
        end
        object cbExtensionColourCode: TAdvOfficeCheckBox
          Left = 370
          Top = 3
          Width = 149
          Height = 20
          TabOrder = 3
          OnClick = cbExtensionColourCodeClick
          Alignment = taLeftJustify
          Caption = ''
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
        object AdvOfficeCheckBox1: TAdvOfficeCheckBox
          Left = 112
          Top = 3
          Width = 113
          Height = 20
          Checked = True
          TabOrder = 4
          OnClick = cbExtensionsAllClick
          Alignment = taLeftJustify
          Caption = ''
          ReturnIsTab = False
          State = cbChecked
          Version = '1.4.1.1'
        end
      end
      object sgExtension: TAdvStringGrid
        Tag = 8
        Left = 2
        Top = 26
        Width = 1564
        Height = 679
        Cursor = crDefault
        Hint = 'double click any extension to see all files with that extension'
        Align = alClient
        ColCount = 13
        DefaultRowHeight = 17
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        PopupMenu = puExtensionsMain
        ScrollBars = ssBoth
        TabOrder = 1
        OnDrawCell = sgExtensionDrawCell
        GridLineColor = 15527152
        GridFixedLineColor = 13947601
        HoverRowCells = [hcNormal, hcSelected]
        OnCanSort = sgExtensionCanSort
        OnClickCell = sgExtensionClickCell
        OnDblClickCell = sgExtensionDblClickCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 16575452
        ActiveCellColorTo = 16571329
        Bands.Active = True
        Bands.PrimaryColor = 16381426
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientMirrorFrom = 16049884
        ControlLook.FixedGradientMirrorTo = 16247261
        ControlLook.FixedGradientHoverFrom = 16710648
        ControlLook.FixedGradientHoverTo = 16446189
        ControlLook.FixedGradientHoverMirrorFrom = 16049367
        ControlLook.FixedGradientHoverMirrorTo = 15258305
        ControlLook.FixedGradientDownFrom = 15853789
        ControlLook.FixedGradientDownTo = 15852760
        ControlLook.FixedGradientDownMirrorFrom = 15522767
        ControlLook.FixedGradientDownMirrorTo = 15588559
        ControlLook.FixedGradientDownBorder = 14007466
        ControlLook.ControlStyle = csWinXP
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDown.TextChecked = 'Checked'
        FilterDropDown.TextUnChecked = 'Unchecked'
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedColWidth = 71
        FixedRowHeight = 17
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clBlack
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        Look = glWin7
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.Color = 16645370
        SearchFooter.ColorTo = 16247261
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SearchFooter.ResultFormat = '(%d of %d)'
        SortSettings.AutoSortForGrouping = False
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        SortSettings.HeaderColor = 16579058
        SortSettings.HeaderColorTo = 16579058
        SortSettings.HeaderMirrorColor = 16380385
        SortSettings.HeaderMirrorColorTo = 16182488
        Version = '8.2.2.0'
        ExplicitWidth = 445
        ExplicitHeight = 220
        ColWidths = (
          71
          77
          74
          72
          80
          136
          64
          64
          64
          64
          64
          64
          64)
        RowHeights = (
          17
          17)
      end
      object Panel13: TPanel
        Left = 2
        Top = 705
        Width = 1564
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 246
        ExplicitWidth = 445
        DesignSize = (
          1564
          28)
        object cbOtherSuggestions: TComboBox
          Left = 0
          Top = 3
          Width = 37285
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitWidth = 36166
        end
      end
    end
    object tsFolderList: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 3
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object splitDirList: TAdvSplitter
        Left = 322
        Top = 26
        Height = 707
        OnCanResize = splitDirListCanResize
        OnMoved = splitDirListMoved
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 368
        ExplicitTop = 280
        ExplicitHeight = 100
      end
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 1564
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        FullRepaint = False
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 445
        object sbDirListPie: TSpeedButton
          Tag = 3
          Left = 0
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Flat = True
          OnClick = sbMainPieClick
        end
        object sbDirListBar: TSpeedButton
          Tag = 3
          Left = 24
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Down = True
          Flat = True
          OnClick = sbMainBarClick
        end
        object sbFolderMoreDetail: TSpeedButton
          Left = 328
          Top = 0
          Width = 105
          Height = 22
          Flat = True
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C21E0000C21E00000000000000000000FFFFFFFFFFFF
            FFFFFFE5F0E7A0C8A6569C5E3F8F493C8D454C955398C19BE1EDE3FFFFFFFFFF
            FFFFFFFF0000FFFFFFFFFFFFC4DEC957A0644199507DC28F96D0A696CFA678BE
            89368D42418D48B9D5BCFFFFFFFFFFFF0000FFFFFFC6E0CC55A06464B478A8DB
            B587CC9866BC7D64BA7C86CB98A5D9B458AA6B35863DB9D5BCFFFFFF0000E9F3
            EB67AC766AB97DA8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B35A
            AA6C428F49E2EEE30000AFD5B853AB68AADDB464C1795FBE7160BC77FFFFFFFF
            FFFF59B87058B56E5CB774A6DAB4388F4397C19B000077B8888ACC9889D3966B
            C67A63C17055AB65FFFFFFFFFFFF59B87059B8705BB97285CC977BBE8D4D9655
            00006AB27FA9DDB37DCF8A75CC81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            59B87067BE7D9CD4AB3B8C4400006EB583B6E2BE8BD5977AC986FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF59B87069C17E9DD4AA3F8F49000082BF95ACDDB6
            A6DFAF81CB8C7CC9866EBD79FFFFFFFFFFFF5BAC6A60BC775CBA738BD19980C5
            92589E610000B8DCC485C797D2EED795D9A08AD3947FC889FFFFFFFFFFFF79CD
            856BC37C6FC77EACDFB5459E57A1C9A70000ECF6EF7FBF93AADAB7D8F1DC92D8
            9D88CD9384CC8E8BD4968AD49583D28EAFE0B76BB97D5BA367E6F1E80000FFFF
            FFD1E9D976BB8CAFDCBBDCF2E0B6E4BD9BDBA596D9A0A5DFAFC0E8C579C28A58
            A266C5DECAFFFFFF0000FFFFFFFFFFFFD1E9D97FBF9394CEA4C3E6CBCFEBD4C9
            E9CEAFDDB86DB97F68AE78C7E0CDFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFEC
            F6EFB9DDC582C09571B7866EB58279B98AB1D6BAE9F3EBFFFFFFFFFFFFFFFFFF
            0000}
          OnClick = sbFolderMoreDetailClick
        end
        object sbFolderConfig: TSpeedButton
          Left = 52
          Top = 1
          Width = 24
          Height = 22
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C21E0000C21E00000000000000000000FFFFFF5199FF
            2981FF217DFF63A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4995FFA0C7FF
            83B7FF7FB4FF97C2FF5399FF67A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
            A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1CAFF79B3FF
            A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
            C5FF599EFF70ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7CDFF7EB7FFA9CEFFA8CDFF70
            ACFF5F9AEE8C8C8CEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
            87979797C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9CFFF84B6F794
            9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989C8C8C8FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1939393D4D4D4C8C8C8BCBCBCBABA
            BAC2C2C2C4C4C4999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AE4E4E4CFCFCFACACACFFFF
            FF8E8E8E8C8C8C8C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFABABABE2E2E2E7E7E7B9B9B9939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D49F9F9FE4E4E4EEEEEE9696
            96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFD4D4D4ACACAC9D9D9D9B9B9BFFFFFFFFFFFFFFFFFF}
          OnClick = sbFolderConfigClick
        end
        object cbGraphSizeDirList: TAdvOfficeRadioButton
          Left = 90
          Top = 3
          Width = 100
          Height = 20
          Hint = 'graph by size of files'
          TabOrder = 0
          TabStop = True
          OnClick = cbGraphSizeDirListClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
        object cbGraphQuantityDirList: TAdvOfficeRadioButton
          Left = 195
          Top = 3
          Width = 100
          Height = 20
          Hint = 'graph by number of files'
          TabOrder = 1
          OnClick = cbGraphQuantityDirListClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
      end
      object sgDirList: TAdvStringGrid
        Tag = 1
        Left = 2
        Top = 26
        Width = 320
        Height = 707
        Cursor = crDefault
        Hint = 'double click for more information'
        Align = alLeft
        ColCount = 11
        DefaultRowHeight = 17
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        PopupMenu = puFolders
        ScrollBars = ssBoth
        TabOrder = 1
        OnDrawCell = sgDirListDrawCell
        GridLineColor = 15527152
        GridFixedLineColor = 13947601
        HoverRowCells = [hcNormal, hcSelected]
        OnCanSort = sgDirListCanSort
        OnDblClickCell = sgDirListDblClickCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 16575452
        ActiveCellColorTo = 16571329
        Bands.Active = True
        Bands.PrimaryColor = 16381426
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientMirrorFrom = 16049884
        ControlLook.FixedGradientMirrorTo = 16247261
        ControlLook.FixedGradientHoverFrom = 16710648
        ControlLook.FixedGradientHoverTo = 16446189
        ControlLook.FixedGradientHoverMirrorFrom = 16049367
        ControlLook.FixedGradientHoverMirrorTo = 15258305
        ControlLook.FixedGradientDownFrom = 15853789
        ControlLook.FixedGradientDownTo = 15852760
        ControlLook.FixedGradientDownMirrorFrom = 15522767
        ControlLook.FixedGradientDownMirrorTo = 15588559
        ControlLook.FixedGradientDownBorder = 14007466
        ControlLook.ControlStyle = csWinXP
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDown.TextChecked = 'Checked'
        FilterDropDown.TextUnChecked = 'Unchecked'
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedRowHeight = 17
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clBlack
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        Look = glWin7
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.Color = 16645370
        SearchFooter.ColorTo = 16247261
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SearchFooter.ResultFormat = '(%d of %d)'
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        SortSettings.HeaderColor = 16579058
        SortSettings.HeaderColorTo = 16579058
        SortSettings.HeaderMirrorColor = 16380385
        SortSettings.HeaderMirrorColorTo = 16182488
        Version = '8.2.2.0'
        ExplicitHeight = 248
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
        RowHeights = (
          17
          17)
      end
      object vtcDirList: TChart
        Tag = 30
        Left = 325
        Top = 26
        Width = 1241
        Height = 707
        Foot.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.Visible = True
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginBottom = 0
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 0
        Title.Text.Strings = (
          '.....')
        BottomAxis.ExactDateTime = False
        LeftAxis.ExactDateTime = False
        View3D = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        BevelOuter = bvLowered
        PopupMenu = puCharts
        AutoSize = True
        TabOrder = 2
        OnMouseDown = vtcDirListMouseDown
        OnMouseMove = vtcDirListMouseMove
        ExplicitWidth = 122
        ExplicitHeight = 248
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object PieSeries1: THorizBarSeries
          BarBrush.Gradient.Direction = gdLeftRight
          BarPen.Visible = False
          ColorEachPoint = True
          Marks.Arrow.Color = clBlack
          Marks.BackColor = clWhite
          Marks.Callout.Arrow.Color = clBlack
          Marks.Callout.Length = 4
          Marks.Color = clWhite
          Gradient.Direction = gdLeftRight
          XValues.Name = 'Bar'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
    end
    object tsMagnitude: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 4
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object splitMagnitude: TAdvSplitter
        Left = 322
        Top = 26
        Height = 707
        OnCanResize = splitMagnitudeCanResize
        OnMoved = splitMagnitudeMoved
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 392
        ExplicitTop = 280
        ExplicitHeight = 100
      end
      object Panel9: TPanel
        Left = 2
        Top = 2
        Width = 1564
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        FullRepaint = False
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 445
        object sbMagnitudePie: TSpeedButton
          Tag = 4
          Left = 0
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Flat = True
          OnClick = sbMainPieClick
        end
        object sbMagnitudeBar: TSpeedButton
          Tag = 4
          Left = 24
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Down = True
          Flat = True
          OnClick = sbMainBarClick
        end
        object cbGraphSizeMagnitude: TAdvOfficeRadioButton
          Left = 61
          Top = 3
          Width = 100
          Height = 20
          Hint = 'graph by size of files'
          TabOrder = 0
          TabStop = True
          OnClick = cbGraphSizeMagnitudeClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
        object cbGraphQtyMagnitude: TAdvOfficeRadioButton
          Left = 166
          Top = 3
          Width = 100
          Height = 20
          Hint = 'graph by number of files'
          TabOrder = 1
          OnClick = cbGraphSizeMagnitudeClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
      end
      object sgMagnitude: TAdvStringGrid
        Left = 2
        Top = 26
        Width = 320
        Height = 707
        Cursor = crDefault
        Hint = 'double click to see all files with selected size range'
        Align = alLeft
        ColCount = 11
        DefaultRowHeight = 17
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        PopupMenu = puMagnitude
        ScrollBars = ssBoth
        TabOrder = 1
        OnDblClick = sgMagnitudeDblClick
        OnDrawCell = sgMagnitudeDrawCell
        GridLineColor = 15527152
        GridFixedLineColor = 13947601
        HoverRowCells = [hcNormal, hcSelected]
        OnCanSort = sgMagnitudeCanSort
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 16575452
        ActiveCellColorTo = 16571329
        Bands.Active = True
        Bands.PrimaryColor = 16381426
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientMirrorFrom = 16049884
        ControlLook.FixedGradientMirrorTo = 16247261
        ControlLook.FixedGradientHoverFrom = 16710648
        ControlLook.FixedGradientHoverTo = 16446189
        ControlLook.FixedGradientHoverMirrorFrom = 16049367
        ControlLook.FixedGradientHoverMirrorTo = 15258305
        ControlLook.FixedGradientDownFrom = 15853789
        ControlLook.FixedGradientDownTo = 15852760
        ControlLook.FixedGradientDownMirrorFrom = 15522767
        ControlLook.FixedGradientDownMirrorTo = 15588559
        ControlLook.FixedGradientDownBorder = 14007466
        ControlLook.ControlStyle = csWinXP
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDown.TextChecked = 'Checked'
        FilterDropDown.TextUnChecked = 'Unchecked'
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedRowHeight = 17
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clBlack
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        Look = glWin7
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.Color = 16645370
        SearchFooter.ColorTo = 16247261
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SearchFooter.ResultFormat = '(%d of %d)'
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        SortSettings.HeaderColor = 16579058
        SortSettings.HeaderColorTo = 16579058
        SortSettings.HeaderMirrorColor = 16380385
        SortSettings.HeaderMirrorColorTo = 16182488
        Version = '8.2.2.0'
        ExplicitHeight = 248
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
        RowHeights = (
          17
          17)
      end
      object vtcMagnitude: TChart
        Left = 325
        Top = 26
        Width = 1241
        Height = 707
        Foot.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.Visible = True
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginBottom = 0
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 0
        Title.Text.Strings = (
          '.....')
        LeftAxis.Inverted = True
        View3D = False
        View3DOptions.Elevation = 337
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        BevelOuter = bvLowered
        PopupMenu = puCharts
        AutoSize = True
        TabOrder = 2
        OnMouseDown = vtcMagnitudeMouseDown
        OnMouseMove = vtcMagnitudeMouseMove
        ExplicitWidth = 122
        ExplicitHeight = 248
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object BarSeries1: THorizBarSeries
          BarBrush.Gradient.Direction = gdLeftRight
          BarPen.Visible = False
          ColorEachPoint = True
          Marks.Style = smsPercent
          Marks.Arrow.Color = clBlack
          Marks.BackColor = clWhite
          Marks.Callout.Arrow.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Color = clWhite
          Gradient.Direction = gdLeftRight
          XValues.Name = 'Bar'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
    end
    object tsFileDates: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 5
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object splitterFileDetails: TAdvSplitter
        Left = 341
        Top = 26
        Height = 707
        OnCanResize = splitterFileDetailsCanResize
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 400
        ExplicitTop = 368
        ExplicitHeight = 100
      end
      object Panel16: TPanel
        Left = 2
        Top = 2
        Width = 1564
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        FullRepaint = False
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 445
        object sbCollapseNodes: TSpeedButton
          Tag = 1
          Left = 345
          Top = 0
          Width = 97
          Height = 22
          Caption = '.'
          Flat = True
          OnClick = sbCollapseNodesClick
        end
        object sbFileDatesPie: TSpeedButton
          Tag = 8
          Left = 0
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 99
          Flat = True
          OnClick = sbMainPieClick
        end
        object sbFileDatesBar: TSpeedButton
          Tag = 8
          Left = 24
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 99
          Down = True
          Flat = True
          OnClick = sbMainBarClick
        end
        object cbFileDates: TComboBox
          Left = 56
          Top = 1
          Width = 113
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = cbFileDatesChange
        end
        object cbFileDatesUsers: TComboBox
          Left = 175
          Top = 1
          Width = 113
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          OnChange = cbFileDatesChange
        end
      end
      object tvFileDates: THTMLTreeview
        Left = 2
        Top = 26
        Width = 339
        Height = 707
        ItemHeight = 16
        SelectionNFColor = clSilver
        SelectionNFFontColor = clBlack
        Align = alLeft
        Indent = 19
        PopupMenu = puTreeDate
        TabOrder = 1
        OnDblClick = tvFileDatesDblClick
        Version = '1.4.1.3'
        ExplicitHeight = 248
      end
      object vtcFileDates: TChart
        Left = 344
        Top = 26
        Width = 1222
        Height = 707
        Foot.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.Visible = True
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginBottom = 0
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 0
        Title.Text.Strings = (
          '.....')
        LeftAxis.Inverted = True
        View3D = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        BevelOuter = bvLowered
        PopupMenu = puCharts
        AutoSize = True
        TabOrder = 2
        OnMouseMove = vtcFileDatesMouseMove
        ExplicitWidth = 103
        ExplicitHeight = 248
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object HorizBarSeries1: THorizBarSeries
          BarBrush.Gradient.Direction = gdLeftRight
          BarPen.Visible = False
          ColorEachPoint = True
          Marks.Style = smsPercent
          Marks.Arrow.Color = clBlack
          Marks.BackColor = clWhite
          Marks.Callout.Arrow.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Color = clWhite
          Gradient.Direction = gdLeftRight
          XValues.Name = 'Bar'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
    end
    object tsHistory: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 6
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object Panel31: TPanel
        Left = 2
        Top = 2
        Width = 143
        Height = 731
        Align = alLeft
        BevelEdges = []
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitHeight = 272
        object bHistoryRefresh: TSpeedButton
          Left = 6
          Top = 334
          Width = 131
          Height = 22
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFDFEFD9FC2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8BBC905E9D63FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF9BCBA066B06E61AA683D8B4437833E327B373D7F436496689EBC
            A0E6EDE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD8AF73BD7C96D19F94CF9C8F
            CD968ACA9185C78B7ABE8165AD6C4B925168976BCDDCCEFFFFFFFFFFFFFFFFFF
            FFFFFFA9DBAF79C4839ED7A79BD4A497D29F92CF9A8DCC9588CA907AC2827EC4
            855DA46369996CE6EDE6FFFFFFFFFFFFFFFFFFFFFFFFA4DAAB7BC78577C28154
            AB5E4EA357499B5163AC6B83C38B87C98F82C689509756A0BFA2FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF9ED8A57BC784FFFFFFFFFFFFFFFFFF9BC9A05BA26286C6
            8E88C98F6FB376699D6DB8D7BBB6D4B9B4D1B6B2CEB4AFCBB1FDFEFDB4E2BAFF
            FFFFFFFFFFFFFFFFFFFFFFA4CFA854A05B48954F408B47478B4E5DA9644C9C54
            48954F49904F97BE9BFFFFFFFFFFFFFFFFFFFFFFFF92B294FCFDFCBEDFC2BCDC
            BFBAD9BDB7D6BBB5D3B884C38B80C3898DCC9583C48A54995A90BA94FFFFFFFF
            FFFFFFFFFF4A814D739C76FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7DEBB75BF7E
            98D2A194CF9C86C78D5EA765398640347E3A2E763349904F458B4A7EA581FFFF
            FFFFFFFFFFFFFFFFFFFFEDF7EE8ECD9685C98E9BD4A48FCE9892CF9A8DCC9588
            CA9083C68B7EC48579C17F478D4C87AC89FFFFFFFFFFFFFFFFFFFFFFFFDCF0DE
            90CF9779C38389CA9294D09C95D19E90CF998CCB9487C98F80C4874E95548FB3
            92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF8EFB9E1BE89C99064B46C50A65A4B
            9E5345964D60A8685BA2628CB690FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67AB6E8BBC90FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFACD4B0FDFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          OnClick = bHistoryRefreshClick
        end
        object lHUser: TLabel
          Left = 6
          Top = 283
          Width = 4
          Height = 13
          Caption = '.'
        end
        object gbHistory: TGroupBox
          Left = 5
          Top = 180
          Width = 133
          Height = 85
          Caption = '.'
          TabOrder = 0
          object cbHCumulative: TAdvOfficeCheckBox
            Left = 8
            Top = 60
            Width = 120
            Height = 20
            TabOrder = 0
            OnClick = dtpHFromChange
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
          object rbHQuantity: TAdvOfficeRadioButton
            Left = 7
            Top = 16
            Width = 120
            Height = 20
            TabOrder = 1
            TabStop = True
            OnClick = dtpHFromChange
            Alignment = taLeftJustify
            Caption = '.'
            Checked = True
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
          object rbHSize: TAdvOfficeRadioButton
            Left = 7
            Top = 34
            Width = 120
            Height = 20
            TabOrder = 2
            OnClick = dtpHFromChange
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 4
          Width = 133
          Height = 165
          TabOrder = 1
          object lHFrom: TLabel
            Left = 6
            Top = 8
            Width = 4
            Height = 13
            Caption = '.'
          end
          object lHTo: TLabel
            Left = 6
            Top = 48
            Width = 4
            Height = 13
            Caption = '.'
          end
          object lHInterval: TLabel
            Left = 6
            Top = 88
            Width = 4
            Height = 13
            Caption = '.'
          end
          object dtpHFrom: TDateTimePicker
            Left = 6
            Top = 24
            Width = 123
            Height = 21
            Date = 39596.525266018520000000
            Time = 39596.525266018520000000
            DateFormat = dfLong
            TabOrder = 0
            OnCloseUp = dtpHFromChange
          end
          object dtpHTo: TDateTimePicker
            Left = 6
            Top = 64
            Width = 121
            Height = 21
            Date = 39596.525266018520000000
            Time = 39596.525266018520000000
            DateFormat = dfLong
            TabOrder = 1
            OnCloseUp = dtpHFromChange
          end
          object cbHInterval: TComboBox
            Left = 6
            Top = 104
            Width = 121
            Height = 21
            Style = csDropDownList
            TabOrder = 2
            OnChange = dtpHFromChange
          end
          object cbHDateSelect: TComboBox
            Left = 9
            Top = 131
            Width = 121
            Height = 21
            Style = csDropDownList
            TabOrder = 3
            OnChange = dtpHFromChange
          end
        end
        object cbHUsers: TComboBox
          Left = 6
          Top = 297
          Width = 128
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnChange = dtpHFromChange
        end
        object cbAutoRefreshHistory: TAdvOfficeCheckBox
          Left = 17
          Top = 370
          Width = 120
          Height = 20
          TabOrder = 3
          OnClick = dtpHFromChange
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
      end
      object Panel7: TPanel
        Left = 145
        Top = 2
        Width = 1421
        Height = 731
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 302
        ExplicitHeight = 272
        object capacityBarHistory: TAdvSmoothCapacityBar
          Left = 0
          Top = 648
          Width = 1421
          Height = 83
          AntiAlias = aaAntiAlias
          Align = alBottom
          Appearance.AutoFormatValues = False
          Appearance.BackGroundFill.Color = clWhite
          Appearance.BackGroundFill.ColorTo = clWhite
          Appearance.BackGroundFill.ColorMirror = clNone
          Appearance.BackGroundFill.ColorMirrorTo = clNone
          Appearance.BackGroundFill.GradientType = gtVertical
          Appearance.BackGroundFill.GradientMirrorType = gtSolid
          Appearance.BackGroundFill.BorderColor = clNone
          Appearance.BackGroundFill.Rounding = 0
          Appearance.BackGroundFill.ShadowOffset = 0
          Appearance.BackGroundFill.Glow = gmNone
          Appearance.Color = 15592683
          Appearance.ColorTo = 14605788
          Appearance.CapacityFont.Charset = DEFAULT_CHARSET
          Appearance.CapacityFont.Color = clBlack
          Appearance.CapacityFont.Height = -12
          Appearance.CapacityFont.Name = 'Tahoma'
          Appearance.CapacityFont.Style = []
          Appearance.CapacityFormat = '%.0f %%'
          Appearance.FreeFormat = '%.0f MB'
          Appearance.LegendFormat = '%.01f'
          Appearance.LegendFont.Charset = DEFAULT_CHARSET
          Appearance.LegendFont.Color = 7303023
          Appearance.LegendFont.Height = -11
          Appearance.LegendFont.Name = 'Tahoma'
          Appearance.LegendFont.Style = []
          Appearance.CapacityTextShadowColor = clGray
          Appearance.LegendTextShadowColor = clSilver
          Items = <>
          CapacityDescription = ' '
          FreeDescription = 'NO'
          TotalCapacity = 100.000000000000000000
          ExplicitLeft = 139
          ExplicitTop = 481
          ExplicitWidth = 944
        end
        object vtcHistory: TChart
          Left = 0
          Top = 22
          Width = 1421
          Height = 626
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = 15922416
          Gradient.Visible = True
          Legend.Alignment = laLeft
          Legend.Visible = False
          Title.Text.Strings = (
            '...')
          View3D = False
          Align = alClient
          BevelOuter = bvNone
          PopupMenu = puCharts
          TabOrder = 0
          OnClick = vtcHistoryClick
          OnMouseMove = vtcHistoryMouseMove
          ExplicitWidth = 302
          ExplicitHeight = 167
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series4: TBarSeries
            BarPen.Visible = False
            Marks.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
        object Panel35: TPanel
          Left = 0
          Top = 0
          Width = 1421
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          ExplicitWidth = 302
          DesignSize = (
            1421
            22)
          object lHistoryResults: THTMLabel
            Left = 6
            Top = 4
            Width = -29398
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            HTMLText.Strings = (
              '...')
            Transparent = True
            Version = '1.9.2.6'
            ExplicitWidth = 931
          end
        end
      end
    end
    object tsTop50: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 7
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object pcTop101: TPageControl
        Left = 2
        Top = 2
        Width = 1564
        Height = 731
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 445
        ExplicitHeight = 272
      end
      object AdvSmoothTabPager1: TAdvSmoothTabPager
        Left = 2
        Top = 2
        Width = 1564
        Height = 731
        Fill.Color = 16773091
        Fill.ColorTo = 16768452
        Fill.ColorMirror = 16765357
        Fill.ColorMirrorTo = 16767936
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtVertical
        Fill.BorderColor = 16765357
        Fill.Rounding = 0
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Transparent = False
        Align = alClient
        ActivePage = tsTop101FileSize
        TabPosition = tpTopLeft
        TabSettings.StartMargin = 4
        TabReorder = False
        TabOrder = 1
        ExplicitWidth = 445
        ExplicitHeight = 272
        object tsTop101FileSize: TAdvSmoothTabPage
          Left = 1
          Top = 26
          Width = 1562
          Height = 703
          Caption = ''
          PageAppearance.Color = 15984090
          PageAppearance.ColorTo = 15785680
          PageAppearance.ColorMirror = 15587784
          PageAppearance.ColorMirrorTo = 16774371
          PageAppearance.GradientType = gtVertical
          PageAppearance.GradientMirrorType = gtVertical
          PageAppearance.BorderColor = 16765357
          PageAppearance.Rounding = 0
          PageAppearance.ShadowOffset = 0
          PageAppearance.Glow = gmNone
          TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
          TabAppearance.Appearance.Font.Color = clWindowText
          TabAppearance.Appearance.Font.Height = -11
          TabAppearance.Appearance.Font.Name = 'Tahoma'
          TabAppearance.Appearance.Font.Style = []
          TabAppearance.Status.Caption = '0'
          TabAppearance.Status.Appearance.Fill.Color = clRed
          TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
          TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
          TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
          TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
          TabAppearance.Status.Appearance.Fill.BorderColor = clGray
          TabAppearance.Status.Appearance.Fill.Rounding = 0
          TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
          TabAppearance.Status.Appearance.Fill.Glow = gmNone
          TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
          TabAppearance.Status.Appearance.Font.Color = clWhite
          TabAppearance.Status.Appearance.Font.Height = -11
          TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
          TabAppearance.Status.Appearance.Font.Style = []
          TabAppearance.BevelColor = 16765357
          TabAppearance.BevelColorDown = 16640730
          TabAppearance.BevelColorSelected = 16640730
          TabAppearance.BevelColorHot = 16640730
          TabAppearance.BevelColorDisabled = 16640730
          TabAppearance.Color = 16773091
          TabAppearance.ColorDown = 11196927
          TabAppearance.ColorDisabled = 16765357
          TMSStyle = 0
          object splitterTop50: TAdvSplitter
            Left = 402
            Top = 24
            Height = 677
            OnMoved = splitterTop50Moved
            Appearance.BorderColor = clNone
            Appearance.BorderColorHot = clNone
            Appearance.Color = clWhite
            Appearance.ColorTo = clSilver
            Appearance.ColorHot = clWhite
            Appearance.ColorHotTo = clGray
            GripStyle = sgDots
            ExplicitLeft = 464
            ExplicitTop = 328
            ExplicitHeight = 100
          end
          object Panel18: TPanel
            Left = 2
            Top = 2
            Width = 1558
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            FullRepaint = False
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 439
            object cbTopUsers: TComboBox
              Left = 0
              Top = 0
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 0
              OnChange = cbTopUsersChange
            end
            object cbTopColourCode: TAdvOfficeCheckBox
              Left = 151
              Top = 2
              Width = 243
              Height = 20
              Hint = 'colour code search results based on the category they belong to'
              TabOrder = 1
              OnClick = cbTopColourCodeClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.4.1.1'
            end
          end
          object pTop101: TPanel
            Left = 2
            Top = 24
            Width = 400
            Height = 677
            Align = alLeft
            TabOrder = 1
            ExplicitHeight = 218
            object capacityTop101: TAdvSmoothCapacityBar
              Left = 1
              Top = 600
              Width = 398
              Height = 76
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              AntiAlias = aaAntiAlias
              Align = alBottom
              Appearance.ShowFree = False
              Appearance.AutoFormatValues = False
              Appearance.BackGroundFill.Color = clWhite
              Appearance.BackGroundFill.ColorTo = clWhite
              Appearance.BackGroundFill.ColorMirror = clNone
              Appearance.BackGroundFill.ColorMirrorTo = clNone
              Appearance.BackGroundFill.GradientType = gtVertical
              Appearance.BackGroundFill.GradientMirrorType = gtSolid
              Appearance.BackGroundFill.BorderColor = clNone
              Appearance.BackGroundFill.Rounding = 0
              Appearance.BackGroundFill.ShadowOffset = 0
              Appearance.BackGroundFill.Glow = gmNone
              Appearance.Color = 15592683
              Appearance.ColorTo = 14605788
              Appearance.CapacityFont.Charset = DEFAULT_CHARSET
              Appearance.CapacityFont.Color = clBlack
              Appearance.CapacityFont.Height = -12
              Appearance.CapacityFont.Name = 'Tahoma'
              Appearance.CapacityFont.Style = []
              Appearance.CapacityFormat = '%.0f %%'
              Appearance.FreeFormat = '%.0f MB'
              Appearance.LegendFormat = '%.01f'
              Appearance.LegendFont.Charset = DEFAULT_CHARSET
              Appearance.LegendFont.Color = 7303023
              Appearance.LegendFont.Height = -11
              Appearance.LegendFont.Name = 'Tahoma'
              Appearance.LegendFont.Style = []
              Appearance.OffsetX = 5
              Appearance.OffsetY = 4
              Appearance.CapacityTextShadowColor = clGray
              Appearance.LegendTextShadowColor = clSilver
              Items = <>
              CapacityDescription = ' '
              FreeDescription = 'NO'
              TotalCapacity = 100.000000000000000000
              ExplicitTop = 389
            end
            object sgTop50Big: TAdvStringGrid
              Tag = 2
              Left = 1
              Top = 18
              Width = 398
              Height = 582
              Cursor = crDefault
              Align = alClient
              DefaultRowHeight = 17
              DrawingStyle = gdsClassic
              FixedCols = 0
              RowCount = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
              ParentFont = False
              PopupMenu = puSearch
              ScrollBars = ssBoth
              TabOrder = 0
              OnDrawCell = sgTop50BigDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = 16575452
              ActiveCellColorTo = 16571329
              Bands.Active = True
              Bands.PrimaryColor = 16381426
              CellNode.TreeColor = clSilver
              ControlLook.FixedGradientMirrorFrom = 16049884
              ControlLook.FixedGradientMirrorTo = 16247261
              ControlLook.FixedGradientHoverFrom = 16710648
              ControlLook.FixedGradientHoverTo = 16446189
              ControlLook.FixedGradientHoverMirrorFrom = 16049367
              ControlLook.FixedGradientHoverMirrorTo = 15258305
              ControlLook.FixedGradientDownFrom = 15853789
              ControlLook.FixedGradientDownTo = 15852760
              ControlLook.FixedGradientDownMirrorFrom = 15522767
              ControlLook.FixedGradientDownMirrorTo = 15588559
              ControlLook.FixedGradientDownBorder = 14007466
              ControlLook.ControlStyle = csWinXP
              ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownHeader.Font.Color = clWindowText
              ControlLook.DropDownHeader.Font.Height = -11
              ControlLook.DropDownHeader.Font.Name = 'Tahoma'
              ControlLook.DropDownHeader.Font.Style = []
              ControlLook.DropDownHeader.Visible = True
              ControlLook.DropDownHeader.Buttons = <>
              ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownFooter.Font.Color = clWindowText
              ControlLook.DropDownFooter.Font.Height = -11
              ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
              ControlLook.DropDownFooter.Font.Style = []
              ControlLook.DropDownFooter.Visible = True
              ControlLook.DropDownFooter.Buttons = <>
              Filter = <>
              FilterDropDown.Font.Charset = DEFAULT_CHARSET
              FilterDropDown.Font.Color = clWindowText
              FilterDropDown.Font.Height = -11
              FilterDropDown.Font.Name = 'MS Sans Serif'
              FilterDropDown.Font.Style = []
              FilterDropDown.TextChecked = 'Checked'
              FilterDropDown.TextUnChecked = 'Unchecked'
              FilterDropDownClear = '(All)'
              FilterEdit.TypeNames.Strings = (
                'Starts with'
                'Ends with'
                'Contains'
                'Not contains'
                'Equal'
                'Not equal'
                'Larger than'
                'Smaller than'
                'Clear')
              FixedColWidth = 128
              FixedRowHeight = 17
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clBlack
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              HoverButtons.Buttons = <>
              HoverButtons.Position = hbLeftFromColumnLeft
              HTMLSettings.ImageFolder = 'images'
              HTMLSettings.ImageBaseName = 'img'
              Look = glWin7
              PrintSettings.DateFormat = 'dd/mm/yyyy'
              PrintSettings.Font.Charset = DEFAULT_CHARSET
              PrintSettings.Font.Color = clWindowText
              PrintSettings.Font.Height = -11
              PrintSettings.Font.Name = 'MS Sans Serif'
              PrintSettings.Font.Style = []
              PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
              PrintSettings.FixedFont.Color = clWindowText
              PrintSettings.FixedFont.Height = -11
              PrintSettings.FixedFont.Name = 'MS Sans Serif'
              PrintSettings.FixedFont.Style = []
              PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
              PrintSettings.HeaderFont.Color = clWindowText
              PrintSettings.HeaderFont.Height = -11
              PrintSettings.HeaderFont.Name = 'MS Sans Serif'
              PrintSettings.HeaderFont.Style = []
              PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
              PrintSettings.FooterFont.Color = clWindowText
              PrintSettings.FooterFont.Height = -11
              PrintSettings.FooterFont.Name = 'MS Sans Serif'
              PrintSettings.FooterFont.Style = []
              PrintSettings.PageNumSep = '/'
              SearchFooter.Color = 16645370
              SearchFooter.ColorTo = 16247261
              SearchFooter.FindNextCaption = 'Find &next'
              SearchFooter.FindPrevCaption = 'Find &previous'
              SearchFooter.Font.Charset = DEFAULT_CHARSET
              SearchFooter.Font.Color = clWindowText
              SearchFooter.Font.Height = -11
              SearchFooter.Font.Name = 'MS Sans Serif'
              SearchFooter.Font.Style = []
              SearchFooter.HighLightCaption = 'Highlight'
              SearchFooter.HintClose = 'Close'
              SearchFooter.HintFindNext = 'Find next occurrence'
              SearchFooter.HintFindPrev = 'Find previous occurrence'
              SearchFooter.HintHighlight = 'Highlight occurrences'
              SearchFooter.MatchCaseCaption = 'Match case'
              SearchFooter.ResultFormat = '(%d of %d)'
              ShowDesignHelper = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              SortSettings.HeaderColor = 16579058
              SortSettings.HeaderColorTo = 16579058
              SortSettings.HeaderMirrorColor = 16380385
              SortSettings.HeaderMirrorColorTo = 16182488
              Version = '8.2.2.0'
              WordWrap = False
              ExplicitHeight = 123
              ColWidths = (
                128
                167
                64
                35
                64)
              RowHeights = (
                17
                17)
            end
            object pTop101Left: TPanel
              Left = 1
              Top = 1
              Width = 398
              Height = 17
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 1
            end
          end
          object sgTop50Small: TAdvStringGrid
            Tag = 3
            Left = 405
            Top = 24
            Width = 1155
            Height = 677
            Cursor = crDefault
            Align = alClient
            ColCount = 4
            DefaultRowHeight = 17
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLineWidth = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
            ParentFont = False
            PopupMenu = puSearch
            ScrollBars = ssBoth
            TabOrder = 2
            OnDrawCell = sgTop50SmallDrawCell
            GridLineColor = 15527152
            GridFixedLineColor = 13947601
            HoverRowCells = [hcNormal, hcSelected]
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 16575452
            ActiveCellColorTo = 16571329
            Bands.Active = True
            Bands.PrimaryColor = 16381426
            CellNode.TreeColor = clSilver
            ControlLook.FixedGradientMirrorFrom = 16049884
            ControlLook.FixedGradientMirrorTo = 16247261
            ControlLook.FixedGradientHoverFrom = 16710648
            ControlLook.FixedGradientHoverTo = 16446189
            ControlLook.FixedGradientHoverMirrorFrom = 16049367
            ControlLook.FixedGradientHoverMirrorTo = 15258305
            ControlLook.FixedGradientDownFrom = 15853789
            ControlLook.FixedGradientDownTo = 15852760
            ControlLook.FixedGradientDownMirrorFrom = 15522767
            ControlLook.FixedGradientDownMirrorTo = 15588559
            ControlLook.FixedGradientDownBorder = 14007466
            ControlLook.ControlStyle = csWinXP
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDown.TextChecked = 'Checked'
            FilterDropDown.TextUnChecked = 'Unchecked'
            FilterDropDownClear = '(All)'
            FilterEdit.TypeNames.Strings = (
              'Starts with'
              'Ends with'
              'Contains'
              'Not contains'
              'Equal'
              'Not equal'
              'Larger than'
              'Smaller than'
              'Clear')
            FixedRowHeight = 17
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clBlack
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            HoverButtons.Buttons = <>
            HoverButtons.Position = hbLeftFromColumnLeft
            HTMLSettings.ImageFolder = 'images'
            HTMLSettings.ImageBaseName = 'img'
            Look = glWin7
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            SearchFooter.Color = 16645370
            SearchFooter.ColorTo = 16247261
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurrence'
            SearchFooter.HintFindPrev = 'Find previous occurrence'
            SearchFooter.HintHighlight = 'Highlight occurrences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SearchFooter.ResultFormat = '(%d of %d)'
            ShowDesignHelper = False
            SortSettings.DefaultFormat = ssAutomatic
            SortSettings.Column = 0
            SortSettings.HeaderColor = 16579058
            SortSettings.HeaderColorTo = 16579058
            SortSettings.HeaderMirrorColor = 16380385
            SortSettings.HeaderMirrorColorTo = 16182488
            Version = '8.2.2.0'
            WordWrap = False
            ExplicitWidth = 36
            ExplicitHeight = 218
            ColWidths = (
              64
              64
              64
              64)
            RowHeights = (
              17
              17)
          end
        end
        object tsTop101Date: TAdvSmoothTabPage
          Left = 1
          Top = 26
          Width = 1562
          Height = 703
          Caption = ''
          PageAppearance.Color = 15984090
          PageAppearance.ColorTo = 15785680
          PageAppearance.ColorMirror = 15587784
          PageAppearance.ColorMirrorTo = 16774371
          PageAppearance.GradientType = gtVertical
          PageAppearance.GradientMirrorType = gtVertical
          PageAppearance.PictureAspectRatio = True
          PageAppearance.BorderColor = 16765357
          PageAppearance.Rounding = 0
          PageAppearance.ShadowOffset = 0
          PageAppearance.Glow = gmNone
          TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
          TabAppearance.Appearance.Font.Color = clWindowText
          TabAppearance.Appearance.Font.Height = -11
          TabAppearance.Appearance.Font.Name = 'Tahoma'
          TabAppearance.Appearance.Font.Style = []
          TabAppearance.Appearance.ImageList = ilTabs
          TabAppearance.Appearance.ImageIndex = 0
          TabAppearance.Status.Caption = '0'
          TabAppearance.Status.Appearance.Fill.Color = clRed
          TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
          TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
          TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
          TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
          TabAppearance.Status.Appearance.Fill.BorderColor = clGray
          TabAppearance.Status.Appearance.Fill.Rounding = 0
          TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
          TabAppearance.Status.Appearance.Fill.Glow = gmNone
          TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
          TabAppearance.Status.Appearance.Font.Color = clWhite
          TabAppearance.Status.Appearance.Font.Height = -11
          TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
          TabAppearance.Status.Appearance.Font.Style = []
          TabAppearance.BevelColor = 16765357
          TabAppearance.BevelColorDown = 16640730
          TabAppearance.BevelColorSelected = 16640730
          TabAppearance.BevelColorHot = 16640730
          TabAppearance.BevelColorDisabled = 16640730
          TabAppearance.Color = 16773091
          TabAppearance.ColorDown = 11196927
          TabAppearance.ColorDisabled = 16765357
          TMSStyle = 0
          object splitterTopDate: TAdvSplitter
            Left = 397
            Top = 24
            Height = 677
            OnMoved = splitterTopDateMoved
            Appearance.BorderColor = clNone
            Appearance.BorderColorHot = clNone
            Appearance.Color = clWhite
            Appearance.ColorTo = clSilver
            Appearance.ColorHot = clWhite
            Appearance.ColorHotTo = clGray
            GripStyle = sgDots
            ExplicitLeft = 456
            ExplicitTop = 288
            ExplicitHeight = 100
          end
          object Panel3: TPanel
            Left = 2
            Top = 2
            Width = 1558
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            FullRepaint = False
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 439
            object cbTopDateColourCode: TCheckBox
              Left = 268
              Top = 2
              Width = 261
              Height = 17
              Hint = 'colour code search results based on the category they belong to'
              Caption = '.'
              TabOrder = 0
              OnClick = cbTopDateColourCodeClick
            end
            object cbTop101Dates: TComboBox
              Left = 152
              Top = 0
              Width = 113
              Height = 21
              Style = csDropDownList
              TabOrder = 1
              OnChange = cbTop101DatesUserChange
            end
            object cbTop101DatesUser: TComboBox
              Left = 0
              Top = 0
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 2
              OnChange = cbTop101DatesUserChange
            end
          end
          object Panel12: TPanel
            Left = 2
            Top = 24
            Width = 395
            Height = 677
            Align = alLeft
            TabOrder = 1
            ExplicitHeight = 218
            object sgTop101BigDate: TAdvStringGrid
              Tag = 6
              Left = 1
              Top = 18
              Width = 393
              Height = 658
              Cursor = crDefault
              Align = alClient
              ColCount = 6
              DefaultRowHeight = 17
              DrawingStyle = gdsClassic
              FixedCols = 0
              RowCount = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
              ParentFont = False
              PopupMenu = puSearch
              ScrollBars = ssBoth
              TabOrder = 0
              OnDrawCell = sgTop101BigDateDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = 16575452
              ActiveCellColorTo = 16571329
              Bands.Active = True
              Bands.PrimaryColor = 16381426
              CellNode.TreeColor = clSilver
              ControlLook.FixedGradientMirrorFrom = 16049884
              ControlLook.FixedGradientMirrorTo = 16247261
              ControlLook.FixedGradientHoverFrom = 16710648
              ControlLook.FixedGradientHoverTo = 16446189
              ControlLook.FixedGradientHoverMirrorFrom = 16049367
              ControlLook.FixedGradientHoverMirrorTo = 15258305
              ControlLook.FixedGradientDownFrom = 15853789
              ControlLook.FixedGradientDownTo = 15852760
              ControlLook.FixedGradientDownMirrorFrom = 15522767
              ControlLook.FixedGradientDownMirrorTo = 15588559
              ControlLook.FixedGradientDownBorder = 14007466
              ControlLook.ControlStyle = csWinXP
              ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownHeader.Font.Color = clWindowText
              ControlLook.DropDownHeader.Font.Height = -11
              ControlLook.DropDownHeader.Font.Name = 'Tahoma'
              ControlLook.DropDownHeader.Font.Style = []
              ControlLook.DropDownHeader.Visible = True
              ControlLook.DropDownHeader.Buttons = <>
              ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownFooter.Font.Color = clWindowText
              ControlLook.DropDownFooter.Font.Height = -11
              ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
              ControlLook.DropDownFooter.Font.Style = []
              ControlLook.DropDownFooter.Visible = True
              ControlLook.DropDownFooter.Buttons = <>
              Filter = <>
              FilterDropDown.Font.Charset = DEFAULT_CHARSET
              FilterDropDown.Font.Color = clWindowText
              FilterDropDown.Font.Height = -11
              FilterDropDown.Font.Name = 'MS Sans Serif'
              FilterDropDown.Font.Style = []
              FilterDropDown.TextChecked = 'Checked'
              FilterDropDown.TextUnChecked = 'Unchecked'
              FilterDropDownClear = '(All)'
              FilterEdit.TypeNames.Strings = (
                'Starts with'
                'Ends with'
                'Contains'
                'Not contains'
                'Equal'
                'Not equal'
                'Larger than'
                'Smaller than'
                'Clear')
              FixedColWidth = 128
              FixedRowHeight = 17
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clBlack
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              HoverButtons.Buttons = <>
              HoverButtons.Position = hbLeftFromColumnLeft
              HTMLSettings.ImageFolder = 'images'
              HTMLSettings.ImageBaseName = 'img'
              Look = glWin7
              PrintSettings.DateFormat = 'dd/mm/yyyy'
              PrintSettings.Font.Charset = DEFAULT_CHARSET
              PrintSettings.Font.Color = clWindowText
              PrintSettings.Font.Height = -11
              PrintSettings.Font.Name = 'MS Sans Serif'
              PrintSettings.Font.Style = []
              PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
              PrintSettings.FixedFont.Color = clWindowText
              PrintSettings.FixedFont.Height = -11
              PrintSettings.FixedFont.Name = 'MS Sans Serif'
              PrintSettings.FixedFont.Style = []
              PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
              PrintSettings.HeaderFont.Color = clWindowText
              PrintSettings.HeaderFont.Height = -11
              PrintSettings.HeaderFont.Name = 'MS Sans Serif'
              PrintSettings.HeaderFont.Style = []
              PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
              PrintSettings.FooterFont.Color = clWindowText
              PrintSettings.FooterFont.Height = -11
              PrintSettings.FooterFont.Name = 'MS Sans Serif'
              PrintSettings.FooterFont.Style = []
              PrintSettings.PageNumSep = '/'
              SearchFooter.Color = 16645370
              SearchFooter.ColorTo = 16247261
              SearchFooter.FindNextCaption = 'Find &next'
              SearchFooter.FindPrevCaption = 'Find &previous'
              SearchFooter.Font.Charset = DEFAULT_CHARSET
              SearchFooter.Font.Color = clWindowText
              SearchFooter.Font.Height = -11
              SearchFooter.Font.Name = 'MS Sans Serif'
              SearchFooter.Font.Style = []
              SearchFooter.HighLightCaption = 'Highlight'
              SearchFooter.HintClose = 'Close'
              SearchFooter.HintFindNext = 'Find next occurrence'
              SearchFooter.HintFindPrev = 'Find previous occurrence'
              SearchFooter.HintHighlight = 'Highlight occurrences'
              SearchFooter.MatchCaseCaption = 'Match case'
              SearchFooter.ResultFormat = '(%d of %d)'
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              SortSettings.HeaderColor = 16579058
              SortSettings.HeaderColorTo = 16579058
              SortSettings.HeaderMirrorColor = 16380385
              SortSettings.HeaderMirrorColorTo = 16182488
              Version = '8.2.2.0'
              WordWrap = False
              ExplicitHeight = 199
              ColWidths = (
                128
                167
                64
                35
                64
                64)
              RowHeights = (
                17
                17)
            end
            object pTop101DateLeft: TPanel
              Left = 1
              Top = 1
              Width = 393
              Height = 17
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 1
            end
          end
          object sgTop101SmallDate: TAdvStringGrid
            Tag = 7
            Left = 400
            Top = 24
            Width = 1160
            Height = 677
            Cursor = crDefault
            Align = alClient
            ColCount = 6
            DefaultRowHeight = 17
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLineWidth = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
            ParentFont = False
            PopupMenu = puSearch
            ScrollBars = ssBoth
            TabOrder = 2
            OnDrawCell = sgTop101BigDateDrawCell
            GridLineColor = 15527152
            GridFixedLineColor = 13947601
            HoverRowCells = [hcNormal, hcSelected]
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 16575452
            ActiveCellColorTo = 16571329
            Bands.Active = True
            Bands.PrimaryColor = 16381426
            CellNode.TreeColor = clSilver
            ControlLook.FixedGradientMirrorFrom = 16049884
            ControlLook.FixedGradientMirrorTo = 16247261
            ControlLook.FixedGradientHoverFrom = 16710648
            ControlLook.FixedGradientHoverTo = 16446189
            ControlLook.FixedGradientHoverMirrorFrom = 16049367
            ControlLook.FixedGradientHoverMirrorTo = 15258305
            ControlLook.FixedGradientDownFrom = 15853789
            ControlLook.FixedGradientDownTo = 15852760
            ControlLook.FixedGradientDownMirrorFrom = 15522767
            ControlLook.FixedGradientDownMirrorTo = 15588559
            ControlLook.FixedGradientDownBorder = 14007466
            ControlLook.ControlStyle = csWinXP
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'MS Sans Serif'
            FilterDropDown.Font.Style = []
            FilterDropDown.TextChecked = 'Checked'
            FilterDropDown.TextUnChecked = 'Unchecked'
            FilterDropDownClear = '(All)'
            FilterEdit.TypeNames.Strings = (
              'Starts with'
              'Ends with'
              'Contains'
              'Not contains'
              'Equal'
              'Not equal'
              'Larger than'
              'Smaller than'
              'Clear')
            FixedRowHeight = 17
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clBlack
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            HoverButtons.Buttons = <>
            HoverButtons.Position = hbLeftFromColumnLeft
            HTMLSettings.ImageFolder = 'images'
            HTMLSettings.ImageBaseName = 'img'
            Look = glWin7
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'MS Sans Serif'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'MS Sans Serif'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'MS Sans Serif'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'MS Sans Serif'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            SearchFooter.Color = 16645370
            SearchFooter.ColorTo = 16247261
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'MS Sans Serif'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurrence'
            SearchFooter.HintFindPrev = 'Find previous occurrence'
            SearchFooter.HintHighlight = 'Highlight occurrences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SearchFooter.ResultFormat = '(%d of %d)'
            SortSettings.DefaultFormat = ssAutomatic
            SortSettings.Column = 0
            SortSettings.HeaderColor = 16579058
            SortSettings.HeaderColorTo = 16579058
            SortSettings.HeaderMirrorColor = 16380385
            SortSettings.HeaderMirrorColorTo = 16182488
            Version = '8.2.2.0'
            WordWrap = False
            ExplicitWidth = 41
            ExplicitHeight = 218
            ColWidths = (
              64
              64
              64
              64
              64
              64)
            RowHeights = (
              17
              17)
          end
        end
      end
    end
    object tsNullFiles: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 8
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object Splitter1: TAdvSplitter
        Left = 2
        Top = 265
        Width = 1564
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitTop = 275
        ExplicitWidth = 251
      end
      object pNullFiles: TPanel
        Left = 2
        Top = 2
        Width = 1564
        Height = 263
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 445
        object pNullFilesTitle: TPanel
          Left = 1
          Top = 1
          Width = 1562
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 443
          object sbIDeleteNullFiles: TSpeedButton
            Left = 1
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Send these files to the recycle bin'
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000C21E0000C21E00000001000000000000000000000101
              0100020202000303030004040400050505000606060007070700080808000909
              09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
              1100121212001313130014141400151515001616160017171700181818001919
              19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
              2100222222002323230024242400252525002626260027272700282828002929
              29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
              3100323232003333330034343400353535003636360037373700383838003939
              39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
              4100424242004343430044444400454545004646460047474700484848004949
              49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
              5100525252005353530054545400555555005656560057575700585858005959
              59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
              6100626262006363630064646400656565006666660067676700686868006969
              69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
              7100727272007373730074747400757575007676760077777700787878007979
              79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
              8100828282008383830084848400858585008686860087878700888888008989
              89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
              9100929292009393930094949400959595009696960097979700989898009999
              99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
              A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
              A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
              B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
              B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
              C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
              C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
              D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
              D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
              E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
              E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
              F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
              F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFCB7D88
              8DC3FFFFFFFFFFFFFFFFFFFFA6A7DAD8D36772706C686875F3FFFFAFB5F3E9E3
              E4B692E5E4DED4A072FFD9B5F4E5DBDADAF06ECFC9D08FB966FFB8DBE8B7A9CC
              DAF571BFCBD18CAF6BFFB2E6BFD0D5DAE5F578C6CDD391B16FFFBDE2DCD8DDE5
              EFE986D7CDD397B474FFE4C1EFE5EBF1EEB6A9D8CBD09DB579FFFBC3D7EEF3E3
              B6A9CCCDCAC6B6B67EFFFFF2C9B1A9A1B9C7BEBFBBC2BAC684FFFFFEF4EBE9B0
              CBEFEFEDEFEFEFA689FFFFFFFFFFFFA6EFF0E6EDEEF9DDDE8DFFFFFFFFFFFF94
              C4DFEBE8F6F0E9AB8DFFFFFFFFFFFFCC85BAD8F4FDEABC7FC9FFFFFFFFFFFFFF
              DEB5A6E8F1D1B2DCFFFFFFFFFFFFFFFFFFFFFFE4E0EFFFFFFFFF}
            OnClick = sbIDeleteNullFilesClick
          end
        end
        object sgNullFiles: TAdvStringGrid
          Left = 1
          Top = 25
          Width = 1562
          Height = 237
          Cursor = crDefault
          Align = alClient
          ColCount = 1
          DefaultRowHeight = 17
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
          ParentFont = False
          PopupMenu = puNullFiles
          ScrollBars = ssBoth
          TabOrder = 1
          OnDblClick = sgNullFilesDblClick
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 16575452
          ActiveCellColorTo = 16571329
          Bands.Active = True
          Bands.PrimaryColor = 16381426
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientMirrorFrom = 16049884
          ControlLook.FixedGradientMirrorTo = 16247261
          ControlLook.FixedGradientHoverFrom = 16710648
          ControlLook.FixedGradientHoverTo = 16446189
          ControlLook.FixedGradientHoverMirrorFrom = 16049367
          ControlLook.FixedGradientHoverMirrorTo = 15258305
          ControlLook.FixedGradientDownFrom = 15853789
          ControlLook.FixedGradientDownTo = 15852760
          ControlLook.FixedGradientDownMirrorFrom = 15522767
          ControlLook.FixedGradientDownMirrorTo = 15588559
          ControlLook.FixedGradientDownBorder = 14007466
          ControlLook.ControlStyle = csWinXP
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Tahoma'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDown.TextChecked = 'Checked'
          FilterDropDown.TextUnChecked = 'Unchecked'
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Larger than'
            'Smaller than'
            'Clear')
          FixedColWidth = 1059
          FixedRowHeight = 17
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clBlack
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          HoverButtons.Buttons = <>
          HoverButtons.Position = hbLeftFromColumnLeft
          HTMLSettings.ImageFolder = 'images'
          HTMLSettings.ImageBaseName = 'img'
          Look = glWin7
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'MS Sans Serif'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          SearchFooter.Color = 16645370
          SearchFooter.ColorTo = 16247261
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'MS Sans Serif'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurrence'
          SearchFooter.HintFindPrev = 'Find previous occurrence'
          SearchFooter.HintHighlight = 'Highlight occurrences'
          SearchFooter.MatchCaseCaption = 'Match case'
          SearchFooter.ResultFormat = '(%d of %d)'
          ShowDesignHelper = False
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.Show = True
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '8.2.2.0'
          ExplicitWidth = 443
          ColWidths = (
            1059)
          RowHeights = (
            17
            17)
        end
      end
      object pNullFolders: TPanel
        Left = 2
        Top = 268
        Width = 1564
        Height = 465
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 445
        ExplicitHeight = 6
        object pEmptyFoldersTitle: TPanel
          Left = 1
          Top = 1
          Width = 1562
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 443
          object sbIDeleteNullFolders: TSpeedButton
            Left = 1
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Send these folders to the recycle bin'
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000C21E0000C21E00000001000000000000000000000101
              0100020202000303030004040400050505000606060007070700080808000909
              09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
              1100121212001313130014141400151515001616160017171700181818001919
              19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
              2100222222002323230024242400252525002626260027272700282828002929
              29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
              3100323232003333330034343400353535003636360037373700383838003939
              39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
              4100424242004343430044444400454545004646460047474700484848004949
              49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
              5100525252005353530054545400555555005656560057575700585858005959
              59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
              6100626262006363630064646400656565006666660067676700686868006969
              69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
              7100727272007373730074747400757575007676760077777700787878007979
              79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
              8100828282008383830084848400858585008686860087878700888888008989
              89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
              9100929292009393930094949400959595009696960097979700989898009999
              99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
              A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
              A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
              B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
              B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
              C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
              C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
              D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
              D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
              E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
              E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
              F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
              F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFCB7D88
              8DC3FFFFFFFFFFFFFFFFFFFFA6A7DAD8D36772706C686875F3FFFFAFB5F3E9E3
              E4B692E5E4DED4A072FFD9B5F4E5DBDADAF06ECFC9D08FB966FFB8DBE8B7A9CC
              DAF571BFCBD18CAF6BFFB2E6BFD0D5DAE5F578C6CDD391B16FFFBDE2DCD8DDE5
              EFE986D7CDD397B474FFE4C1EFE5EBF1EEB6A9D8CBD09DB579FFFBC3D7EEF3E3
              B6A9CCCDCAC6B6B67EFFFFF2C9B1A9A1B9C7BEBFBBC2BAC684FFFFFEF4EBE9B0
              CBEFEFEDEFEFEFA689FFFFFFFFFFFFA6EFF0E6EDEEF9DDDE8DFFFFFFFFFFFF94
              C4DFEBE8F6F0E9AB8DFFFFFFFFFFFFCC85BAD8F4FDEABC7FC9FFFFFFFFFFFFFF
              DEB5A6E8F1D1B2DCFFFFFFFFFFFFFFFFFFFFFFE4E0EFFFFFFFFF}
            OnClick = sbIDeleteNullFoldersClick
          end
        end
        object sgNullFolders: TAdvStringGrid
          Left = 1
          Top = 25
          Width = 1562
          Height = 439
          Cursor = crDefault
          Align = alClient
          ColCount = 1
          DefaultRowHeight = 17
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
          ParentFont = False
          PopupMenu = puFolders
          ScrollBars = ssBoth
          TabOrder = 1
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 16575452
          ActiveCellColorTo = 16571329
          Bands.Active = True
          Bands.PrimaryColor = 16381426
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientMirrorFrom = 16049884
          ControlLook.FixedGradientMirrorTo = 16247261
          ControlLook.FixedGradientHoverFrom = 16710648
          ControlLook.FixedGradientHoverTo = 16446189
          ControlLook.FixedGradientHoverMirrorFrom = 16049367
          ControlLook.FixedGradientHoverMirrorTo = 15258305
          ControlLook.FixedGradientDownFrom = 15853789
          ControlLook.FixedGradientDownTo = 15852760
          ControlLook.FixedGradientDownMirrorFrom = 15522767
          ControlLook.FixedGradientDownMirrorTo = 15588559
          ControlLook.FixedGradientDownBorder = 14007466
          ControlLook.ControlStyle = csWinXP
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Tahoma'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDown.TextChecked = 'Checked'
          FilterDropDown.TextUnChecked = 'Unchecked'
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Larger than'
            'Smaller than'
            'Clear')
          FixedColWidth = 1059
          FixedRowHeight = 17
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clBlack
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          HoverButtons.Buttons = <>
          HoverButtons.Position = hbLeftFromColumnLeft
          HTMLSettings.ImageFolder = 'images'
          HTMLSettings.ImageBaseName = 'img'
          Look = glWin7
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'MS Sans Serif'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          SearchFooter.Color = 16645370
          SearchFooter.ColorTo = 16247261
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'MS Sans Serif'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurrence'
          SearchFooter.HintFindPrev = 'Find previous occurrence'
          SearchFooter.HintHighlight = 'Highlight occurrences'
          SearchFooter.MatchCaseCaption = 'Match case'
          SearchFooter.ResultFormat = '(%d of %d)'
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.Show = True
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '8.2.2.0'
          ExplicitWidth = 443
          ExplicitHeight = 440
          ColWidths = (
            1059)
          RowHeights = (
            17
            17)
        end
      end
    end
    object tsUsers: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 9
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object splitUsers: TAdvSplitter
        Left = 523
        Top = 2
        Height = 731
        OnMoved = splitUsersMoved
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 536
        ExplicitTop = 328
        ExplicitHeight = 100
      end
      object pUsers: TPanel
        Left = 2
        Top = 2
        Width = 521
        Height = 731
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 272
        object Panel29: TPanel
          Left = 1
          Top = 1
          Width = 519
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = clWhite
          FullRepaint = False
          ParentBiDiMode = False
          ParentBackground = False
          TabOrder = 0
          object sbUsersPie: TSpeedButton
            Tag = 11
            Left = 0
            Top = 1
            Width = 24
            Height = 22
            GroupIndex = 1
            Down = True
            Flat = True
            OnClick = sbMainPieClick
          end
          object sbUsersBar: TSpeedButton
            Tag = 11
            Left = 24
            Top = 1
            Width = 24
            Height = 22
            GroupIndex = 1
            Flat = True
            OnClick = sbMainBarClick
          end
          object rbUsersSize: TAdvOfficeRadioButton
            Left = 90
            Top = 3
            Width = 100
            Height = 20
            Hint = 'graph by size of files'
            TabOrder = 0
            TabStop = True
            OnClick = rbUsersSizeClick
            Alignment = taLeftJustify
            Caption = '.'
            Checked = True
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
          object rbUsersQuantity: TAdvOfficeRadioButton
            Left = 195
            Top = 3
            Width = 100
            Height = 20
            Hint = 'graph by number of files'
            TabOrder = 1
            OnClick = rbUsersSizeClick
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
        end
        object vtcUsers: TChart
          Tag = 2
          Left = 1
          Top = 25
          Width = 519
          Height = 705
          AllowPanning = pmNone
          BackWall.Brush.Style = bsClear
          BackWall.Pen.Visible = False
          Gradient.EndColor = clWhite
          Gradient.StartColor = 16771293
          Gradient.Visible = True
          LeftWall.Color = clGray
          Legend.Alignment = laLeft
          Legend.TextStyle = ltsPlain
          MarginBottom = 0
          MarginLeft = 1
          MarginRight = 1
          MarginTop = 0
          Title.Text.Strings = (
            '.....')
          AxisVisible = False
          ClipPoints = False
          Frame.Visible = False
          LeftAxis.Inverted = True
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DWalls = False
          Zoom.Allow = False
          Align = alClient
          BevelOuter = bvLowered
          PopupMenu = puCharts
          TabOrder = 1
          OnMouseMove = vtcUsersMouseMove
          ExplicitHeight = 246
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object PieSeries8: TPieSeries
            Marks.Style = smsPercent
            Marks.Arrow.Color = clBlack
            Marks.BackColor = clWhite
            Marks.Callout.Arrow.Color = clBlack
            Marks.Color = clWhite
            XValues.Order = loAscending
            YValues.Name = 'Pie'
            YValues.Order = loAscending
            Frame.InnerBrush.BackColor = clRed
            Frame.InnerBrush.Gradient.EndColor = clGray
            Frame.InnerBrush.Gradient.MidColor = clWhite
            Frame.InnerBrush.Gradient.StartColor = 4210752
            Frame.InnerBrush.Gradient.Visible = True
            Frame.MiddleBrush.BackColor = clYellow
            Frame.MiddleBrush.Gradient.EndColor = 8553090
            Frame.MiddleBrush.Gradient.MidColor = clWhite
            Frame.MiddleBrush.Gradient.StartColor = clGray
            Frame.MiddleBrush.Gradient.Visible = True
            Frame.OuterBrush.BackColor = clGreen
            Frame.OuterBrush.Gradient.EndColor = 4210752
            Frame.OuterBrush.Gradient.MidColor = clWhite
            Frame.OuterBrush.Gradient.StartColor = clSilver
            Frame.OuterBrush.Gradient.Visible = True
            Frame.Width = 4
            Gradient.Balance = 10
            Gradient.Direction = gdDiagonalUp
            Gradient.EndColor = 919731
            Gradient.StartColor = 919731
            Gradient.Visible = True
            OtherSlice.Legend.Visible = False
            OtherSlice.Text = 'Other'
            PiePen.Visible = False
            RotationAngle = 5
          end
        end
      end
      object Panel5: TPanel
        Left = 526
        Top = 2
        Width = 1040
        Height = 731
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 1032
        ExplicitHeight = 272
        object Panel28: TPanel
          Left = 1
          Top = 1
          Width = 1038
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 1030
          object sbUsersCopy: TSpeedButton
            Left = 1
            Top = 0
            Width = 23
            Height = 22
            Hint = 'copy this table to the clipboard'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFD39570CC8357C87646CA7B4ECB7B4ECA7B4ECA7B
              4ECA7B4ECA8155CD865CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCB8256FC
              F3ECFAF1E8FAF0E7FBF1E9FBF2EAFBF2EAFBF2EBFDF4EECB8358FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCF8253EFF1E7FFE9D9FFEADBFFE9D9FFE7D7FFE5
              D2FFE2CBEFF2E8CE8156FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCD8555FB
              F5EEFFE9D9FFEADBFFE9D9FFE7D7FFE5D2FFE2CBFBF6EFCC8356D69E7CD3936E
              CF875ED08C64D18C64D08C64CA8452FFF7F1FFE9D9FFEADBFFE9D9FFE7D7FFE5
              D2FFE2CBFFF7F1CB8556D1936DFCF5EEFBF3EBFBF2EAFCF3ECFCF4EDE4BA91FF
              F7F0FFE7D5FDE7D6FDE6D4FCE4D0FBE3CBFADCC2FEF3E8CC8657D59269F1F3EA
              FFECDEFFEDE0FFECDEFFEADCE4BB91FFF7F2FEE7D5FEE7D5FDE5D1FAE0CAF9DE
              C4F7D9BCFDF2E7CC8758D3956AFCF6F0FFECDEFFEDE0FFECDEFFEADCE4BB92FE
              F7F1FCE5D2FCE4D1FBE2CCF9DDC4F6D7BBF3D1AFFAEFE4CC8759D1956AFFF8F3
              FFECDEFFEDE0FFECDEFFEADCE4BB92FEF6F0FCE2CDFCE3CDFADFC8F7D9BCF5E9
              DDFAF3EBFBF8F3CA8354D2966BFFF8F2FFEADAFDEADBFDE9DAFCE7D6E4BB93FE
              F5EDFCDEC5FBE0C7F9DCC2F5D3B4FEF9F3FAE2C4ECC193DCB496D2976CFFF8F4
              FEEADAFEEADAFDE8D7FBE4D1E5BE96FFFFFEFDF3E9FDF3EAFCF2E8FAEFE3FAF2
              E7EABB88DDA988FBF8F6D2976DFEF8F3FCE8D8FCE7D7FCE6D3FAE1CCEAC39DE6
              BF96E4BB92E4BB92D3A472D2A172D3A576E2BDA2FCFAF8FFFFFFD2976DFEF7F2
              FCE6D3FCE7D3FBE3CFF8DEC5F6ECE1FBF5EEFCF9F5D4A47AFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFD3986FFEF6EFFCE2CDFCE4CEFAE1CAF6D9BEFEFAF5FB
              E6CCEEC9A1E1BEA3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD49B74FFFFFF
              FDF5ECFDF5EDFCF4EBFBF1E7FBF4EAEDC497E2B497FCF9F7FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFDAA684D69D76D3976DD2996ED3996ED2986FD49A70E6
              C5ADFDFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = sbUsersCopyClick
          end
          object cbUsersDisplayMode: TComboBox
            Left = 28
            Top = 0
            Width = 157
            Height = 21
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbUsersDisplayModeChange
          end
        end
        object sgUsers: TAdvStringGrid
          Left = 1
          Top = 25
          Width = 1038
          Height = 705
          Cursor = crDefault
          Align = alClient
          ColCount = 10
          DefaultRowHeight = 17
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
          ParentFont = False
          PopupMenu = puUsers
          ScrollBars = ssBoth
          TabOrder = 1
          OnDblClick = sgUsersDblClick
          OnDrawCell = sgUsersDrawCell
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          OnCanSort = sgUsersCanSort
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 16575452
          ActiveCellColorTo = 16571329
          Bands.Active = True
          Bands.PrimaryColor = 16381426
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientMirrorFrom = 16049884
          ControlLook.FixedGradientMirrorTo = 16247261
          ControlLook.FixedGradientHoverFrom = 16710648
          ControlLook.FixedGradientHoverTo = 16446189
          ControlLook.FixedGradientHoverMirrorFrom = 16049367
          ControlLook.FixedGradientHoverMirrorTo = 15258305
          ControlLook.FixedGradientDownFrom = 15853789
          ControlLook.FixedGradientDownTo = 15852760
          ControlLook.FixedGradientDownMirrorFrom = 15522767
          ControlLook.FixedGradientDownMirrorTo = 15588559
          ControlLook.FixedGradientDownBorder = 14007466
          ControlLook.ControlStyle = csWinXP
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Tahoma'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDown.TextChecked = 'Checked'
          FilterDropDown.TextUnChecked = 'Unchecked'
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Larger than'
            'Smaller than'
            'Clear')
          FixedRowHeight = 17
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clBlack
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          HoverButtons.Buttons = <>
          HoverButtons.Position = hbLeftFromColumnLeft
          HTMLSettings.ImageFolder = 'images'
          HTMLSettings.ImageBaseName = 'img'
          Look = glWin7
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'MS Sans Serif'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          SearchFooter.Color = 16645370
          SearchFooter.ColorTo = 16247261
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'MS Sans Serif'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurrence'
          SearchFooter.HintFindPrev = 'Find previous occurrence'
          SearchFooter.HintHighlight = 'Highlight occurrences'
          SearchFooter.MatchCaseCaption = 'Match case'
          SearchFooter.ResultFormat = '(%d of %d)'
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.Show = True
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '8.2.2.0'
          ExplicitWidth = 1030
          ExplicitHeight = 246
          ColWidths = (
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64)
          RowHeights = (
            17
            17)
        end
      end
    end
    object tsTemp: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1568
      Height = 735
      Caption = ''
      PageAppearance.Color = 16575452
      PageAppearance.ColorTo = 16571329
      PageAppearance.ColorMirror = clNone
      PageAppearance.ColorMirrorTo = clNone
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13542013
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = clWindowText
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 10
      TabAppearance.Appearance.WordWrapping = False
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 0
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = 13542013
      TabAppearance.BevelColorDown = 16645114
      TabAppearance.BevelColorSelected = 16645114
      TabAppearance.BevelColorHot = 16645114
      TabAppearance.BevelColorDisabled = 16645114
      TabAppearance.Color = 16575452
      TabAppearance.ColorDown = 16575452
      TabAppearance.ColorSelected = 16575452
      TabAppearance.ColorDisabled = 16765357
      TMSStyle = 0
      object splitterTemp: TAdvSplitter
        Left = 323
        Top = 2
        Height = 731
        OnMoved = splitterTempMoved
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 352
        ExplicitTop = 280
        ExplicitHeight = 100
      end
      object Panel21: TPanel
        Left = 2
        Top = 2
        Width = 321
        Height = 731
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 272
        object Panel22: TPanel
          Left = 1
          Top = 1
          Width = 319
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = clWhite
          ParentBiDiMode = False
          ParentBackground = False
          TabOrder = 0
          object SpeedButton2: TSpeedButton
            Left = 0
            Top = 1
            Width = 24
            Height = 22
            Hint = 'configure temporary files'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C21E0000C21E00000000000000000000FFFFFF5199FF
              2981FF217DFF63A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4995FFA0C7FF
              83B7FF7FB4FF97C2FF5399FF67A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
              A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1CAFF79B3FF
              A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
              C5FF599EFF70ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7CDFF7EB7FFA9CEFFA8CDFF70
              ACFF5F9AEE8C8C8CEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
              87979797C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9CFFF84B6F794
              9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989C8C8C8FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1939393D4D4D4C8C8C8BCBCBCBABA
              BAC2C2C2C4C4C4999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AE4E4E4CFCFCFACACACFFFF
              FF8E8E8E8C8C8C8C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFABABABE2E2E2E7E7E7B9B9B9939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D49F9F9FE4E4E4EEEEEE9696
              96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFD4D4D4ACACAC9D9D9D9B9B9BFFFFFFFFFFFFFFFFFF}
            OnClick = SpeedButton2Click
          end
          object rbTempSize: TAdvOfficeRadioButton
            Left = 35
            Top = 3
            Width = 100
            Height = 20
            Hint = 'graph by size of files'
            TabOrder = 0
            TabStop = True
            OnClick = rbTempSizeClick
            Alignment = taLeftJustify
            Caption = '.'
            Checked = True
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
          object rbTempQuantity: TAdvOfficeRadioButton
            Left = 140
            Top = 3
            Width = 100
            Height = 20
            Hint = 'graph by number of files'
            TabOrder = 1
            OnClick = rbTempSizeClick
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
        end
        object vtcTemp: TChart
          Tag = 2
          Left = 1
          Top = 25
          Width = 319
          Height = 705
          AllowPanning = pmNone
          BackWall.Brush.Style = bsClear
          BackWall.Pen.Visible = False
          Gradient.EndColor = clWhite
          Gradient.StartColor = 16771293
          Gradient.Visible = True
          LeftWall.Color = clGray
          Legend.Alignment = laLeft
          Legend.TextStyle = ltsPlain
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 1
          MarginRight = 1
          MarginTop = 0
          Title.Text.Strings = (
            '.....')
          AxisVisible = False
          ClipPoints = False
          Frame.Visible = False
          LeftAxis.Inverted = True
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DWalls = False
          Zoom.Allow = False
          Align = alClient
          BevelOuter = bvLowered
          PopupMenu = puCharts
          TabOrder = 1
          OnMouseMove = vtcTempMouseMove
          ExplicitHeight = 246
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object PieSeries7: TPieSeries
            Marks.Style = smsPercent
            Marks.Arrow.Color = clBlack
            Marks.BackColor = clWhite
            Marks.Callout.Arrow.Color = clBlack
            Marks.Color = clWhite
            XValues.Order = loAscending
            YValues.Name = 'Pie'
            YValues.Order = loAscending
            Frame.InnerBrush.BackColor = clRed
            Frame.InnerBrush.Gradient.EndColor = clGray
            Frame.InnerBrush.Gradient.MidColor = clWhite
            Frame.InnerBrush.Gradient.StartColor = 4210752
            Frame.InnerBrush.Gradient.Visible = True
            Frame.MiddleBrush.BackColor = clYellow
            Frame.MiddleBrush.Gradient.EndColor = 8553090
            Frame.MiddleBrush.Gradient.MidColor = clWhite
            Frame.MiddleBrush.Gradient.StartColor = clGray
            Frame.MiddleBrush.Gradient.Visible = True
            Frame.OuterBrush.BackColor = clGreen
            Frame.OuterBrush.Gradient.EndColor = 4210752
            Frame.OuterBrush.Gradient.MidColor = clWhite
            Frame.OuterBrush.Gradient.StartColor = clSilver
            Frame.OuterBrush.Gradient.Visible = True
            Frame.Width = 4
            Gradient.Balance = 10
            Gradient.Direction = gdDiagonalUp
            Gradient.EndColor = 919731
            Gradient.StartColor = 919731
            Gradient.Visible = True
            OtherSlice.Legend.Visible = False
            OtherSlice.Text = 'Other'
            PiePen.Visible = False
            RotationAngle = 5
          end
        end
      end
      object Panel24: TPanel
        Left = 326
        Top = 2
        Width = 1240
        Height = 731
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 121
        ExplicitHeight = 272
        object Panel23: TPanel
          Left = 1
          Top = 1
          Width = 1238
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 119
          DesignSize = (
            1238
            24)
          object lTempStatus: THTMLabel
            Left = 5
            Top = 4
            Width = 5765
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            AutoSizing = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HTMLText.Strings = (
              '...')
            ParentFont = False
            Transparent = True
            Version = '1.9.2.6'
            ExplicitWidth = 1244
          end
        end
        object sgTemp: TAdvStringGrid
          Left = 1
          Top = 25
          Width = 1238
          Height = 705
          Cursor = crDefault
          Align = alClient
          ColCount = 3
          DefaultRowHeight = 17
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
          ParentFont = False
          PopupMenu = puTable
          ScrollBars = ssBoth
          TabOrder = 1
          OnDrawCell = sgTempDrawCell
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          OnCanSort = sgTempCanSort
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 16575452
          ActiveCellColorTo = 16571329
          Bands.Active = True
          Bands.PrimaryColor = 16381426
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientMirrorFrom = 16049884
          ControlLook.FixedGradientMirrorTo = 16247261
          ControlLook.FixedGradientHoverFrom = 16710648
          ControlLook.FixedGradientHoverTo = 16446189
          ControlLook.FixedGradientHoverMirrorFrom = 16049367
          ControlLook.FixedGradientHoverMirrorTo = 15258305
          ControlLook.FixedGradientDownFrom = 15853789
          ControlLook.FixedGradientDownTo = 15852760
          ControlLook.FixedGradientDownMirrorFrom = 15522767
          ControlLook.FixedGradientDownMirrorTo = 15588559
          ControlLook.FixedGradientDownBorder = 14007466
          ControlLook.ControlStyle = csWinXP
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Tahoma'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDown.TextChecked = 'Checked'
          FilterDropDown.TextUnChecked = 'Unchecked'
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Larger than'
            'Smaller than'
            'Clear')
          FixedColWidth = 20
          FixedRowHeight = 17
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clBlack
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          HoverButtons.Buttons = <>
          HoverButtons.Position = hbLeftFromColumnLeft
          HTMLSettings.ImageFolder = 'images'
          HTMLSettings.ImageBaseName = 'img'
          Look = glWin7
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'MS Sans Serif'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          SearchFooter.Color = 16645370
          SearchFooter.ColorTo = 16247261
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'MS Sans Serif'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurrence'
          SearchFooter.HintFindPrev = 'Find previous occurrence'
          SearchFooter.HintHighlight = 'Highlight occurrences'
          SearchFooter.MatchCaseCaption = 'Match case'
          SearchFooter.ResultFormat = '(%d of %d)'
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.Show = True
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '8.2.2.0'
          ExplicitWidth = 119
          ExplicitHeight = 246
          ColWidths = (
            20
            20
            20)
          RowHeights = (
            17
            17)
        end
      end
    end
  end
  object puCharts: TPopupMenu
    Left = 1455
    Top = 64
    object miChartOptions: TMenuItem
      Caption = '.'
      Enabled = False
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object miCOSave: TMenuItem
      Caption = '.'
      ImageIndex = 49
      OnClick = miCOSaveClick
    end
    object miCOCopy: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miCOCopyClick
    end
    object miCOAdvanced: TMenuItem
      Caption = '.'
      ImageIndex = 53
      OnClick = miCOAdvancedClick
    end
    object N30: TMenuItem
      Caption = '-'
    end
    object miCGradientFrom: TMenuItem
      Caption = '.'
      object miCGradientFromSelect: TMenuItem
        Caption = '.'
        ImageIndex = 55
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect1: TMenuItem
        Tag = 1
        Caption = '.'
        ImageIndex = 56
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect2: TMenuItem
        Tag = 2
        Caption = '.'
        ImageIndex = 57
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect3: TMenuItem
        Tag = 3
        Caption = '.'
        ImageIndex = 58
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect4: TMenuItem
        Tag = 4
        Caption = '.'
        ImageIndex = 59
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect5: TMenuItem
        Tag = 5
        Caption = '.'
        ImageIndex = 60
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect6: TMenuItem
        Tag = 6
        Caption = '.'
        ImageIndex = 61
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect7: TMenuItem
        Tag = 7
        Caption = '.'
        ImageIndex = 62
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect8: TMenuItem
        Tag = 8
        Caption = '.'
        ImageIndex = 63
        OnClick = miCGradientFromSelectClick
      end
      object miCGradientFromSelect9: TMenuItem
        Tag = 9
        Caption = '.'
        ImageIndex = 64
        OnClick = miCGradientFromSelectClick
      end
      object miCCustomFrom: TMenuItem
        Caption = '.'
        OnClick = miCCustomFromClick
      end
    end
    object miCGradientTo: TMenuItem
      Caption = '.'
      object miCGradientToSelect: TMenuItem
        Caption = '.'
        ImageIndex = 55
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect1: TMenuItem
        Tag = 1
        Caption = '.'
        ImageIndex = 56
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect2: TMenuItem
        Tag = 2
        Caption = '.'
        ImageIndex = 57
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect3: TMenuItem
        Tag = 3
        Caption = '.'
        ImageIndex = 58
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect4: TMenuItem
        Tag = 4
        Caption = '.'
        ImageIndex = 59
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect5: TMenuItem
        Tag = 5
        Caption = '.'
        ImageIndex = 60
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect6: TMenuItem
        Tag = 6
        Caption = '.'
        ImageIndex = 61
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect7: TMenuItem
        Tag = 7
        Caption = '.'
        ImageIndex = 62
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect8: TMenuItem
        Tag = 8
        Caption = '.'
        ImageIndex = 63
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect9: TMenuItem
        Tag = 9
        Caption = '.'
        ImageIndex = 64
        OnClick = miCGradientToSelectClick
      end
      object miCCustomTo: TMenuItem
        Caption = '.'
        OnClick = miCCustomToClick
      end
    end
    object N32: TMenuItem
      Caption = '-'
    end
    object miCToggleGradient: TMenuItem
      Caption = '.'
      OnClick = miCToggleGradientClick
    end
  end
  object puType: TPopupMenu
    OnPopup = puTypePopup
    Left = 1392
    Top = 64
    object miTypeExportContent: TMenuItem
      Caption = '.'
      ImageIndex = 49
      OnClick = miTypeExportContentClick
    end
    object miTypeZip: TMenuItem
      Caption = '.'
      ImageIndex = 51
      OnClick = miTypeZipClick
    end
    object miTypeExportCB: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miTypeExportCBClick
    end
  end
  object puExtensionsMain: TPopupMenu
    OnPopup = puExtensionsMainPopup
    Left = 1152
    Top = 8
    object miOtherAddTo: TMenuItem
      Caption = '.'
      ImageIndex = 0
      object miOA1: TMenuItem
        Tag = 1
        Caption = '.'
        ImageIndex = 7
        OnClick = miOA1Click
      end
      object miOA2: TMenuItem
        Tag = 2
        Caption = '.'
        ImageIndex = 9
        OnClick = miOA1Click
      end
      object miOA3: TMenuItem
        Tag = 3
        Caption = '.'
        ImageIndex = 11
        OnClick = miOA1Click
      end
      object miOA4: TMenuItem
        Tag = 4
        Caption = '.'
        ImageIndex = 13
        OnClick = miOA1Click
      end
      object miOA5: TMenuItem
        Tag = 5
        Caption = '.'
        ImageIndex = 15
        OnClick = miOA1Click
      end
      object miOA6: TMenuItem
        Tag = 6
        Caption = '.'
        ImageIndex = 17
        OnClick = miOA1Click
      end
      object miOA7: TMenuItem
        Tag = 7
        Caption = '.'
        ImageIndex = 19
        OnClick = miOA1Click
      end
      object miOA8: TMenuItem
        Tag = 8
        Caption = '.'
        ImageIndex = 21
        OnClick = miOA1Click
      end
      object Custom1: TMenuItem
        Caption = 'Custom'
        object miOA9: TMenuItem
          Tag = 10
          Caption = '.'
          ImageIndex = 25
          OnClick = miOA1Click
        end
        object miOA10: TMenuItem
          Tag = 11
          Caption = '.'
          ImageIndex = 27
          OnClick = miOA1Click
        end
        object miOA11: TMenuItem
          Tag = 12
          Caption = '.'
          ImageIndex = 29
          OnClick = miOA1Click
        end
        object miOA12: TMenuItem
          Tag = 13
          Caption = '.'
          ImageIndex = 31
          OnClick = miOA1Click
        end
        object miOA13: TMenuItem
          Tag = 14
          Caption = '.'
          ImageIndex = 33
          OnClick = miOA1Click
        end
        object miOA14: TMenuItem
          Tag = 15
          Caption = '.'
          ImageIndex = 35
          OnClick = miOA1Click
        end
        object miOA15: TMenuItem
          Tag = 16
          Caption = '.'
          ImageIndex = 37
          OnClick = miOA1Click
        end
        object miOA16: TMenuItem
          Tag = 17
          Caption = '.'
          ImageIndex = 39
          OnClick = miOA1Click
        end
        object miOA17: TMenuItem
          Tag = 18
          Caption = '.'
          ImageIndex = 41
          OnClick = miOA1Click
        end
        object miOA18: TMenuItem
          Tag = 19
          Caption = '.'
          ImageIndex = 43
          OnClick = miOA1Click
        end
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object miShowOtherFiles: TMenuItem
      Caption = '.'
      ImageIndex = 3
      OnClick = miShowOtherFilesClick
    end
    object miExtensionsExportTableCSV: TMenuItem
      Tag = 8
      Caption = '.'
      ImageIndex = 50
      OnClick = miExtensionsExportTableCSVClick
    end
    object N37: TMenuItem
      Caption = '-'
    end
    object SaveasCSV2: TMenuItem
      Caption = 'Save as CSV'
      OnClick = SaveasCSV2Click
    end
  end
  object puFolders: TPopupMenu
    OnPopup = puFoldersPopup
    Left = 1249
    Top = 71
    object miFolderMoreDetail: TMenuItem
      Caption = '.'
      OnClick = miFolderMoreDetailClick
    end
    object miScanFromDirList: TMenuItem
      Caption = '.'
      ImageIndex = 3
      OnClick = miScanFromDirListClick
    end
    object miExploreFromDirList: TMenuItem
      Caption = '.'
      ImageIndex = 4
      OnClick = miExploreFromDirListClick
    end
    object miFolderExportSelectedCB: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miFolderExportSelectedCBClick
    end
  end
  object puMagnitude: TPopupMenu
    OnPopup = puMagnitudePopup
    Left = 1225
    Top = 8
    object miMagnitudeExport: TMenuItem
      Caption = '.'
      ImageIndex = 49
      OnClick = miMagnitudeExportClick
    end
    object miMagnitudeZip: TMenuItem
      Caption = '.'
      ImageIndex = 51
      OnClick = miMagnitudeZipClick
    end
    object miMagnitudeExportCB: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miMagnitudeExportCBClick
    end
  end
  object puTreeDate: TPopupMenu
    OnPopup = puTreeDatePopup
    Left = 1329
    Top = 73
    object MenuItem20: TMenuItem
      Caption = '.'
      ImageIndex = 1
      OnClick = MenuItem20Click
    end
    object MenuItem18: TMenuItem
      Caption = '.'
      OnClick = MenuItem18Click
    end
    object MenuItem19: TMenuItem
      Caption = '-'
    end
    object miFileDatesExploreDir: TMenuItem
      Caption = '.'
      ImageIndex = 4
      OnClick = miFileDatesExploreDirClick
    end
    object miFileDatesInfo: TMenuItem
      Caption = '.'
      ImageIndex = 2
      OnClick = miFileDatesInfoClick
    end
    object miDGenerateMD5: TMenuItem
      Caption = '.'
      ImageIndex = 48
      OnClick = miDGenerateMD5Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object miFileDatesExport: TMenuItem
      Caption = '.'
      ImageIndex = 49
      OnClick = miFileDatesExportClick
    end
    object miFileDatesExportCB: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miFileDatesExportCBClick
    end
  end
  object puSearch: TPopupMenu
    OnPopup = puSearchPopup
    Left = 1522
    Top = 73
    object miSearchOpen: TMenuItem
      Caption = '.'
      ImageIndex = 1
      OnClick = miSearchOpenClick
    end
    object miSearchOpenCustom: TMenuItem
      Caption = '.'
      OnClick = miSearchOpenCustomClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miExploreDirectory: TMenuItem
      Caption = '.'
      ImageIndex = 4
      OnClick = miExploreDirectoryClick
    end
    object miSFileProperties: TMenuItem
      Caption = '.'
      ImageIndex = 2
      OnClick = miSFilePropertiesClick
    end
    object miGenerateMD5: TMenuItem
      Caption = '.'
      ImageIndex = 48
      OnClick = miGenerateMD5Click
    end
    object miHexEdit: TMenuItem
      Caption = '.'
      ImageIndex = 54
      OnClick = miHexEditClick
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object miCopyMenu: TMenuItem
      Caption = '.'
      ImageIndex = 45
      object miCopySelected: TMenuItem
        Caption = '.'
        OnClick = miCopySelectedClick
      end
      object miCopyAll: TMenuItem
        Caption = '.'
        OnClick = miCopyAllClick
      end
    end
    object miMoveMenu: TMenuItem
      Caption = '.'
      ImageIndex = 47
      object miMoveSelected: TMenuItem
        Caption = '.'
        OnClick = miMoveSelectedClick
      end
      object miMoveAll: TMenuItem
        Caption = '.'
        OnClick = miMoveAllClick
      end
    end
    object miDeleteMenu: TMenuItem
      Caption = '.'
      ImageIndex = 46
      object miDeleteSelected: TMenuItem
        Caption = '.'
        OnClick = miDeleteSelectedClick
      end
      object miDeleteAll: TMenuItem
        Caption = '.'
        OnClick = miDeleteAllClick
      end
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object miZIP: TMenuItem
      Caption = '.'
      ImageIndex = 51
      OnClick = miZIPClick
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object miSearchExportToCB: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miSearchExportToCBClick
    end
    object N36: TMenuItem
      Caption = '-'
    end
    object SaveasCSV1: TMenuItem
      Caption = 'Save as CSV'
      ImageIndex = 65
      OnClick = SaveasCSV1Click
    end
    object SaveasASCII1: TMenuItem
      Caption = 'Save as ASCII'
      ImageIndex = 66
      OnClick = SaveasASCII1Click
    end
  end
  object puUsers: TPopupMenu
    OnPopup = puUsersPopup
    Left = 1288
    Top = 8
    object miUsersExportSelected: TMenuItem
      Caption = '.'
      ImageIndex = 49
      OnClick = miUsersExportSelectedClick
    end
    object miUsersZip: TMenuItem
      Caption = '.'
      ImageIndex = 51
      OnClick = miUsersZipClick
    end
    object miUsersExportSelectedCB: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miUsersExportSelectedCBClick
    end
  end
  object puFolderConfig: TPopupMenu
    Left = 1353
    Top = 14
    object miFCO: TMenuItem
      Caption = '.'
      Enabled = False
      GroupIndex = 1
    end
    object miFCOShowAll: TMenuItem
      AutoCheck = True
      Caption = '.'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = miFCOShowAllClick
    end
    object N110: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = '>1%'
      GroupIndex = 1
      RadioItem = True
      OnClick = miFCOShowAllClick
    end
    object N28: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = '>2%'
      GroupIndex = 1
      RadioItem = True
      OnClick = miFCOShowAllClick
    end
    object N31: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = '>3%'
      GroupIndex = 1
      RadioItem = True
      OnClick = miFCOShowAllClick
    end
    object N41: TMenuItem
      Tag = 4
      AutoCheck = True
      Caption = '>4%'
      GroupIndex = 1
      RadioItem = True
      OnClick = miFCOShowAllClick
    end
    object N51: TMenuItem
      Tag = 5
      AutoCheck = True
      Caption = '>5%'
      GroupIndex = 1
      RadioItem = True
      OnClick = miFCOShowAllClick
    end
    object N101: TMenuItem
      Tag = 6
      AutoCheck = True
      Caption = '>10%'
      GroupIndex = 1
      RadioItem = True
      OnClick = miFCOShowAllClick
    end
    object N151: TMenuItem
      Tag = 7
      AutoCheck = True
      Caption = '>15%'
      GroupIndex = 1
      RadioItem = True
      OnClick = miFCOShowAllClick
    end
  end
  object puTableDisplay: TPopupMenu
    Left = 1193
    Top = 72
    object miTDShowAll: TMenuItem
      Caption = '.'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = miTDShowAllClick
    end
    object miTDNonZero: TMenuItem
      Caption = '.'
      GroupIndex = 1
      RadioItem = True
      OnClick = miTDNonZeroClick
    end
    object miTDUserDefined: TMenuItem
      Caption = '.'
      GroupIndex = 1
      RadioItem = True
      OnClick = miTDUserDefinedClick
    end
    object N13: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object miTD1: TMenuItem
      Tag = 1
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTD2: TMenuItem
      Tag = 2
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTD3: TMenuItem
      Tag = 3
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTD4: TMenuItem
      Tag = 4
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTD5: TMenuItem
      Tag = 5
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTD6: TMenuItem
      Tag = 6
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTD7: TMenuItem
      Tag = 7
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTD8: TMenuItem
      Tag = 8
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTD9: TMenuItem
      Tag = 9
      Caption = '.'
      GroupIndex = 1
      OnClick = miTD1Click
    end
    object miTDCustom: TMenuItem
      Caption = '.'
      GroupIndex = 1
      object miTD10: TMenuItem
        Tag = 10
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD11: TMenuItem
        Tag = 11
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD12: TMenuItem
        Tag = 12
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD13: TMenuItem
        Tag = 13
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD14: TMenuItem
        Tag = 14
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD15: TMenuItem
        Tag = 15
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD16: TMenuItem
        Tag = 16
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD17: TMenuItem
        Tag = 17
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD18: TMenuItem
        Tag = 18
        Caption = '.'
        OnClick = miTD1Click
      end
      object miTD19: TMenuItem
        Tag = 19
        Caption = '.'
        OnClick = miTD1Click
      end
    end
  end
  object puTable: TPopupMenu
    OnPopup = puTablePopup
    Left = 1408
    Top = 8
    object miTableExportSelected: TMenuItem
      Caption = '.'
      ImageIndex = 49
      OnClick = miTableExportSelectedClick
    end
    object miTableZip: TMenuItem
      Caption = '.'
      ImageIndex = 51
      OnClick = miTableZipClick
    end
    object miTableExportSelectedCB: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miTableExportSelectedCBClick
    end
  end
  object puNullFiles: TPopupMenu
    OnPopup = puNullFilesPopup
    Left = 1464
    Top = 8
    object miNFExplore: TMenuItem
      Caption = '.'
      ImageIndex = 4
      OnClick = miNFExploreClick
    end
    object miNFProperties: TMenuItem
      Caption = '.'
      OnClick = miNFPropertiesClick
    end
  end
  object puNullFolders: TPopupMenu
    OnPopup = puNullFoldersPopup
    Left = 1528
    Top = 16
    object miNFExploreFolder: TMenuItem
      Caption = '.'
      ImageIndex = 4
      OnClick = miNFExploreFolderClick
    end
    object miNFFolderProperties: TMenuItem
      Caption = '.'
      OnClick = miNFFolderPropertiesClick
    end
  end
  object ilTabs: TImageList
    DrawingStyle = dsTransparent
    ShareImages = True
    Left = 1136
    Top = 66
    Bitmap = {
      494C01010C00A402A00710001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2C0AA00CC8D
      6600BC6B3600BC6B3600BC6A3600BC6A3600BB6A3500BB6A3500BB693500BD6E
      3B00CA8B6300E3C2AE0000000000000000000000000000000000000000000000
      0000D2977A00AA553800AD4C2B00AE4A2600AD482600AA482900A74D3100C77F
      5F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C57C4D00F8F1
      EA00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FAF3EB00FAF2EA00F8F3ED00F8F3
      ED00F8F3ED00C37A4D00000000000000000000000000BAD3EA00287BCE008863
      6300BF603500FEB96100FEB96200FEB96200FEB96200FEB96100FEB96100B149
      24007F6A73003482CF00B4CFE8000000000000000000000000004DA3EA00469E
      E8003E9AE7003595E6001E8CE200208CE200218DE4001989E3001283E3000A81
      E100037DE0000079DF00000000000000000000000000E8D1D100D2BDBD00B5A3
      A300B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F
      9F00AF9E9E00B3A1A100D8C3C300000000000000000000000000C6804600F7F0
      E600F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C1743C000000000000000000000000002A7ED10082BAEE009F66
      5800F5BB8400FFAC5B00FEA85A00FEA25700FE9C5300FFA35500FF9F5000F8AE
      7800A45E4A0083BCEF002B78CA0000000000000000000000000055A7EB00B6E6
      F90095D1F1004BA7E8005AAFEB007DC2EE00BBEEFB00BAEEF900B7EDF900B3ED
      F900B2EDF900017DE200000000000000000000000000BAA8A800FFF2F200F9E0
      E000F6DEDE00F5DDDD00F3DBDB00F2DADA00F0D8D800EFD7D700EED6D600EBD4
      D400EAD3D300FFECEC00B7A5A500000000000000000000000000C7844800F8F1
      E800F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C37A41000000000000000000000000002B7ECF0078B3EA00B39E
      9400FFB76000FFB66300FEB26100FEAC5D00FEA55900FD9E5300FE974E00FF8D
      4300BC8F82007EB8ED002D77C8000000000000000000000000005DABEB00B4E3
      F800329FE6003BABE900A8E9F8004EBAEB005AD6F30050D4F30048D2F20042D1
      F200B4EDF9000881E300000000000000000000000000B9A7A700FFFBFB00FFEA
      EA00FFE6E600FBE2E200F8DFDF00F4DCDC00F2DADA00EED6D600EAD3D300E8D1
      D100E6CFCF00FFF2F200B9A7A700000000000000000000000000C7864B00F8F2
      EB00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C7804500000000000000000000000000E1C9BC008A544400FCC8
      AB00FFD19800FEC76D00FEBF6800FEB96400FEB15E00FEA85900FDA05400FFB7
      7A00FEA9800088504200D3BCAF000000000000000000000000005DACEC0055AD
      EB0047AFEB00ACE9F900ADEAFA0056BBEB0062D9F4005AD6F30050D4F30049D2
      F300B7EDF9001185E400000000000000000000000000BEABAB00FFFBFB00FFEE
      EE00FFEAEA00FFE7E700FCE3E300F9E0E000F5DDDD00F2DADA00EFD7D700EBD4
      D400E9D2D200FFF2F200BCA9A900000000000000000000000000C8884D00F9F3
      EC00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C884480000000000000000000000000000000000DFB9A400C44C
      1F00F6E4D600FFE4A400FFD47200FFC96900FFC06300FFB65F00FFC18000F6D7
      C600C5491F00D7B09B00000000000000000000000000000000005EADEB0083C3
      F000D3F3FC00D1F3FC00B2EDFA005BBCED006CDAF40062D9F4005AD6F30051D4
      F300BAEEFB001A8AE500000000000000000000000000C1AEAE00FFFDFD00FFF3
      F300FFEFEF00FFECEC00FFE9E900FDE4E400FAE1E100F6DEDE00F3DBDB00F1D9
      D900EED6D600FFF3F300C1AEAE00000000000000000000000000C88C4F00F9F4
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C8864B000000000000000000000000000000000000000000DAB4
      9E00BC481C00F4E2D4004E7BA9004D7BA8004D7BA8004E7BA900F3D6C300BE46
      1C00D4AD9800000000000000000000000000000000000000000071B6EE009ED1
      F40078CAF00072C7F0006EC6F00060BEED0076DDF5006CDBF40064D9F4005BD6
      F300BEEFFB00238FE800000000000000000000000000C6B2B200FFFFFF00FFFE
      FE00FFFEFE00FFFDFD00FFFCFC00FFF6F600FFE7E700FDE4E400F9E0E000F5DD
      DD00F2DADA00FFF5F500C4B1B100000000000000000000000000C88C5000F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00FAF4EF00C8874C0000000000000000000000000000000000000000000000
      0000A0837500346DA7009CCCF800AFD4F700AFD4F700A5CFF6003474AE00997C
      710000000000000000000000000000000000000000000000000079B9F000DBF6
      FC009CE7F80095E5F8008FE3F70086E1F7007EDFF50076DDF5006DDBF40064D9
      F400C0F0FB002C94E900000000000000000000000000C9B5B500FFF7F700F0D8
      D800EAD3D300DEC8C800FFEBEB00FFFCFC00FFFCFC00FFFCFC00FFFCFC00FFFB
      FB00FFFBFB00FFFFFF00C9B5B500000000000000000000000000C88D5100F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F4F000C6864C0000000000000000000000000000000000000000000000
      00005B81AB00A6CAEE00ABCCEA00A7D0F600A8D0F600ABCCEA00A7CDEE005781
      AE000000000000000000000000000000000000000000000000008CC5F400DDF7
      FD00A2E8F8009DE7F80095E5F8008FE3F70087E1F7007FDFF60077DDF5006DDB
      F400C4F0FB003798EA00000000000000000000000000CAB6B600FFFBFB00F9E0
      E000F6DEDE00F1D9D900E6CFCF00E6CFCF00EED6D600EED6D600EBD4D400EAD3
      D300EAD3D300FFF7F700CCB8B800000000000000000000000000C88D5100F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F7F2EC00FBF7
      F300F5EFE900C380480000000000000000000000000000000000000000000000
      00002F69A200D9E8F70097C5F1008EBBE5007FA9D10089B5DF00CDDFEE002F70
      AC0000000000000000000000000000000000000000000000000093C8F500E1F7
      FD00AAEAF900A3E8F9009DE7F80096E5F80090E3F70088E1F70080DFF60077DD
      F500C8F1FB00409EEB00000000000000000000000000CEBABA00FFFDFD00FEE5
      E500F9E0E000FBE2E200FDE4E400FFFBFB00FFFDFD00FFFCFC00FFFCFC00FFFB
      FB00FFFBFB00FFFEFE00D6C1C100000000000000000000000000C88D5200F9F5
      F100F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FCE6CD00FAE5
      C900E2B68400D5A8840000000000000000000000000000000000000000000000
      00000C3E87007C97B8008AB7E400719CC80015406E001944720022456B00163F
      690000000000000000000000000000000000000000000000000097CCF600F9FD
      FF00F0FBFE00F0FBFE00F0FCFE00EEFBFD00EFFBFD00EFFBFD00F0FBFD00F0FB
      FD00F7FDFE004AA3ED00000000000000000000000000CEBABA00FFFEFE00FFFF
      FF00FFFEFE00FFFEFE00FFFFFF00FFF8F800E1CBCB00E2CCCC00E2CCCC00E2CC
      CC00E8D1D100EAD3D300FFE6E600000000000000000000000000CA925A00FAF6
      F200F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FFFBF800F6D8B400E1B0
      7D00DC9669000000000000000000000000000000000000000000000000000000
      00000F4B970012589F000F4A8A000F4B8700114B8700154C8500124175001C3E
      6500000000000000000000000000000000000000000000000000B2DCFD00FAFE
      FF00FAFEFF00FAFEFF00FAFEFF00FAFEFF00FAFDFE00FAFDFF00FAFEFF00FAFE
      FF00FAFDFF0053A8EE00000000000000000000000000DBC5C500DDC7C700DEC8
      C800DEC8C800DEC8C800DEC8C800DAC4C400FFF9F900FFFBFB00FFFBFB00FFFB
      FB00FFFBFB00FFFCFC00FFFEFE00000000000000000000000000D2A27400F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F2EC00F7F2EC00F2E6D700E2B27D00DC98
      6B00000000000000000000000000000000000000000000000000000000000000
      000090A0B800124F960012589B0012589900115393000F4A87000F3F72008895
      A400000000000000000000000000000000000000000000000000B6DFFE00A2D2
      FA009CD1F90097CDF80092CAF7008CC6F60085C2F5007EBFF40076BAF4006EB6
      F10065B2F0005DADF00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8CEB900D7AA
      7C00CA905500CA905500CA915500CB905500C98F5500CF9D6900DDB190000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C9CB6001C509200104B90000F488A001A4982008695AA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFB49300D59D7400D1966800CE926300C7875600C3845200C384
      5200C3845200C3845200C3845200D0A17D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00B0B0B000A4A4
      A400EFEFEF00000000000000000000000000000000000000000000000000F3F3
      F300A7A7A700ABABAB00F6F6F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7A17500F8F2ED00F7F0EA00F6EDE600F1E4DB00F0E2D800F0E2
      D800F0E2D800F0E2D800F0E2D800C58B5E0000000000DFB49300D59D7400D196
      6800CE926300CB8E5E00C98A5B00C7875600C3845200C3845200C3845200C384
      5200C3845200C3845200D0A17D000000000000000000F9F9F900B8B8B800DBDB
      DB00B8B8B700BDAC96009C81600084643B0084643B009C816000BDAB9500B7B7
      B600D9D9D900B5B5B500F5F5F500000000000000000000000000000000000000
      0000000000000000000000000000938EFF007C76FF00F0EDFF00000000000000
      000000000000000000000000000000000000000000000000000000000000E3BC
      9D00D9A78200E1AE8700FAF4F000EACBB200EACCB300E8C7AC00E8C7AC00E8C7
      AC00E8C8B000E8C8AE00F0E2D800C486540000000000D7A17500F8F2ED00F7F0
      EA00F6EDE600F4EAE200F3E7DE00F1E4DB00F0E2D800EAD6C800F2E5DC00FAF4
      F100F9F3F000FAF5F200C58B5E00000000000000000000000000F0F0F000D3D3
      D300C3C0BE009C6B3B00A66C3500AE6F3700AE6F3700A66C3500A1764A00C5C4
      C300C6C6C500F1F1F10000000000000000000000000000000000000000000000
      000000000000000000008F8BFF00A9A7FF00A7A5FF006B64FF00ECEAFF000000
      000000000000000000000000000000000000000000000000000000000000DBAA
      8300F9F3EF00E3B18C00FAF6F100EAC9AE00FFFFFF00E8C7AC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1E5DB00C686550000000000D9A47A00F9F3EE00EBD2
      BE00FFFFFF00EBD3BF00FFFFFF00EBD3C000FFFFFF00EAC7AD00ECD9CD00F1E4
      DB00F9F3F000F9F2EF00C68C5F00000000000000000000000000D1C1AE00A78D
      6F00AF784400BB8C5E00C2937100C4917400C38F7100BF906C00B88A5D00B486
      5900A58A6A00D1C1AE0000000000000000000000000000000000000000000000
      000000000000B1AFFF00B2B0FF00DDDDFF00BEBEFF00A7A5FF006C65FF00F2EF
      FF000000000000000000000000000000000000000000E6C3A800DDB19000E1AE
      8700F7ECE600E5B48F00FAF6F200E9C6AA00E9C6AC00E8C7AC00E8C7AC00E9C9
      B000E8C8B000E8CCB500F2E7DE00C88A590000000000DDA87E00F9F3EF00EBD0
      BA00EBD0BB0075B57A0075B57A0075B57A00EBD1BD00EACDB500FAF4F000EBD9
      CC00F1E4DB00FAF4F100C68A5C000000000000000000EAE1D700A7855B00B37D
      4600C2997100D8AA8900EFDFCF00FAF6F300FAF5F300EFDFD100D7A78500BE94
      6C00B37D4600A7855B00EAE1D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A2FF000000
      00000000000000000000000000000000000000000000DFB49100F9F5F100E6B7
      9500FAF5F000E7B79400FBF7F400E9C3A600FFFFFF00E8C7AC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F1EB00CB8F5F0000000000DFAA8200F9F3EF00EACE
      B700FFFFFF0075B57A0094D49B0074B57900FFFFFF00EACFBA00FBF6F200FAF3
      F000EBD8CB00F2E6DD00C88D5F000000000000000000D0BAA000B0804A00C69B
      6F00D9AA8800FFFEEB00FFFAEE00FFFDF200FFFEF200FFFCEF00FFFDEB00D9A3
      7A00C2996C00B0804A00D0BAA00000000000000000000000000000000000C5C5
      FF0000000000FCFCFF0000000000000000007A7AFF0000000000BFBFFF009996
      FF000000000000000000000000000000000000000000E7BE9F00FBF6F300E6B7
      9400F9F3ED00E9BA9800FBF7F400E9C3A600E9C3A600E9C3A600E9C3A600E9C3
      A600E9C3A600E9C3A600FBF7F400CE93640000000000E1AE8700FAF4F000EACB
      B200EACCB30075B57A0074B5790073B47800EACEB70070B375006FB274006EB1
      7200E8C8AE00EAD7C900C48654000000000000000000C19E7500BF8F5800CDA3
      8100F0DBC100FFF7E600FAF2E300C5C0B600F1EDDE00FFFCE800FFF5DF00EFD4
      AF00C8997200BF8F5800C19E7500000000000000000000000000CACCFF00B4B5
      FF00000000000000000000000000000000007F7FFF00000000007D7DFF00BBBB
      FF0000000000847FFF00000000000000000000000000E9C1A300FBF8F400E7B9
      9800FBF8F500EBBD9B00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBF7F400D1976A0000000000E3B18C00FAF6F100EAC9
      AE00FFFFFF00EAC9B000FFFFFF00E9CBB300FFFFFF006FB173008ED295006BAF
      6F00FFFFFF00F1E5DB00C68655000000000000000000BC8F5A00C99C6600CF9F
      8000FAF3E200FDF6E900F2F0E3008D8C8400817F7700D2CFC200FFFBEB00FAEC
      CC00C7906D00C99C6600BC8F5A000000000000000000C4C7FF00BBBEFF000000
      00000000000000000000F6F6FF00000000008080FF00000000007F7FFF000000
      0000000000009B99FF007E78FF00EFECFF0000000000EAC3A500FBF8F500E9BC
      9B00FAF3EE00ECBF9E00FBF7F4009CD5A50098D3A1008BCB930082C689007EC3
      84007AC1800076BE7C00FBF7F400D49B6F0000000000E5B48F00FAF6F200E9C6
      AA00E9C6AC00EAC7AC00E9C7AD00E9C9AE00E9C9B0006CB071006AAF6E0068AD
      6D00E8CCB500F2E7DE00C88A59000000000000000000C6986000CEA67100D1A5
      8900FAF6E900FDF8EE00FFFFF90081807900B1AEA400817F7700C9C6BA00FAF0
      D300C9967200CEA67100C698600000000000C5C8FF00D0D2FF00E8E8FF00E0E0
      FF000000000000000000E2E2FF000000000000000000000000009898FF009191
      FF0000000000BDBDFF00A6A4FF00827DFF0000000000ECC5A900FCF9F600EBBE
      9E00FBF8F500EFC6A800FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
      F400FBF7F400FBF7F400FBF7F400D8A3780000000000E7B79400FBF7F400E9C3
      A600FFFFFF00E8C4A900FFFFFF00E9C6AA00FFFFFF00E8C7AC00FFFFFF00E8C8
      B000FFFFFF00F7F1EB00CB8F5F000000000000000000D9B28400D3AC7500D9B7
      9800F1E3D600FEFBF500F5F5F3009F9E9500F0F0E900F8F8F200BEB9AD00F0DA
      C200D2AA8700D3AC7500D9B284000000000000000000AFB3FF00EDEEFF00FBFB
      FF00000000000000000000000000F4F5FF00DADAFF00D7D7FF00D5D5FF00CFCE
      FF00C5C5FF00B4B3FF00807BFF00F8F6FF0000000000EDC8AD00FCF9F600ECC0
      A100FAF3EE00CACCA500E6C3A200EDC09F00EBBE9D00E7B79300E4B28C00E2AF
      8800E0AC8400DDA98000DCA57D00E2B6960000000000E9BA9800FBF7F40065A4
      FF0064A3FF0062A2FF0061A1FF005F9FFF005C9DFF005A9AFF005798FF005495
      FF005294FF00FBF7F400CE9364000000000000000000D6CAB300D3AD7700DFC4
      9A00DEBDAA00FFFFFF00F0F0EE00E7E5DA00FFFFF700FFFFF700FFFEF300DCB4
      9800DBC09600C2AA7E00E1CDB100000000000000000000000000B3B7FF000000
      0000B1B5FF00AFB2FF00000000000000000000000000A1A2FF00000000009897
      FF009392FF00918EFF00F2F1FF000000000000000000EFCAAF00FCF9F600F1CC
      B100FBF8F500FBF8F500FBF8F500FBF8F500FBF8F500FBF8F500FBF7F400F8EF
      E900FBF8F500DCAC8500000000000000000000000000EBBD9B00FBF7F40064A4
      FF0079BDFF0075BBFF0071B9FF006DB8FF0068B3FF0061B0FF005AABFF0054A7
      FF003B7DFF00FBF7F400D1976A0000000000C2E7F7002FA9DE0036A0C700DEBF
      8A00E2C9A700DFBFAE00F1E3DC00F3F1EC00F4F1EB00F1E2D900DCBAA300DFC3
      9E008CB1A9003DA8D2003CADDE00D8EFFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0CCB100FCF9F600CCD1
      AE00E2C6A600E6C2A000E4C09D00E0B99400DDB48D00DBB28900E3B48F00DDAA
      8200DFAE8A00E5BDA000000000000000000000000000ECBF9E00FBF7F40065A4
      FF0064A3FF0060A0FF005D9EFF005899FF005496FF004D90FF00478BFF004284
      FF003D7FFF00FBF7F400D49B6F000000000082D0F10085D4F3006BC7E9003DA5
      C700E2C79200E6D1A900E0C2A600D5AE9600D5AB9200DEBDA000E4CFA600BFC1
      9E0048B3D700ACE3F60049BCEB00D8F0FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2D1BA00FCF9F600FCF9
      F600FCF9F600FCF9F600FCF9F600FCF9F600FCF9F600FCF9F600FCF9F600E0B5
      93000000000000000000000000000000000000000000EFC6A800FBF7F400FBF7
      F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
      F400FBF7F400FBF7F400D8A378000000000084D5F4006ECFF200B5E8F9006BCB
      EC0043AECE00ECC48800E9CB9400E7D09D00E7D09D00E9CB9400DEC28E003AAD
      D20086D5F1007FD4F40032B8ED00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9E7DB00F4D3BD00F1CD
      B200EFCBB100ECC5A900E9C1A300E8BFA000E6BD9D00E4BA9900E3B79700E7C5
      AB000000000000000000000000000000000000000000F7E1D200F1C8AC00EDC0
      9F00EBBE9D00EBBC9A00E9BA9600E7B79300E6B59000E4B28C00E2AF8800E0AC
      8400DDA98000DCA57D00E2B69600000000000000000075D3F6006CD1F500BFEC
      FA006ACFF20076C4D500FBCD9600FAC17E00FAC17E00FBCD96007BC4D50074D3
      F30085D9F70036BFF200E2F6FD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007FDAF9002EC2
      F60035C4F6000000000000000000000000000000000000000000000000002EC2
      F60036C5F600D8F4FD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDF2
      FB0055BEEA0044B5E700DDF1FA000000000000000000AAD6EE0044A0D70088C0
      E300EEF6FB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFB49300D59D7400D196
      6800CE926300CB8E5E00C98A5B00C7875600C3845200C3845200C3845200C384
      5200C3845200C3845200D0A17D0000000000C6A18C00C38E6800C08B6600BE88
      6400BB856100B9835F00B47E5C00B27C5A00B17B5800AE795700AE795700AD76
      5600AB755400A9735300A9715100C6A18C000000000000000000AAE1F70011A8
      E70051C6F20044BEEF0088D0F000000000000000000033A1DA0060C6F2003CAA
      E2001183C800AAD1EA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7A17500F8F2ED00F7F0
      EA00F6EDE600F4EAE200F3E7DE00F1E4DB00F0E2D800F0E2D800F0E2D800F0E2
      D800F0E2D800F0E2D800C58B5E0000000000C8926C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A97251000000000000000000AAE2F80033BB
      EF0082E0FE0077DAFC0011A4E300EEF8FD00BBE3F60024A6E2006AD7FF0067D0
      F9001992D400CCE5F300000000000000000000000000A2CAEE0076B2E6003E91
      DB00348CD900348CD900348CD900348CD900348CD900348CD900348CD900348C
      D900348BD900398FDA0085B9E9000000000000000000D9A47A00F9F3EE00EBD2
      BE0000000000EBD3BF00000000000000000000000000EAC7AD00000000000000
      000000000000F0E2D800C68C5F0000000000C8926C00FFFFFF00FFBF6800FFFF
      FF00C7C7C700C6C6C600C3C3C300C1C1C100BFBFBF00BDBDBD00BDBDBD00BBBB
      BB00B9B9B900B9B9B900FFFFFF00A972510000000000000000000000000077D1
      F4003EC1F10085E2FF003ABBEE0099D8F30066C3EC004DC2F1006CD8FF0036AE
      E50088C7E800000000000000000000000000000000004799DD00DEF1FA00A8DD
      F4009EDBF40096DAF3008ED8F30086D7F3007FD4F20079D3F20072D2F1006CD0
      F10069CFF100C2EAF8003F95DB000000000000000000DDA87E00F9F3EF00EBD0
      BA00EBD0BB00EBD0BB00EBD0BB00EBD0BB00EBD1BD00EACDB500EACDB500EACD
      B500EACDB500F0E2D800C68A5C0000000000CA946E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AA7353000000000000000000000000000000
      000044C0F00048C5F30072D8FA0022AEE80052C6F30073DBFF0041BBED0066BE
      E80000000000000000000000000000000000000000003B97DB00EFFAFE00A1E9
      F90091E5F80081E1F70072DEF60063DAF50054D7F40047D3F30039D0F2002ECD
      F10026CBF000CAF2FB003B97DB000000000000000000DFAA8200F9F3EF00EACE
      B70000000000EBD0BB00000000000000000000000000EACFBA00FBF6F2000000
      000000000000F0E2D800C88D5F0000000000CC976F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFB95E00FFFFFF00C1C1C100BEBEBE00BABABA00B7B7
      B700FFFFFF00FFFFFF00FFFFFF00AC7554000000000000000000000000000000
      0000EEF9FE0011AFEB007DDEFD0063D5FC0067DAFF005ED0F90033B0E600EEF8
      FD0000000000000000000000000000000000000000003C9DDB00F2FAFD00B3ED
      FA00A4E9F90095E6F80085E2F70076DEF60065DBF50057D7F40049D4F3003BD1
      F20030CEF100CCF2FB003B9BDB000000000000000000E1AE8700FAF4F000EACB
      B200EACCB300EACCB300EACCB300EACCB300EACEB700E8C7AC00E8C7AC00E8C8
      B000E8C8AE00F0E2D800C486540000000000D19C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B07A580044CAF80000B5F40000B3F20033C1
      F30044C4F30044C2F2005DD2FA0061D9FF005BD7FF005CD0FA0033B2E80044B7
      E80022A7E2000095DB00008FD60044A8DD00000000003BA3DB00F6FCFE00C8F2
      FC00B9EFFB00ACECFA009CE8F9008BE3F7007CE0F6006CDCF6005DD9F5004FD6
      F40044D3F300D0F3FC003BA2DB000000000000000000E3B18C00FAF6F100EAC9
      AE0000000000EAC9B000000000000000000000000000E8C7AC00000000000000
      000000000000F1E5DB00C686550000000000D49E7500FFFFFF00FFFFFF00FFFF
      FF00FFB95E00FFFFFF00C1C1C100BEBEBE00BABABA00B7B7B700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B27C5A0044CCFA007ADFFD00A4ECFF0081E0
      FD0075DBFB0072DAFB0079E0FF0061DAFF005CD8FF006BDBFF006FD5FA0065D0
      F80075D7FB0085DEFF005FCBF50044AEE100000000003BA8DB00FEFFFF00F8FD
      FF00F6FDFF00F5FCFF00F3FCFE00D8F6FC0094E6F80085E3F70076DFF60068DB
      F5005CD8F400D7F4FC003BA7DB000000000000000000E5B48F00FAF6F200E9C6
      AA00E9C6AC00EAC7AC00E9C7AD00E9C9AE00E9C9B000E8C7AC00E9C9B000E8C8
      B000E8CCB500F2E7DE00C88A590000000000D5A07600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FCFCFC00FFFFFF00B57E5C0044CEFB0022C4F90000B8F60011BB
      F60044C8F60033C1F40067D9FC0064DBFF0060D9FF005FD3FB0033B7EC0044BC
      EC0022ADE700009DE1001AA8E50044B3E5000000000039ADDB00E8F6FB0094D4
      EF0088CEEE0073C1E900C9E9F600F2FCFE00F3FCFE00F2FCFE00F0FCFE00EFFB
      FE00EEFBFE00FEFFFF003CAEDB000000000000000000E7B79400FBF7F400E9C3
      A60000000000E8C4A900000000000000000000000000E8C7AC00000000000000
      000000000000F7F1EB00CB8F5F0000000000D8A27900FFFFFF00FFFFFF00FFFF
      FF00FFB95E00FFFFFF00C1C1C100BEBEBE00BABABA00B7B7B700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B7815E00CCF2FE00CCF2FE00000000000000
      0000EEFAFE0011B9F40083E2FE0070DEFE0071DDFF0066D5FB0033B9EE00EEF9
      FD000000000000000000CCECF900CCEBF9000000000040AEDC00F1FAFD0094DE
      F50093DCF40081D5F2006ACAED006CCBEA0085D3EF0080D2EF007AD0EF0076CF
      EE0072CFEE00E9F7FB003EB2DC000000000000000000E9BA9800FBF7F400E9C3
      A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3
      A600E9C3A600FBF7F400CE93640000000000D9A37900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FDFDFD00FDFDFD00FFFFFF00BA8560000000000000000000000000000000
      000044CCF9004DD0FA0089E5FE0011B7F30058D0F90081E1FF0046C7F50066CB
      F200000000000000000000000000000000000000000041B4DC00F7FCFE008EE4
      F80091DEF5009FE0F500ACE1F600EFFBFE00F4FDFE00F3FCFE00F1FCFE00EFFB
      FE00EEFBFE00FAFDFF0058BCE0000000000000000000EBBD9B00FBF7F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBF7F400D1976A0000000000DBA47A00FFFFFF00FFBF6800FFFF
      FF00C7C7C700C6C6C600C3C3C300C1C1C100BFBFBF00BDBDBD00BDBDBD00BBBB
      BB00B9B9B900B9B9B900FFFFFF00BD87630000000000000000000000000088E0
      FD0044D0FB0091E8FF0057D3FA0066D3F80066D1F70056D0F9007EE0FF003AC2
      F40099DDF700000000000000000000000000000000003CB5DB00FDFEFE00FEFF
      FF00FEFEFF00FDFEFF00FEFFFF00EAF7FB006EC8E5006FC9E4006FC9E4006FC9
      E4007DCFE70084D0E800BAE5F2000000000000000000ECBF9E00FBF7F4009CD5
      A50098D3A10094D09D0090CE98008BCB930087C98E0082C689007EC384007AC1
      800076BE7C00FBF7F400D49B6F0000000000DCA77B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C08B66000000000000000000BBEEFE002DCC
      FC0087E5FE0091E9FF0015C0F800DDF5FE00BBEBFC0029C1F50080E1FF0072D9
      FC0011B2EE00CCEEFB0000000000000000000000000059C2E00061C3E20063C4
      E30063C4E30063C4E30062C4E30056C0E000EDF8FC00F3FAFD00F3FAFD00F3FA
      FD00F3FAFD00F3FBFD00FCFEFE000000000000000000EFC6A800FBF7F400FBF7
      F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
      F400FBF7F400FBF7F400D8A3780000000000DDAD8600E8B99200E8B99200E8B9
      9200E8B99200E8B99200E8B99200E8B99200E8B99200E8B99200E8B99200E8B9
      9200E8B99200E8B99200E8B99200C1917000000000000000000099E7FF0022C9
      FD0067DCFE0079E0FE0044CDFB00000000000000000033C5F6007ADDFD0051CE
      F90011B4F000AAE3F90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7E1D200F1C8AC00EDC0
      9F00EBBE9D00EBBC9A00E9BA9600E7B79300E6B59000E4B28C00E2AF8800E0AC
      8400DDA98000DCA57D00E2B6960000000000DBC3B600DEB49200DCA77B00DCA6
      7A00DAA47A00D8A27900D5A07600D49E7500D29D7300CF9A7200CF9A7200CE99
      7000CB966F00C9946C00C79E8000DBC3B600000000000000000000000000CCF3
      FF0044D2FE0000BFFC00AAE9FE00000000000000000099E3FB0000B6F50044C8
      F600DDF5FD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFC003F00FFFFFFFFF
      C0038001C0038001C0038001C0038001C0038001C0038001C0038001C0038001
      C003C003C0038001C003E007C0038001C003F00FC0038001C003F00FC0038001
      C003F00FC0038001C003F00FC0038001C007F00FC0038001C00FF00FC003FFFF
      C01FF81FFFFFFFFFFFFFFFFFFFFFFFFFF800FFFF87E1FFFFF80080018001FE3F
      E0008001C003FC1FE0008001C003F80F800080018001E203800080018001E207
      800080018001C603800080018001840080008001800104008000800180018E00
      800080018001C001800380010000ED5F800380010000ED47800F80010001ED57
      800F80018001C447FFFFFFFFC7E3FFFFFFFFFFFFE187FFFF80010000C183FFFF
      80010000C00380018BB90000E007800180010000F00F80018B990000F00F8001
      80010000000080018BB900000000800180010000000080018BB90000300C8001
      80010000F00F80019FF90000E007800180010000C003800180010000C183FFFF
      80010000E187FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
