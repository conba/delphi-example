object FrameSearch: TFrameSearch
  Left = 0
  Top = 0
  Width = 1547
  Height = 840
  TabOrder = 0
  OnResize = FrameResize
  object pMainSearch: TPanel
    Left = 0
    Top = 0
    Width = 1547
    Height = 840
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pSearchChart: TPanel
      Left = 1
      Top = 1
      Width = 1545
      Height = 838
      Align = alClient
      BevelEdges = []
      BevelOuter = bvNone
      TabOrder = 0
      object pSearchResults: TPanel
        Left = 0
        Top = 0
        Width = 1545
        Height = 838
        Align = alClient
        BevelEdges = []
        BevelOuter = bvNone
        TabOrder = 0
        object pSearchOptions: TAdvSmoothTabPager
          Tag = 2
          Left = 0
          Top = 0
          Width = 1545
          Height = 838
          Fill.Color = 3355443
          Fill.ColorTo = 16571329
          Fill.ColorMirror = clNone
          Fill.ColorMirrorTo = clNone
          Fill.GradientType = gtSolid
          Fill.GradientMirrorType = gtSolid
          Fill.BorderColor = 3355443
          Fill.BorderWidth = 0
          Fill.Rounding = 0
          Fill.ShadowOffset = 0
          Fill.Glow = gmNone
          Transparent = False
          Align = alClient
          ActivePage = tsSearch
          TabPosition = tpTopLeft
          TabSettings.StartMargin = 4
          TabReorder = False
          OnChange = pSearchOptionsChange
          TabOrder = 0
          object tsSearch: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1543
            Height = 810
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
            DesignSize = (
              1543
              810)
            TMSStyle = 21
            object sbExploreDir: TAeroButton
              Left = 1868
              Top = 8
              Width = 102
              Height = 25
              ImageIndex = 5
              Version = '1.0.0.1'
              Anchors = [akTop, akRight]
              TabOrder = 0
            end
            object sbExcludeFolders: TAeroButton
              Left = 1656
              Top = 38
              Width = 100
              Height = 25
              ImageIndex = 2
              Version = '1.0.0.1'
              Anchors = [akTop, akRight]
              TabOrder = 1
            end
            object sbExcludeFiles: TAeroButton
              Left = 1762
              Top = 38
              Width = 100
              Height = 25
              ImageIndex = 3
              Version = '1.0.0.1'
              Anchors = [akTop, akRight]
              TabOrder = 2
            end
            object sbCombine: TAeroButton
              Left = 1868
              Top = 38
              Width = 102
              Height = 25
              ImageIndex = 4
              Version = '1.0.0.1'
              Anchors = [akTop, akRight]
              Enabled = False
              TabOrder = 3
            end
            object sbQuickFolder: TAeroButton
              Left = 1550
              Top = 38
              Width = 102
              Height = 25
              ImageIndex = 1
              Version = '1.0.0.1'
              Anchors = [akTop, akRight]
              TabOrder = 4
            end
            object pSearch: TPanel
              Left = 2
              Top = 2
              Width = 1539
              Height = 44
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              DoubleBuffered = True
              FullRepaint = False
              ParentBackground = False
              ParentDoubleBuffered = False
              TabOrder = 5
              DesignSize = (
                1539
                44)
              object sbGoSearch: TSpeedButton
                Left = 24
                Top = 1
                Width = 23
                Height = 22
                Hint = 'execute search'
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6494BA2267
                  9D81A8C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF9B9B9B737373ADADADFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F9CC2558DBC89B5
                  DD185F97FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFA4A4A4979797BDBDBD6C6C6CFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7BA4CA6497C59DC1E46699
                  C73171A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFABABABA1A1A1C8C8C8A3A3A37D7D7DFF00FFFF00FFFF00FFFF00FF
                  FF00FFE8CFBADBB292D3A680D0A17CD2A685AEA19975A2CCABCBE876A4CE407B
                  AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCDCDCDAFAFAFA2A2A29E9E9EA3
                  A3A3A0A0A0ABABABD1D1D1ACACAC878787FF00FFFF00FFFF00FFFF00FFFF00FF
                  E8CAB0E8C9AEF5E1CDF7E5D3F7E5D1F3DDC8DFBA9CC7A89186AED55087BBFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFC7C7C7C6C6C6DEDEDEE3E3E3E2E2E2DA
                  DADAB7B7B7A6A6A6B6B6B6939393FF00FFFF00FFFF00FFFF00FFFF00FFF1DBC8
                  EDD0B7F8E8D9F5DEC8F3D8BDF3D6BBF4DBC2F7E4D2DFBB9DA09795FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFD9D9D9CDCDCDE6E6E6DBDBDBD4D4D4D2D2D2D8
                  D8D8E2E2E2B7B7B7989898FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEECEB2
                  F7E7D7F6E1CCF4DBC2F4DAC0F3D8BDF3D7BBF4DBC2F3DEC9D2A887FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFCBCBCBE5E5E5DEDEDED8D8D8D7D7D7D4D4D4D3
                  D3D3D8D8D8DBDBDBA5A5A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0CEAF
                  F9ECDFF5DFC8F5DDC6F4DCC3F4DAC1F3D9BEF3D7BDF8E6D3D3A680FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFCACACAEAEAEADCDCDCDADADAD9D9D9D7D7D7D5
                  D5D5D4D4D4E3E3E3A2A2A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF4D3B5
                  F9EDE1F6E1CCF5DFC9F5DEC7F4DCC4F4DBC2F4DAC0F8E7D6D7AB87FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFCFCFCFECECECDEDEDEDCDCDCDBDBDBD9D9D9D8
                  D8D8D7D7D7E5E5E5A8A8A8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF8DBC1
                  F9EBDEF7E7D6F6E1CCF5E0CAF5DEC8F5DDC5F6E1CBF5E2D0DFB999FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFD8D8D8E9E9E9E5E5E5DEDEDEDDDDDDDBDBDBDA
                  DADADEDEDEE0E0E0B5B5B5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFCEAD8
                  F8E2CCFAEEE3F7E7D6F6E2CEF6E1CBF6E3D0F9EADDECCFB5ECD4BFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFE8E8E8DFDFDFEDEDEDE5E5E5DFDFDFDEDEDEE0
                  E0E0E9E9E9CCCCCCD2D2D2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FBE4CEF9E2CDFAECDEF9EEE2F9EDE2F8E9DAF0D5BDEDD0B7FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFE1E1E1DFDFDFEAEAEAEDEDEDECECECE7
                  E7E7D2D2D2CDCDCDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFCEAD9FADDC2F6D6B9F4D3B5F3D4B8F5E0CDFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8E8E8D9D9D9D2D2D2CFCFCFD1
                  D1D1DDDDDDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
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
                  18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFB1E0F2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFABD2
                  EDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32B0DF30ADDE87CEEBFF00FFFF
                  00FFFF00FFFF00FF9ACDEB2290D30D81CCFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF44B8E350CBEF39B7E52AA9DD73C5E782CAEA269ED92AA3DD39AEE5198C
                  D1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5BC3E74DCAEE54CEF150C8EF40
                  BAE839B5E546BDEB44BAEB3EB3E82C9AD6FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF7AD0EC49C8EC49CCF131C3ED42C4EE46C3ED2CB6EA26B1E83CB4E746AB
                  DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9BDCF144C6EA57D2F227C2ED23
                  BDEC1FB7EA1BB3E936B9EA3AB3E667BDE4FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF46C2E659D5F246D0F229C4EE25C0ED22BBEB1DB6E921B4E946BDEB2AA7
                  DBFF00FFFF00FFFF00FFFF00FFFF00FF4DC8E94ACEED5EDBF530CDF12CC8EF27
                  C3EE24BEEC20B8EA1CB4E949C0EC37B2E42DA8DDFF00FFFF00FFFF00FF54CEEB
                  4CD2EE63E1F641D6F432CFF22ECBF02AC6EF26C1ED22BCEB1FB7EA20B4E947BE
                  EC36B2E432ABDDFF00FF5ED3EE4DD5EF58DCF25EDEF560DEF55FDCF648D4F32D
                  C9EF29C4EE35C4ED50C9EF4CC4EE45BEEB3DB7E733B0E236ADDEFF00FFB6EBF7
                  7FDCF15BD0ED42C7E949CEED5BD9F447D3F23ACBF055CFF13EBFE835B7E24BBC
                  E46EC8E9A3DBF1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9CE2F349CEED5D
                  D9F459D6F343C5EA79D1EDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF47CAEA56D6F259D6F33AC0E6FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBCECF748
                  CEED48CDED9BE0F3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF58D1EC47CBEAFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD8
                  F5FBC1EEF8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = sbQuickSearchClick
              end
              object lSearchDetails: THTMLabel
                Left = 4
                Top = 29
                Width = 1541
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Color = clBlack
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HTMLText.Strings = (
                  'n/a')
                ParentColor = False
                ParentFont = False
                Transparent = True
                Version = '2.1.0.0'
                ExplicitWidth = 1013
              end
              object sbSearchSyntax: TSpeedButton
                Left = 1390
                Top = 23
                Width = 19
                Height = 22
                Hint = 'show floating search syntax window'
                Anchors = [akTop, akRight]
                Flat = True
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  20000000000000040000120B0000120B00000000000000000000FF00FF00BE9E
                  890094603D0093603C00925F3B00925E3A00915D3900905D3800905C38008F5B
                  37008F5A36008E5A3500B18C7300FF00FF00FF00FF00FF00FF00FF00FF00A174
                  5600CCAB8500D1AF8900D2B08800D1AD8500D0AA8100CFA77F00CEA47B00CDA1
                  7A00CB9F7700C799710093613E008F7F7300FF00FF00FF00FF00FF00FF00A275
                  5600CAA98500A3785400C69A6700C4986200C2945E00C1905A00C08C5600BE89
                  5300BF885500C99D750093623F0069534100FF00FF00FF00FF00FF00FF00A276
                  5700CBAC8800A67E5700C99F6E00C79D6900C6996600C3976100C2925C00C18F
                  5900C18E5B00CAA1780094624000573E2A00FF00FF00FF00FF00FF00FF00A377
                  5900CEB08E00AA855B00CBA47500CAA27100C89E6B00C69B6800C5996300C294
                  5E00C4946100CCA57D0094634100573E2A00FF00FF00FF00FF00FF00FF00A478
                  5A00D0B49200AF8B6000CEA97C00CCA67700CBA37400C9A06E00C79D6A00C69A
                  6600C69B6800CDA8820095644200573E2A00FF00FF00FF00FF00FF00FF00A579
                  5B00D2B79600B4926500D1AE8300CFAB7F00CDA87A00CBA57600CAA27100C89E
                  6D00C89F6D00D0AE860096654400573E2A00FF00FF00FF00FF00FF00FF00A57A
                  5C00D5BB9B00B89A6900D4B38A00D2AF8700D0AD8200CFAA7D00CDA67800CBA4
                  7400CCA47500D2B18A0097674500573E2A00FF00FF00FF00FF00FF00FF00A67B
                  5D00D7BF9F00BD9F6F00D4B59000CBAD8800C7A88100C6A57D00C4A17A00C5A1
                  7600CBA77B00D4B4900098684600573E2A00FF00FF00FF00FF00FF00FF00A77C
                  5E00D9C2A400C1A47200D2B89400F5EDE400F4ECE200F4ECE100F4EBE000F3EA
                  DF00CBA97F00D6B8960099694700573E2A00FF00FF00FF00FF00FF00FF00A77C
                  5E00DBC5A600C6A77600D9BF9B00D1B79300CBB08E00CAAE8A00C8AB8700CBAB
                  8300D1B08700D8BB9B00996A4800573E2A00FF00FF00FF00FF00FF00FF00A87C
                  5F00DDC8A900D4BD9500E6D4B900E6D1B600E4D0B500E3CEB300E2CBB000E0C9
                  AD00DFC7A900DABFA0009A6B4A00573E2A00FF00FF00FF00FF00FF00FF00A87E
                  6100D9C2A500B5917000AB805F00A97E5E00A97E5E00A87D5C00A87C5B00A77B
                  5A00A67959009C6B490096644100573E2A00FF00FF00FF00FF00FF00FF00AF88
                  6D00BA977800D8C5B900E8DED700E7DDD600E6DCD600E4DBD400E3DAD300E2D8
                  D100E1D7D000EBE7E500EFEFEF00573E2A00FF00FF00FF00FF00FF00FF00B38E
                  74009D6E4C00BB977800AC826200AC816100AB806000AB7F5F00AA7F5E00A87E
                  5D00A87C5C009D6D4C0097664300885C3C00FF00FF00FF00FF00FF00FF00FF00
                  FF00AD846900B38E74009D6C4B009C6C4A009C6B49009B6A49009B6A48009A69
                  470099684600986745009364430094725700FF00FF00FF00FF00}
                OnClick = sbSearchSyntaxClick
                ExplicitLeft = 1500
              end
              object sbSearchHelp: TSpeedButton
                Left = 1365
                Top = 23
                Width = 19
                Height = 22
                Hint = 'help'
                Anchors = [akTop, akRight]
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFA393839D7753A3703EA2703F9D7855A39385FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA39282AB6D31AD6C2DAD6C2DAD
                  6C2DAD6C2DAD6C2DAD6C2DAB6E33A49688FF00FFFF00FFFF00FFFF00FFFF00FF
                  9C7F62AD6C2DAD6C2DAD6C2DAD6C2DBB8751B8824CAD6C2DAD6C2DAD6C2DAD6C
                  2D9D8369FF00FFFF00FFFF00FFA29181AD6C2DAD6C2DAD6C2DAD6C2DB3793FFF
                  FFFFFFFFFFAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA49688FF00FFFF00FFAB6D31
                  AD6C2DAD6C2DAD6C2DAD6C2DB07237FFFFFFFFFFFFAD6C2DAD6C2DAD6C2DAD6C
                  2DAD6C2DA96C32FF00FFA1907FAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAE6E30AD
                  6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA395869E764FAD6C2D
                  AD6C2DAD6C2DAD6C2DAD6C2DAE6F31FCFBF8FFFFFFB3773DAD6C2DAD6C2DAD6C
                  2DAD6C2DAD6C2D9D7955A66F3AAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DDE
                  C5AEFFFFFFFFFFFFB8814BAD6C2DAD6C2DAD6C2DAD6C2DA27140A56E39AD6C2D
                  AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAF6F32E4D0BCFFFFFFFFFFFFB57C44AD6C
                  2DAD6C2DAD6C2DA370409E754DAD6C2DAD6C2DAD6C2DC08F5ECFAA87B67E47AD
                  6C2DAD6D2EE5D1BEFFFFFFD6B698AD6C2DAD6C2DAD6C2D9D7752A08D7AAD6C2D
                  AD6C2DAD6C2DDCC2A8FFFFFFDEC5ADAD6C2DAD6C2DE0C8B1FFFFFFD9BCA0AD6C
                  2DAD6C2DAD6C2DA29281FF00FFAC6D2FAD6C2DAD6C2DBB8753FFFFFFFFFFFFF0
                  E4D8F1E6DBFFFFFFFFFFFFBC8854AD6C2DAD6C2DAB6D31FF00FFFF00FF9F8B78
                  AD6C2DAD6C2DAD6C2DBF8E5DEADACBFFFFFFFFFFFFEADACBC19162AD6C2DAD6C
                  2DAD6C2DA29080FF00FFFF00FFFF00FF9C7B59AD6C2DAD6C2DAD6C2DAD6C2DAD
                  6C2EAD6C2DAD6C2DAD6C2DAD6C2DAD6C2D9B7D5FFF00FFFF00FFFF00FFFF00FF
                  FF00FF9F8A75AC6C2FAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAC6D2F9F8C
                  79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F8A75A17347A9
                  6D33A86D349F73489F8B78FF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = sbSearchHelpClick
                ExplicitLeft = 1475
              end
              object eSearch: TComboBox
                Left = 53
                Top = 2
                Width = 1351
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                OnChange = eSearchChange
                OnKeyPress = eSearchKeyPress
              end
            end
            object pSearchNavigation: TPanel
              Left = 2
              Top = 685
              Width = 1539
              Height = 123
              Align = alBottom
              BevelEdges = []
              BevelOuter = bvNone
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 6
              DesignSize = (
                1539
                123)
              object lShowing: TLabel
                Left = 128
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
                Width = 1541
                Height = 83
                AntiAlias = aaAntiAlias
                Anchors = [akLeft, akTop, akRight]
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
                ExplicitWidth = 1027
              end
              object sbSearchThing: TSpeedButton
                Tag = 1
                Left = 1511
                Top = 89
                Width = 26
                Height = 22
                Anchors = [akTop, akRight]
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
                OnClick = sbSearchThingClick
                ExplicitLeft = 997
              end
            end
            object pSearchGraph: TPanel
              Left = 1406
              Top = 46
              Width = 135
              Height = 639
              Align = alRight
              BevelEdges = []
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 7
              DesignSize = (
                135
                639)
              object guageSearchQuantity: TXGauge
                Left = 6
                Top = 4
                Width = 122
                Height = 122
                BackColor = 16119285
                BorderStyle = bsNone
                Color = 3355443
                ForeColor = 8833783
                ParentColor = False
              end
              object lPSearchQuantity: TLabel
                Left = 6
                Top = 132
                Width = 123
                Height = 13
                Alignment = taCenter
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Caption = '.'
              end
              object guageSearchSize: TXGauge
                Left = 5
                Top = 151
                Width = 122
                Height = 122
                BackColor = 16119285
                BorderStyle = bsNone
                Color = 3355443
                ForeColor = 8833783
                ParentColor = False
              end
              object lPSearchSize: TLabel
                Left = 6
                Top = 279
                Width = 123
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '.'
                Color = clWhite
                ParentColor = False
                Transparent = True
              end
              object sbSaveSearch: TSpeedButton
                Left = 106
                Top = 302
                Width = 23
                Height = 22
                Hint = 'save search results'
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = cbSearchShowPathClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.5.0.9'
              end
              object cbSearchColourCode: TAdvOfficeCheckBox
                Left = 6
                Top = 365
                Width = 124
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = cbSearchColourCodeClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.5.0.9'
              end
            end
            object sgSearchResults: TAdvStringGrid
              Tag = 1
              Left = 2
              Top = 46
              Width = 1404
              Height = 639
              Cursor = crDefault
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
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
              ParentFont = False
              PopupMenu = puSearch
              ScrollBars = ssBoth
              TabOrder = 8
              StyleElements = [seClient, seBorder]
              GridLineColor = 15062992
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgSearchResultsGetCellColor
              OnGetAlignment = sgDuplicatesNameGetAlignment
              OnCanSort = sgSearchResultsCanSort
              OnEndColumnSize = sgSearchResultsEndColumnSize
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
              EnhRowColMove = False
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
              ShowDesignHelper = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              SortSettings.Show = True
              Version = '8.4.2.5'
              ColWidths = (
                20
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
          object tsProperties: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1543
            Height = 810
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
            TMSStyle = 4
          end
          object tsDuplicatesName: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1543
            Height = 810
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
            object Panel1: TPanel
              Left = 2
              Top = 2
              Width = 1539
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                1539
                25)
              object sbGoDN: TSpeedButton
                Left = 1
                Top = 1
                Width = 23
                Height = 22
                Hint = 'show all duplicates'
                Flat = True
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DFB4
                  9300D59D7400D1966800CE926300CB8E5E00C98A5B00C7875600C3845200C384
                  5200C3845200C3845200C3845200C3845200D0A17D00FF00FF00FF00FF00D7A1
                  7500F8F2ED00F7F0EA00F6EDE600F4EAE200F3E7DE00F1E4DB00F0E2D800F0E2
                  D800F0E2D800F0E2D800F0E2D800F0E2D800C58B5E00FF00FF00FF00FF00D9A4
                  7A00F9F3EE00EBD2BE00FFFFFF00EBD3BF00FFFFFF00FFFFFF00FFFFFF00EAC7
                  AD00FFFFFF00FFFFFF00FFFFFF00F0E2D800C68C5F00FF00FF00FF00FF00DDA8
                  7E00F9F3EF00EBD0BA00EBD0BB00EBD0BB00EBD0BB00EBD0BB00EBD1BD00EACD
                  B500EACDB500EACDB500EACDB500F0E2D800C68A5C00FF00FF00FF00FF00DFAA
                  8200F9F3EF00EACEB700FFFFFF00EBD0BB00FFFFFF00FFFFFF00FFFFFF00EACF
                  BA00FBF6F200FFFFFF00FFFFFF00F0E2D800C88D5F00FF00FF00FF00FF00E1AE
                  8700FAF4F000EACBB200EACCB300EACCB300EACCB300EACCB300EACEB700E8C7
                  AC00E8C7AC00E8C8B000E8C8AE00F0E2D800C4865400FF00FF00FF00FF00E3B1
                  8C00FAF6F100EAC9AE00FFFFFF00EAC9B000FFFFFF00FFFFFF00FFFFFF00E8C7
                  AC00FFFFFF00FFFFFF00FFFFFF00F1E5DB00C6865500FF00FF00FF00FF00E5B4
                  8F00FAF6F200E9C6AA00E9C6AC00EAC7AC00E9C7AD00E9C9AE00E9C9B000E8C7
                  AC00E9C9B000E8C8B000E8CCB500F2E7DE00C88A5900FF00FF00FF00FF00E7B7
                  9400FBF7F400E9C3A600FFFFFF00E8C4A900FFFFFF00FFFFFF00FFFFFF00E8C7
                  AC00FFFFFF00FFFFFF00FFFFFF00F7F1EB00CB8F5F00FF00FF00FF00FF00E9BA
                  9800FBF7F400E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3
                  A600E9C3A600E9C3A600E9C3A600FBF7F400CE936400FF00FF00FF00FF00EBBD
                  9B00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FBF7F400D1976A00FF00FF00FF00FF00ECBF
                  9E00FBF7F4009CD5A50098D3A10094D09D0090CE98008BCB930087C98E0082C6
                  89007EC384007AC1800076BE7C00FBF7F400D49B6F00FF00FF00FF00FF00EFC6
                  A800FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
                  F400FBF7F400FBF7F400FBF7F400FBF7F400D8A37800FF00FF00FF00FF00F7E1
                  D200F1C8AC00EDC09F00EBBE9D00EBBC9A00E9BA9600E7B79300E6B59000E4B2
                  8C00E2AF8800E0AC8400DDA98000DCA57D00E2B69600FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                OnClick = sbGoDNClick
              end
              object sbSaveDN: TSpeedButton
                Left = 59
                Top = 1
                Width = 23
                Height = 22
                Hint = 'save the results to a file'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000C21E0000C21E00000000000000000000FF00FFCD9570
                  BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
                  31A76132AB693CBC8661FF00FF93939371717167676766666666666665656564
                  64646363636262626161616060605F5F5F606060676767838383C37D4FEBC6AD
                  EAC5ADFEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFB
                  F8C89A7CC79879AD6B407B7B7BC4C4C4C3C3C3FBFBFBFBFBFBFBFBFBFBFBFBFB
                  FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB989898969696696969BA6C38EDCAB3
                  E0A27AFEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
                  F6CA8D65C99B7CA761326A6A6AC8C8C89F9F9FFAFAFAB1B1B1B1B1B1B1B1B1B1
                  B1B1B1B1B1B1B1B1B1B1B1B1B1B1F9F9F98A8A8A989898606060BB6C38EECCB6
                  E1A27AFEFAF7BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2FDF9
                  F6CD9068CC9E81A861326B6B6BCACACA9F9F9FFAFAFAD6D6D6D6D6D6D6D6D6D6
                  D6D6D6D6D6D6D6D6D6D6D6D6D6D6F9F9F98D8D8D9C9C9C606060BB6B38EFCEB8
                  E1A279FEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
                  F6CF936ACEA384AA61326A6A6ACCCCCC9F9F9FFAFAFAB1B1B1B1B1B1B1B1B1B1
                  B1B1B1B1B1B1B1B1B1B1B1B1B1B1F9F9F9909090A0A0A0606060BA6A36EFD0BB
                  E2A27AFEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFB
                  F8D3966DD2A78AAB6232696969CECECE9F9F9FFBFBFBFBFBFBFBFBFBFBFBFBFB
                  FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB939393A4A4A4616161BB6A36F0D2BE
                  E2A37AE2A37AE1A37AE2A37BE1A37BE0A178DE9F77DD9F76DC9D74D99B72D899
                  71D69970D5AB8EAD6333696969D0D0D0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A09E
                  9E9E9C9C9C9C9C9C9A9A9A989898979797969696A8A8A8626262BB6A36F2D5C2
                  E3A37AE3A37AE2A37BE2A37BE2A47BE1A279E0A178DEA077DE9E75DC9D74DA9B
                  73D99B73DAB095AF6433696969D3D3D3A0A0A0A0A0A0A0A0A0A0A0A0A1A1A19F
                  9F9F9E9E9E9D9D9D9B9B9B9A9A9A999999989898AEAEAE636363BB6A36F2D8C5
                  E3A47BE3A37AE3A47AE2A47BE2A37BE1A37BE1A279DFA077DE9F76DD9E74DB9C
                  72DC9D74DDB59AB16534696969D6D6D6A1A1A1A0A0A0A1A1A1A1A1A1A0A0A0A0
                  A0A09F9F9F9D9D9D9C9C9C9B9B9B9999999A9A9AB2B2B2646464BB6B36F4D9C7
                  E6A67DC88C64C98D65C98E67CB926CCB926DCA9069C88C65C88C64C88C64C88C
                  64DA9C74E1BA9FB366346A6A6AD7D7D7A3A3A38989898A8A8A8B8B8B8F8F8F90
                  90908D8D8D8A8A8A898989898989898989999999B7B7B7656565BB6C37F4DCC9
                  E7A77DF9ECE1F9ECE1F9EDE3FCF4EEFDFAF7FDF7F3FAEDE5F7E7DBF7E5D9F6E5
                  D8DEA077E4BEA4B467346B6B6BDADADAA4A4A4EBEBEBEBEBEBECECECF4F4F4FA
                  FAFAF7F7F7EDEDEDE6E6E6E4E4E4E4E4E49D9D9DBBBBBB666666BD6E3AF5DDCC
                  E7A87EFAF0E8FAF0E8C98D66FAF0E9FDF8F3FEFAF8FCF4EFF9E9DFF7E7DBF7E5
                  D9E0A278E7C2A9B668356C6C6CDBDBDBA5A5A5EFEFEFEFEFEF8B8B8BF0F0F0F8
                  F8F8FAFAFAF4F4F4E8E8E8E6E6E6E4E4E49F9F9FC0C0C0676767C07442F6DFD0
                  E8A87EFCF6F1FCF6F1C88C64FAF1E9FBF4EEFDFAF7FDF9F6FAF0E8F8E8DDF7E6
                  DBE1A37AEFD5C3B76A36727272DDDDDDA5A5A5F6F6F6F6F6F6898989F0F0F0F4
                  F4F4FAFAFAF9F9F9EFEFEFE7E7E7E5E5E5A0A0A0D3D3D3686868C68255F6DFD1
                  E9AA80FEFAF6FDFAF6C88C64FBF3EEFBF1EAFCF6F2FEFBF8FCF6F1F9ECE2F8E7
                  DBEED0BAECD0BDBD7443808080DEDEDEA7A7A7FAFAFAFAFAFA898989F3F3F3F1
                  F1F1F6F6F6FBFBFBF6F6F6EBEBEBE6E6E6CDCDCDCECECE727272D6A585F6E0D1
                  F7E0D1FEFBF8FEFBF7FDF9F6FCF5F0FAF0EAFBF2EDFDF9F6FDFAF7FBF1EBF8E9
                  DFECD1BECD926AFF00FFA3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
                  F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FFF00FFE1BDA6D9AB8D
                  C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
                  44C98D65FF00FFFF00FFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
                  69696969696B6B6B6D6D6D6B6B6B7373738A8A8AFF00FFFF00FF}
                NumGlyphs = 2
                OnClick = sbSaveDNClick
              end
              object sbCopyDN: TSpeedButton
                Left = 107
                Top = 1
                Width = 23
                Height = 22
                Hint = 'copy the results to the clipboard'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFD39570CC8357C87646CA7B4ECB7B4ECA7B4ECA7B
                  4ECA7B4ECA8155CD865CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF94949482
                  82827575757B7B7B7B7B7B7B7B7B7B7B7B7A7A7A808080848484FF00FF4A80AB
                  206398206398206398206398C98F67FCF3ECFAF1E8FAF0E7FBF1E9FBF2EAFBF2
                  EAFBF2EBFDF4EECB8358FF00FF8A8A8A6F6F6F6F6F6F6F6F6F6F6F6F8C8C8CF3
                  F3F3F0F0F0EFEFEFF0F0F0F1F1F1F1F1F1F2F2F2F4F4F48181815588B174ADD8
                  7BB2DD78AEDC75AADA74A9DADAA97DEFF1E7FFE9D9FFEADBFFE9D9FFE7D7FFE5
                  D2FFE2CBEFF2E8CE8156919191B6B6B6BBBBBBB7B7B7B4B4B4B3B3B3A4A4A4EF
                  EFEFE7E7E7E8E8E8E7E7E7E5E5E5E3E3E3DFDFDFF0F0F080808020639880B9E1
                  5395D15092D04E8ECE4D8CCDD6A97DFBF5EEFFE9D9FFEADBFFE9D9FFE7D7FFE5
                  D2FFE2CBFBF6EFCC83566F6F6FC0C0C0A2A2A2A0A0A09D9D9D9B9B9BA4A4A4F4
                  F4F4E7E7E7E8E8E8E7E7E7E5E5E5E3E3E3DFDFDFF5F5F581818120639884BFE2
                  569AD35397D15092CF5091CFD6A97DFFF7F1FFE9D9FFEADBFFE9D9FFE7D7FFE5
                  D2FFE2CBFFF7F1CB85566F6F6FC5C5C5A6A6A6A4A4A4A0A0A09F9F9FA4A4A4F7
                  F7F7E7E7E7E8E8E8E7E7E7E5E5E5E3E3E3DFDFDFF7F7F782828220639888C4E6
                  599FD6569BD35397D15395D1D7AC7FFFF7F0FFE7D5FDE7D6FDE6D4FCE4D0FBE3
                  CBFADCC2FEF3E8CC86576F6F6FCACACAAAAAAAA7A7A7A4A4A4A2A2A2A7A7A7F7
                  F7F7E5E5E5E5E5E5E4E4E4E1E1E1E0E0E0D9D9D9F2F2F28383832063988BC9E7
                  5CA5D759A0D5579CD3569AD3D7AC7FFFF7F2FEE7D5FEE7D5FDE5D1FAE0CAF9DE
                  C4F7D9BCFDF2E7CC87586F6F6FCDCDCDAFAFAFABABABA7A7A7A6A6A6A7A7A7F7
                  F7F7E5E5E5E5E5E5E2E2E2DDDDDDDBDBDBD5D5D5F1F1F184848420639891CDE9
                  5FA9D95DA5D85AA0D6599FD6D8AD81FEF7F1FCE5D2FCE4D1FBE2CCF9DDC4F6D7
                  BBF3D1AFFAEFE4CC87596F6F6FD1D1D1B2B2B2AFAFAFABABABAAAAAAA8A8A8F7
                  F7F7E3E3E3E2E2E2DFDFDFDADADAD3D3D3CDCDCDEEEEEE84848420639898D2EB
                  65AEDA60AAD95DA6D85CA5D7D9AF84FEF6F0FCE2CDFCE3CDFADFC8F7D9BCF5E9
                  DDFAF3EBFBF8F3CA83546F6F6FD5D5D5B6B6B6B3B3B3B0B0B0AFAFAFAAAAAAF6
                  F6F6E0E0E0E0E0E0DCDCDCD5D5D5E8E8E8F2F2F2F7F7F78080802063989ED6ED
                  6BB2DC66AFDC60AADA5FA9D9D9AF84FEF5EDFCDEC5FBE0C7F9DCC2F5D3B4FEF9
                  F3FAE2C4ECC193D2986E6F6F6FD9D9D9B9B9B9B7B7B7B3B3B3B2B2B2AAAAAAF4
                  F4F4DBDBDBDDDDDDD9D9D9CFCFCFF9F9F9DEDEDEBBBBBB969696206398A5DAEF
                  6FB5DE68B0DC60A9D95FA9D9D7AD81FFFFFEFDF3E9FDF3EAFCF2E8FAEFE3FAF2
                  E7EABB88D39469FF00FF6F6F6FDDDDDDBCBCBCB8B8B8B2B2B2B2B2B2A8A8A8FF
                  FFFFF2F2F2F2F2F2F1F1F1EEEEEEF1F1F1B5B5B5919191FF00FF206398AADDF1
                  74B9E070B6DF6CB3DD6BB2DCD9AF84D7AE81D7AC7FD7AC7FCCA070CD9F71B38F
                  67D39B71FF00FFFF00FF6F6F6FE0E0E0C0C0C0BDBDBDBABABAB9B9B9AAAAAAA8
                  A8A8A7A7A7A7A7A79A9A9A9A9A9A8A8A8A989898FF00FFFF00FF206398B0E1F2
                  79BDE24498DD4497DC4396DC4296DC4295DC4195DB539ED489C6E6206398FF00
                  FFFF00FFFF00FFFF00FF6F6F6FE3E3E3C3C3C3A8A8A8A7A7A7A6A6A6A6A6A6A6
                  A6A6A5A5A5A9A9A9CBCBCB6F6F6FFF00FFFF00FFFF00FFFF00FF3B76A595C9E0
                  AEE2F24E9DDFB5EEFD75D4F075D4F0B5EEFD4B9BDE8ECBE993CDE92A6A9DFF00
                  FFFF00FFFF00FFFF00FF818181CCCCCCE4E4E4ACACACEFEFEFD7D7D7D7D7D7EF
                  EFEFAAAAAACFCFCFD1D1D1767676FF00FFFF00FFFF00FFFF00FFFF00FF6392B7
                  2063983775A4B6EFFE80DBF380DBF3B6EFFE2E6EA12063986F9ABCFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF9A9A9A6F6F6F7F7F7FF0F0F0DDDDDDDDDDDDF0
                  F0F07979796F6F6FA2A2A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF2063982063982063982063982063982D6C9EFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F6F6F6F6F6F6F6F6F6F6F
                  6F6F777777FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                NumGlyphs = 2
                OnClick = sbCopyDNClick
              end
              object bHelpDN: TSpeedButton
                Left = 20
                Top = 1
                Width = 23
                Height = 22
                Hint = 'copy the results to the clipboard'
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFA393839D7753A3703EA2703F9D7855A39385FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA39282AB6D31AD6C2DAD6C2DAD
                  6C2DAD6C2DAD6C2DAD6C2DAB6E33A49688FF00FFFF00FFFF00FFFF00FFFF00FF
                  9C7F62AD6C2DAD6C2DAD6C2DAD6C2DBB8751B8824CAD6C2DAD6C2DAD6C2DAD6C
                  2D9D8369FF00FFFF00FFFF00FFA29181AD6C2DAD6C2DAD6C2DAD6C2DB3793FFF
                  FFFFFFFFFFAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA49688FF00FFFF00FFAB6D31
                  AD6C2DAD6C2DAD6C2DAD6C2DB07237FFFFFFFFFFFFAD6C2DAD6C2DAD6C2DAD6C
                  2DAD6C2DA96C32FF00FFA1907FAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAE6E30AD
                  6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA395869E764FAD6C2D
                  AD6C2DAD6C2DAD6C2DAD6C2DAE6F31FCFBF8FFFFFFB3773DAD6C2DAD6C2DAD6C
                  2DAD6C2DAD6C2D9D7955A66F3AAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DDE
                  C5AEFFFFFFFFFFFFB8814BAD6C2DAD6C2DAD6C2DAD6C2DA27140A56E39AD6C2D
                  AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAF6F32E4D0BCFFFFFFFFFFFFB57C44AD6C
                  2DAD6C2DAD6C2DA370409E754DAD6C2DAD6C2DAD6C2DC08F5ECFAA87B67E47AD
                  6C2DAD6D2EE5D1BEFFFFFFD6B698AD6C2DAD6C2DAD6C2D9D7752A08D7AAD6C2D
                  AD6C2DAD6C2DDCC2A8FFFFFFDEC5ADAD6C2DAD6C2DE0C8B1FFFFFFD9BCA0AD6C
                  2DAD6C2DAD6C2DA29281FF00FFAC6D2FAD6C2DAD6C2DBB8753FFFFFFFFFFFFF0
                  E4D8F1E6DBFFFFFFFFFFFFBC8854AD6C2DAD6C2DAB6D31FF00FFFF00FF9F8B78
                  AD6C2DAD6C2DAD6C2DBF8E5DEADACBFFFFFFFFFFFFEADACBC19162AD6C2DAD6C
                  2DAD6C2DA29080FF00FFFF00FFFF00FF9C7B59AD6C2DAD6C2DAD6C2DAD6C2DAD
                  6C2EAD6C2DAD6C2DAD6C2DAD6C2DAD6C2D9B7D5FFF00FFFF00FFFF00FFFF00FF
                  FF00FF9F8A75AC6C2FAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAC6D2F9F8C
                  79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F8A75A17347A9
                  6D33A86D349F73489F8B78FF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = bHelpDNClick
              end
              object lDNCount: THTMLabel
                Left = 136
                Top = 7
                Width = 368
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HTMLText.Strings = (
                  '...')
                ParentFont = False
                Transparent = True
                Version = '2.1.0.0'
                ExplicitWidth = 478
              end
              object sbCopyCSVDN: TSpeedButton
                Left = 83
                Top = 1
                Width = 23
                Height = 22
                Hint = 'save in CSV format'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000C21E0000C21E00000000000000000000FF00FFE2C0AA
                  CC8D66C07140BC6B36BC6B36BC6B36BC6A36BC6A36BB6A35BB6A35BB6935BD6E
                  3BCA8B63E3C2AEFF00FFFF00FFC0C0C08D8D8D7171716B6B6B6B6B6B6B6B6B6A
                  6A6A6A6A6A6969696969696969696E6E6E8B8B8BC2C2C2FF00FFFF00FFC57C4D
                  F8F2EBF7ECDFF6EBDEF6EADEF6EADCF6EADCFAF3EBFAF3EBFAF2EAFCF7F3FCF8
                  F4FEFEFDC37A4DFF00FFFF00FF7C7C7CF1F1F1EAEAEAE9E9E9E9E9E9E8E8E8E8
                  E8E8F2F2F2F2F2F2F1F1F1F7F7F7F8F8F8FEFEFE7A7A7AFF00FFFF00FFC27740
                  F5EBDFFCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4
                  D1FDFBF8BC6B37FF00FFFF00FF757575EAEAEAE2E2E2E2E2E2E2E2E2E2E2E2E2
                  E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2FBFBFB6B6B6BFF00FFFF00FFC37C42
                  F7EDE3FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4
                  D1FBF7F4BD6C37FF00FFFF00FF797979ECECECE2E2E2E2E2E2E2E2E2E2E2E2E2
                  E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2F7F7F76C6C6CFF00FFFF00FFC68046
                  F7F0E6FCE4D1FCE4D1E5D9C2689E705796655997666CA073FCE4D1FCE4D1FCE4
                  D1FCF9F5C1743CFF00FFFF00FF7D7D7DEFEFEFE2E2E2E2E2E2D5D5D59393938A
                  8A8A8B8B8B959595E2E2E2E2E2E2E2E2E2F9F9F9727272FF00FF3284491A7533
                  197533197433448A52619B6BBBD6C378BB8461AB6A579664FCE2CCFBE0C9FBE1
                  C8FDFAF7C37A41FF00FF7777776767676767676666667D7D7D8F8F8FD1D1D1AD
                  ADAD9C9C9C8A8A8ADFDFDFDDDDDDDEDEDEFAFAFA777777FF00FFA3C8AD1B7533
                  5BA06E49965C47905BC7DDCD5DB67167AE75448D581B7533FCE2CDFBE1CBFBE1
                  C9FBF7F2C78045FF00FFC2C2C2676767939393888888838383D8D8D8A6A6A6A0
                  A0A0808080676767E0E0E0DEDEDEDEDEDEF7F7F77D7D7DFF00FFFF00FF828143
                  1F783748915DC7DDCD6AC08471B682448E59B1C1A1FBE4D0FBE3CCFADFC7FADF
                  C6FAF2EAC88448FF00FFFF00FF7777776A6A6A848484D8D8D8B1B1B1A9A9A981
                  8181BABABAE1E1E1E0E0E0DCDCDCDCDCDCF1F1F1808080FF00FFFF00FFC48C4F
                  619E71C5DCCC76C99773BC87438D58559360F5E0CCFBE1CCFAE0C7F9DDC3F8DC
                  C2FAF4EDC8864BFF00FFFF00FF868686939393D7D7D7BBBBBBAEAEAE80808087
                  8787DDDDDDDFDFDFDDDDDDDADADAD9D9D9F3F3F3828282FF00FFFF00FF718C55
                  C0D9C882D3A36DC18A5495634B9660519764679A68F4DCC3F8DCC2F6DABDF6D8
                  BBFAF4EFC8874CFF00FFFF00FF818181D4D4D4C6C6C6B3B3B38989898989898A
                  8A8A8E8E8ED9D9D9D9D9D9D6D6D6D4D4D4F4F4F4838383FF00FF80B28EB5D3BE
                  9CDAB574C8955495634A935F5DA47459A16E509764629762E9D1B4F3D4B5F1D2
                  B3F8F4F0C6864CFF00FFA9A9A9CDCDCDD0D0D0BABABA89898986868698989894
                  94948A8A8A8B8B8BCDCDCDD0D0D0CECECEF4F4F4828282FF00FF5B9C6E568C57
                  539666549563A1B9958DAE832E7F422E7F413A844836824590B490F7F2ECFBF7
                  F3F5EFE9C38048FF00FF9090908080808A8A8A898989B1B1B1A4A4A471717171
                  7171767676747474ABABABF1F1F1F7F7F7EEEEEE7D7D7DFF00FFFF00FFC88D52
                  F9F5F1FCE3CDFBE3CEFBE3CDFBE2CBF9E0C8F8DCC2F5D6BAFDFBF8FCE6CDFAE5
                  C9E2B684D5A884FF00FFFF00FF888888F5F5F5E0E0E0E0E0E0E0E0E0DFDFDFDD
                  DDDDD9D9D9D2D2D2FBFBFBE2E2E2E1E1E1B0B0B0A6A6A6FF00FFFF00FFCA925A
                  FAF6F2FAE0C7FBE1C9FBE2C9FBE0C8F9DFC5F8DBC1F4D6B8FFFBF8F6D8B4E1B0
                  7DDC9669FF00FFFF00FFFF00FF8D8D8DF6F6F6DDDDDDDEDEDEDFDFDFDDDDDDDC
                  DCDCD8D8D8D2D2D2FBFBFBD3D3D3AAAAAA949494FF00FFFF00FFFF00FFD2A274
                  F8F3EDF8F4EEF8F4EDF8F3EDF8F3EDF8F3EDF8F2ECF7F2ECF2E6D7E2B27DDC98
                  6BFF00FFFF00FFFF00FFFF00FF9E9E9EF2F2F2F3F3F3F3F3F3F2F2F2F2F2F2F2
                  F2F2F1F1F1F1F1F1E4E4E4ACACAC959595FF00FFFF00FFFF00FFFF00FFE8CEB9
                  D7AA7CCC945BCA9055CA9055CA9055CA9155CB9055C98F55CF9D69DDB190FF00
                  FFFF00FFFF00FFFF00FFFF00FFCDCDCDA6A6A68E8E8E8A8A8A8A8A8A8A8A8A8B
                  8B8B8B8B8B8A8A8A999999AFAFAFFF00FFFF00FFFF00FFFF00FF}
                NumGlyphs = 2
                OnClick = sbCopyCSVDNClick
              end
            end
            object sgDuplicatesName: TAdvStringGrid
              Tag = 2
              Left = 2
              Top = 27
              Width = 1539
              Height = 781
              Cursor = crDefault
              Hint = 'double click to see all files belonging to the category'
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
              GridLineColor = 15062992
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgDuplicatesNameGetCellColor
              OnGetAlignment = sgDuplicatesNameGetAlignment
              OnCanSort = sgDuplicatesNameCanSort
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
              FixedColWidth = 372
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
              ColWidths = (
                372
                64
                64)
              RowHeights = (
                17
                17)
            end
          end
          object tsDuplicatesSize: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1543
            Height = 810
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
            object Panel2: TPanel
              Left = 2
              Top = 2
              Width = 1539
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                1539
                25)
              object sbGoDS: TSpeedButton
                Left = 1
                Top = 1
                Width = 23
                Height = 22
                Hint = 'show all duplicates'
                Flat = True
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DFB4
                  9300D59D7400D1966800CE926300CB8E5E00C98A5B00C7875600C3845200C384
                  5200C3845200C3845200C3845200C3845200D0A17D00FF00FF00FF00FF00D7A1
                  7500F8F2ED00F7F0EA00F6EDE600F4EAE200F3E7DE00F1E4DB00F0E2D800F0E2
                  D800F0E2D800F0E2D800F0E2D800F0E2D800C58B5E00FF00FF00FF00FF00D9A4
                  7A00F9F3EE00EBD2BE00FFFFFF00EBD3BF00FFFFFF00FFFFFF00FFFFFF00EAC7
                  AD00FFFFFF00FFFFFF00FFFFFF00F0E2D800C68C5F00FF00FF00FF00FF00DDA8
                  7E00F9F3EF00EBD0BA00EBD0BB00EBD0BB00EBD0BB00EBD0BB00EBD1BD00EACD
                  B500EACDB500EACDB500EACDB500F0E2D800C68A5C00FF00FF00FF00FF00DFAA
                  8200F9F3EF00EACEB700FFFFFF00EBD0BB00FFFFFF00FFFFFF00FFFFFF00EACF
                  BA00FBF6F200FFFFFF00FFFFFF00F0E2D800C88D5F00FF00FF00FF00FF00E1AE
                  8700FAF4F000EACBB200EACCB300EACCB300EACCB300EACCB300EACEB700E8C7
                  AC00E8C7AC00E8C8B000E8C8AE00F0E2D800C4865400FF00FF00FF00FF00E3B1
                  8C00FAF6F100EAC9AE00FFFFFF00EAC9B000FFFFFF00FFFFFF00FFFFFF00E8C7
                  AC00FFFFFF00FFFFFF00FFFFFF00F1E5DB00C6865500FF00FF00FF00FF00E5B4
                  8F00FAF6F200E9C6AA00E9C6AC00EAC7AC00E9C7AD00E9C9AE00E9C9B000E8C7
                  AC00E9C9B000E8C8B000E8CCB500F2E7DE00C88A5900FF00FF00FF00FF00E7B7
                  9400FBF7F400E9C3A600FFFFFF00E8C4A900FFFFFF00FFFFFF00FFFFFF00E8C7
                  AC00FFFFFF00FFFFFF00FFFFFF00F7F1EB00CB8F5F00FF00FF00FF00FF00E9BA
                  9800FBF7F400E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3
                  A600E9C3A600E9C3A600E9C3A600FBF7F400CE936400FF00FF00FF00FF00EBBD
                  9B00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FBF7F400D1976A00FF00FF00FF00FF00ECBF
                  9E00FBF7F4009CD5A50098D3A10094D09D0090CE98008BCB930087C98E0082C6
                  89007EC384007AC1800076BE7C00FBF7F400D49B6F00FF00FF00FF00FF00EFC6
                  A800FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
                  F400FBF7F400FBF7F400FBF7F400FBF7F400D8A37800FF00FF00FF00FF00F7E1
                  D200F1C8AC00EDC09F00EBBE9D00EBBC9A00E9BA9600E7B79300E6B59000E4B2
                  8C00E2AF8800E0AC8400DDA98000DCA57D00E2B69600FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                OnClick = sbGoDSClick
              end
              object sbSaveDS: TSpeedButton
                Left = 59
                Top = 1
                Width = 23
                Height = 22
                Hint = 'save the results to a file'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000C21E0000C21E00000000000000000000FF00FFCD9570
                  BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
                  31A76132AB693CBC8661FF00FF93939371717167676766666666666665656564
                  64646363636262626161616060605F5F5F606060676767838383C37D4FEBC6AD
                  EAC5ADFEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFB
                  F8C89A7CC79879AD6B407B7B7BC4C4C4C3C3C3FBFBFBFBFBFBFBFBFBFBFBFBFB
                  FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB989898969696696969BA6C38EDCAB3
                  E0A27AFEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
                  F6CA8D65C99B7CA761326A6A6AC8C8C89F9F9FFAFAFAB1B1B1B1B1B1B1B1B1B1
                  B1B1B1B1B1B1B1B1B1B1B1B1B1B1F9F9F98A8A8A989898606060BB6C38EECCB6
                  E1A27AFEFAF7BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2FDF9
                  F6CD9068CC9E81A861326B6B6BCACACA9F9F9FFAFAFAD6D6D6D6D6D6D6D6D6D6
                  D6D6D6D6D6D6D6D6D6D6D6D6D6D6F9F9F98D8D8D9C9C9C606060BB6B38EFCEB8
                  E1A279FEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
                  F6CF936ACEA384AA61326A6A6ACCCCCC9F9F9FFAFAFAB1B1B1B1B1B1B1B1B1B1
                  B1B1B1B1B1B1B1B1B1B1B1B1B1B1F9F9F9909090A0A0A0606060BA6A36EFD0BB
                  E2A27AFEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFB
                  F8D3966DD2A78AAB6232696969CECECE9F9F9FFBFBFBFBFBFBFBFBFBFBFBFBFB
                  FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB939393A4A4A4616161BB6A36F0D2BE
                  E2A37AE2A37AE1A37AE2A37BE1A37BE0A178DE9F77DD9F76DC9D74D99B72D899
                  71D69970D5AB8EAD6333696969D0D0D0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A09E
                  9E9E9C9C9C9C9C9C9A9A9A989898979797969696A8A8A8626262BB6A36F2D5C2
                  E3A37AE3A37AE2A37BE2A37BE2A47BE1A279E0A178DEA077DE9E75DC9D74DA9B
                  73D99B73DAB095AF6433696969D3D3D3A0A0A0A0A0A0A0A0A0A0A0A0A1A1A19F
                  9F9F9E9E9E9D9D9D9B9B9B9A9A9A999999989898AEAEAE636363BB6A36F2D8C5
                  E3A47BE3A37AE3A47AE2A47BE2A37BE1A37BE1A279DFA077DE9F76DD9E74DB9C
                  72DC9D74DDB59AB16534696969D6D6D6A1A1A1A0A0A0A1A1A1A1A1A1A0A0A0A0
                  A0A09F9F9F9D9D9D9C9C9C9B9B9B9999999A9A9AB2B2B2646464BB6B36F4D9C7
                  E6A67DC88C64C98D65C98E67CB926CCB926DCA9069C88C65C88C64C88C64C88C
                  64DA9C74E1BA9FB366346A6A6AD7D7D7A3A3A38989898A8A8A8B8B8B8F8F8F90
                  90908D8D8D8A8A8A898989898989898989999999B7B7B7656565BB6C37F4DCC9
                  E7A77DF9ECE1F9ECE1F9EDE3FCF4EEFDFAF7FDF7F3FAEDE5F7E7DBF7E5D9F6E5
                  D8DEA077E4BEA4B467346B6B6BDADADAA4A4A4EBEBEBEBEBEBECECECF4F4F4FA
                  FAFAF7F7F7EDEDEDE6E6E6E4E4E4E4E4E49D9D9DBBBBBB666666BD6E3AF5DDCC
                  E7A87EFAF0E8FAF0E8C98D66FAF0E9FDF8F3FEFAF8FCF4EFF9E9DFF7E7DBF7E5
                  D9E0A278E7C2A9B668356C6C6CDBDBDBA5A5A5EFEFEFEFEFEF8B8B8BF0F0F0F8
                  F8F8FAFAFAF4F4F4E8E8E8E6E6E6E4E4E49F9F9FC0C0C0676767C07442F6DFD0
                  E8A87EFCF6F1FCF6F1C88C64FAF1E9FBF4EEFDFAF7FDF9F6FAF0E8F8E8DDF7E6
                  DBE1A37AEFD5C3B76A36727272DDDDDDA5A5A5F6F6F6F6F6F6898989F0F0F0F4
                  F4F4FAFAFAF9F9F9EFEFEFE7E7E7E5E5E5A0A0A0D3D3D3686868C68255F6DFD1
                  E9AA80FEFAF6FDFAF6C88C64FBF3EEFBF1EAFCF6F2FEFBF8FCF6F1F9ECE2F8E7
                  DBEED0BAECD0BDBD7443808080DEDEDEA7A7A7FAFAFAFAFAFA898989F3F3F3F1
                  F1F1F6F6F6FBFBFBF6F6F6EBEBEBE6E6E6CDCDCDCECECE727272D6A585F6E0D1
                  F7E0D1FEFBF8FEFBF7FDF9F6FCF5F0FAF0EAFBF2EDFDF9F6FDFAF7FBF1EBF8E9
                  DFECD1BECD926AFF00FFA3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
                  F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FFF00FFE1BDA6D9AB8D
                  C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
                  44C98D65FF00FFFF00FFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
                  69696969696B6B6B6D6D6D6B6B6B7373738A8A8AFF00FFFF00FF}
                NumGlyphs = 2
                OnClick = sbSaveDSClick
              end
              object sbCopyDS: TSpeedButton
                Left = 107
                Top = 1
                Width = 23
                Height = 22
                Hint = 'copy the results to the clipboard'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFD39570CC8357C87646CA7B4ECB7B4ECA7B4ECA7B
                  4ECA7B4ECA8155CD865CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF94949482
                  82827575757B7B7B7B7B7B7B7B7B7B7B7B7A7A7A808080848484FF00FF4A80AB
                  206398206398206398206398C98F67FCF3ECFAF1E8FAF0E7FBF1E9FBF2EAFBF2
                  EAFBF2EBFDF4EECB8358FF00FF8A8A8A6F6F6F6F6F6F6F6F6F6F6F6F8C8C8CF3
                  F3F3F0F0F0EFEFEFF0F0F0F1F1F1F1F1F1F2F2F2F4F4F48181815588B174ADD8
                  7BB2DD78AEDC75AADA74A9DADAA97DEFF1E7FFE9D9FFEADBFFE9D9FFE7D7FFE5
                  D2FFE2CBEFF2E8CE8156919191B6B6B6BBBBBBB7B7B7B4B4B4B3B3B3A4A4A4EF
                  EFEFE7E7E7E8E8E8E7E7E7E5E5E5E3E3E3DFDFDFF0F0F080808020639880B9E1
                  5395D15092D04E8ECE4D8CCDD6A97DFBF5EEFFE9D9FFEADBFFE9D9FFE7D7FFE5
                  D2FFE2CBFBF6EFCC83566F6F6FC0C0C0A2A2A2A0A0A09D9D9D9B9B9BA4A4A4F4
                  F4F4E7E7E7E8E8E8E7E7E7E5E5E5E3E3E3DFDFDFF5F5F581818120639884BFE2
                  569AD35397D15092CF5091CFD6A97DFFF7F1FFE9D9FFEADBFFE9D9FFE7D7FFE5
                  D2FFE2CBFFF7F1CB85566F6F6FC5C5C5A6A6A6A4A4A4A0A0A09F9F9FA4A4A4F7
                  F7F7E7E7E7E8E8E8E7E7E7E5E5E5E3E3E3DFDFDFF7F7F782828220639888C4E6
                  599FD6569BD35397D15395D1D7AC7FFFF7F0FFE7D5FDE7D6FDE6D4FCE4D0FBE3
                  CBFADCC2FEF3E8CC86576F6F6FCACACAAAAAAAA7A7A7A4A4A4A2A2A2A7A7A7F7
                  F7F7E5E5E5E5E5E5E4E4E4E1E1E1E0E0E0D9D9D9F2F2F28383832063988BC9E7
                  5CA5D759A0D5579CD3569AD3D7AC7FFFF7F2FEE7D5FEE7D5FDE5D1FAE0CAF9DE
                  C4F7D9BCFDF2E7CC87586F6F6FCDCDCDAFAFAFABABABA7A7A7A6A6A6A7A7A7F7
                  F7F7E5E5E5E5E5E5E2E2E2DDDDDDDBDBDBD5D5D5F1F1F184848420639891CDE9
                  5FA9D95DA5D85AA0D6599FD6D8AD81FEF7F1FCE5D2FCE4D1FBE2CCF9DDC4F6D7
                  BBF3D1AFFAEFE4CC87596F6F6FD1D1D1B2B2B2AFAFAFABABABAAAAAAA8A8A8F7
                  F7F7E3E3E3E2E2E2DFDFDFDADADAD3D3D3CDCDCDEEEEEE84848420639898D2EB
                  65AEDA60AAD95DA6D85CA5D7D9AF84FEF6F0FCE2CDFCE3CDFADFC8F7D9BCF5E9
                  DDFAF3EBFBF8F3CA83546F6F6FD5D5D5B6B6B6B3B3B3B0B0B0AFAFAFAAAAAAF6
                  F6F6E0E0E0E0E0E0DCDCDCD5D5D5E8E8E8F2F2F2F7F7F78080802063989ED6ED
                  6BB2DC66AFDC60AADA5FA9D9D9AF84FEF5EDFCDEC5FBE0C7F9DCC2F5D3B4FEF9
                  F3FAE2C4ECC193D2986E6F6F6FD9D9D9B9B9B9B7B7B7B3B3B3B2B2B2AAAAAAF4
                  F4F4DBDBDBDDDDDDD9D9D9CFCFCFF9F9F9DEDEDEBBBBBB969696206398A5DAEF
                  6FB5DE68B0DC60A9D95FA9D9D7AD81FFFFFEFDF3E9FDF3EAFCF2E8FAEFE3FAF2
                  E7EABB88D39469FF00FF6F6F6FDDDDDDBCBCBCB8B8B8B2B2B2B2B2B2A8A8A8FF
                  FFFFF2F2F2F2F2F2F1F1F1EEEEEEF1F1F1B5B5B5919191FF00FF206398AADDF1
                  74B9E070B6DF6CB3DD6BB2DCD9AF84D7AE81D7AC7FD7AC7FCCA070CD9F71B38F
                  67D39B71FF00FFFF00FF6F6F6FE0E0E0C0C0C0BDBDBDBABABAB9B9B9AAAAAAA8
                  A8A8A7A7A7A7A7A79A9A9A9A9A9A8A8A8A989898FF00FFFF00FF206398B0E1F2
                  79BDE24498DD4497DC4396DC4296DC4295DC4195DB539ED489C6E6206398FF00
                  FFFF00FFFF00FFFF00FF6F6F6FE3E3E3C3C3C3A8A8A8A7A7A7A6A6A6A6A6A6A6
                  A6A6A5A5A5A9A9A9CBCBCB6F6F6FFF00FFFF00FFFF00FFFF00FF3B76A595C9E0
                  AEE2F24E9DDFB5EEFD75D4F075D4F0B5EEFD4B9BDE8ECBE993CDE92A6A9DFF00
                  FFFF00FFFF00FFFF00FF818181CCCCCCE4E4E4ACACACEFEFEFD7D7D7D7D7D7EF
                  EFEFAAAAAACFCFCFD1D1D1767676FF00FFFF00FFFF00FFFF00FFFF00FF6392B7
                  2063983775A4B6EFFE80DBF380DBF3B6EFFE2E6EA12063986F9ABCFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF9A9A9A6F6F6F7F7F7FF0F0F0DDDDDDDDDDDDF0
                  F0F07979796F6F6FA2A2A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF2063982063982063982063982063982D6C9EFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F6F6F6F6F6F6F6F6F6F6F
                  6F6F777777FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                NumGlyphs = 2
                OnClick = sbCopyDSClick
              end
              object SpeedButton5: TSpeedButton
                Left = 20
                Top = 1
                Width = 23
                Height = 22
                Hint = 'copy the results to the clipboard'
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFA393839D7753A3703EA2703F9D7855A39385FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA39282AB6D31AD6C2DAD6C2DAD
                  6C2DAD6C2DAD6C2DAD6C2DAB6E33A49688FF00FFFF00FFFF00FFFF00FFFF00FF
                  9C7F62AD6C2DAD6C2DAD6C2DAD6C2DBB8751B8824CAD6C2DAD6C2DAD6C2DAD6C
                  2D9D8369FF00FFFF00FFFF00FFA29181AD6C2DAD6C2DAD6C2DAD6C2DB3793FFF
                  FFFFFFFFFFAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA49688FF00FFFF00FFAB6D31
                  AD6C2DAD6C2DAD6C2DAD6C2DB07237FFFFFFFFFFFFAD6C2DAD6C2DAD6C2DAD6C
                  2DAD6C2DA96C32FF00FFA1907FAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAE6E30AD
                  6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA395869E764FAD6C2D
                  AD6C2DAD6C2DAD6C2DAD6C2DAE6F31FCFBF8FFFFFFB3773DAD6C2DAD6C2DAD6C
                  2DAD6C2DAD6C2D9D7955A66F3AAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DDE
                  C5AEFFFFFFFFFFFFB8814BAD6C2DAD6C2DAD6C2DAD6C2DA27140A56E39AD6C2D
                  AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAF6F32E4D0BCFFFFFFFFFFFFB57C44AD6C
                  2DAD6C2DAD6C2DA370409E754DAD6C2DAD6C2DAD6C2DC08F5ECFAA87B67E47AD
                  6C2DAD6D2EE5D1BEFFFFFFD6B698AD6C2DAD6C2DAD6C2D9D7752A08D7AAD6C2D
                  AD6C2DAD6C2DDCC2A8FFFFFFDEC5ADAD6C2DAD6C2DE0C8B1FFFFFFD9BCA0AD6C
                  2DAD6C2DAD6C2DA29281FF00FFAC6D2FAD6C2DAD6C2DBB8753FFFFFFFFFFFFF0
                  E4D8F1E6DBFFFFFFFFFFFFBC8854AD6C2DAD6C2DAB6D31FF00FFFF00FF9F8B78
                  AD6C2DAD6C2DAD6C2DBF8E5DEADACBFFFFFFFFFFFFEADACBC19162AD6C2DAD6C
                  2DAD6C2DA29080FF00FFFF00FFFF00FF9C7B59AD6C2DAD6C2DAD6C2DAD6C2DAD
                  6C2EAD6C2DAD6C2DAD6C2DAD6C2DAD6C2D9B7D5FFF00FFFF00FFFF00FFFF00FF
                  FF00FF9F8A75AC6C2FAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAC6D2F9F8C
                  79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F8A75A17347A9
                  6D33A86D349F73489F8B78FF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton5Click
              end
              object lDCountDS: THTMLabel
                Left = 136
                Top = 7
                Width = 198
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HTMLText.Strings = (
                  '...')
                ParentFont = False
                Transparent = True
                Version = '2.1.0.0'
                ExplicitWidth = 308
              end
              object sbCopyCSVDS: TSpeedButton
                Left = 83
                Top = 1
                Width = 23
                Height = 22
                Hint = 'save in CSV format'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000C21E0000C21E00000000000000000000FF00FFE2C0AA
                  CC8D66C07140BC6B36BC6B36BC6B36BC6A36BC6A36BB6A35BB6A35BB6935BD6E
                  3BCA8B63E3C2AEFF00FFFF00FFC0C0C08D8D8D7171716B6B6B6B6B6B6B6B6B6A
                  6A6A6A6A6A6969696969696969696E6E6E8B8B8BC2C2C2FF00FFFF00FFC57C4D
                  F8F2EBF7ECDFF6EBDEF6EADEF6EADCF6EADCFAF3EBFAF3EBFAF2EAFCF7F3FCF8
                  F4FEFEFDC37A4DFF00FFFF00FF7C7C7CF1F1F1EAEAEAE9E9E9E9E9E9E8E8E8E8
                  E8E8F2F2F2F2F2F2F1F1F1F7F7F7F8F8F8FEFEFE7A7A7AFF00FFFF00FFC27740
                  F5EBDFFCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4
                  D1FDFBF8BC6B37FF00FFFF00FF757575EAEAEAE2E2E2E2E2E2E2E2E2E2E2E2E2
                  E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2FBFBFB6B6B6BFF00FFFF00FFC37C42
                  F7EDE3FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4D1FCE4
                  D1FBF7F4BD6C37FF00FFFF00FF797979ECECECE2E2E2E2E2E2E2E2E2E2E2E2E2
                  E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2F7F7F76C6C6CFF00FFFF00FFC68046
                  F7F0E6FCE4D1FCE4D1E5D9C2689E705796655997666CA073FCE4D1FCE4D1FCE4
                  D1FCF9F5C1743CFF00FFFF00FF7D7D7DEFEFEFE2E2E2E2E2E2D5D5D59393938A
                  8A8A8B8B8B959595E2E2E2E2E2E2E2E2E2F9F9F9727272FF00FF3284491A7533
                  197533197433448A52619B6BBBD6C378BB8461AB6A579664FCE2CCFBE0C9FBE1
                  C8FDFAF7C37A41FF00FF7777776767676767676666667D7D7D8F8F8FD1D1D1AD
                  ADAD9C9C9C8A8A8ADFDFDFDDDDDDDEDEDEFAFAFA777777FF00FFA3C8AD1B7533
                  5BA06E49965C47905BC7DDCD5DB67167AE75448D581B7533FCE2CDFBE1CBFBE1
                  C9FBF7F2C78045FF00FFC2C2C2676767939393888888838383D8D8D8A6A6A6A0
                  A0A0808080676767E0E0E0DEDEDEDEDEDEF7F7F77D7D7DFF00FFFF00FF828143
                  1F783748915DC7DDCD6AC08471B682448E59B1C1A1FBE4D0FBE3CCFADFC7FADF
                  C6FAF2EAC88448FF00FFFF00FF7777776A6A6A848484D8D8D8B1B1B1A9A9A981
                  8181BABABAE1E1E1E0E0E0DCDCDCDCDCDCF1F1F1808080FF00FFFF00FFC48C4F
                  619E71C5DCCC76C99773BC87438D58559360F5E0CCFBE1CCFAE0C7F9DDC3F8DC
                  C2FAF4EDC8864BFF00FFFF00FF868686939393D7D7D7BBBBBBAEAEAE80808087
                  8787DDDDDDDFDFDFDDDDDDDADADAD9D9D9F3F3F3828282FF00FFFF00FF718C55
                  C0D9C882D3A36DC18A5495634B9660519764679A68F4DCC3F8DCC2F6DABDF6D8
                  BBFAF4EFC8874CFF00FFFF00FF818181D4D4D4C6C6C6B3B3B38989898989898A
                  8A8A8E8E8ED9D9D9D9D9D9D6D6D6D4D4D4F4F4F4838383FF00FF80B28EB5D3BE
                  9CDAB574C8955495634A935F5DA47459A16E509764629762E9D1B4F3D4B5F1D2
                  B3F8F4F0C6864CFF00FFA9A9A9CDCDCDD0D0D0BABABA89898986868698989894
                  94948A8A8A8B8B8BCDCDCDD0D0D0CECECEF4F4F4828282FF00FF5B9C6E568C57
                  539666549563A1B9958DAE832E7F422E7F413A844836824590B490F7F2ECFBF7
                  F3F5EFE9C38048FF00FF9090908080808A8A8A898989B1B1B1A4A4A471717171
                  7171767676747474ABABABF1F1F1F7F7F7EEEEEE7D7D7DFF00FFFF00FFC88D52
                  F9F5F1FCE3CDFBE3CEFBE3CDFBE2CBF9E0C8F8DCC2F5D6BAFDFBF8FCE6CDFAE5
                  C9E2B684D5A884FF00FFFF00FF888888F5F5F5E0E0E0E0E0E0E0E0E0DFDFDFDD
                  DDDDD9D9D9D2D2D2FBFBFBE2E2E2E1E1E1B0B0B0A6A6A6FF00FFFF00FFCA925A
                  FAF6F2FAE0C7FBE1C9FBE2C9FBE0C8F9DFC5F8DBC1F4D6B8FFFBF8F6D8B4E1B0
                  7DDC9669FF00FFFF00FFFF00FF8D8D8DF6F6F6DDDDDDDEDEDEDFDFDFDDDDDDDC
                  DCDCD8D8D8D2D2D2FBFBFBD3D3D3AAAAAA949494FF00FFFF00FFFF00FFD2A274
                  F8F3EDF8F4EEF8F4EDF8F3EDF8F3EDF8F3EDF8F2ECF7F2ECF2E6D7E2B27DDC98
                  6BFF00FFFF00FFFF00FFFF00FF9E9E9EF2F2F2F3F3F3F3F3F3F2F2F2F2F2F2F2
                  F2F2F1F1F1F1F1F1E4E4E4ACACAC959595FF00FFFF00FFFF00FFFF00FFE8CEB9
                  D7AA7CCC945BCA9055CA9055CA9055CA9155CB9055C98F55CF9D69DDB190FF00
                  FFFF00FFFF00FFFF00FFFF00FFCDCDCDA6A6A68E8E8E8A8A8A8A8A8A8A8A8A8B
                  8B8B8B8B8B8A8A8A999999AFAFAFFF00FFFF00FFFF00FFFF00FF}
                NumGlyphs = 2
                OnClick = sbCopyCSVDSClick
              end
            end
            object sgDuplicatesSize: TAdvStringGrid
              Tag = 3
              Left = 2
              Top = 27
              Width = 1539
              Height = 781
              Cursor = crDefault
              Hint = 'double click to see all files belonging to the category'
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
              GridLineColor = 15062992
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgDuplicatesNameGetCellColor
              OnGetAlignment = sgDuplicatesNameGetAlignment
              OnCanSort = sgDuplicatesNameCanSort
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
              FixedColWidth = 396
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
              ColWidths = (
                396
                64
                64)
              RowHeights = (
                17
                17)
            end
          end
        end
      end
    end
  end
  object puSearch: TPopupMenu
    OnPopup = puSearchPopup
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
    object miSSave: TMenuItem
      Caption = '.'
      ImageIndex = 66
      OnClick = miSSaveClick
    end
  end
  object puQuickSearch: TPopupMenu
    Left = 881
  end
end
