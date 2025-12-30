object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 560
  Width = 683
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Vorra2016;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=NMK_EP;Data Source=SRV4\MSSQLSRV4;U' +
      'se Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;' +
      'Workstation ID=SRV4;Use Encryption for Data=False;Tag with colum' +
      'n collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 16
  end
  object TbA_DD_TMP: TADOTable
    Connection = ADOConnection1
    TableName = 'A_DD_TMP'
    Left = 104
    Top = 16
  end
  object QUser: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'log'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'select ID_USERS, NAME, LOGIN, STATUS, BIRTHDAY  from USERS where' +
        '  LOGIN =:log')
    Left = 160
    Top = 16
  end
  object Tb_USER_CONNECT: TADOTable
    Connection = ADOConnection1
    TableName = 'USER_CONNECT'
    Left = 208
    Top = 16
  end
  object QFARSH_DAY: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = QFARSH_DAYAfterScroll
    OnCalcFields = QFARSH_DAYCalcFields
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'IS_GOTOV'
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
      end
      item
        Name = 'ID_GRTOV'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @IS_GOTOV INTEGER;'
      'declare @D_FROM datetime;'
      'declare @D_TO datetime;'
      'declare @ID_GRTOV INTEGER;'
      ''
      'set @IS_GOTOV=:IS_GOTOV;'
      'set @D_FROM=:D_FROM;'
      'set @D_TO=:D_TO;'
      'set @ID_GRTOV=:ID_GRTOV'
      ''
      ''
      ''
      'IF @IS_GOTOV IN (0,1)'
      'BEGIN'
      '  if  @ID_GRTOV=-1'
      '  begin'
      '    select F.ID_SER, F.ID_PROD, F.DATE_P,'
      
        '    P.ID_TOV, T."NAME" TOV, T.EDIZM, GT.GRUPTOV, T.ID_GRTOV, SUM' +
        '(Z.COUNT_Z) as S_COUNT_Z, SUM(Z.N_SYR) as S_N_SYR, F.N_GOT'
      '     from FARSH_DAY F'
      '    left outer join PRODUCT P on P.ID_PROD=F.ID_PROD'
      '    left outer join TOV T on T.ID_TOV=P.ID_TOV'
      '    left outer join GRTOV GT on GT.ID_GRTOV=T.ID_GRTOV'
      '    left outer join ZAMES Z on Z.ID_SER=F.ID_SER'
      '    where (F.DATE_P>=@D_FROM) and (F.DATE_P<=@D_TO)'
      '    group by F.ID_SER, F.ID_PROD, F.DATE_P,'
      '    P.ID_TOV, T."NAME", T.EDIZM, GT.GRUPTOV, T.ID_GRTOV, F.N_GOT'
      '    order by DATE_P, GRUPTOV, TOV'
      '  end'
      '  else'
      '  begin'
      ''
      '    select F.ID_SER, F.ID_PROD, F.DATE_P,'
      
        '    P.ID_TOV, T."NAME" TOV, T.EDIZM, GT.GRUPTOV, T.ID_GRTOV, SUM' +
        '(Z.COUNT_Z) as S_COUNT_Z, SUM(Z.N_SYR) as S_N_SYR, F.N_GOT'
      '     from FARSH_DAY F'
      '    left outer join PRODUCT P on P.ID_PROD=F.ID_PROD'
      '    left outer join TOV T on T.ID_TOV=P.ID_TOV'
      '    left outer join GRTOV GT on GT.ID_GRTOV=T.ID_GRTOV'
      '    left outer join ZAMES Z on Z.ID_SER=F.ID_SER'
      
        '    where (F.DATE_P>=@D_FROM) and (F.DATE_P<=@D_TO) and T.ID_GRT' +
        'OV=@ID_GRTOV'
      '    group by F.ID_SER, F.ID_PROD, F.DATE_P,'
      '    P.ID_TOV, T."NAME", T.EDIZM, GT.GRUPTOV, T.ID_GRTOV, F.N_GOT'
      '    order by DATE_P, GRUPTOV, TOV'
      '  end'
      ''
      'END'
      '')
    Left = 296
    Top = 16
    object QFARSH_DAYID_SER: TAutoIncField
      FieldName = 'ID_SER'
      ReadOnly = True
      Visible = False
    end
    object QFARSH_DAYID_PROD: TIntegerField
      FieldName = 'ID_PROD'
      Visible = False
    end
    object QFARSH_DAYDATE_P: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072'-'#1074#1088#1077#1084#1103' '#1079#1072#1087#1091#1089#1082#1072
      FieldName = 'DATE_P'
      Visible = False
    end
    object QFARSH_DAYID_TOV: TIntegerField
      FieldName = 'ID_TOV'
      Visible = False
    end
    object QFARSH_DAYTOV: TWideStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      DisplayWidth = 20
      FieldName = 'TOV'
      Size = 255
    end
    object QFARSH_DAYS_COUNT_Z: TBCDField
      DisplayLabel = #1047#1072#1084#1077#1089#1086#1074
      DisplayWidth = 8
      FieldName = 'S_COUNT_Z'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 15
      Size = 1
    end
    object QFARSH_DAYS_N_SYR: TBCDField
      DisplayLabel = #1057#1099#1088#1086#1075#1086
      DisplayWidth = 8
      FieldName = 'S_N_SYR'
      ReadOnly = True
      DisplayFormat = '0.000'
      Precision = 15
      Size = 1
    end
    object QFARSH_DAYN_GOT: TBCDField
      DisplayLabel = #1043#1086#1090#1086#1074#1086#1075#1086
      DisplayWidth = 8
      FieldName = 'N_GOT'
      ReadOnly = True
      Precision = 15
      Size = 1
    end
    object QFARSH_DAYEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      Size = 5
    end
    object QFARSH_DAYGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 10
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QFARSH_DAYtime_p: TTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1087#1091#1089#1082#1072
      FieldKind = fkCalculated
      FieldName = 'time_p'
      Calculated = True
    end
    object QFARSH_DAYis_final: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'is_final'
      Visible = False
      Calculated = True
    end
    object QFARSH_DAYID_GRTOV: TIntegerField
      FieldName = 'ID_GRTOV'
      Visible = False
    end
  end
  object DSQFARSH_DAY: TDataSource
    DataSet = QFARSH_DAY
    Left = 368
    Top = 16
  end
  object SP_COPY_TARA_W_TO_TMP: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 300
    ProcedureName = 'COPY_TARA_W_TO_TMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 470
    Top = 24
  end
  object ADS_FARSH_TARA_TMP: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeInsert = ADS_FARSH_TARA_TMPBeforeInsert
    CommandText = 
      'select TOV.NAME, TMP.W, TMP.N from FARSH_TARA_TMP TMP'#13#10'inner joi' +
      'n TOV on TOV.ID_TOV=TMP.ID_TAR'#13#10'where ID_USER=:iduser'
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'iduser'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 80
    Top = 112
    object ADS_FARSH_TARA_TMPNAME: TWideStringField
      DisplayLabel = #1058#1072#1088#1072' '#1085#1072' '#1074#1077#1089#1072#1093
      DisplayWidth = 15
      FieldName = 'NAME'
      ReadOnly = True
      Size = 255
    end
    object ADS_FARSH_TARA_TMPW: TFloatField
      DisplayLabel = #1042#1077#1089' '#1090#1072#1088#1099
      DisplayWidth = 8
      FieldName = 'W'
      DisplayFormat = '0.000'
    end
    object ADS_FARSH_TARA_TMPN: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1090#1072#1088#1099
      DisplayWidth = 8
      FieldName = 'N'
      DisplayFormat = '0'
    end
  end
  object DS_FARSH_TARA_TMP: TDataSource
    DataSet = ADS_FARSH_TARA_TMP
    Left = 128
    Top = 112
  end
  object SP_CLEAR_FARSH_TARA_TMP: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 300
    ProcedureName = 'CLEAR_FARSH_TARA_TMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
    Left = 340
    Top = 96
  end
  object SP_ADD_FARSH_TARA_W: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 300
    ProcedureName = 'ADD_FARSH_TARA_W;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@W'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
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
        Name = '@ID_DOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_FARSH_W_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
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
    Left = 478
    Top = 94
  end
  object QFARSH_W: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = QFARSH_WAfterScroll
    OnCalcFields = QFARSH_WCalcFields
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'isgotov'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'idser'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'isdelete'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_DOC'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @IS_GOTOV INTEGER;'
      'declare @IS_SER INTEGER;'
      'declare @IS_DELETE INTEGER;'
      'declare @ID_DOC INTEGER;'
      ''
      'set @IS_GOTOV=:isgotov;'
      'set @IS_SER=:idser'
      'set @IS_DELETE=:isdelete'
      'set @ID_DOC=:ID_DOC'
      ''
      ''
      ''
      'IF @IS_GOTOV IN (0,1)'
      'BEGIN'
      ''
      ''
      
        'select FARSH_W.ID_FARSH_W, FARSH_W.ID_SER, FARSH_W.DT, FARSH_W.W' +
        ','
      #9'FARSH_W.ID_USER, U1.NAME,'
      #9'FARSH_W.D_DELETE,FARSH_W.COMMENT_DEL, U2.NAME USER_DEL,'
      #9'-- '#1074#1077#1089' '#1090#1072#1088#1099
      #9'isNull('
      #9'  (select sum(FARSH_TARA.N*FARSH_TARA.W)'
      
        #9'  from FARSH_TARA where FARSH_TARA.ID_FARSH_W=FARSH_W.ID_FARSH_' +
        'W'
      #9' ),0.0) W_TAR,'
      #9' FARSH_W.[IS_FINAL_SER], FARSH_W.[ID_DOC]'
      #9'from FARSH_W'
      #9'left outer join USERS U1 on U1.ID_USERS=FARSH_W.ID_USER'
      #9'left outer join USERS U2 on U2.ID_USERS=FARSH_W.ID_USER_DEL'
      ''
      #9'where FARSH_W.ID_SER=@IS_SER  and FARSH_W.IS_GOTOV=@IS_GOTOV'
      #9'and FARSH_W.IS_DELETE=@IS_DELETE'
      #9'order by FARSH_W.DT  desc'
      'END'
      'ELSE'
      'BEGIN'
      
        #9'select FARSH_W.ID_FARSH_W, FARSH_W.ID_SER, FARSH_W.DT, FARSH_W.' +
        'W,'
      #9'FARSH_W.ID_USER, U1.NAME,'
      #9'FARSH_W.D_DELETE,FARSH_W.COMMENT_DEL, U2.NAME USER_DEL,'
      #9'-- '#1074#1077#1089' '#1090#1072#1088#1099
      #9'isNull('
      #9'  (select sum(FARSH_TARA.N*FARSH_TARA.W)'
      
        #9'  from FARSH_TARA where FARSH_TARA.ID_FARSH_W=FARSH_W.ID_FARSH_' +
        'W'
      #9' ),0.0) W_TAR,'
      #9' FARSH_W.[IS_FINAL_SER], FARSH_W.[ID_DOC]'
      #9'from FARSH_W'
      #9'left outer join USERS U1 on U1.ID_USERS=FARSH_W.ID_USER'
      #9'left outer join USERS U2 on U2.ID_USERS=FARSH_W.ID_USER_DEL'
      ''
      #9'where FARSH_W.ID_SER=@IS_SER  and FARSH_W.IS_GOTOV=@IS_GOTOV'
      #9'and FARSH_W.IS_DELETE=@IS_DELETE'
      #9'and FARSH_W.[ID_DOC]=@ID_DOC'
      #9'order by FARSH_W.DT  desc'
      ''
      'END'
      '')
    Left = 120
    Top = 224
    object QFARSH_WID_FARSH_W: TAutoIncField
      FieldName = 'ID_FARSH_W'
      ReadOnly = True
      Visible = False
    end
    object QFARSH_WID_SER: TIntegerField
      FieldName = 'ID_SER'
      ReadOnly = True
      Visible = False
    end
    object QFARSH_WDT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072'-'#1074#1088#1077#1084#1103
      DisplayWidth = 14
      FieldName = 'DT'
      ReadOnly = True
    end
    object QFARSH_WW: TFloatField
      DisplayLabel = #1042#1077#1089' '#1089' '#1090#1072#1088#1086#1081
      DisplayWidth = 8
      FieldName = 'W'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QFARSH_WW_TAR: TFloatField
      DisplayLabel = #1042#1077#1089' '#1090#1072#1088#1099
      DisplayWidth = 8
      FieldName = 'W_TAR'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QFARSH_WID_USER: TIntegerField
      FieldName = 'ID_USER'
      ReadOnly = True
      Visible = False
    end
    object QFARSH_WFW: TFloatField
      DisplayLabel = #1063#1080#1089#1090#1099#1081' '#1074#1077#1089
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'FW'
      ReadOnly = True
      DisplayFormat = '0.000'
      Calculated = True
    end
    object QFARSH_WNAME: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      DisplayWidth = 15
      FieldName = 'NAME'
      ReadOnly = True
      Size = 50
    end
    object QFARSH_WD_DELETE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1091#1076#1072#1083#1077#1085#1080#1103
      DisplayWidth = 14
      FieldName = 'D_DELETE'
      ReadOnly = True
    end
    object QFARSH_WCOMMENT_DEL: TWideStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1103
      DisplayWidth = 30
      FieldName = 'COMMENT_DEL'
      ReadOnly = True
      Size = 50
    end
    object QFARSH_WUSER_DEL: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074'.'#1091#1076#1072#1083'.'#1080#1079#1084#1077#1085#1080#1074#1096#1080#1081
      DisplayWidth = 20
      FieldName = 'USER_DEL'
      ReadOnly = True
      Size = 50
    end
    object QFARSH_WIS_FINAL_SER: TIntegerField
      DisplayLabel = #1060#1080#1085#1072#1083
      DisplayWidth = 5
      FieldName = 'IS_FINAL_SER'
    end
    object QFARSH_WID_DOC: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1076#1086#1082#1091#1084'.'#1080#1085#1074
      FieldName = 'ID_DOC'
    end
  end
  object DSQFARSH_W: TDataSource
    DataSet = QFARSH_W
    Left = 168
    Top = 224
  end
  object QFARSH_TARA: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'idfarshw'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select TOV.NAME, FARSH_TARA.W, FARSH_TARA.N '
      '  from FARSH_TARA'
      'left outer join TOV on TOV.ID_TOV=FARSH_TARA.ID_TARA'
      ''
      'where FARSH_TARA.ID_FARSH_W=:idfarshw')
    Left = 296
    Top = 224
    object QFARSH_TARANAME: TWideStringField
      DisplayLabel = #1058#1072#1088#1072
      DisplayWidth = 15
      FieldName = 'NAME'
      Size = 255
    end
    object QFARSH_TARAW: TFloatField
      DisplayLabel = #1042#1077#1089' '#1090#1072#1088#1099
      FieldName = 'W'
      DisplayFormat = '0.000'
    end
    object QFARSH_TARAN: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1090#1072#1088#1099
      FieldName = 'N'
      DisplayFormat = '0'
    end
  end
  object DSQFARSH_TARA: TDataSource
    DataSet = QFARSH_TARA
    Left = 336
    Top = 224
  end
  object SP_DEL_FARSH_W: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 300
    ProcedureName = 'DEL_FARSH_W;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_FARSH_W'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER_DEL'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@COMMENT_DEL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
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
    Left = 506
    Top = 166
  end
  object SP_COPY_EDIT_TARA_W_TO_TMP: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 300
    ProcedureName = 'COPY_EDIT_TARA_W_TO_TMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_FARSH_W'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@W'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
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
    Left = 130
    Top = 302
  end
  object SP_EDIT_FARSH_TARA_W: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 300
    ProcedureName = 'EDIT_FARSH_TARA_W;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@COMMENT_DEL'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@W'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@DT_NEW'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ID_SER_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_FARSH_W'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_FARSH_W_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
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
    Left = 304
    Top = 304
  end
  object QRep1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
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
      'declare @D_FROM DATETIME'
      'declare @D_TO DATETIME'
      'SET @D_FROM=:D_FROM'
      'SET @D_TO=:D_TO'
      ''
      ''
      ''
      'select F.ID_SER, F.ID_PROD, F.DATE_P,'
      'P.ID_TOV, T."NAME" TOV, T.EDIZM, GT.GRUPTOV,'
      '('
      
        'select sum(FARSH_W.W) from FARSH_W where FARSH_W.ID_SER=F.ID_SER' +
        ' and FARSH_W.IS_GOTOV=0'
      ') W_SYR_WITH_TARA,'
      ''
      '('
      'select sum(FARSH_TARA.W*FARSH_TARA.N) from FARSH_TARA'
      'inner join  FARSH_W on FARSH_W.ID_FARSH_W=FARSH_TARA.ID_FARSH_W'
      'where FARSH_W.ID_SER=F.ID_SER and FARSH_W.IS_GOTOV=0'
      ') W_SYR_TARA,'
      '('
      
        'select sum(FARSH_W.W) from FARSH_W where FARSH_W.ID_SER=F.ID_SER' +
        ' and FARSH_W.IS_GOTOV=1'
      ') W_GOT_WITH_TARA,'
      ''
      '('
      'select sum(FARSH_TARA.W*FARSH_TARA.N) from FARSH_TARA'
      'inner join  FARSH_W on FARSH_W.ID_FARSH_W=FARSH_TARA.ID_FARSH_W'
      'where FARSH_W.ID_SER=F.ID_SER and FARSH_W.IS_GOTOV=1'
      ') W_GOT_TARA'
      ''
      ' from FARSH_DAY F'
      'left outer join PRODUCT P on P.ID_PROD=F.ID_PROD'
      'left outer join TOV T on T.ID_TOV=P.ID_TOV'
      'left outer join GRTOV GT on GT.ID_GRTOV=T.ID_GRTOV'
      'where'
      '(F.DATE_P>=@D_FROM) and (F.DATE_P<=@D_TO)'
      'order by DATE_P, GRUPTOV, TOV')
    Left = 248
    Top = 408
  end
  object SP_SET_FINAL_SER: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 300
    ProcedureName = 'SET_FINAL_SER;1'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 452
    Top = 310
  end
  object SP_CANCEL_FINAL_SER: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 300
    ProcedureName = 'CANCEL_FINAL_SER;1'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 568
    Top = 310
  end
  object Q_IS_FINAL_SER: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'ID_SER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'IS_GOTOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ' select COUNT(*) C from  [dbo].[FARSH_W] where [ID_SER]=:ID_SER'
      ' and [IS_FINAL_SER]=1 and [IS_DELETE]=0 and [IS_GOTOV]=:IS_GOTOV'
      ''
      '')
    Left = 366
    Top = 410
  end
  object QItogWeight: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'idser'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'isgotov'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_DOC'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_SER int'
      'declare @ISGOTOVO int'
      'declare @ID_DOC int'
      'set @ID_SER = :idser'
      'set @ISGOTOVO = :isgotov'
      'set @ID_DOC = :ID_DOC'
      ''
      ''
      'declare @W_BRUTTO float'
      'declare @W_TARA float'
      ''
      ''
      'IF @ISGOTOVO IN (0,1)'
      'BEGIN'
      'select @W_BRUTTO=ISNULL(SUM(FW.W),0.0)'
      'from FARSH_W FW'
      '  where FW.ID_SER=@ID_SER  and FW.IS_GOTOV=@ISGOTOVO'
      'and FW.IS_DELETE=0'
      ''
      'select @W_TARA= ISNULL(sum(FT.N*FT.W),0.0)'
      '  from FARSH_TARA FT'
      '  inner join FARSH_W FW on FW.ID_FARSH_W=FT.ID_FARSH_W'
      '  where FW.ID_SER=@ID_SER  and FW.IS_GOTOV=@ISGOTOVO'
      'and FW.IS_DELETE=0'
      ''
      'END'
      'ELSE'
      'BEGIN'
      '  select @W_BRUTTO=ISNULL(SUM(FW.W),0.0)'
      '  from FARSH_W FW'
      '  where FW.ID_SER=@ID_SER  and FW.IS_GOTOV=@ISGOTOVO'
      '  and FW.IS_DELETE=0 and FW.ID_DOC=@ID_DOC'
      ''
      ''
      '  select @W_TARA= ISNULL(sum(FT.N*FT.W),0.0)'
      '  from FARSH_TARA FT'
      '  inner join FARSH_W FW on FW.ID_FARSH_W=FT.ID_FARSH_W'
      '  where FW.ID_SER=@ID_SER  and FW.IS_GOTOV=@ISGOTOVO'
      '  and FW.IS_DELETE=0 and FW.ID_DOC=@ID_DOC'
      'END'
      ''
      'select (@W_BRUTTO-@W_TARA) W_NETTO'
      ''
      ''
      ''
      '')
    Left = 488
    Top = 410
    object QItogWeightW_NETTO: TFloatField
      FieldName = 'W_NETTO'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
  end
  object DS_QItogWeight: TDataSource
    DataSet = QItogWeight
    Left = 544
    Top = 408
  end
  object DS_QFARSHDAY_LIST: TDataSource
    DataSet = QFARSHDAY_LIST
    Left = 128
    Top = 456
  end
  object QFARSHDAY_LIST: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'IS_GOTOV'
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
      end
      item
        Name = 'ID_GRTOV'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @IS_GOTOV INTEGER;'
      'declare @D_FROM datetime;'
      'declare @D_TO datetime;'
      'declare @ID_GRTOV INTEGER;'
      ''
      ''
      'set @IS_GOTOV=:IS_GOTOV;'
      'set @D_FROM=:D_FROM;'
      'set @D_TO=:D_TO;'
      'set @ID_GRTOV=:ID_GRTOV'
      ''
      'IF @IS_GOTOV IN (0,1)'
      'BEGIN'
      'select F.ID_SER, F.ID_PROD, F.DATE_P,'
      'P.ID_TOV, T."NAME" TOV, T.EDIZM, GT.GRUPTOV'
      ' from FARSH_DAY F'
      'left outer join PRODUCT P on P.ID_PROD=F.ID_PROD'
      'left outer join TOV T on T.ID_TOV=P.ID_TOV'
      'left outer join GRTOV GT on GT.ID_GRTOV=T.ID_GRTOV'
      'where (F.DATE_P>=@D_FROM) and (F.DATE_P<=@D_TO)'
      'order by DATE_P, GRUPTOV, TOV'
      'end'
      'ELSE'
      'BEGIN'
      ''
      'IF @ID_GRTOV <>-1'
      'begin'
      
        '  select T.ID_TOV as ID_SER, T.ID_TOV as ID_PROD, @D_FROM as DAT' +
        'E_P,'
      
        '  T.ID_TOV as ID_TOV, T."NAME" as TOV, T.EDIZM as EDIZM , GT.GRU' +
        'PTOV as GRUPTOV, T.ID_GRTOV as ID_GRTOV'
      '  from TOV T'
      '  left outer join GRTOV GT on GT.ID_GRTOV=T.ID_GRTOV'
      '  where T.IS_DELETE=0 and T.ID_GRTOV=@ID_GRTOV'
      '  order by  GRUPTOV, TOV'
      'end'
      'else'
      'begin'
      
        ' select T.ID_TOV as ID_SER, T.ID_TOV as ID_PROD, @D_FROM as DATE' +
        '_P,'
      
        '  T.ID_TOV as ID_TOV, T."NAME" as TOV, T.EDIZM as EDIZM , GT.GRU' +
        'PTOV as GRUPTOV, T.ID_GRTOV as ID_GRTOV'
      '  from TOV T'
      '  left outer join GRTOV GT on GT.ID_GRTOV=T.ID_GRTOV'
      '  where T.IS_DELETE=0'
      '  order by  GRUPTOV, TOV'
      'end'
      ''
      'END'
      '')
    Left = 80
    Top = 456
    object QFARSHDAY_LISTTOV: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'TOV'
      Size = 255
    end
    object QFARSHDAY_LISTGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 15
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QFARSHDAY_LISTEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      Size = 5
    end
    object QFARSHDAY_LISTDATE_P: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1087#1091#1089#1082#1072
      FieldName = 'DATE_P'
    end
    object QFARSHDAY_LISTID_SER: TAutoIncField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'ID_SER'
      ReadOnly = True
    end
    object QFARSHDAY_LISTID_PROD: TIntegerField
      FieldName = 'ID_PROD'
    end
    object QFARSHDAY_LISTID_TOV: TIntegerField
      FieldName = 'ID_TOV'
    end
  end
  object ADODSGrTov: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select ID_GRTOV, GRUPTOV, SEQUENTIAL, IS_DELETE from GRTOV where' +
      ' IS_DELETE=:isdelete'#13#10'order by GRUPTOV'
    CommandTimeout = 300
    IndexFieldNames = 'GRUPTOV'
    Parameters = <
      item
        Name = 'isdelete'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 254
    Top = 474
    object ADODSGrTovID_GRTOV: TAutoIncField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_GRTOV'
      ReadOnly = True
    end
    object ADODSGrTovGRUPTOV: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object ADODSGrTovSEQUENTIAL: TIntegerField
      DisplayLabel = #8470' '#1087#1086#1089#1083#1077#1076#1086#1074'. '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      FieldName = 'SEQUENTIAL'
    end
    object ADODSGrTovIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
      Visible = False
    end
  end
  object DSGrTov: TDataSource
    DataSet = ADODSGrTov
    Left = 304
    Top = 476
  end
  object SP_SET_INV_OSTATKI_TMP: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 600
    ProcedureName = 'SET_INV_OSTATKI_TMP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@DATE_REP_TO'
        Attributes = [paNullable]
        DataType = ftDateTime
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@ID_SCH'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
      end
      item
        Name = '@ID_CLI'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@IS_BASE_TOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@DATE_LAST_INV'
        Attributes = [paNullable]
        DataType = ftDateTime
        Direction = pdInputOutput
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
      end>
    Left = 240
    Top = 72
  end
  object Q_Ostatki: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = Q_OstatkiAfterScroll
    OnCalcFields = Q_OstatkiCalcFields
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'ID_GRTOV'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_GRTOV INTEGER;'
      'declare @ID_USER int;'
      ''
      ''
      'set @ID_GRTOV=:ID_GRTOV;'
      'set @ID_USER=:ID_USER;'
      ''
      ''
      'IF @ID_GRTOV <>-1'
      'begin'
      ''
      
        ' select G.GRUPTOV, T.NAME as TOV, PP.[PER_POTER], TL.N0, TL.DEB_' +
        '0, TL.KRED_0, TL.N1, TL.ID_TOV as ID_SER, TL.ID_TOV as ID_TOV fr' +
        'om INV_OSTATKI_TMP TL'
      ' inner join TOV T on T.ID_TOV=TL.ID_TOV'
      ' inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      
        ' left outer join [dbo].[KIO_PER_POTERI_GRTOV] PP on PP.ID_GRTOV=' +
        'T.ID_GRTOV'
      ' where T.ID_GRTOV=@ID_GRTOV and  TL.ID_USER=@ID_USER'
      ' order by T.NAME'
      ''
      ''
      'end'
      'else'
      'begin'
      
        ' select G.GRUPTOV, T.NAME as TOV, PP.[PER_POTER], TL.N0, TL.DEB_' +
        '0, TL.KRED_0, TL.N1, TL.ID_TOV as ID_SER, TL.ID_TOV as ID_TOV  f' +
        'rom INV_OSTATKI_TMP TL'
      ' inner join TOV T on T.ID_TOV=TL.ID_TOV'
      ' inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      
        ' left outer join [dbo].[KIO_PER_POTERI_GRTOV] PP on PP.ID_GRTOV=' +
        'T.ID_GRTOV'
      ' where   TL.ID_USER=@ID_USER'
      ' order by T.NAME'
      'end'
      ''
      ''
      ''
      '')
    Left = 304
    Top = 56
    object Q_OstatkiTOV: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'TOV'
      Size = 255
    end
    object Q_OstatkiN1: TFloatField
      DisplayLabel = #1056#1072#1089#1095#1077#1090#1085'.'#1082#1086#1083
      FieldName = 'N1'
      DisplayFormat = '0.000'
    end
    object Q_Ostatkinr: TFloatField
      DisplayLabel = #1053#1072#1083#1080#1095#1080#1077
      FieldKind = fkCalculated
      FieldName = 'nr'
      DisplayFormat = '0.000'
      Calculated = True
    end
    object Q_Ostatkidelta: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072
      FieldKind = fkCalculated
      FieldName = 'delta'
      DisplayFormat = '0.000'
      Calculated = True
    end
    object Q_Ostatkiper_poter_real: TFloatField
      DisplayLabel = '%'#1087#1086#1090#1077#1088#1100' '#1092#1072#1082#1090
      FieldKind = fkCalculated
      FieldName = 'per_poter_real'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object Q_OstatkiN0: TFloatField
      DisplayLabel = #1050#1086#1083'.'#1087#1088#1077#1076'.'#1080#1085#1074
      FieldName = 'N0'
      DisplayFormat = '0.000'
    end
    object Q_OstatkiDEB_0: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      FieldName = 'DEB_0'
      DisplayFormat = '0.000'
    end
    object Q_OstatkiKRED_0: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      FieldName = 'KRED_0'
      DisplayFormat = '0.000'
    end
    object Q_OstatkiPER_POTER: TFloatField
      DisplayLabel = '% '#1087#1086#1090#1077#1088#1100' '#1085#1086#1088#1084
      FieldName = 'PER_POTER'
      DisplayFormat = '0.00'
    end
    object Q_OstatkiGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object Q_OstatkiID_SER: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_SER'
    end
    object Q_Ostatkitime_p: TTimeField
      FieldKind = fkCalculated
      FieldName = 'time_p'
      Visible = False
      Calculated = True
    end
    object Q_Ostatkiis_final: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'is_final'
      Visible = False
      Calculated = True
    end
    object Q_OstatkiID_TOV: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'ID_TOV'
    end
  end
end
