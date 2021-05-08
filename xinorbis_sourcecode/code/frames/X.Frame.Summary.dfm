object frameSummary: TframeSummary
  Left = 0
  Top = 0
  Width = 1068
  Height = 734
  DoubleBuffered = True
  ParentDoubleBuffered = False
  TabOrder = 0
  object pScanSelection: TAdvSmoothTabPager
    Left = 0
    Top = 0
    Width = 1068
    Height = 734
    Fill.Color = 3355443
    Fill.ColorTo = 16571329
    Fill.ColorMirror = clNone
    Fill.ColorMirrorTo = clNone
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 3355443
    Fill.BorderWidth = 0
    Fill.Rounding = 0
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Transparent = False
    Align = alClient
    ActivePage = tsSelectFolder
    Color = 3355443
    TabPosition = tpTopLeft
    TabSettings.StartMargin = 4
    TabReorder = False
    TabOrder = 0
    object tsSelectFolder: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1066
      Height = 706
      Caption = ''
      PageAppearance.Color = clWhite
      PageAppearance.ColorTo = clWhite
      PageAppearance.ColorMirror = clWhite
      PageAppearance.ColorMirrorTo = clWhite
      PageAppearance.GradientType = gtVertical
      PageAppearance.GradientMirrorType = gtVertical
      PageAppearance.BorderColor = 13948116
      PageAppearance.BorderWidth = 0
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
      TabAppearance.BevelColorSelected = 14474202
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object pMainSummary: TPanel
        Left = 2
        Top = 2
        Width = 1062
        Height = 702
        Align = alClient
        BevelOuter = bvNone
        Color = 3355443
        FullRepaint = False
        ParentBackground = False
        TabOrder = 0
        OnClick = lSNoFxClick
        DesignSize = (
          1062
          702)
        object lSNoF: TLabel
          Left = 16
          Top = 60
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSNoFx: TLabel
          Left = 48
          Top = 80
          Width = 4
          Height = 20
          Cursor = crHandPoint
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lSNoFxClick
        end
        object lSNoD: TLabel
          Left = 16
          Top = 108
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSNoDx: TLabel
          Left = 48
          Top = 128
          Width = 4
          Height = 20
          Cursor = crHandPoint
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lSNoDxClick
        end
        object lSSoF: TLabel
          Left = 168
          Top = 60
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSSoFx: TLabel
          Left = 200
          Top = 75
          Width = 4
          Height = 20
          Cursor = crHandPoint
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lSNoFxClick
        end
        object lSSoFoD: TLabel
          Left = 168
          Top = 108
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSSoFoDx: TLabel
          Left = 200
          Top = 128
          Width = 4
          Height = 20
          Cursor = crHandPoint
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lSNoFxClick
        end
        object lAFF: TLabel
          Left = 320
          Top = 108
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lAFSx: TLabel
          Left = 352
          Top = 80
          Width = 4
          Height = 20
          Cursor = crHandPoint
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lAFSxClick
        end
        object lAFS: TLabel
          Left = 320
          Top = 60
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lAFFx: TLabel
          Left = 352
          Top = 128
          Width = 4
          Height = 20
          Cursor = crHandPoint
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lAFSxClick
        end
        object lLF: TLabel
          Left = 72
          Top = 156
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lLDSize: TLabel
          Left = 72
          Top = 204
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lLUSize: TLabel
          Left = 72
          Top = 252
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object gSLDSize: TXGauge
          Left = 16
          Top = 208
          Width = 41
          Height = 41
          BorderStyle = bsNone
          ForeColor = 13290239
          Progress = 80.000000000000000000
        end
        object gSLUSize: TXGauge
          Left = 16
          Top = 256
          Width = 41
          Height = 41
          BorderStyle = bsNone
          ForeColor = 11136510
          Progress = 40.000000000000000000
        end
        object gSLF: TXGauge
          Left = 16
          Top = 160
          Width = 41
          Height = 41
          BorderStyle = bsNone
          ForeColor = 12189625
          Progress = 80.000000000000000000
        end
        object lNDx: TLabel
          Left = 504
          Top = 128
          Width = 4
          Height = 20
          Cursor = crHandPoint
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lNFxClick
        end
        object lND: TLabel
          Left = 472
          Top = 108
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lNFx: TLabel
          Left = 504
          Top = 80
          Width = 4
          Height = 20
          Cursor = crHandPoint
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = lNFxClick
        end
        object lNF: TLabel
          Left = 472
          Top = 60
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSProcessTime: TLabel
          Left = 64
          Top = 37
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object capSummaryQuantity: TAdvSmoothCapacityBar
          Left = 0
          Top = 336
          Width = 1056
          Height = 95
          AntiAlias = aaAntiAlias
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Appearance.ShowFree = False
          Appearance.AutoFormatValues = False
          Appearance.BackGroundFill.Color = 3355443
          Appearance.BackGroundFill.ColorTo = 3355443
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
          Items = <>
          CapacityDescription = ' '
          FreeDescription = 'NO'
          TotalCapacity = 100.000000000000000000
        end
        object capSummarySize: TAdvSmoothCapacityBar
          Left = 0
          Top = 437
          Width = 1056
          Height = 95
          AntiAlias = aaAntiAlias
          Anchors = [akLeft, akTop, akRight]
          Appearance.ShowFree = False
          Appearance.AutoFormatValues = False
          Appearance.BackGroundFill.Color = 3355443
          Appearance.BackGroundFill.ColorTo = 3355443
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
          Items = <>
          CapacityDescription = ' '
          FreeDescription = 'NO'
          TotalCapacity = 100.000000000000000000
          ExplicitWidth = 777
        end
        object lSummaryByQuantity: TLabel
          Left = 80
          Top = 318
          Width = 5
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lSummaryBySize: TLabel
          Left = 80
          Top = 418
          Width = 5
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object gSLDCount: TXGauge
          Left = 478
          Top = 208
          Width = 41
          Height = 41
          BorderStyle = bsNone
          ForeColor = 13290239
          Progress = 80.000000000000000000
        end
        object lLDCount: TLabel
          Left = 534
          Top = 204
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lLDxSize: THTMLabel
          Left = 104
          Top = 224
          Width = 368
          Height = 17
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Hover = True
          HTMLText.Strings = (
            '.')
          ParentFont = False
          Transparent = True
          OnClick = lLDxSizeClick
          Version = '2.1.0.0'
        end
        object lLDxCount: THTMLabel
          Left = 566
          Top = 224
          Width = 363
          Height = 17
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Hover = True
          HTMLText.Strings = (
            '.')
          ParentFont = False
          Transparent = True
          OnClick = lLDxSizeClick
          Version = '2.1.0.0'
        end
        object gSLUCount: TXGauge
          Left = 478
          Top = 256
          Width = 41
          Height = 41
          BorderStyle = bsNone
          ForeColor = 13290239
          Progress = 80.000000000000000000
        end
        object lLUCount: TLabel
          Left = 534
          Top = 252
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lLUxCount: THTMLabel
          Left = 566
          Top = 272
          Width = 363
          Height = 17
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Hover = True
          HTMLText.Strings = (
            '.')
          ParentFont = False
          Transparent = True
          OnClick = lLUxSizeClick
          Version = '2.1.0.0'
        end
        object lLUxSize: THTMLabel
          Left = 104
          Top = 272
          Width = 363
          Height = 17
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Hover = True
          HTMLText.Strings = (
            '.')
          ParentFont = False
          Transparent = True
          OnClick = lLUxSizeClick
          Version = '2.1.0.0'
        end
        object lSScanPath: TLabel
          Left = 48
          Top = 11
          Width = 985
          Height = 20
          Cursor = crHandPoint
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lSScanPathClick
          ExplicitWidth = 991
        end
        object lLFx: THTMLabel
          Left = 104
          Top = 174
          Width = 935
          Height = 19
          Cursor = crHandPoint
          AutoSizing = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HoverColor = clBlack
          HoverFontColor = clBlack
          HTMLText.Strings = (
            '.')
          ParentFont = False
          Transparent = True
          URLColor = clBlack
          OnClick = lLFxClick
          Version = '2.1.0.0'
        end
        object sbSaveSummary: TSpeedButton
          Left = 5
          Top = 7
          Width = 23
          Height = 22
          Hint = 'save summary'
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000120B0000120B00000000000000000000FF00FF00CD95
            7000BD734200B7683500B5683500B4673400B2663400B0653300AE643300AC63
            3200AA623200A9613200A8603100A7613200AB693C00BC866100C37D4F00EBC6
            AD00EAC5AD00FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFB
            F800FEFBF800FEFBF800FEFBF800C89A7C00C7987900AD6B4000BA6C3800EDCA
            B300E0A27A00FEFAF70062C0880062C0880062C0880062C0880062C0880062C0
            880062C0880062C08800FDF9F600CA8D6500C99B7C00A7613200BB6C3800EECC
            B600E1A27A00FEFAF700BFDCC200BFDCC200BFDCC200BFDCC200BFDCC200BFDC
            C200BFDCC200BFDCC200FDF9F600CD906800CC9E8100A8613200BB6B3800EFCE
            B800E1A27900FEFAF70062C0880062C0880062C0880062C0880062C0880062C0
            880062C0880062C08800FDF9F600CF936A00CEA38400AA613200BA6A3600EFD0
            BB00E2A27A00FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFB
            F800FEFBF800FEFBF800FEFBF800D3966D00D2A78A00AB623200BB6A3600F0D2
            BE00E2A37A00E2A37A00E1A37A00E2A37B00E1A37B00E0A17800DE9F7700DD9F
            7600DC9D7400D99B7200D8997100D6997000D5AB8E00AD633300BB6A3600F2D5
            C200E3A37A00E3A37A00E2A37B00E2A37B00E2A47B00E1A27900E0A17800DEA0
            7700DE9E7500DC9D7400DA9B7300D99B7300DAB09500AF643300BB6A3600F2D8
            C500E3A47B00E3A37A00E3A47A00E2A47B00E2A37B00E1A37B00E1A27900DFA0
            7700DE9F7600DD9E7400DB9C7200DC9D7400DDB59A00B1653400BB6B3600F4D9
            C700E6A67D00C88C6400C98D6500C98E6700CB926C00CB926D00CA906900C88C
            6500C88C6400C88C6400C88C6400DA9C7400E1BA9F00B3663400BB6C3700F4DC
            C900E7A77D00F9ECE100F9ECE100F9EDE300FCF4EE00FDFAF700FDF7F300FAED
            E500F7E7DB00F7E5D900F6E5D800DEA07700E4BEA400B4673400BD6E3A00F5DD
            CC00E7A87E00FAF0E800FAF0E800C98D6600FAF0E900FDF8F300FEFAF800FCF4
            EF00F9E9DF00F7E7DB00F7E5D900E0A27800E7C2A900B6683500C0744200F6DF
            D000E8A87E00FCF6F100FCF6F100C88C6400FAF1E900FBF4EE00FDFAF700FDF9
            F600FAF0E800F8E8DD00F7E6DB00E1A37A00EFD5C300B76A3600C6825500F6DF
            D100E9AA8000FEFAF600FDFAF600C88C6400FBF3EE00FBF1EA00FCF6F200FEFB
            F800FCF6F100F9ECE200F8E7DB00EED0BA00ECD0BD00BD744300D6A58500F6E0
            D100F7E0D100FEFBF800FEFBF700FDF9F600FCF5F000FAF0EA00FBF2ED00FDF9
            F600FDFAF700FBF1EB00F8E9DF00ECD1BE00CD926A00FF00FF00E1BDA600D9AB
            8D00C9895E00C0754300BD6E3A00BB6C3700BB6B3600BB6A3600BB6A3600BC6C
            3900BD6E3B00BB6D3A00BF744400C98D6500FF00FF00FF00FF00}
          Margin = 1
          OnClick = sbSaveSummaryClick
        end
      end
    end
    object tsImportFromFile: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1066
      Height = 706
      Caption = ''
      PageAppearance.Color = clBlack
      PageAppearance.ColorTo = clBlack
      PageAppearance.ColorMirror = clBlack
      PageAppearance.ColorMirrorTo = clBlack
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
      TabAppearance.BevelColor = 3355443
      TabAppearance.BevelColorDown = 3355443
      TabAppearance.BevelColorSelected = 13542013
      TabAppearance.BevelColorHot = 3355443
      TabAppearance.BevelColorDisabled = 3355443
      TabAppearance.Color = 3355443
      TabAppearance.ColorDown = 8947848
      TabAppearance.ColorSelected = 8947848
      TabAppearance.ColorHot = 8947848
      TabAppearance.ColorDisabled = 3355443
      TabAppearance.ColorTextHot = 11184810
      TabAppearance.ColorTextDisabled = 8947848
      TabAppearance.ColorTextSelected = 11184810
      TMSStyle = 21
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 1062
        Height = 702
        Align = alClient
        BevelOuter = bvNone
        Color = 3355443
        ParentBackground = False
        TabOrder = 0
        object gSThisFolder: TXGauge
          Left = 5
          Top = 22
          Width = 140
          Height = 140
          BorderStyle = bsNone
          ForeColor = 11136510
          Progress = 40.000000000000000000
        end
        object lSThisFolder: TLabel
          Left = 6
          Top = 174
          Width = 4
          Height = 13
          Caption = '.'
        end
        object lSDSpaceUsed: TLabel
          Left = 168
          Top = 174
          Width = 4
          Height = 13
          Caption = '.'
        end
        object lSVolName: TLabel
          Left = 320
          Top = 16
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSVolMax: TLabel
          Left = 320
          Top = 60
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSVolMaxx: TLabel
          Left = 352
          Top = 80
          Width = 4
          Height = 13
          Caption = '.'
        end
        object lSVolNamex: TLabel
          Left = 352
          Top = 32
          Width = 4
          Height = 13
          Caption = '.'
        end
        object lSSerial: TLabel
          Left = 472
          Top = 16
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSVolFree: TLabel
          Left = 472
          Top = 64
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSVolFreex: TLabel
          Left = 504
          Top = 80
          Width = 4
          Height = 13
          Caption = '.'
        end
        object lSFileSystem: TLabel
          Left = 648
          Top = 16
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSFileSystemx: TLabel
          Left = 680
          Top = 32
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lSSerialx: TLabel
          Left = 504
          Top = 32
          Width = 3
          Height = 13
          Caption = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object gSFS: TXGauge
          Left = 168
          Top = 22
          Width = 140
          Height = 140
          BorderStyle = bsNone
          ForeColor = 11136510
          Progress = 40.000000000000000000
        end
      end
    end
  end
end
