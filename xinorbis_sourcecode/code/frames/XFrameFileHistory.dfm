object FrameFolderHistory: TFrameFolderHistory
  Left = 0
  Top = 0
  Width = 1311
  Height = 725
  TabOrder = 0
  object pMainFileHistory: TPanel
    Left = 0
    Top = 0
    Width = 1311
    Height = 725
    Align = alClient
    Color = clWhite
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    OnResize = pMainFileHistoryResize
    object Panel46: TPanel
      Left = 1
      Top = 1
      Width = 1309
      Height = 54
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lFHAvailablePath: TLabel
        Left = 112
        Top = 6
        Width = 4
        Height = 13
        Caption = '.'
      end
      object sbFHFolderInfo: TSpeedButton
        Left = 476
        Top = 25
        Width = 23
        Height = 22
        Hint = 'show information for the selected Folder History entry'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8E3CBAB9BA16A5190
          583E8E573E9A6952C5A99CEEE7E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE0C8BDA36648B28057D5B793DBC3A6DAC3A6D2B490AB7A52926048D8C6
          BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2CCBDA35C3CCBA77DD8BB9FC39C77B6
          8A62B48660BE9672D1B397C5A37789573ED9C6BDFFFFFFFFFFFFFFFFFFF4ECE4
          B4784ACFAA81DABCA2BE9166BA8C62B7895FB3845EB1835DB0835CCDAA8DC6A5
          79956249EFE8E4FFFFFFFFFFFFDCBC9BBF915EE0C2A8C5966CC29169E1CBB8FE
          FDFCFFFFFEEADCD0B4855EB3855ED4B599AE7B56C8A99BFFFFFFFFFFFFC59052
          DBBC9CD5AD89C7986CC39569C19367EDDFD3FAF7F4BB8B63B98A63B88A62C59D
          78D2B893A06A52FFFFFFFFFFFFC1833CE3C7AFD0A276C5996BC4976AC49669EE
          E0D4FBF7F4BF9066BE8F65BE8F64BE9269DFC6AA96563BFFFFFFFFFFFFC78942
          E4C9B0D0A37ACC9D71C79A6CC5986BFFFFFFFFFFFEC39669C19468C29468C398
          6DDFC5AB99593BFFFFFFFFFFFFD29E5CE0BC9FDBB393CFA075CD9E72CB9C71DD
          BFA3DDBFA2C5996BC5996BC4986BD1AB85D8BA97AC6E52FFFFFFFFFFFFE7C9A4
          CD9C68E7CBB4D4A57AD0A077CF9E74FBF8F5FBF8F5CB9E71CB9D71CDA177DFC0
          A5B98A5BD2AE9BFFFFFFFFFFFFF9F1E7D39A5AD9B28CE6CAB3D6A97DD1A579E2
          C4A8E1C3A8D0A276D1A477DDBDA2D0AC85B4764AF4EAE4FFFFFFFFFFFFFFFFFF
          F1DDC5D1924FD9B28CE6CDB8E0BA9DD7AB85D6A982D9B391E1C2ABD4AE86B471
          3EE6D0BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2DDC6D69C5BD0A06AE0BFA0E3
          C5AEE3C5AEDFBC9FC89762C38A49E9D5BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFAF1E7EACCA8D8A165CF914ECD904AD19B5BE4C6A1F7EFE4FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = sbFHFolderInfoClick
      end
      object lFHAvailableComputer: TLabel
        Left = 504
        Top = 6
        Width = 4
        Height = 13
        Caption = '.'
      end
      object sbFHOpenFolder: TAeroButton
        Left = 6
        Top = 8
        Width = 97
        Height = 37
        Hint = 'open the selected Folder History entry'
        ImageIndex = 34
        Version = '1.0.0.1'
        TabOrder = 0
        OnClick = sbFHOpenFolderClick
      end
      object cbFHAvailablePath: TComboBox
        Left = 112
        Top = 24
        Width = 361
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnChange = cbFHAvailablePathChange
      end
      object cbFHAvailableComputer: TComboBox
        Left = 504
        Top = 24
        Width = 209
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnChange = cbFHAvailableComputerChange
      end
    end
    object pcFileHistory: TAdvSmoothTabPager
      Left = 1
      Top = 55
      Width = 1309
      Height = 669
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
      ActivePage = tsFHInformation
      TabPosition = tpTopLeft
      TabTextOrientation = toHorizontal
      TabSettings.RightMargin = 0
      TabSettings.StartMargin = 4
      TabSettings.Spacing = 5
      TabReorder = False
      Visible = False
      OnChange = pcFileHistoryChange
      TabOrder = 1
      object tsFHInformation: TAdvSmoothTabPage
        Left = 1
        Top = 26
        Width = 1307
        Height = 641
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
        TabAppearance.Appearance.PictureAlignment = taLeftJustify
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clWindowText
        TabAppearance.Appearance.Font.Height = -11
        TabAppearance.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Appearance.Font.Style = []
        TabAppearance.Appearance.Spacing = 1
        TabAppearance.Appearance.ImageList = ilTabs
        TabAppearance.Appearance.ImageIndex = 5
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
        object Panel33: TPanel
          Left = 2
          Top = 2
          Width = 1303
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          UseDockManager = False
          FullRepaint = False
          TabOrder = 0
          object sbFHBuildInformationTabs: TSpeedButton
            Left = 206
            Top = 1
            Width = 101
            Height = 22
            Hint = 'build the displays below from the date selected'
            Enabled = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFB493
              D59D74D19668CE9263CB8E5EC98A5BC78756C38452C38452C38452C38452C384
              52C38452D0A17DFFFFFFFFFFFFB1B1B19A9A9A9292928E8E8E8A8A8A87878783
              83838080808080808080808080808080808080809F9F9FFFFFFFFFFFFFD7A175
              F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
              D8F0E2D8C58B5EFFFFFFFFFFFF9D9D9DF2F2F2EFEFEFECECECE9E9E9E6E6E6E3
              E3E3E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1878787FFFFFFFFFFFFD9A47A
              F9F3EEEBD2BEFFFFFFEBD3BFFFFFFFFFFFFFFFFFFFEAC7ADFFFFFFFFFFFFFFFF
              FFF0E2D8C68C5FFFFFFFFFFFFFA0A0A0F3F3F3D0D0D0FFFFFFD1D1D1FFFFFFFF
              FFFFFFFFFFC4C4C4FFFFFFFFFFFFFFFFFFE1E1E1888888FFFFFFFFFFFFDDA87E
              F9F3EFEBD0BAEBD0BBEBD0BBEBD0BBEBD0BBEBD1BDEACDB5EACDB5EACDB5EACD
              B5F0E2D8C68A5CFFFFFFFFFFFFA4A4A4F3F3F3CDCDCDCECECECECECECECECECE
              CECECFCFCFCACACACACACACACACACACACAE1E1E1868686FFFFFFFFFFFFDFAA82
              F9F3EFEACEB7FFFFFFEBD0BBFFFFFFFFFFFFFFFFFFEACFBAFBF6F2FFFFFFFFFF
              FFF0E2D8C88D5FFFFFFFFFFFFFA7A7A7F3F3F3CBCBCBFFFFFFCECECEFFFFFFFF
              FFFFFFFFFFCDCDCDF6F6F6FFFFFFFFFFFFE1E1E1898989FFFFFFFFFFFFE1AE87
              FAF4F0EACBB2EACCB3EACCB3EACCB3EACCB3EACEB7E8C7ACE8C7ACE8C8B0E8C8
              AEF0E2D8C48654FFFFFFFFFFFFAAAAAAF4F4F4C8C8C8C9C9C9C9C9C9C9C9C9C9
              C9C9CBCBCBC4C4C4C4C4C4C6C6C6C5C5C5E1E1E1828282FFFFFFFFFFFFE3B18C
              FAF6F1EAC9AEFFFFFFEAC9B0FFFFFFFFFFFFFFFFFFE8C7ACFFFFFFFFFFFFFFFF
              FFF1E5DBC68655FFFFFFFFFFFFADADADF5F5F5C6C6C6FFFFFFC6C6C6FFFFFFFF
              FFFFFFFFFFC4C4C4FFFFFFFFFFFFFFFFFFE4E4E4828282FFFFFFFFFFFFE5B48F
              FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0E8C7ACE9C9B0E8C8B0E8CC
              B5F2E7DEC88A59FFFFFFFFFFFFB0B0B0F6F6F6C3C3C3C3C3C3C4C4C4C4C4C4C6
              C6C6C6C6C6C4C4C4C6C6C6C6C6C6C9C9C9E6E6E6868686FFFFFFFFFFFFE7B794
              FBF7F4E9C3A6FFFFFFE8C4A9FFFFFFFFFFFFFFFFFFE8C7ACFFFFFFFFFFFFFFFF
              FFF7F1EBCB8F5FFFFFFFFFFFFFB3B3B3F7F7F7C0C0C0FFFFFFC1C1C1FFFFFFFF
              FFFFFFFFFFC4C4C4FFFFFFFFFFFFFFFFFFF0F0F08B8B8BFFFFFFFFFFFFE9BA98
              FBF7F4E9C3A6E9C3A6E9C3A6E9C3A6E9C3A6E9C3A6E9C3A6E9C3A6E9C3A6E9C3
              A6FBF7F4CE9364FFFFFFFFFFFFB7B7B7F7F7F7C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0F7F7F78F8F8FFFFFFFFFFFFFEBBD9B
              FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFBF7F4D1976AFFFFFFFFFFFFBABABAF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7939393FFFFFFFFFFFFECBF9E
              FBF7F49CD5A598D3A194D09D90CE988BCB9387C98E82C6897EC3847AC18076BE
              7CFBF7F4D49B6FFFFFFFFFFFFFBCBCBCF7F7F7C9C9C9C6C6C6C3C3C3C1C1C1BD
              BDBDBBBBBBB7B7B7B4B4B4B1B1B1AEAEAEF7F7F7979797FFFFFFFFFFFFEFC6A8
              FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7
              F4FBF7F4D8A378FFFFFFFFFFFFC3C3C3F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
              F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F79F9F9FFFFFFFFFFFFFF7E1D2
              F1C8ACEDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
              80DCA57DE2B696FFFFFFFFFFFFDFDFDFC5C5C5BDBDBDBBBBBBB9B9B9B6B6B6B3
              B3B3B1B1B1AEAEAEABABABA9A9A9A5A5A5A1A1A1B3B3B3FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
            OnClick = sbFHBuildInformationTabsClick
          end
          object SpeedButton19: TSpeedButton
            Left = 0
            Top = 1
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
            OnClick = SpeedButton19Click
          end
          object Image38: TImage
            Left = 183
            Top = 5
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000C21E0000C21E0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF752829FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF361F1451221DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF361F1454271F5C2420FFFFFFFF
              FFFFFFFFFF77352E72342C6C3229662F275F2D24572B2150291F49261C412419
              4D261D6D2D2754271F5C2420672625FFFFFFFFFFFF7C372FC53C47C03C45BB3B
              44B63A42B13A40AB393EA6383CA0373A9B373796363691353455271F67262567
              2625FFFFFF803831CB3D49C73C48C23C46BD3B44B93B43B53A41AF393FA9393C
              A4383A9F37399A36375B2922662624662624FFFFFF8038318038317C372F7735
              2E72342C6C3229662F275F2D24572B2150291F6F2E29692C27692825662624FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF572921692C27692825FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5729216B2B27FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF943235FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
          end
          object llFHPleaseWait: TLabel
            Left = 320
            Top = 5
            Width = 5
            Height = 13
            Caption = '.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object bFHISelect: TBitBtn
            Left = 28
            Top = 1
            Width = 149
            Height = 22
            TabOrder = 0
            OnClick = bFHISelectClick
          end
        end
        object pcFHInformation: TAdvSmoothTabPager
          Left = 2
          Top = 28
          Width = 1303
          Height = 611
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
          ActivePage = tsFHInfoTable
          TabPosition = tpTopLeft
          TabSettings.StartMargin = 4
          TabReorder = False
          Visible = False
          OnChange = pcFHInformationChange
          TabOrder = 1
          object tsFHInfoTable: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            object splitFHTable: TAdvSplitter
              Left = 320
              Top = 26
              Height = 555
              OnCanResize = splitFHTableCanResize
              OnMoved = splitFHTableMoved
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
            object Panel34: TPanel
              Left = 2
              Top = 2
              Width = 1297
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              BiDiMode = bdLeftToRight
              Color = clWhite
              FullRepaint = False
              ParentBiDiMode = False
              ParentBackground = False
              TabOrder = 0
              object sbFHMainPie: TSpeedButton
                Tag = 7
                Left = 0
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 1
                Down = True
                Flat = True
                OnClick = sbFHMainPieClick
              end
              object sbFHMainBar: TSpeedButton
                Tag = 7
                Left = 24
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 1
                Flat = True
                OnClick = sbFHMainBarClick
              end
              object cbFHGraphSize: TAdvOfficeRadioButton
                Left = 71
                Top = 3
                Width = 77
                Height = 20
                Hint = 'graph by size of files'
                TabOrder = 0
                TabStop = True
                OnClick = cbFHGraphSizeClick
                Alignment = taLeftJustify
                Caption = '.'
                Checked = True
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
              object cbFHGraphQuantity: TAdvOfficeRadioButton
                Left = 156
                Top = 3
                Width = 77
                Height = 20
                Hint = 'graph by number of files'
                TabOrder = 1
                OnClick = cbFHGraphSizeClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
            end
            object sgFHMainReport: TAdvStringGrid
              Tag = 1
              Left = 2
              Top = 26
              Width = 318
              Height = 555
              Cursor = crDefault
              Hint = 'double click to see all files belonging to the category'
              Align = alLeft
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
              PopupMenu = puTable
              ScrollBars = ssBoth
              TabOrder = 1
              OnDblClick = sgFHMainReportDblClick
              OnDrawCell = sgFHMainReportDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnCanSort = sgFHMainReportCanSort
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
                64)
              RowHeights = (
                17
                17
                17
                17
                17)
            end
            object vtcFHMain: TChart
              Tag = 2
              Left = 323
              Top = 26
              Width = 976
              Height = 555
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
              Frame.Visible = False
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Inverted = True
              RightAxis.Automatic = False
              RightAxis.AutomaticMaximum = False
              RightAxis.AutomaticMinimum = False
              View3DOptions.Elevation = 315
              View3DOptions.Orthogonal = False
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              View3DWalls = False
              Zoom.Allow = False
              Align = alClient
              BevelOuter = bvLowered
              PopupMenu = puCharts
              TabOrder = 2
              OnMouseMove = vtcFHMainMouseMove
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
                Gradient.EndColor = 919731
                Gradient.StartColor = 919731
                Gradient.Visible = True
                OtherSlice.Legend.Visible = False
                OtherSlice.Text = 'Other'
                PiePen.Visible = False
              end
            end
          end
          object tsFHInfoTree: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            object splitterFHFileTypes: TAdvSplitter
              Left = 435
              Top = 26
              Height = 555
              OnCanResize = splitterFHFileTypesCanResize
              OnMoved = splitterFHFileTypesMoved
              Appearance.BorderColor = clNone
              Appearance.BorderColorHot = clNone
              Appearance.Color = clWhite
              Appearance.ColorTo = clSilver
              Appearance.ColorHot = clWhite
              Appearance.ColorHotTo = clGray
              GripStyle = sgDots
              ExplicitLeft = 480
              ExplicitTop = 328
              ExplicitHeight = 100
            end
            object Panel36: TPanel
              Left = 2
              Top = 2
              Width = 1297
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              object sbFHFileTypesPie: TSpeedButton
                Tag = 13
                Left = 0
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 1
                Down = True
                Flat = True
                OnClick = sbFHMainPieClick
              end
              object sbFHFileTypesBar: TSpeedButton
                Tag = 13
                Left = 24
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 1
                Flat = True
                OnClick = sbFHMainBarClick
              end
              object cbFHTreeSize: TAdvOfficeRadioButton
                Left = 71
                Top = 3
                Width = 77
                Height = 20
                Hint = 'graph by size of files'
                TabOrder = 0
                TabStop = True
                OnClick = cbFHTreeSizeClick
                Alignment = taLeftJustify
                Caption = '.'
                Checked = True
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
              object cbFHTreeQuantity: TAdvOfficeRadioButton
                Left = 156
                Top = 3
                Width = 77
                Height = 20
                Hint = 'graph by number of files'
                TabOrder = 1
                OnClick = cbFHTreeSizeClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
            end
            object splitFHTree: TPanel
              Left = 2
              Top = 26
              Width = 433
              Height = 555
              Align = alLeft
              TabOrder = 1
              object sgFHFileTypes: TAdvStringGrid
                Left = 1
                Top = 392
                Width = 431
                Height = 162
                Cursor = crDefault
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
                OnDrawCell = sgFHFileTypesDrawCell
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
                ExplicitTop = 384
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
              object tvFHFileTypes: THTMLTreeview
                Tag = 1
                Left = 1
                Top = 1
                Width = 431
                Height = 391
                Hint = 'double click any extension to see a list of files'
                ItemHeight = 16
                SelectionNFColor = clSilver
                SelectionNFFontColor = clBlack
                Align = alClient
                Indent = 19
                PopupMenu = puType
                TabOrder = 1
                OnClick = tvFHFileTypesClick
                OnDblClick = tvFHFileTypesDblClick
                Version = '1.4.1.3'
              end
            end
            object vtcFHTree: TChart
              Tag = 2
              Left = 438
              Top = 26
              Width = 861
              Height = 555
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
              TabOrder = 2
              DefaultCanvas = 'TGDIPlusCanvas'
              PrintMargins = (
                15
                13
                15
                13)
              ColorPaletteIndex = 13
              object PieSeries4: TPieSeries
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
          object tsFHExtensions: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            object Panel50: TPanel
              Left = 2
              Top = 2
              Width = 1297
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object cbFHExtensionsAll: TAdvOfficeCheckBox
                Left = 2
                Top = 3
                Width = 113
                Height = 20
                Checked = True
                TabOrder = 0
                OnClick = cbFHExtensionsAllClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                State = cbChecked
                Version = '1.4.1.1'
              end
              object cbFHExtensionsCustom: TAdvOfficeCheckBox
                Left = 126
                Top = 3
                Width = 113
                Height = 20
                Checked = True
                TabOrder = 1
                OnClick = cbFHExtensionsAllClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                State = cbChecked
                Version = '1.4.1.1'
              end
              object cbFHExtensionsOther: TAdvOfficeCheckBox
                Left = 247
                Top = 3
                Width = 113
                Height = 20
                Checked = True
                TabOrder = 2
                OnClick = cbFHExtensionsAllClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                State = cbChecked
                Version = '1.4.1.1'
              end
              object cbFHExtensionColourCode: TAdvOfficeCheckBox
                Left = 366
                Top = 3
                Width = 113
                Height = 20
                TabOrder = 3
                OnClick = cbFHExtensionColourCodeClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
            end
            object Panel47: TPanel
              Left = 2
              Top = 552
              Width = 1297
              Height = 29
              Align = alBottom
              TabOrder = 1
              DesignSize = (
                1297
                29)
              object cbFHOtherSuggestions: TComboBox
                Left = 0
                Top = 4
                Width = 1294
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
            end
            object sgFHExtension: TAdvStringGrid
              Tag = 1
              Left = 2
              Top = 26
              Width = 1297
              Height = 526
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
              TabOrder = 2
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnClickCell = sgFHExtensionClickCell
              OnDblClickCell = sgFHExtensionDblClickCell
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
              ShowDesignHelper = False
              SortSettings.AutoSortForGrouping = False
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              SortSettings.Show = True
              SortSettings.HeaderColor = 16579058
              SortSettings.HeaderColorTo = 16579058
              SortSettings.HeaderMirrorColor = 16380385
              SortSettings.HeaderMirrorColorTo = 16182488
              Version = '8.2.2.0'
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
          end
          object tsFHInfoFolders: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            object splitFHDirList: TAdvSplitter
              Left = 322
              Top = 26
              Height = 555
              OnCanResize = splitFHDirListCanResize
              OnMoved = splitFHDirListMoved
              Appearance.BorderColor = clNone
              Appearance.BorderColorHot = clNone
              Appearance.Color = clWhite
              Appearance.ColorTo = clSilver
              Appearance.ColorHot = clWhite
              Appearance.ColorHotTo = clGray
              GripStyle = sgDots
              ExplicitLeft = 360
              ExplicitTop = 328
              ExplicitHeight = 100
            end
            object Panel37: TPanel
              Left = 2
              Top = 2
              Width = 1297
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              object sbFHDirListPie: TSpeedButton
                Tag = 14
                Left = 0
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 1
                Flat = True
                OnClick = sbFHMainPieClick
              end
              object sbFHDirListBar: TSpeedButton
                Tag = 14
                Left = 24
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 1
                Down = True
                Flat = True
                OnClick = sbFHMainBarClick
              end
              object sbFHFolderConfig: TSpeedButton
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
                OnClick = sbFHFolderConfigClick
              end
              object cbFHGraphSizeDirList: TAdvOfficeRadioButton
                Left = 93
                Top = 3
                Width = 70
                Height = 20
                Hint = 'graph by size of files'
                TabOrder = 0
                TabStop = True
                OnClick = cbFHGraphSizeDirListClick
                Alignment = taLeftJustify
                Caption = '.'
                Checked = True
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
              object cbFHGraphQuantityDirList: TAdvOfficeRadioButton
                Left = 171
                Top = 3
                Width = 70
                Height = 20
                Hint = 'graph by number of files'
                TabOrder = 1
                OnClick = cbFHGraphSizeDirListClick
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
            end
            object sgFHDirList: TAdvStringGrid
              Tag = 1
              Left = 2
              Top = 26
              Width = 320
              Height = 555
              Cursor = crDefault
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
              OnDrawCell = sgFHDirListDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnCanSort = sgFHDirListCanSort
              OnDblClickCell = sgFHDirListDblClickCell
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
                64)
              RowHeights = (
                17
                17)
            end
            object vtcFHDirList: TChart
              Left = 325
              Top = 26
              Width = 974
              Height = 555
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
              OnMouseDown = vtcFHDirListMouseDown
              OnMouseMove = vtcFHDirListMouseMove
              DefaultCanvas = 'TGDIPlusCanvas'
              ColorPaletteIndex = 13
              object HorizBarSeries2: THorizBarSeries
                BarBrush.Gradient.Direction = gdLeftRight
                BarPen.Visible = False
                ColorEachPoint = True
                Marks.Style = smsPercentTotal
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
          object tsFHInfoMagnitude: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            object splitFHMagnitude: TAdvSplitter
              Left = 347
              Top = 26
              Height = 555
              OnCanResize = splitFHMagnitudeCanResize
              OnMoved = splitFHMagnitudeMoved
              Appearance.BorderColor = clNone
              Appearance.BorderColorHot = clNone
              Appearance.Color = clWhite
              Appearance.ColorTo = clSilver
              Appearance.ColorHot = clWhite
              Appearance.ColorHotTo = clGray
              GripStyle = sgDots
              ExplicitLeft = 400
              ExplicitTop = 344
              ExplicitHeight = 100
            end
            object Panel41: TPanel
              Left = 2
              Top = 2
              Width = 1297
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              object sbFHMagnitudePie: TSpeedButton
                Tag = 17
                Left = 0
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 1
                Flat = True
                OnClick = sbFHMainPieClick
              end
              object sbFHMagnitudeBar: TSpeedButton
                Tag = 17
                Left = 24
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 1
                Down = True
                Flat = True
                OnClick = sbFHMainBarClick
              end
              object cbFHGraphSizeMagnitude: TAdvOfficeRadioButton
                Left = 93
                Top = 3
                Width = 70
                Height = 20
                Hint = 'graph by size of files'
                TabOrder = 0
                TabStop = True
                Alignment = taLeftJustify
                Caption = '.'
                Checked = True
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
              object cbFHGraphQtyMagnitude: TAdvOfficeRadioButton
                Left = 171
                Top = 3
                Width = 70
                Height = 20
                Hint = 'graph by number of files'
                TabOrder = 1
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
            end
            object sgFHMagnitude: TAdvStringGrid
              Tag = 1
              Left = 2
              Top = 26
              Width = 345
              Height = 555
              Cursor = crDefault
              Hint = 'double click to see all files with selected size range'
              Align = alLeft
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
              PopupMenu = puMagnitude
              ScrollBars = ssBoth
              TabOrder = 1
              OnDblClick = sgFHMagnitudeDblClick
              OnDrawCell = sgFHMagnitudeDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnCanSort = sgFHMagnitudeCanSort
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
                64)
              RowHeights = (
                17
                17
                17
                17
                17)
            end
            object vtcFHMagnitude: TChart
              Left = 350
              Top = 26
              Width = 949
              Height = 555
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
              OnMouseMove = vtcFHMagnitudeMouseMove
              DefaultCanvas = 'TGDIPlusCanvas'
              ColorPaletteIndex = 13
              object HorizBarSeries4: THorizBarSeries
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
          object tsFHInfoFileDates: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            object splitterFHFileDetails: TAdvSplitter
              Left = 345
              Top = 26
              Height = 555
              OnCanResize = splitterFHFileDetailsCanResize
              Appearance.BorderColor = clNone
              Appearance.BorderColorHot = clNone
              Appearance.Color = clWhite
              Appearance.ColorTo = clSilver
              Appearance.ColorHot = clWhite
              Appearance.ColorHotTo = clGray
              GripStyle = sgDots
              ExplicitLeft = 384
              ExplicitTop = 288
              ExplicitHeight = 100
            end
            object Panel40: TPanel
              Left = 2
              Top = 2
              Width = 1297
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              object sbFHCollapseNodes: TSpeedButton
                Tag = 2
                Left = 294
                Top = 1
                Width = 97
                Height = 22
                Caption = '.'
                Flat = True
              end
              object sbFHFileDatesPie: TSpeedButton
                Tag = 16
                Left = 0
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 99
                Flat = True
                OnClick = sbFHMainPieClick
              end
              object sbFHFileDatesBar: TSpeedButton
                Tag = 16
                Left = 24
                Top = 1
                Width = 24
                Height = 22
                GroupIndex = 99
                Down = True
                Flat = True
                OnClick = sbFHMainBarClick
              end
              object cbFHFileDates: TComboBox
                Left = 56
                Top = 1
                Width = 113
                Height = 21
                Style = csDropDownList
                TabOrder = 0
                OnChange = cbFHFileDatesChange
              end
              object cbFHFileDatesUsers: TComboBox
                Left = 175
                Top = 1
                Width = 113
                Height = 21
                Style = csDropDownList
                TabOrder = 1
                OnChange = cbFHFileDatesChange
              end
            end
            object tvFHFileDates: THTMLTreeview
              Tag = 1
              Left = 2
              Top = 26
              Width = 343
              Height = 555
              ItemHeight = 16
              SelectionNFColor = clSilver
              SelectionNFFontColor = clBlack
              Align = alLeft
              Indent = 19
              PopupMenu = puTreeDate
              TabOrder = 1
              OnDblClick = tvFHFileDatesDblClick
              Version = '1.4.1.3'
            end
            object vtcFHFileDates: TChart
              Left = 348
              Top = 26
              Width = 951
              Height = 555
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
              DefaultCanvas = 'TGDIPlusCanvas'
              ColorPaletteIndex = 13
              object HorizBarSeries3: THorizBarSeries
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
          object tsFHInfoHistory: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            object Panel44: TPanel
              Left = 2
              Top = 2
              Width = 143
              Height = 579
              Align = alLeft
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 0
              object bFHHistoryRefresh: TSpeedButton
                Tag = 1
                Left = 6
                Top = 344
                Width = 131
                Height = 22
                Flat = True
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFDFEFD9FC2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEBABABAFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF8BBC905E9D63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1B18F8F8FFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF9BCBA066B06E61AA683D8B4437833E327B373D7F436496689EBC
                  A0E6EDE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0A1A1A19B9B9B7C
                  7C7C7575756D6D6D7272728B8B8BB5B5B5ECECECFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFAAD8AF73BD7C96D19F94CF9C8FCD968ACA9185C78B7ABE8165AD6C4B92
                  5168976BCDDCCEFFFFFFFFFFFFFFFFFFFFFFFFCDCDCDAEAEAEC4C4C4C2C2C2BF
                  BFBFBCBCBCB8B8B8AFAFAF9E9E9E8383838C8C8CD9D9D9FFFFFFFFFFFFFFFFFF
                  FFFFFFA9DBAF79C4839ED7A79BD4A497D29F92CF9A8DCC9588CA907AC2827EC4
                  855DA46369996CE6EDE6FFFFFFFFFFFFFFFFFFD0D0D0B4B4B4CBCBCBC8C8C8C5
                  C5C5C2C2C2BEBEBEBCBCBCB2B2B2B5B5B59595958E8E8EECECECFFFFFFFFFFFF
                  FFFFFFFFFFFFA4DAAB7BC78577C28154AB5E4EA357499B5163AC6B83C38B87C9
                  8F82C689509756A0BFA2FFFFFFFFFFFFFFFFFFFFFFFFCECECEB7B7B7B2B2B29A
                  9A9A9292928B8B8B9D9D9DB5B5B5BBBBBBB7B7B7888888B8B8B8FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF9ED8A57BC784FFFFFFFFFFFFFFFFFF9BC9A05BA26286C6
                  8E88C98F6FB376699D6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCBB7B7B7FF
                  FFFFFFFFFFFFFFFFBEBEBE939393B8B8B8BBBBBBA5A5A5929292B8D7BBB6D4B9
                  B4D1B6B2CEB4AFCBB1FDFEFDB4E2BAFFFFFFFFFFFFFFFFFFFFFFFFA4CFA854A0
                  5B48954F408B47478B4ED0D0D0CDCDCDCACACAC7C7C7C4C4C4FEFEFED8D8D8FF
                  FFFFFFFFFFFFFFFFFFFFFFC5C5C59090908686867C7C7C7D7D7D5DA9644C9C54
                  48954F49904F97BE9BFFFFFFFFFFFFFFFFFFFFFFFF92B294FCFDFCBEDFC2BCDC
                  BFBAD9BDB7D6BBB5D3B89999998C8C8C868686818181B5B5B5FFFFFFFFFFFFFF
                  FFFFFFFFFFAAAAAAFDFDFDD8D8D8D5D5D5D2D2D2CFCFCFCCCCCC84C38B80C389
                  8DCC9583C48A54995A90BA94FFFFFFFFFFFFFFFFFF4A814D739C76FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFB5B5B5B4B4B4BEBEBEB6B6B68B8B8BB0B0B0FFFFFFFF
                  FFFFFFFFFF757575929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7DEBB75BF7E
                  98D2A194CF9C86C78D5EA765398640347E3A2E763349904F458B4A7EA581FFFF
                  FFFFFFFFFFFFFFFFFFFFD5D5D5B0B0B0C6C6C6C2C2C2B9B9B998989877777770
                  70706868688181817D7D7D9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFEDF7EE8ECD96
                  85C98E9BD4A48FCE9892CF9A8DCC9588CA9083C68B7EC48579C17F478D4C87AC
                  89FFFFFFFFFFFFFFFFFFF5F5F5BFBFBFBABABAC8C8C8C0C0C0C2C2C2BEBEBEBC
                  BCBCB7B7B7B5B5B5B1B1B17E7E7EA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDCF0DE
                  90CF9779C38389CA9294D09C95D19E90CF998CCB9487C98F80C4874E95548FB3
                  92FFFFFFFFFFFFFFFFFFFFFFFFEBEBEBC1C1C1B3B3B3BCBCBCC3C3C3C4C4C4C1
                  C1C1BDBDBDBBBBBBB5B5B5868686ABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  EDF8EFB9E1BE89C99064B46C50A65A4B9E5345964D60A8685BA2628CB690FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D8D8D8BBBBBBA4A4A49595958D
                  8D8D878787999999939393ACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67AB6E8BBC90FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF9C9C9CB1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACD4B0FDFEFDFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFCACACAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                NumGlyphs = 2
                OnClick = cbFHUsersChange
              end
              object lFHUser: TLabel
                Left = 6
                Top = 283
                Width = 4
                Height = 13
                Caption = '.'
              end
              object gbFHHistory: TGroupBox
                Left = 5
                Top = 188
                Width = 133
                Height = 85
                Caption = '.'
                TabOrder = 0
                object cbFHCumulative: TAdvOfficeCheckBox
                  Left = 6
                  Top = 59
                  Width = 120
                  Height = 20
                  TabOrder = 0
                  OnClick = rbFHHQuantityClick
                  Alignment = taLeftJustify
                  Caption = '.'
                  ReturnIsTab = False
                  Version = '1.4.1.1'
                end
                object rbFHHQuantity: TAdvOfficeRadioButton
                  Left = 5
                  Top = 16
                  Width = 125
                  Height = 20
                  TabOrder = 1
                  TabStop = True
                  OnClick = rbFHHQuantityClick
                  Alignment = taLeftJustify
                  Caption = '.'
                  Checked = True
                  ReturnIsTab = False
                  Version = '1.4.1.1'
                end
                object rbFHHSize: TAdvOfficeRadioButton
                  Left = 5
                  Top = 33
                  Width = 125
                  Height = 20
                  TabOrder = 2
                  OnClick = rbFHHQuantityClick
                  Alignment = taLeftJustify
                  Caption = '.'
                  ReturnIsTab = False
                  Version = '1.4.1.1'
                end
              end
              object GroupBox3: TGroupBox
                Left = 5
                Top = 4
                Width = 133
                Height = 173
                TabOrder = 1
                object lFHHFrom: TLabel
                  Left = 6
                  Top = 16
                  Width = 4
                  Height = 13
                  Caption = '.'
                end
                object lFHHTo: TLabel
                  Left = 6
                  Top = 56
                  Width = 4
                  Height = 13
                  Caption = '.'
                end
                object lFHHInterval: TLabel
                  Left = 6
                  Top = 96
                  Width = 4
                  Height = 13
                  Caption = '.'
                end
                object dtpFHHFrom: TDateTimePicker
                  Left = 6
                  Top = 32
                  Width = 121
                  Height = 21
                  Date = 39596.525266018520000000
                  Time = 39596.525266018520000000
                  DateFormat = dfLong
                  TabOrder = 0
                  OnCloseUp = dtpFHHFromCloseUp
                end
                object dtpFHHTo: TDateTimePicker
                  Left = 6
                  Top = 72
                  Width = 121
                  Height = 21
                  Date = 39596.525266018520000000
                  Time = 39596.525266018520000000
                  DateFormat = dfLong
                  TabOrder = 1
                  OnCloseUp = dtpFHHFromCloseUp
                end
                object cbFHHInterval: TComboBox
                  Left = 6
                  Top = 112
                  Width = 121
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 2
                  OnCloseUp = dtpFHHFromCloseUp
                end
                object cbFHHDateSelect: TComboBox
                  Left = 6
                  Top = 144
                  Width = 121
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 3
                  OnCloseUp = dtpFHHFromCloseUp
                end
              end
              object cbFHUsers: TComboBox
                Left = 6
                Top = 297
                Width = 128
                Height = 21
                Style = csDropDownList
                TabOrder = 2
                OnChange = cbFHUsersChange
              end
              object cbFHAutoRefreshHistory: TAdvOfficeCheckBox
                Left = 9
                Top = 372
                Width = 128
                Height = 20
                TabOrder = 3
                Alignment = taLeftJustify
                Caption = '.'
                ReturnIsTab = False
                Version = '1.4.1.1'
              end
            end
            object Panel43: TPanel
              Left = 145
              Top = 2
              Width = 1154
              Height = 579
              Align = alClient
              TabOrder = 1
              object capacityFHBarHistory: TAdvSmoothCapacityBar
                Left = 1
                Top = 495
                Width = 1152
                Height = 83
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
                Appearance.CapacityTextShadowColor = clGray
                Appearance.LegendTextShadowColor = clSilver
                Items = <>
                CapacityDescription = ' '
                FreeDescription = 'NO'
                TotalCapacity = 100.000000000000000000
                ExplicitLeft = 282
                ExplicitTop = 491
                ExplicitWidth = 908
              end
              object vtcFHHistory: TChart
                Left = 1
                Top = 23
                Width = 1152
                Height = 472
                BackWall.Brush.Style = bsClear
                Gradient.EndColor = 15922416
                Gradient.Visible = True
                Legend.Alignment = laLeft
                Legend.Visible = False
                Title.Text.Strings = (
                  '...')
                DepthAxis.Automatic = False
                DepthAxis.AutomaticMaximum = False
                DepthAxis.AutomaticMinimum = False
                DepthAxis.Maximum = 0.500000000000000000
                DepthAxis.Minimum = -0.500000000000000000
                DepthTopAxis.Automatic = False
                DepthTopAxis.AutomaticMaximum = False
                DepthTopAxis.AutomaticMinimum = False
                DepthTopAxis.Maximum = 0.500000000000000000
                DepthTopAxis.Minimum = -0.500000000000000000
                LeftAxis.Automatic = False
                LeftAxis.AutomaticMaximum = False
                LeftAxis.AutomaticMinimum = False
                LeftAxis.Maximum = 357.500000000000000000
                RightAxis.Automatic = False
                RightAxis.AutomaticMaximum = False
                RightAxis.AutomaticMinimum = False
                View3D = False
                Align = alClient
                PopupMenu = puCharts
                TabOrder = 0
                OnClick = vtcFHHistoryClick
                OnMouseMove = vtcFHHistoryMouseMove
                DefaultCanvas = 'TGDIPlusCanvas'
                ColorPaletteIndex = 13
                object BarSeries2: TBarSeries
                  BarPen.Visible = False
                  Marks.Visible = False
                  XValues.Name = 'X'
                  XValues.Order = loAscending
                  YValues.Name = 'Bar'
                  YValues.Order = loNone
                end
              end
              object Panel59: TPanel
                Left = 1
                Top = 1
                Width = 1152
                Height = 22
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                DesignSize = (
                  1152
                  22)
                object lFHHistoryResults: THTMLabel
                  Left = 6
                  Top = 4
                  Width = 1040
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
          object tsFHUsers: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            TabAppearance.Appearance.ImageIndex = 13
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
            object splitFHUsers: TAdvSplitter
              Left = 523
              Top = 2
              Height = 579
              OnMoved = splitFHUsersMoved
              Appearance.BorderColor = clNone
              Appearance.BorderColorHot = clNone
              Appearance.Color = clWhite
              Appearance.ColorTo = clSilver
              Appearance.ColorHot = clWhite
              Appearance.ColorHotTo = clGray
              GripStyle = sgDots
              ExplicitLeft = 552
              ExplicitTop = 384
              ExplicitHeight = 100
            end
            object pFHUsers: TPanel
              Left = 2
              Top = 2
              Width = 521
              Height = 579
              Align = alLeft
              TabOrder = 0
              object Panel39: TPanel
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
                object rbFHUsersSize: TAdvOfficeRadioButton
                  Left = 2
                  Top = 3
                  Width = 70
                  Height = 20
                  Hint = 'graph by size of files'
                  TabOrder = 0
                  TabStop = True
                  OnClick = rbFHUsersSizeClick
                  Alignment = taLeftJustify
                  Caption = '.'
                  Checked = True
                  ReturnIsTab = False
                  Version = '1.4.1.1'
                end
                object rbFHUsersQuantity: TAdvOfficeRadioButton
                  Left = 80
                  Top = 3
                  Width = 70
                  Height = 20
                  Hint = 'graph by number of files'
                  TabOrder = 1
                  OnClick = rbFHUsersSizeClick
                  Alignment = taLeftJustify
                  Caption = '.'
                  ReturnIsTab = False
                  Version = '1.4.1.1'
                end
              end
              object vtcFHUsers: TChart
                Tag = 2
                Left = 1
                Top = 25
                Width = 519
                Height = 553
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
                TabOrder = 1
                DefaultCanvas = 'TGDIPlusCanvas'
                ColorPaletteIndex = 13
                object PieSeries5: TPieSeries
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
                  Gradient.Balance = 9
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
            object sgFHUsers: TAdvStringGrid
              Tag = 1
              Left = 526
              Top = 2
              Width = 773
              Height = 579
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
              OnDblClick = sgFHUsersDblClick
              OnDrawCell = sgFHUsersDrawCell
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
                64)
              RowHeights = (
                17
                17)
            end
          end
          object tsFHTemp: TAdvSmoothTabPage
            Left = 1
            Top = 26
            Width = 1301
            Height = 583
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
            object Splitter8: TAdvSplitter
              Left = 323
              Top = 26
              Height = 555
              OnMoved = Splitter8Moved
              Appearance.BorderColor = clNone
              Appearance.BorderColorHot = clNone
              Appearance.Color = clWhite
              Appearance.ColorTo = clSilver
              Appearance.ColorHot = clWhite
              Appearance.ColorHotTo = clGray
              GripStyle = sgDots
              ExplicitLeft = 384
              ExplicitTop = 368
              ExplicitHeight = 100
            end
            object Panel20: TPanel
              Left = 2
              Top = 26
              Width = 321
              Height = 555
              Align = alLeft
              TabOrder = 0
              object vtcFHTemp: TChart
                Left = 1
                Top = 25
                Width = 319
                Height = 529
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
                TabOrder = 0
                DefaultCanvas = 'TGDIPlusCanvas'
                ColorPaletteIndex = 13
                object PieSeries9: TPieSeries
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
              object Panel58: TPanel
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
                TabOrder = 1
                object SpeedButton5: TSpeedButton
                  Left = 0
                  Top = 0
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
                  OnClick = SpeedButton5Click
                end
                object rbFHTempSize: TAdvOfficeRadioButton
                  Left = 30
                  Top = 3
                  Width = 70
                  Height = 20
                  Hint = 'graph by size of files'
                  TabOrder = 0
                  TabStop = True
                  OnClick = rbFHTempSizeClick
                  Alignment = taLeftJustify
                  Caption = '.'
                  Checked = True
                  ReturnIsTab = False
                  Version = '1.4.1.1'
                end
                object rbFHTempQuantity: TAdvOfficeRadioButton
                  Left = 108
                  Top = 3
                  Width = 70
                  Height = 20
                  Hint = 'graph by number of files'
                  TabOrder = 1
                  OnClick = rbFHTempSizeClick
                  Alignment = taLeftJustify
                  Caption = '.'
                  ReturnIsTab = False
                  Version = '1.4.1.1'
                end
              end
            end
            object Panel60: TPanel
              Left = 2
              Top = 2
              Width = 1297
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              FullRepaint = False
              ParentBackground = False
              TabOrder = 1
              DesignSize = (
                1297
                24)
              object lFHTempStatus: THTMLabel
                Left = 5
                Top = 3
                Width = 1281
                Height = 17
                Anchors = [akLeft, akTop, akRight]
                HTMLText.Strings = (
                  '.')
                Transparent = True
                Version = '1.9.2.6'
                ExplicitWidth = 1172
              end
            end
            object sgFHTemp: TAdvStringGrid
              Left = 326
              Top = 26
              Width = 973
              Height = 555
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
              TabOrder = 2
              OnDrawCell = sgFHTempDrawCell
              GridLineColor = 15527152
              GridFixedLineColor = 13947601
              HoverRowCells = [hcNormal, hcSelected]
              OnCanSort = sgFHTempCanSort
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
      object tsFHChart: TAdvSmoothTabPage
        Left = 1
        Top = 26
        Width = 1307
        Height = 641
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
        TabAppearance.Appearance.PictureAlignment = taLeftJustify
        TabAppearance.Appearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Appearance.Font.Color = clWindowText
        TabAppearance.Appearance.Font.Height = -11
        TabAppearance.Appearance.Font.Name = 'Tahoma'
        TabAppearance.Appearance.Font.Style = []
        TabAppearance.Appearance.ImageList = ilTabs
        TabAppearance.Appearance.ImageIndex = 2
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
        object Panel42: TPanel
          Left = 2
          Top = 2
          Width = 154
          Height = 637
          Align = alLeft
          TabOrder = 0
          object clbFolderHistory: TCheckListBox
            Left = 1
            Top = 274
            Width = 152
            Height = 362
            Align = alClient
            ItemHeight = 13
            TabOrder = 0
            OnClick = rbFHCountClick
          end
          object Panel19: TPanel
            Tag = 132
            Left = 1
            Top = 81
            Width = 152
            Height = 142
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            FullRepaint = False
            ParentBackground = False
            TabOrder = 1
            object lFHCCategory: TLabel
              Tag = 1
              Left = 13
              Top = 4
              Width = 132
              Height = 13
              Cursor = crHandPoint
              AutoSize = False
              Caption = '.'
              OnClick = lFHCFilesClick
            end
            object sbFHCF1: TSpeedButton
              Left = 12
              Top = 24
              Width = 27
              Height = 22
              Hint = 'toggle temporary files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF6: TSpeedButton
              Tag = 5
              Left = 12
              Top = 48
              Width = 27
              Height = 22
              Hint = 'toggle audio files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF7: TSpeedButton
              Tag = 6
              Left = 39
              Top = 48
              Width = 27
              Height = 22
              Hint = 'toggle "Office" files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF2: TSpeedButton
              Tag = 1
              Left = 39
              Top = 24
              Width = 27
              Height = 22
              Hint = 'toggle program files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF3: TSpeedButton
              Tag = 2
              Left = 66
              Top = 24
              Width = 27
              Height = 22
              Hint = 'toggle system files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF8: TSpeedButton
              Tag = 7
              Left = 66
              Top = 48
              Width = 27
              Height = 22
              Hint = 'toggle programming files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF9: TSpeedButton
              Tag = 8
              Left = 93
              Top = 48
              Width = 27
              Height = 22
              Hint = 'toggle compressed files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF4: TSpeedButton
              Tag = 3
              Left = 93
              Top = 24
              Width = 27
              Height = 22
              Hint = 'toggle graphics files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF5: TSpeedButton
              Tag = 4
              Left = 120
              Top = 24
              Width = 27
              Height = 22
              Hint = 'toggle video files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF10: TSpeedButton
              Tag = 9
              Left = 120
              Top = 48
              Width = 27
              Height = 22
              Hint = 'toggle other files'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF15: TSpeedButton
              Tag = 14
              Left = 120
              Top = 80
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 5 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF20: TSpeedButton
              Tag = 19
              Left = 120
              Top = 104
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 10 category'
              Enabled = False
              OnDblClick = sbFHCF1Click
            end
            object sbFHCF19: TSpeedButton
              Tag = 18
              Left = 93
              Top = 104
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 9 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF14: TSpeedButton
              Tag = 13
              Left = 93
              Top = 80
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 4 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF13: TSpeedButton
              Tag = 12
              Left = 66
              Top = 80
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 3 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF18: TSpeedButton
              Tag = 17
              Left = 66
              Top = 104
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 8 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF17: TSpeedButton
              Tag = 16
              Left = 39
              Top = 104
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 7 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF12: TSpeedButton
              Tag = 11
              Left = 39
              Top = 80
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 2 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF11: TSpeedButton
              Tag = 10
              Left = 12
              Top = 80
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 1 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object sbFHCF16: TSpeedButton
              Tag = 15
              Left = 12
              Top = 104
              Width = 27
              Height = 22
              Hint = 'toggle files in the Custom 6 category'
              Enabled = False
              OnClick = sbFHCF1Click
            end
            object Image36: TImage
              Left = 0
              Top = 5
              Width = 9
              Height = 9
              Picture.Data = {
                07544269746D617032010000424D320100000000000036000000280000000900
                0000090000000100180000000000FC000000130B0000130B0000000000000000
                0000FFFFFFC4C4C4F1F1F1FCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFF00FFFF
                FFA5A5A5A6A6A6E9E9E9FCFCFCFCFCFCFCFCFCFFFFFFFFFFFF00FFFFFFA5A5A5
                A6A6A6999999E1E1E1FCFCFCFCFCFCFFFFFFFFFFFF00FFFFFFA5A5A5A6A6A6A6
                A6A68E8E8ED7D7D7FCFCFCFFFFFFFFFFFF00FFFFFFA5A5A5A6A6A6A6A6A6A6A6
                A6808080EBEBEBFFFFFFFFFFFF00FFFFFFA5A5A5A6A6A6A6A6A68E8E8ED7D7D7
                FCFCFCFFFFFFFFFFFF00FFFFFFA5A5A5A6A6A6999999E1E1E1FCFCFCFCFCFCFF
                FFFFFFFFFF00FFFFFFA5A5A5A6A6A6E9E9E9FCFCFCFCFCFCFCFCFCFFFFFFFFFF
                FF00FFFFFFC4C4C4F1F1F1FCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFF00}
            end
          end
          object Panel51: TPanel
            Tag = 80
            Left = 1
            Top = 1
            Width = 152
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            FullRepaint = False
            ParentBackground = False
            TabOrder = 2
            object lFHCFiles: TLabel
              Left = 13
              Top = 4
              Width = 131
              Height = 13
              Cursor = crHandPoint
              AutoSize = False
              Caption = '.'
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
                07544269746D617032010000424D320100000000000036000000280000000900
                0000090000000100180000000000FC000000130B0000130B0000000000000000
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FCFCFCFCFCFC
                FCFCFCFCFCFCEBEBEBFCFCFCFCFCFCFCFCFCFCFCFC00FCFCFCFCFCFCFCFCFCD7
                D7D7808080D7D7D7FCFCFCFCFCFCFCFCFC00FCFCFCFCFCFCE1E1E18E8E8EA6A6
                A68E8E8EE1E1E1FCFCFCFCFCFC00FCFCFCE9E9E9999999A6A6A6A6A6A6A6A6A6
                999999E9E9E9FCFCFC00F1F1F1A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6
                A6A6F1F1F100C4C4C4A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5C4C4
                C400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
            end
            object rbFHCount: TAdvOfficeRadioButton
              Left = 4
              Top = 18
              Width = 71
              Height = 20
              TabOrder = 0
              TabStop = True
              OnClick = rbFHCountClick
              Alignment = taLeftJustify
              Caption = '.'
              Checked = True
              ReturnIsTab = False
              Version = '1.4.1.1'
            end
            object rbFHSize: TAdvOfficeRadioButton
              Left = 77
              Top = 18
              Width = 71
              Height = 20
              TabOrder = 1
              OnClick = rbFHCountClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.4.1.1'
            end
            object rbFHMagCount: TAdvOfficeRadioButton
              Left = 4
              Top = 55
              Width = 71
              Height = 20
              TabOrder = 2
              OnClick = rbFHCountClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.4.1.1'
            end
            object rbFHMagSize: TAdvOfficeRadioButton
              Left = 77
              Top = 55
              Width = 71
              Height = 20
              TabOrder = 3
              OnClick = rbFHCountClick
              Alignment = taLeftJustify
              Caption = '.'
              ReturnIsTab = False
              Version = '1.4.1.1'
            end
          end
          object Panel52: TPanel
            Left = 1
            Top = 223
            Width = 152
            Height = 51
            Align = alTop
            BevelOuter = bvLowered
            Color = clWhite
            TabOrder = 3
            object lFHFolderCount: TLabel
              Left = 13
              Top = 4
              Width = 4
              Height = 13
              Caption = '.'
            end
            object lFHFolders: TLabel
              Left = 70
              Top = 4
              Width = 16
              Height = 13
              Caption = '....'
            end
            object lFHCFilesCount: TLabel
              Left = 13
              Top = 20
              Width = 4
              Height = 13
              Caption = '.'
            end
            object lFHFileCount: TLabel
              Left = 70
              Top = 20
              Width = 16
              Height = 13
              Caption = '....'
            end
            object lFHCTotalSize: TLabel
              Left = 13
              Top = 36
              Width = 4
              Height = 13
              Caption = '.'
            end
            object lFHFileSize: TLabel
              Left = 70
              Top = 36
              Width = 16
              Height = 13
              Caption = '....'
            end
          end
        end
        object vtcFolderHistory: TChart
          Left = 156
          Top = 2
          Width = 1149
          Height = 637
          Gradient.EndColor = 16579071
          Gradient.Visible = True
          Legend.Alignment = laLeft
          MarginBottom = 1
          MarginLeft = 1
          MarginRight = 1
          MarginTop = 1
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
          PopupMenu = puCharts
          TabOrder = 1
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
        end
      end
      object tsFHTable: TAdvSmoothTabPage
        Left = 1
        Top = 26
        Width = 1307
        Height = 641
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
        TabAppearance.Appearance.ImageIndex = 0
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
        object Panel1: TPanel
          Left = 2
          Top = 2
          Width = 1303
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          TabOrder = 0
          object rbFJTRToday: TAdvOfficeRadioButton
            Left = 2
            Top = 4
            Width = 153
            Height = 20
            Enabled = False
            TabOrder = 0
            OnClick = rbFJTRTodayClick
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
          object rbFJTRPrevious: TAdvOfficeRadioButton
            Left = 161
            Top = 4
            Width = 153
            Height = 20
            Enabled = False
            TabOrder = 1
            TabStop = True
            OnClick = rbFJTRTodayClick
            Alignment = taLeftJustify
            Caption = '.'
            Checked = True
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
        end
        object sgFHTable: TAdvStringGrid
          Left = 2
          Top = 28
          Width = 1303
          Height = 611
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
          ScrollBars = ssBoth
          TabOrder = 1
          OnDrawCell = sgFHTableDrawCell
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
          ControlLook.ProgressXP = True
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
      object tsFHFiles: TAdvSmoothTabPage
        Left = 1
        Top = 26
        Width = 1307
        Height = 641
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
        TabAppearance.Appearance.ImageIndex = 4
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
        object pFH: TPanel
          Left = 2
          Top = 2
          Width = 1303
          Height = 52
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          FullRepaint = False
          TabOrder = 0
          object sbFHFavourites: TSpeedButton
            Tag = 2
            Left = 1
            Top = 27
            Width = 23
            Height = 22
            Hint = 'quick search options'
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
              FFFFFFB1E0F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABD2
              EDF9FCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9FCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF32B0DF30ADDE87CEEBFFFFFFFFFFFFFFFFFFFFFFFF9ACDEB2290D30D81
              CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8B5B5B5D4D4D4FFFFFFFF
              FFFFFFFFFFFFFFFFD4D4D4A0A0A0939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF44B8E350CBEF39B7E52AA9DD73C5E782CAEA269ED92AA3DD39AEE5198C
              D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFCFCFCFBEBEBEB3B3B3CB
              CBCBD0D0D0A9A9A9AEAEAEB8B8B89D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF5BC3E74DCAEE54CEF150C8EF40BAE839B5E546BDEB44BAEB3EB3E82C9A
              D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C8CECECED2D2D2CDCDCDC1
              C1C1BDBDBDC4C4C4C2C2C2BCBCBCA7A7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF7AD0EC49C8EC49CCF131C3ED42C4EE46C3ED2CB6EA26B1E83CB4E746AB
              DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4CCCCCCD0D0D0C9C9C9CA
              CACAC9C9C9BFBFBFBBBBBBBDBDBDB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF9BDCF144C6EA57D2F227C2ED23BDEC1FB7EA1BB3E936B9EA3AB3E667BD
              E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCACACAD6D6D6C8C8C8C4
              C4C4C0C0C0BDBDBDC1C1C1BCBCBCC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F5FCFE46C2E659D5F246D0F229C4EE25C0ED22BBEB1DB6E921B4E946BDEB2AA7
              DBE6F4FBFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCC6C6C6D8D8D8D4D4D4CACACAC7
              C7C7C3C3C3BFBFBFBDBDBDC4C4C4B1B1B1F5F5F5FFFFFFFFFFFFFFFFFFFAFEFE
              4DC8E94ACEED5EDBF530CDF12CC8EF27C3EE24BEEC20B8EA1CB4E949C0EC37B2
              E42DA8DDEBF7FCFFFFFFFFFFFFFEFEFECBCBCBD1D1D1DDDDDDD1D1D1CDCDCDC9
              C9C9C5C5C5C0C0C0BDBDBDC7C7C7BBBBBBB1B1B1F8F8F8FFFFFFFFFFFF54CEEB
              4CD2EE63E1F641D6F432CFF22ECBF02AC6EF26C1ED22BCEB1FB7EA20B4E947BE
              EC36B2E432ABDDEFF8FCFFFFFFD1D1D1D4D4D4E1E1E1D8D8D8D2D2D2CFCFCFCC
              CCCCC7C7C7C3C3C3C0C0C0BDBDBDC5C5C5BBBBBBB4B4B4F9F9F95ED3EE4DD5EF
              58DCF25EDEF560DEF55FDCF648D4F32DC9EF29C4EE35C4ED50C9EF4CC4EE45BE
              EB3DB7E733B0E236ADDED5D5D5D7D7D7DDDDDDDFDFDFDFDFDFDEDEDED7D7D7CE
              CECECACACACACACACECECECACACAC5C5C5BFBFBFB9B9B9B6B6B6F6FDFEB6EBF7
              7FDCF15BD0ED42C7E949CEED5BD9F447D3F23ACBF055CFF13EBFE835B7E24BBC
              E46EC8E9A3DBF1E6F5FBFDFDFDECECECDEDEDED3D3D3CBCBCBD1D1D1DBDBDBD6
              D6D6CFCFCFD3D3D3C5C5C5BDBDBDC3C3C3CDCDCDDFDFDFF6F6F6FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF9CE2F349CEED5DD9F459D6F343C5EA79D1EDFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4D1D1D1DB
              DBDBD9D9D9CACACAD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF47CAEA56D6F259D6F33AC0E6FAFDFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECED8
              D8D8D9D9D9C5C5C5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFBCECF748CEED48CDED9BE0F3FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDD1
              D1D1D0D0D0E2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58D1EC47CBEAFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
              D3D3CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8F5FBC1EEF8FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
              F5F5EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
            OnClick = sbFHFavouritesClick
          end
          object sbFHSearch: TSpeedButton
            Left = 24
            Top = 27
            Width = 23
            Height = 22
            Hint = 'execute search'
            Enabled = False
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
            OnClick = cbFHSizeUnitsChange
          end
          object cbFHSize: TLabel
            Left = 182
            Top = 6
            Width = 4
            Height = 13
            Caption = '.'
          end
          object sbFHSearchSyntax: TSpeedButton
            Left = 649
            Top = 27
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
          object sbFHSaveSearch: TSpeedButton
            Left = 670
            Top = 27
            Width = 23
            Height = 22
            Hint = 'save search results'
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000C21E0000C21E00000000000000000000D8AB8ECD9570
              BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
              31A76132AB693CBC8661A8A8A893939371717167676766666666666665656564
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
              DFECD1BECD926AE2C5B1A3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
              F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FC3C3C3E1BDA6D9AB8D
              C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
              44C98D65E7CEBCFFFFFFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
              69696969696B6B6B6D6D6D6B6B6B7373738A8A8ACCCCCCFFFFFF}
            NumGlyphs = 2
            OnClick = sbFHSaveSearchClick
          end
          object SpeedButton20: TSpeedButton
            Left = 0
            Top = 1
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
            OnClick = SpeedButton20Click
          end
          object lFHStatus: THTMLabel
            Left = 533
            Top = 7
            Width = 309
            Height = 19
            AutoSizeType = asHorizontal
            HTMLText.Strings = (
              '.')
            Transparent = True
            Version = '1.9.2.6'
          end
          object cbFHSizeUnits: TComboBox
            Left = 224
            Top = 2
            Width = 105
            Height = 21
            Style = csDropDownList
            Enabled = False
            TabOrder = 0
            OnChange = cbFHSizeUnitsChange
          end
          object eFHSearch: TComboBox
            Left = 48
            Top = 27
            Width = 601
            Height = 21
            Hint = 'click the icon to the right of this box for search help'
            Enabled = False
            TabOrder = 1
            OnChange = eFHSearchChange
            OnKeyPress = eFHSearchKeyPress
          end
          object bFolderHistoryFiles: TBitBtn
            Tag = -1
            Left = 28
            Top = 1
            Width = 149
            Height = 22
            TabOrder = 2
            OnClick = bFolderHistoryFilesClick
          end
          object cbFHShowPath: TAdvOfficeCheckBox
            Left = 335
            Top = 3
            Width = 97
            Height = 20
            Hint = 'include full path of file in search results'
            TabOrder = 3
            OnClick = cbFHSizeUnitsChange
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
          object cbFHSearchColourCode: TAdvOfficeCheckBox
            Left = 438
            Top = 3
            Width = 81
            Height = 20
            Hint = 'colour code search results based on the category they belong to'
            TabOrder = 4
            OnClick = cbFHSearchColourCodeClick
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
        end
        object sgFileHistory: TAdvStringGrid
          Tag = 2
          Left = 2
          Top = 54
          Width = 1303
          Height = 555
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
          OnDrawCell = sgFileHistoryDrawCell
          GridLineColor = 15527152
          GridFixedLineColor = 13947601
          HoverRowCells = [hcNormal, hcSelected]
          OnCanSort = sgFileHistoryCanSort
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
          FixedColWidth = 168
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
          SortSettings.IgnoreCase = True
          SortSettings.HeaderColor = 16579058
          SortSettings.HeaderColorTo = 16579058
          SortSettings.HeaderMirrorColor = 16380385
          SortSettings.HeaderMirrorColorTo = 16182488
          Version = '8.2.2.0'
          WordWrap = False
          ColWidths = (
            168
            98
            145
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
        object pFSSearchNavigation: TPanel
          Left = 2
          Top = 609
          Width = 1303
          Height = 30
          Align = alBottom
          FullRepaint = False
          TabOrder = 2
          object lFSShowing: TLabel
            Left = 112
            Top = 7
            Width = 12
            Height = 13
            Caption = '...'
          end
          object lFSPageNumber: TLabel
            Left = 72
            Top = 7
            Width = 6
            Height = 13
            Caption = '1'
          end
          object W7NavigationFrame3: TW7NavigationFrame
            Left = 0
            Top = 2
            Width = 67
            Height = 26
            Opacity = 200
          end
          object lFSPagePrevious: TW7NavigationButton
            Left = 5
            Top = 2
            Width = 24
            Height = 24
            Direction = ndBackward
            FadeInInterval = 17
            FadeOutInterval = 17
            Enabled = False
            ParentFont = False
            OnClick = lFSPagePreviousClick
          end
          object lFSPageNext: TW7NavigationButton
            Left = 36
            Top = 2
            Width = 24
            Height = 24
            FadeInInterval = 17
            FadeOutInterval = 17
            Enabled = False
            ParentFont = False
            OnClick = lFSPageNextClick
          end
        end
      end
      object tsFHCompare: TAdvSmoothTabPage
        Left = 1
        Top = 26
        Width = 1307
        Height = 641
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
        TabAppearance.Appearance.ImageIndex = 15
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
        object Splitter2: TAdvSplitter
          Left = 563
          Top = 60
          Height = 579
          OnMoved = Splitter2Moved
          Appearance.BorderColor = clNone
          Appearance.BorderColorHot = clNone
          Appearance.Color = clWhite
          Appearance.ColorTo = clSilver
          Appearance.ColorHot = clWhite
          Appearance.ColorHotTo = clGray
          GripStyle = sgDots
          ExplicitLeft = 632
          ExplicitTop = 408
          ExplicitHeight = 100
        end
        object pFHCompare: TPanel
          Left = 2
          Top = 2
          Width = 1303
          Height = 58
          Align = alTop
          Color = clWhite
          FullRepaint = False
          TabOrder = 0
          DesignSize = (
            1303
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
              18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
              FFFFFFB1E0F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABD2
              EDF9FCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9FCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF32B0DF30ADDE87CEEBFFFFFFFFFFFFFFFFFFFFFFFF9ACDEB2290D30D81
              CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8B5B5B5D4D4D4FFFFFFFF
              FFFFFFFFFFFFFFFFD4D4D4A0A0A0939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF44B8E350CBEF39B7E52AA9DD73C5E782CAEA269ED92AA3DD39AEE5198C
              D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFCFCFCFBEBEBEB3B3B3CB
              CBCBD0D0D0A9A9A9AEAEAEB8B8B89D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF5BC3E74DCAEE54CEF150C8EF40BAE839B5E546BDEB44BAEB3EB3E82C9A
              D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C8CECECED2D2D2CDCDCDC1
              C1C1BDBDBDC4C4C4C2C2C2BCBCBCA7A7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF7AD0EC49C8EC49CCF131C3ED42C4EE46C3ED2CB6EA26B1E83CB4E746AB
              DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4CCCCCCD0D0D0C9C9C9CA
              CACAC9C9C9BFBFBFBBBBBBBDBDBDB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF9BDCF144C6EA57D2F227C2ED23BDEC1FB7EA1BB3E936B9EA3AB3E667BD
              E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCACACAD6D6D6C8C8C8C4
              C4C4C0C0C0BDBDBDC1C1C1BCBCBCC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F5FCFE46C2E659D5F246D0F229C4EE25C0ED22BBEB1DB6E921B4E946BDEB2AA7
              DBE6F4FBFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCC6C6C6D8D8D8D4D4D4CACACAC7
              C7C7C3C3C3BFBFBFBDBDBDC4C4C4B1B1B1F5F5F5FFFFFFFFFFFFFFFFFFFAFEFE
              4DC8E94ACEED5EDBF530CDF12CC8EF27C3EE24BEEC20B8EA1CB4E949C0EC37B2
              E42DA8DDEBF7FCFFFFFFFFFFFFFEFEFECBCBCBD1D1D1DDDDDDD1D1D1CDCDCDC9
              C9C9C5C5C5C0C0C0BDBDBDC7C7C7BBBBBBB1B1B1F8F8F8FFFFFFFFFFFF54CEEB
              4CD2EE63E1F641D6F432CFF22ECBF02AC6EF26C1ED22BCEB1FB7EA20B4E947BE
              EC36B2E432ABDDEFF8FCFFFFFFD1D1D1D4D4D4E1E1E1D8D8D8D2D2D2CFCFCFCC
              CCCCC7C7C7C3C3C3C0C0C0BDBDBDC5C5C5BBBBBBB4B4B4F9F9F95ED3EE4DD5EF
              58DCF25EDEF560DEF55FDCF648D4F32DC9EF29C4EE35C4ED50C9EF4CC4EE45BE
              EB3DB7E733B0E236ADDED5D5D5D7D7D7DDDDDDDFDFDFDFDFDFDEDEDED7D7D7CE
              CECECACACACACACACECECECACACAC5C5C5BFBFBFB9B9B9B6B6B6F6FDFEB6EBF7
              7FDCF15BD0ED42C7E949CEED5BD9F447D3F23ACBF055CFF13EBFE835B7E24BBC
              E46EC8E9A3DBF1E6F5FBFDFDFDECECECDEDEDED3D3D3CBCBCBD1D1D1DBDBDBD6
              D6D6CFCFCFD3D3D3C5C5C5BDBDBDC3C3C3CDCDCDDFDFDFF6F6F6FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF9CE2F349CEED5DD9F459D6F343C5EA79D1EDFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4D1D1D1DB
              DBDBD9D9D9CACACAD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF47CAEA56D6F259D6F33AC0E6FAFDFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECED8
              D8D8D9D9D9C5C5C5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFBCECF748CEED48CDED9BE0F3FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDD1
              D1D1D0D0D0E2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58D1EC47CBEAFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
              D3D3CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8F5FBC1EEF8FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
              F5F5EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
            OnClick = sbFHCompareFavouritesClick
          end
          object sbFHCompareSearch: TSpeedButton
            Left = 19
            Top = 2
            Width = 23
            Height = 22
            Hint = 'execute search'
            Enabled = False
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
            OnClick = sbFHCompareSearchClick
          end
          object Label4: TLabel
            Left = 6
            Top = 35
            Width = 19
            Height = 13
            Caption = 'Size'
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
            Width = 1231
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            TabOrder = 1
            OnChange = eFHCompareSearchChange
            OnKeyPress = eFHCompareSearchKeyPress
          end
          object cbFHComparePath: TAdvOfficeCheckBox
            Left = 157
            Top = 33
            Width = 120
            Height = 20
            Hint = 'include full path of file in search results'
            TabOrder = 2
            OnClick = sbFHCompareSearchClick
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
          object cbFHCompareColour: TAdvOfficeCheckBox
            Left = 283
            Top = 33
            Width = 123
            Height = 20
            Hint = 'colour code search results based on the category they belong to'
            TabOrder = 3
            OnClick = cbFHCompareColourClick
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
        end
        object Panel14: TPanel
          Left = 2
          Top = 60
          Width = 561
          Height = 579
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
            FullRepaint = False
            ParentColor = True
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
              NumGlyphs = 2
              OnClick = sbFHCLHideCreatedClick
            end
            object sbFHCLHideAttributes: TSpeedButton
              Tag = 8
              Left = 282
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCLHideCreatedClick
            end
            object sbFHCLHideOwner: TSpeedButton
              Tag = 7
              Left = 258
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCLHideCreatedClick
            end
            object sbFHCLHideModified: TSpeedButton
              Tag = 6
              Left = 234
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCLHideCreatedClick
            end
            object sbFHCLHideAccessed: TSpeedButton
              Tag = 5
              Left = 210
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCLHideCreatedClick
            end
            object sbFHCLHideCreated: TSpeedButton
              Tag = 4
              Left = 186
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
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
                18000000000000060000C21E0000C21E00000000000000000000D8AB8ECD9570
                BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
                31A76132AB693CBC8661A8A8A893939371717167676766666666666665656564
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
                DFECD1BECD926AE2C5B1A3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
                F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FC3C3C3E1BDA6D9AB8D
                C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
                44C98D65E7CEBCFFFFFFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
                69696969696B6B6B6D6D6D6B6B6B7373738A8A8ACCCCCCFFFFFF}
              NumGlyphs = 2
              OnClick = sbFHCompareLeftSaveClick
            end
            object sbFHCShowLeft: TSpeedButton
              Left = 330
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
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
              HTMLText.Strings = (
                '.')
              Transparent = True
              Version = '1.9.2.6'
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
            Height = 514
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
            OnCanSort = sgFileHistoryCanSort
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
            FixedColWidth = 205
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
            SortSettings.IgnoreCase = True
            SortSettings.HeaderColor = 16579058
            SortSettings.HeaderColorTo = 16579058
            SortSettings.HeaderMirrorColor = 16380385
            SortSettings.HeaderMirrorColorTo = 16182488
            Version = '8.2.2.0'
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
            Top = 548
            Width = 559
            Height = 30
            Align = alBottom
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 2
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
          Width = 739
          Height = 579
          Align = alClient
          TabOrder = 2
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 737
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            FullRepaint = False
            TabOrder = 0
            DesignSize = (
              737
              33)
            object sbFHCRHideCreated: TSpeedButton
              Tag = 10
              Left = 186
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCRHideCreatedClick
            end
            object sbFHCRHideAccessed: TSpeedButton
              Tag = 11
              Left = 215
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCRHideCreatedClick
            end
            object sbFHCRHideModified: TSpeedButton
              Tag = 12
              Left = 234
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCRHideCreatedClick
            end
            object sbFHCRHideOwner: TSpeedButton
              Tag = 13
              Left = 258
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCRHideCreatedClick
            end
            object sbFHCRHideAttributes: TSpeedButton
              Tag = 14
              Left = 282
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
              OnClick = sbFHCRHideCreatedClick
            end
            object sbFHCRHideSOD: TSpeedButton
              Tag = 15
              Left = 306
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
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
                18000000000000060000C21E0000C21E00000000000000000000D8AB8ECD9570
                BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
                31A76132AB693CBC8661A8A8A893939371717167676766666666666665656564
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
                DFECD1BECD926AE2C5B1A3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
                F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FC3C3C3E1BDA6D9AB8D
                C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
                44C98D65E7CEBCFFFFFFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
                69696969696B6B6B6D6D6D6B6B6B7373738A8A8ACCCCCCFFFFFF}
              NumGlyphs = 2
              OnClick = sbFHCompareRightSaveClick
            end
            object sbFHCShowRight: TSpeedButton
              Left = 330
              Top = 5
              Width = 23
              Height = 22
              Flat = True
              NumGlyphs = 2
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
              Left = 361
              Top = 10
              Width = 365
              Height = 17
              Anchors = [akLeft, akTop, akRight]
              HTMLText.Strings = (
                '.')
              Transparent = True
              Version = '1.9.2.6'
              ExplicitWidth = 256
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
            Width = 737
            Height = 514
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
            OnCanSort = sgFileHistoryCanSort
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
            FixedColWidth = 205
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
            SortSettings.IgnoreCase = True
            SortSettings.HeaderColor = 16579058
            SortSettings.HeaderColorTo = 16579058
            SortSettings.HeaderMirrorColor = 16380385
            SortSettings.HeaderMirrorColorTo = 16182488
            Version = '8.2.2.0'
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
            Top = 548
            Width = 737
            Height = 30
            Align = alBottom
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 2
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
        Width = 1307
        Height = 641
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
        object splitterFHCD: TAdvSplitter
          Left = 563
          Top = 31
          Height = 608
          OnMoved = splitterFHCDMoved
          Appearance.BorderColor = clNone
          Appearance.BorderColorHot = clNone
          Appearance.Color = clWhite
          Appearance.ColorTo = clSilver
          Appearance.ColorHot = clWhite
          Appearance.ColorHotTo = clGray
          GripStyle = sgDots
          ExplicitLeft = 600
          ExplicitTop = 376
          ExplicitHeight = 100
        end
        object Panel4: TPanel
          Left = 2
          Top = 2
          Width = 1303
          Height = 29
          Align = alTop
          Color = clWhite
          FullRepaint = False
          TabOrder = 0
          object sbFHCompareFolderSearch: TSpeedButton
            Left = 24
            Top = 3
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
            OnClick = sbFHCompareFolderSearchClick
          end
          object SpeedButton8: TSpeedButton
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
              18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
              FFFFFFB1E0F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABD2
              EDF9FCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9FCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF32B0DF30ADDE87CEEBFFFFFFFFFFFFFFFFFFFFFFFF9ACDEB2290D30D81
              CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8B5B5B5D4D4D4FFFFFFFF
              FFFFFFFFFFFFFFFFD4D4D4A0A0A0939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF44B8E350CBEF39B7E52AA9DD73C5E782CAEA269ED92AA3DD39AEE5198C
              D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFCFCFCFBEBEBEB3B3B3CB
              CBCBD0D0D0A9A9A9AEAEAEB8B8B89D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF5BC3E74DCAEE54CEF150C8EF40BAE839B5E546BDEB44BAEB3EB3E82C9A
              D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C8CECECED2D2D2CDCDCDC1
              C1C1BDBDBDC4C4C4C2C2C2BCBCBCA7A7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF7AD0EC49C8EC49CCF131C3ED42C4EE46C3ED2CB6EA26B1E83CB4E746AB
              DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4CCCCCCD0D0D0C9C9C9CA
              CACAC9C9C9BFBFBFBBBBBBBDBDBDB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF9BDCF144C6EA57D2F227C2ED23BDEC1FB7EA1BB3E936B9EA3AB3E667BD
              E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCACACAD6D6D6C8C8C8C4
              C4C4C0C0C0BDBDBDC1C1C1BCBCBCC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F5FCFE46C2E659D5F246D0F229C4EE25C0ED22BBEB1DB6E921B4E946BDEB2AA7
              DBE6F4FBFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCC6C6C6D8D8D8D4D4D4CACACAC7
              C7C7C3C3C3BFBFBFBDBDBDC4C4C4B1B1B1F5F5F5FFFFFFFFFFFFFFFFFFFAFEFE
              4DC8E94ACEED5EDBF530CDF12CC8EF27C3EE24BEEC20B8EA1CB4E949C0EC37B2
              E42DA8DDEBF7FCFFFFFFFFFFFFFEFEFECBCBCBD1D1D1DDDDDDD1D1D1CDCDCDC9
              C9C9C5C5C5C0C0C0BDBDBDC7C7C7BBBBBBB1B1B1F8F8F8FFFFFFFFFFFF54CEEB
              4CD2EE63E1F641D6F432CFF22ECBF02AC6EF26C1ED22BCEB1FB7EA20B4E947BE
              EC36B2E432ABDDEFF8FCFFFFFFD1D1D1D4D4D4E1E1E1D8D8D8D2D2D2CFCFCFCC
              CCCCC7C7C7C3C3C3C0C0C0BDBDBDC5C5C5BBBBBBB4B4B4F9F9F95ED3EE4DD5EF
              58DCF25EDEF560DEF55FDCF648D4F32DC9EF29C4EE35C4ED50C9EF4CC4EE45BE
              EB3DB7E733B0E236ADDED5D5D5D7D7D7DDDDDDDFDFDFDFDFDFDEDEDED7D7D7CE
              CECECACACACACACACECECECACACAC5C5C5BFBFBFB9B9B9B6B6B6F6FDFEB6EBF7
              7FDCF15BD0ED42C7E949CEED5BD9F447D3F23ACBF055CFF13EBFE835B7E24BBC
              E46EC8E9A3DBF1E6F5FBFDFDFDECECECDEDEDED3D3D3CBCBCBD1D1D1DBDBDBD6
              D6D6CFCFCFD3D3D3C5C5C5BDBDBDC3C3C3CDCDCDDFDFDFF6F6F6FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF9CE2F349CEED5DD9F459D6F343C5EA79D1EDFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4D1D1D1DB
              DBDBD9D9D9CACACAD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF47CAEA56D6F259D6F33AC0E6FAFDFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECED8
              D8D8D9D9D9C5C5C5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFBCECF748CEED48CDED9BE0F3FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDD1
              D1D1D0D0D0E2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58D1EC47CBEAFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
              D3D3CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8F5FBC1EEF8FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
              F5F5EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
            OnClick = sbFHCompareFavouritesClick
          end
          object eFHCompareDriveFolder: TComboBox
            Left = 48
            Top = 3
            Width = 379
            Height = 21
            Hint = 'folder to scan'
            Enabled = False
            TabOrder = 0
            OnKeyPress = eFHCompareDriveFolderKeyPress
          end
          object cbFHCompareFolderInclude: TAdvOfficeCheckBox
            Left = 435
            Top = 4
            Width = 229
            Height = 20
            Hint = 'include full path of file in search results'
            TabOrder = 1
            Alignment = taLeftJustify
            Caption = '.'
            ReturnIsTab = False
            Version = '1.4.1.1'
          end
        end
        object Splitter6: TPanel
          Left = 2
          Top = 31
          Width = 561
          Height = 608
          Align = alLeft
          ParentColor = True
          TabOrder = 1
          object Panel45: TPanel
            Left = 1
            Top = 1
            Width = 559
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            ParentColor = True
            TabOrder = 0
            DesignSize = (
              559
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
                18000000000000060000C21E0000C21E00000000000000000000D8AB8ECD9570
                BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
                31A76132AB693CBC8661A8A8A893939371717167676766666666666665656564
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
                DFECD1BECD926AE2C5B1A3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
                F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FC3C3C3E1BDA6D9AB8D
                C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
                44C98D65E7CEBCFFFFFFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
                69696969696B6B6B6D6D6D6B6B6B7373738A8A8ACCCCCCFFFFFF}
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
              Width = 364
              Height = 17
              Anchors = [akLeft, akTop, akRight]
              HTMLText.Strings = (
                '.')
              Transparent = True
              Version = '1.9.2.6'
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
            Left = 1
            Top = 34
            Width = 559
            Height = 573
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
            ScrollBars = ssBoth
            TabOrder = 1
            OnDrawCell = sgFHCDLeftDrawCell
            GridLineColor = 15527152
            GridFixedLineColor = 13947601
            HoverRowCells = [hcNormal, hcSelected]
            OnCanSort = sgFHCDLeftCanSort
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
          Width = 739
          Height = 608
          Align = alClient
          TabOrder = 2
          object Panel53: TPanel
            Left = 1
            Top = 1
            Width = 737
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            FullRepaint = False
            TabOrder = 0
            DesignSize = (
              737
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
                18000000000000060000C21E0000C21E00000000000000000000D8AB8ECD9570
                BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
                31A76132AB693CBC8661A8A8A893939371717167676766666666666665656564
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
                DFECD1BECD926AE2C5B1A3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
                F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FC3C3C3E1BDA6D9AB8D
                C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
                44C98D65E7CEBCFFFFFFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
                69696969696B6B6B6D6D6D6B6B6B7373738A8A8ACCCCCCFFFFFF}
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
              Width = 539
              Height = 17
              Anchors = [akLeft, akTop, akRight]
              HTMLText.Strings = (
                '.')
              Transparent = True
              Version = '1.9.2.6'
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
            Left = 1
            Top = 34
            Width = 737
            Height = 573
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
            ScrollBars = ssBoth
            TabOrder = 1
            OnDrawCell = sgFHCDLeftDrawCell
            GridLineColor = 15527152
            GridFixedLineColor = 13947601
            HoverRowCells = [hcNormal, hcSelected]
            OnCanSort = sgFHCDLeftCanSort
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
        Width = 1307
        Height = 641
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
        TabAppearance.Appearance.ImageIndex = 16
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
        object Splitter7: TAdvSplitter
          Left = 563
          Top = 31
          Height = 608
          Appearance.BorderColor = clNone
          Appearance.BorderColorHot = clNone
          Appearance.Color = clWhite
          Appearance.ColorTo = clSilver
          Appearance.ColorHot = clWhite
          Appearance.ColorHotTo = clGray
          GripStyle = sgDots
          ExplicitLeft = 600
          ExplicitTop = 448
          ExplicitHeight = 100
        end
        object Panel48: TPanel
          Left = 2
          Top = 2
          Width = 1303
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
            OnClick = SpeedButton1Click
          end
        end
        object Panel54: TPanel
          Left = 2
          Top = 31
          Width = 561
          Height = 608
          Align = alLeft
          ParentColor = True
          TabOrder = 1
          object Panel55: TPanel
            Left = 1
            Top = 1
            Width = 559
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            FullRepaint = False
            ParentColor = True
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
                18000000000000060000C21E0000C21E00000000000000000000D8AB8ECD9570
                BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
                31A76132AB693CBC8661A8A8A893939371717167676766666666666665656564
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
                DFECD1BECD926AE2C5B1A3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
                F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FC3C3C3E1BDA6D9AB8D
                C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
                44C98D65E7CEBCFFFFFFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
                69696969696B6B6B6D6D6D6B6B6B7373738A8A8ACCCCCCFFFFFF}
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
            Left = 1
            Top = 34
            Width = 559
            Height = 573
            HTMLImages = ilTabs
            ItemHeight = 16
            SelectionNFColor = clSilver
            SelectionNFFontColor = clBlack
            Align = alClient
            Indent = 19
            TabOrder = 1
            OnExpanding = tvFHTLeftExpanding
            Version = '1.4.1.3'
          end
        end
        object Panel56: TPanel
          Left = 566
          Top = 31
          Width = 739
          Height = 608
          Align = alClient
          TabOrder = 2
          object Panel57: TPanel
            Left = 1
            Top = 1
            Width = 737
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            FullRepaint = False
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
                18000000000000060000C21E0000C21E00000000000000000000D8AB8ECD9570
                BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
                31A76132AB693CBC8661A8A8A893939371717167676766666666666665656564
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
                DFECD1BECD926AE2C5B1A3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
                F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FC3C3C3E1BDA6D9AB8D
                C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
                44C98D65E7CEBCFFFFFFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
                69696969696B6B6B6D6D6D6B6B6B7373738A8A8ACCCCCCFFFFFF}
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
            Left = 1
            Top = 34
            Width = 737
            Height = 573
            HTMLImages = ilTabs
            ItemHeight = 16
            SelectionNFColor = clSilver
            SelectionNFFontColor = clBlack
            Align = alClient
            Indent = 19
            TabOrder = 1
            OnExpanding = tvFHTRightExpanding
            Version = '1.4.1.3'
          end
        end
      end
    end
  end
  object puTable: TPopupMenu
    Left = 1247
    Top = 16
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
      object miCGradientToSelect1: TMenuItem
        Tag = 1
        Caption = '.'
        ImageIndex = 56
        OnClick = miCGradientToSelectClick
      end
      object miCGradientToSelect: TMenuItem
        Caption = '.'
        ImageIndex = 55
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
    Left = 1176
    Top = 16
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
    Left = 1111
    Top = 72
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
    Left = 1113
    Top = 23
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
    Left = 1129
    Top = 144
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
    Left = 1025
    Top = 129
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
  object puUsers: TPopupMenu
    Left = 1176
    Top = 72
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
  object puGenericTable: TPopupMenu
    Left = 1025
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
    Left = 848
    Top = 66
    Bitmap = {
      494C01011100A402940710001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003B97DB00EFFA
      FE00A1E9F90091E5F80081E1F70072DEF60063DAF50054D7F40047D3F30039D0
      F2002ECDF10026CBF000CAF2FB003B97DB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003C9DDB00F2FA
      FD00B3EDFA00A4E9F90095E6F80085E2F70076DEF60065DBF50057D7F40049D4
      F3003BD1F20030CEF100CCF2FB003B9BDB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1D1D100BDBDBD003BA3DB00F6FC
      FE00C8F2FC00B9EFFB00ACECFA009CE8F9008BE3F7007CE0F6006CDCF6005DD9
      F5004FD6F40044D3F300D0F3FC003BA2DB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A8A800F2F2F2003BA8DB00FEFF
      FF00F8FDFF00F6FDFF00F5FCFF00F3FCFE00D8F6FC0094E6F80085E3F70076DF
      F60068DBF5005CD8F400D7F4FC003BA7DB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7A7A700FBFBFB0039ADDB00E8F6
      FB0094D4EF0088CEEE0073C1E900C9E9F600F2FCFE00F3FCFE00F2FCFE00F0FC
      FE00EFFBFE00EEFBFE00FEFFFF003CAEDB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00FBFBFB0040AEDC00F1FA
      FD0094DEF50093DCF40081D5F2006ACAED006CCBEA0085D3EF0080D2EF007AD0
      EF0076CFEE0072CFEE00E9F7FB003EB2DC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAE00FDFDFD0041B4DC00F7FC
      FE008EE4F80091DEF5009FE0F500ACE1F600EFFBFE00F4FDFE00F3FCFE00F1FC
      FE00EFFBFE00EEFBFE00FAFDFF0058BCE0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2B2B200FFFFFF003CB5DB00FDFE
      FE00FEFFFF00FEFEFF00FDFEFF00FEFFFF00EAF7FB006EC8E5006FC9E4006FC9
      E4006FC9E4007DCFE70084D0E800BAE5F2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500F7F7F70059C2E00061C3
      E20063C4E30063C4E30063C4E30062C4E30056C0E000EDF8FC00F3FAFD00F3FA
      FD00F3FAFD00F3FAFD00F3FBFD00FCFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6B600FBFBFB00E0E0E000DEDE
      DE00D9D9D900CFCFCF00CFCFCF00D6D6D600D6D6D600D4D4D400D3D3D300D3D3
      D300F7F7F700B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00FDFDFD00E5E5E500E0E0
      E000E2E2E200E4E4E400FBFBFB00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFB
      FB00FEFEFE00C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00FEFEFE00FFFFFF00FEFE
      FE00FEFEFE00FFFFFF00F8F8F800CBCBCB00CCCCCC00CCCCCC00CCCCCC00D1D1
      D100D3D3D300E6E6E60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5C5C500C7C7C700C8C8C800C8C8
      C800C8C8C800C8C8C800C4C4C400F9F9F900FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FCFCFC00FEFEFE0000000000000000000000000000000000000000000000
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
      C800DEC8C800DEC8C800DEC8C800DAC4C400FFF9F900FFFBFB00FFFBFB00FFFB
      FB00FFFBFB00FFFCFC00FFFEFE000000000095959500F7F7F700E4E4E400E4E4
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
      E30063C4E30063C4E30062C4E30056C0E000EDF8FC00F3FAFD00F3FAFD00F3FA
      FD00F3FAFD00F3FBFD00FCFEFE00000000000000000000000000BBEEFE002DCC
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFB49300D59D7400D196
      6800CE926300CB8E5E00C98A5B00C7875600C3845200C3845200C3845200C384
      5200C3845200C3845200D0A17D00000000000000000000000000000000000000
      000000000000CBAB9B00A16A510090583E008E573E009A695200C5A99C000000
      00000000000000000000000000000000000087448000833F7E007F387D007C33
      7C00792E7B00C63A1300C6371200C4311200C02E1100C02A1000BF270F007C4F
      25007A4A210077461E0075421B00733F1900A2CAEE0076B2E6003E91DB00348C
      D900348CD900348CD900348CD900348CD900348CD900348CD900348CD900348B
      D900398FDA0085B9E900000000000000000000000000D7A17500F8F2ED00F7F0
      EA00F6EDE600F4EAE200F3E7DE00F1E4DB00F0E2D800F0E2D800F0E2D800F0E2
      D800F0E2D800F0E2D800C58B5E0000000000000000000000000000000000E0C8
      BD00A3664800B2805700D5B79300DBC3A600DAC3A600D2B49000AB7A52009260
      4800D8C6BD00000000000000000000000000413DF300999BFE009698FE009395
      FE009193FE00C9431500E0935D00DF8F5900DF8D5500DE8A5100C02E1100A2C9
      9E009DC6990098C3950094C09100276D2C004799DD00DEF1FA00A8DDF4009EDB
      F40096DAF3008ED8F30086D7F3007FD4F20079D3F20072D2F1006CD0F10069CF
      F100C2EAF8003F95DB00000000000000000000000000D9A47A00F9F3EE00EBD2
      BE0000000000EBD3BF00000000000000000000000000EAC7AD00000000000000
      000000000000F0E2D800C68C5F00000000000000000000000000E2CCBD00A35C
      3C00CBA77D00D8BB9F00C39C7700B68A6200B4866000BE967200D1B39700C5A3
      770089573E00D9C6BD0000000000000000004A47F5009EA0FE005B5EFE005659
      FE009597FE00CD4C1600E1976300DA804100D97D3B00DF8F5800C6351200A8CD
      A40077B0710070AB6A009AC496002E7633003B97DB00EFFAFE00A1E9F90091E5
      F80081E1F70072DEF60063DAF50054D7F40047D3F30039D0F2002ECDF10026CB
      F000CAF2FB003B97DB00000000000000000000000000DDA87E00F9F3EF00EBD0
      BA00EBD0BB00EBD0BB00EBD0BB00EBD0BB00EBD1BD00EACDB500EACDB500EACD
      B500EACDB500F0E2D800C68A5C00000000000000000000000000B4784A00CFAA
      8100DABCA200BE916600BA8C6200B7895F00B3845E00B1835D00B0835C00CDAA
      8D00C6A579009562490000000000000000005351F600A2A4FE006266FE005D61
      FE00999BFE00CF551800E39C6C00DC864A00DB834400E0945E00C63C1300AFD1
      AB0080B77A0079B27300A0C89C0035803C003C9DDB00F2FAFD00B3EDFA00A4E9
      F90095E6F80085E2F70076DEF60065DBF50057D7F40049D4F3003BD1F20030CE
      F100CCF2FB003B9BDB00000000000000000000000000DFAA8200F9F3EF00EACE
      B70000000000EBD0BB00000000000000000000000000EACFBA00FBF6F2000000
      000000000000F0E2D800C88D5F000000000000000000DCBC9B00BF915E00E0C2
      A800C5966C00C2916900E1CBB800FEFDFC00FFFFFE00EADCD000B4855E00B385
      5E00D4B59900AE7B5600C8A99B00000000005B5BF800A8AAFE006B6FFE006569
      FE009EA0FE00D1601A00E5A27400DE8C5300DD894D00E2996600C9451500B5D5
      B0008ABD830083B87D00A7CDA3003D8B44003BA3DB00F6FCFE00C8F2FC00B9EF
      FB00ACECFA009CE8F9008BE3F7007CE0F6006CDCF6005DD9F5004FD6F40044D3
      F300D0F3FC003BA2DB00000000000000000000000000E1AE8700FAF4F000EACB
      B200EACCB300EACCB300EACCB300EACCB300EACEB700E8C7AC00E8C7AC00E8C8
      B000E8C8AE00F0E2D800C48654000000000000000000C5905200DBBC9C00D5AD
      8900C7986C00C3956900C1936700EDDFD300FAF7F400BB8B6300B98A6300B88A
      6200C59D7800D2B89300A06A5200000000006364FA00ACAFFE007276FE006D71
      FE00A2A4FE00D6691E00E7A77B00E0925C00DF8F5600E49E6E00CD4E1600BAD9
      B500B7D6B100B3D3AE00AED1A90045964D003BA8DB00FEFFFF00F8FDFF00F6FD
      FF00F5FCFF00F3FCFE00D8F6FC0094E6F80085E3F70076DFF60068DBF5005CD8
      F400D7F4FC003188B9004D7CA300416F960000000000E3B18C00FAF6F100EAC9
      AE0000000000EAC9B000000000000000000000000000E8C7AC00000000000000
      000000000000F1E5DB00C68655000000000000000000C1833C00E3C7AF00D0A2
      7600C5996B00C4976A00C4966900EEE0D400FBF7F400BF906600BE8F6500BE8F
      6400BE926900DFC6AA0096563B00000000006A6CFC00B0B3FE00797EFE007579
      FE00A8AAFE00D8742A00E8AD8300E2986500E1956000E5A37600CF57180060BC
      6C005CB6670057B0610052A85C004DA1550039ADDB00E8F6FB0094D4EF0088CE
      EE0073C1E900C9E9F600F2FCFE00F3FCFE00F2FCFE00F0FCFE00EFFBFE00EEFB
      FE00B0C1D100578BB7008CB1D40046759F0000000000E5B48F00FAF6F200E9C6
      AA00E9C6AC00EAC7AC00E9C7AD00E9C9AE00E9C9B000E8C7AC00E9C9B000E8C8
      B000E8CCB500F2E7DE00C88A59000000000000000000C7894200E4C9B000D0A3
      7A00CC9D7100C79A6C00C5986B00FFFFFF00FFFFFE00C3966900C1946800C294
      6800C3986D00DFC5AB0099593B00000000007073FD00B4B7FE008185FE007C81
      FE00ACAFFE00D97B3900EAB28A00E49F6E00E39C6A00E7A87D00D1621A000000
      00000000000000000000000000000000000040AEDC00F1FAFD0094DEF50093DC
      F40081D5F2006ACAED006CCBEA0087C8DD0098B2B400C7AC9400CDAF9600C8A8
      8D00AB998E0096B1CB005D8CB800B2C3D20000000000E7B79400FBF7F400E9C3
      A60000000000E8C4A900000000000000000000000000E8C7AC00000000000000
      000000000000F7F1EB00CB8F5F000000000000000000D29E5C00E0BC9F00DBB3
      9300CFA07500CD9E7200CB9C7100DDBFA300DDBFA200C5996B00C5996B00C498
      6B00D1AB8500D8BA9700AC6E5200000000007478FE00B8BBFE00B6B9FE00B3B6
      FE00B0B3FE00DF844500ECB79200E6A57800E6A27300E9AD8500D66B1E000000
      00000000000000000000000000000000000041B4DC00F7FCFE008EE4F80091DE
      F5009FE0F500ACE1F600EFFBFE00C6B8AA00E2CDBC00F5E0CC00F7E0C700F8E2
      CB00F3D1B300A7998F00B4C5D5000000000000000000E9BA9800FBF7F400E9C3
      A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3A600E9C3
      A600E9C3A600FBF7F400CE9364000000000000000000E7C9A400CD9C6800E7CB
      B400D4A57A00D0A07700CF9E7400FBF8F500FBF8F500CB9E7100CB9D7100CDA1
      7700DFC0A500B98A5B00D2AE9B00000000007478FE007478FE007276FE006E71
      FD006A6CFC00E18D5200EDBB9900E9AC8100E7A87C00EAB38D00D8742C000000
      0000000000000000000000000000000000003CB5DB00FDFEFE00FEFFFF00FEFE
      FF00FDFEFF00FEFFFF00EAF7FB00C9AC9400F3E3D400F4DAC100F3D8BD00F3D8
      BD00F8E3CC00C4A48B00000000000000000000000000EBBD9B00FBF7F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBF7F400D1976A00000000000000000000000000D39A5A00D9B2
      8C00E6CAB300D6A97D00D1A57900E2C4A800E1C3A800D0A27600D1A47700DDBD
      A200D0AC8500B4764A0000000000000000000000000000000000000000000000
      000000000000E2925C00EEC1A000EAB18900E9AE8500EDB79400DB7C3A000000
      00000000000000000000000000000000000059C2E00061C3E20063C4E30063C4
      E30063C4E30062C4E30056C0E000C8A98D00F8EADC00F4DDC600F4DCC400F3D8
      BD00F8E2CD00CCAD9300000000000000000000000000ECBF9E00FBF7F4009CD5
      A50098D3A10094D09D0090CE98008BCB930087C98E0082C689007EC384007AC1
      800076BE7C00FBF7F400D49B6F00000000000000000000000000F1DDC500D192
      4F00D9B28C00E6CDB800E0BA9D00D7AB8500D6A98200D9B39100E1C2AB00D4AE
      8600B4713E00E6D0BD0000000000000000000000000000000000000000000000
      000000000000E69B6700F0C5A600ECB69100EBB38C00EEBC9B00DF8547000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAE9500F2E3D500F6E0CA00F5DEC600F5DE
      C500F7E5D200C5AA9400000000000000000000000000EFC6A800FBF7F400FBF7
      F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7F400FBF7
      F400FBF7F400FBF7F400D8A3780000000000000000000000000000000000F2DD
      C600D69C5B00D0A06A00E0BFA000E3C5AE00E3C5AE00DFBC9F00C8976200C38A
      4900E9D5BD000000000000000000000000000000000000000000000000000000
      000000000000E8A07000F2C8AC00F0C6A800F0C5A600EFC2A200E18E53000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C2B6A800DDC3AB00F4E6DA00F8ECDF00F2DD
      C900E3C9B200C4B4A600000000000000000000000000F7E1D200F1C8AC00EDC0
      9F00EBBE9D00EBBC9A00E9BA9600E7B79300E6B59000E4B28C00E2AF8800E0AC
      8400DDA98000DCA57D00E2B69600000000000000000000000000000000000000
      000000000000EACCA800D8A16500CF914E00CD904A00D19B5B00E4C6A1000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EAA67700E8A47400E8A06E00E69D6B00E4996500E2955E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFEFE00C2B7A800BFAE9700C9AB8F00CDAF
      9500BEAB9800F7FAFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00C000000000000000C000000000000000
      C000000000000000C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000300000000000000030000000000000003000000000000
      0003000000000000FFFF000000000000FFFFFFFFFFFFFC00FFFFF00FFFFFFC00
      C00380018001FC00C00380018001FC00C003800180010000C003800180010000
      C003C00380010000C003E00780010000C003F00F80010000C003F00F80010000
      C003F00F80010000C003F00F80010001C003F00F8001003FC003F00FFFFF003F
      FFFFF81FFFFF403FFFFFFFFFFFFF007FF80087E1FFFFFFFFF80080018001FE3F
      E000C0038001FC1FE000C0038001F80F800080018001E203800080018001E207
      800080018001C603800080018001840080008001800104008000800180018E00
      800080018001C001800300008001ED5F800300008001ED47800F00018001ED57
      800F80018001C447FFFFC7E3FFFFFFFFFFFFFFFFE187FFFF0000FFFFC183C003
      00008001C003C00300008001E007C00300008001F00FC00300008001F00FC003
      000080010000C003000080010000C003000080010000C00300008001300CC003
      00008001F00FC00300008001E007C00300008001C003C0070000FFFFC183C00F
      0000FFFFE187C01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8001F81F00000003
      8001E007000000038BB9C003000000038001C003000000038B99800100000003
      80018001000000008BB980010000000080018001001F00008BB98001001F0001
      80018001001F00039FF9C003F81F00038001C003F81FFE038001E007F81FFE03
      8001F81FF81FFE03FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object puFHSelectDate: TPopupMenu
    Left = 1249
    Top = 132
  end
  object ilToggle: TImageList
    Height = 9
    Width = 9
    Left = 795
    Top = 65
    Bitmap = {
      494C010102000400600709000900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000240000000900000001002000000000001005
      00000000000000000000000000000000000000000000C4C4C400F1F1F100FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A6A6A600E9E9E900FCFCFC00FCFCFC00FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A6A6A6009999
      9900E1E1E100FCFCFC00FCFCFC000000000000000000FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00EBEBEB00FCFCFC00FCFCFC00FCFCFC00FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A6A6A600A6A6A6008E8E8E00D7D7D700FCFCFC000000
      000000000000FCFCFC00FCFCFC00FCFCFC00D7D7D70080808000D7D7D700FCFC
      FC00FCFCFC00FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A6A6A600A6A6
      A600A6A6A60080808000EBEBEB000000000000000000FCFCFC00FCFCFC00E1E1
      E1008E8E8E00A6A6A6008E8E8E00E1E1E100FCFCFC00FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A6A6A600A6A6A6008E8E8E00D7D7D700FCFCFC000000
      000000000000FCFCFC00E9E9E90099999900A6A6A600A6A6A600A6A6A6009999
      9900E9E9E900FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A6A6A6009999
      9900E1E1E100FCFCFC00FCFCFC000000000000000000F1F1F100A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600F1F1F100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A6A6A600E9E9E900FCFCFC00FCFCFC00FCFCFC000000
      000000000000C4C4C400A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500C4C4C40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4C4C400F1F1F100FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E00000028000000240000000900000001000100
      00000000480000000000000000000000000000000000000000000000FFFFFF00
      81FFC0000000000081FFC0000000000081800000000000008180000000000000
      8180000000000000818000000000000081800000000000008180000000000000
      81FFC0000000000000000000000000000000000000000000000000000000}
  end
  object puFHQuickSearch: TPopupMenu
    Left = 937
    Top = 24
  end
  object puFHFolderConfig: TPopupMenu
    Left = 1249
    Top = 78
    object miFHFCO: TMenuItem
      Caption = '.'
      Enabled = False
      GroupIndex = 1
    end
    object miFHFCOShowAll: TMenuItem
      AutoCheck = True
      Caption = '.'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = cbFHGraphSizeDirListClick
    end
    object MenuItem3: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = '>1%'
      GroupIndex = 1
      RadioItem = True
      OnClick = cbFHGraphSizeDirListClick
    end
    object MenuItem4: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = '>2%'
      GroupIndex = 1
      RadioItem = True
      OnClick = cbFHGraphSizeDirListClick
    end
    object MenuItem5: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = '>3%'
      GroupIndex = 1
      RadioItem = True
      OnClick = cbFHGraphSizeDirListClick
    end
    object MenuItem6: TMenuItem
      Tag = 4
      AutoCheck = True
      Caption = '>4%'
      GroupIndex = 1
      RadioItem = True
      OnClick = cbFHGraphSizeDirListClick
    end
    object MenuItem7: TMenuItem
      Tag = 5
      AutoCheck = True
      Caption = '>5%'
      GroupIndex = 1
      RadioItem = True
      OnClick = cbFHGraphSizeDirListClick
    end
    object MenuItem8: TMenuItem
      Tag = 6
      AutoCheck = True
      Caption = '>10%'
      GroupIndex = 1
      RadioItem = True
      OnClick = cbFHGraphSizeDirListClick
    end
    object MenuItem9: TMenuItem
      Tag = 7
      AutoCheck = True
      Caption = '>15%'
      GroupIndex = 1
      RadioItem = True
      OnClick = cbFHGraphSizeDirListClick
    end
  end
end
