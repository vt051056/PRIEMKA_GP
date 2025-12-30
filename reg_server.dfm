object FReg_serv: TFReg_serv
  Left = 255
  Top = 226
  Width = 366
  Height = 202
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' SQL '#1089#1077#1088#1074#1077#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 18
    Width = 61
    Height = 13
    Caption = 'SQL '#1057#1077#1088#1074#1077#1088
  end
  object Label2: TLabel
    Left = 12
    Top = 46
    Width = 65
    Height = 13
    Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
  end
  object Label3: TLabel
    Left = 12
    Top = 74
    Width = 73
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  end
  object Label4: TLabel
    Left = 12
    Top = 102
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object E_sqlsrv: TEdit
    Left = 98
    Top = 14
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object E_database: TEdit
    Left = 98
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object E_User: TEdit
    Left = 98
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 94
    Top = 134
    Width = 75
    Height = 25
    Caption = #1043#1086#1090#1086#1074#1086
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 134
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 5
    Kind = bkCancel
  end
  object E_Passw: TEdit
    Left = 98
    Top = 96
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object BBSetting: TBitBtn
    Left = 231
    Top = 12
    Width = 25
    Height = 25
    Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BBSettingClick
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
  end
end
