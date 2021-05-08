object FrameFolderHistory: TFrameFolderHistory
  Left = 0
  Top = 0
  Width = 1520
  Height = 912
  DoubleBuffered = True
  Color = clFuchsia
  ParentBackground = False
  ParentColor = False
  ParentDoubleBuffered = False
  TabOrder = 0
  object tpFHMain: TAdvSmoothTabPager
    Left = 0
    Top = 0
    Width = 1520
    Height = 912
    Fill.Color = 3355443
    Fill.ColorTo = clSilver
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
    ActivePage = tsFHMainStatus
    Color = clWhite
    TabPosition = tpTopLeft
    TabTextOrientation = toHorizontal
    TabSettings.RightMargin = 0
    TabSettings.StartMargin = 4
    TabSettings.Spacing = 5
    TabReorder = False
    OnChange = tpFHStatsChange
    OnResize = tpFHStatsResize
    TabOrder = 0
    object tsFHMainStatus: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1518
      Height = 884
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
      TabAppearance.BevelColorSelected = 13542013
      TabAppearance.BevelColorHot = 16640730
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 21
      object Panel46: TPanel
        Left = 2
        Top = 2
        Width = 1514
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        Color = 3355443
        ParentBackground = False
        TabOrder = 0
        object lFHAvailablePath: TLabel
          Left = 114
          Top = 30
          Width = 4
          Height = 13
          Caption = '.'
        end
        object sbFHFolderInfo: TSpeedButton
          Left = 770
          Top = 27
          Width = 23
          Height = 22
          Hint = 'show information for the selected Folder History entry'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFA393839D7753A3703EA2703F9D7855A39385FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA39282AB6D31AD6C2DAD6C2DAD
            6C2DAD6C2DAD6C2DAD6C2DAB6E33A49688FF00FFFF00FFFF00FFFF00FFFF00FF
            9C7F62AD6C2DAD6C2DAD6C2DAD6C2DEDDFD1D9BCA3AD6C2DAD6C2DAD6C2DAD6C
            2D9D8369FF00FFFF00FFFF00FFA29181AD6C2DAD6C2DAD6C2DAD6C2DAD6D2EFF
            FFFFEBDED5AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA49688FF00FFFF00FFAB6D31
            AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DFFFFFFEBDED5AD6C2DAD6C2DAD6C2DAD6C
            2DAD6C2DA96C32FF00FFA1907FAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DFF
            FFFFEBDED5AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA395869E764FAD6C2D
            AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DFFFFFFEBDED5AD6D2EAD6C2DAD6C2DAD6C
            2DAD6C2DAD6C2D9D7955A66F3AAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DFF
            FFFFEBDED5AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DA27140A56E39AD6C2D
            AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DFFFFFFEBDED5AD6C2DAD6C2DAD6C2DAD6C
            2DAD6C2DAD6C2DA370409E754DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DFF
            FFFFEBDED5AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2D9D7752A08D7AAD6C2D
            AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C
            2DAD6C2DAD6C2DA29281FF00FFAC6D2FAD6C2DAD6C2DAD6C2DAD6C2DAE6D2FFA
            F7F5F0E7E0AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAB6D31FF00FFFF00FF9F8B78
            AD6C2DAD6C2DAD6C2DAD6C2DAD6C2DF0E7E0EBDED5AD6C2DAD6C2EAD6C2DAD6C
            2DAD6C2DA29080FF00FFFF00FFFF00FF9C7B59AD6C2DAD6C2DAD6C2DAD6C2DAD
            6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2D9B7D5FFF00FFFF00FFFF00FFFF00FF
            FF00FF9F8A75AC6C2FAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAD6C2DAC6D2F9F8C
            79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F8A75A17347A9
            6D33A86D349F73489F8B78FF00FFFF00FFFF00FFFF00FFFF00FF}
          OnClick = sbFHFolderInfoClick
        end
        object lFHAvailableComputer: TLabel
          Left = 114
          Top = 3
          Width = 4
          Height = 13
          Caption = '.'
        end
        object sbFHGetDate: TSpeedButton
          Left = 3
          Top = 65
          Width = 23
          Height = 22
          Enabled = False
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD8A37A
            D3996ED19668CE9263CB8E5EC98A5BC78756C38452C38452C38452C38452C384
            52C38452C18454FF00FFFF00FF9F9F9F959495928F928E8E8E8A8A8A88888884
            8484808080808080818181808080818181808080818181FF00FFFF00FFD7A175
            F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
            D8F0E2D8C58A5DFF00FFFF00FF9C9C9CF2F2F2EFEFEFECECECEAEAEAE6E6E6E3
            E3E3E1E1E1E1E1E1E1E1E1E0E0E0E0E0E0E0E0E0868686FF00FFFF00FFD9A47A
            F9F3EEEBD2BEFFFFFFEBD3BFFFFFFFEBD3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF0E2D8C68C5FFF00FFFF00FF9F9F9FF3F3F3D0D0D0FFFFFFD0D0D0FFFFFFD1
            D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1888888FF00FFFF00FFDDA87E
            F9F3EFEBD0BAEBD0BBEACDB5EACDB5EACDB5EBD1BDEACDB5EACDB5EACDB5EACD
            B5F0E2D8C68A5CFF00FFFF00FFA3A3A3F3F3F3CDCDCDCDCDCDC9C9C9C9C9C9CA
            CACACFCFCFCACACACACACAC9C9C9CACACAE0E0E0868686FF00FFFF00FFDFAA82
            F9F3EFEACEB7FFFFFFEACDB5FFFFFFEACDB5FFFFFFEACFBAFFFFFFEACDB5FFFF
            FFF0E2D8C88D5FFF00FFFF00FFA7A7A7F3F3F3CCCCCCFFFFFFCACACAFFFFFFCA
            CACAFFFFFFCCCCCCFFFFFFCACACAFFFFFFE0E0E08A8A8AFF00FFFF00FFE1AE87
            FAF4F0EACBB2EACCB3EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5E8C8
            AEF0E2D8C48654FF00FFFF00FFAAAAAAF3F3F3C8C8C8C9C9C9CACACACBCBCBCA
            CACACACACACACACACBCBCBCACACAC5C5C5E1E1E1828282FF00FFFF00FFE3B18C
            FAF6F1EAC9AEFFFFFFEAC9B0FFFFFFE9CBB3FFFFFFEACDB5FFFFFFEACDB5FFFF
            FFF0E2D8C68655FF00FFFF00FFADADADF5F5F5C5C5C5FFFFFFC5C5C5FFFFFFC8
            C8C8FFFFFFCACACAFFFFFFCACACAFFFFFFE1E1E1838383FF00FFFF00FFE5B48F
            FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0EACDB5EACDB5EACDB5E8CC
            B5F0E2D8C88A59FF00FFFF00FFB1B1B1F5F5F5C2C2C2C3C3C3C4C4C4C4C4C4C5
            C5C5C6C6C6CBCBCBCACACACACACAC9C9C9E1E1E1868686FF00FFFF00FFE7B794
            FBF7F4FFFFFFFFFFFFE8C4A9FFFFFFE9C6AAFFFFFFE8C7ACFFFFFFE8C8B0FFFF
            FFF7F1EBCB8F5FFF00FFFF00FFB3B3B3F7F7F7FFFFFFFFFFFFC0C0C0FFFFFFC3
            C3C3FFFFFFC4C4C4FFFFFFC4C4C4FFFFFFF1F1F18B8B8BFF00FFFF00FFE9BA98
            FBF7F465A4FF64A3FF62A2FF61A1FF5F9FFF5C9DFF5A9AFF5798FF5495FF5294
            FFFBF7F4CE9364FF00FFFF00FFB6B6B6F7F7F7BCBCBCBABABABABABAB8B8B8B8
            B8B8B7B7B7B5B5B5B4B4B4B2B2B2B1B1B1F7F7F78F8F8FFF00FFFF00FFEBBD9B
            FBF7F464A4FF79BDFF75BBFF71B9FF6DB8FF68B3FF61B0FF5AABFF54A7FF3B7D
            FFFBF7F4D1976AFF00FFFF00FFBABABAF6F6F6BBBBBBCBCBCBCACACAC8C8C8C7
            C7C7C4C4C4C2C2C2BFBFBFBCBCBCA3A3A3F6F6F6939393FF00FFFF00FFECBF9E
            FBF7F465A4FF64A3FF60A0FF5D9EFF5899FF5496FF4D90FF478BFF4284FF3D7F
            FFFBF7F4D49B6FFF00FFFF00FFBCBCBCF6F6F6BBBBBBBBBBBBB8B8B8B7B7B7B3
            B3B3B3B3B3AFAFAFACACACA8A8A8A5A5A5F7F7F7979797FF00FFFF00FFEEC1A2
            FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7
            F4FBF7F4D7A074FF00FFFF00FFBEBEBEF7F7F7F7F7F7F6F6F6F6F6F6F6F6F6F7
            F7F7F7F7F7F6F6F6F6F6F6F7F7F7F6F6F6F7F7F79C9C9CFF00FFFF00FFF3D2BA
            EFC2A3EDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
            80DCA57DDCA780FF00FFFF00FFD0D0D0BFBFBFBDBDBDBBBBBBB9B9B9B6B6B6B3
            B3B3B1B1B1AEAEAEABABABA9A9A9A5A5A5A1A1A1A4A4A4FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          NumGlyphs = 2
          OnClick = sbFHGetDateClick
        end
        object llFHPleaseWait: TLabel
          Left = 238
          Top = 70
          Width = 4
          Height = 13
          Caption = '.'
          Visible = False
        end
        object sbFHOpenFolder: TAeroButton
          Left = 6
          Top = 0
          Width = 97
          Height = 48
          Hint = 'open the selected Folder History entry'
          ImageIndex = 34
          Version = '1.0.0.1'
          TabOrder = 0
          OnClick = sbFHOpenFolderClick
        end
        object cbFHAvailableComputer: TComboBox
          Left = 238
          Top = 0
          Width = 219
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          OnChange = cbFHAvailableComputerChange
        end
        object cbFHAvailablePath: TComboBox
          Left = 296
          Top = 27
          Width = 468
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnChange = cbFHAvailablePathChange
        end
        object bFHISelect: TBitBtn
          Left = 31
          Top = 65
          Width = 158
          Height = 22
          Enabled = False
          TabOrder = 3
          OnClick = bFHISelectClick
        end
        object cbFHAvailableFilter: TComboBox
          Left = 238
          Top = 27
          Width = 52
          Height = 21
          Style = csDropDownList
          TabOrder = 4
          OnChange = cbFHAvailableFilterChange
        end
      end
      object tpFHStats: TAdvSmoothTabPager
        Left = 2
        Top = 91
        Width = 1514
        Height = 791
        Fill.Color = 3355443
        Fill.ColorTo = clSilver
        Fill.ColorMirror = clNone
        Fill.ColorMirrorTo = clNone
        Fill.GradientType = gtSolid
        Fill.GradientMirrorType = gtSolid
        Fill.BorderColor = 3355443
        Fill.BorderWidth = 0
        Fill.Rounding = 0
        Fill.ShadowColor = clWhite
        Fill.ShadowOffset = 0
        Fill.Glow = gmNone
        Transparent = False
        Align = alClient
        ActivePage = tsFHChart
        Color = 3355443
        TabPosition = tpTopLeft
        TabTextOrientation = toHorizontal
        TabSettings.RightMargin = 0
        TabSettings.StartMargin = 4
        TabSettings.Spacing = 5
        TabReorder = False
        Visible = False
        OnChange = tpFHStatsChange
        OnResize = tpFHStatsResize
        TabOrder = 1
        object tsFHChart: TAdvSmoothTabPage
          Left = 1
          Top = 26
          Width = 1512
          Height = 763
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
          TabAppearance.Appearance.PictureAlignment = taLeftJustify
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
          TabAppearance.BevelColor = clWhite
          TabAppearance.BevelColorDown = clWhite
          TabAppearance.BevelColorSelected = 13542013
          TabAppearance.BevelColorHot = 16640730
          TabAppearance.BevelColorDisabled = clWhite
          TabAppearance.Color = clWhite
          TabAppearance.ColorDown = clWhite
          TabAppearance.ColorSelected = clWhite
          TabAppearance.ColorDisabled = 15658734
          TMSStyle = 21
          object Panel42: TPanel
            Left = 2
            Top = 2
            Width = 220
            Height = 759
            Align = alLeft
            TabOrder = 0
            object clbFolderHistory: TCheckListBox
              Left = 1
              Top = 278
              Width = 218
              Height = 480
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              ItemHeight = 13
              TabOrder = 0
              OnClick = rbFHCountClick
            end
            object Panel19: TPanel
              Tag = 132
              Left = 1
              Top = 81
              Width = 218
              Height = 142
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              FullRepaint = False
              ParentBackground = False
              TabOrder = 1
              object lFHCCategory: TLabel
                Tag = 1
                Left = 13
                Top = 5
                Width = 203
                Height = 13
                Cursor = crHandPoint
                AutoSize = False
                Caption = '.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = lFHCFilesClick
              end
              object sbFHCF1: TSpeedButton
                Left = 12
                Top = 24
                Width = 40
                Height = 22
                Hint = 'toggle temporary files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF6: TSpeedButton
                Tag = 5
                Left = 12
                Top = 48
                Width = 40
                Height = 22
                Hint = 'toggle audio files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF7: TSpeedButton
                Tag = 6
                Left = 52
                Top = 48
                Width = 40
                Height = 22
                Hint = 'toggle "Office" files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF2: TSpeedButton
                Tag = 1
                Left = 52
                Top = 24
                Width = 40
                Height = 22
                Hint = 'toggle program files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF3: TSpeedButton
                Tag = 2
                Left = 92
                Top = 24
                Width = 40
                Height = 22
                Hint = 'toggle system files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF8: TSpeedButton
                Tag = 7
                Left = 92
                Top = 48
                Width = 40
                Height = 22
                Hint = 'toggle programming files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF9: TSpeedButton
                Tag = 8
                Left = 132
                Top = 48
                Width = 40
                Height = 22
                Hint = 'toggle compressed files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF4: TSpeedButton
                Tag = 3
                Left = 132
                Top = 24
                Width = 40
                Height = 22
                Hint = 'toggle graphics files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF5: TSpeedButton
                Tag = 4
                Left = 172
                Top = 24
                Width = 40
                Height = 22
                Hint = 'toggle video files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF10: TSpeedButton
                Tag = 9
                Left = 172
                Top = 48
                Width = 40
                Height = 22
                Hint = 'toggle other files'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF15: TSpeedButton
                Tag = 14
                Left = 172
                Top = 80
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 5 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF20: TSpeedButton
                Tag = 19
                Left = 172
                Top = 104
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 10 category'
                Enabled = False
                Flat = True
                OnDblClick = sbFHCF1Click
              end
              object sbFHCF19: TSpeedButton
                Tag = 18
                Left = 132
                Top = 104
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 9 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF14: TSpeedButton
                Tag = 13
                Left = 132
                Top = 80
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 4 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF13: TSpeedButton
                Tag = 12
                Left = 92
                Top = 80
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 3 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF18: TSpeedButton
                Tag = 17
                Left = 92
                Top = 104
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 8 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF17: TSpeedButton
                Tag = 16
                Left = 52
                Top = 104
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 7 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF12: TSpeedButton
                Tag = 11
                Left = 52
                Top = 80
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 2 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF11: TSpeedButton
                Tag = 10
                Left = 12
                Top = 80
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 1 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object sbFHCF16: TSpeedButton
                Tag = 15
                Left = 12
                Top = 104
                Width = 40
                Height = 22
                Hint = 'toggle files in the Custom 6 category'
                Enabled = False
                Flat = True
                OnClick = sbFHCF1Click
              end
              object Image36: TImage
                Left = 0
                Top = 5
                Width = 9
                Height = 9
                Picture.Data = {
                  07544269746D61707A010000424D7A0100000000000036000000280000000900
                  000009000000010020000000000044010000120B0000120B0000000000000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
                  8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008E8E
                  8E00A6A6A6008E8E8E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009999
                  9900A6A6A600A6A6A600A6A6A60099999900FF00FF00FF00FF00FF00FF00A6A6
                  A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600FF00FF00C4C4
                  C400A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500C4C4
                  C400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00}
                Transparent = True
              end
            end
            object Panel51: TPanel
              Tag = 80
              Left = 1
              Top = 1
              Width = 218
              Height = 80
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              FullRepaint = False
              ParentBackground = False
              TabOrder = 2
              object lFHCFiles: TLabel
                Left = 13
                Top = 4
                Width = 196
                Height = 13
                Cursor = crHandPoint
                AutoSize = False
                Caption = '.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                OnClick = lFHCFilesClick
              end
              object lFHCMagnitude: TLabel
                Left = 13
                Top = 40
                Width = 4
                Height = 13
                Caption = '.'
              end
              object Image35: TImage
                Tag = 1
                Left = 0
                Top = 5
                Width = 9
                Height = 9
                Picture.Data = {
                  07544269746D61707A010000424D7A0100000000000036000000280000000900
                  000009000000010020000000000044010000120B0000120B0000000000000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
                  8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008E8E
                  8E00A6A6A6008E8E8E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009999
                  9900A6A6A600A6A6A600A6A6A60099999900FF00FF00FF00FF00FF00FF00A6A6
                  A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600FF00FF00C4C4
                  C400A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500C4C4
                  C400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00}
                Transparent = True
              end
              object rbFHCount: TAdvOfficeRadioButton
                Left = 4
                Top = 18
                Width = 100
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                TabStop = True
                OnClick = rbFHCountClick
                Alignment = taLeftJustify
                Caption = '.'
                Checked = True
                ReturnIsTab = False
                Version = '1.5.0.9'
              end
              object rbFHSize: TAdvOfficeRadioButton
                Left = 113
                Top = 18
                Width = 100
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = rbFHCountClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.5.0.9'
              end
              object rbFHMagCount: TAdvOfficeRadioButton
                Left = 4
                Top = 55
                Width = 100
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnClick = rbFHCountClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.5.0.9'
              end
              object rbFHMagSize: TAdvOfficeRadioButton
                Left = 113
                Top = 55
                Width = 100
                Height = 20
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnClick = rbFHCountClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.5.0.9'
              end
            end
            object Panel52: TPanel
              Left = 1
              Top = 223
              Width = 218
              Height = 55
              Align = alTop
              BevelOuter = bvLowered
              Color = 3355443
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 3
              object lFHFolderCount: TLabel
                Left = 13
                Top = 4
                Width = 56
                Height = 13
                AutoSize = False
                Caption = '.'
              end
              object lFHFolders: TLabel
                Left = 75
                Top = 4
                Width = 16
                Height = 13
                Caption = '....'
              end
              object lFHCFilesCount: TLabel
                Left = 13
                Top = 20
                Width = 56
                Height = 13
                AutoSize = False
                Caption = '.'
              end
              object lFHFileCount: TLabel
                Left = 75
                Top = 20
                Width = 16
                Height = 13
                Caption = '....'
              end
              object lFHCTotalSize: TLabel
                Left = 13
                Top = 36
                Width = 56
                Height = 13
                AutoSize = False
                Caption = '.'
              end
              object lFHFileSize: TLabel
                Left = 75
                Top = 36
                Width = 16
                Height = 13
                Caption = '....'
              end
            end
          end
          object vtcFolderHistory: TChart
            Left = 222
            Top = 2
            Width = 1288
            Height = 759
            Gradient.Direction = gdBottomTop
            Gradient.EndColor = 16579071
            Legend.Alignment = laLeft
            MarginLeft = 4
            MarginRight = 4
            MarginUnits = muPixels
            Title.Text.Strings = (
              '....')
            BottomAxis.Ticks.Visible = False
            View3D = False
            View3DOptions.Elevation = 315
            View3DOptions.Orthogonal = False
            View3DOptions.Perspective = 0
            View3DOptions.Rotation = 360
            Align = alClient
            BevelOuter = bvNone
            Color = 4194368
            PopupMenu = puCharts
            TabOrder = 1
            DefaultCanvas = 'TGDIPlusCanvas'
            ColorPaletteIndex = 13
          end
        end
        object tsFHTable: TAdvSmoothTabPage
          Left = 1
          Top = 26
          Width = 1512
          Height = 763
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
          TabAppearance.Appearance.ImageIndex = 0
          TabAppearance.Appearance.Rounding = 0
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
          TabAppearance.BevelColor = clWhite
          TabAppearance.BevelColorDown = clWhite
          TabAppearance.BevelColorSelected = 13542013
          TabAppearance.BevelColorHot = 16640730
          TabAppearance.BevelColorDisabled = clWhite
          TabAppearance.Color = clWhite
          TabAppearance.ColorDown = clWhite
          TabAppearance.ColorSelected = clWhite
          TabAppearance.ColorDisabled = 15658734
          TMSStyle = 21
          object Panel1: TPanel
            Left = 2
            Top = 2
            Width = 1508
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            Color = 3355443
            FullRepaint = False
            ParentBackground = False
            TabOrder = 0
            object rbFJTRToday: TAdvOfficeRadioButton
              Left = 2
              Top = 4
              Width = 153
              Height = 20
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = rbFJTRTodayClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.5.0.9'
            end
            object rbFJTRPrevious: TAdvOfficeRadioButton
              Left = 161
              Top = 4
              Width = 153
              Height = 20
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TabStop = True
              OnClick = rbFJTRTodayClick
              Alignment = taLeftJustify
              Caption = '.'
              Checked = True
              ReturnIsTab = False
              Version = '1.5.0.9'
            end
          end
          object sgFHTable: TAdvStringGrid
            Left = 2
            Top = 28
            Width = 1508
            Height = 733
            Cursor = crDefault
            Align = alClient
            ColCount = 12
            DefaultRowHeight = 17
            DrawingStyle = gdsClassic
            FixedCols = 0
            RowCount = 5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            GridLineWidth = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
            ParentFont = False
            PopupMenu = puGenericTable
            ScrollBars = ssBoth
            TabOrder = 1
            OnDrawCell = sgFHTableDrawCell
            GridLineColor = 15062992
            HoverRowCells = [hcNormal, hcSelected]
            OnGetCellColor = sgFHTableGetCellColor
            OnGetAlignment = sgFHTableGetAlignment
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
            FixedColWidth = 113
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
            ColWidths = (
              113
              137
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
              17
              17
              17
              17)
          end
        end
        object tsFHTimeLine: TAdvSmoothTabPage
          Left = 1
          Top = 26
          Width = 1512
          Height = 763
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
          TabAppearance.Appearance.ImageIndex = 17
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
          TabAppearance.BevelColorHot = 16640730
          TabAppearance.BevelColorDisabled = clWhite
          TabAppearance.Color = clWhite
          TabAppearance.ColorDown = clWhite
          TabAppearance.ColorSelected = clWhite
          TabAppearance.ColorDisabled = 15658734
          TMSStyle = 21
          object Panel3: TPanel
            Left = 2
            Top = 2
            Width = 1508
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            Color = 3355443
            UseDockManager = False
            FullRepaint = False
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              1508
              26)
            object sbTLReset: TSpeedButton
              Left = 0
              Top = 1
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFDBB6A0D0A286C0845EBA7953B67751B47651B1
                7450AD724FAA714FA86F4EA76E4DA66F4EA97657BB9076FF00FFFF00FFC8906B
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFAC785AFF00FFFF00FFC28259FFFFFFAF672CAD642BAD642BFFFFFF56
                AB5D51A6574CA152479C4C449849409445FFFFFFA7704FFF00FFFF00FFC4865A
                FFFFFFAF672CCD9F74AD642BFFFFFF4B9F5070C97B70C97B6FC87A6EC7783E93
                43FFFFFFA8714FFF00FFFF00FFC5865BFFFFFFAF672CCDA075AD642BFFFFFF4E
                A35473CA7D72CA7D71C97C6FC87A419546FFFFFFAC7250FF00FFFF00FFC7885A
                FFFFFFB46E33D0A57EB26C2EFFFFFF50A55674CB7E73CB7D72CA7C70C97B4499
                49FFFFFFB27651FF00FFFF00FFC88A5BFFFFFFB77640D1A683B67338FFFFFF52
                A85973CB7D73CB7D72CA7C70C97B479C4DFFFFFFB67853FF00FFFF00FFCA8C5C
                FFFFFFBC7F54BA7D4CBA7C4AFFFFFF469B4C53A85951A6574FA4554DA2534A9F
                50FFFFFFB97C54FF00FFFF00FFCB8E5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC7E55FF00FFFF00FFCD9261
                FFFFFFEDC49BEDC49BEDC49BEDC49BEDC49BEDC49BEDC49BEDC49BEDC49BEDC4
                9BFFFFFFBE8157FF00FFFF00FFD09768FFFFFFEDC49CF4DAC1F4DAC1F4DBC2F4
                DBC2F4DBC2F4DBC2F4DBC2F4DBC2EDC49BFFFFFFC18459FF00FFFF00FFD5A477
                FFFFFFEDC49CEDC49CEDC49CEDC49BEDC49BEDC49BEDC49BEDC49BEDC49BEDC4
                9BFFFFFFC88F65FF00FFFF00FFE1BD9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6AA89FF00FFFF00FFE9CFB8
                E3C2A5D8A97FCE935FCD9360CD925FCC905FCD9261CD9363CB9161CE9569D5A8
                84D8AE8BD7AC8BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = sbTLResetClick
            end
            object lFHTLUnderCursor: TLabel
              Left = 68
              Top = 7
              Width = 56
              Height = 13
              Caption = 'XXXX/XX/XX'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lFHTLIndicatorDetails: THTMLabel
              Left = 192
              Top = 7
              Width = 1310
              Height = 19
              Anchors = [akLeft, akTop, akRight]
              AutoSizeType = asHorizontal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              HTMLText.Strings = (
                '.')
              ParentFont = False
              Transparent = True
              Version = '2.1.0.0'
              ExplicitWidth = 1098
            end
            object sbTLSave: TSpeedButton
              Left = 30
              Top = 3
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFD1B4A2BF9378AF7650AF744EAF744EAF744EAF
                744EAF744EAF744EAF744EAF744EAF744EAF7855CFB19EFFFFFFFFFFFFB27E5E
                EEECEAF7F2F0F8F3F0F8F3EFF7F3EFF7F2EFF7F2EEF7F2EEF7F2EEF7F2EEF8F2
                EEF1EEEAB07955FFFFFFFFFFFFAB6D46F6F0ECFDE8D7FEE8D7FEE8D7FEE8D7FE
                E8D7FEE8D7FEE8D7FEE8D7FEE8D7FDE8D7F7ECE5AF744EFFFFFFFFFFFFAB6D45
                F7F0EC816242AC8258AC8258AC8258AC8258AC8258AC8258AC8258AC82588162
                42F6ECE5AF744EFFFFFFFFFFFFAD6F46F7F0EBAC8258E5AD75E5AD75E5AD75E5
                AD75E5AD75E5AD75E5AD75E5AD75AC8258F6EDE5AF7650FFFFFFFFFFFFAD6F46
                F7F1ECAC8258E5AD75E5AD75E5AD75E5AD75E5AD75E5AD75E5AD75E5AD75AC82
                58F6EDE5AF7650FFFFFFFFFFFFAD6F47F7F2EDA67F56DEAA73DEAA73DDA973DD
                A873DCA772DCA772DCA772DCA772A47D55F6EDE6AF7650FFFFFFFFFFFFAD6F47
                F7F3EE9C966EE6C79DE2C598DFC496C8BD88E4BA82E4BA83E4BA83D3C199A59A
                7BF6EDE6AF7650FFFFFFFFFFFFAD6F47F7F4EFB6A583F5DDB0F6DEB0F4DDAFF1
                DCADF3DAABF3DAACF2D9ABEFDAAEB4A584F4EEE6AF7650FFFFFFFFFFFFAD6F47
                F7F4F1BEAB88FEE5B5FDE4B5FDE4B5FDE4B5FDE4B5FDE4B5FDE4B5FDE4B5BEAB
                88F6EFE7AF7650FFFFFFFFFFFFAD6F47F7F4F3B6A481F2DCADF5DEB0F2DDAFF6
                DEAFF7DFAFF8E0B1FAE1B2FCE3B4BEAB88F7EFE8B07650FFFFFFFFFFFFAD7651
                F3F2F196815CA69E76A4A17DABA07ABAA27ABAA37CBAA47EBBA680BCA8838F80
                65F7F1EAB07650FFFFFFFFFFFFB28566DEDEDCF3F3F2F7F4F3F7F4F2F7F4F1F7
                F4EFF8F4EFF8F3EEF8F2EDF8F2EBF7F2EBF1EEE8AF7955FFFFFFFFFFFFD0B6A4
                B38367AD7651AD6F46AD6F46AD6F46AD6F46AD6F46AD6D46AD6D46AD6D46AD6D
                46AD744ECEB19DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              OnClick = sbTLSaveClick
            end
          end
          object atlFolderHistory: TAdvSmoothTimeLine
            Left = 2
            Top = 28
            Width = 1508
            Height = 733
            DefaultHintFill.Color = clWhite
            DefaultHintFill.ColorTo = clWhite
            DefaultHintFill.ColorMirror = clNone
            DefaultHintFill.ColorMirrorTo = clNone
            DefaultHintFill.GradientType = gtVertical
            DefaultHintFill.GradientMirrorType = gtSolid
            DefaultHintFill.Opacity = 225
            DefaultHintFill.OpacityTo = 175
            DefaultHintFill.BorderColor = clBlack
            DefaultHintFill.Rounding = 0
            DefaultHintFill.ShadowOffset = 0
            DefaultHintFill.Glow = gmNone
            DefaultSectionFill.Color = 16573128
            DefaultSectionFill.ColorTo = 16573128
            DefaultSectionFill.ColorMirror = clNone
            DefaultSectionFill.ColorMirrorTo = clNone
            DefaultSectionFill.GradientType = gtVertical
            DefaultSectionFill.GradientMirrorType = gtVertical
            DefaultSectionFill.BorderColor = 15048022
            DefaultSectionFill.Rounding = 0
            DefaultSectionFill.ShadowOffset = 0
            DefaultSectionFill.Glow = gmNone
            DefaultIndicator.AnnotationColor = 16573128
            DefaultIndicator.Position = 42858.834930555550000000
            DefaultIndicator.Color = 16573128
            DefaultIndicator.ColorTo = 16573128
            DefaultIndicator.Opacity = 200
            DefaultIndicator.OpacityTo = 150
            DefaultIndicator.Tag = 0
            Range.MinimumRange = 42858.793206018520000000
            Range.MaximumRange = 42858.876655092590000000
            Range.RangeTo = 42858.834988425920000000
            Range.RangeFrom = 42858.834872685180000000
            RangeAppearance.DivisionFont.Charset = DEFAULT_CHARSET
            RangeAppearance.DivisionFont.Color = clBlack
            RangeAppearance.DivisionFont.Height = -11
            RangeAppearance.DivisionFont.Name = 'Tahoma'
            RangeAppearance.DivisionFont.Style = []
            RangeAppearance.SubDivisionFont.Charset = DEFAULT_CHARSET
            RangeAppearance.SubDivisionFont.Color = clBlack
            RangeAppearance.SubDivisionFont.Height = -11
            RangeAppearance.SubDivisionFont.Name = 'Tahoma'
            RangeAppearance.SubDivisionFont.Style = []
            RangeAppearance.DivisionFormat = 'hh:nn:ss'
            RangeAppearance.SubDivisionFormat = 'hh:nn:ss'
            RangeAppearance.ShowSubDivisionValue = False
            Fill.Color = 16448250
            Fill.ColorTo = clNone
            Fill.ColorMirror = clNone
            Fill.ColorMirrorTo = clNone
            Fill.GradientType = gtVertical
            Fill.GradientMirrorType = gtSolid
            Fill.BorderColor = clSilver
            Fill.Rounding = 0
            Fill.ShadowOffset = 0
            Fill.Glow = gmNone
            HorizontalMargin = 40
            TimeLineBar.Fill.Color = clWhite
            TimeLineBar.Fill.ColorTo = clNone
            TimeLineBar.Fill.ColorMirror = clNone
            TimeLineBar.Fill.ColorMirrorTo = clNone
            TimeLineBar.Fill.GradientType = gtVertical
            TimeLineBar.Fill.GradientMirrorType = gtSolid
            TimeLineBar.Fill.BorderColor = 13027014
            TimeLineBar.Fill.Rounding = 0
            TimeLineBar.Fill.ShadowOffset = 0
            TimeLineBar.Fill.Glow = gmNone
            TimeLineBar.AnnotationFont.Charset = DEFAULT_CHARSET
            TimeLineBar.AnnotationFont.Color = clWindowText
            TimeLineBar.AnnotationFont.Height = -11
            TimeLineBar.AnnotationFont.Name = 'Tahoma'
            TimeLineBar.AnnotationFont.Style = []
            TimeLineBar.SectionCaptionFont.Charset = DEFAULT_CHARSET
            TimeLineBar.SectionCaptionFont.Color = clWindowText
            TimeLineBar.SectionCaptionFont.Height = -11
            TimeLineBar.SectionCaptionFont.Name = 'Tahoma'
            TimeLineBar.SectionCaptionFont.Style = []
            TimeLineSections = <>
            TimeLineIndicators = <>
            OnIndicatorClick = atlFolderHistoryIndicatorClick
            Align = alClient
            OnDblClick = atlFolderHistoryDblClick
            OnMouseMove = atlFolderHistoryMouseMove
            TMSStyle = 18
          end
        end
      end
    end
    object tsFHMainSearch: TAdvSmoothTabPage
      Left = 1
      Top = 26
      Width = 1518
      Height = 884
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
      TabAppearance.Appearance.ImageIndex = 18
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
      TabAppearance.BevelColorHot = 16640730
      TabAppearance.BevelColorDisabled = clWhite
      TabAppearance.Color = clWhite
      TabAppearance.ColorDown = clWhite
      TabAppearance.ColorSelected = clWhite
      TabAppearance.ColorDisabled = 15658734
      TMSStyle = 4
      object tsFHSearch: TAdvSmoothTabPager
        Left = 2
        Top = 2
        Width = 1514
        Height = 880
        Fill.Color = 3355443
        Fill.ColorTo = clSilver
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
        ActivePage = tsFHCompare
        TabPosition = tpTopLeft
        TabTextOrientation = toHorizontal
        TabSettings.RightMargin = 0
        TabSettings.StartMargin = 4
        TabSettings.Spacing = 5
        TabReorder = False
        OnChange = tpFHStatsChange
        OnResize = tpFHStatsResize
        TabOrder = 0
        object tsFHCompare: TAdvSmoothTabPage
          Left = 1
          Top = 26
          Width = 1512
          Height = 852
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
          TabAppearance.Appearance.PictureAlignment = taLeftJustify
          TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
          TabAppearance.Appearance.Font.Color = 4473924
          TabAppearance.Appearance.Font.Height = -11
          TabAppearance.Appearance.Font.Name = 'Tahoma'
          TabAppearance.Appearance.Font.Style = []
          TabAppearance.Appearance.SimpleLayout = True
          TabAppearance.Appearance.SimpleLayoutBorder = True
          TabAppearance.Appearance.ImageList = ilTabs
          TabAppearance.Appearance.ImageIndex = 15
          TabAppearance.Appearance.Rounding = 0
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
          TabAppearance.BevelColor = clWhite
          TabAppearance.BevelColorDown = clWhite
          TabAppearance.BevelColorSelected = 13542013
          TabAppearance.BevelColorHot = 16640730
          TabAppearance.BevelColorDisabled = clWhite
          TabAppearance.Color = clWhite
          TabAppearance.ColorDown = clWhite
          TabAppearance.ColorSelected = clWhite
          TabAppearance.ColorDisabled = 15658734
          TMSStyle = 21
          object Splitter2: TAdvSplitter
            Left = 563
            Top = 60
            Height = 790
            OnMoved = Splitter2Moved
            Appearance.BorderColor = clNone
            Appearance.BorderColorHot = clNone
            Appearance.Color = clWhite
            Appearance.ColorTo = clSilver
            Appearance.ColorHot = clWhite
            Appearance.ColorHotTo = clGray
            GripStyle = sgDots
            ExplicitLeft = 714
            ExplicitTop = 100
          end
          object pFHCompare: TPanel
            Left = 2
            Top = 2
            Width = 1508
            Height = 58
            Align = alTop
            Color = clWhite
            FullRepaint = False
            TabOrder = 0
            DesignSize = (
              1508
              58)
            object sbFHCompareFavourites: TSpeedButton
              Tag = 3
              Left = 1
              Top = 3
              Width = 23
              Height = 22
              Hint = 'quick search options'
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
                FF00FFB1E0F2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFABD2
                EDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE3E3E3FF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFD9D9D9FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF32B0DF30ADDE87CEEBFF00FFFF00FFFF00FFFF00FF9ACDEB2290D30D81
                CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8B5B5B5D4D4D4FF00FFFF
                00FFFF00FFFF00FFD4D4D4A0A0A0939393FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF44B8E350CBEF39B7E52AA9DD73C5E782CAEA269ED92AA3DD39AEE5198C
                D1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFCFCFCFBEBEBEB3B3B3CB
                CBCBD0D0D0A9A9A9AEAEAEB8B8B89D9D9DFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF5BC3E74DCAEE54CEF150C8EF40BAE839B5E546BDEB44BAEB3EB3E82C9A
                D6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8CECECED2D2D2CDCDCDC1
                C1C1BDBDBDC4C4C4C2C2C2BCBCBCA7A7A7FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF7AD0EC49C8EC49CCF131C3ED42C4EE46C3ED2CB6EA26B1E83CB4E746AB
                DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4CCCCCCD0D0D0C9C9C9CA
                CACAC9C9C9BFBFBFBBBBBBBDBDBDB5B5B5FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF9BDCF144C6EA57D2F227C2ED23BDEC1FB7EA1BB3E936B9EA3AB3E667BD
                E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFDFDFCACACAD6D6D6C8C8C8C4
                C4C4C0C0C0BDBDBDC1C1C1BCBCBCC5C5C5FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF46C2E659D5F246D0F229C4EE25C0ED22BBEB1DB6E921B4E946BDEB2AA7
                DBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C6D8D8D8D4D4D4CACACAC7
                C7C7C3C3C3BFBFBFBDBDBDC4C4C4B1B1B1FF00FFFF00FFFF00FFFF00FFFF00FF
                4DC8E94ACEED5EDBF530CDF12CC8EF27C3EE24BEEC20B8EA1CB4E949C0EC37B2
                E42DA8DDFF00FFFF00FFFF00FFFF00FFCBCBCBD1D1D1DDDDDDD1D1D1CDCDCDC9
                C9C9C5C5C5C0C0C0BDBDBDC7C7C7BBBBBBB1B1B1FF00FFFF00FFFF00FF54CEEB
                4CD2EE63E1F641D6F432CFF22ECBF02AC6EF26C1ED22BCEB1FB7EA20B4E947BE
                EC36B2E432ABDDFF00FFFF00FFD1D1D1D4D4D4E1E1E1D8D8D8D2D2D2CFCFCFCC
                CCCCC7C7C7C3C3C3C0C0C0BDBDBDC5C5C5BBBBBBB4B4B4FF00FF5ED3EE4DD5EF
                58DCF25EDEF560DEF55FDCF648D4F32DC9EF29C4EE35C4ED50C9EF4CC4EE45BE
                EB3DB7E733B0E236ADDED5D5D5D7D7D7DDDDDDDFDFDFDFDFDFDEDEDED7D7D7CE
                CECECACACACACACACECECECACACAC5C5C5BFBFBFB9B9B9B6B6B6FF00FFB6EBF7
                7FDCF15BD0ED42C7E949CEED5BD9F447D3F23ACBF055CFF13EBFE835B7E24BBC
                E46EC8E9A3DBF1FF00FFFF00FFECECECDEDEDED3D3D3CBCBCBD1D1D1DBDBDBD6
                D6D6CFCFCFD3D3D3C5C5C5BDBDBDC3C3C3CDCDCDDFDFDFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF49CEED5DD9F459D6F343C5EA79D1EDFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1D1D1DB
                DBDBD9D9D9CACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF47CAEA56D6F259D6F33AC0E6FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCECECED8
                D8D8D9D9D9C5C5C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFBCECF748CEED48CDED9BE0F3FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDEDEDD1
                D1D1D0D0D0E2E2E2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF58D1EC47CBEAFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3
                D3D3CECECEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFD8F5FBC1EEF8FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF5
                F5F5EFEFEFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              OnClick = sbFHCompareFavouritesClick
            end
            object sbFHCompareSearch: TSpeedButton
              Left = 19
              Top = 3
              Width = 23
              Height = 22
              Hint = 'execute search'
              Enabled = False
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
              OnClick = sbFHCompareSearchClick
            end
            object lFHCompareSize: TLabel
              Left = 6
              Top = 35
              Width = 4
              Height = 13
              Caption = '.'
            end
            object sbFHCSearchSyntax: TSpeedButton
              Left = 1168
              Top = 2
              Width = 23
              Height = 22
              Hint = 'show floating search syntax window'
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000C21E0000C21E00000000000000000000FFFFFFBE9E89
                94603D93603C925F3B925E3A915D39905D38905C388F5B378F5A368E5A35B18C
                73FFFFFFFFFFFFFFFFFFFFFFFF9D9D9D5E5E5E5D5D5D5D5D5D5C5C5C5B5B5B5B
                5B5B5A5A5A5959595858585858588B8B8BFFFFFFFFFFFFFFFFFFFFFFFFA17456
                CCAB85D1AF89D2B088D1AD85D0AA81CFA77FCEA47BCDA17ACB9F77C799719361
                3E8F7F73FFFFFFFFFFFFFFFFFF727272A6A6A6AAAAAAABABABA8A8A8A5A5A5A2
                A2A29F9F9F9D9D9D9B9B9B9595955E5E5E7E7E7EFFFFFFFFFFFFFFFFFFA27556
                CAA985A37854C69A67C49862C2945EC1905AC08C56BE8953BF8855C99D759362
                3F695341FFFFFFFFFFFFFFFFFF737373A4A4A47575759494949292928E8E8E8A
                8A8A8686868383838383839999995F5F5F515151FFFFFFFFFFFFFFFFFFA27657
                CBAC88A67E57C99F6EC79D69C69966C39761C2925CC18F59C18E5BCAA1789462
                40573E2AFFFFFFFFFFFFFFFFFF747474A7A7A77A7A7A99999997979793939391
                91918C8C8C8989898989899C9C9C6060603C3C3CFFFFFFFFFFFFFFFFFFA37759
                CEB08EAA855BCBA475CAA271C89E6BC69B68C59963C2945EC49461CCA57D9463
                41573E2AFFFFFFFFFFFFFFFFFF747474ABABAB8080809E9E9E9C9C9C98989895
                95959393938E8E8E8E8E8EA0A0A06161613C3C3CFFFFFFFFFFFFFFFFFFA4785A
                D0B492AF8B60CEA97CCCA677CBA374C9A06EC79D6AC69A66C69B68CDA8829564
                42573E2AFFFFFFFFFFFFFFFFFF757575AFAFAF868686A3A3A3A0A0A09D9D9D9A
                9A9A979797949494959595A4A4A46161613C3C3CFFFFFFFFFFFFFFFFFFA5795B
                D2B796B49265D1AE83CFAB7FCDA87ACBA576CAA271C89E6DC89F6DD0AE869665
                44573E2AFFFFFFFFFFFFFFFFFF767676B2B2B28C8C8CA8A8A8A5A5A5A2A2A29F
                9F9F9C9C9C989898999999A9A9A96262623C3C3CFFFFFFFFFFFFFFFFFFA57A5C
                D5BB9BB89A69D4B38AD2AF87D0AD82CFAA7DCDA678CBA474CCA475D2B18A9767
                45573E2AFFFFFFFFFFFFFFFFFF777777B6B6B6939393AEAEAEAAAAAAA7A7A7A4
                A4A4A0A0A09E9E9E9E9E9EACACAC6464643C3C3CFFFFFFFFFFFFFFFFFFA67B5D
                D7BF9FBD9F6FD4B590CBAD88C7A881C6A57DC4A17AC5A176CBA77BD4B4909868
                46573E2AFFFFFFFFFFFFFFFFFF787878BABABA989898B0B0B0A8A8A8A3A3A3A0
                A0A09C9C9C9C9C9CA1A1A1AFAFAF6565653C3C3CFFFFFFFFFFFFFFFFFFA77C5E
                D9C2A4C1A472D2B894F5EDE4F4ECE2F4ECE1F4EBE0F3EADFCBA97FD6B8969969
                47573E2AFFFFFFFFFFFFFFFFFF797979BEBEBE9D9D9DB3B3B3ECECECEBEBEBEB
                EBEBEAEAEAE9E9E9A4A4A4B3B3B36666663C3C3CFFFFFFFFFFFFFFFFFFA77C5E
                DBC5A6C6A776D9BF9BD1B793CBB08ECAAE8AC8AB87CBAB83D1B087D8BB9B996A
                48573E2AFFFFFFFFFFFFFFFFFF7A7A7AC1C1C1A0A0A0BABABAB2B2B2ABABABA9
                A9A9A6A6A6A6A6A6ABABABB7B7B76767673C3C3CFFFFFFFFFFFFFFFFFFA87C5F
                DDC8A9D4BD95E6D4B9E6D1B6E4D0B5E3CEB3E2CBB0E0C9ADDFC7A9DABFA09A6B
                4A573E2AFFFFFFFFFFFFFFFFFF7B7B7BC4C4C4B7B7B7D0D0D0CDCDCDCCCCCCCA
                CACAC7C7C7C5C5C5C3C3C3BABABA6868683C3C3CFFFFFFFFFFFFFFFFFFA87E61
                D9C2A5B59170AB805FA97E5EA97E5EA87D5CA87C5BA77B5AA679599C6B499664
                41573E2AFFFFFFFFFFFFFFFFFF7B7B7BBEBEBE8D8D8D7D7D7D7B7B7B7B7B7B7A
                7A7A7979797878787676766868686161613C3C3CFFFFFFFFFFFFFFFFFFAF886D
                BA9778D8C5B9E8DED7E7DDD6E6DCD6E4DBD4E3DAD3E2D8D1E1D7D0EBE7E5EFEF
                EF573E2AFFFFFFFFFFFFFFFFFF868686939393C4C4C4DEDEDEDDDDDDDCDCDCDA
                DADAD9D9D9D8D8D8D7D7D7E7E7E7EFEFEF3C3C3CFFFFFFFFFFFFFFFFFFC7AC99
                9D6E4CBB9778AC8262AC8161AB8060AB7F5FAA7F5EA87E5DA87C5C9D6D4C9766
                43885C3CFFFFFFFFFFFFFFFFFFAAAAAA6B6B6B9393937F7F7F7E7E7E7D7D7D7C
                7C7C7C7C7C7B7B7B7979796A6A6A6363635A5A5AFFFFFFFFFFFFFFFFFFEFE7E1
                AD8469B38E749D6C4B9C6C4A9C6B499B6A499B6A489A69479968469867459364
                43947257FFFFFFFFFFFFFFFFFFE6E6E68282828C8C8C6A6A6A69696968686868
                6868676767666666656565646464626262707070FFFFFFFFFFFF}
              NumGlyphs = 2
            end
            object SpeedButton4: TSpeedButton
              Left = 1485
              Top = 1
              Width = 23
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
              OnClick = SpeedButton4Click
              ExplicitLeft = 1332
            end
            object cbFHCompareUnits: TComboBox
              Left = 48
              Top = 32
              Width = 105
              Height = 21
              Style = csDropDownList
              Enabled = False
              TabOrder = 0
              OnChange = sbFHCompareSearchClick
            end
            object eFHCompareSearch: TComboBox
              Left = 48
              Top = 3
              Width = 1431
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              TabOrder = 1
              OnChange = eFHCompareSearchChange
              OnKeyPress = eFHCompareSearchKeyPress
            end
            object cbFHComparePath: TAdvOfficeCheckBox
              Left = 167
              Top = 33
              Width = 120
              Height = 20
              Hint = 'include full path of file in search results'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = sbFHCompareSearchClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.5.0.9'
            end
            object cbFHCompareColour: TAdvOfficeCheckBox
              Left = 293
              Top = 33
              Width = 123
              Height = 20
              Hint = 'colour code search results based on the category they belong to'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = cbFHCompareColourClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.5.0.9'
            end
          end
          object Panel14: TPanel
            Left = 2
            Top = 60
            Width = 561
            Height = 790
            Align = alLeft
            ParentColor = True
            TabOrder = 1
            object Panel32: TPanel
              Left = 1
              Top = 1
              Width = 559
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                559
                33)
              object sbFHCLHideSOD: TSpeedButton
                Tag = 9
                Left = 306
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCLHideCreatedClick
              end
              object sbFHCLHideAttributes: TSpeedButton
                Tag = 8
                Left = 282
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCLHideCreatedClick
              end
              object sbFHCLHideOwner: TSpeedButton
                Tag = 7
                Left = 258
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCLHideCreatedClick
              end
              object sbFHCLHideModified: TSpeedButton
                Tag = 6
                Left = 234
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCLHideCreatedClick
              end
              object sbFHCLHideAccessed: TSpeedButton
                Tag = 5
                Left = 210
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCLHideCreatedClick
              end
              object sbFHCLHideCreated: TSpeedButton
                Tag = 4
                Left = 186
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCLHideCreatedClick
              end
              object sbFHCompareLeftSave: TSpeedButton
                Tag = 1
                Left = 162
                Top = 5
                Width = 23
                Height = 22
                Hint = 'save search results'
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
                OnClick = sbFHCompareLeftSaveClick
              end
              object sbFHCShowLeft: TSpeedButton
                Left = 330
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCShowLeftClick
              end
              object SpeedButton21: TSpeedButton
                Left = 0
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFD8A37AD3996ED19668CE9263CB8E5EC98A5BC7
                  8756C38452C38452C38452C38452C38452C38452C18454FF00FFFF00FFD7A175
                  F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
                  D8F0E2D8C58A5DFF00FFFF00FFD9A47AF9F3EEEBD2BEFFFFFFEBD3BFFFFFFFEB
                  D3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E2D8C68C5FFF00FFFF00FFDDA87E
                  F9F3EFEBD0BAEBD0BBEACDB5EACDB5EACDB5EBD1BDEACDB5EACDB5EACDB5EACD
                  B5F0E2D8C68A5CFF00FFFF00FFDFAA82F9F3EFEACEB7FFFFFFEACDB5FFFFFFEA
                  CDB5FFFFFFEACFBAFFFFFFEACDB5FFFFFFF0E2D8C88D5FFF00FFFF00FFE1AE87
                  FAF4F0EACBB2EACCB3EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5E8C8
                  AEF0E2D8C48654FF00FFFF00FFE3B18CFAF6F1EAC9AEFFFFFFEAC9B0FFFFFFE9
                  CBB3FFFFFFEACDB5FFFFFFEACDB5FFFFFFF0E2D8C68655FF00FFFF00FFE5B48F
                  FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0EACDB5EACDB5EACDB5E8CC
                  B5F0E2D8C88A59FF00FFFF00FFE7B794FBF7F4FFFFFFFFFFFFE8C4A9FFFFFFE9
                  C6AAFFFFFFE8C7ACFFFFFFE8C8B0FFFFFFF7F1EBCB8F5FFF00FFFF00FFE9BA98
                  FBF7F465A4FF64A3FF62A2FF61A1FF5F9FFF5C9DFF5A9AFF5798FF5495FF5294
                  FFFBF7F4CE9364FF00FFFF00FFEBBD9BFBF7F464A4FF79BDFF75BBFF71B9FF6D
                  B8FF68B3FF61B0FF5AABFF54A7FF3B7DFFFBF7F4D1976AFF00FFFF00FFECBF9E
                  FBF7F465A4FF64A3FF60A0FF5D9EFF5899FF5496FF4D90FF478BFF4284FF3D7F
                  FFFBF7F4D49B6FFF00FFFF00FFEEC1A2FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FB
                  F7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4D7A074FF00FFFF00FFF3D2BA
                  EFC2A3EDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
                  80DCA57DDCA780FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton21Click
              end
              object lFHCompareLeft: THTMLabel
                Left = 361
                Top = 10
                Width = 193
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HTMLText.Strings = (
                  '.')
                ParentFont = False
                Transparent = True
                Version = '2.1.0.0'
              end
              object bFHCompareLeft: TBitBtn
                Left = 28
                Top = 5
                Width = 125
                Height = 22
                TabOrder = 0
                OnClick = bFHCompareLeftClick
              end
            end
            object sgFHCompareLeft: TAdvStringGrid
              Tag = 3
              Left = 1
              Top = 34
              Width = 559
              Height = 725
              Cursor = crDefault
              Align = alClient
              ColCount = 14
              DefaultRowHeight = 21
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
              PopupMenu = puGenericTable
              ScrollBars = ssBoth
              TabOrder = 1
              OnDrawCell = sgFHCompareLeftDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgFHTableGetCellColor
              OnGetAlignment = sgFHCompareLeftGetAlignment
              OnCanSort = sgFileHistoryCanSort
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = 16644337
              ActiveCellColorTo = 16576469
              CellNode.TreeColor = clSilver
              ControlLook.FixedGradientMirrorFrom = 16447735
              ControlLook.FixedGradientMirrorTo = 16052977
              ControlLook.FixedGradientHoverFrom = 16775139
              ControlLook.FixedGradientHoverTo = 16775139
              ControlLook.FixedGradientHoverMirrorFrom = 16772541
              ControlLook.FixedGradientHoverMirrorTo = 16508855
              ControlLook.FixedGradientDownFrom = 16377020
              ControlLook.FixedGradientDownTo = 16377020
              ControlLook.FixedGradientDownMirrorFrom = 16242317
              ControlLook.FixedGradientDownMirrorTo = 16109962
              ControlLook.FixedGradientDownBorder = 11440207
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
              FixedColWidth = 205
              FixedRowHeight = 22
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
              Look = glVista
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
              SearchFooter.ColorTo = 16052977
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
              ShowSelection = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              SortSettings.Show = True
              SortSettings.IgnoreCase = True
              SortSettings.HeaderColor = 16579058
              SortSettings.HeaderColorTo = 16579058
              SortSettings.HeaderMirrorColor = 16380385
              SortSettings.HeaderMirrorColorTo = 16182488
              Version = '8.4.2.5'
              WordWrap = False
              ColWidths = (
                205
                98
                183
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
                21
                21)
            end
            object Panel17: TPanel
              Left = 1
              Top = 759
              Width = 559
              Height = 30
              Align = alBottom
              BevelOuter = bvNone
              FullRepaint = False
              TabOrder = 2
              Visible = False
              object lCLShowing: TLabel
                Left = 112
                Top = 7
                Width = 12
                Height = 13
                Caption = '...'
              end
              object lCLPageNumber: TLabel
                Left = 72
                Top = 7
                Width = 6
                Height = 13
                Caption = '1'
              end
              object W7NavigationFrame1: TW7NavigationFrame
                Left = 0
                Top = 2
                Width = 67
                Height = 26
                Opacity = 200
              end
              object lCLPagePrevious: TW7NavigationButton
                Left = 5
                Top = 2
                Width = 24
                Height = 24
                Direction = ndBackward
                FadeInInterval = 17
                FadeOutInterval = 17
                Enabled = False
                ParentFont = False
              end
              object lCLPageNext: TW7NavigationButton
                Left = 36
                Top = 2
                Width = 24
                Height = 24
                FadeInInterval = 17
                FadeOutInterval = 17
                Enabled = False
                ParentFont = False
              end
            end
          end
          object Panel15: TPanel
            Left = 566
            Top = 60
            Width = 944
            Height = 790
            Align = alClient
            TabOrder = 2
            object Panel11: TPanel
              Left = 1
              Top = 1
              Width = 942
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                942
                33)
              object sbFHCRHideCreated: TSpeedButton
                Tag = 10
                Left = 186
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCRHideCreatedClick
              end
              object sbFHCRHideAccessed: TSpeedButton
                Tag = 11
                Left = 215
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCRHideCreatedClick
              end
              object sbFHCRHideModified: TSpeedButton
                Tag = 12
                Left = 234
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCRHideCreatedClick
              end
              object sbFHCRHideOwner: TSpeedButton
                Tag = 13
                Left = 258
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCRHideCreatedClick
              end
              object sbFHCRHideAttributes: TSpeedButton
                Tag = 14
                Left = 282
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCRHideCreatedClick
              end
              object sbFHCRHideSOD: TSpeedButton
                Tag = 15
                Left = 306
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCRHideCreatedClick
              end
              object sbFHCompareRightSave: TSpeedButton
                Tag = 2
                Left = 162
                Top = 5
                Width = 23
                Height = 22
                Hint = 'save search results'
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
                OnClick = sbFHCompareRightSaveClick
              end
              object sbFHCShowRight: TSpeedButton
                Left = 330
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                OnClick = sbFHCShowRightClick
              end
              object SpeedButton22: TSpeedButton
                Tag = 1
                Left = 0
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFD8A37AD3996ED19668CE9263CB8E5EC98A5BC7
                  8756C38452C38452C38452C38452C38452C38452C18454FF00FFFF00FFD7A175
                  F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
                  D8F0E2D8C58A5DFF00FFFF00FFD9A47AF9F3EEEBD2BEFFFFFFEBD3BFFFFFFFEB
                  D3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E2D8C68C5FFF00FFFF00FFDDA87E
                  F9F3EFEBD0BAEBD0BBEACDB5EACDB5EACDB5EBD1BDEACDB5EACDB5EACDB5EACD
                  B5F0E2D8C68A5CFF00FFFF00FFDFAA82F9F3EFEACEB7FFFFFFEACDB5FFFFFFEA
                  CDB5FFFFFFEACFBAFFFFFFEACDB5FFFFFFF0E2D8C88D5FFF00FFFF00FFE1AE87
                  FAF4F0EACBB2EACCB3EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5E8C8
                  AEF0E2D8C48654FF00FFFF00FFE3B18CFAF6F1EAC9AEFFFFFFEAC9B0FFFFFFE9
                  CBB3FFFFFFEACDB5FFFFFFEACDB5FFFFFFF0E2D8C68655FF00FFFF00FFE5B48F
                  FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0EACDB5EACDB5EACDB5E8CC
                  B5F0E2D8C88A59FF00FFFF00FFE7B794FBF7F4FFFFFFFFFFFFE8C4A9FFFFFFE9
                  C6AAFFFFFFE8C7ACFFFFFFE8C8B0FFFFFFF7F1EBCB8F5FFF00FFFF00FFE9BA98
                  FBF7F465A4FF64A3FF62A2FF61A1FF5F9FFF5C9DFF5A9AFF5798FF5495FF5294
                  FFFBF7F4CE9364FF00FFFF00FFEBBD9BFBF7F464A4FF79BDFF75BBFF71B9FF6D
                  B8FF68B3FF61B0FF5AABFF54A7FF3B7DFFFBF7F4D1976AFF00FFFF00FFECBF9E
                  FBF7F465A4FF64A3FF60A0FF5D9EFF5899FF5496FF4D90FF478BFF4284FF3D7F
                  FFFBF7F4D49B6FFF00FFFF00FFEEC1A2FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FB
                  F7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4D7A074FF00FFFF00FFF3D2BA
                  EFC2A3EDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
                  80DCA57DDCA780FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton21Click
              end
              object lFHCompareRight: THTMLabel
                Left = 359
                Top = 10
                Width = 1140
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HTMLText.Strings = (
                  '.')
                ParentFont = False
                Transparent = True
                Version = '2.1.0.0'
              end
              object bFHCompareRight: TBitBtn
                Left = 29
                Top = 5
                Width = 125
                Height = 22
                TabOrder = 0
                OnClick = bFHCompareRightClick
              end
            end
            object sgFHCompareRight: TAdvStringGrid
              Tag = 4
              Left = 1
              Top = 34
              Width = 942
              Height = 725
              Cursor = crDefault
              Align = alClient
              ColCount = 14
              DefaultRowHeight = 21
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
              PopupMenu = puGenericTable
              ScrollBars = ssBoth
              TabOrder = 1
              OnDrawCell = sgFHCompareRightDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgFHTableGetCellColor
              OnGetAlignment = sgFHCompareLeftGetAlignment
              OnCanSort = sgFileHistoryCanSort
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = 16644337
              ActiveCellColorTo = 16576469
              CellNode.TreeColor = clSilver
              ControlLook.FixedGradientMirrorFrom = 16447735
              ControlLook.FixedGradientMirrorTo = 16052977
              ControlLook.FixedGradientHoverFrom = 16775139
              ControlLook.FixedGradientHoverTo = 16775139
              ControlLook.FixedGradientHoverMirrorFrom = 16772541
              ControlLook.FixedGradientHoverMirrorTo = 16508855
              ControlLook.FixedGradientDownFrom = 16377020
              ControlLook.FixedGradientDownTo = 16377020
              ControlLook.FixedGradientDownMirrorFrom = 16242317
              ControlLook.FixedGradientDownMirrorTo = 16109962
              ControlLook.FixedGradientDownBorder = 11440207
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
              FixedColWidth = 205
              FixedRowHeight = 22
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
              Look = glVista
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
              SearchFooter.ColorTo = 16052977
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
              ShowSelection = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              SortSettings.Show = True
              SortSettings.IgnoreCase = True
              SortSettings.HeaderColor = 16579058
              SortSettings.HeaderColorTo = 16579058
              SortSettings.HeaderMirrorColor = 16380385
              SortSettings.HeaderMirrorColorTo = 16182488
              Version = '8.4.2.5'
              WordWrap = False
              ColWidths = (
                205
                98
                183
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
                21
                21)
            end
            object Panel30: TPanel
              Left = 1
              Top = 759
              Width = 942
              Height = 30
              Align = alBottom
              BevelOuter = bvNone
              FullRepaint = False
              TabOrder = 2
              Visible = False
              object lCRShowing: TLabel
                Left = 112
                Top = 7
                Width = 12
                Height = 13
                Caption = '...'
              end
              object lCRPageNumber: TLabel
                Left = 72
                Top = 7
                Width = 6
                Height = 13
                Caption = '1'
              end
              object W7NavigationFrame2: TW7NavigationFrame
                Left = 0
                Top = 2
                Width = 67
                Height = 26
                Opacity = 200
              end
              object lCRPageNext: TW7NavigationButton
                Left = 36
                Top = 2
                Width = 24
                Height = 24
                FadeInInterval = 17
                FadeOutInterval = 17
                Enabled = False
                ParentFont = False
              end
              object lCRPagePrevious: TW7NavigationButton
                Left = 5
                Top = 2
                Width = 24
                Height = 24
                Direction = ndBackward
                FadeInInterval = 17
                FadeOutInterval = 17
                Enabled = False
                ParentFont = False
              end
            end
          end
        end
        object tsFHCompareFolder: TAdvSmoothTabPage
          Left = 1
          Top = 26
          Width = 1512
          Height = 852
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
          TabAppearance.Appearance.ImageIndex = 3
          TabAppearance.Appearance.Rounding = 0
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
          TabAppearance.BevelColor = clWhite
          TabAppearance.BevelColorDown = clWhite
          TabAppearance.BevelColorSelected = 13542013
          TabAppearance.BevelColorHot = 16640730
          TabAppearance.BevelColorDisabled = clWhite
          TabAppearance.Color = clWhite
          TabAppearance.ColorDown = clWhite
          TabAppearance.ColorSelected = clWhite
          TabAppearance.ColorDisabled = 15658734
          TMSStyle = 21
          object splitterFHCD: TAdvSplitter
            Left = 563
            Top = 31
            Height = 819
            OnMoved = splitterFHCDMoved
            Appearance.BorderColor = clNone
            Appearance.BorderColorHot = clNone
            Appearance.Color = clWhite
            Appearance.ColorTo = clSilver
            Appearance.ColorHot = clWhite
            Appearance.ColorHotTo = clGray
            GripStyle = sgDots
            ExplicitLeft = 10
            ExplicitTop = 33
          end
          object Panel4: TPanel
            Left = 2
            Top = 2
            Width = 1508
            Height = 29
            Align = alTop
            Color = clWhite
            FullRepaint = False
            TabOrder = 0
            DesignSize = (
              1508
              29)
            object sbFHCompareFolderSearch: TSpeedButton
              Left = 24
              Top = 3
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
              OnClick = sbFHCompareFolderSearchClick
            end
            object sbfhCompareDriveFavourites: TSpeedButton
              Tag = 4
              Left = 2
              Top = 5
              Width = 23
              Height = 22
              Hint = 'quick search options'
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
                FF00FFB1E0F2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFABD2
                EDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE3E3E3FF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFD9D9D9FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF32B0DF30ADDE87CEEBFF00FFFF00FFFF00FFFF00FF9ACDEB2290D30D81
                CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8B5B5B5D4D4D4FF00FFFF
                00FFFF00FFFF00FFD4D4D4A0A0A0939393FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF44B8E350CBEF39B7E52AA9DD73C5E782CAEA269ED92AA3DD39AEE5198C
                D1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFCFCFCFBEBEBEB3B3B3CB
                CBCBD0D0D0A9A9A9AEAEAEB8B8B89D9D9DFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF5BC3E74DCAEE54CEF150C8EF40BAE839B5E546BDEB44BAEB3EB3E82C9A
                D6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8CECECED2D2D2CDCDCDC1
                C1C1BDBDBDC4C4C4C2C2C2BCBCBCA7A7A7FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF7AD0EC49C8EC49CCF131C3ED42C4EE46C3ED2CB6EA26B1E83CB4E746AB
                DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4CCCCCCD0D0D0C9C9C9CA
                CACAC9C9C9BFBFBFBBBBBBBDBDBDB5B5B5FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF9BDCF144C6EA57D2F227C2ED23BDEC1FB7EA1BB3E936B9EA3AB3E667BD
                E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFDFDFCACACAD6D6D6C8C8C8C4
                C4C4C0C0C0BDBDBDC1C1C1BCBCBCC5C5C5FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF46C2E659D5F246D0F229C4EE25C0ED22BBEB1DB6E921B4E946BDEB2AA7
                DBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C6D8D8D8D4D4D4CACACAC7
                C7C7C3C3C3BFBFBFBDBDBDC4C4C4B1B1B1FF00FFFF00FFFF00FFFF00FFFF00FF
                4DC8E94ACEED5EDBF530CDF12CC8EF27C3EE24BEEC20B8EA1CB4E949C0EC37B2
                E42DA8DDFF00FFFF00FFFF00FFFF00FFCBCBCBD1D1D1DDDDDDD1D1D1CDCDCDC9
                C9C9C5C5C5C0C0C0BDBDBDC7C7C7BBBBBBB1B1B1FF00FFFF00FFFF00FF54CEEB
                4CD2EE63E1F641D6F432CFF22ECBF02AC6EF26C1ED22BCEB1FB7EA20B4E947BE
                EC36B2E432ABDDFF00FFFF00FFD1D1D1D4D4D4E1E1E1D8D8D8D2D2D2CFCFCFCC
                CCCCC7C7C7C3C3C3C0C0C0BDBDBDC5C5C5BBBBBBB4B4B4FF00FF5ED3EE4DD5EF
                58DCF25EDEF560DEF55FDCF648D4F32DC9EF29C4EE35C4ED50C9EF4CC4EE45BE
                EB3DB7E733B0E236ADDED5D5D5D7D7D7DDDDDDDFDFDFDFDFDFDEDEDED7D7D7CE
                CECECACACACACACACECECECACACAC5C5C5BFBFBFB9B9B9B6B6B6FF00FFB6EBF7
                7FDCF15BD0ED42C7E949CEED5BD9F447D3F23ACBF055CFF13EBFE835B7E24BBC
                E46EC8E9A3DBF1FF00FFFF00FFECECECDEDEDED3D3D3CBCBCBD1D1D1DBDBDBD6
                D6D6CFCFCFD3D3D3C5C5C5BDBDBDC3C3C3CDCDCDDFDFDFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF49CEED5DD9F459D6F343C5EA79D1EDFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1D1D1DB
                DBDBD9D9D9CACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF47CAEA56D6F259D6F33AC0E6FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCECECED8
                D8D8D9D9D9C5C5C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFBCECF748CEED48CDED9BE0F3FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDEDEDD1
                D1D1D0D0D0E2E2E2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF58D1EC47CBEAFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3
                D3D3CECECEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFD8F5FBC1EEF8FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF5
                F5F5EFEFEFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              OnClick = sbFHCompareFavouritesClick
            end
            object sbSearchSyntax: TSpeedButton
              Left = 460
              Top = 2
              Width = 23
              Height = 22
              Hint = 'show floating search syntax window'
              Anchors = [akLeft]
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
              OnClick = SpeedButton4Click
            end
            object eFHCompareDriveFolder: TComboBox
              Left = 48
              Top = 3
              Width = 406
              Height = 21
              Hint = 'folder to scan'
              Enabled = False
              TabOrder = 0
              OnKeyPress = eFHCompareDriveFolderKeyPress
            end
            object cbFHCompareFolderInclude: TAdvOfficeCheckBox
              Left = 489
              Top = 3
              Width = 229
              Height = 20
              Hint = 'include full path of file in search results'
              TabOrder = 1
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.5.0.9'
            end
          end
          object Splitter6: TPanel
            Left = 2
            Top = 31
            Width = 561
            Height = 819
            Align = alLeft
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object Panel45: TPanel
              Left = 0
              Top = 0
              Width = 561
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                561
                33)
              object sbFHCompareFolderLeftSave: TSpeedButton
                Tag = 1
                Left = 159
                Top = 5
                Width = 23
                Height = 22
                Hint = 'save search results'
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
                PopupMenu = puFHCompareSave
                OnClick = sbFHCompareFolderLeftSaveClick
              end
              object SpeedButton16: TSpeedButton
                Tag = 2
                Left = 0
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFD8A37AD3996ED19668CE9263CB8E5EC98A5BC7
                  8756C38452C38452C38452C38452C38452C38452C18454FF00FFFF00FFD7A175
                  F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
                  D8F0E2D8C58A5DFF00FFFF00FFD9A47AF9F3EEEBD2BEFFFFFFEBD3BFFFFFFFEB
                  D3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E2D8C68C5FFF00FFFF00FFDDA87E
                  F9F3EFEBD0BAEBD0BBEACDB5EACDB5EACDB5EBD1BDEACDB5EACDB5EACDB5EACD
                  B5F0E2D8C68A5CFF00FFFF00FFDFAA82F9F3EFEACEB7FFFFFFEACDB5FFFFFFEA
                  CDB5FFFFFFEACFBAFFFFFFEACDB5FFFFFFF0E2D8C88D5FFF00FFFF00FFE1AE87
                  FAF4F0EACBB2EACCB3EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5E8C8
                  AEF0E2D8C48654FF00FFFF00FFE3B18CFAF6F1EAC9AEFFFFFFEAC9B0FFFFFFE9
                  CBB3FFFFFFEACDB5FFFFFFEACDB5FFFFFFF0E2D8C68655FF00FFFF00FFE5B48F
                  FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0EACDB5EACDB5EACDB5E8CC
                  B5F0E2D8C88A59FF00FFFF00FFE7B794FBF7F4FFFFFFFFFFFFE8C4A9FFFFFFE9
                  C6AAFFFFFFE8C7ACFFFFFFE8C8B0FFFFFFF7F1EBCB8F5FFF00FFFF00FFE9BA98
                  FBF7F465A4FF64A3FF62A2FF61A1FF5F9FFF5C9DFF5A9AFF5798FF5495FF5294
                  FFFBF7F4CE9364FF00FFFF00FFEBBD9BFBF7F464A4FF79BDFF75BBFF71B9FF6D
                  B8FF68B3FF61B0FF5AABFF54A7FF3B7DFFFBF7F4D1976AFF00FFFF00FFECBF9E
                  FBF7F465A4FF64A3FF60A0FF5D9EFF5899FF5496FF4D90FF478BFF4284FF3D7F
                  FFFBF7F4D49B6FFF00FFFF00FFEEC1A2FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FB
                  F7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4D7A074FF00FFFF00FFF3D2BA
                  EFC2A3EDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
                  80DCA57DDCA780FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton21Click
              end
              object lFHCDLeft: THTMLabel
                Left = 190
                Top = 10
                Width = 366
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HTMLText.Strings = (
                  '.')
                ParentFont = False
                Transparent = True
                Version = '2.1.0.0'
                ExplicitWidth = 364
              end
              object bFHCompareFolderLeft: TBitBtn
                Left = 28
                Top = 5
                Width = 125
                Height = 22
                TabOrder = 0
                OnClick = bFHCompareFolderLeftClick
              end
            end
            object sgFHCDLeft: TAdvStringGrid
              Left = 0
              Top = 33
              Width = 561
              Height = 786
              Cursor = crDefault
              Align = alClient
              ColCount = 11
              DefaultRowHeight = 17
              DrawingStyle = gdsClassic
              FixedCols = 0
              RowCount = 5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
              ParentFont = False
              PopupMenu = puGenericTable
              ScrollBars = ssBoth
              TabOrder = 1
              OnDrawCell = sgFHCDLeftDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgFHTableGetCellColor
              OnGetAlignment = sgFHCDLeftGetAlignment
              OnCanSort = sgFHCDLeftCanSort
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = 16644337
              ActiveCellColorTo = 16576469
              CellNode.TreeColor = clSilver
              ControlLook.FixedGradientMirrorFrom = 16447735
              ControlLook.FixedGradientMirrorTo = 16052977
              ControlLook.FixedGradientHoverFrom = 16775139
              ControlLook.FixedGradientHoverTo = 16775139
              ControlLook.FixedGradientHoverMirrorFrom = 16772541
              ControlLook.FixedGradientHoverMirrorTo = 16508855
              ControlLook.FixedGradientDownFrom = 16377020
              ControlLook.FixedGradientDownTo = 16377020
              ControlLook.FixedGradientDownMirrorFrom = 16242317
              ControlLook.FixedGradientDownMirrorTo = 16109962
              ControlLook.FixedGradientDownBorder = 11440207
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
              Look = glVista
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
              SearchFooter.ColorTo = 16052977
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
              ShowSelection = False
              ShowDesignHelper = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              SortSettings.Show = True
              SortSettings.HeaderColor = 16579058
              SortSettings.HeaderColorTo = 16579058
              SortSettings.HeaderMirrorColor = 16380385
              SortSettings.HeaderMirrorColorTo = 16182488
              Version = '8.4.2.5'
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
                17
                17
                17
                17)
            end
          end
          object Panel49: TPanel
            Left = 566
            Top = 31
            Width = 944
            Height = 819
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Panel53: TPanel
              Left = 0
              Top = 0
              Width = 944
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                944
                33)
              object sbFHCompareFolderRightSave: TSpeedButton
                Tag = 2
                Left = 162
                Top = 5
                Width = 23
                Height = 22
                Hint = 'save search results'
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
                PopupMenu = puFHCompareSave
              end
              object SpeedButton33: TSpeedButton
                Tag = 3
                Left = 1
                Top = 6
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFD8A37AD3996ED19668CE9263CB8E5EC98A5BC7
                  8756C38452C38452C38452C38452C38452C38452C18454FF00FFFF00FFD7A175
                  F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
                  D8F0E2D8C58A5DFF00FFFF00FFD9A47AF9F3EEEBD2BEFFFFFFEBD3BFFFFFFFEB
                  D3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E2D8C68C5FFF00FFFF00FFDDA87E
                  F9F3EFEBD0BAEBD0BBEACDB5EACDB5EACDB5EBD1BDEACDB5EACDB5EACDB5EACD
                  B5F0E2D8C68A5CFF00FFFF00FFDFAA82F9F3EFEACEB7FFFFFFEACDB5FFFFFFEA
                  CDB5FFFFFFEACFBAFFFFFFEACDB5FFFFFFF0E2D8C88D5FFF00FFFF00FFE1AE87
                  FAF4F0EACBB2EACCB3EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5E8C8
                  AEF0E2D8C48654FF00FFFF00FFE3B18CFAF6F1EAC9AEFFFFFFEAC9B0FFFFFFE9
                  CBB3FFFFFFEACDB5FFFFFFEACDB5FFFFFFF0E2D8C68655FF00FFFF00FFE5B48F
                  FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0EACDB5EACDB5EACDB5E8CC
                  B5F0E2D8C88A59FF00FFFF00FFE7B794FBF7F4FFFFFFFFFFFFE8C4A9FFFFFFE9
                  C6AAFFFFFFE8C7ACFFFFFFE8C8B0FFFFFFF7F1EBCB8F5FFF00FFFF00FFE9BA98
                  FBF7F465A4FF64A3FF62A2FF61A1FF5F9FFF5C9DFF5A9AFF5798FF5495FF5294
                  FFFBF7F4CE9364FF00FFFF00FFEBBD9BFBF7F464A4FF79BDFF75BBFF71B9FF6D
                  B8FF68B3FF61B0FF5AABFF54A7FF3B7DFFFBF7F4D1976AFF00FFFF00FFECBF9E
                  FBF7F465A4FF64A3FF60A0FF5D9EFF5899FF5496FF4D90FF478BFF4284FF3D7F
                  FFFBF7F4D49B6FFF00FFFF00FFEEC1A2FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FB
                  F7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4D7A074FF00FFFF00FFF3D2BA
                  EFC2A3EDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
                  80DCA57DDCA780FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton21Click
              end
              object lFHCDRight: THTMLabel
                Left = 190
                Top = 10
                Width = 1316
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HTMLText.Strings = (
                  '.')
                ParentFont = False
                Transparent = True
                Version = '2.1.0.0'
                ExplicitWidth = 539
              end
              object bFHCompareFolderRight: TBitBtn
                Left = 28
                Top = 5
                Width = 125
                Height = 22
                TabOrder = 0
                OnClick = bFHCompareFolderRightClick
              end
            end
            object sgFHCDRight: TAdvStringGrid
              Left = 0
              Top = 33
              Width = 944
              Height = 786
              Cursor = crDefault
              Hint = 'double click to see all files belonging to the category'
              Align = alClient
              ColCount = 11
              DefaultRowHeight = 17
              DrawingStyle = gdsClassic
              FixedCols = 0
              RowCount = 5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
              ParentFont = False
              PopupMenu = puGenericTable
              ScrollBars = ssBoth
              TabOrder = 1
              OnDrawCell = sgFHCDLeftDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnGetCellColor = sgFHTableGetCellColor
              OnGetAlignment = sgFHCDLeftGetAlignment
              OnCanSort = sgFHCDLeftCanSort
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = 16644337
              ActiveCellColorTo = 16576469
              CellNode.TreeColor = clSilver
              ControlLook.FixedGradientMirrorFrom = 16447735
              ControlLook.FixedGradientMirrorTo = 16052977
              ControlLook.FixedGradientHoverFrom = 16775139
              ControlLook.FixedGradientHoverTo = 16775139
              ControlLook.FixedGradientHoverMirrorFrom = 16772541
              ControlLook.FixedGradientHoverMirrorTo = 16508855
              ControlLook.FixedGradientDownFrom = 16377020
              ControlLook.FixedGradientDownTo = 16377020
              ControlLook.FixedGradientDownMirrorFrom = 16242317
              ControlLook.FixedGradientDownMirrorTo = 16109962
              ControlLook.FixedGradientDownBorder = 11440207
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
              Look = glVista
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
              SearchFooter.ColorTo = 16052977
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
              ShowSelection = False
              ShowDesignHelper = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              SortSettings.Show = True
              SortSettings.HeaderColor = 16579058
              SortSettings.HeaderColorTo = 16579058
              SortSettings.HeaderMirrorColor = 16380385
              SortSettings.HeaderMirrorColorTo = 16182488
              Version = '8.4.2.5'
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
                17
                17
                17
                17)
            end
          end
        end
        object tsFHCompareFolder2: TAdvSmoothTabPage
          Left = 1
          Top = 26
          Width = 1512
          Height = 852
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
          TabAppearance.Appearance.ImageIndex = 16
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
          TabAppearance.BevelColorHot = 16640730
          TabAppearance.BevelColorDisabled = clWhite
          TabAppearance.Color = clWhite
          TabAppearance.ColorDown = clWhite
          TabAppearance.ColorSelected = clWhite
          TabAppearance.ColorDisabled = 15658734
          TMSStyle = 21
          object Splitter7: TAdvSplitter
            Left = 563
            Top = 31
            Height = 819
            Appearance.BorderColor = clNone
            Appearance.BorderColorHot = clNone
            Appearance.Color = clWhite
            Appearance.ColorTo = clSilver
            Appearance.ColorHot = clWhite
            Appearance.ColorHotTo = clGray
            GripStyle = sgDots
            ExplicitLeft = 630
            ExplicitTop = 66
          end
          object Panel48: TPanel
            Left = 2
            Top = 2
            Width = 1508
            Height = 29
            Align = alTop
            Color = clWhite
            FullRepaint = False
            TabOrder = 0
            object SpeedButton1: TSpeedButton
              Left = 2
              Top = 3
              Width = 36
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
              OnClick = SpeedButton1Click
            end
          end
          object Panel54: TPanel
            Left = 2
            Top = 31
            Width = 561
            Height = 819
            Align = alLeft
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object Panel55: TPanel
              Left = 0
              Top = 0
              Width = 561
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              object sbFHCompareFolder2LeftSaveClick: TSpeedButton
                Tag = 1
                Left = 159
                Top = 5
                Width = 23
                Height = 22
                Hint = 'save search results'
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
                OnClick = sbFHCompareFolder2LeftSaveClickClick
              end
              object SpeedButton3: TSpeedButton
                Tag = 2
                Left = -1
                Top = 4
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFD8A37AD3996ED19668CE9263CB8E5EC98A5BC7
                  8756C38452C38452C38452C38452C38452C38452C18454FF00FFFF00FFD7A175
                  F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
                  D8F0E2D8C58A5DFF00FFFF00FFD9A47AF9F3EEEBD2BEFFFFFFEBD3BFFFFFFFEB
                  D3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E2D8C68C5FFF00FFFF00FFDDA87E
                  F9F3EFEBD0BAEBD0BBEACDB5EACDB5EACDB5EBD1BDEACDB5EACDB5EACDB5EACD
                  B5F0E2D8C68A5CFF00FFFF00FFDFAA82F9F3EFEACEB7FFFFFFEACDB5FFFFFFEA
                  CDB5FFFFFFEACFBAFFFFFFEACDB5FFFFFFF0E2D8C88D5FFF00FFFF00FFE1AE87
                  FAF4F0EACBB2EACCB3EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5E8C8
                  AEF0E2D8C48654FF00FFFF00FFE3B18CFAF6F1EAC9AEFFFFFFEAC9B0FFFFFFE9
                  CBB3FFFFFFEACDB5FFFFFFEACDB5FFFFFFF0E2D8C68655FF00FFFF00FFE5B48F
                  FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0EACDB5EACDB5EACDB5E8CC
                  B5F0E2D8C88A59FF00FFFF00FFE7B794FBF7F4FFFFFFFFFFFFE8C4A9FFFFFFE9
                  C6AAFFFFFFE8C7ACFFFFFFE8C8B0FFFFFFF7F1EBCB8F5FFF00FFFF00FFE9BA98
                  FBF7F465A4FF64A3FF62A2FF61A1FF5F9FFF5C9DFF5A9AFF5798FF5495FF5294
                  FFFBF7F4CE9364FF00FFFF00FFEBBD9BFBF7F464A4FF79BDFF75BBFF71B9FF6D
                  B8FF68B3FF61B0FF5AABFF54A7FF3B7DFFFBF7F4D1976AFF00FFFF00FFECBF9E
                  FBF7F465A4FF64A3FF60A0FF5D9EFF5899FF5496FF4D90FF478BFF4284FF3D7F
                  FFFBF7F4D49B6FFF00FFFF00FFEEC1A2FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FB
                  F7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4D7A074FF00FFFF00FFF3D2BA
                  EFC2A3EDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
                  80DCA57DDCA780FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton21Click
              end
              object bFHCompareTreeLeft: TBitBtn
                Tag = -1
                Left = 28
                Top = 4
                Width = 125
                Height = 22
                TabOrder = 0
                OnClick = bFHCompareTreeLeftClick
              end
            end
            object tvFHTLeft: THTMLTreeview
              Left = 0
              Top = 33
              Width = 561
              Height = 786
              HTMLImages = ilTabs
              ItemHeight = 16
              SelectionNFColor = clSilver
              SelectionNFFontColor = clBlack
              Align = alClient
              Indent = 19
              TabOrder = 1
              OnExpanding = tvFHTLeftExpanding
              Version = '1.4.1.5'
            end
          end
          object Panel56: TPanel
            Left = 566
            Top = 31
            Width = 944
            Height = 819
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Panel57: TPanel
              Left = 0
              Top = 0
              Width = 944
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = 3355443
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              object sbFHCompareFolder2RightSaveClick: TSpeedButton
                Tag = 2
                Left = 162
                Top = 5
                Width = 23
                Height = 22
                Hint = 'save search results'
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
                OnClick = sbFHCompareFolder2LeftSaveClickClick
              end
              object SpeedButton6: TSpeedButton
                Tag = 5
                Left = 0
                Top = 5
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFD8A37AD3996ED19668CE9263CB8E5EC98A5BC7
                  8756C38452C38452C38452C38452C38452C38452C18454FF00FFFF00FFD7A175
                  F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
                  D8F0E2D8C58A5DFF00FFFF00FFD9A47AF9F3EEEBD2BEFFFFFFEBD3BFFFFFFFEB
                  D3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E2D8C68C5FFF00FFFF00FFDDA87E
                  F9F3EFEBD0BAEBD0BBEACDB5EACDB5EACDB5EBD1BDEACDB5EACDB5EACDB5EACD
                  B5F0E2D8C68A5CFF00FFFF00FFDFAA82F9F3EFEACEB7FFFFFFEACDB5FFFFFFEA
                  CDB5FFFFFFEACFBAFFFFFFEACDB5FFFFFFF0E2D8C88D5FFF00FFFF00FFE1AE87
                  FAF4F0EACBB2EACCB3EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5E8C8
                  AEF0E2D8C48654FF00FFFF00FFE3B18CFAF6F1EAC9AEFFFFFFEAC9B0FFFFFFE9
                  CBB3FFFFFFEACDB5FFFFFFEACDB5FFFFFFF0E2D8C68655FF00FFFF00FFE5B48F
                  FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0EACDB5EACDB5EACDB5E8CC
                  B5F0E2D8C88A59FF00FFFF00FFE7B794FBF7F4FFFFFFFFFFFFE8C4A9FFFFFFE9
                  C6AAFFFFFFE8C7ACFFFFFFE8C8B0FFFFFFF7F1EBCB8F5FFF00FFFF00FFE9BA98
                  FBF7F465A4FF64A3FF62A2FF61A1FF5F9FFF5C9DFF5A9AFF5798FF5495FF5294
                  FFFBF7F4CE9364FF00FFFF00FFEBBD9BFBF7F464A4FF79BDFF75BBFF71B9FF6D
                  B8FF68B3FF61B0FF5AABFF54A7FF3B7DFFFBF7F4D1976AFF00FFFF00FFECBF9E
                  FBF7F465A4FF64A3FF60A0FF5D9EFF5899FF5496FF4D90FF478BFF4284FF3D7F
                  FFFBF7F4D49B6FFF00FFFF00FFEEC1A2FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FB
                  F7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4D7A074FF00FFFF00FFF3D2BA
                  EFC2A3EDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
                  80DCA57DDCA780FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton21Click
              end
              object bFHCompareTreeRight: TBitBtn
                Tag = -1
                Left = 28
                Top = 5
                Width = 125
                Height = 22
                TabOrder = 0
                OnClick = bFHCompareTreeRightClick
              end
            end
            object tvFHTRight: THTMLTreeview
              Left = 0
              Top = 33
              Width = 944
              Height = 786
              HTMLImages = ilTabs
              ItemHeight = 16
              SelectionNFColor = clSilver
              SelectionNFFontColor = clBlack
              Align = alClient
              Indent = 19
              TabOrder = 1
              OnExpanding = tvFHTRightExpanding
              Version = '1.4.1.5'
            end
          end
        end
      end
    end
  end
  object puCharts: TPopupMenu
    Left = 1175
    Top = 128
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
  object puGenericTable: TPopupMenu
    OnPopup = puGenericTablePopup
    Left = 1057
    Top = 72
    object miGenericExport: TMenuItem
      Caption = '.'
      ImageIndex = 49
      OnClick = miGenericExportClick
    end
    object miGenericClipboard: TMenuItem
      Caption = '.'
      ImageIndex = 50
      OnClick = miGenericClipboardClick
    end
    object miGenericClipboardHTML: TMenuItem
      Caption = '.'
      OnClick = miGenericClipboardHTMLClick
    end
  end
  object puFHCompareSave: TPopupMenu
    OnPopup = puFHCompareSavePopup
    Left = 1033
    Top = 24
    object miFHCSSaveAll: TMenuItem
      Caption = '.'
      ImageIndex = 49
      OnClick = miFHCSSaveAllClick
    end
    object miFHCSSaveDo: TMenuItem
      Tag = 1
      Caption = '.'
      OnClick = miFHCSSaveDoClick
    end
    object miFHCSSaveDont: TMenuItem
      Tag = 2
      Caption = '.'
      OnClick = miFHCSSaveDontClick
    end
  end
  object ilTabs: TImageList
    DrawingStyle = dsTransparent
    ShareImages = True
    Left = 1152
    Top = 2
    Bitmap = {
      494C01011300A402880A10001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000A2CAEE0076B2
      E6003E91DB00348CD900348CD900348CD900348CD900348CD900348CD900348C
      D900348CD900348BD900398FDA0085B9E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004799DD00DEF1
      FA00A8DDF4009EDBF40096DAF3008ED8F30086D7F3007FD4F20079D3F20072D2
      F1006CD0F10069CFF100C2EAF8003F95DB000000000000000000000000000000
      0000000000008EA5B7006383A00053799B0053799B006383A0008CA3B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003B97DB00EFFA
      FE00A1E9F90091E5F80081E1F70072DEF60063DAF50054D7F40047D3F30039D0
      F2002ECDF10026CBF000CAF2FB003B97DB000000000000000000000000000000
      0000587E9F005A97B10085BDCE00A4D6DE00A0D5DE007BB9CB004F8CAB005578
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006494
      BA0022679D0081A8C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003C9DDB00F2FA
      FD00B3EDFA00A4E9F90095E6F80085E2F70076DEF60065DBF50057D7F40049D4
      F3003BD1F20030CEF100CCF2FB003B9BDB000000000000000000000000005588
      A60096C8D600CCCABF00C89F8600C5927600C4907300C49A8000C3C4B9007DBD
      CD00477798000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006F9CC200558D
      BC0089B5DD00185F970000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1D1D100BDBDBD003BA3DB00F6FC
      FE00C8F2FC00B9EFFB00ACECFA009CE8F9008BE3F7007CE0F6006CDCF6005DD9
      F5004FD6F40044D3F300D0F3FC003BA2DB0000000000000000005D86A500A2CC
      D800CDB7A500D8AA8900EFDFCF00FAF6F300FAF5F300EFDFD100D7A78500C3AC
      980082BDCE005375970000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BA4CA006497C5009DC1
      E4006699C7003171A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A8A800F2F2F2003BA8DB00FEFF
      FF00F8FDFF00F6FDFF00F5FCFF00F3FCFE00D8F6FC0094E6F80085E3F70076DF
      F60068DBF5005CD8F400D7F4FC003BA7DB00000000000000000078A9C000DAD1
      C600D9AA8800FFFEEB00FFFAEE00FFFDF200FFFEF200FFFCEF00FFFDEB00D9A3
      7A00CBC6B9005894B1000000000000000000000000000000000000000000E8CF
      BA00DBB29200D3A68000D0A17C00D2A68500AEA1990075A2CC00ABCBE80076A4
      CE00407BAF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7A7A700FBFBFB0039ADDB00E8F6
      FB0094D4EF0088CEEE0073C1E900C9E9F600F2FCFE00F3FCFE00F2FCFE00F0FC
      FE00EFFBFE00EEFBFE00FEFFFF003CAEDB0000000000739DB800B7D3DD00D1AA
      9000F0DBC100FFF7E600FAF2E300C5C0B600F1EDDE00FFFCE800FFF5DF00EFD4
      AF00C99B7B0092C2D0006485A100000000000000000000000000E8CAB000E8C9
      AE00F5E1CD00F7E5D300F7E5D100F3DDC800DFBA9C00C7A8910086AED5005087
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00FBFBFB0040AEDC00F1FA
      FD0094DEF50093DCF40081D5F2006ACAED006CCBEA0085D3EF0080D2EF007AD0
      EF0076CFEE0072CFEE00E9F7FB003EB2DC00000000006C9DBA00DDEAEC00CF9F
      8100FAF3E200FDF6E900F2F0E3008D8C8400817F7700D2CFC200FFFBEB00FAEC
      CC00C7906D00C1DDE100597EA0000000000000000000F1DBC800EDD0B700F8E8
      D900F5DEC800F3D8BD00F3D6BB00F4DBC200F7E4D200DFBB9D00A09795000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAE00FDFDFD0041B4DC00F7FC
      FE008EE4F80091DEF5009FE0F500ACE1F600EFFBFE00F4FDFE00F3FCFE00F1FC
      FE00EFFBFE00EEFBFE00FAFDFF0058BCE0000000000071A4BF00E4ECEE00D1A5
      8A00FAF6E900FDF8EE00FFFFF90081807900B1AEA400817F7700C9C6BA00FAF0
      D300C9957200C9DFE2005A80A1000000000000000000EECEB200F7E7D700F6E1
      CC00F4DBC200F4DAC000F3D8BD00F3D7BB00F4DBC200F3DEC900D2A887000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2B2B200FFFFFF003CB5DB00FDFE
      FE00FEFFFF00FEFEFF00FDFEFF00FEFFFF00EAF7FB006EC8E5006FC9E4006FC9
      E4006FC9E4007DCFE70084D0E800BAE5F200000000007BABC400D3E1E600DBB9
      A400F1E3D600FEFBF500F5F5F3009F9E9500F0F0E900F8F8F200BEB9AD00F0DA
      C200D1A78B00A9CAD300698CA8000000000000000000F0CEAF00F9ECDF00F5DF
      C800F5DDC600F4DCC300F4DAC100F3D9BE00F3D7BD00F8E6D300D3A680000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500F7F7F70059C2E00061C3
      E20063C4E30063C4E30063C4E30062C4E30056C0E000EDF8FC00F3FAFD00F3FA
      FD00F3FAFD00F3FAFD00F3FBFD00FCFEFE000000000000000000B7CFDB00EDE0
      D700DEBDAA00FFFFFF00F0F0EE00E7E5DA00FFFFF700FFFFF700FFFEF300DCB4
      9800E1D1C40073A4BB00000000000000000000000000F4D3B500F9EDE100F6E1
      CC00F5DFC900F5DEC700F4DCC400F4DBC200F4DAC000F8E7D600D7AB87000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6B600FBFBFB00E0E0E000DEDE
      DE00D9D9D900CFCFCF00CFCFCF00D6D6D600D6D6D600D4D4D400D3D3D300D3D3
      D300F7F7F700B8B8B8000000000000000000000000000000000077B4CD00DFE9
      EC00E6CFC200DFBFAE00F1E3DC00F3F1EC00F4F1EB00F1E2D900DCBAA300DEC1
      AF00B7CFD8005F88A800000000000000000000000000F8DBC100F9EBDE00F7E7
      D600F6E1CC00F5E0CA00F5DEC800F5DDC500F6E1CB00F5E2D000DFB999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00FDFDFD00E5E5E500E0E0
      E000E2E2E200E4E4E400FBFBFB00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFB
      FB00FEFEFE00C1C1C100000000000000000000000000000000000000000097CC
      DC00E1EBEE00EEE1D900DFBEAC00D5AD9600D4AA9200DCB7A300E8DACE00C6D9
      DF00689BB60000000000000000000000000000000000FCEAD800F8E2CC00FAEE
      E300F7E7D600F6E2CE00F6E1CB00F6E3D000F9EADD00ECCFB500ECD4BF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00FEFEFE00FFFFFF00FEFE
      FE00FEFEFE00FFFFFF00F8F8F800CBCBCB00CCCCCC00CCCCCC00CCCCCC00D1D1
      D100D3D3D300E6E6E60000000000000000000000000000000000000000000000
      00007BBCD300C8D9E300DDE7EA00EEF1F100ECF0F000D2E0E400A8C4D2006EA0
      BB00000000000000000000000000000000000000000000000000FBE4CE00F9E2
      CD00FAECDE00F9EEE200F9EDE200F8E9DA00F0D5BD00EDD0B700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5C5C500C7C7C700C8C8C800C8C8
      C800C8C8C800C8C8C800C4C4C400F9F9F900FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FCFCFC00FEFEFE0000000000000000000000000000000000000000000000
      0000000000009FC1D50082B8D1007EB9D1007DB5CE007EB1C9009DBBCF000000
      000000000000000000000000000000000000000000000000000000000000FCEA
      D900FADDC200F6D6B900F4D3B500F3D4B800F5E0CD0000000000000000000000
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
      00000000000000000000B97B5600C0764A00C8754500C3764800C4764800C376
      4800C3764800C4754800BF754900C68056000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D2977A00AA553800AD4C2B00AE4A2600AD482600AA482900A74D3100C77F
      5F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C27A4D00FCF3EC00FAF1E800FAF0E700FBF1E900FBF2
      EA00FBF2EA00FBF2EB00FDF4EE00C880550000000000000000004DA3EA00469E
      E8003E9AE7003595E6001E8CE200208CE200218DE4001989E3001283E3000A81
      E100037DE0000079DF00000000000000000000000000BAD3EA00287BCE008863
      6300BF603500FEB96100FEB96200FEB96200FEB96200FEB96100FEB96100B149
      24007F6A73003482CF00B4CFE8000000000000000000E8D1D100D2BDBD00B5A3
      A300B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F9F00B09F
      9F00AF9E9E00B3A1A100D8C3C300000000000000000000000000000000000000
      00000000000000000000CF825300EFF1E700FFE9D900FFEADB00FFE9D900FFE7
      D700FFE5D200FFE2CB00EFF2E800CE815600000000000000000055A7EB00B6E6
      F90095D1F1004BA7E8005AAFEB007DC2EE00BBEEFB00BAEEF900B7EDF900B3ED
      F900B2EDF900017DE2000000000000000000000000002A7ED10082BAEE009F66
      5800F5BB8400FFAC5B00FEA85A00FEA25700FE9C5300FFA35500FF9F5000F8AE
      7800A45E4A0083BCEF002B78CA000000000000000000BAA8A800FFF2F200F9E0
      E000F6DEDE00F5DDDD00F3DBDB00F2DADA00F0D8D800EFD7D700EED6D600EBD4
      D400EAD3D300FFECEC00B7A5A500000000000000000000000000000000000000
      00000000000000000000CB835300FBF5EE00FFE9D900FFEADB00FFE9D900FFE7
      D700FFE5D200FFE2CB00FBF6EF00CC83550000000000000000005DABEB00B4E3
      F800329FE6003BABE900A8E9F8004EBAEB005AD6F30050D4F30048D2F20042D1
      F200B4EDF9000881E3000000000000000000000000002B7ECF0078B3EA00B39E
      9400FFB76000FFB66300FEB26100FEAC5D00FEA55900FD9E5300FE974E00FF8D
      4300BC8F82007EB8ED002D77C8000000000000000000B9A7A700FFFBFB00FFEA
      EA00FFE6E600FBE2E200F8DFDF00F4DCDC00F2DADA00EED6D600EAD3D300E8D1
      D100E6CFCF00FFF2F200B9A7A700000000009D9D9D0092929200878787008B8B
      8B008B8B8B008B8B8B00CA845200FFF7F100FFE9D900FFEADB00FFE9D900FFE7
      D700FFE5D200FFE2CB00FFF7F100CB85550000000000000000005DACEC0055AD
      EB0047AFEB00ACE9F900ADEAFA0056BBEB0062D9F4005AD6F30050D4F30049D2
      F300B7EDF9001185E400000000000000000000000000E1C9BC008A544400FCC8
      AB00FFD19800FEC76D00FEBF6800FEB96400FEB15E00FEA85900FDA05400FFB7
      7A00FEA9800088504200D3BCAF000000000000000000BEABAB00FFFBFB00FFEE
      EE00FFEAEA00FFE7E700FCE3E300F9E0E000F5DDDD00F2DADA00EFD7D700EBD4
      D400E9D2D200FFF2F200BCA9A9000000000092929200F5F5F500F2F2F200F1F1
      F100F2F2F200F3F3F300E4BA9100FFF7F000FFE7D500FDE7D600FDE6D400FCE4
      D000FBE3CB00FADCC200FEF3E800CC86560000000000000000005EADEB0083C3
      F000D3F3FC00D1F3FC00B2EDFA005BBCED006CDAF40062D9F4005AD6F30051D4
      F300BAEEFB001A8AE50000000000000000000000000000000000DFB9A400C44C
      1F00F6E4D600FFE4A400FFD47200FFC96900FFC06300FFB65F00FFC18000F6D7
      C600C5491F00D7B09B00000000000000000000000000C1AEAE00FFFDFD00FFF3
      F300FFEFEF00FFECEC00FFE9E900FDE4E400FAE1E100F6DEDE00F3DBDB00F1D9
      D900EED6D600FFF3F300C1AEAE000000000090909000F1F1F100EAEAEA00EBEB
      EB00EAEAEA00E8E8E800E4BB9100FFF7F200FEE7D500FEE7D500FDE5D100FAE0
      CA00F9DEC400F7D9BC00FDF2E700CC875700000000000000000071B6EE009ED1
      F40078CAF00072C7F0006EC6F00060BEED0076DDF5006CDBF40064D9F4005BD6
      F300BEEFFB00238FE8000000000000000000000000000000000000000000DAB4
      9E00BC481C00F4E2D4004E7BA9004D7BA8004D7BA8004E7BA900F3D6C300BE46
      1C00D4AD980000000000000000000000000000000000C6B2B200FFFFFF00FFFE
      FE00FFFEFE00FFFDFD00FFFCFC00FFF6F600FFE7E700FDE4E400F9E0E000F5DD
      DD00F2DADA00FFF5F500C4B1B1000000000092929200F5F5F500EAEAEA00EBEB
      EB00EAEAEA00E8E8E800E4BB9200FEF7F100FCE5D200FCE4D100FBE2CC00F9DD
      C400F6D7BB00F3D1AF00FAEFE400CC875800000000000000000079B9F000DBF6
      FC009CE7F80095E5F8008FE3F70086E1F7007EDFF50076DDF5006DDBF40064D9
      F400C0F0FB002C94E90000000000000000000000000000000000000000000000
      0000A0837500346DA7009CCCF800AFD4F700AFD4F700A5CFF6003474AE00997C
      71000000000000000000000000000000000000000000C9B5B500FFF7F700F0D8
      D800EAD3D300DEC8C800FFEBEB00FFFCFC00FFFCFC00FFFCFC00FFFCFC00FFFB
      FB00FFFBFB00FFFFFF00C9B5B5000000000093939300F8F8F800EAEAEA00EBEB
      EB00EAEAEA00E8E8E800E4BB9200FEF6F000FCE2CD00FCE3CD00FADFC800F7D9
      BC00F5E9DD00FAF3EB00FBF8F300CA83530000000000000000008CC5F400DDF7
      FD00A2E8F8009DE7F80095E5F8008FE3F70087E1F7007FDFF60077DDF5006DDB
      F400C4F0FB003798EA0000000000000000000000000000000000000000000000
      00005B81AB00A6CAEE00ABCCEA00A7D0F600A8D0F600ABCCEA00A7CDEE005781
      AE000000000000000000000000000000000000000000CAB6B600FFFBFB00F9E0
      E000F6DEDE00F1D9D900E6CFCF00E6CFCF00EED6D600EED6D600EBD4D400EAD3
      D300EAD3D300FFF7F700CCB8B8000000000094949400F8F8F800E8E8E800E8E8
      E800E7E7E700E5E5E500E4BB9300FEF5ED00FCDEC500FBE0C700F9DCC200F5D3
      B400FEF9F300FAE2C400ECC19300BC947500000000000000000093C8F500E1F7
      FD00AAEAF900A3E8F9009DE7F80096E5F80090E3F70088E1F70080DFF60077DD
      F500C8F1FB00409EEB0000000000000000000000000000000000000000000000
      00002F69A200D9E8F70097C5F1008EBBE5007FA9D10089B5DF00CDDFEE002F70
      AC000000000000000000000000000000000000000000CEBABA00FFFDFD00FEE5
      E500F9E0E000FBE2E200FDE4E400FFFBFB00FFFDFD00FFFCFC00FFFCFC00FFFB
      FB00FFFBFB00FFFEFE00D6C1C1000000000095959500F8F8F800E8E8E800E8E8
      E800E6E6E600E1E1E100E5BE9600FFFFFE00FDF3E900FDF3EA00FCF2E800FAEF
      E300FAF2E700EABB8800C38F6D00F5F1EF00000000000000000097CCF600F9FD
      FF00F0FBFE00F0FBFE00F0FCFE00EEFBFD00EFFBFD00EFFBFD00F0FBFD00F0FB
      FD00F7FDFE004AA3ED0000000000000000000000000000000000000000000000
      00000C3E87007C97B8008AB7E400719CC80015406E001944720022456B00163F
      69000000000000000000000000000000000000000000CEBABA00FFFEFE00FFFF
      FF00FFFEFE00FFFEFE00FFFFFF00FFF8F800E1CBCB00E2CCCC00E2CCCC00E2CC
      CC00E8D1D100EAD3D300FFE6E6000000000095959500F8F8F800E7E7E700E6E6
      E600E3E3E300DFDFDF00EAC39D00E6BF9600E4BB9200E4BB9200CFA06E00CE9E
      6F00C5976800C09A8000F7F4F300000000000000000000000000B2DCFD00FAFE
      FF00FAFEFF00FAFEFF00FAFEFF00FAFEFF00FAFDFE00FAFDFF00FAFEFF00FAFE
      FF00FAFDFF0053A8EE0000000000000000000000000000000000000000000000
      00000F4B970012589F000F4A8A000F4B8700114B8700154C8500124175001C3E
      65000000000000000000000000000000000000000000DBC5C500DDC7C700DEC8
      C800DEC8C800DEC8C800DEC8C800DAC4C4000000000000000000000000000000
      00000000000000000000000000000000000095959500F7F7F700E4E4E400E4E4
      E400E1E1E100DADADA00EBEBEB00F4F4F400F8F8F800A0A0A000000000000000
      0000000000000000000000000000000000000000000000000000B6DFFE00A2D2
      FA009CD1F90097CDF80092CAF7008CC6F60085C2F5007EBFF40076BAF4006EB6
      F10065B2F0005DADF00000000000000000000000000000000000000000000000
      000090A0B800124F960012589B0012589900115393000F4A87000F3F72008895
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095959500F5F5F500E0E0E000E1E1
      E100DEDEDE00D5D5D500FAFAFA00E2E2E200C4C4C400BCBCBC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C9CB6001C509200104B90000F488A001A4982008695AA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009999990000000000F4F4F400F4F4
      F400F3F3F300F0F0F000F3F3F300BFBFBF00B3B3B300F9F9F900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A4A4009B9B9B00959595009595
      9500959595009595950097979700C4C4C400FAFAFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFB49300D59D7400D1966800CE926300C7875600C3845200C384
      5200C3845200C3845200C3845200D0A17D0000000000FBFBFB00B0B0B000A4A4
      A400EFEFEF00000000000000000000000000000000000000000000000000F3F3
      F300A7A7A700ABABAB00F6F6F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7A17500F8F2ED00F7F0EA00F6EDE600F1E4DB00F0E2D800F0E2
      D800F0E2D800F0E2D800F0E2D800C58B5E0000000000F9F9F900B8B8B800DBDB
      DB00B8B8B700BDAC96009C81600084643B0084643B009C816000BDAB9500B7B7
      B600D9D9D900B5B5B500F5F5F5000000000000000000DFB49300D59D7400D196
      6800CE926300CB8E5E00C98A5B00C7875600C3845200C3845200C3845200C384
      5200C3845200C3845200D0A17D00000000000000000000000000000000000000
      0000000000000000000000000000938EFF007C76FF00F0EDFF00000000000000
      000000000000000000000000000000000000000000000000000000000000E3BC
      9D00D9A78200E1AE8700FAF4F000EACBB200EACCB300E8C7AC00E8C7AC00E8C7
      AC00E8C8B000E8C8AE00F0E2D800C48654000000000000000000F0F0F000D3D3
      D300C3C0BE009C6B3B00A66C3500AE6F3700AE6F3700A66C3500A1764A00C5C4
      C300C6C6C500F1F1F100000000000000000000000000D7A17500F8F2ED00F7F0
      EA00F6EDE600F4EAE200F3E7DE00F1E4DB00F0E2D800EAD6C800F2E5DC00FAF4
      F100F9F3F000FAF5F200C58B5E00000000000000000000000000000000000000
      000000000000000000008F8BFF00A9A7FF00A7A5FF006B64FF00ECEAFF000000
      000000000000000000000000000000000000000000000000000000000000DBAA
      8300F9F3EF00E3B18C00FAF6F100EAC9AE00FFFFFF00E8C7AC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1E5DB00C68655000000000000000000D1C1AE00A78D
      6F00AF784400BB8C5E00C2937100C4917400C38F7100BF906C00B88A5D00B486
      5900A58A6A00D1C1AE00000000000000000000000000D9A47A00F9F3EE00EBD2
      BE00FFFFFF00EBD3BF00FFFFFF00EBD3C000FFFFFF00EAC7AD00ECD9CD00F1E4
      DB00F9F3F000F9F2EF00C68C5F00000000000000000000000000000000000000
      000000000000B1AFFF00B2B0FF00DDDDFF00BEBEFF00A7A5FF006C65FF00F2EF
      FF000000000000000000000000000000000000000000E6C3A800DDB19000E1AE
      8700F7ECE600E5B48F00FAF6F200E9C6AA00E9C6AC00E8C7AC00E8C7AC00E9C9
      B000E8C8B000E8CCB500F2E7DE00C88A590000000000EAE1D700A7855B00B37D
      4600C2997100D8AA8900EFDFCF00FAF6F300FAF5F300EFDFD100D7A78500BE94
      6C00B37D4600A7855B00EAE1D7000000000000000000DDA87E00F9F3EF00EBD0
      BA00EBD0BB0075B57A0075B57A0075B57A00EBD1BD00EACDB500FAF4F000EBD9
      CC00F1E4DB00FAF4F100C68A5C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A2FF000000
      00000000000000000000000000000000000000000000DFB49100F9F5F100E6B7
      9500FAF5F000E7B79400FBF7F400E9C3A600FFFFFF00E8C7AC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F1EB00CB8F5F0000000000D0BAA000B0804A00C69B
      6F00D9AA8800FFFEEB00FFFAEE00FFFDF200FFFEF200FFFCEF00FFFDEB00D9A3
      7A00C2996C00B0804A00D0BAA0000000000000000000DFAA8200F9F3EF00EACE
      B700FFFFFF0075B57A0094D49B0074B57900FFFFFF00EACFBA00FBF6F200FAF3
      F000EBD8CB00F2E6DD00C88D5F0000000000000000000000000000000000C5C5
      FF0000000000FCFCFF0000000000000000007A7AFF0000000000BFBFFF009996
      FF000000000000000000000000000000000000000000E7BE9F00FBF6F300E6B7
      9400F9F3ED00E9BA9800FBF7F400E9C3A600E9C3A600E9C3A600E9C3A600E9C3
      A600E9C3A600E9C3A600FBF7F400CE93640000000000C19E7500BF8F5800CDA3
      8100F0DBC100FFF7E600FAF2E300C5C0B600F1EDDE00FFFCE800FFF5DF00EFD4
      AF00C8997200BF8F5800C19E75000000000000000000E1AE8700FAF4F000EACB
      B200EACCB30075B57A0074B5790073B47800EACEB70070B375006FB274006EB1
      7200E8C8AE00EAD7C900C4865400000000000000000000000000CACCFF00B4B5
      FF00000000000000000000000000000000007F7FFF00000000007D7DFF00BBBB
      FF0000000000847FFF00000000000000000000000000E9C1A300FBF8F400E7B9
      9800FBF8F500EBBD9B00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBF7F400D1976A0000000000BC8F5A00C99C6600CF9F
      8000FAF3E200FDF6E900F2F0E3008D8C8400817F7700D2CFC200FFFBEB00FAEC
      CC00C7906D00C99C6600BC8F5A000000000000000000E3B18C00FAF6F100EAC9
      AE00FFFFFF00EAC9B000FFFFFF00E9CBB300FFFFFF006FB173008ED295006BAF
      6F00FFFFFF00F1E5DB00C68655000000000000000000C4C7FF00BBBEFF000000
      00000000000000000000F6F6FF00000000008080FF00000000007F7FFF000000
      0000000000009B99FF007E78FF00EFECFF0000000000EAC3A500FBF8F500E9BC
      9B00FAF3EE00ECBF9E00FBF7F4009CD5A50098D3A1008BCB930082C689007EC3
      84007AC1800076BE7C00FBF7F400D49B6F0000000000C6986000CEA67100D1A5
      8900FAF6E900FDF8EE00FFFFF90081807900B1AEA400817F7700C9C6BA00FAF0
      D300C9967200CEA67100C69860000000000000000000E5B48F00FAF6F200E9C6
      AA00E9C6AC00EAC7AC00E9C7AD00E9C9AE00E9C9B0006CB071006AAF6E0068AD
      6D00E8CCB500F2E7DE00C88A590000000000C5C8FF00D0D2FF00E8E8FF00E0E0
      FF000000000000000000E2E2FF000000000000000000000000009898FF009191
      FF0000000000BDBDFF00A6A4FF00827DFF0000000000ECC5A900FCF9F600EBBE
      9E00FBF8F500EFC6A800FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
      F400FBF7F400FBF7F400FBF7F400D8A3780000000000D9B28400D3AC7500D9B7
      9800F1E3D600FEFBF500F5F5F3009F9E9500F0F0E900F8F8F200BEB9AD00F0DA
      C200D2AA8700D3AC7500D9B284000000000000000000E7B79400FBF7F400E9C3
      A600FFFFFF00E8C4A900FFFFFF00E9C6AA00FFFFFF00E8C7AC00FFFFFF00E8C8
      B000FFFFFF00F7F1EB00CB8F5F000000000000000000AFB3FF00EDEEFF00FBFB
      FF00000000000000000000000000F4F5FF00DADAFF00D7D7FF00D5D5FF00CFCE
      FF00C5C5FF00B4B3FF00807BFF00F8F6FF0000000000EDC8AD00FCF9F600ECC0
      A100FAF3EE00CACCA500E6C3A200EDC09F00EBBE9D00E7B79300E4B28C00E2AF
      8800E0AC8400DDA98000DCA57D00E2B6960000000000D6CAB300D3AD7700DFC4
      9A00DEBDAA00FFFFFF00F0F0EE00E7E5DA00FFFFF700FFFFF700FFFEF300DCB4
      9800DBC09600C2AA7E00E1CDB1000000000000000000E9BA9800FBF7F40065A4
      FF0064A3FF0062A2FF0061A1FF005F9FFF005C9DFF005A9AFF005798FF005495
      FF005294FF00FBF7F400CE936400000000000000000000000000B3B7FF000000
      0000B1B5FF00AFB2FF00000000000000000000000000A1A2FF00000000009897
      FF009392FF00918EFF00F2F1FF000000000000000000EFCAAF00FCF9F600F1CC
      B100FBF8F500FBF8F500FBF8F500FBF8F500FBF8F500FBF8F500FBF7F400F8EF
      E900FBF8F500DCAC85000000000000000000C2E7F7002FA9DE0036A0C700DEBF
      8A00E2C9A700DFBFAE00F1E3DC00F3F1EC00F4F1EB00F1E2D900DCBAA300DFC3
      9E008CB1A9003DA8D2003CADDE00D8EFFA0000000000EBBD9B00FBF7F40064A4
      FF0079BDFF0075BBFF0071B9FF006DB8FF0068B3FF0061B0FF005AABFF0054A7
      FF003B7DFF00FBF7F400D1976A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0CCB100FCF9F600CCD1
      AE00E2C6A600E6C2A000E4C09D00E0B99400DDB48D00DBB28900E3B48F00DDAA
      8200DFAE8A00E5BDA000000000000000000082D0F10085D4F3006BC7E9003DA5
      C700E2C79200E6D1A900E0C2A600D5AE9600D5AB9200DEBDA000E4CFA600BFC1
      9E0048B3D700ACE3F60049BCEB00D8F0FB0000000000ECBF9E00FBF7F40065A4
      FF0064A3FF0060A0FF005D9EFF005899FF005496FF004D90FF00478BFF004284
      FF003D7FFF00FBF7F400D49B6F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2D1BA00FCF9F600FCF9
      F600FCF9F600FCF9F600FCF9F600FCF9F600FCF9F600FCF9F600FCF9F600E0B5
      93000000000000000000000000000000000084D5F4006ECFF200B5E8F9006BCB
      EC0043AECE00ECC48800E9CB9400E7D09D00E7D09D00E9CB9400DEC28E003AAD
      D20086D5F1007FD4F40032B8ED000000000000000000EFC6A800FBF7F400FBF7
      F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
      F400FBF7F400FBF7F400D8A37800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9E7DB00F4D3BD00F1CD
      B200EFCBB100ECC5A900E9C1A300E8BFA000E6BD9D00E4BA9900E3B79700E7C5
      AB00000000000000000000000000000000000000000075D3F6006CD1F500BFEC
      FA006ACFF20076C4D500FBCD9600FAC17E00FAC17E00FBCD96007BC4D50074D3
      F30085D9F70036BFF200E2F6FD000000000000000000F7E1D200F1C8AC00EDC0
      9F00EBBE9D00EBBC9A00E9BA9600E7B79300E6B59000E4B28C00E2AF8800E0AC
      8400DDA98000DCA57D00E2B69600000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDF2
      FB0055BEEA0044B5E700DDF1FA000000000000000000AAD6EE0044A0D70088C0
      E300EEF6FB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6A18C00C38E6800C08B6600BE88
      6400BB856100B9835F00B47E5C00B27C5A00B17B5800AE795700AE795700AD76
      5600AB755400A9735300A9715100C6A18C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AAE1F70011A8
      E70051C6F20044BEEF0088D0F000000000000000000033A1DA0060C6F2003CAA
      E2001183C800AAD1EA0000000000000000000000000000000000E2C0AA00CC8D
      6600BC6B3600BC6B3600BC6A3600BC6A3600BB6A3500BB6A3500BB693500BD6E
      3B00CA8B6300E3C2AE000000000000000000C8926C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A972510000000000A2CAEE0076B2E6003E91
      DB00348CD900348CD900348CD900348CD900348CD900348CD900348CD900348C
      D900348BD900398FDA0085B9E900000000000000000000000000AAE2F80033BB
      EF0082E0FE0077DAFC0011A4E300EEF8FD00BBE3F60024A6E2006AD7FF0067D0
      F9001992D400CCE5F30000000000000000000000000000000000C57C4D00F8F1
      EA00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FAF3EB00FAF2EA00F8F3ED00F8F3
      ED00F8F3ED00C37A4D000000000000000000C8926C00FFFFFF00FFBF6800FFFF
      FF00C7C7C700C6C6C600C3C3C300C1C1C100BFBFBF00BDBDBD00BDBDBD00BBBB
      BB00B9B9B900B9B9B900FFFFFF00A9725100000000004799DD00DEF1FA00A8DD
      F4009EDBF40096DAF3008ED8F30086D7F3007FD4F20079D3F20072D2F1006CD0
      F10069CFF100C2EAF8003F95DB000000000000000000000000000000000077D1
      F4003EC1F10085E2FF003ABBEE0099D8F30066C3EC004DC2F1006CD8FF0036AE
      E50088C7E8000000000000000000000000000000000000000000C6804600F7F0
      E600F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C1743C000000000000000000CA946E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AA735300000000003B97DB00EFFAFE00A1E9
      F90091E5F80081E1F70072DEF60063DAF50054D7F40047D3F30039D0F2002ECD
      F10026CBF000CAF2FB003B97DB00000000000000000000000000000000000000
      000044C0F00048C5F30072D8FA0022AEE80052C6F30073DBFF0041BBED0066BE
      E800000000000000000000000000000000000000000000000000C7844800F8F1
      E800F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C37A41000000000000000000CC976F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFB95E00FFFFFF00C1C1C100BEBEBE00BABABA00B7B7
      B700FFFFFF00FFFFFF00FFFFFF00AC755400000000003C9DDB00F2FAFD00B3ED
      FA00A4E9F90095E6F80085E2F70076DEF60065DBF50057D7F40049D4F3003BD1
      F20030CEF100CCF2FB003B9BDB00000000000000000000000000000000000000
      0000EEF9FE0011AFEB007DDEFD0063D5FC0067DAFF005ED0F90033B0E600EEF8
      FD00000000000000000000000000000000000000000000000000C7864B00F8F2
      EB00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C78045000000000000000000D19C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B07A5800000000003BA3DB00F6FCFE00C8F2
      FC00B9EFFB00ACECFA009CE8F9008BE3F7007CE0F6006CDCF6005DD9F5004FD6
      F40044D3F300D0F3FC003BA2DB000000000044CAF80000B5F40000B3F20033C1
      F30044C4F30044C2F2005DD2FA0061D9FF005BD7FF005CD0FA0033B2E80044B7
      E80022A7E2000095DB00008FD60044A8DD000000000000000000C8884D00F9F3
      EC00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C88448000000000000000000D49E7500FFFFFF00FFFFFF00FFFF
      FF00FFB95E00FFFFFF00C1C1C100BEBEBE00BABABA00B7B7B700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B27C5A00000000003BA8DB00FEFFFF00F8FD
      FF00F6FDFF00F5FCFF00F3FCFE00D8F6FC0094E6F80085E3F70076DFF60068DB
      F5005CD8F400D7F4FC003BA7DB000000000044CCFA007ADFFD00A4ECFF0081E0
      FD0075DBFB0072DAFB0079E0FF0061DAFF005CD8FF006BDBFF006FD5FA0065D0
      F80075D7FB0085DEFF005FCBF50044AEE1000000000000000000C88C4F00F9F4
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F3ED00C8864B000000000000000000D5A07600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FCFCFC00FFFFFF00B57E5C000000000039ADDB00E8F6FB0094D4
      EF0088CEEE0073C1E900C9E9F600F2FCFE00F3FCFE00F2FCFE00F0FCFE00EFFB
      FE00EEFBFE00FEFFFF003CAEDB000000000044CEFB0022C4F90000B8F60011BB
      F60044C8F60033C1F40067D9FC0064DBFF0060D9FF005FD3FB0033B7EC0044BC
      EC0022ADE700009DE1001AA8E50044B3E5000000000000000000C88C5000F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00FAF4EF00C8874C000000000000000000D8A27900FFFFFF00FFFFFF00FFFF
      FF00FFB95E00FFFFFF00C1C1C100BEBEBE00BABABA00B7B7B700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B7815E000000000040AEDC00F1FAFD0094DE
      F50093DCF40081D5F2006ACAED006CCBEA0085D3EF0080D2EF007AD0EF0076CF
      EE0072CFEE00E9F7FB003EB2DC0000000000CCF2FE00CCF2FE00000000000000
      0000EEFAFE0011B9F40083E2FE0070DEFE0071DDFF0066D5FB0033B9EE00EEF9
      FD000000000000000000CCECF900CCEBF9000000000000000000C88D5100F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3
      ED00F8F4F000C6864C000000000000000000D9A37900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FDFDFD00FDFDFD00FFFFFF00BA8560000000000041B4DC00F7FCFE008EE4
      F80091DEF5009FE0F500ACE1F600EFFBFE00F4FDFE00F3FCFE00F1FCFE00EFFB
      FE00EEFBFE00FAFDFF0058BCE000000000000000000000000000000000000000
      000044CCF9004DD0FA0089E5FE0011B7F30058D0F90081E1FF0046C7F50066CB
      F200000000000000000000000000000000000000000000000000C88D5100F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F7F2EC00FBF7
      F300F5EFE900C38048000000000000000000DBA47A00FFFFFF00FFBF6800FFFF
      FF00C7C7C700C6C6C600C3C3C300C1C1C100BFBFBF00BDBDBD00BDBDBD00BBBB
      BB00B9B9B900B9B9B900FFFFFF00BD876300000000003CB5DB00FDFEFE00FEFF
      FF00FEFEFF00FDFEFF00FEFFFF00EAF7FB006EC8E5006FC9E4006FC9E4006FC9
      E4007DCFE70084D0E800BAE5F2000000000000000000000000000000000088E0
      FD0044D0FB0091E8FF0057D3FA0066D3F80066D1F70056D0F9007EE0FF003AC2
      F40099DDF7000000000000000000000000000000000000000000C88D5200F9F5
      F100F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FCE6CD00FAE5
      C900E2B68400D5A884000000000000000000DCA77B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C08B66000000000059C2E00061C3E20063C4
      E30063C4E30063C4E30062C4E30056C0E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BBEEFE002DCC
      FC0087E5FE0091E9FF0015C0F800DDF5FE00BBEBFC0029C1F50080E1FF0072D9
      FC0011B2EE00CCEEFB0000000000000000000000000000000000CA925A00FAF6
      F200F8F3ED00F8F3ED00F8F3ED00F8F3ED00F8F3ED00FFFBF800F6D8B400E1B0
      7D00DC966900000000000000000000000000DDAD8600E8B99200E8B99200E8B9
      9200E8B99200E8B99200E8B99200E8B99200E8B99200E8B99200E8B99200E8B9
      9200E8B99200E8B99200E8B99200C19170000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099E7FF0022C9
      FD0067DCFE0079E0FE0044CDFB00000000000000000033C5F6007ADDFD0051CE
      F90011B4F000AAE3F90000000000000000000000000000000000D2A27400F8F3
      ED00F8F3ED00F8F3ED00F8F3ED00F8F2EC00F7F2EC00F2E6D700E2B27D00DC98
      6B0000000000000000000000000000000000DBC3B600DEB49200DCA77B00DCA6
      7A00DAA47A00D8A27900D5A07600D49E7500D29D7300CF9A7200CF9A7200CE99
      7000CB966F00C9946C00C79E8000DBC3B6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCF3
      FF0044D2FE0000BFFC00AAE9FE00000000000000000099E3FB0000B6F50044C8
      F600DDF5FD000000000000000000000000000000000000000000E8CEB900D7AA
      7C00CA905500CA905500CA915500CB905500C98F5500CF9D6900DDB190000000
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
      000000000000A39383009D775300A3703E00A2703F009D785500A39385000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFB49300D59D7400D196
      6800CE926300CB8E5E00C98A5B00C7875600C3845200C3845200C3845200C384
      5200C3845200C3845200D0A17D0000000000000000000000000000000000A392
      8200AB6D3100AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AB6E
      3300A496880000000000000000000000000087448000833F7E007F387D007C33
      7C00792E7B00C63A1300C6371200C4311200C02E1100C02A1000BF270F007C4F
      25007A4A210077461E0075421B00733F1900A2CAEE0076B2E6003E91DB00348C
      D900348CD900348CD900348CD900348CD900348CD900348CD900348CD900348B
      D900398FDA0085B9E900000000000000000000000000D7A17500F8F2ED00F7F0
      EA00F6EDE600F4EAE200F3E7DE00F1E4DB00F0E2D800F0E2D800F0E2D800F0E2
      D800F0E2D800F0E2D800C58B5E000000000000000000000000009C7F6200AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00EDDFD100D9BCA300AD6C2D00AD6C2D00AD6C
      2D00AD6C2D009D8369000000000000000000413DF300999BFE009698FE009395
      FE009193FE00C9431500E0935D00DF8F5900DF8D5500DE8A5100C02E1100A2C9
      9E009DC6990098C3950094C09100276D2C004799DD00DEF1FA00A8DDF4009EDB
      F40096DAF3008ED8F30086D7F3007FD4F20079D3F20072D2F1006CD0F10069CF
      F100C2EAF8003F95DB00000000000000000000000000D9A47A00F9F3EE00EBD2
      BE0000000000EBD3BF00000000000000000000000000EAC7AD00000000000000
      000000000000F0E2D800C68C5F000000000000000000A2918100AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6D2E00FFFFFF00EBDED500AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00A4968800000000004A47F5009EA0FE005B5EFE005659
      FE009597FE00CD4C1600E1976300DA804100D97D3B00DF8F5800C6351200A8CD
      A40077B0710070AB6A009AC496002E7633003B97DB00EFFAFE00A1E9F90091E5
      F80081E1F70072DEF60063DAF50054D7F40047D3F30039D0F2002ECDF10026CB
      F000CAF2FB003B97DB00000000000000000000000000DDA87E00F9F3EF00EBD0
      BA00EBD0BB00EBD0BB00EBD0BB00EBD0BB00EBD1BD00EACDB500EACDB500EACD
      B500EACDB500F0E2D800C68A5C000000000000000000AB6D3100AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00FFFFFF00EBDED500AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00A96C3200000000005351F600A2A4FE006266FE005D61
      FE00999BFE00CF551800E39C6C00DC864A00DB834400E0945E00C63C1300AFD1
      AB0080B77A0079B27300A0C89C0035803C003C9DDB00F2FAFD00B3EDFA00A4E9
      F90095E6F80085E2F70076DEF60065DBF50057D7F40049D4F3003BD1F20030CE
      F100CCF2FB003B9BDB00000000000000000000000000DFAA8200F9F3EF00EACE
      B70000000000EBD0BB00000000000000000000000000EACFBA00FBF6F2000000
      000000000000F0E2D800C88D5F0000000000A1907F00AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00FFFFFF00EBDED500AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00A39586005B5BF800A8AAFE006B6FFE006569
      FE009EA0FE00D1601A00E5A27400DE8C5300DD894D00E2996600C9451500B5D5
      B0008ABD830083B87D00A7CDA3003D8B44003BA3DB00F6FCFE00C8F2FC00B9EF
      FB00ACECFA009CE8F9008BE3F7007CE0F6006CDCF6005DD9F5004FD6F40044D3
      F300D0F3FC003BA2DB00000000000000000000000000E1AE8700FAF4F000EACB
      B200EACCB300EACCB300EACCB300EACCB300EACEB700E8C7AC00E8C7AC00E8C8
      B000E8C8AE00F0E2D800C4865400000000009E764F00AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00FFFFFF00EBDED500AD6D2E00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D009D7955006364FA00ACAFFE007276FE006D71
      FE00A2A4FE00D6691E00E7A77B00E0925C00DF8F5600E49E6E00CD4E1600BAD9
      B500B7D6B100B3D3AE00AED1A90045964D003BA8DB00FEFFFF00F8FDFF00F6FD
      FF00F5FCFF00F3FCFE00D8F6FC0094E6F80085E3F70076DFF60068DBF5005CD8
      F400D7F4FC003188B9004D7CA300416F960000000000E3B18C00FAF6F100EAC9
      AE0000000000EAC9B000000000000000000000000000E8C7AC00000000000000
      000000000000F1E5DB00C686550000000000A66F3A00AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00FFFFFF00EBDED500AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00A27140006A6CFC00B0B3FE00797EFE007579
      FE00A8AAFE00D8742A00E8AD8300E2986500E1956000E5A37600CF57180060BC
      6C005CB6670057B0610052A85C004DA1550039ADDB00E8F6FB0094D4EF0088CE
      EE0073C1E900C9E9F600F2FCFE00F3FCFE00F2FCFE00F0FCFE00EFFBFE00EEFB
      FE00B0C1D100578BB7008CB1D40046759F0000000000E5B48F00FAF6F200E9C6
      AA00E9C6AC00EAC7AC00E9C7AD00E9C9AE00E9C9B000E8C7AC00E9C9B000E8C8
      B000E8CCB500F2E7DE00C88A590000000000A56E3900AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00FFFFFF00EBDED500AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00A37040007073FD00B4B7FE008185FE007C81
      FE00ACAFFE00D97B3900EAB28A00E49F6E00E39C6A00E7A87D00D1621A000000
      00000000000000000000000000000000000040AEDC00F1FAFD0094DEF50093DC
      F40081D5F2006ACAED006CCBEA0087C8DD0098B2B400C7AC9400CDAF9600C8A8
      8D00AB998E0096B1CB005D8CB800B2C3D20000000000E7B79400FBF7F400E9C3
      A60000000000E8C4A900000000000000000000000000E8C7AC00000000000000
      000000000000F7F1EB00CB8F5F00000000009E754D00AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00FFFFFF00EBDED500AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D009D7752007478FE00B8BBFE00B6B9FE00B3B6
      FE00B0B3FE00DF844500ECB79200E6A57800E6A27300E9AD8500D66B1E000000
      00000000000000000000000000000000000041B4DC00F7FCFE008EE4F80091DE
      F5009FE0F500ACE1F600EFFBFE00C6B8AA00E2CDBC00F5E0CC00F7E0C700F8E2
      CB00F3D1B300A7998F00B4C5D5000000000000000000E9BA9800FBF7F400E9C3
      A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3
      A600E9C3A600FBF7F400CE93640000000000A08D7A00AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00A29281007478FE007478FE007276FE006E71
      FD006A6CFC00E18D5200EDBB9900E9AC8100E7A87C00EAB38D00D8742C000000
      0000000000000000000000000000000000003CB5DB00FDFEFE00FEFFFF00FEFE
      FF00FDFEFF00FEFFFF00EAF7FB00C9AC9400F3E3D400F4DAC100F3D8BD00F3D8
      BD00F8E3CC00C4A48B00000000000000000000000000EBBD9B00FBF7F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBF7F400D1976A000000000000000000AC6D2F00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AE6D2F00FAF7F500F0E7E000AD6C2D00AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AB6D3100000000000000000000000000000000000000
      000000000000E2925C00EEC1A000EAB18900E9AE8500EDB79400DB7C3A000000
      00000000000000000000000000000000000059C2E00061C3E20063C4E30063C4
      E30063C4E30062C4E30056C0E000C8A98D00F8EADC00F4DDC600F4DCC400F3D8
      BD00F8E2CD00CCAD9300000000000000000000000000ECBF9E00FBF7F4009CD5
      A50098D3A10094D09D0090CE98008BCB930087C98E0082C689007EC384007AC1
      800076BE7C00FBF7F400D49B6F0000000000000000009F8B7800AD6C2D00AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00F0E7E000EBDED500AD6C2D00AD6C2E00AD6C
      2D00AD6C2D00AD6C2D00A2908000000000000000000000000000000000000000
      000000000000E69B6700F0C5A600ECB69100EBB38C00EEBC9B00DF8547000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAE9500F2E3D500F6E0CA00F5DEC600F5DE
      C500F7E5D200C5AA9400000000000000000000000000EFC6A800FBF7F400FBF7
      F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
      F400FBF7F400FBF7F400D8A378000000000000000000000000009C7B5900AD6C
      2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C
      2D00AD6C2D009B7D5F0000000000000000000000000000000000000000000000
      000000000000E8A07000F2C8AC00F0C6A800F0C5A600EFC2A200E18E53000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C2B6A800DDC3AB00F4E6DA00F8ECDF00F2DD
      C900E3C9B200C4B4A600000000000000000000000000F7E1D200F1C8AC00EDC0
      9F00EBBE9D00EBBC9A00E9BA9600E7B79300E6B59000E4B28C00E2AF8800E0AC
      8400DDA98000DCA57D00E2B69600000000000000000000000000000000009F8A
      7500AC6C2F00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AD6C2D00AC6D
      2F009F8C79000000000000000000000000000000000000000000000000000000
      000000000000EAA67700E8A47400E8A06E00E69D6B00E4996500E2955E000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2B7A800BFAE9700C9AB8F00CDAF
      9500BEAB98000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009F8A7500A1734700A96D3300A86D34009F7348009F8B78000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00C000FFFFFFFF0000C000F81FFFFF0000
      C000F00FFFE30000C000E007FFC300000000C003FF8300000000C003E0070000
      00008001C00F000000008001801F000000008001801F000000008001801F0000
      0000C003801F00000003C003801F00000003E007801F00000003F00FC03F0000
      0003F81FE07F0000FFFFFFFFFFFF0000FFFFFFFFFFFFFC00FFFFF00FFFFFFC00
      C00380018001FC00C00380018001FC00C003800180010000C003800180010000
      C003C00380010000C003E00780010000C003F00F80010000C003F00F80010000
      C003F00F80010000C003F00F80010001C003F00F80FF003FC003F00FFFFF003F
      FFFFF81FFFFF403FFFFFFFFFFFFF007FF80087E1FFFFFFFFF80080018001FE3F
      E000C0038001FC1FE000C0038001F80F800080018001E203800080018001E207
      800080018001C603800080018001840080008001800104008000800180018E00
      800080018001C001800300008001ED5F800300008001ED47800F00018001ED57
      800F80018001C447FFFFC7E3FFFFFFFFFFFFFFFFE187FFFF0000FFFFC183C003
      00008001C003C00300008001E007C00300008001F00FC00300008001F00FC003
      000080010000C003000080010000C003000080010000C00300008001300CC003
      00008001F00FC00300008001E007C003000080FFC003C0070000FFFFC183C00F
      0000FFFFE187C01FFFFFFFFFFFFFFFFFFFFFF81FFFFFFFFF8001E00700000003
      8001C003000000038BB980010000000380018001000000038B99000000000003
      80010000000000008BB900000000000080010000001F00008BB90000001F0001
      80010000001F00039FF98001F81F000380018001F81FFE038001C003F81FFE03
      8001E007F81FFF07FFFFF81FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object puFHSelectDate: TPopupMenu
    Left = 1249
    Top = 132
  end
  object ilToggle: TImageList
    Height = 9
    Width = 9
    Left = 1099
    Top = 1
    Bitmap = {
      494C0101020004003C0A09000900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000240000000900000001002000000000001005
      00000000000000000000000000000000000000000000C4C4C400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A6A6A600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A6A6A6009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A6A6A600A6A6A6008E8E8E0000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A6A6A600A6A6
      A600A6A6A6008080800000000000000000000000000000000000000000000000
      00008E8E8E00A6A6A6008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A6A6A600A6A6A6008E8E8E0000000000000000000000
      000000000000000000000000000099999900A6A6A600A6A6A600A6A6A6009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A6A6A6009999
      9900000000000000000000000000000000000000000000000000A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A6A6A600000000000000000000000000000000000000
      000000000000C4C4C400A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500C4C4C40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4C4C400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E00000028000000240000000900000001000100
      00000000480000000000000000000000000000000000000000000000FFFFFF00
      BFFFC000000000009FFFC000000000008FFFC0000000000087FBC00000000000
      83F1C0000000000087E0C000000000008FC04000000000009F80000000000000
      BFFFC0000000000000000000000000000000000000000000000000000000}
  end
  object puFHQuickSearch: TPopupMenu
    Left = 929
    Top = 24
  end
end
