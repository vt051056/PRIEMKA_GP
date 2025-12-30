unit DataModule1;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    TbA_DD_TMP: TADOTable;
    QUser: TADOQuery;
    Tb_USER_CONNECT: TADOTable;
    QFARSH_DAY: TADOQuery;
    DSQFARSH_DAY: TDataSource;
    QFARSH_DAYID_SER: TAutoIncField;
    QFARSH_DAYID_PROD: TIntegerField;
    QFARSH_DAYDATE_P: TDateTimeField;
    QFARSH_DAYID_TOV: TIntegerField;
    QFARSH_DAYTOV: TWideStringField;
    QFARSH_DAYEDIZM: TWideStringField;
    QFARSH_DAYGRUPTOV: TWideStringField;
    SP_COPY_TARA_W_TO_TMP: TADOStoredProc;
    ADS_FARSH_TARA_TMP: TADODataSet;
    DS_FARSH_TARA_TMP: TDataSource;
    SP_CLEAR_FARSH_TARA_TMP: TADOStoredProc;
    SP_ADD_FARSH_TARA_W: TADOStoredProc;
    QFARSH_W: TADOQuery;
    DSQFARSH_W: TDataSource;
    QFARSH_TARA: TADOQuery;
    DSQFARSH_TARA: TDataSource;
    ADS_FARSH_TARA_TMPNAME: TWideStringField;
    ADS_FARSH_TARA_TMPW: TFloatField;
    ADS_FARSH_TARA_TMPN: TIntegerField;
    QFARSH_TARANAME: TWideStringField;
    QFARSH_TARAW: TFloatField;
    QFARSH_TARAN: TIntegerField;
    QFARSH_WID_FARSH_W: TAutoIncField;
    QFARSH_WID_SER: TIntegerField;
    QFARSH_WDT: TDateTimeField;
    QFARSH_WW: TFloatField;
    QFARSH_WID_USER: TIntegerField;
    QFARSH_WNAME: TWideStringField;
    QFARSH_WW_TAR: TFloatField;
    SP_DEL_FARSH_W: TADOStoredProc;
    SP_COPY_EDIT_TARA_W_TO_TMP: TADOStoredProc;
    SP_EDIT_FARSH_TARA_W: TADOStoredProc;
    QFARSH_WFW: TFloatField;
    QRep1: TADOQuery;
    QFARSH_WD_DELETE: TDateTimeField;
    QFARSH_WCOMMENT_DEL: TWideStringField;
    QFARSH_WUSER_DEL: TWideStringField;
    QFARSH_DAYtime_p: TTimeField;
    QFARSH_WIS_FINAL_SER: TIntegerField;
    SP_SET_FINAL_SER: TADOStoredProc;
    SP_CANCEL_FINAL_SER: TADOStoredProc;
    Q_IS_FINAL_SER: TADOQuery;
    QFARSH_DAYis_final: TBooleanField;
    QItogWeight: TADOQuery;
    QItogWeightW_NETTO: TFloatField;
    DS_QItogWeight: TDataSource;
    DS_QFARSHDAY_LIST: TDataSource;
    QFARSHDAY_LIST: TADOQuery;
    QFARSHDAY_LISTID_SER: TAutoIncField;
    QFARSHDAY_LISTID_PROD: TIntegerField;
    QFARSHDAY_LISTDATE_P: TDateTimeField;
    QFARSHDAY_LISTID_TOV: TIntegerField;
    QFARSHDAY_LISTTOV: TWideStringField;
    QFARSHDAY_LISTEDIZM: TWideStringField;
    QFARSHDAY_LISTGRUPTOV: TWideStringField;
    ADODSGrTov: TADODataSet;
    ADODSGrTovID_GRTOV: TAutoIncField;
    ADODSGrTovGRUPTOV: TWideStringField;
    ADODSGrTovSEQUENTIAL: TIntegerField;
    ADODSGrTovIS_DELETE: TIntegerField;
    DSGrTov: TDataSource;
    QFARSH_DAYID_GRTOV: TIntegerField;
    QFARSH_WID_DOC: TIntegerField;
    QFARSH_DAYS_COUNT_Z: TBCDField;
    QFARSH_DAYS_N_SYR: TBCDField;
    QFARSH_DAYN_GOT: TBCDField;
    SP_SET_INV_OSTATKI_TMP: TADOStoredProc;
    Q_Ostatki: TADOQuery;
    Q_OstatkiGRUPTOV: TWideStringField;
    Q_OstatkiPER_POTER: TFloatField;
    Q_OstatkiN0: TFloatField;
    Q_OstatkiDEB_0: TFloatField;
    Q_OstatkiKRED_0: TFloatField;
    Q_OstatkiN1: TFloatField;
    Q_OstatkiID_SER: TIntegerField;
    Q_OstatkiTOV: TWideStringField;
    Q_Ostatkinr: TFloatField;
    Q_Ostatkitime_p: TTimeField;
    Q_Ostatkiis_final: TBooleanField;
    Q_Ostatkidelta: TFloatField;
    Q_Ostatkiper_poter_real: TFloatField;
    Q_OstatkiID_TOV: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure QFARSH_WAfterScroll(DataSet: TDataSet);
    procedure QFARSH_DAYAfterScroll(DataSet: TDataSet);
    procedure QFARSH_WCalcFields(DataSet: TDataSet);
    procedure ADS_FARSH_TARA_TMPBeforeInsert(DataSet: TDataSet);
    procedure QFARSH_DAYCalcFields(DataSet: TDataSet);
    procedure Q_OstatkiCalcFields(DataSet: TDataSet);
    procedure Q_OstatkiAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
   is_connected:boolean;

   function IS_FINAL_SER(ID_SER, IS_GOTOV:integer):boolean;
  end;

