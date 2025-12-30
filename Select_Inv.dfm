object F_Sel_Inv: TF_Sel_Inv
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
  ClientHeight = 508
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 508
    Align = alLeft
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 326
      Height = 41
      Align = alTop
      TabOrder = 0
      object DBNavigator1: TDBNavigator
        Left = 4
        Top = 6
        Width = 224
        Height = 25
        DataSource = DS_Q_Doc_Type
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 42
      Width = 326
      Height = 465
      Align = alClient
      DataSource = DS_Q_Doc_Type
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 328
    Top = 0
    Width = 434
    Height = 508
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 432
      Height = 90
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 60
        Width = 7
        Height = 13
        Caption = #1057
      end
      object Label2: TLabel
        Left = 166
        Top = 60
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object DBNavigator2: TDBNavigator
        Left = 8
        Top = 8
        Width = 124
        Height = 25
        DataSource = DS_Q_Inv
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 154
        Top = 7
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1086#1088
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 1
      end
      object BitBtn2: TBitBtn
        Left = 262
        Top = 7
        Width = 75
        Height = 25
        Caption = #1057#1073#1088#1086#1089
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 2
      end
      object D_From: TDateTimePicker
        Left = 23
        Top = 52
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
        TabOrder = 3
        OnChange = D_FromChange
      end
      object D_To: TDateTimePicker
        Left = 189
        Top = 52
        Width = 130
        Height = 28
        Date = 40308.999988425920000000
        Time = 40308.999988425920000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'System'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = D_FromChange
      end
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 91
      Width = 432
      Height = 416
      Align = alClient
      DataSource = DS_Q_Inv
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Q_Doc_Type: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_Doc_TypeAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select DT.ID_DOC_TYPE, DT.NAMEDOC'
      'from DOC_TYPE DT'
      'where DT.ID_CHAR_DOC=4'
      'ORDER BY DT.NAMEDOC')
    Left = 104
    Top = 148
    object Q_Doc_TypeNAMEDOC: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      DisplayWidth = 40
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object Q_Doc_TypeID_DOC_TYPE: TAutoIncField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_DOC_TYPE'
      ReadOnly = True
    end
  end
  object Q_Inv: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_DOC_TYPE'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D_FROM'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'D_TO'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_DOC_TYPE int'
      'declare @D_FROM datetime, @D_TO datetime'
      'set @ID_DOC_TYPE=:ID_DOC_TYPE'
      'set @D_FROM =:D_FROM'
      'set @D_TO =:D_TO'
      
        'select IC.[ID_INV], IC.[NI], IC.[DATE_INV], IC.[SCH], IC.[ID_CLI' +
        '], CL.CLIENT from [dbo].[INVCAP] IC'
      ' inner join CLIENTS CL on CL.ID_CLIENTS=IC.[ID_CLI]'
      'where [ID_DOC_TYPE]=@ID_DOC_TYPE and'
      '[DATE_INV]>=@D_FROM and [DATE_INV]<=@D_TO')
    Left = 450
    Top = 148
    object Q_InvNI: TWideStringField
      DisplayLabel = #8470' '#1080#1085#1074
      DisplayWidth = 10
      FieldName = 'NI'
      Size = 50
    end
    object Q_InvDATE_INV: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1085#1074
      FieldName = 'DATE_INV'
    end
    object Q_InvID_INV: TAutoIncField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_INV'
      ReadOnly = True
    end
    object Q_InvSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'SCH'
      FixedChar = True
      Size = 10
    end
    object Q_InvID_CLI: TIntegerField
      FieldName = 'ID_CLI'
      Visible = False
    end
    object Q_InvCLIENT: TWideStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      DisplayWidth = 20
      FieldName = 'CLIENT'
      Size = 255
    end
  end
  object DS_Q_Doc_Type: TDataSource
    DataSet = Q_Doc_Type
    Left = 190
    Top = 148
  end
  object DS_Q_Inv: TDataSource
    DataSet = Q_Inv
    Left = 524
    Top = 152
  end
end
