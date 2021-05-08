object FrameSearch: TFrameSearch
  Left = 0
  Top = 0
  Width = 1338
  Height = 741
  TabOrder = 0
  object pMainSearch: TPanel
    Left = 0
    Top = 0
    Width = 1338
    Height = 741
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    OnResize = pMainSearchResize
    object pSearchChart: TPanel
      Left = 1
      Top = 45
      Width = 1336
      Height = 695
      Align = alClient
      BevelEdges = []
      BevelOuter = bvNone
      TabOrder = 1
      object pSearchResults: TPanel
        Left = 0
        Top = 0
        Width = 1201
        Height = 695
        Align = alClient
        BevelEdges = []
        BevelOuter = bvNone
        Caption = 'pSearchResults'
        TabOrder = 0
        object pSearchNavigation: TPanel
          Left = 0
          Top = 575
          Width = 1201
          Height = 120
          Align = alBottom
          BevelEdges = []
          BevelOuter = bvNone
          FullRepaint = False
          TabOrder = 0
          DesignSize = (
            1201
            120)
          object lShowing: TLabel
            Left = 112
            Top = 94
            Width = 12
            Height = 13
            Caption = '...'
          end
          object lPageNumber: TLabel
            Left = 72
            Top = 94
            Width = 6
            Height = 13
            Caption = '1'
          end
          object W7NavigationFrame4: TW7NavigationFrame
            Left = 0
            Top = 89
            Width = 67
            Height = 26
            Opacity = 200
          end
          object lSPagePrevious: TW7NavigationButton
            Left = 5
            Top = 89
            Width = 24
            Height = 24
            Direction = ndBackward
            FadeInInterval = 17
            FadeOutInterval = 17
            Enabled = False
            ParentFont = False
            OnClick = lSPagePreviousClick
          end
          object lSPageNext: TW7NavigationButton
            Left = 36
            Top = 89
            Width = 24
            Height = 24
            FadeInInterval = 17
            FadeOutInterval = 17
            Enabled = False
            ParentFont = False
            OnClick = lSPageNextClick
          end
          object capacitySearch: TAdvSmoothCapacityBar
            Left = -1
            Top = 0
            Width = 1197
            Height = 83
            AntiAlias = aaAntiAlias
            Anchors = [akLeft, akTop, akRight]
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
            Appearance.CapacityTextShadowColor = clGray
            Appearance.LegendTextShadowColor = clSilver
            Items = <>
            CapacityDescription = ' '
            FreeDescription = 'NO'
            TotalCapacity = 100.000000000000000000
            ExplicitWidth = 1027
          end
          object sbSearchThing: TSpeedButton
            Tag = 1
            Left = 1167
            Top = 89
            Width = 26
            Height = 22
            Anchors = [akTop, akRight]
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
            OnClick = sbSearchThingClick
            ExplicitLeft = 997
          end
        end
        object sgSearchResults: TAdvStringGrid
          Tag = 1
          Left = 0
          Top = 0
          Width = 1201
          Height = 575
          Cursor = crDefault
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
          PopupMenu = puSearch
          ScrollBars = ssBoth
          TabOrder = 1
          OnDrawCell = sgSearchResultsDrawCell
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          OnCanSort = sgSearchResultsCanSort
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
            64)
          RowHeights = (
            17
            17)
        end
      end
      object pSearchGraph: TPanel
        Left = 1201
        Top = 0
        Width = 135
        Height = 695
        Align = alRight
        BevelEdges = []
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        object guageSearchQuantity: TGauge
          Left = 6
          Top = 4
          Width = 122
          Height = 122
          BackColor = 16119285
          BorderStyle = bsNone
          ForeColor = 8833783
          Progress = 0
        end
        object lPSearchQuantity: TLabel
          Left = 6
          Top = 132
          Width = 4
          Height = 13
          Caption = '.'
        end
        object guageSearchSize: TGauge
          Left = 5
          Top = 151
          Width = 122
          Height = 122
          BackColor = 16119285
          BorderStyle = bsNone
          ForeColor = 8833783
          Progress = 0
        end
        object lPSearchSize: TLabel
          Left = 6
          Top = 279
          Width = 4
          Height = 13
          Caption = '.'
        end
        object sbSaveSearch: TSpeedButton
          Left = 106
          Top = 302
          Width = 23
          Height = 22
          Hint = 'save search results'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C21E0000C21E00000000000000000000D8AB8ECD9570
            BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
            31A76132AB693CBC8661C37D4FEBC6ADEAC5ADFEFBF8FEFBF8FEFBF8FEFBF8FE
            FBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8C89A7CC79879AD6B40BA6C38EDCAB3
            E0A27AFEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
            F6CA8D65C99B7CA76132BB6C38EECCB6E1A27AFEFAF7BFDCC2BFDCC2BFDCC2BF
            DCC2BFDCC2BFDCC2BFDCC2BFDCC2FDF9F6CD9068CC9E81A86132BB6B38EFCEB8
            E1A279FEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
            F6CF936ACEA384AA6132BA6A36EFD0BBE2A27AFEFBF8FEFBF8FEFBF8FEFBF8FE
            FBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8D3966DD2A78AAB6232BB6A36F0D2BE
            E2A37AE2A37AE1A37AE2A37BE1A37BE0A178DE9F77DD9F76DC9D74D99B72D899
            71D69970D5AB8EAD6333BB6A36F2D5C2E3A37AE3A37AE2A37BE2A37BE2A47BE1
            A279E0A178DEA077DE9E75DC9D74DA9B73D99B73DAB095AF6433BB6A36F2D8C5
            E3A47BE3A37AE3A47AE2A47BE2A37BE1A37BE1A279DFA077DE9F76DD9E74DB9C
            72DC9D74DDB59AB16534BB6B36F4D9C7E6A67DC88C64C98D65C98E67CB926CCB
            926DCA9069C88C65C88C64C88C64C88C64DA9C74E1BA9FB36634BB6C37F4DCC9
            E7A77DF9ECE1F9ECE1F9EDE3FCF4EEFDFAF7FDF7F3FAEDE5F7E7DBF7E5D9F6E5
            D8DEA077E4BEA4B46734BD6E3AF5DDCCE7A87EFAF0E8FAF0E8C98D66FAF0E9FD
            F8F3FEFAF8FCF4EFF9E9DFF7E7DBF7E5D9E0A278E7C2A9B66835C07442F6DFD0
            E8A87EFCF6F1FCF6F1C88C64FAF1E9FBF4EEFDFAF7FDF9F6FAF0E8F8E8DDF7E6
            DBE1A37AEFD5C3B76A36C68255F6DFD1E9AA80FEFAF6FDFAF6C88C64FBF3EEFB
            F1EAFCF6F2FEFBF8FCF6F1F9ECE2F8E7DBEED0BAECD0BDBD7443D6A585F6E0D1
            F7E0D1FEFBF8FEFBF7FDF9F6FCF5F0FAF0EAFBF2EDFDF9F6FDFAF7FBF1EBF8E9
            DFECD1BECD926AE2C5B1E1BDA6D9AB8DC9895EC07543BD6E3ABB6C37BB6B36BB
            6A36BB6A36BC6C39BD6E3BBB6D3ABF7444C98D65E7CEBCFFFFFF}
          OnClick = sbSaveSearchClick
        end
        object sbSCAccessed: TSpeedButton
          Left = 6
          Top = 302
          Width = 23
          Height = 22
          Hint = 'show file accessed date'
          Flat = True
          OnClick = sbSCAccessedClick
        end
        object sbSCModified: TSpeedButton
          Tag = 1
          Left = 31
          Top = 302
          Width = 23
          Height = 22
          Hint = 'show file modified date'
          Flat = True
          OnClick = sbSCAccessedClick
        end
        object sbSCOwner: TSpeedButton
          Tag = 2
          Left = 54
          Top = 302
          Width = 23
          Height = 22
          Hint = 'show file owner'
          Flat = True
          OnClick = sbSCAccessedClick
        end
        object sbSCAttributes: TSpeedButton
          Tag = 3
          Left = 77
          Top = 302
          Width = 23
          Height = 22
          Hint = 'show file attributes'
          Flat = True
          OnClick = sbSCAccessedClick
        end
        object cbSearchShowPath: TAdvOfficeCheckBox
          Left = 6
          Top = 340
          Width = 124
          Height = 20
          Hint = 'include full path of file in search results'
          TabOrder = 0
          OnClick = cbSearchShowPathClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
        object cbSearchColourCode: TAdvOfficeCheckBox
          Left = 6
          Top = 365
          Width = 124
          Height = 20
          TabOrder = 1
          OnClick = cbSearchColourCodeClick
          Alignment = taLeftJustify
          Caption = '.'
          ReturnIsTab = False
          Version = '1.4.1.1'
        end
      end
    end
    object pSearch: TPanel
      Left = 1
      Top = 1
      Width = 1336
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      FullRepaint = False
      TabOrder = 0
      DesignSize = (
        1336
        44)
      object sbGoSearch: TSpeedButton
        Left = 24
        Top = 0
        Width = 23
        Height = 22
        Hint = 'execute search'
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFEE7EE
          F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFD6494BA2267
          9D81A8C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCFCFC9B9B9B737373ADADADFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFCFD6F9CC2558DBC89B5
          DD185F97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFCFCFCA4A4A4979797BDBDBD6C6C6CFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFD7BA4CA6497C59DC1E46699
          C73171A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFCFCABABABA1A1A1C8C8C8A3A3A37D7D7DFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEE8CFBADBB292D3A680D0A17CD2A685AEA19975A2CCABCBE876A4CE407B
          AFDEE8F1FFFFFFFFFFFFFFFFFFFFFFFFFEFEFECDCDCDAFAFAFA2A2A29E9E9EA3
          A3A3A0A0A0ABABABD1D1D1ACACAC878787EAEAEAFFFFFFFFFFFFFFFFFFFFFEFE
          E8CAB0E8C9AEF5E1CDF7E5D3F7E5D1F3DDC8DFBA9CC7A89186AED55087BBE1EA
          F3FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C7C6C6C6DEDEDEE3E3E3E2E2E2DA
          DADAB7B7B7A6A6A6B6B6B6939393ECECECFFFFFFFFFFFFFFFFFFFFFFFFF1DBC8
          EDD0B7F8E8D9F5DEC8F3D8BDF3D6BBF4DBC2F7E4D2DFBB9DA09795E3ECF5FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9CDCDCDE6E6E6DBDBDBD4D4D4D2D2D2D8
          D8D8E2E2E2B7B7B7989898EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEECEB2
          F7E7D7F6E1CCF4DBC2F4DAC0F3D8BDF3D7BBF4DBC2F3DEC9D2A887FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCBE5E5E5DEDEDED8D8D8D7D7D7D4D4D4D3
          D3D3D8D8D8DBDBDBA5A5A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CEAF
          F9ECDFF5DFC8F5DDC6F4DCC3F4DAC1F3D9BEF3D7BDF8E6D3D3A680FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFCACACAEAEAEADCDCDCDADADAD9D9D9D7D7D7D5
          D5D5D4D4D4E3E3E3A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D3B5
          F9EDE1F6E1CCF5DFC9F5DEC7F4DCC4F4DBC2F4DAC0F8E7D6D7AB87FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFECECECDEDEDEDCDCDCDBDBDBD9D9D9D8
          D8D8D7D7D7E5E5E5A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8DBC1
          F9EBDEF7E7D6F6E1CCF5E0CAF5DEC8F5DDC5F6E1CBF5E2D0DFB999FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D8E9E9E9E5E5E5DEDEDEDDDDDDDBDBDBDA
          DADADEDEDEE0E0E0B5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEAD8
          F8E2CCFAEEE3F7E7D6F6E2CEF6E1CBF6E3D0F9EADDECCFB5ECD4BFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E8DFDFDFEDEDEDE5E5E5DFDFDFDEDEDEE0
          E0E0E9E9E9CCCCCCD2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FBE4CEF9E2CDFAECDEF9EEE2F9EDE2F8E9DAF0D5BDEDD0B7FFFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1DFDFDFEAEAEAEDEDEDECECECE7
          E7E7D2D2D2CDCDCDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFCEAD9FADDC2F6D6B9F4D3B5F3D4B8F5E0CDFFFFFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E8D9D9D9D2D2D2CFCFCFD1
          D1D1DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        OnClick = sbGoSearchClick
      end
      object sbQuickSearch: TSpeedButton
        Tag = 1
        Left = 1
        Top = 0
        Width = 23
        Height = 22
        Hint = 'quick search options'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
          FFFFFFB1E0F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABD2
          EDF9FCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF32B0DF30ADDE87CEEBFFFFFFFF
          FFFFFFFFFFFFFFFF9ACDEB2290D30D81CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF44B8E350CBEF39B7E52AA9DD73C5E782CAEA269ED92AA3DD39AEE5198C
          D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5BC3E74DCAEE54CEF150C8EF40
          BAE839B5E546BDEB44BAEB3EB3E82C9AD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF7AD0EC49C8EC49CCF131C3ED42C4EE46C3ED2CB6EA26B1E83CB4E746AB
          DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BDCF144C6EA57D2F227C2ED23
          BDEC1FB7EA1BB3E936B9EA3AB3E667BDE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F5FCFE46C2E659D5F246D0F229C4EE25C0ED22BBEB1DB6E921B4E946BDEB2AA7
          DBE6F4FBFFFFFFFFFFFFFFFFFFFAFEFE4DC8E94ACEED5EDBF530CDF12CC8EF27
          C3EE24BEEC20B8EA1CB4E949C0EC37B2E42DA8DDEBF7FCFFFFFFFFFFFF54CEEB
          4CD2EE63E1F641D6F432CFF22ECBF02AC6EF26C1ED22BCEB1FB7EA20B4E947BE
          EC36B2E432ABDDEFF8FC5ED3EE4DD5EF58DCF25EDEF560DEF55FDCF648D4F32D
          C9EF29C4EE35C4ED50C9EF4CC4EE45BEEB3DB7E733B0E236ADDEF6FDFEB6EBF7
          7FDCF15BD0ED42C7E949CEED5BD9F447D3F23ACBF055CFF13EBFE835B7E24BBC
          E46EC8E9A3DBF1E6F5FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9CE2F349CEED5D
          D9F459D6F343C5EA79D1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF47CAEA56D6F259D6F33AC0E6FAFDFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCECF748
          CEED48CDED9BE0F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58D1EC47CBEAFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
          F5FBC1EEF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = sbQuickSearchClick
      end
      object sbSearchSyntax: TSpeedButton
        Left = 1306
        Top = 2
        Width = 23
        Height = 22
        Hint = 'show floating search syntax window'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000FFFFFFBE9E89
          94603D93603C925F3B925E3A915D39905D38905C388F5B378F5A368E5A35B18C
          73FFFFFFFFFFFFFFFFFFFFFFFFA17456CCAB85D1AF89D2B088D1AD85D0AA81CF
          A77FCEA47BCDA17ACB9F77C7997193613E8F7F73FFFFFFFFFFFFFFFFFFA27556
          CAA985A37854C69A67C49862C2945EC1905AC08C56BE8953BF8855C99D759362
          3F695341FFFFFFFFFFFFFFFFFFA27657CBAC88A67E57C99F6EC79D69C69966C3
          9761C2925CC18F59C18E5BCAA178946240573E2AFFFFFFFFFFFFFFFFFFA37759
          CEB08EAA855BCBA475CAA271C89E6BC69B68C59963C2945EC49461CCA57D9463
          41573E2AFFFFFFFFFFFFFFFFFFA4785AD0B492AF8B60CEA97CCCA677CBA374C9
          A06EC79D6AC69A66C69B68CDA882956442573E2AFFFFFFFFFFFFFFFFFFA5795B
          D2B796B49265D1AE83CFAB7FCDA87ACBA576CAA271C89E6DC89F6DD0AE869665
          44573E2AFFFFFFFFFFFFFFFFFFA57A5CD5BB9BB89A69D4B38AD2AF87D0AD82CF
          AA7DCDA678CBA474CCA475D2B18A976745573E2AFFFFFFFFFFFFFFFFFFA67B5D
          D7BF9FBD9F6FD4B590CBAD88C7A881C6A57DC4A17AC5A176CBA77BD4B4909868
          46573E2AFFFFFFFFFFFFFFFFFFA77C5ED9C2A4C1A472D2B894F5EDE4F4ECE2F4
          ECE1F4EBE0F3EADFCBA97FD6B896996947573E2AFFFFFFFFFFFFFFFFFFA77C5E
          DBC5A6C6A776D9BF9BD1B793CBB08ECAAE8AC8AB87CBAB83D1B087D8BB9B996A
          48573E2AFFFFFFFFFFFFFFFFFFA87C5FDDC8A9D4BD95E6D4B9E6D1B6E4D0B5E3
          CEB3E2CBB0E0C9ADDFC7A9DABFA09A6B4A573E2AFFFFFFFFFFFFFFFFFFA87E61
          D9C2A5B59170AB805FA97E5EA97E5EA87D5CA87C5BA77B5AA679599C6B499664
          41573E2AFFFFFFFFFFFFFFFFFFAF886DBA9778D8C5B9E8DED7E7DDD6E6DCD6E4
          DBD4E3DAD3E2D8D1E1D7D0EBE7E5EFEFEF573E2AFFFFFFFFFFFFFFFFFFC7AC99
          9D6E4CBB9778AC8262AC8161AB8060AB7F5FAA7F5EA87E5DA87C5C9D6D4C9766
          43885C3CFFFFFFFFFFFFFFFFFFEFE7E1AD8469B38E749D6C4B9C6C4A9C6B499B
          6A499B6A489A6947996846986745936443947257FFFFFFFFFFFF}
        OnClick = sbSearchSyntaxClick
        ExplicitLeft = 1118
      end
      object sbSearchHelp: TSpeedButton
        Left = 1279
        Top = 2
        Width = 23
        Height = 22
        Hint = 'help'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4ECE5D6BAA2B6845AAC
          7445AB7243B27E53D2B59CF2EAE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE7D5C6BA895FD7BBA3E9DACAECE0D1ECE0D1E8D8C8D3B59CB07A4DE2CF
          BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAD9CBBE8C62E7D5C4E5D2BFC9A685B8
          8E67B68A65C5A180E0CCBAE3D0BEAF7648E3D0C0FFFFFFFFFFFFFFFFFFF7F1EC
          C99D79EAD8C9E3CDBAC0946BBA8C62CFB094CFB094B7895FB28761DAC0AAE4D1
          C0B68359F4ECE6FFFFFFFFFFFFE6CFBCE4CCB9EAD6C5C79971BF9066BF9066F7
          F1ECF6F0EAB7895FB7895FB58963E2CEBBD9BDA6D9BEA7FFFFFFFFFFFFD9B395
          EFE1D3D9B595C7986CC39569C19367BF9066BF9066BB8B63B98A63B88A62CBA7
          86EADCCCC2956FFFFFFFFFFFFFDAB393F2E4D9D1A57AC5996BC4976AC49669FA
          F6F2F3EAE1C2956DBE8F65BE8F64C0956DEFE3D5C19067FFFFFFFFFFFFE1BB9D
          F2E5DAD1A67ECC9D71C79A6CC5986BE2CCB6F8F3EEF6EEE8D9BDA1C29468C59B
          71F0E2D6C79971FFFFFFFFFFFFEACAB0F3E5D9DFBB9ECFA075CD9E72F5EBE3E4
          CBB4E7D3BFFBF8F6E5D3BFC4986BD6B491EEE0D2D3AC8BFFFFFFFFFFFFF5E4D6
          F4E3D4EFDCCDD5A87ED0A077FBF8F5FCF8F5FCF8F5FBF8F5D1A881CFA47BEAD5
          C3EAD4C2E9D4C2FFFFFFFFFFFFFDF9F5F1D3BBF6E9DDECD8C6D7AC81DCBB9AF6
          ECE3F5ECE2E4C8AED2A77BE6CEBAF1E2D5DFBB9CFAF4F0FFFFFFFFFFFFFFFFFF
          FBF1E9F3D4BBF7EADFEEDED0E3C1A7D8AE89D7AC86DDBB9CEBD6C7F3E6D9E4C1
          A3F5E9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF2EAF6DAC3F9E9DCF6E8DDF3
          E5DAF3E5DAF5E7DCF5E4D6EDCDB4F8ECE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFAF7FCEDE1F8DEC9F6D9C1F5D7BFF5D9C3F8E8DCFDF8F5FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = sbSearchHelpClick
        ExplicitLeft = 1091
      end
      object lSearchDetails: THTMLabel
        Left = 4
        Top = 29
        Width = 1197
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        HTMLText.Strings = (
          '.')
        Transparent = True
        Version = '1.9.2.6'
        ExplicitWidth = 1013
      end
      object eSearch: TComboBox
        Left = 53
        Top = 1
        Width = 1212
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = eSearchChange
        OnKeyPress = eSearchKeyPress
      end
    end
  end
  object puSearch: TPopupMenu
    Left = 962
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
  object puQuickSearch: TPopupMenu
    Left = 641
    Top = 64
  end
end