var
  DM1: TDM1;

const
  Unknown_code=-1;
  Unknown_str='Не определен';
  eps=0.0000001;
var
  ID_user_select:longint;
  user_select:string;
  status_user:integer;
  user_birthday:TDateTime;

implementation

{$R *.dfm}

uses reg_server,Dialogs,Controls, Farsh_Weight_MAIN;

procedure TDM1.ADS_FARSH_TARA_TMPBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TDM1.DataModuleCreate(Sender: TObject);
var is_work_user:boolean;
begin
  ADOConnection1.Connected:=False;
  ADOConnection1.ConnectionString:=Connect_info;
try
   TbA_DD_TMP.Active:=True;
   if (TbA_DD_TMP.FieldByName('DD').AsFloat<Date()) then
   begin
    MessageDlg('Ошибка структуры БД!',
     mtError, [mbOk], 0);
     is_connected:=False;
     TbA_DD_TMP.Active:=False;
     exit;
   end;
   TbA_DD_TMP.Active:=False;

  with QUser do
  begin
    Close;
    Parameters.ParamByName('log').Value:=login;
    Open;
  end;  //  with QUser do
    if QUser.recordcount>0 then
    begin
     ID_user_select:=QUser.FieldByName('ID_USERS').Asinteger;
     user_select:=QUser.FieldByName('NAME').AsString;
     status_user:=QUser.FieldByName('STATUS').Asinteger;
     user_birthday:=QUser.FieldByName('BIRTHDAY').AsFloat;

     with Tb_USER_CONNECT do
     begin
      Open;
      first;
      is_work_user:=False;
      while not EOF do
      begin
        if fieldbyname('ID_USER').AsInteger=ID_user_select  then
        begin
          is_work_user:=true;
          break;
        end;
        next;
      end;
      if is_work_user then
      begin
        MessageDlg('Пользователь БД с логином '+Login+' уже работает!',
          mtError, [mbOk], 0);
        if status_user=2 then
        begin
          if MessageDlg('Войти в систему?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes   then
             is_connected:=True
          else is_connected:=False;
        end
        else   is_connected:=False;
      end
      else
      begin
       is_connected:=True;
       Append;
       fieldbyname('ID_USER').AsInteger:=ID_user_select;
       post;
      end;
      Close;
     end;  // with Tb_USER_CONNECT do


    end  // if QUser.recordcount>0 then
    else
    begin

      ID_user_select:=Unknown_code;
      user_select:=Unknown_str;
      status_user:=Unknown_code;
      user_birthday:=0.0;
      MessageDlg('Пользователь БД с логином '+Login+
       ' не зарегистрирован в приложении!',
        mtError, [mbOk], 0);
      is_connected:=False;

    end;



except
     MessageDlg('Соединение с сервером БД отсутствует!',
     mtError, [mbOk], 0);
     is_connected:=False;

end;
  if QUser.Active then QUser.Close;
  if Tb_USER_CONNECT.Active then Tb_USER_CONNECT.Active:=false;
  if TbA_DD_TMP.Active then TbA_DD_TMP.Active:=false;
end;


function TDM1.IS_FINAL_SER(ID_SER, IS_GOTOV:integer):boolean;
begin
  result:=false;
  with Q_IS_FINAL_SER do
  begin
    Close;
    Parameters.ParamByName('ID_SER').Value:=ID_SER;
    Parameters.ParamByName('IS_GOTOV').Value:=IS_GOTOV;
    Open;
    result:= (FieldByName('C').asInteger>0);
    Close;
  end;
end;

procedure TDM1.QFARSH_DAYAfterScroll(DataSet: TDataSet);
begin
 Farsh_Weight_AppForm.Control_FINAL_Weight;

 with QItogWeight do
 begin
  Close;
    Parameters.ParamByName('idser').Value:=
     QFARSH_DAY.FieldByName('ID_SER').AsInteger;
    Parameters.ParamByName('isgotov').Value:=
      Farsh_Weight_AppForm.RG_IsGotov.ItemIndex;
    Parameters.ParamByName('ID_DOC').Value:= Farsh_Weight_AppForm.ID_DOC_INV;
  Open;
 end;

 with QFARSH_W do
  begin
    Close;
    Parameters.ParamByName('idser').Value:=
     QFARSH_DAY.FieldByName('ID_SER').AsInteger;
    Parameters.ParamByName('isgotov').Value:=
      Farsh_Weight_AppForm.RG_IsGotov.ItemIndex;
    if Farsh_Weight_AppForm.CBISDEL.Checked then
     Parameters.ParamByName('isdelete').Value:=1
    else
     Parameters.ParamByName('isdelete').Value:=0;
     Parameters.ParamByName('ID_DOC').Value:= Farsh_Weight_AppForm.ID_DOC_INV;
    Open;
  end;
  with QFARSH_TARA do
  begin
    Close;
    Parameters.ParamByName('idfarshw').Value:=
     QFARSH_W.FieldByName('ID_FARSH_W').AsInteger;
    Open;
  end;
   Farsh_Weight_AppForm.id_farsh_w_edit:=0;
   Farsh_Weight_AppForm.Label2.Caption:='';
   Farsh_Weight_AppForm.BBNullTaraClick(Self);
end;

procedure TDM1.QFARSH_DAYCalcFields(DataSet: TDataSet);
begin
  QFARSH_DAYtime_p.value:=QFARSH_DAYDATE_P.Value;
  QFARSH_DAYis_final.value:=IS_FINAL_SER(QFARSH_DAY.FieldByName('ID_SER').AsInteger, Farsh_Weight_AppForm.RG_IsGotov.ItemIndex);
end;

procedure TDM1.QFARSH_WAfterScroll(DataSet: TDataSet);
begin
  with QFARSH_TARA do
  begin
    Close;
    Parameters.ParamByName('idfarshw').Value:=
     QFARSH_W.FieldByName('ID_FARSH_W').AsInteger;
    Open;
  end;
  Farsh_Weight_AppForm.id_farsh_w_edit:=0;
  Farsh_Weight_AppForm.Label2.Caption:='';
end;

procedure TDM1.QFARSH_WCalcFields(DataSet: TDataSet);
begin
   QFARSH_WFW.Value:= QFARSH_WW.Value-QFARSH_WW_TAR.Value;
end;

procedure TDM1.Q_OstatkiAfterScroll(DataSet: TDataSet);
begin
  Farsh_Weight_AppForm.Control_FINAL_Weight;

 with QItogWeight do
 begin
  Close;
    Parameters.ParamByName('idser').Value:=
     Q_Ostatki.FieldByName('ID_SER').AsInteger;
    Parameters.ParamByName('isgotov').Value:=
      Farsh_Weight_AppForm.RG_IsGotov.ItemIndex;
    Parameters.ParamByName('ID_DOC').Value:= Farsh_Weight_AppForm.ID_DOC_INV;
  Open;
  First;
 end;

 with QFARSH_W do
  begin
    Close;
    Parameters.ParamByName('idser').Value:=
     Q_Ostatki.FieldByName('ID_SER').AsInteger;
    Parameters.ParamByName('isgotov').Value:=
      Farsh_Weight_AppForm.RG_IsGotov.ItemIndex;
    if Farsh_Weight_AppForm.CBISDEL.Checked then
     Parameters.ParamByName('isdelete').Value:=1
    else
     Parameters.ParamByName('isdelete').Value:=0;
     Parameters.ParamByName('ID_DOC').Value:= Farsh_Weight_AppForm.ID_DOC_INV;
    Open;
    First;
  end;
  with QFARSH_TARA do
  begin
    Close;
    Parameters.ParamByName('idfarshw').Value:=
     QFARSH_W.FieldByName('ID_FARSH_W').AsInteger;
    Open;
    First;
  end;
   Farsh_Weight_AppForm.id_farsh_w_edit:=0;
   Farsh_Weight_AppForm.Label2.Caption:='';
   Farsh_Weight_AppForm.BBNullTaraClick(Self);



end;

procedure TDM1.Q_OstatkiCalcFields(DataSet: TDataSet);
begin
Q_Ostatkitime_p.Value:= Farsh_Weight_AppForm.DateTimePicker1.DateTime;
Q_Ostatkiis_final.Value:=IS_FINAL_SER(Q_Ostatki.FieldByName('ID_SER').AsInteger, Farsh_Weight_AppForm.RG_IsGotov.ItemIndex);
Farsh_Weight_AppForm.GetItog_Weight;
Q_Ostatkinr.Value:=QItogWeight.FieldByName('W_NETTO').AsFloat;
Q_Ostatkidelta.Value:=Q_Ostatkinr.Value-Q_OstatkiN1.Value;
if abs(Q_OstatkiN1.Value)>Eps then
  Q_Ostatkiper_poter_real.Value:=100*Q_Ostatkidelta.Value/Q_OstatkiN1.Value
else    Q_Ostatkiper_poter_real.Value:=0.0;
end;

end.
