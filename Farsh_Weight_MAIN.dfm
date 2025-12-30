object Farsh_Weight_AppForm: TFarsh_Weight_AppForm
  Left = 88
  Top = 0
  Caption = #1059#1095#1077#1090' '#1092#1072#1088#1096#1072
  ClientHeight = 691
  ClientWidth = 1532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'System'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object StatusBar: TStatusBar
    Left = 0
    Top = 672
    Width = 1532
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoHint = True
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 672
    Align = alLeft
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 503
      Height = 176
      Align = alTop
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1085#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object DBText1: TDBText
        Left = 295
        Top = 26
        Width = 65
        Height = 17
        DataField = 'time_p'
        DataSource = DM1.DSQFARSH_DAY
      end
      object Label7: TLabel
        Left = 182
        Top = 102
        Width = 42
        Height = 13
        Caption = #1043#1088#1091#1087#1087#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LGrup: TLabel
        Left = 232
        Top = 102
        Width = 179
        Height = 13
        AutoSize = False
        Caption = #1043#1088#1091#1087#1087#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object L_Doc_Inv: TLabel
        Left = 6
        Top = 154
        Width = 83
        Height = 20
        Caption = 'L_Doc_Inv'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'System'
        Font.Style = []
        ParentFont = False
      end
      object DateTimePicker1: TDateTimePicker
        Left = 151
        Top = 22
        Width = 130
        Height = 28
        Date = 40308.000000000000000000
        Time = 40308.000000000000000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'System'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = DateTimePicker1Change
      end
      object DBNavigator1: TDBNavigator
        Left = 3
        Top = 19
        Width = 104
        Height = 36
        DataSource = DM1.DSQFARSH_DAY
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = (
          #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
          #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1057#1086#1093#1088#1072#1085#1080#1090#1100
          #1057#1073#1088#1086#1089
          #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
        TabOrder = 1
      end
      object BBRefresh_FarshDay: TBitBtn
        Left = 113
        Top = 20
        Width = 32
        Height = 34
        Hint = #1054#1089#1074#1077#1078#1080#1090#1100
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF33339993707399933333773337F3777FF3399933000339
          9933377333777F3377F3399333707333993337733337333337FF993333333333
          399377F33333F333377F993333303333399377F33337FF333373993333707333
          333377F333777F333333993333101333333377F333777F3FFFFF993333000399
          999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
          99933773FF777F3F777F339993707399999333773F373F77777F333999999999
          3393333777333777337333333999993333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BBRefresh_FarshDayClick
      end
      object RG_IsGotov: TRadioGroup
        Left = 3
        Top = 54
        Width = 171
        Height = 89
        Caption = #1042#1080#1076' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
        Ctl3D = True
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'System'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1057#1099#1088#1086#1081' '#1092#1072#1088#1096
          #1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
          #1048#1085#1074#1077#1085#1090'.'#1075#1086#1090'.'#1087#1088#1086#1076)
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnClick = RG_IsGotovClick
      end
      object BBRep1: TBitBtn
        Left = 385
        Top = 22
        Width = 32
        Height = 30
        Hint = #1054#1090#1095#1077#1090
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BBRep1Click
      end
      object GroupBox9: TGroupBox
        Left = 180
        Top = 50
        Width = 233
        Height = 51
        Caption = #1055#1086#1080#1089#1082
        TabOrder = 5
        object Edit1: TEdit
          Left = 6
          Top = 18
          Width = 98
          Height = 28
          Hint = #1055#1086#1080#1089#1082' - F1'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnChange = Edit1Change
        end
        object BBSearchDown: TBitBtn
          Left = 110
          Top = 18
          Width = 25
          Height = 25
          Hint = #1055#1086#1080#1089#1082' '#1074#1085#1080#1079
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
            33333333373F33333333333330B03333333333337F7F33333333333330F03333
            333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
            333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
            333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
            3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
            33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
            33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
            03333337777777F7F33333330000000003333337777777773333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BBSearchDownClick
        end
        object BBSearchUp: TBitBtn
          Left = 136
          Top = 18
          Width = 25
          Height = 25
          Hint = #1055#1086#1080#1089#1082' '#1074#1074#1077#1088#1093
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            333333777777777F33333330B00000003333337F7777777F3333333000000000
            333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
            333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
            03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
            03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
            3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
            333333333377F7F33333333333330F03333333333337F7F33333333333330B03
            3333333333373733333333333333303333333333333373333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BBSearchUpClick
        end
        object CheckBox2: TCheckBox
          Left = 164
          Top = 24
          Width = 67
          Height = 17
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1085#1090#1077#1082#1089#1090#1091
          Caption = #1082#1086#1085#1090#1077#1082#1089#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = CheckBox1Click
        end
      end
      object BBGrTovSel: TBitBtn
        Left = 186
        Top = 120
        Width = 27
        Height = 25
        Hint = #1042#1099#1073#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
          00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
          00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
          00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
          03FF33337FFF77777333333300000333333F3333777773333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = BBGrTovSelClick
      end
      object BBAllGrTovSel: TBitBtn
        Left = 216
        Top = 120
        Width = 27
        Height = 25
        Hint = #1042#1099#1073#1086#1088' '#1074#1089#1077#1093' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
          000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
          99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
          0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
          FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
          0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
          000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
          00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
          00FF33337FFF7FF77733333300000000033F3333777777777333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = BBAllGrTovSelClick
      end
      object BBSet_Doc_Inv: TBitBtn
        Left = 254
        Top = 121
        Width = 106
        Height = 25
        Hint = #1042#1099#1073#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
        Caption = #1044#1086#1082'.'#1080#1085#1074#1077#1085#1090' '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = BBSet_Doc_InvClick
      end
      object BBPrepOstatki: TBitBtn
        Left = 375
        Top = 121
        Width = 106
        Height = 25
        Hint = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1099#1077' '#1086#1089#1090#1072#1090#1082#1080
        Caption = #1054#1089#1090#1072#1090#1082#1080
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = BBPrepOstatkiClick
      end
      object CB_IS_BASETOV: TCheckBox
        Left = 366
        Top = 151
        Width = 132
        Height = 17
        Caption = #1041#1072#1079#1086#1074#1072#1103' '#1087#1088
        TabOrder = 10
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 177
      Width = 503
      Height = 494
      Align = alClient
      DataSource = DM1.DSQFARSH_DAY
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'System'
      TitleFont.Style = []
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = [toPressAndHold, toSmoothScrolling]
      OnDrawDataCell = DBGrid1DrawDataCell
    end
  end
  object Panel2: TPanel
    Left = 505
    Top = 0
    Width = 1027
    Height = 672
    Align = alClient
    TabOrder = 2
    object Panel_In_scales: TPanel
      Left = 1
      Top = 1
      Width = 1025
      Height = 670
      Align = alClient
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 1023
        Height = 328
        Align = alTop
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 1
          Top = 1
          Width = 1021
          Height = 326
          Align = alClient
          Caption = #1053#1072' '#1074#1077#1089#1072#1093
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'System'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Panel5: TPanel
            Left = 2
            Top = 22
            Width = 1017
            Height = 302
            Align = alClient
            ParentBackground = False
            TabOrder = 0
            object Label1: TLabel
              Left = 6
              Top = 12
              Width = 90
              Height = 20
              Caption = #1054#1073#1097#1080#1081' '#1074#1077#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'System'
              Font.Style = []
              ParentFont = False
            end
            object L_ConditionWeight: TLabel
              Left = 12
              Top = 73
              Width = 150
              Height = 20
              Caption = 'L_ConditionWeight'
            end
            object E_Weight: TEdit
              Left = 98
              Top = 9
              Width = 146
              Height = 28
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'System'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = 'E_Weight'
            end
            object BBSave: TBitBtn
              Left = 250
              Top = 2
              Width = 105
              Height = 52
              Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1079#1074#1077#1096#1077#1085#1085#1091#1102' '#1087#1086#1088#1094#1080#1102' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003C3333339333
                337437FFF3337F3333F73CCC33339333344437773F337F33377733CCC3339337
                4447337F73FF7F3F337F33CCCCC3934444433373F7737F773373333CCCCC9444
                44733337F337773337F3333CCCCC9444443333373F337F3337333333CCCC9444
                473333337F337F337F333333CCCC94444333333373F37F33733333333CCC9444
                7333333337F37F37F33333333CCC944433333333373F7F373333333333CC9447
                33333333337F7F7F3333333333CC94433333333333737F7333333333333C9473
                33333333333737F333333333333C943333333333333737333333333333339733
                3333333333337F33333333333333933333333333333373333333}
              Layout = blGlyphRight
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BBSaveClick
            end
            object BBCancelEdit: TBitBtn
              Left = 366
              Top = 53
              Width = 105
              Height = 42
              Hint = #1057#1073#1088#1086#1089' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
              Cancel = True
              Caption = #1057#1073#1088#1086#1089
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333000033338833333333333333333F333333333333
                0000333911833333983333333388F333333F3333000033391118333911833333
                38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                911118111118333338F3338F833338F3000033333911111111833333338F3338
                3333F8330000333333911111183333333338F333333F83330000333333311111
                8333333333338F3333383333000033333339111183333333333338F333833333
                00003333339111118333333333333833338F3333000033333911181118333333
                33338333338F333300003333911183911183333333383338F338F33300003333
                9118333911183333338F33838F338F33000033333913333391113333338FF833
                38F338F300003333333333333919333333388333338FFF830000333333333333
                3333333333333333333888330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = BBNullTaraClick
            end
            object BBTara: TBitBtn
              Left = 365
              Top = 6
              Width = 47
              Height = 44
              Hint = #1054#1090#1090#1072#1088#1080#1090#1100' '#1074#1077#1089#1099
              Caption = 'T'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = BBTaraClick
            end
            object BBZerro: TBitBtn
              Left = 418
              Top = 6
              Width = 47
              Height = 44
              Hint = #1054#1073#1085#1091#1083#1080#1090#1100' '#1074#1077#1089#1099
              Caption = '0'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = BBZerroClick
            end
            object BBWeight_On_Off: TBitBtn
              Left = 12
              Top = 42
              Width = 182
              Height = 25
              Caption = #1042#1099#1082#1083'. '#1074#1077#1089#1099
              TabOrder = 5
              OnClick = BBWeight_On_OffClick
            end
            object GroupBox8: TGroupBox
              Left = 12
              Top = 150
              Width = 459
              Height = 146
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1079#1072#1087#1091#1089#1082#1072' '#1079#1072' '#1076#1072#1090#1091
              TabOrder = 6
              object DBGrid5: TDBGrid
                Left = 3
                Top = 22
                Width = 301
                Height = 121
                DataSource = DM1.DS_QFARSHDAY_LIST
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'System'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = RUSSIAN_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -19
                TitleFont.Name = 'System'
                TitleFont.Style = []
              end
              object GetListFarshDay: TBitBtn
                Left = 321
                Top = 57
                Width = 32
                Height = 28
                Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1079#1072#1087#1091#1089#1082#1072' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' '#1074' '#1087#1088'-'#1074#1086'  '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1091#1102' '#1076#1072#1090#1091
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
                  333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
                  C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
                  F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
                  F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
                  00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
                  3333333373FF7333333333333000333333333333377733333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = GetListFarshDayClick
              end
              object DTP_ListFarshDay: TDateTimePicker
                Left = 321
                Top = 23
                Width = 130
                Height = 28
                Date = 40308.000000000000000000
                Time = 40308.000000000000000000
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'System'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnChange = DTP_ListFarshDayChange
              end
            end
            object GroupBox7: TGroupBox
              Left = 12
              Top = 94
              Width = 249
              Height = 57
              Caption = #1044#1072#1090#1072' '#1085#1072#1074#1077#1089#1082#1080
              TabOrder = 7
              object TP_EDIT: TDateTimePicker
                Left = 139
                Top = 20
                Width = 102
                Height = 28
                Date = 40308.000000000000000000
                Time = 40308.000000000000000000
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'System'
                Font.Style = []
                Kind = dtkTime
                ParentFont = False
                TabOrder = 0
              end
              object DTP_EDIT: TDateTimePicker
                Left = 3
                Top = 20
                Width = 130
                Height = 28
                Date = 40308.000000000000000000
                Time = 40308.000000000000000000
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'System'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
          end
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 329
        Width = 1023
        Height = 340
        Align = alClient
        TabOrder = 1
        object GroupBox5: TGroupBox
          Left = 1
          Top = 1
          Width = 1021
          Height = 338
          Align = alClient
          Caption = #1058#1072#1088#1072
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'System'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Panel6: TPanel
            Left = 2
            Top = 22
            Width = 1017
            Height = 58
            Align = alTop
            TabOrder = 0
            object Label2: TLabel
              Left = 16
              Top = 8
              Width = 44
              Height = 16
              Caption = 'Label2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBNavigator2: TDBNavigator
              Left = 13
              Top = 25
              Width = 288
              Height = 27
              DataSource = DM1.DS_FARSH_TARA_TMP
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
              Hints.Strings = (
                #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
                #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
                #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
                #1057#1086#1093#1088#1072#1085#1080#1090#1100
                #1057#1073#1088#1086#1089
                #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
              TabOrder = 0
            end
            object BBReset_Tara: TBitBtn
              Left = 307
              Top = 25
              Width = 67
              Height = 27
              Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1090#1072#1088#1077
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
                333333333333337FF3333333333333903333333333333377FF33333333333399
                03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
                99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
                99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
                03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
                33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
                33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
                3333777777333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BBReset_TaraClick
            end
            object BBNullTara: TBitBtn
              Left = 392
              Top = 25
              Width = 65
              Height = 27
              Hint = #1057#1073#1088#1086#1089
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333333333333333333FFF33FF333FFF339993370733
                999333777FF37FF377733339993000399933333777F777F77733333399970799
                93333333777F7377733333333999399933333333377737773333333333990993
                3333333333737F73333333333331013333333333333777FF3333333333910193
                333333333337773FF3333333399000993333333337377737FF33333399900099
                93333333773777377FF333399930003999333337773777F777FF339993370733
                9993337773337333777333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = BBNullTaraClick
            end
          end
          object DBGrid2: TDBGrid
            Left = 2
            Top = 80
            Width = 1017
            Height = 256
            Align = alClient
            DataSource = DM1.DS_FARSH_TARA_TMP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'System'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'System'
            TitleFont.Style = []
          end
        end
      end
    end
    object Panel_list_parts: TPanel
      Left = 534
      Top = 325
      Width = 617
      Height = 367
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 1
        Top = 147
        Width = 615
        Height = 219
        Align = alBottom
        Caption = #1042#1079#1074#1077#1096#1077#1085#1085#1072#1103' '#1090#1072#1088#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'System'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBGrid4: TDBGrid
          Left = 2
          Top = 48
          Width = 611
          Height = 169
          Align = alClient
          DataSource = DM1.DSQFARSH_TARA
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'System'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -19
          TitleFont.Name = 'System'
          TitleFont.Style = []
        end
        object Panel8: TPanel
          Left = 2
          Top = 22
          Width = 611
          Height = 26
          Align = alTop
          TabOrder = 1
          object DBNavigator3: TDBNavigator
            Left = 4
            Top = 4
            Width = 152
            Height = 21
            DataSource = DM1.DSQFARSH_TARA
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
              #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1057#1086#1093#1088#1072#1085#1080#1090#1100
              #1057#1073#1088#1086#1089
              #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
            TabOrder = 0
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 1
        Width = 615
        Height = 146
        Align = alClient
        Caption = #1042#1079#1074#1077#1096#1077#1085#1085#1099#1077' '#1087#1086#1088#1094#1080#1080' '#1092#1072#1088#1096#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'System'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object DBGrid3: TDBGrid
          Left = 2
          Top = 124
          Width = 611
          Height = 20
          Align = alClient
          DataSource = DM1.DSQFARSH_W
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'System'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -19
          TitleFont.Name = 'System'
          TitleFont.Style = []
          OnDrawDataCell = DBGrid3DrawDataCell
        end
        object Panel9: TPanel
          Left = 2
          Top = 22
          Width = 611
          Height = 102
          Align = alTop
          TabOrder = 1
          object SB_Import_weight_Gotovogo_Syrogo: TSpeedButton
            Left = 277
            Top = 8
            Width = 31
            Height = 27
            Hint = 
              #1048#1084#1087#1086#1088#1090' '#1075#1086#1090#1086#1074#1086#1075#1086' '#1080#1083#1080' '#1089#1099#1088#1086#1075#1086' '#1082#1086#1083'-'#1074#1072' '#1080#1079' '#1089#1080#1089#1090#1077#1084#1099' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103' (ALT - ' +
              #1076#1083#1103' '#1074#1089#1077#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'  '#1090#1077#1082#1091#1097#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1079#1072#1087#1091#1089#1082#1072')'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
              FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
              00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
              F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
              00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
              F033777777777337F73309999990FFF0033377777777FFF77333099999000000
              3333777777777777333333399033333333333337773333333333333903333333
              3333333773333333333333303333333333333337333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SB_Import_weight_Gotovogo_SyrogoClick
            OnMouseDown = SB_Import_weight_Gotovogo_SyrogoMouseDown
          end
          object Label3: TLabel
            Left = 8
            Top = 77
            Width = 90
            Height = 20
            Caption = #1054#1073#1097#1080#1081' '#1074#1077#1089
          end
          object DBText2: TDBText
            Left = 104
            Top = 76
            Width = 65
            Height = 21
            DataField = 'W_NETTO'
            DataSource = DM1.DS_QItogWeight
          end
          object DBText3: TDBText
            Left = 8
            Top = 49
            Width = 433
            Height = 21
            DataField = 'TOV'
            DataSource = DM1.DSQFARSH_DAY
          end
          object DBNavigator4: TDBNavigator
            Left = 2
            Top = 8
            Width = 120
            Height = 25
            DataSource = DM1.DSQFARSH_W
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
              #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1057#1086#1093#1088#1072#1085#1080#1090#1100
              #1057#1073#1088#1086#1089
              #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
            TabOrder = 0
          end
          object BBDelW: TBitBtn
            Left = 199
            Top = 8
            Width = 33
            Height = 27
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1088#1094#1080#1102' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BBDelWClick
          end
          object BBEditW: TBitBtn
            Left = 160
            Top = 8
            Width = 33
            Height = 26
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1088#1094#1080#1102' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BBEditWClick
          end
          object CBISDEL: TCheckBox
            Left = 314
            Top = 27
            Width = 129
            Height = 20
            Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077
            TabOrder = 3
            OnClick = CBISDELClick
          end
          object BBAddW: TBitBtn
            Left = 125
            Top = 8
            Width = 31
            Height = 26
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1088#1094#1080#1102' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = BBAddWClick
          end
          object CheckBox1: TCheckBox
            Left = 314
            Top = 8
            Width = 127
            Height = 17
            Caption = #1042#1082#1083'. '#1088#1077#1076#1072#1082#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'System'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = CheckBox1Click
          end
          object BB_SET_FINAL_SER: TBitBtn
            Left = 238
            Top = 8
            Width = 33
            Height = 27
            Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1087#1086#1088#1094#1080#1102' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103' '#1092#1080#1085#1072#1083#1100#1085#1086#1081' '
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
              333333333F777773FF333333008888800333333377333F3773F3333077870787
              7033333733337F33373F3308888707888803337F33337F33337F330777880887
              7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
              7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
              00333337777777777733333308033308033333337F7F337F7F33333308033308
              033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
              7333333373F77733733333333088888033333333373FFFF73333333333000003
              3333333333777773333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = BB_SET_FINAL_SERClick
          end
          object BB_CANCEL_FINAL_SER: TBitBtn
            Left = 238
            Top = 8
            Width = 33
            Height = 27
            Hint = #1057#1073#1088#1086#1089#1080#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' '#1092#1080#1085#1072#1083#1100#1085#1086#1081' '#1087#1086#1088#1094#1080#1080' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
              333333333F777773FF333333008888800333333377333F3773F3333077870787
              7033333733337F33373F3308888707888803337F33337F33337F330777880887
              7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
              7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
              0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
              03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
              033333337F73FF737F33B33B778000877333333373F777337333333B30888880
              33333333373FFFF73333333B3300000333333333337777733333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = BB_CANCEL_FINAL_SERClick
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 176
    object File1: TMenuItem
      Caption = '&'#1060#1072#1081#1083#1099
      Hint = 'File related commands'
      object NSetting: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
        OnClick = NSettingClick
      end
      object FileExitItem: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        Hint = 'Exit|Exit application'
        OnClick = FileExit1Execute
      end
    end
    object Help1: TMenuItem
      Caption = '&'#1055#1086#1084#1086#1097#1100
      Hint = 'Help topics'
      object HelpAboutItem: TMenuItem
        Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        Hint = 
          'About|Displays program information, version number, and copyrigh' +
          't'
        OnClick = HelpAbout1Execute
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 388
    Top = 164
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 312
    Top = 262
  end
  object SP_IMPORT_WEIGHT: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'IMPORT_WEIGHT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_SER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IS_GOTOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IS_ALL'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER_COMMENT'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdInputOutput
        Size = 255
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 236
    Top = 536
  end
end
