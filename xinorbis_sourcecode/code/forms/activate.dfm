object frmActivate: TfrmActivate
  Left = 566
  Top = 345
  BorderStyle = bsDialog
  Caption = 'Activate Xinorbis 8'
  ClientHeight = 337
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 321
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 112
      Width = 79
      Height = 13
      Caption = 'Email address'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 160
      Width = 83
      Height = 13
      Caption = 'Activation Key'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lHow: TLabel
      Left = 8
      Top = 16
      Width = 297
      Height = 41
      AutoSize = False
      Caption = 'lHow'
      WordWrap = True
    end
    object lTrial: TLabel
      Left = 3
      Top = 297
      Width = 3
      Height = 13
      Caption = '.'
    end
    object Label3: TLabel
      Left = 16
      Top = 69
      Width = 33
      Height = 13
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eEmail: TEdit
      Left = 16
      Top = 128
      Width = 281
      Height = 21
      TabOrder = 0
    end
    object eActivationCode: TEdit
      Left = 16
      Top = 176
      Width = 281
      Height = 21
      TabOrder = 1
      OnChange = eActivationCodeChange
    end
    object bOK: TBitBtn
      Left = 126
      Top = 220
      Width = 83
      Height = 25
      Caption = 'OK'
      Enabled = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE0EEE08FC0913B8D3F257A292577293B853F8FB991E0EBE0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBB7B7B77F7F7F6A
        6A6A686868787878B2B2B2E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB5D9B7318F3542A05287CA9A9BD3AB9BD2AB83C7963D974C307C34B5D0
        B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D37F7F7F8F8F8FBEBEBEC9
        C9C9C8C8C8BABABA8686866F6F6FCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B5DBBA258F2A6DBE83A8DBB587CC9866BC7D64BA7C86CB98A5D9B466B77D2472
        27B5D1B6FFFFFFFFFFFFFFFFFFFFFFFFD5D5D57D7D7DAFAFAFD1D1D1BFBFBFAD
        ADADABABABBEBEBECFCFCFA9A9A9656565CCCCCCFFFFFFFFFFFFFFFFFFE1F2E4
        33A14472C287A8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B369B8
        7F317F35E1ECE1FFFFFFFFFFFFEFEFEF909090B3B3B3D0D0D0ABABABA9A9A9A7
        A7A7A4A4A4A4A4A4A7A7A7CFCFCFAAAAAA727272EAEAEAFFFFFFFFFFFF90D29F
        4CB064AADDB464C1795FBE7175C585D4ECD98ACD9956B66C58B56E5CB774A6DA
        B4419B4E8EBC90FFFFFFFFFFFFC8C8C89F9F9FD2D2D2B0B0B0ACACACB5B5B5E7
        E7E7C0C0C0A5A5A5A4A4A4A7A7A7D0D0D08A8A8AB4B4B4FFFFFFFFFFFF3FB55D
        91D29F8DD49A64C37479C987F2FAF4FFFFFFFDFEFD86CB9657B76D5BB97285CC
        9787C79A3B8B3FFFFFFFFFFFFFA3A3A3C5C5C5C6C6C6B1B1B1B9B9B9F9F9F9FF
        FFFFFEFEFEBEBEBEA6A6A6A8A8A8BFBFBFBBBBBB7D7D7DFFFFFFFFFFFF27B049
        A6DCAF70CA7F73CA80F0F9F1FFFFFFEBF7EDFFFFFFFBFDFC88CD965BB97167BE
        7DA0D7AF237F26FFFFFFFFFFFF9C9C9CD1D1D1B8B8B8B8B8B8F7F7F7FFFFFFF5
        F5F5FFFFFFFDFDFDBFBFBFA8A8A8AEAEAECDCDCD6E6E6EFFFFFFFFFFFF2EB751
        A7DDB172CC8066C773B0E1B7D2EED663C170B8E3BFFFFFFFFBFDFC8CD09969C1
        7EA1D7AE238426FFFFFFFFFFFFA2A2A2D2D2D2BABABAB4B4B4D6D6D6E7E7E7AF
        AFAFDADADAFFFFFFFDFDFDC2C2C2B1B1B1CCCCCC737373FFFFFFFFFFFF4BC56C
        95D7A191D79B69C97664C66F61C46E61C36F61C26FB9E4C0FFFFFFE3F4E68BD1
        998BCE9D3C993FFFFFFFFFFFFFB2B2B2C9C9C9C8C8C8B6B6B6B3B3B3B1B1B1B0
        B0B0AFAFAFDBDBDBFFFFFFF0F0F0C3C3C3C2C2C2898989FFFFFFFFFFFF9BDFAD
        57BF70AFE1B76DCC7A68C87265C77063C56E62C46E63C471B6E3BE6FC77EACDF
        B548A95E8FC894FFFFFFFFFFFFD4D4D4ADADADD6D6D6B9B9B9B5B5B5B4B4B4B2
        B2B2B1B1B1B1B1B1D9D9D9B6B6B6D4D4D4989898BEBEBEFFFFFFFFFFFFE5F7E9
        49C5667FCE90AEE1B56DCC7A6ACA7668C87268C87468C8756BC979ACDFB476C4
        8933A142E1F1E3FFFFFFFFFFFFF4F4F4B1B1B1BFBFBFD6D6D6B9B9B9B7B7B7B5
        B5B5B5B5B5B5B5B5B7B7B7D4D4D4B5B5B58F8F8FEEEEEEFFFFFFFFFFFFFFFFFF
        BFECCB3DC35C7FCE90AFE1B792D89D77CE8377CE8392D89DAEE1B578C88B27A1
        3BB5DFBEFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5AEAEAEBFBFBFD6D6D6CACACABC
        BCBCBCBCBCCACACAD6D6D6B9B9B98E8E8ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC0EDCB4AC86959C27496D7A3A5DCAEA5DCAE95D6A150B96A35B355B6E3
        C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6B4B4B4B0B0B0CACACAD0
        D0D0D0D0D0C9C9C9A6A6A6A0A0A0DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE5F8E99FE3B055CB723BC05C37BE5A49C36A97DCAAE1F5E7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5D8D8D8B8B8B8AB
        ABABA9A9A9B0B0B0D1D1D1F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = bOKClick
    end
    object bCancel: TBitBtn
      Left = 215
      Top = 221
      Width = 83
      Height = 25
      Cancel = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1313F20000F10000F100
        00F10000EF0000EF0000ED1212EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF1313F61A20F53C4CF93A49F83847F83545F83443F73242F7141BF11717
        EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1313F81D23F94453FA2429F91212F70F
        0FF60C0CF50909F5161BF53343F7141BF11717EFFFFFFFFFFFFFFFFFFF1313F9
        1F25FA4A58FB4247FBC9C9FD3B3BF91313F71010F63333F7C5C5FD3035F73444
        F7141BF21717EFFFFFFFFFFFFF0000FB4F5DFD3237FBCBCBFEF2F2FFEBEBFE3B
        3BF93939F8EAEAFEF1F1FEC5C5FD181DF63343F70000EFFFFFFFFFFFFF0000FD
        525FFD2828FC4747FCECECFFF2F2FFECECFFECECFEF1F1FFEAEAFE3434F70B0B
        F53545F80000EFFFFFFFFFFFFF0000FD5562FE2C2CFD2929FC4848FCEDEDFFF2
        F2FFF2F2FFECECFE3A3AF91212F70F0FF63848F80000F1FFFFFFFFFFFF0000FD
        5764FE3030FD2D2DFD4B4BFCEDEDFFF2F2FFF2F2FFECECFF3D3DF91616F81313
        F73C4BF80000F1FFFFFFFFFFFF0000FF5A67FE3333FE5050FDEDEDFFF3F3FFED
        EDFFEDEDFFF2F2FFECECFE3E3EFA1717F83F4EF90000F1FFFFFFFFFFFF0000FF
        5B68FF4347FECFCFFFF3F3FFEDEDFF4C4CFC4A4AFCECECFFF2F2FFCACAFE2A2F
        FA4251FA0000F3FFFFFFFFFFFF1414FF262BFF5D6AFF585BFFCFCFFF5252FE2F
        2FFD2C2CFD4B4BFCCCCCFE484CFB4957FB1D23F91414F6FFFFFFFFFFFFFFFFFF
        1414FF262BFF5D6AFF4347FF3434FE3232FE3030FD2D2DFD383CFC4F5DFC1F25
        FA1414F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1414FF262BFF5C69FF5B68FF5A
        67FE5865FE5663FE5461FE2227FC0D0DFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF1313FF0000FF0000FF0000FF0000FD0000FD0000FD1313FDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ModalResult = 2
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 220
      Width = 83
      Height = 25
      Caption = 'Buy'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0207DB7080ED7DB7FB7EBCFC96E2F999E6F97FCF967C
        CC88D2BAA3D6B8A2B17950FF00FFFF00FFFF00FFFF00FFFF00FF060BDC6E7EEC
        3887F53797FA57C8F761D8F641BC7C33B147A7996AD7BAA5BA8763FF00FFFF00
        FFFF00FFFF00FFFF00FF151ADE6877EB3D7CF23797FA4DB9F861D8F64EC7AD34
        B24A76A35BD6BAA4CAA488B17950FF00FFFF00FFFF00FFFF00FF3C40E35663E9
        7695F23795F940A5F95ED4F65CD4E33BB76433B147A7986AD7BAA5BF9170B179
        50FF00FFFF00FFFF00FF9B9DF10207DB7084EE3588F63797FA53C1F761D8F64D
        C6AB34B24C54AA51BCA380D7BAA5CAA488BA8763B17950FF00FFFF00FF161BDE
        6776EB789DF43795FA41A7F95CD0F661D8F544BF8B33B14854AA51A7986AD6BA
        A4D7BAA5D6B8A2FF00FFFF00FF686BEA0106DB7286EE3481F43797FA4AB4F860
        D6F65ED5EA44BF8B34B24C33B14776A35BA7996AD2BAA3FF00FFFF00FFFF00FF
        1D21DF5865E97694F2358DF83797FA4EBAF860D6F661D8F54DC6AB3BB76434B2
        4A33B1477CCC88FF00FFFF00FFFF00FFA3A5F2090EDC6D7DEC779BF33691F937
        97FA4AB4F85CD0F661D8F65CD4E34EC7AD41BC7C7FCF96FF00FFFF00FFFF00FF
        FF00FF6265E9050ADC6F7FED779BF3358DF83797FA41A7F953C1F75ED4F661D8
        F661D8F699E6F9FF00FFFF00FFFF00FFFF00FFFF00FF5457E7050ADC6D7DEC76
        94F23280F43795FA3797FA40A5F94DB9F857C8F796E2F9FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF6265E9090EDC5865E97387EE4679F03588F63795F93797
        FA3797FA7EBCFCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3A5F21D
        21DF2E38E26776EB7084EE7695F23D7CF23887F57DB7FBFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686BEA161BDE0207DB5663E96877
        EB6E7EEC7080EDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF9B9DF13C40E3151ADE060BDC0207DBFF00FF}
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 14
      Top = 252
      Width = 283
      Height = 25
      Cancel = True
      Caption = 'Send me your comments!'
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object eName: TEdit
      Left = 16
      Top = 85
      Width = 281
      Height = 21
      TabOrder = 6
    end
  end
end
