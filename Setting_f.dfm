object FSetting: TFSetting
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1077#1089#1086#1074
  ClientHeight = 363
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 256
    Width = 150
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
  end
  object L_Gr_tov: TLabel
    Left = 224
    Top = 286
    Width = 46
    Height = 13
    Caption = 'L_Gr_Tov'
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 24
    Width = 399
    Height = 153
    Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1077' '#1074#1077#1089#1086#1074
    TabOrder = 0
    object Label6: TLabel
      Left = 106
      Top = 21
      Width = 86
      Height = 13
      Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1074#1077#1089#1086#1074
    end
    object Label7: TLabel
      Left = 240
      Top = 64
      Width = 57
      Height = 13
      Caption = #1055#1086#1088#1090' '#1074#1077#1089#1086#1074
    end
    object Label8: TLabel
      Left = 8
      Top = 64
      Width = 64
      Height = 13
      Caption = #1052#1072#1088#1082#1072' '#1074#1077#1089#1086#1074
    end
    object Label9: TLabel
      Left = 8
      Top = 88
      Width = 48
      Height = 13
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100
    end
    object Label10: TLabel
      Left = 173
      Top = 91
      Width = 60
      Height = 13
      Caption = #1041#1080#1090' '#1076#1072#1085#1085#1099#1093
    end
    object Label11: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = #1057#1090#1086#1087' '#1073#1080#1090
    end
    object Label12: TLabel
      Left = 175
      Top = 115
      Width = 99
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1095#1077#1090#1085#1086#1089#1090#1080
    end
    object Edit1: TEdit
      Left = 8
      Top = 18
      Width = 87
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = #1053#1077#1090
    end
    object CB_ComPort: TComboBox
      Left = 312
      Top = 60
      Width = 73
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8')
    end
    object BBSetting: TBitBtn
      Left = 366
      Top = 18
      Width = 25
      Height = 25
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BBSettingClick
    end
    object CB_Brand_Weight: TComboBox
      Left = 89
      Top = 60
      Width = 144
      Height = 21
      TabOrder = 3
      Text = 'CAS DB-H'
      Items.Strings = (
        'CAS DB-H'
        'BH-150-1D'
        'XK3190-A12ESS'
        'CAS CI-2001A')
    end
    object CB_ComPortBaudRate: TComboBox
      Left = 89
      Top = 86
      Width = 73
      Height = 21
      ItemIndex = 6
      TabOrder = 4
      Text = '9600'
      Items.Strings = (
        '110'
        '300'
        '600'
        '1200'
        '2400'
        '4800'
        '9600'
        '14400'
        '19200'
        '38400'
        '56000'
        '57600'
        '115200')
    end
    object CB_ComPortDataBits: TComboBox
      Left = 237
      Top = 86
      Width = 73
      Height = 21
      ItemIndex = 3
      TabOrder = 5
      Text = '8'
      Items.Strings = (
        '5'
        '6'
        '7'
        '8')
    end
    object CB_ComPortStopBits: TComboBox
      Left = 90
      Top = 112
      Width = 73
      Height = 21
      TabOrder = 6
      Text = '1'
      Items.Strings = (
        '1'
        '1.5'
        '2')
    end
    object CB_ComPortParity: TComboBox
      Left = 281
      Top = 111
      Width = 73
      Height = 21
      ItemIndex = 0
      TabOrder = 7
      Text = 'ptNONE'
      Items.Strings = (
        'ptNONE'
        'ptODD'
        'ptEVE'
        'ptMARK'
        'ptSPACE')
    end
  end
  object BitBtn1: TBitBtn
    Left = 230
    Top = 209
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
  end
  object RG_IsGotov: TRadioGroup
    Left = 8
    Top = 199
    Width = 179
    Height = 92
    Caption = #1042#1080#1076' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
    Ctl3D = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'System'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #1057#1099#1088#1086#1081' '#1092#1072#1088#1096
      #1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
      #1048#1085#1074#1077#1085#1090'.'#1075#1086#1090'.'#1087#1088#1086#1076'.')
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
  end
  object BBGrTovSel: TBitBtn
    Left = 384
    Top = 251
    Width = 87
    Height = 25
    Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072
    TabOrder = 3
    OnClick = BBGrTovSelClick
  end
end
