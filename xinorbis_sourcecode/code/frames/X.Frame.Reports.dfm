object FrameReports: TFrameReports
  Left = 0
  Top = 0
  Width = 1312
  Height = 848
  Align = alClient
  DoubleBuffered = True
  ParentDoubleBuffered = False
  TabOrder = 0
  OnResize = pMainReportsResize
  ExplicitWidth = 451
  ExplicitHeight = 304
  object pMainReports: TAdvSmoothTabPager
    Left = 0
    Top = 0
    Width = 1312
    Height = 848
    Margins.Right = 1
    Fill.Color = 3355443
    Fill.ColorTo = 3355443
    Fill.ColorMirror = clNone
    Fill.ColorMirrorTo = clNone
    Fill.GradientType = gtSolid
    Fill.GradientMirrorType = gtSolid
    Fill.BorderColor = clWhite
    Fill.BorderWidth = 0
    Fill.Rounding = 0
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Transparent = False
    Align = alClient
    ActivePage = tsTemp
    TabPosition = tpTopLeft
    TabTextOrientation = toHorizontal
    TabSettings.StartMargin = 4
    TabReorder = False
    OnChange = pMainReportsChange
    OnResize = pMainReportsResize
    TabOrder = 0
    ExplicitWidth = 451
    ExplicitHeight = 304
    object tsTable: TAdvSmoothTabPage
      AlignWithMargins = True
      Left = 1
      Top = 26
      Width = 1310
      Height = 820
      Caption = ''
      ImageIndex = 0
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Alignment = taLeftJustify
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 0
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = clWhite
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object splitTable: TAdvSplitter
        Left = 316
        Top = 26
        Height = 792
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
        Width = 1306
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
            18000000000000030000C21E0000C21E00000000000000000000FF00FF5199FF
            2981FF217DFF63A3FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4995FFA0C7FF
            83B7FF7FB4FF97C2FF5399FF67A4FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
            A7FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1CAFF79B3FF
            A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
            C5FF599EFF70ABFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7CDFF7EB7FFA9CEFFA8CDFF70
            ACFF5F9AEE8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
            87979797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9CFFF84B6F794
            9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF939393D4D4D4C8C8C8BCBCBCBABA
            BAC2C2C2C4C4C4999999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A9A9AE4E4E4CFCFCFACACACFF00
            FF8E8E8E8C8C8C8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFABABABE2E2E2E7E7E7B9B9B9939393FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FE4E4E4EEEEEE9696
            96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFACACAC9D9D9D9B9B9BFF00FFFF00FFFF00FF}
          OnClick = sbMainConfigClick
        end
        object rbGraphSize: TAdvOfficeRadioButton
          Left = 90
          Top = 3
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
          OnClick = rbGraphSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
        object rbGraphQuantity: TAdvOfficeRadioButton
          Left = 195
          Top = 3
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
          OnClick = rbGraphSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
      end
      object sgMainReport: TAdvStringGrid
        Left = 2
        Top = 26
        Width = 314
        Height = 792
        Cursor = crDefault
        Hint = 'double click to see all files belonging to the category'
        Align = alLeft
        Color = 3355443
        ColCount = 11
        DefaultRowHeight = 17
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        OnGetCellColor = sgMainReportGetCellColor
        OnGetAlignment = sgMainReportGetAlignment
        OnCanSort = sgMainReportCanSort
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientFrom = 16250871
        ControlLook.FixedGradientTo = 14606046
        ControlLook.FixedGradientHoverFrom = 15000287
        ControlLook.FixedGradientHoverTo = 14406605
        ControlLook.FixedGradientHoverMirrorFrom = 14406605
        ControlLook.FixedGradientHoverMirrorTo = 13813180
        ControlLook.FixedGradientHoverBorder = 12033927
        ControlLook.FixedGradientDownFrom = 14991773
        ControlLook.FixedGradientDownTo = 14991773
        ControlLook.FixedGradientDownMirrorFrom = 14991773
        ControlLook.FixedGradientDownMirrorTo = 14991773
        ControlLook.FixedGradientDownBorder = 14991773
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
        Look = glCustom
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
        SearchFooter.Color = 16250871
        SearchFooter.ColorTo = clNone
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
        SelectionColor = 6210033
        ShowSelection = False
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        Version = '8.4.2.5'
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
        Width = 989
        Height = 792
        AllowPanning = pmNone
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = 15719898
        LeftWall.Color = clGray
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginLeft = 4
        MarginRight = 4
        MarginUnits = muPixels
        Title.Font.Style = [fsItalic]
        Title.Text.Strings = (
          '.....')
        ClipPoints = False
        Frame.Visible = False
        LeftAxis.Inverted = True
        Shadow.Color = 8553215
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        Zoom.Allow = False
        Align = alClient
        BevelOuter = bvLowered
        Color = 4227327
        PopupMenu = puCharts
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
          Gradient.EndColor = 7028779
          Gradient.StartColor = 7028779
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
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Alignment = taLeftJustify
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 1
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 13542013
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object splitterTree: TAdvSplitter
        Left = 435
        Top = 26
        Height = 792
        OnCanResize = splitterTreeCanResize
        OnMoved = splitterTreeMoved
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
        Width = 1306
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
            18000000000000030000C21E0000C21E00000000000000000000FF00FF5199FF
            2981FF217DFF63A3FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4995FFA0C7FF
            83B7FF7FB4FF97C2FF5399FF67A4FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
            A7FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1CAFF79B3FF
            A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
            C5FF599EFF70ABFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7CDFF7EB7FFA9CEFFA8CDFF70
            ACFF5F9AEE8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
            87979797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9CFFF84B6F794
            9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF939393D4D4D4C8C8C8BCBCBCBABA
            BAC2C2C2C4C4C4999999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A9A9AE4E4E4CFCFCFACACACFF00
            FF8E8E8E8C8C8C8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFABABABE2E2E2E7E7E7B9B9B9939393FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FE4E4E4EEEEEE9696
            96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFACACAC9D9D9D9B9B9BFF00FFFF00FFFF00FF}
          OnClick = sbMainConfigClick
        end
        object cbTreeSize: TAdvOfficeRadioButton
          Left = 90
          Top = 3
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
          OnClick = cbTreeSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
        object cbTreeQuantity: TAdvOfficeRadioButton
          Left = 195
          Top = 3
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
          OnClick = cbTreeSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
      end
      object vtcTree: TChart
        Tag = 2
        Left = 438
        Top = 26
        Width = 870
        Height = 792
        AllowPanning = pmNone
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = 15719898
        Gradient.Visible = True
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginLeft = 4
        MarginRight = 4
        MarginUnits = muPixels
        Title.Text.Strings = (
          '.....')
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
        Height = 792
        Align = alLeft
        BevelOuter = bvNone
        Color = 3355443
        ParentBackground = False
        TabOrder = 2
        ExplicitHeight = 248
        object sgFileTypes: TAdvStringGrid
          Left = 0
          Top = 540
          Width = 433
          Height = 252
          Cursor = crDefault
          Hint = 'double click any attribute to see all files with that attribute'
          Align = alBottom
          ColCount = 8
          DefaultRowHeight = 17
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 15
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
          GridLineColor = 15062992
          HoverRowCells = [hcNormal, hcSelected]
          OnGetCellColor = sgMainReportGetCellColor
          OnGetAlignment = sgExtensionGetAlignment
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 10344697
          ActiveCellColorTo = 6210033
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientFrom = 16250871
          ControlLook.FixedGradientTo = 14606046
          ControlLook.FixedGradientHoverFrom = 15000287
          ControlLook.FixedGradientHoverTo = 14406605
          ControlLook.FixedGradientHoverMirrorFrom = 14406605
          ControlLook.FixedGradientHoverMirrorTo = 13813180
          ControlLook.FixedGradientHoverBorder = 12033927
          ControlLook.FixedGradientDownFrom = 14991773
          ControlLook.FixedGradientDownTo = 14991773
          ControlLook.FixedGradientDownMirrorFrom = 14991773
          ControlLook.FixedGradientDownMirrorTo = 14991773
          ControlLook.FixedGradientDownBorder = 14991773
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
          Look = glCustom
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
          SearchFooter.Color = 16250871
          SearchFooter.ColorTo = clNone
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
          SelectionColor = 6210033
          ShowSelection = False
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          Version = '8.4.2.5'
          ExplicitTop = 552
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
            17
            17
            17
            17
            17
            17
            17)
        end
        object tvFileTypes: THTMLTreeview
          Left = 0
          Top = 0
          Width = 433
          Height = 540
          Hint = 'double click any extension to see a list of files'
          ItemHeight = 16
          SelectionNFColor = clSilver
          SelectionNFFontColor = clBlack
          HintColor = clWhite
          Align = alClient
          Color = 1644825
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Indent = 19
          ParentFont = False
          PopupMenu = puType
          TabOrder = 1
          OnClick = tvFileTypesClick
          OnDblClick = tvFileTypesDblClick
          Version = '1.4.1.5'
          ExplicitHeight = 567
        end
      end
    end
    object tsExtensions: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 2
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 13542013
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object Panel38: TPanel
        Left = 2
        Top = 2
        Width = 1306
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Color = 3355443
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 445
        object cbExtensionsAll: TAdvOfficeCheckBox
          Left = 4
          Top = 2
          Width = 110
          Height = 20
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = cbExtensionsAllClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          State = cbChecked
          Version = '1.5.0.9'
        end
        object cbExtensionsOther: TAdvOfficeCheckBox
          Left = 131
          Top = 2
          Width = 127
          Height = 20
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = cbExtensionsAllClick
          Alignment = taLeftJustify
          Caption = ''
          ReturnIsTab = False
          State = cbChecked
          Version = '1.5.0.9'
        end
        object cbExtensionsCustom: TAdvOfficeCheckBox
          Left = 264
          Top = 2
          Width = 113
          Height = 20
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = cbExtensionsAllClick
          Alignment = taLeftJustify
          Caption = ''
          ReturnIsTab = False
          State = cbChecked
          Version = '1.5.0.9'
        end
        object cbExtensionColourCode: TAdvOfficeCheckBox
          Left = 383
          Top = 2
          Width = 149
          Height = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = cbExtensionColourCodeClick
          Alignment = taLeftJustify
          Caption = ''
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
      end
      object sgExtension: TAdvStringGrid
        Tag = 8
        Left = 2
        Top = 26
        Width = 1306
        Height = 764
        Cursor = crDefault
        Hint = 'double click any extension to see all files with that extension'
        Align = alClient
        ColCount = 13
        DefaultRowHeight = 17
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        PopupMenu = puExtensionsMain
        ScrollBars = ssBoth
        TabOrder = 1
        StyleElements = [seClient, seBorder]
        OnDrawCell = sgExtensionDrawCell
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        OnGetCellColor = sgMainReportGetCellColor
        OnGetAlignment = sgExtensionGetAlignment
        OnCanSort = sgExtensionCanSort
        OnClickCell = sgExtensionClickCell
        OnDblClickCell = sgExtensionDblClickCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientFrom = 16250871
        ControlLook.FixedGradientTo = 14606046
        ControlLook.FixedGradientHoverFrom = 15000287
        ControlLook.FixedGradientHoverTo = 14406605
        ControlLook.FixedGradientHoverMirrorFrom = 14406605
        ControlLook.FixedGradientHoverMirrorTo = 13813180
        ControlLook.FixedGradientHoverBorder = 12033927
        ControlLook.FixedGradientDownFrom = 14991773
        ControlLook.FixedGradientDownTo = 14991773
        ControlLook.FixedGradientDownMirrorFrom = 14991773
        ControlLook.FixedGradientDownMirrorTo = 14991773
        ControlLook.FixedGradientDownBorder = 14991773
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
        Look = glCustom
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
        SearchFooter.Color = 16250871
        SearchFooter.ColorTo = clNone
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
        SelectionColor = 6210033
        ShowSelection = False
        SortSettings.AutoSortForGrouping = False
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        Version = '8.4.2.5'
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
        Top = 790
        Width = 1306
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 246
        ExplicitWidth = 445
        DesignSize = (
          1306
          28)
        object cbOtherSuggestions: TComboBox
          Left = 0
          Top = 3
          Width = 65535
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
    end
    object tsFolderList: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 3
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 13542013
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object splitDirList: TAdvSplitter
        Left = 322
        Top = 26
        Height = 792
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
        Width = 1306
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
          Width = 145
          Height = 22
          Flat = True
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C21E0000C21E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FF569C5E3F8F493C8D454C9553FF00FFFF00FFFF00FFFF00
            FFFF00FF0000FF00FFFF00FFFF00FF57A0644199507DC28F96D0A696CFA678BE
            89368D42418D48FF00FFFF00FFFF00FF0000FF00FFFF00FF55A06464B478A8DB
            B587CC9866BC7D64BA7C86CB98A5D9B458AA6B35863DFF00FFFF00FF0073FF00
            FF67AC766AB97DA8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B35A
            AA6C428F49FF00FFA927FF00FF53AB68AADDB464C1795FBE7160BC77FFFFFFFF
            FFFF59B87058B56E5CB774A6DAB4388F43FF00FF006977B8888ACC9889D3966B
            C67A63C17055AB65FFFFFFFFFFFF59B87059B8705BB97285CC977BBE8D4D9655
            49226AB27FA9DDB37DCF8A75CC81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            59B87067BE7D9CD4AB3B8C44006F6EB583B6E2BE8BD5977AC986FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF59B87069C17E9DD4AA3F8F49000082BF95ACDDB6
            A6DFAF81CB8C7CC9866EBD79FFFFFFFFFFFF5BAC6A60BC775CBA738BD19980C5
            92589E610018FF00FF85C797D2EED795D9A08AD3947FC889FFFFFFFFFFFF79CD
            856BC37C6FC77EACDFB5459E57FF00FF0000FF00FF7FBF93AADAB7D8F1DC92D8
            9D88CD9384CC8E8BD4968AD49583D28EAFE0B76BB97D5BA367FF00FF437EFF00
            FFFF00FF76BB8CAFDCBBDCF2E0B6E4BD9BDBA596D9A0A5DFAFC0E8C579C28A58
            A266FF00FFFF00FF0065FF00FFFF00FFFF00FF7FBF9394CEA4C3E6CBCFEBD4C9
            E9CEAFDDB86DB97F68AE78FF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF
            00FFFF00FF82C09571B7866EB58279B98AFF00FFFF00FFFF00FFFF00FFFF00FF
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
            18000000000000030000C21E0000C21E00000000000000000000FF00FF5199FF
            2981FF217DFF63A3FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4995FFA0C7FF
            83B7FF7FB4FF97C2FF5399FF67A4FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
            A7FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1CAFF79B3FF
            A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
            C5FF599EFF70ABFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7CDFF7EB7FFA9CEFFA8CDFF70
            ACFF5F9AEE8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
            87979797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9CFFF84B6F794
            9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF939393D4D4D4C8C8C8BCBCBCBABA
            BAC2C2C2C4C4C4999999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A9A9AE4E4E4CFCFCFACACACFF00
            FF8E8E8E8C8C8C8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFABABABE2E2E2E7E7E7B9B9B9939393FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FE4E4E4EEEEEE9696
            96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFACACAC9D9D9D9B9B9BFF00FFFF00FFFF00FF}
          OnClick = sbFolderConfigClick
        end
        object cbGraphSizeDirList: TAdvOfficeRadioButton
          Left = 90
          Top = 3
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
          OnClick = cbGraphSizeDirListClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
        object cbGraphQuantityDirList: TAdvOfficeRadioButton
          Left = 195
          Top = 3
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
          OnClick = cbGraphQuantityDirListClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
      end
      object sgDirList: TAdvStringGrid
        Tag = 1
        Left = 2
        Top = 26
        Width = 320
        Height = 792
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
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        OnGetCellColor = sgMainReportGetCellColor
        OnGetAlignment = sgMainReportGetAlignment
        OnCanSort = sgDirListCanSort
        OnDblClickCell = sgDirListDblClickCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientFrom = 16250871
        ControlLook.FixedGradientTo = 14606046
        ControlLook.FixedGradientHoverFrom = 15000287
        ControlLook.FixedGradientHoverTo = 14406605
        ControlLook.FixedGradientHoverMirrorFrom = 14406605
        ControlLook.FixedGradientHoverMirrorTo = 13813180
        ControlLook.FixedGradientHoverBorder = 12033927
        ControlLook.FixedGradientDownFrom = 14991773
        ControlLook.FixedGradientDownTo = 14991773
        ControlLook.FixedGradientDownMirrorFrom = 14991773
        ControlLook.FixedGradientDownMirrorTo = 14991773
        ControlLook.FixedGradientDownBorder = 14991773
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
        Look = glCustom
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
        SearchFooter.Color = 16250871
        SearchFooter.ColorTo = clNone
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
        SelectionColor = 6210033
        ShowSelection = False
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        Version = '8.4.2.5'
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
        Width = 983
        Height = 792
        BackWall.Shadow.Color = 8618883
        Foot.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.Visible = True
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginLeft = 4
        MarginRight = 4
        MarginUnits = muPixels
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
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 4
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 13542013
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object splitMagnitude: TAdvSplitter
        Left = 322
        Top = 26
        Height = 792
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
        Width = 1306
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
          Left = 224
          Top = 2
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
          OnClick = cbGraphSizeMagnitudeClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
        object cbGraphQtyMagnitude: TAdvOfficeRadioButton
          Left = 327
          Top = 2
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
          OnClick = cbGraphSizeMagnitudeClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
        object cbMagnitudeScope: TComboBox
          Left = 56
          Top = 2
          Width = 153
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnChange = cbMagnitudeScopeChange
        end
      end
      object sgMagnitude: TAdvStringGrid
        Left = 2
        Top = 26
        Width = 320
        Height = 792
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
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        OnGetCellColor = sgMainReportGetCellColor
        OnGetAlignment = sgMainReportGetAlignment
        OnCanSort = sgMagnitudeCanSort
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientFrom = 16250871
        ControlLook.FixedGradientTo = 14606046
        ControlLook.FixedGradientHoverFrom = 15000287
        ControlLook.FixedGradientHoverTo = 14406605
        ControlLook.FixedGradientHoverMirrorFrom = 14406605
        ControlLook.FixedGradientHoverMirrorTo = 13813180
        ControlLook.FixedGradientHoverBorder = 12033927
        ControlLook.FixedGradientDownFrom = 14991773
        ControlLook.FixedGradientDownTo = 14991773
        ControlLook.FixedGradientDownMirrorFrom = 14991773
        ControlLook.FixedGradientDownMirrorTo = 14991773
        ControlLook.FixedGradientDownBorder = 14991773
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
        Look = glCustom
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
        SearchFooter.Color = 16250871
        SearchFooter.ColorTo = clNone
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
        SelectionColor = 6210033
        ShowSelection = False
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        Version = '8.4.2.5'
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
        Width = 983
        Height = 792
        Foot.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.Visible = True
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginLeft = 4
        MarginRight = 4
        MarginUnits = muPixels
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
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 5
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 13542013
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object splitterFileDetails: TAdvSplitter
        Left = 341
        Top = 26
        Height = 792
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
        Width = 1306
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Color = 3355443
        FullRepaint = False
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 445
        object sbCollapseNodes: TSpeedButton
          Tag = 1
          Left = 294
          Top = 2
          Width = 123
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
        object rbDatesSize: TAdvOfficeRadioButton
          Left = 421
          Top = 2
          Width = 100
          Height = 20
          Hint = 'graph by size of files'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = True
          OnClick = cbFileDatesChange
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
        object rbDatesQuantity: TAdvOfficeRadioButton
          Left = 542
          Top = 2
          Width = 100
          Height = 20
          Hint = 'graph by number of files'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = cbFileDatesChange
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
      end
      object Panel1: TPanel
        Left = 344
        Top = 26
        Width = 964
        Height = 792
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 103
        ExplicitHeight = 248
        object capacityBarDates: TAdvSmoothCapacityBar
          Left = 0
          Top = 709
          Width = 964
          Height = 83
          AntiAlias = aaAntiAlias
          Align = alBottom
          Appearance.ShowFree = False
          Appearance.AutoFormatValues = False
          Appearance.BackGroundFill.Color = 53687091
          Appearance.BackGroundFill.ColorTo = clWhite
          Appearance.BackGroundFill.ColorMirror = clNone
          Appearance.BackGroundFill.ColorMirrorTo = clNone
          Appearance.BackGroundFill.GradientType = gtSolid
          Appearance.BackGroundFill.GradientMirrorType = gtSolid
          Appearance.BackGroundFill.BorderColor = 53687091
          Appearance.BackGroundFill.Rounding = 0
          Appearance.BackGroundFill.ShadowOffset = 0
          Appearance.BackGroundFill.Glow = gmNone
          Appearance.Color = 15592683
          Appearance.ColorTo = 14605788
          Appearance.CapacityFont.Charset = DEFAULT_CHARSET
          Appearance.CapacityFont.Color = clWhite
          Appearance.CapacityFont.Height = -12
          Appearance.CapacityFont.Name = 'Tahoma'
          Appearance.CapacityFont.Style = []
          Appearance.CapacityFormat = '%.0f %%'
          Appearance.FreeFormat = '%.0f MB'
          Appearance.LegendFormat = '%.01f'
          Appearance.LegendFont.Charset = DEFAULT_CHARSET
          Appearance.LegendFont.Color = clWhite
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
        object vtcFileDates: TChart
          Left = 0
          Top = 0
          Width = 964
          Height = 709
          Foot.Visible = False
          Gradient.Direction = gdBottomTop
          Gradient.Visible = True
          Legend.Alignment = laLeft
          Legend.TextStyle = ltsPlain
          MarginLeft = 4
          MarginRight = 4
          MarginUnits = muPixels
          Title.Text.Strings = (
            '.....')
          BottomAxis.LabelsFormat.Frame.Color = clWhite
          LeftAxis.Axis.Color = clWhite
          LeftAxis.Inverted = True
          LeftAxis.LabelsFormat.Frame.Color = clWhite
          LeftAxis.Ticks.Color = clWhite
          TopAxis.Ticks.Color = clWhite
          View3D = False
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          Align = alClient
          BevelOuter = bvLowered
          PopupMenu = puCharts
          AutoSize = True
          TabOrder = 0
          OnMouseMove = vtcFileDatesMouseMove
          ExplicitWidth = 103
          ExplicitHeight = 165
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
      object tvFileDates: THTMLTreeview
        Left = 2
        Top = 26
        Width = 339
        Height = 792
        ItemHeight = 16
        SelectionNFColor = clSilver
        SelectionNFFontColor = clBlack
        Align = alLeft
        Color = 1644825
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Indent = 19
        ParentFont = False
        PopupMenu = puTreeDate
        TabOrder = 2
        OnDblClick = tvFileDatesDblClick
        Version = '1.4.1.5'
        ExplicitHeight = 248
      end
    end
    object tsHistory: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 6
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 13542013
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object Panel31: TPanel
        Left = 2
        Top = 2
        Width = 162
        Height = 816
        Align = alLeft
        BevelEdges = []
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitHeight = 272
        object bHistoryRefresh: TSpeedButton
          Left = 6
          Top = 334
          Width = 150
          Height = 22
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF9FC2A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBABABAFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF8BBC905E9D63FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B18F8F8FFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF9BCBA066B06E61AA683D8B4437833E327B373D7F436496689EBC
            A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C0A1A1A19B9B9B7C
            7C7C7575756D6D6D7272728B8B8BB5B5B5FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFAAD8AF73BD7C96D19F94CF9C8FCD968ACA9185C78B7ABE8165AD6C4B92
            5168976BFF00FFFF00FFFF00FFFF00FFFF00FFCDCDCDAEAEAEC4C4C4C2C2C2BF
            BFBFBCBCBCB8B8B8AFAFAF9E9E9E8383838C8C8CFF00FFFF00FFFF00FFFF00FF
            FF00FFA9DBAF79C4839ED7A79BD4A497D29F92CF9A8DCC9588CA907AC2827EC4
            855DA46369996CFF00FFFF00FFFF00FFFF00FFD0D0D0B4B4B4CBCBCBC8C8C8C5
            C5C5C2C2C2BEBEBEBCBCBCB2B2B2B5B5B59595958E8E8EFF00FFFF00FFFF00FF
            FF00FFFF00FFA4DAAB7BC78577C28154AB5E4EA357499B5163AC6B83C38B87C9
            8F82C689509756A0BFA2FF00FFFF00FFFF00FFFF00FFCECECEB7B7B7B2B2B29A
            9A9A9292928B8B8B9D9D9DB5B5B5BBBBBBB7B7B7888888B8B8B8FF00FFFF00FF
            FF00FFFF00FFFF00FF9ED8A57BC784FF00FFFF00FFFF00FF9BC9A05BA26286C6
            8E88C98F6FB376699D6DFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCBB7B7B7FF
            00FFFF00FFFF00FFBEBEBE939393B8B8B8BBBBBBA5A5A5929292B8D7BBB6D4B9
            B4D1B6B2CEB4AFCBB1FF00FFB4E2BAFF00FFFF00FFFF00FFFF00FFA4CFA854A0
            5B48954F408B47478B4ED0D0D0CDCDCDCACACAC7C7C7C4C4C4FF00FFD8D8D8FF
            00FFFF00FFFF00FFFF00FFC5C5C59090908686867C7C7C7D7D7D5DA9644C9C54
            48954F49904F97BE9BFF00FFFF00FFFF00FFFF00FF92B294FF00FFBEDFC2BCDC
            BFBAD9BDB7D6BBB5D3B89999998C8C8C868686818181B5B5B5FF00FFFF00FFFF
            00FFFF00FFAAAAAAFF00FFD8D8D8D5D5D5D2D2D2CFCFCFCCCCCC84C38B80C389
            8DCC9583C48A54995A90BA94FF00FFFF00FFFF00FF4A814D739C76FF00FFFF00
            FFFF00FFFF00FFFF00FFB5B5B5B4B4B4BEBEBEB6B6B68B8B8BB0B0B0FF00FFFF
            00FFFF00FF757575929292FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF75BF7E
            98D2A194CF9C86C78D5EA765398640347E3A2E763349904F458B4A7EA581FF00
            FFFF00FFFF00FFFF00FFFF00FFB0B0B0C6C6C6C2C2C2B9B9B998989877777770
            70706868688181817D7D7D9C9C9CFF00FFFF00FFFF00FFFF00FFFF00FF8ECD96
            85C98E9BD4A48FCE9892CF9A8DCC9588CA9083C68B7EC48579C17F478D4C87AC
            89FF00FFFF00FFFF00FFFF00FFBFBFBFBABABAC8C8C8C0C0C0C2C2C2BEBEBEBC
            BCBCB7B7B7B5B5B5B1B1B17E7E7EA3A3A3FF00FFFF00FFFF00FFFF00FFFF00FF
            90CF9779C38389CA9294D09C95D19E90CF998CCB9487C98F80C4874E95548FB3
            92FF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1B3B3B3BCBCBCC3C3C3C4C4C4C1
            C1C1BDBDBDBBBBBBB5B5B5868686ABABABFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFB9E1BE89C99064B46C50A65A4B9E5345964D60A8685BA2628CB690FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD8D8D8BBBBBBA4A4A49595958D
            8D8D878787999999939393ACACACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF67AB6E8BBC90FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF9C9C9CB1B1B1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACD4B0FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFCACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          NumGlyphs = 2
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
        object lHSelected: TLabel
          Left = 6
          Top = 412
          Width = 4
          Height = 13
          Caption = '.'
        end
        object gbHistory: TGroupBox
          Left = 5
          Top = 180
          Width = 149
          Height = 85
          Caption = '.'
          TabOrder = 0
          object cbHCumulative: TAdvOfficeCheckBox
            Left = 8
            Top = 60
            Width = 138
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = dtpHFromChange
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.5.0.9'
          end
          object rbHQuantity: TAdvOfficeRadioButton
            Left = 7
            Top = 16
            Width = 139
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabStop = True
            OnClick = dtpHFromChange
            Alignment = taLeftJustify
            Caption = '.'
            Checked = True
            ReturnIsTab = False
            Version = '1.5.0.9'
          end
          object rbHSize: TAdvOfficeRadioButton
            Left = 7
            Top = 34
            Width = 139
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = dtpHFromChange
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.5.0.9'
          end
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 4
          Width = 148
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
            Width = 136
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
            Width = 136
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
            Width = 136
            Height = 21
            Style = csDropDownList
            TabOrder = 2
            OnChange = dtpHFromChange
          end
          object cbHDateSelect: TComboBox
            Left = 6
            Top = 131
            Width = 136
            Height = 21
            Style = csDropDownList
            TabOrder = 3
            OnChange = dtpHFromChange
          end
        end
        object cbHUsers: TComboBox
          Left = 6
          Top = 297
          Width = 148
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnChange = dtpHFromChange
        end
        object cbAutoRefreshHistory: TAdvOfficeCheckBox
          Left = 17
          Top = 370
          Width = 131
          Height = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = dtpHFromChange
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
      end
      object Panel7: TPanel
        Left = 164
        Top = 2
        Width = 1144
        Height = 816
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 283
        ExplicitHeight = 272
        object capacityBarHistory: TAdvSmoothCapacityBar
          Left = 0
          Top = 733
          Width = 1144
          Height = 83
          AntiAlias = aaAntiAlias
          Align = alBottom
          Appearance.ShowFree = False
          Appearance.AutoFormatValues = False
          Appearance.BackGroundFill.Color = 3355443
          Appearance.BackGroundFill.ColorTo = clWhite
          Appearance.BackGroundFill.ColorMirror = clNone
          Appearance.BackGroundFill.ColorMirrorTo = clNone
          Appearance.BackGroundFill.GradientType = gtSolid
          Appearance.BackGroundFill.GradientMirrorType = gtSolid
          Appearance.BackGroundFill.BorderColor = clNone
          Appearance.BackGroundFill.Rounding = 0
          Appearance.BackGroundFill.ShadowOffset = 0
          Appearance.BackGroundFill.Glow = gmNone
          Appearance.Color = 15592683
          Appearance.ColorTo = 14605788
          Appearance.CapacityFont.Charset = DEFAULT_CHARSET
          Appearance.CapacityFont.Color = clWhite
          Appearance.CapacityFont.Height = -12
          Appearance.CapacityFont.Name = 'Tahoma'
          Appearance.CapacityFont.Style = []
          Appearance.CapacityFormat = '%.0f %%'
          Appearance.FreeFormat = '%.0f MB'
          Appearance.LegendFormat = '%.01f'
          Appearance.LegendFont.Charset = DEFAULT_CHARSET
          Appearance.LegendFont.Color = clWhite
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
          Width = 1144
          Height = 711
          BackWall.Brush.Style = bsClear
          Gradient.Direction = gdBottomTop
          Gradient.EndColor = 15922416
          Gradient.Visible = True
          Legend.Alignment = laLeft
          Legend.Visible = False
          MarginLeft = 4
          MarginRight = 5
          MarginUnits = muPixels
          Title.Text.Strings = (
            '...')
          BottomAxis.LabelsFormat.Font.Color = clWhite
          DepthTopAxis.Axis.Color = clWhite
          LeftAxis.Axis.Color = clWhite
          LeftAxis.LabelsFormat.Font.Color = clWhite
          LeftAxis.Title.Font.Color = clWhite
          TopAxis.Axis.Color = clWhite
          View3D = False
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          PopupMenu = puCharts
          TabOrder = 0
          OnClick = vtcHistoryClick
          OnMouseMove = vtcHistoryMouseMove
          ExplicitWidth = 283
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
          Width = 1144
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          ExplicitWidth = 283
          DesignSize = (
            1144
            22)
          object lHistoryResults: THTMLabel
            Left = 6
            Top = 4
            Width = -27919
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            HTMLText.Strings = (
              '...')
            Transparent = True
            Version = '2.1.0.0'
            ExplicitWidth = 1491
          end
        end
      end
    end
    object tsTop50: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 7
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 13948116
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object pcTop101: TPageControl
        Left = 2
        Top = 2
        Width = 1306
        Height = 816
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 445
        ExplicitHeight = 272
      end
      object astpTop101: TAdvSmoothTabPager
        Left = 2
        Top = 2
        Width = 1306
        Height = 816
        Fill.Color = clWhite
        Fill.ColorTo = 16768452
        Fill.ColorMirror = 16765357
        Fill.ColorMirrorTo = 16767936
        Fill.GradientType = gtVertical
        Fill.GradientMirrorType = gtVertical
        Fill.BorderColor = clSilver
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
          Width = 1304
          Height = 788
          Caption = ''
          ImageIndex = 7
          PageAppearance.Color = clWhite
          PageAppearance.ColorTo = clWhite
          PageAppearance.ColorMirror = clWhite
          PageAppearance.ColorMirrorTo = clWhite
          PageAppearance.GradientType = gtVertical
          PageAppearance.GradientMirrorType = gtVertical
          PageAppearance.BorderColor = 13948116
          PageAppearance.Rounding = 0
          PageAppearance.ShadowOffset = 0
          PageAppearance.Glow = gmNone
          TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
          TabAppearance.Appearance.Font.Color = 4473924
          TabAppearance.Appearance.Font.Height = -11
          TabAppearance.Appearance.Font.Name = 'Tahoma'
          TabAppearance.Appearance.Font.Style = []
          TabAppearance.Appearance.SimpleLayout = True
          TabAppearance.Appearance.SimpleLayoutBorder = True
          TabAppearance.Appearance.ImageList = ilTabs
          TabAppearance.Appearance.ImageIndex = 7
          TabAppearance.Appearance.Rounding = 0
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
          TabAppearance.BevelColor = clWhite
          TabAppearance.BevelColorDown = clWhite
          TabAppearance.BevelColorSelected = 13027014
          TabAppearance.BevelColorDisabled = clWhite
          TabAppearance.Color = clWhite
          TabAppearance.ColorDown = clWhite
          TabAppearance.ColorSelected = clWhite
          TabAppearance.ColorDisabled = 15658734
          TMSStyle = 21
          object splitterTop50: TAdvSplitter
            Left = 402
            Top = 24
            Height = 762
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
            Width = 1300
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = cbTopColourCodeClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.5.0.9'
            end
          end
          object pTop101: TPanel
            Left = 2
            Top = 24
            Width = 400
            Height = 762
            Align = alLeft
            TabOrder = 1
            ExplicitHeight = 218
            object capacityTop101: TAdvSmoothCapacityBar
              Left = 1
              Top = 685
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
              Appearance.BackGroundFill.Color = 3355443
              Appearance.BackGroundFill.ColorTo = clWhite
              Appearance.BackGroundFill.ColorMirror = clNone
              Appearance.BackGroundFill.ColorMirrorTo = clNone
              Appearance.BackGroundFill.GradientType = gtSolid
              Appearance.BackGroundFill.GradientMirrorType = gtSolid
              Appearance.BackGroundFill.BorderColor = 3355443
              Appearance.BackGroundFill.Rounding = 0
              Appearance.BackGroundFill.ShadowOffset = 0
              Appearance.BackGroundFill.Glow = gmNone
              Appearance.Color = 15592683
              Appearance.ColorTo = 14605788
              Appearance.CapacityFont.Charset = DEFAULT_CHARSET
              Appearance.CapacityFont.Color = clWhite
              Appearance.CapacityFont.Height = -12
              Appearance.CapacityFont.Name = 'Tahoma'
              Appearance.CapacityFont.Style = []
              Appearance.CapacityFormat = '%.0f %%'
              Appearance.FreeFormat = '%.0f MB'
              Appearance.LegendFormat = '%.01f'
              Appearance.LegendFont.Charset = DEFAULT_CHARSET
              Appearance.LegendFont.Color = clWhite
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
              Height = 667
              Cursor = crDefault
              Align = alClient
              DefaultRowHeight = 17
              DrawingStyle = gdsClassic
              FixedCols = 0
              RowCount = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
              ParentFont = False
              PopupMenu = puSearch
              ScrollBars = ssBoth
              TabOrder = 0
              StyleElements = [seClient, seBorder]
              OnDrawCell = sgTop50BigDrawCell
              GridLineColor = 15062992
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgMainReportGetCellColor
              OnGetAlignment = sgExtensionGetAlignment
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = 10344697
              ActiveCellColorTo = 6210033
              CellNode.TreeColor = clSilver
              ControlLook.FixedGradientFrom = 16250871
              ControlLook.FixedGradientTo = 14606046
              ControlLook.FixedGradientHoverFrom = 15000287
              ControlLook.FixedGradientHoverTo = 14406605
              ControlLook.FixedGradientHoverMirrorFrom = 14406605
              ControlLook.FixedGradientHoverMirrorTo = 13813180
              ControlLook.FixedGradientHoverBorder = 12033927
              ControlLook.FixedGradientDownFrom = 14991773
              ControlLook.FixedGradientDownTo = 14991773
              ControlLook.FixedGradientDownMirrorFrom = 14991773
              ControlLook.FixedGradientDownMirrorTo = 14991773
              ControlLook.FixedGradientDownBorder = 14991773
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
              Look = glCustom
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
              SearchFooter.Color = 16250871
              SearchFooter.ColorTo = clNone
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
              SelectionColor = 6210033
              ShowSelection = False
              ShowDesignHelper = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              Version = '8.4.2.5'
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
            Width = 897
            Height = 762
            Cursor = crDefault
            Align = alClient
            ColCount = 4
            DefaultRowHeight = 17
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLineWidth = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
            ParentFont = False
            PopupMenu = puSearch
            ScrollBars = ssBoth
            TabOrder = 2
            StyleElements = [seClient, seBorder]
            OnDrawCell = sgTop50SmallDrawCell
            GridLineColor = 15062992
            HoverRowCells = [hcNormal, hcSelected]
            OnGetCellColor = sgMainReportGetCellColor
            OnGetAlignment = sgExtensionGetAlignment
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 10344697
            ActiveCellColorTo = 6210033
            CellNode.TreeColor = clSilver
            ControlLook.FixedGradientFrom = 16250871
            ControlLook.FixedGradientTo = 14606046
            ControlLook.FixedGradientHoverFrom = 15000287
            ControlLook.FixedGradientHoverTo = 14406605
            ControlLook.FixedGradientHoverMirrorFrom = 14406605
            ControlLook.FixedGradientHoverMirrorTo = 13813180
            ControlLook.FixedGradientHoverBorder = 12033927
            ControlLook.FixedGradientDownFrom = 14991773
            ControlLook.FixedGradientDownTo = 14991773
            ControlLook.FixedGradientDownMirrorFrom = 14991773
            ControlLook.FixedGradientDownMirrorTo = 14991773
            ControlLook.FixedGradientDownBorder = 14991773
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
            Look = glCustom
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
            SearchFooter.Color = 16250871
            SearchFooter.ColorTo = clNone
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
            SelectionColor = 6210033
            ShowSelection = False
            ShowDesignHelper = False
            SortSettings.DefaultFormat = ssAutomatic
            SortSettings.Column = 0
            Version = '8.4.2.5'
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
          Width = 1304
          Height = 788
          Caption = ''
          PageAppearance.Color = clWhite
          PageAppearance.ColorTo = clWhite
          PageAppearance.ColorMirror = clWhite
          PageAppearance.ColorMirrorTo = clWhite
          PageAppearance.GradientType = gtVertical
          PageAppearance.GradientMirrorType = gtVertical
          PageAppearance.PictureAspectRatio = True
          PageAppearance.BorderColor = 13948116
          PageAppearance.Rounding = 0
          PageAppearance.ShadowOffset = 0
          PageAppearance.Glow = gmNone
          TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
          TabAppearance.Appearance.Font.Color = 4473924
          TabAppearance.Appearance.Font.Height = -11
          TabAppearance.Appearance.Font.Name = 'Tahoma'
          TabAppearance.Appearance.Font.Style = []
          TabAppearance.Appearance.SimpleLayout = True
          TabAppearance.Appearance.SimpleLayoutBorder = True
          TabAppearance.Appearance.ImageList = ilTabs
          TabAppearance.Appearance.ImageIndex = 0
          TabAppearance.Appearance.Rounding = 0
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
          TabAppearance.BevelColor = clWhite
          TabAppearance.BevelColorDown = clWhite
          TabAppearance.BevelColorSelected = 16765357
          TabAppearance.BevelColorDisabled = clWhite
          TabAppearance.Color = clWhite
          TabAppearance.ColorDown = clWhite
          TabAppearance.ColorSelected = clWhite
          TabAppearance.ColorDisabled = 15658734
          TMSStyle = 21
          object splitterTopDate: TAdvSplitter
            Left = 397
            Top = 24
            Height = 762
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
            Width = 1300
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            FullRepaint = False
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 439
            object cbTop101Dates: TComboBox
              Left = 152
              Top = 0
              Width = 113
              Height = 21
              Style = csDropDownList
              TabOrder = 0
              OnChange = cbTop101DatesUserChange
            end
            object cbTop101DatesUser: TComboBox
              Left = 0
              Top = 0
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 1
              OnChange = cbTop101DatesUserChange
            end
            object cbTopDateColourCode: TAdvOfficeCheckBox
              Left = 272
              Top = 2
              Width = 243
              Height = 20
              Hint = 'colour code search results based on the category they belong to'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = cbTopDateColourCodeClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.5.0.9'
            end
          end
          object Panel12: TPanel
            Left = 2
            Top = 24
            Width = 395
            Height = 762
            Align = alLeft
            TabOrder = 1
            ExplicitHeight = 218
            object sgTop101BigDate: TAdvStringGrid
              Tag = 6
              Left = 1
              Top = 18
              Width = 393
              Height = 743
              Cursor = crDefault
              Align = alClient
              ColCount = 6
              DefaultRowHeight = 17
              DrawingStyle = gdsClassic
              FixedCols = 0
              RowCount = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
              ParentFont = False
              PopupMenu = puSearch
              ScrollBars = ssBoth
              TabOrder = 0
              StyleElements = [seClient, seBorder]
              OnDrawCell = sgTop101BigDateDrawCell
              GridLineColor = 15062992
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgMainReportGetCellColor
              OnGetAlignment = sgMainReportGetAlignment
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWhite
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = 10344697
              ActiveCellColorTo = 6210033
              CellNode.TreeColor = clSilver
              ControlLook.FixedGradientFrom = 16250871
              ControlLook.FixedGradientTo = 14606046
              ControlLook.FixedGradientHoverFrom = 15000287
              ControlLook.FixedGradientHoverTo = 14406605
              ControlLook.FixedGradientHoverMirrorFrom = 14406605
              ControlLook.FixedGradientHoverMirrorTo = 13813180
              ControlLook.FixedGradientHoverBorder = 12033927
              ControlLook.FixedGradientDownFrom = 14991773
              ControlLook.FixedGradientDownTo = 14991773
              ControlLook.FixedGradientDownMirrorFrom = 14991773
              ControlLook.FixedGradientDownMirrorTo = 14991773
              ControlLook.FixedGradientDownBorder = 14991773
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
              Look = glCustom
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
              SearchFooter.Color = 16250871
              SearchFooter.ColorTo = clNone
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
              SelectionColor = 6210033
              ShowSelection = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              Version = '8.4.2.5'
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
            Width = 902
            Height = 762
            Cursor = crDefault
            Align = alClient
            ColCount = 6
            DefaultRowHeight = 17
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLineWidth = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
            ParentFont = False
            PopupMenu = puSearch
            ScrollBars = ssBoth
            TabOrder = 2
            StyleElements = [seClient, seBorder]
            OnDrawCell = sgTop101BigDateDrawCell
            GridLineColor = 15062992
            HoverRowCells = [hcNormal, hcSelected]
            OnGetCellColor = sgMainReportGetCellColor
            OnGetAlignment = sgMainReportGetAlignment
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWhite
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            ActiveCellColor = 10344697
            ActiveCellColorTo = 6210033
            CellNode.TreeColor = clSilver
            ControlLook.FixedGradientFrom = 16250871
            ControlLook.FixedGradientTo = 14606046
            ControlLook.FixedGradientHoverFrom = 15000287
            ControlLook.FixedGradientHoverTo = 14406605
            ControlLook.FixedGradientHoverMirrorFrom = 14406605
            ControlLook.FixedGradientHoverMirrorTo = 13813180
            ControlLook.FixedGradientHoverBorder = 12033927
            ControlLook.FixedGradientDownFrom = 14991773
            ControlLook.FixedGradientDownTo = 14991773
            ControlLook.FixedGradientDownMirrorFrom = 14991773
            ControlLook.FixedGradientDownMirrorTo = 14991773
            ControlLook.FixedGradientDownBorder = 14991773
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
            Look = glCustom
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
            SearchFooter.Color = 16250871
            SearchFooter.ColorTo = clNone
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
            SelectionColor = 6210033
            ShowSelection = False
            SortSettings.DefaultFormat = ssAutomatic
            SortSettings.Column = 0
            Version = '8.4.2.5'
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
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 8
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 4473924
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object Splitter1: TAdvSplitter
        Left = 2
        Top = 265
        Width = 1306
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
        Width = 1306
        Height = 263
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 445
        object pNullFilesTitle: TPanel
          Left = 0
          Top = 0
          Width = 1306
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 445
          object sbIDeleteNullFiles: TSpeedButton
            Left = 1
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Send these files to the recycle bin'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
              FF00FFFF00FF7D7D7D8888888D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A6A6A7A7A7DADADAD8D8D8D3D3D367
              67677272727070706C6C6C686868686868757575FF00FFFF00FFFF00FFAFAFAF
              B5B5B5F3F3F3E9E9E9E3E3E3E4E4E4B6B6B6929292E5E5E5E4E4E4DEDEDED4D4
              D4A0A0A0727272FF00FFFF00FFB5B5B5F4F4F4E5E5E5DBDBDBDADADADADADAF0
              F0F06E6E6ECFCFCFC9C9C9D0D0D08F8F8FB9B9B9666666FF00FFB8B8B8DBDBDB
              E8E8E8B7B7B7A9A9A9CCCCCCDADADAF5F5F5717171BFBFBFCBCBCBD1D1D18C8C
              8CAFAFAF6B6B6BFF00FFB2B2B2E6E6E6BFBFBFD0D0D0D5D5D5DADADAE5E5E5F5
              F5F5787878C6C6C6CDCDCDD3D3D3919191B1B1B16F6F6FFF00FFBDBDBDE2E2E2
              DCDCDCD8D8D8DDDDDDE5E5E5EFEFEFE9E9E9868686D7D7D7CDCDCDD3D3D39797
              97B4B4B4747474FF00FFFF00FFC1C1C1EFEFEFE5E5E5EBEBEBF1F1F1EEEEEEB6
              B6B6A9A9A9D8D8D8CBCBCBD0D0D09D9D9DB5B5B5797979FF00FFFF00FFC3C3C3
              D7D7D7EEEEEEF3F3F3E3E3E3B6B6B6A9A9A9CCCCCCCDCDCDCACACAC6C6C6B6B6
              B6B6B6B67E7E7EFF00FFFF00FFFF00FFC9C9C9B1B1B1A9A9A9A1A1A1B9B9B9C7
              C7C7BEBEBEBFBFBFBBBBBBC2C2C2BABABAC6C6C6848484FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFB0B0B0CBCBCBEFEFEFEFEFEFEDEDEDEFEFEFEFEFEFEFEF
              EFA6A6A6898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A6A6EFEFEFF0
              F0F0E6E6E6EDEDEDEEEEEEF9F9F9DDDDDDDEDEDE8D8D8DFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF949494C4C4C4DFDFDFEBEBEBE8E8E8F6F6F6F0F0F0E9E9
              E9ABABAB8D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF858585BA
              BABAD8D8D8F4F4F4FDFDFDEAEAEABCBCBC7F7F7FFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFB5B5B5A6A6A6E8E8E8F1F1F1D1D1D1B2B2
              B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFE4E4E4E0E0E0FF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = sbIDeleteNullFilesClick
          end
        end
        object sgNullFiles: TAdvStringGrid
          Left = 0
          Top = 24
          Width = 1306
          Height = 239
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
          GridLineColor = 15062992
          HoverRowCells = [hcNormal, hcSelected]
          OnGetCellColor = sgMainReportGetCellColor
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 10344697
          ActiveCellColorTo = 6210033
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientFrom = 16250871
          ControlLook.FixedGradientTo = 14606046
          ControlLook.FixedGradientHoverFrom = 15000287
          ControlLook.FixedGradientHoverTo = 14406605
          ControlLook.FixedGradientHoverMirrorFrom = 14406605
          ControlLook.FixedGradientHoverMirrorTo = 13813180
          ControlLook.FixedGradientHoverBorder = 12033927
          ControlLook.FixedGradientDownFrom = 14991773
          ControlLook.FixedGradientDownTo = 14991773
          ControlLook.FixedGradientDownMirrorFrom = 14991773
          ControlLook.FixedGradientDownMirrorTo = 14991773
          ControlLook.FixedGradientDownBorder = 14991773
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
          Look = glCustom
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
          SearchFooter.Color = 16250871
          SearchFooter.ColorTo = clNone
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
          SelectionColor = 6210033
          ShowSelection = False
          ShowDesignHelper = False
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.Show = True
          Version = '8.4.2.5'
          ExplicitWidth = 445
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
        Width = 1306
        Height = 550
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 445
        ExplicitHeight = 6
        object pEmptyFoldersTitle: TPanel
          Left = 0
          Top = 0
          Width = 1306
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 445
          object sbIDeleteNullFolders: TSpeedButton
            Left = 1
            Top = 1
            Width = 23
            Height = 22
            Hint = 'Send these folders to the recycle bin'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
              FF00FFFF00FF7D7D7D8888888D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A6A6A7A7A7DADADAD8D8D8D3D3D367
              67677272727070706C6C6C686868686868757575FF00FFFF00FFFF00FFAFAFAF
              B5B5B5F3F3F3E9E9E9E3E3E3E4E4E4B6B6B6929292E5E5E5E4E4E4DEDEDED4D4
              D4A0A0A0727272FF00FFFF00FFB5B5B5F4F4F4E5E5E5DBDBDBDADADADADADAF0
              F0F06E6E6ECFCFCFC9C9C9D0D0D08F8F8FB9B9B9666666FF00FFB8B8B8DBDBDB
              E8E8E8B7B7B7A9A9A9CCCCCCDADADAF5F5F5717171BFBFBFCBCBCBD1D1D18C8C
              8CAFAFAF6B6B6BFF00FFB2B2B2E6E6E6BFBFBFD0D0D0D5D5D5DADADAE5E5E5F5
              F5F5787878C6C6C6CDCDCDD3D3D3919191B1B1B16F6F6FFF00FFBDBDBDE2E2E2
              DCDCDCD8D8D8DDDDDDE5E5E5EFEFEFE9E9E9868686D7D7D7CDCDCDD3D3D39797
              97B4B4B4747474FF00FFFF00FFC1C1C1EFEFEFE5E5E5EBEBEBF1F1F1EEEEEEB6
              B6B6A9A9A9D8D8D8CBCBCBD0D0D09D9D9DB5B5B5797979FF00FFFF00FFC3C3C3
              D7D7D7EEEEEEF3F3F3E3E3E3B6B6B6A9A9A9CCCCCCCDCDCDCACACAC6C6C6B6B6
              B6B6B6B67E7E7EFF00FFFF00FFFF00FFC9C9C9B1B1B1A9A9A9A1A1A1B9B9B9C7
              C7C7BEBEBEBFBFBFBBBBBBC2C2C2BABABAC6C6C6848484FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFB0B0B0CBCBCBEFEFEFEFEFEFEDEDEDEFEFEFEFEFEFEFEF
              EFA6A6A6898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A6A6EFEFEFF0
              F0F0E6E6E6EDEDEDEEEEEEF9F9F9DDDDDDDEDEDE8D8D8DFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF949494C4C4C4DFDFDFEBEBEBE8E8E8F6F6F6F0F0F0E9E9
              E9ABABAB8D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF858585BA
              BABAD8D8D8F4F4F4FDFDFDEAEAEABCBCBC7F7F7FFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFB5B5B5A6A6A6E8E8E8F1F1F1D1D1D1B2B2
              B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFE4E4E4E0E0E0FF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = sbIDeleteNullFoldersClick
          end
        end
        object sgNullFolders: TAdvStringGrid
          Left = 0
          Top = 24
          Width = 1306
          Height = 526
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
          PopupMenu = puNullFolders
          ScrollBars = ssBoth
          TabOrder = 1
          GridLineColor = 15062992
          HoverRowCells = [hcNormal, hcSelected]
          OnGetCellColor = sgMainReportGetCellColor
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 10344697
          ActiveCellColorTo = 6210033
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientFrom = 16250871
          ControlLook.FixedGradientTo = 14606046
          ControlLook.FixedGradientHoverFrom = 15000287
          ControlLook.FixedGradientHoverTo = 14406605
          ControlLook.FixedGradientHoverMirrorFrom = 14406605
          ControlLook.FixedGradientHoverMirrorTo = 13813180
          ControlLook.FixedGradientHoverBorder = 12033927
          ControlLook.FixedGradientDownFrom = 14991773
          ControlLook.FixedGradientDownTo = 14991773
          ControlLook.FixedGradientDownMirrorFrom = 14991773
          ControlLook.FixedGradientDownMirrorTo = 14991773
          ControlLook.FixedGradientDownBorder = 14991773
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
          Look = glCustom
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
          SearchFooter.Color = 16250871
          SearchFooter.ColorTo = clNone
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
          SelectionColor = 6210033
          ShowSelection = False
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.Show = True
          Version = '8.4.2.5'
          ExplicitWidth = 445
          ExplicitHeight = 553
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
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 9
      TabAppearance.Appearance.Rounding = 0
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
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 4473924
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object splitUsers: TAdvSplitter
        Left = 523
        Top = 2
        Height = 816
        OnMoved = splitUsersMoved
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 520
        ExplicitTop = 3
        ExplicitHeight = 818
      end
      object pUsers: TPanel
        Left = 2
        Top = 2
        Width = 521
        Height = 816
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
            OnClick = rbUsersSizeClick
            Alignment = taLeftJustify
            Caption = '.'
            Checked = True
            ReturnIsTab = False
            Version = '1.5.0.9'
          end
          object rbUsersQuantity: TAdvOfficeRadioButton
            Left = 195
            Top = 3
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
            OnClick = rbUsersSizeClick
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.5.0.9'
          end
        end
        object vtcUsers: TChart
          Tag = 2
          Left = 1
          Top = 25
          Width = 519
          Height = 790
          AllowPanning = pmNone
          BackWall.Brush.Style = bsClear
          BackWall.Pen.Visible = False
          Gradient.Direction = gdBottomTop
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
        Width = 782
        Height = 816
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 1119
        ExplicitHeight = 272
        object Panel28: TPanel
          Left = 1
          Top = 1
          Width = 780
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 1117
          object sbUsersCopy: TSpeedButton
            Left = 1
            Top = 0
            Width = 23
            Height = 22
            Hint = 'copy this table to the clipboard'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFD39570CC8357C87646CA7B4ECB7B4ECA7B4ECA7B
              4ECA7B4ECA8155CD865CFF00FF4A80AB206398206398206398206398C98F67FC
              F3ECFAF1E8FAF0E7FBF1E9FBF2EAFBF2EAFBF2EBFDF4EECB83585588B174ADD8
              7BB2DD78AEDC75AADA74A9DADAA97DEFF1E7FFE9D9FFEADBFFE9D9FFE7D7FFE5
              D2FFE2CBEFF2E8CE815620639880B9E15395D15092D04E8ECE4D8CCDD6A97DFB
              F5EEFFE9D9FFEADBFFE9D9FFE7D7FFE5D2FFE2CBFBF6EFCC835620639884BFE2
              569AD35397D15092CF5091CFD6A97DFFF7F1FFE9D9FFEADBFFE9D9FFE7D7FFE5
              D2FFE2CBFFF7F1CB855620639888C4E6599FD6569BD35397D15395D1D7AC7FFF
              F7F0FFE7D5FDE7D6FDE6D4FCE4D0FBE3CBFADCC2FEF3E8CC86572063988BC9E7
              5CA5D759A0D5579CD3569AD3D7AC7FFFF7F2FEE7D5FEE7D5FDE5D1FAE0CAF9DE
              C4F7D9BCFDF2E7CC875820639891CDE95FA9D95DA5D85AA0D6599FD6D8AD81FE
              F7F1FCE5D2FCE4D1FBE2CCF9DDC4F6D7BBF3D1AFFAEFE4CC875920639898D2EB
              65AEDA60AAD95DA6D85CA5D7D9AF84FEF6F0FCE2CDFCE3CDFADFC8F7D9BCF5E9
              DDFAF3EBFBF8F3CA83542063989ED6ED6BB2DC66AFDC60AADA5FA9D9D9AF84FE
              F5EDFCDEC5FBE0C7F9DCC2F5D3B4FEF9F3FAE2C4ECC193D2986E206398A5DAEF
              6FB5DE68B0DC60A9D95FA9D9D7AD81FFFFFEFDF3E9FDF3EAFCF2E8FAEFE3FAF2
              E7EABB88D39469FF00FF206398AADDF174B9E070B6DF6CB3DD6BB2DCD9AF84D7
              AE81D7AC7FD7AC7FCCA070CD9F71B38F67D39B71FF00FFFF00FF206398B0E1F2
              79BDE24498DD4497DC4396DC4296DC4295DC4195DB539ED489C6E6206398FF00
              FFFF00FFFF00FFFF00FF3B76A595C9E0AEE2F24E9DDFB5EEFD75D4F075D4F0B5
              EEFD4B9BDE8ECBE993CDE92A6A9DFF00FFFF00FFFF00FFFF00FFFF00FF6392B7
              2063983775A4B6EFFE80DBF380DBF3B6EFFE2E6EA12063986F9ABCFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF20639820639820639820639820
              63982D6C9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
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
          Width = 780
          Height = 769
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
          GridLineColor = 15062992
          HoverRowCells = [hcNormal, hcSelected]
          OnGetCellColor = sgMainReportGetCellColor
          OnGetAlignment = sgMainReportGetAlignment
          OnCanSort = sgUsersCanSort
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 10344697
          ActiveCellColorTo = 6210033
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientFrom = 16250871
          ControlLook.FixedGradientTo = 14606046
          ControlLook.FixedGradientHoverFrom = 15000287
          ControlLook.FixedGradientHoverTo = 14406605
          ControlLook.FixedGradientHoverMirrorFrom = 14406605
          ControlLook.FixedGradientHoverMirrorTo = 13813180
          ControlLook.FixedGradientHoverBorder = 12033927
          ControlLook.FixedGradientDownFrom = 14991773
          ControlLook.FixedGradientDownTo = 14991773
          ControlLook.FixedGradientDownMirrorFrom = 14991773
          ControlLook.FixedGradientDownMirrorTo = 14991773
          ControlLook.FixedGradientDownBorder = 14991773
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
          Look = glCustom
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
          SearchFooter.Color = 16250871
          SearchFooter.ColorTo = clNone
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
          SelectionColor = 6210033
          ShowSelection = False
          ShowDesignHelper = False
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.Show = True
          Version = '8.4.2.5'
          ExplicitWidth = 1117
          ExplicitHeight = 225
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
        object pUsersWarning: TPanel
          Left = 1
          Top = 794
          Width = 780
          Height = 21
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 2
          ExplicitTop = 250
          ExplicitWidth = 1117
          object lUsersWarning: TLabel
            Left = 2
            Top = 3
            Width = 3
            Height = 13
            Cursor = crHandPoint
            Caption = '.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = lUsersWarningClick
          end
        end
      end
    end
    object tsTemp: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 10
      TabAppearance.Appearance.Rounding = 0
      TabAppearance.Appearance.WordWrapping = False
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 8
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 4473924
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object splitterTemp: TAdvSplitter
        Left = 323
        Top = 2
        Height = 816
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
        Height = 816
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
              18000000000000030000C21E0000C21E00000000000000000000FF00FF5199FF
              2981FF217DFF63A3FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4995FFA0C7FF
              83B7FF7FB4FF97C2FF5399FF67A4FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
              A7FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1CAFF79B3FF
              A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
              C5FF599EFF70ABFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7CDFF7EB7FFA9CEFFA8CDFF70
              ACFF5F9AEE8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
              87979797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9CFFF84B6F794
              9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF939393D4D4D4C8C8C8BCBCBCBABA
              BAC2C2C2C4C4C4999999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A9A9AE4E4E4CFCFCFACACACFF00
              FF8E8E8E8C8C8C8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFABABABE2E2E2E7E7E7B9B9B9939393FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FE4E4E4EEEEEE9696
              96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFACACAC9D9D9D9B9B9BFF00FFFF00FFFF00FF}
            OnClick = SpeedButton2Click
          end
          object rbTempSize: TAdvOfficeRadioButton
            Left = 35
            Top = 3
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
            OnClick = rbTempSizeClick
            Alignment = taLeftJustify
            Caption = '.'
            Checked = True
            ReturnIsTab = False
            Version = '1.5.0.9'
          end
          object rbTempQuantity: TAdvOfficeRadioButton
            Left = 140
            Top = 3
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
            OnClick = rbTempSizeClick
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.5.0.9'
          end
        end
        object vtcTemp: TChart
          Tag = 2
          Left = 1
          Top = 25
          Width = 319
          Height = 790
          AllowPanning = pmNone
          BackWall.Brush.Style = bsClear
          BackWall.Pen.Visible = False
          Gradient.Direction = gdBottomTop
          Gradient.EndColor = clWhite
          Gradient.StartColor = 16771293
          Gradient.Visible = True
          LeftWall.Color = clGray
          Legend.Alignment = laLeft
          Legend.TextStyle = ltsPlain
          Legend.Visible = False
          MarginLeft = 4
          MarginRight = 4
          MarginUnits = muPixels
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
        Width = 982
        Height = 816
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 121
        ExplicitHeight = 272
        object Panel23: TPanel
          Left = 0
          Top = 0
          Width = 982
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Color = 3355443
          FullRepaint = False
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 121
          DesignSize = (
            982
            24)
          object lTempStatus: THTMLabel
            Left = 5
            Top = 4
            Width = 104612
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            AutoSizing = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HTMLText.Strings = (
              '...')
            ParentFont = False
            Transparent = True
            Version = '2.1.0.0'
            ExplicitWidth = 1244
          end
        end
        object sgTemp: TAdvStringGrid
          Left = 0
          Top = 24
          Width = 982
          Height = 771
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
          PopupMenu = puSearch
          ScrollBars = ssBoth
          TabOrder = 1
          OnDrawCell = sgTempDrawCell
          GridLineColor = 15062992
          HoverRowCells = [hcNormal, hcSelected]
          OnGetCellColor = sgMainReportGetCellColor
          OnCanSort = sgTempCanSort
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 10344697
          ActiveCellColorTo = 6210033
          CellNode.TreeColor = clSilver
          ControlLook.FixedGradientFrom = 16250871
          ControlLook.FixedGradientTo = 14606046
          ControlLook.FixedGradientHoverFrom = 15000287
          ControlLook.FixedGradientHoverTo = 14406605
          ControlLook.FixedGradientHoverMirrorFrom = 14406605
          ControlLook.FixedGradientHoverMirrorTo = 13813180
          ControlLook.FixedGradientHoverBorder = 12033927
          ControlLook.FixedGradientDownFrom = 14991773
          ControlLook.FixedGradientDownTo = 14991773
          ControlLook.FixedGradientDownMirrorFrom = 14991773
          ControlLook.FixedGradientDownMirrorTo = 14991773
          ControlLook.FixedGradientDownBorder = 14991773
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
          Look = glCustom
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
          SearchFooter.Color = 16250871
          SearchFooter.ColorTo = clNone
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
          SelectionColor = 6210033
          ShowSelection = False
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          SortSettings.Show = True
          Version = '8.4.2.5'
          ExplicitWidth = 121
          ExplicitHeight = 227
          ColWidths = (
            20
            20
            20)
          RowHeights = (
            17
            17)
        end
        object pTempFilesWarning: TPanel
          Left = 0
          Top = 795
          Width = 982
          Height = 21
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          ParentBackground = False
          TabOrder = 2
          ExplicitTop = 251
          ExplicitWidth = 121
          object lTempWarning: TLabel
            Left = 2
            Top = 3
            Width = 3
            Height = 13
            Cursor = crHandPoint
            Caption = '.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = lUsersWarningClick
          end
        end
      end
    end
    object tsLength: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1310
      Height = 820
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.Rounding = 0
      PageAppearance.ShadowOffset = 0
      PageAppearance.Glow = gmNone
      TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Appearance.Font.Color = 4473924
      TabAppearance.Appearance.Font.Height = -11
      TabAppearance.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Appearance.Font.Style = []
      TabAppearance.Appearance.SimpleLayout = True
      TabAppearance.Appearance.SimpleLayoutBorder = True
      TabAppearance.Appearance.ImageList = ilTabs
      TabAppearance.Appearance.ImageIndex = 12
      TabAppearance.Appearance.Rounding = 0
      TabAppearance.Appearance.WordWrapping = False
      TabAppearance.Status.Caption = '0'
      TabAppearance.Status.Appearance.Fill.Color = clRed
      TabAppearance.Status.Appearance.Fill.ColorMirror = clNone
      TabAppearance.Status.Appearance.Fill.ColorMirrorTo = clNone
      TabAppearance.Status.Appearance.Fill.GradientType = gtSolid
      TabAppearance.Status.Appearance.Fill.GradientMirrorType = gtSolid
      TabAppearance.Status.Appearance.Fill.BorderColor = clGray
      TabAppearance.Status.Appearance.Fill.Rounding = 8
      TabAppearance.Status.Appearance.Fill.ShadowOffset = 0
      TabAppearance.Status.Appearance.Fill.Glow = gmNone
      TabAppearance.Status.Appearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Status.Appearance.Font.Color = clWhite
      TabAppearance.Status.Appearance.Font.Height = -11
      TabAppearance.Status.Appearance.Font.Name = 'Tahoma'
      TabAppearance.Status.Appearance.Font.Style = []
      TabAppearance.BevelColor = clWhite
      TabAppearance.BevelColorDown = clWhite
      TabAppearance.BevelColorSelected = 4473924
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 4
      object splitLength: TAdvSplitter
        Left = 316
        Top = 26
        Height = 792
        OnCanResize = splitTableCanResize
        OnMoved = splitLengthMoved
        Appearance.BorderColor = clNone
        Appearance.BorderColorHot = clNone
        Appearance.Color = clWhite
        Appearance.ColorTo = clSilver
        Appearance.ColorHot = clWhite
        Appearance.ColorHotTo = clGray
        GripStyle = sgDots
        ExplicitLeft = 324
        ExplicitTop = 28
        ExplicitHeight = 814
      end
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 1306
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
        object sbLengthPie: TSpeedButton
          Tag = 12
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
        object sbLengthBar: TSpeedButton
          Tag = 12
          Left = 24
          Top = 1
          Width = 24
          Height = 22
          GroupIndex = 1
          Flat = True
          OnClick = sbMainBarClick
        end
        object SpeedButton4: TSpeedButton
          Tag = 1
          Left = 52
          Top = 1
          Width = 24
          Height = 22
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C21E0000C21E00000000000000000000FF00FF5199FF
            2981FF217DFF63A3FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF65A7FF61A4FF97C2FF94C0FF5198FF65A3FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4995FFA0C7FF
            83B7FF7FB4FF97C2FF5399FF67A4FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF539DFFA4CBFF8BBCFF77B0FF80B5FF98C3FF569CFF6B
            A7FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1CAFF79B3FF
            A5CCFF8DBDFF79B2FF83B6FF99C3FF589CFF6CA9FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFA3CBFF7BB4FFA6CCFF8EBEFF7CB3FF85B8FF9B
            C5FF599EFF70ABFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            A5CBFF7CB6FFA8CEFF90BFFF8BBDFFA0C8FF61A4FF61A0FBFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7CDFF7EB7FFA9CEFFA8CDFF70
            ACFF5F9AEE8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFA7CEFF81B7FF7CB4FF6FA7F2D2D2D2B5B5B58989898989898787
            87979797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9CFFF84B6F794
            9494C7C7C7CCCCCCC7C7C7C6C6C6C3C3C3C0C0C0898989FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF939393D4D4D4C8C8C8BCBCBCBABA
            BAC2C2C2C4C4C4999999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF979797DDDDDDC5C5C5AAAAAAA8A8A8ACACACD7D7D7898989FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A9A9AE4E4E4CFCFCFACACACFF00
            FF8E8E8E8C8C8C8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFABABABE2E2E2E7E7E7B9B9B9939393FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FE4E4E4EEEEEE9696
            96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFACACAC9D9D9D9B9B9BFF00FFFF00FFFF00FF}
          OnClick = SpeedButton4Click
        end
        object rbLengthGraphSize: TAdvOfficeRadioButton
          Left = 90
          Top = 3
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
          OnClick = rbLengthGraphSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          Checked = True
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
        object rbLengthGraphCount: TAdvOfficeRadioButton
          Left = 195
          Top = 3
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
          OnClick = rbLengthGraphSizeClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.5.0.9'
        end
      end
      object sgLength: TAdvStringGrid
        Left = 2
        Top = 26
        Width = 314
        Height = 792
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
        OnDblClick = sgLengthDblClick
        OnDrawCell = sgLengthDrawCell
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        OnGetCellColor = sgMainReportGetCellColor
        OnGetAlignment = sgMainReportGetAlignment
        OnCanSort = sgMainReportCanSort
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientFrom = 16250871
        ControlLook.FixedGradientTo = 14606046
        ControlLook.FixedGradientHoverFrom = 15000287
        ControlLook.FixedGradientHoverTo = 14406605
        ControlLook.FixedGradientHoverMirrorFrom = 14406605
        ControlLook.FixedGradientHoverMirrorTo = 13813180
        ControlLook.FixedGradientHoverBorder = 12033927
        ControlLook.FixedGradientDownFrom = 14991773
        ControlLook.FixedGradientDownTo = 14991773
        ControlLook.FixedGradientDownMirrorFrom = 14991773
        ControlLook.FixedGradientDownMirrorTo = 14991773
        ControlLook.FixedGradientDownBorder = 14991773
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
        Look = glCustom
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
        SearchFooter.Color = 16250871
        SearchFooter.ColorTo = clNone
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
        SelectionColor = 6210033
        ShowSelection = False
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        SortSettings.Show = True
        Version = '8.4.2.5'
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
      object vtcLength: TChart
        Tag = 12
        Left = 319
        Top = 26
        Width = 989
        Height = 792
        AllowPanning = pmNone
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = 15719898
        Gradient.Visible = True
        LeftWall.Color = clGray
        Legend.Alignment = laLeft
        Legend.TextStyle = ltsPlain
        MarginLeft = 4
        MarginRight = 4
        MarginUnits = muPixels
        Title.Font.Style = [fsItalic]
        Title.Text.Strings = (
          '.....')
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
        PopupMenu = puCharts
        TabOrder = 2
        OnMouseDown = vtcLengthMouseDown
        OnMouseMove = vtcLengthMouseMove
        ExplicitWidth = 128
        ExplicitHeight = 248
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object PieSeries3: TPieSeries
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
          Gradient.EndColor = 7028779
          Gradient.StartColor = 7028779
          Gradient.Visible = True
          OtherSlice.Legend.Visible = False
          OtherSlice.Text = 'Other'
          PiePen.Visible = False
        end
      end
    end
  end
  object puCharts: TPopupMenu
    Left = 1295
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
  end
  object puType: TPopupMenu
    OnPopup = puTypePopup
    Left = 1232
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
    Left = 976
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
      object miCustomEM: TMenuItem
        Caption = '.'
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
      Caption = '.'
      OnClick = SaveasCSV2Click
    end
  end
  object puFolders: TPopupMenu
    OnPopup = puFoldersPopup
    Left = 1089
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
    Left = 1065
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
    Left = 1169
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
    Left = 770
    Top = 1
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
    object miSaveAs: TMenuItem
      Caption = '.'
      ImageIndex = 65
      OnClick = miSaveAsClick
    end
  end
  object puUsers: TPopupMenu
    OnPopup = puUsersPopup
    Left = 1128
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
    Left = 1193
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
    Left = 865
    Top = 64
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
    Left = 1248
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
    Left = 1016
    Top = 88
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
    Left = 840
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
    Left = 1344
    Top = 154
    Bitmap = {
      494C01010D00A402740A10001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000000000000000E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FCFCFC00C9C9C900FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C9000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000C08A7500CB70
      3400D27E4100D37E4100D17C4100CD7A3F00B45F3F00B1B9C900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2C0AA00CC8D
      6600BC6B3600BC6B3600BC6A3600BC6A3600BB6A3500BB6A3500BB693500BD6E
      3B00CA8B6300E3C2AE000000000000000000529CE2007185AC00C87E5900FFBA
      6600FFB76100FFB05E00FFB25D00FFB45C00DE88570087737E004C9BE6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C57C4D00F8F1
      EA00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FAF3EB00FAF2EA00F8F3ED00F8F3
      ED00F8F3ED00C37A4D0000000000000000003685D30093ACCC00E7AF7300FFB8
      5F00FEB05F00FEA75B00FDA05500FF974D00FD934D00B39FA2004E96DE000000
      00000000000000000000000000000000000000000000000000004DA3EA00469E
      E8003E9AE7003595E6001E8CE200208CE200218DE4001989E3001283E3000A81
      E100037DE0000079DF00000000000000000000000000E8D1D100D2BDBD00B5A3
      A300B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F
      9F00AF9E9E00B3A1A100D8C3C300000000000000000000000000C6804600F7F0
      E600F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C1743C000000000000000000DDC3B500B7755C00FDD7B200FFD6
      8400FFCA6500FFC05E00FFB45600FFA75700FFC59200D67D5B00B7907F000000
      000000000000000000000000000000000000000000000000000055A7EB00B6E6
      F90095D1F1004BA7E8005AAFEB007DC2EE00BBEEFB00BAEEF900B7EDF900B3ED
      F900B2EDF900017DE200000000000000000000000000BAA8A800FFF2F200F9E0
      E000F6DEDE00F5DDDD00F3DBDB00F2DADA00F0D8D800EFD7D700EED6D600EBD4
      D400EAD3D300FFECEC00B7A5A500000000000000000000000000C7844800F8F1
      E800F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C37A4100000000000000000000000000DDB29B00CF7A5A00FFE8
      C000ADAA8600A79E7D00A0927500F7CA9C00E4947500C8836500000000000000
      00000000000000000000000000000000000000000000000000005DABEB00B4E3
      F800329FE6003BABE900A8E9F8004EBAEB005AD6F30050D4F30048D2F20042D1
      F200B4EDF9000881E300000000000000000000000000B9A7A700FFFBFB00FFEA
      EA00FFE6E600FBE2E200F8DFDF00F4DCDC00F2DADA00EED6D600EAD3D300E8D1
      D100E6CFCF00FFF2F200B9A7A700000000000000000000000000C7864B00F8F2
      EB00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C780450000000000000000000000000000000000CB9E8700707C
      960073ADE70081B1E3007DB2E7006C98C40074552C005CA4640059A8680059A7
      670056A3640054935600BFB2BA000000000000000000000000005DACEC0055AD
      EB0047AFEB00ACE9F900ADEAFA0056BBEB0062D9F4005AD6F30050D4F30049D2
      F300B7EDF9001185E400000000000000000000000000BEABAB00FFFBFB00FFEE
      EE00FFEAEA00FFE7E700FCE3E300F9E0E000F5DDDD00F2DADA00EFD7D700EBD4
      D400E9D2D200FFF2F200BCA9A900000000000000000000000000C8884D00F9F3
      EC00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C884480000000000000000000000000000000000BBB7BA0073A4
      D600ACD1F200AED7FD00B0D4F50092C0E7005483890079CF940077CE8E0076CE
      8F0076CE91006BB474005A8F5A004C9BE60000000000000000005EADEB0083C3
      F000D3F3FC00D1F3FC00B2EDFA005BBCED006CDAF40062D9F4005AD6F30051D4
      F300BAEEFB001A8AE500000000000000000000000000C1AEAE00FFFDFD00FFF3
      F300FFEFEF00FFECEC00FFE9E900FDE4E400FAE1E100F6DEDE00F3DBDB00F1D9
      D900EED6D600FFF3F300C1AEAE00000000000000000000000000C88C4F00F9F4
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C8864B00000000000000000000000000000000006B8EB700A7BF
      DB0096C5F100A1D0FB0096C6F300B6CFE400417AA70078CE8F0075CD890070CB
      83006ACB7B006AC97900609661004E96DE00000000000000000071B6EE009ED1
      F40078CAF00072C7F0006EC6F00060BEED0076DDF5006CDBF40064D9F4005BD6
      F300BEEFFB00238FE800000000000000000000000000C6B2B200FFFFFF00FFFE
      FE00FFFEFE00FFFDFD00FFFCFC00FFF6F600FFE7E700FDE4E400F9E0E000F5DD
      DD00F2DADA00FFF5F500C4B1B100000000000000000000000000C88C5000F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00FAF4EF00C8874C0000000000000000000000000000000000617EA9005069
      9A006380AE007CA6D6005573A500435D9200446798007CD09F0077CE970071CD
      8E0072CD88009DD8AB006DB0700088A78B00000000000000000079B9F000DBF6
      FC009CE7F80095E5F8008FE3F70086E1F7007EDFF50076DDF5006DDBF40064D9
      F400C0F0FB002C94E900000000000000000000000000C9B5B500FFF7F700F0D8
      D800EAD3D300DEC8C800FFEBEB00FFFCFC00FFFCFC00FFFCFC00FFFCFC00FFFB
      FB00FFFBFB00FFFFFF00C9B5B500000000000000000000000000C88D5100F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F4F000C6864C0000000000000000000000000000000000000000004562
      9600415B9000415B9000415B9000415B90006F8F9E00849993007D948900758C
      7F00A4D5B10082BF850077AE7B000000000000000000000000008CC5F400DDF7
      FD00A2E8F8009DE7F80095E5F8008FE3F70087E1F7007FDFF60077DDF5006DDB
      F400C4F0FB003798EA00000000000000000000000000CAB6B600FFFBFB00F9E0
      E000F6DEDE00F1D9D900E6CFCF00E6CFCF00EED6D600EED6D600EBD4D400EAD3
      D300EAD3D300FFF7F700CCB8B800000000000000000000000000C88D5100F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F7F2EC00FBF7
      F300F5EFE900C380480000000000000000000000000000000000000000000000
      00004C6A9B00415D920046629800577987006E7A940073ADE70081B1E3007DB2
      E7006C98C40068916A000000000000000000000000000000000093C8F500E1F7
      FD00AAEAF900A3E8F9009DE7F80096E5F80090E3F70088E1F70080DFF60077DD
      F500C8F1FB00409EEB00000000000000000000000000CEBABA00FFFDFD00FEE5
      E500F9E0E000FBE2E200FDE4E400FFFBFB00FFFDFD00FFFCFC00FFFCFC00FFFB
      FB00FFFBFB00FFFEFE00D6C1C100000000000000000000000000C88D5200F9F5
      F100F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FCE6CD00FAE5
      C900E2B68400D5A8840000000000000000000000000000000000000000000000
      0000000000000000000000000000BBB7BA0073A4D600ACD1F200AED7FD00B0D4
      F50092C0E7007D92AA000000000000000000000000000000000097CCF600F9FD
      FF00F0FBFE00F0FBFE00F0FCFE00EEFBFD00EFFBFD00EFFBFD00F0FBFD00F0FB
      FD00F7FDFE004AA3ED00000000000000000000000000CEBABA00FFFEFE00FFFF
      FF00FFFEFE00FFFEFE00FFFFFF00FFF8F800E1CBCB00E2CCCC00E2CCCC00E2CC
      CC00E8D1D100EAD3D300FFE6E600000000000000000000000000CA925A00FAF6
      F200F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FFFBF800F6D8B400E1B0
      7D00DC9669000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007AA0C500B8D0E70096C5F100A1D0FB0096C6
      F300B6CFE4004B93C70000000000000000000000000000000000B2DCFD00FAFE
      FF00FAFEFF00FAFEFF00FAFEFF00FAFEFF00FAFDFE00FAFDFF00FAFEFF00FAFE
      FF00FAFDFF0053A8EE00000000000000000000000000DBC5C500DDC7C700DEC8
      C800DEC8C800DEC8C800DEC8C800DAC4C4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D2A27400F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F2EC00F7F2EC00F2E6D700E2B27D00DC98
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000079A3C70034AEE50065B8E6008DC8F6003BAD
      E6001DA7E500319ED70000000000000000000000000000000000B6DFFE00A2D2
      FA009CD1F90097CDF80092CAF7008CC6F60085C2F5007EBFF40076BAF4006EB6
      F10065B2F0005DADF00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8CEB900D7AA
      7C00CA905500CA905500CA915500CB905500C98F5500CF9D6900DDB190000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000023A4DF0019A6E50019A6E50019A6
      E50019A6E50083ABC50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000319DD5001BA5E40024A1
      DF0077A6C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFB49300D59D7400D1966800CE926300C7875600C3845200C384
      5200C3845200C3845200C3845200D0A17D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0B0B000A4A4
      A400000000000000000000000000000000000000000000000000000000000000
      0000A7A7A700ABABAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7A17500F8F2ED00F7F0EA00F6EDE600F1E4DB00F0E2D800F0E2
      D800F0E2D800F0E2D800F0E2D800C58B5E0000000000DFB49300D59D7400D196
      6800CE926300CB8E5E00C98A5B00C7875600C3845200C3845200C3845200C384
      5200C3845200C3845200D0A17D00000000000000000000000000B8B8B800DBDB
      DB00B8B8B700BDAC96009C81600084643B0084643B009C816000BDAB9500B7B7
      B600D9D9D900B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000938EFF007C76FF00F0EDFF00000000000000
      000000000000000000000000000000000000000000000000000000000000E3BC
      9D00D9A78200E1AE8700FAF4F000EACBB200EACCB300E8C7AC00E8C7AC00E8C7
      AC00E8C8B000E8C8AE00F0E2D800C486540000000000D7A17500F8F2ED00F7F0
      EA00F6EDE600F4EAE200F3E7DE00F1E4DB00F0E2D800EAD6C800F2E5DC00FAF4
      F100F9F3F000FAF5F200C58B5E0000000000000000000000000000000000D3D3
      D300C3C0BE009C6B3B00A66C3500AE6F3700AE6F3700A66C3500A1764A00C5C4
      C300C6C6C5000000000000000000000000000000000000000000000000000000
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
      CC00F1E4DB00FAF4F100C68A5C00000000000000000000000000A7855B00B37D
      4600C2997100D8AA8900EFDFCF00FAF6F300FAF5F300EFDFD100D7A78500BE94
      6C00B37D4600A7855B0000000000000000000000000000000000000000000000
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
      FF003B7DFF00FBF7F400D1976A0000000000000000002FA9DE0036A0C700DEBF
      8A00E2C9A700DFBFAE00F1E3DC00F3F1EC00F4F1EB00F1E2D900DCBAA300DFC3
      9E008CB1A9003DA8D2003CADDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0CCB100FCF9F600CCD1
      AE00E2C6A600E6C2A000E4C09D00E0B99400DDB48D00DBB28900E3B48F00DDAA
      8200DFAE8A00E5BDA000000000000000000000000000ECBF9E00FBF7F40065A4
      FF0064A3FF0060A0FF005D9EFF005899FF005496FF004D90FF00478BFF004284
      FF003D7FFF00FBF7F400D49B6F000000000082D0F10085D4F3006BC7E9003DA5
      C700E2C79200E6D1A900E0C2A600D5AE9600D5AB9200DEBDA000E4CFA600BFC1
      9E0048B3D700ACE3F60049BCEB00000000000000000000000000000000000000
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
      F30085D9F70036BFF20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007FDAF9002EC2
      F60035C4F6000000000000000000000000000000000000000000000000002EC2
      F60036C5F6000000000000000000000000000000000000000000000000000000
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
      E30063C4E30063C4E30062C4E30056C0E0000000000000000000000000000000
      00000000000000000000000000000000000000000000EFC6A800FBF7F400FBF7
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
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFC03FFFFFFFFFC003001FFFFFFFFF
      C003001FC0038001C003001FC0038001C003803FC0038001C003C001C0038001
      C003C000C0038001C003C000C0038001C003C000C0038001C003E001C0038001
      C003F003C0038001C003FE03C0038001C007FE03C00380FFC00FFE03C003FFFF
      C01FFF03FFFFFFFFFFFFFF87FFFFFFFFF800FFFFCFF3FFFFF8008001C003FE3F
      E0008001E007FC1FE0008001C003F80F80008001C003E203800080018001E207
      800080018001C603800080018001840080008001800104008000800180018E00
      800080018001C001800380018001ED5F800380010001ED47800F80010001ED57
      800F80018003C447FFFFFFFFC7E7FFFFFFFFFFFFE187FFFF80010000C183FFFF
      80010000C00380018BB90000E007800180010000F00F80018B990000F00F8001
      80010000000080018BB900000000800180010000000080018BB90000300C8001
      80010000F00F80019FF90000E007800180010000C00380FF80010000C183FFFF
      80010000E187FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object puLength: TPopupMenu
    Tag = 3
    Left = 945
    Top = 80
    object miLengthShowAll: TMenuItem
      Caption = '.'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = miLengthShowAllClick
    end
    object miLengthNonZero: TMenuItem
      Caption = '.'
      GroupIndex = 1
      RadioItem = True
      OnClick = miLengthNonZeroClick
    end
  end
end
