object FormMain: TFormMain
  Left = 468
  Top = 102
  Width = 638
  Height = 587
  Caption = 'CRC'#26657#39564#30721#29983#25104#22120' V1.2'
  Color = clBtnFace
  Constraints.MinHeight = 587
  Constraints.MinWidth = 636
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 630
    Height = 553
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ImageIndex = 1
      TabVisible = False
      DesignSize = (
        622
        543)
      object Label19: TLabel
        Left = 12
        Top = 527
        Width = 301
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'Author: tangqishi   EMail: 619325079@qq.com'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Monospac821 BT'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 9
        Top = 510
        Width = 336
        Height = 13
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = #27880#24847#65306'ModBus'#30340'CRC'#22312#23454#38469#20256#36865#26102#65292#20302#20301#22312#21069#65292#39640#20301#22312#21518#12290
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Memo1: TMemo
        Left = 8
        Top = 56
        Width = 303
        Height = 408
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Monospac821 BT'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Button1: TButton
        Left = 235
        Top = 469
        Width = 75
        Height = 29
        Anchors = [akRight, akBottom]
        Caption = #35745#31639'CRC'
        TabOrder = 1
        OnClick = Button1Click
      end
      object GroupBox1: TGroupBox
        Left = 323
        Top = 52
        Width = 295
        Height = 417
        Anchors = [akTop, akRight]
        Caption = 'CRC '#21464#20307
        TabOrder = 2
        object Panel1: TPanel
          Left = 12
          Top = 85
          Width = 278
          Height = 29
          Hint = #29983#25104#22810#39033#24335#65306'g(x)=x^16+x^15+x^2+1'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Top = 6
            Width = 153
            Height = 17
            AutoSize = False
            Caption = 'CRC-16'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit1: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel2: TPanel
          Left = 12
          Top = 117
          Width = 278
          Height = 29
          Hint = #29983#25104#22810#39033#24335#65306'g(x)=x^16+x^15+x^2+1'
          Color = clActiveBorder
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object Label3: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-16 (Modbus)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit2: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Color = clScrollBar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel3: TPanel
          Left = 12
          Top = 150
          Width = 278
          Height = 29
          TabOrder = 2
          object Label20: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-16 (Sick)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit3: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel4: TPanel
          Left = 12
          Top = 183
          Width = 278
          Height = 29
          Hint = #29983#25104#22810#39033#24335#65306'g(x)=x^16+x^12+x^5+1'
          Color = clActiveBorder
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          object Label21: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-CCITT (XModem)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit4: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Color = clScrollBar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel5: TPanel
          Left = 12
          Top = 215
          Width = 278
          Height = 29
          Hint = #29983#25104#22810#39033#24335#65306'g(x)=x^16+x^12+x^5+1'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          object Label22: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-CCITT (0xFFFF)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit5: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel6: TPanel
          Left = 12
          Top = 248
          Width = 278
          Height = 29
          Hint = #29983#25104#22810#39033#24335#65306'g(x)=x^16+x^12+x^5+1'
          Color = clActiveBorder
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          object Label23: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-CCITT (0x1D0F)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit6: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Color = clScrollBar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel7: TPanel
          Left = 12
          Top = 281
          Width = 278
          Height = 29
          TabOrder = 6
          object Label24: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-CCITT (Kermit)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit7: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel8: TPanel
          Left = 12
          Top = 313
          Width = 278
          Height = 29
          Hint = #29983#25104#22810#39033#24335#65306'G(x) = x16 + x13 + x12 + x11 + x10 + x8 + x6 + x5 + x2 + 1'
          Color = clActiveBorder
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          object Label25: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-DNP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit8: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Color = clScrollBar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel9: TPanel
          Left = 12
          Top = 379
          Width = 278
          Height = 29
          Hint = 
            #29983#25104#22810#39033#24335#65306'G(X) = x32 + x26 + x23 + x22 + x16 + x12 + x11 + x10 + x8 ' +
            '+ x7 + x5 + x4 + x2 + x + 1'
          Color = clActiveBorder
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          object Label26: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-32'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit9: TEdit
            Left = 84
            Top = 3
            Width = 189
            Height = 24
            Color = clActiveBorder
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel12: TPanel
          Left = 12
          Top = 346
          Width = 278
          Height = 29
          Hint = #31119#24314#30465#33021#28304#35745#37327#25968#25454#37319#38598#31995#32479#25968#25454#20256#36755#21327#35758' DB 35/987-2010 '#20013#32422#23450'CRC'#35745#31639#26041#27861
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          object Label1: TLabel
            Left = 8
            Top = 6
            Width = 141
            Height = 17
            AutoSize = False
            Caption = 'CRC-DB35/987'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit12: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel11: TPanel
          Left = 12
          Top = 20
          Width = 278
          Height = 29
          Hint = #29983#25104#22810#39033#24335#65306'g(x)=x^16+x^15+x^2+1'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          object Label6: TLabel
            Left = 8
            Top = 6
            Width = 113
            Height = 17
            AutoSize = False
            Caption = 'CRC16'#23450#20041
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit10: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel10: TPanel
          Left = 12
          Top = 52
          Width = 278
          Height = 29
          Hint = #29983#25104#22810#39033#24335#65306'g(x)=x^16+x^12+x^5+1'
          Color = clActiveBorder
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          object Label4: TLabel
            Left = 8
            Top = 6
            Width = 109
            Height = 17
            AutoSize = False
            Caption = 'CRC-CCITT'#23450#20041
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Monospac821 BT'
            Font.Style = []
            ParentFont = False
          end
          object Edit11: TEdit
            Left = 172
            Top = 3
            Width = 100
            Height = 24
            Color = clActiveBorder
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -14
            Font.Name = 'Monospac821 BT'
            Font.Style = [fsBold]
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object rg_DataType: TRadioGroup
        Left = 8
        Top = 4
        Width = 245
        Height = 41
        Caption = #25968#25454#26684#24335
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'ASCII'
          'Hex')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object Button2: TButton
        Left = 535
        Top = 13
        Width = 79
        Height = 29
        Anchors = [akTop, akRight]
        Caption = #35745#31639#22120
        TabOrder = 4
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 151
        Top = 469
        Width = 75
        Height = 29
        Hint = 'http://www.lammertbies.nl/comm/info/crc-calculation.html'
        Anchors = [akRight, akBottom]
        Caption = #22312#32447#35745#31639
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 8
        Top = 469
        Width = 45
        Height = 29
        Anchors = [akLeft, akBottom]
        Caption = #28165#31354
        TabOrder = 6
        OnClick = Button4Click
      end
      object Panel13: TPanel
        Left = 320
        Top = 472
        Width = 297
        Height = 69
        Anchors = [akRight, akBottom]
        TabOrder = 7
        object rg_type: TRadioGroup
          Left = 8
          Top = 0
          Width = 173
          Height = 33
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'ASCII'
            'Hex'
            'Dec')
          TabOrder = 0
        end
        object edt_in: TEdit
          Left = 184
          Top = 7
          Width = 49
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -14
          Font.Name = 'Monospac821 BT'
          Font.Style = [fsBold]
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 3
          ParentFont = False
          TabOrder = 1
        end
        object edt_out: TEdit
          Left = 8
          Top = 39
          Width = 225
          Height = 24
          Color = clActiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -14
          Font.Name = 'Monospac821 BT'
          Font.Style = [fsBold]
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object btn_Lookup: TButton
          Left = 240
          Top = 8
          Width = 49
          Height = 25
          Caption = #26597#35810
          TabOrder = 3
          OnClick = btn_LookupClick
        end
        object btn_allChar: TButton
          Left = 240
          Top = 38
          Width = 49
          Height = 25
          Caption = #20840#37096
          TabOrder = 4
          OnClick = btn_allCharClick
        end
      end
    end
  end
end
