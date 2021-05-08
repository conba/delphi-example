object FrameNavigation: TFrameNavigation
  Left = 0
  Top = 0
  Width = 1317
  Height = 704
  TabOrder = 0
  object pMainNavigation: TPanel
    Left = 0
    Top = 0
    Width = 1317
    Height = 704
    Align = alClient
    Color = clWhite
    FullRepaint = False
    ParentBackground = False
    TabOrder = 0
    object Splitter4: TAdvSplitter
      Left = 329
      Top = 1
      Height = 702
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = clWhite
      Appearance.ColorTo = clSilver
      Appearance.ColorHot = clWhite
      Appearance.ColorHotTo = clGray
      GripStyle = sgDots
      ExplicitLeft = 368
      ExplicitTop = 320
      ExplicitHeight = 100
    end
    object Panel25: TPanel
      Left = 1
      Top = 1
      Width = 328
      Height = 702
      Align = alLeft
      TabOrder = 0
      OnResize = Panel25Resize
      object sgNavigation: TAdvStringGrid
        Tag = 4
        Left = 1
        Top = 27
        Width = 326
        Height = 674
        Cursor = crDefault
        Align = alClient
        ColCount = 17
        DefaultRowHeight = 18
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnDblClick = sgNavigationDblClick
        OnDrawCell = sgNavigationDrawCell
        GridLineColor = 15527152
        GridFixedLineColor = 13947601
        HoverRowCells = [hcNormal, hcSelected]
        OnCanSort = sgNavigationCanSort
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
        FixedRowHeight = 18
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
        MouseActions.DisjunctRowSelect = True
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
          64
          64
          64
          64
          64
          64
          64)
        RowHeights = (
          18
          18)
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 326
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 1
        object sbNMCreated: TSpeedButton
          Tag = 16
          Left = 2
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNMAccessed: TSpeedButton
          Tag = 17
          Left = 26
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNMModified: TSpeedButton
          Tag = 18
          Left = 50
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNMUsers: TSpeedButton
          Tag = 19
          Left = 74
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNMAttributes: TSpeedButton
          Tag = 20
          Left = 98
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNMColourCode: TSpeedButton
          Left = 146
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMColourCodeClick
        end
        object sbNMSizeOnDisk: TSpeedButton
          Tag = 21
          Left = 122
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNLFilter: TSpeedButton
          Left = 180
          Top = 2
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
          OnClick = sbNLFilterClick
        end
      end
    end
    object Panel26: TPanel
      Left = 332
      Top = 1
      Width = 984
      Height = 702
      Align = alClient
      TabOrder = 1
      OnResize = Panel26Resize
      object Splitter5: TAdvSplitter
        Left = 1
        Top = 368
        Width = 982
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
        ExplicitTop = 369
        ExplicitWidth = 811
      end
      object Panel27: TPanel
        Left = 1
        Top = 1
        Width = 982
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 1
        DesignSize = (
          982
          26)
        object sbNavigationBack: TSpeedButton
          Left = 1
          Top = 2
          Width = 23
          Height = 22
          Enabled = False
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFB037B1E007D21FBFD
            FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFDFDFD6A6A6A6C6C6CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FCFA33954C43A15F06852FFFFF
            FFF9FCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFCFCFC858585929292747474FFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF04802546A36280C1963A9F5E0F8B
            3B158F431D924A239852FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF6F6F6F949494B6B6B69090907A7A7A7E7E7E828282888888FFFFFF6EACE4
            4796DD2F88D82D88D82D88D82D89D40D833B48A56682C2976AB68588C59E8AC6
            A18DC8A590CAA9299B5BFFFFFFB8B8B8A7A7A79C9C9C9C9C9C9C9C9C9B9B9B73
            7373969696B7B7B7A9A9A9BABABABCBCBCBEBEBEC0C0C08B8B8BFFFFFF4799DD
            DEF1FAA8DDF49EDBF496DAF30180263CA05C83C29867B58261B38066B6856BB8
            896FBA8E94CDAD319F63FFFFFFA8A8A8F2F2F2E0E0E0DEDEDEDDDDDD6F6F6F90
            9090B7B7B7A8A8A8A5A5A5A9A9A9ABABABAEAEAEC4C4C4909090FFFFFF3B97DB
            EFFAFEA1E9F991E5F881E1F772DEF608873846A5688AC7A174BC9090CBA891CB
            AA94CDAD96CEB037A36BFFFFFFA7A7A7FBFBFBEAEAEAE6E6E6E2E2E2DFDFDF77
            7777969696BCBCBCB0B0B0C1C1C1C1C1C1C4C4C4C6C6C6949494FFFFFF3C9DDB
            F2FAFDB3EDFAA4E9F995E6F885E2F776DEF61A91484FAB7491CBAA55AF7C309E
            6334A26938A46F3DA56FFFFFFFABABABFBFBFBEEEEEEEAEAEAE7E7E7E3E3E3E0
            E0E08080809D9D9DC1C1C1A2A2A28F8F8F939393969696979797FFFFFF3BA3DB
            F6FCFEC8F2FCB9EFFBACECFA9CE8F98BE3F77CE0F62898575AB38134A46E44D3
            F3D0F3FC38A1DBF3FCFEFFFFFFAEAEAEFDFDFDF3F3F3EFEFEFECECECE9E9E9E4
            E4E4E1E1E1888888A6A6A6969696D6D6D6F3F3F3ADADADFCFCFCFFFFFF3BA8DB
            FEFFFFF8FDFFF6FDFFF5FCFFF3FCFED8F6FC94E6F885E3F7319F653CA8765CD8
            F4D7F4FC3AA7DBFFFFFFFFFFFFB2B2B2FFFFFFFEFEFEFEFEFEFDFDFDFCFCFCF6
            F6F6E7E7E7E4E4E49090909A9A9ADADADAF5F5F5B1B1B1FFFFFFFFFFFF39ADDB
            E8F6FB94D4EF88CEEE73C1E9C9E9F6F2FCFEF3FCFEF2FCFEF0FCFEEFFBFEEEFB
            FEFEFFFF36ABDAFFFFFFFFFFFFB5B5B5F7F7F7D8D8D8D3D3D3C8C8C8EBEBEBFC
            FCFCFCFCFCFCFCFCFCFCFCFBFBFBFBFBFBFFFFFFB3B3B3FFFFFFFFFFFF40AEDC
            F1FAFD94DEF593DCF481D5F26ACAED6CCBEA85D3EF80D2EF7AD0EF76CFEE72CF
            EEE9F7FB34AEDAFFFFFFFFFFFFB6B6B6FBFBFBE0E0E0DEDEDED9D9D9CFCFCFCF
            CFCFD6D6D6D6D6D6D4D4D4D3D3D3D3D3D3F7F7F7B5B5B5FFFFFFFFFFFF41B4DC
            F7FCFE8EE4F891DEF59FE0F5ACE1F6EFFBFEF4FDFEF3FCFEF1FCFEEFFBFEEEFB
            FEFAFDFF3CB1DBFFFFFFFFFFFFBABABAFDFDFDE5E5E5E0E0E0E2E2E2E4E4E4FB
            FBFBFDFDFDFCFCFCFCFCFCFBFBFBFBFBFBFEFEFEB7B7B7FFFFFFFFFFFF3CB5DB
            FDFEFEFEFFFFFEFEFFFDFEFFFEFFFFEAF7FB6EC8E56FC9E46FC9E46FC9E479CD
            E676CBE58CD3EAFFFFFFFFFFFFBABABAFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFF8
            F8F8CBCBCBCCCCCCCCCCCCCCCCCCD0D0D0CECECED6D6D6FFFFFFFFFFFF59C2E0
            61C3E263C4E363C4E363C4E35FC3E240B7DCEDF8FCF3FAFDF3FAFDF3FAFDF3FA
            FDF3FBFDFCFEFEFFFFFFFFFFFFC5C5C5C7C7C7C8C8C8C8C8C8C8C8C8C7C7C7BC
            BCBCF9F9F9FBFBFBFBFBFBFBFBFBFBFBFBFCFCFCFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = sbNavigationBackClick
        end
        object sbNSBCreated: TSpeedButton
          Tag = 22
          Left = 34
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNSBAccessed: TSpeedButton
          Tag = 23
          Left = 58
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNSBModified: TSpeedButton
          Tag = 24
          Left = 82
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNSBUsers: TSpeedButton
          Tag = 25
          Left = 106
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNSBAttributes: TSpeedButton
          Tag = 26
          Left = 130
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNSBColourCode: TSpeedButton
          Tag = 7
          Left = 178
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNSBColourCodeClick
        end
        object sbNSBSizeOnDisk: TSpeedButton
          Tag = 27
          Left = 154
          Top = 2
          Width = 23
          Height = 22
          Flat = True
          NumGlyphs = 2
          OnClick = sbNMCreatedClick
        end
        object sbNRFilter: TSpeedButton
          Tag = 1
          Left = 210
          Top = 2
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
          OnClick = sbNLFilterClick
        end
        object lNavigationDetails: THTMLabel
          Left = 242
          Top = 6
          Width = 730
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          HTMLText.Strings = (
            '...')
          Transparent = True
          Version = '1.9.2.6'
          ExplicitWidth = 559
        end
      end
      object sgNavigationSide: TAdvStringGrid
        Tag = 5
        Left = 1
        Top = 27
        Width = 982
        Height = 341
        Cursor = crDefault
        Align = alTop
        ColCount = 17
        DefaultRowHeight = 18
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        ParentShowHint = False
        ScrollBars = ssBoth
        ShowHint = True
        TabOrder = 0
        OnDblClick = sgNavigationSideDblClick
        OnDrawCell = sgNavigationSideDrawCell
        GridLineColor = 15527152
        GridFixedLineColor = 13947601
        HoverRowCells = [hcNormal, hcSelected]
        OnCanSort = sgNavigationCanSort
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
        FixedColWidth = 28
        FixedRowHeight = 18
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
        MouseActions.DisjunctRowSelect = True
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
        ExplicitLeft = 2
        ExplicitTop = 24
        ColWidths = (
          28
          148
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
          64
          64
          64
          64
          64)
        RowHeights = (
          18
          18)
      end
      object vtcFSMain: TChart
        Left = 1
        Top = 371
        Width = 982
        Height = 330
        Gradient.Direction = gdBottomTop
        LeftWall.Brush.Gradient.Direction = gdBottomTop
        Legend.LegendStyle = lsValues
        Legend.TextStyle = ltsRightPercent
        MarginBottom = 0
        MarginLeft = 0
        MarginRight = 1
        MarginTop = 0
        MarginUnits = muPixels
        Title.Text.Strings = (
          'TChart')
        DepthAxis.Automatic = False
        DepthAxis.AutomaticMaximum = False
        DepthAxis.AutomaticMinimum = False
        DepthAxis.Maximum = -0.500000000000000000
        DepthAxis.Minimum = -0.500000000000000000
        DepthTopAxis.Automatic = False
        DepthTopAxis.AutomaticMaximum = False
        DepthTopAxis.AutomaticMinimum = False
        DepthTopAxis.Maximum = -0.500000000000000000
        DepthTopAxis.Minimum = -0.500000000000000000
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        RightAxis.Automatic = False
        RightAxis.AutomaticMaximum = False
        RightAxis.AutomaticMinimum = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Zoom.Allow = False
        Align = alClient
        TabOrder = 2
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series3: TPieSeries
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
          Gradient.Direction = gdDiagonalUp
          Gradient.EndColor = 919731
          Gradient.StartColor = 919731
          Gradient.Visible = True
          OtherSlice.Legend.Visible = False
          PiePen.Visible = False
        end
      end
    end
  end
  object puNavigateOptions: TPopupMenu
    Tag = 1
    Left = 1036
    object miPUNO1: TMenuItem
      Tag = 1
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miPUNO2: TMenuItem
      Tag = 2
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miPUNO3: TMenuItem
      Tag = 3
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miPUNO4: TMenuItem
      Tag = 4
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miPUNO5: TMenuItem
      Tag = 5
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miPUNO6: TMenuItem
      Tag = 6
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miPUNO7: TMenuItem
      Tag = 7
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miPUNO8: TMenuItem
      Tag = 8
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miPUNO9: TMenuItem
      Tag = 9
      Caption = '.'
      GroupIndex = 1
      OnClick = miPUNO1Click
    end
    object miNOCustom: TMenuItem
      Caption = '.'
      GroupIndex = 1
      object miPUNO10: TMenuItem
        Tag = 10
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO11: TMenuItem
        Tag = 11
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO12: TMenuItem
        Tag = 12
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO13: TMenuItem
        Tag = 13
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO14: TMenuItem
        Tag = 14
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO15: TMenuItem
        Tag = 15
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO16: TMenuItem
        Tag = 16
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO17: TMenuItem
        Tag = 17
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO18: TMenuItem
        Tag = 18
        Caption = '.'
        OnClick = miPUNO1Click
      end
      object miPUNO19: TMenuItem
        Tag = 19
        Caption = '.'
        OnClick = miPUNO1Click
      end
    end
  end
  object puCharts: TPopupMenu
    Left = 1124
    Top = 16
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
    end
    object miCOCopy: TMenuItem
      Caption = '.'
      ImageIndex = 50
    end
    object miCOAdvanced: TMenuItem
      Caption = '.'
      ImageIndex = 53
    end
    object N30: TMenuItem
      Caption = '-'
    end
    object miCGradientFrom: TMenuItem
      Caption = '.'
      object miCGradientFromSelect: TMenuItem
        Caption = '.'
        ImageIndex = 55
      end
      object miCGradientFromSelect1: TMenuItem
        Tag = 1
        Caption = '.'
        ImageIndex = 56
      end
      object miCGradientFromSelect2: TMenuItem
        Tag = 2
        Caption = '.'
        ImageIndex = 57
      end
      object miCGradientFromSelect3: TMenuItem
        Tag = 3
        Caption = '.'
        ImageIndex = 58
      end
      object miCGradientFromSelect4: TMenuItem
        Tag = 4
        Caption = '.'
        ImageIndex = 59
      end
      object miCGradientFromSelect5: TMenuItem
        Tag = 5
        Caption = '.'
        ImageIndex = 60
      end
      object miCGradientFromSelect6: TMenuItem
        Tag = 6
        Caption = '.'
        ImageIndex = 61
      end
      object miCGradientFromSelect7: TMenuItem
        Tag = 7
        Caption = '.'
        ImageIndex = 62
      end
      object miCGradientFromSelect8: TMenuItem
        Tag = 8
        Caption = '.'
        ImageIndex = 63
      end
      object miCGradientFromSelect9: TMenuItem
        Tag = 9
        Caption = '.'
        ImageIndex = 64
      end
      object miCCustomFrom: TMenuItem
        Caption = '.'
      end
    end
    object miCGradientTo: TMenuItem
      Caption = '.'
      object miCGradientToSelect: TMenuItem
        Caption = '.'
        ImageIndex = 55
      end
      object miCGradientToSelect1: TMenuItem
        Tag = 1
        Caption = '.'
        ImageIndex = 56
      end
      object miCGradientToSelect2: TMenuItem
        Tag = 2
        Caption = '.'
        ImageIndex = 57
      end
      object miCGradientToSelect3: TMenuItem
        Tag = 3
        Caption = '.'
        ImageIndex = 58
      end
      object miCGradientToSelect4: TMenuItem
        Tag = 4
        Caption = '.'
        ImageIndex = 59
      end
      object miCGradientToSelect5: TMenuItem
        Tag = 5
        Caption = '.'
        ImageIndex = 60
      end
      object miCGradientToSelect6: TMenuItem
        Tag = 6
        Caption = '.'
        ImageIndex = 61
      end
      object miCGradientToSelect7: TMenuItem
        Tag = 7
        Caption = '.'
        ImageIndex = 62
      end
      object miCGradientToSelect8: TMenuItem
        Tag = 8
        Caption = '.'
        ImageIndex = 63
      end
      object miCGradientToSelect9: TMenuItem
        Tag = 9
        Caption = '.'
        ImageIndex = 64
      end
      object miCCustomTo: TMenuItem
        Caption = '.'
      end
    end
    object N32: TMenuItem
      Caption = '-'
    end
    object miCToggleGradient: TMenuItem
      Caption = '.'
    end
  end
  object XFNImages: TImageList
    Left = 386
    Top = 41
    Bitmap = {
      494C01010100A402780610001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      00000000000000000000000000000000000000000000A2CAEE0076B2E6003E91
      DB00348CD900348CD900348CD900348CD900348CD900348CD900348CD900348C
      D900348BD900398FDA0085B9E900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004799DD00DEF1FA00A8DD
      F4009EDBF40096DAF3008ED8F30086D7F3007FD4F20079D3F20072D2F1006CD0
      F10069CFF100C2EAF8003F95DB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003B97DB00EFFAFE00A1E9
      F90091E5F80081E1F70072DEF60063DAF50054D7F40047D3F30039D0F2002ECD
      F10026CBF000CAF2FB003B97DB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003C9DDB00F2FAFD00B3ED
      FA00A4E9F90095E6F80085E2F70076DEF60065DBF50057D7F40049D4F3003BD1
      F20030CEF100CCF2FB003B9BDB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003BA3DB00F6FCFE00C8F2
      FC00B9EFFB00ACECFA009CE8F9008BE3F7007CE0F6006CDCF6005DD9F5004FD6
      F40044D3F300D0F3FC003BA2DB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003BA8DB00FEFFFF00F8FD
      FF00F6FDFF00F5FCFF00F3FCFE00D8F6FC0094E6F80085E3F70076DFF60068DB
      F5005CD8F400D7F4FC003BA7DB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039ADDB00E8F6FB0094D4
      EF0088CEEE0073C1E900C9E9F600F2FCFE00F3FCFE00F2FCFE00F0FCFE00EFFB
      FE00EEFBFE00FEFFFF003CAEDB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040AEDC00F1FAFD0094DE
      F50093DCF40081D5F2006ACAED006CCBEA0085D3EF0080D2EF007AD0EF0076CF
      EE0072CFEE00E9F7FB003EB2DC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000041B4DC00F7FCFE008EE4
      F80091DEF5009FE0F500ACE1F600EFFBFE00F4FDFE00F3FCFE00F1FCFE00EFFB
      FE00EEFBFE00FAFDFF0058BCE000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003CB5DB00FDFEFE00FEFF
      FF00FEFEFF00FDFEFF00FEFFFF00EAF7FB006EC8E5006FC9E4006FC9E4006FC9
      E4007DCFE70084D0E800BAE5F200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000059C2E00061C3E20063C4
      E30063C4E30063C4E30062C4E30056C0E000EDF8FC00F3FAFD00F3FAFD00F3FA
      FD00F3FAFD00F3FBFD00FCFEFE00000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      800100000000000080010000000000008001000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object puSearch: TPopupMenu
    Left = 930
    Top = 25
    object miSearchOpen: TMenuItem
      Caption = '.'
      ImageIndex = 1
    end
    object miSearchOpenCustom: TMenuItem
      Caption = '.'
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miExploreDirectory: TMenuItem
      Caption = '.'
      ImageIndex = 4
    end
    object miSFileProperties: TMenuItem
      Caption = '.'
      ImageIndex = 2
    end
    object miGenerateMD5: TMenuItem
      Caption = '.'
      ImageIndex = 48
    end
    object miHexEdit: TMenuItem
      Caption = '.'
      ImageIndex = 54
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object miCopyMenu: TMenuItem
      Caption = '.'
      ImageIndex = 45
      object miCopySelected: TMenuItem
        Caption = '.'
      end
      object miCopyAll: TMenuItem
        Caption = '.'
      end
    end
    object miMoveMenu: TMenuItem
      Caption = '.'
      ImageIndex = 47
      object miMoveSelected: TMenuItem
        Caption = '.'
      end
      object miMoveAll: TMenuItem
        Caption = '.'
      end
    end
    object miDeleteMenu: TMenuItem
      Caption = '.'
      ImageIndex = 46
      object miDeleteSelected: TMenuItem
        Caption = '.'
      end
      object miDeleteAll: TMenuItem
        Caption = '.'
      end
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object miZIP: TMenuItem
      Caption = '.'
      ImageIndex = 51
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object miSearchExportToCB: TMenuItem
      Caption = '.'
      ImageIndex = 50
    end
    object N36: TMenuItem
      Caption = '-'
    end
    object SaveasCSV1: TMenuItem
      Caption = 'Save as CSV'
      ImageIndex = 65
    end
    object SaveasASCII1: TMenuItem
      Caption = 'Save as ASCII'
      ImageIndex = 66
    end
  end
end
