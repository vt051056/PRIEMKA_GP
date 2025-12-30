unit Farsh_Weight_MAIN;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, StdActns,
  ActnList,  Vcl.OleServer, Excel2000,
   Vcl.Grids,
   DBCtrls, DBGrids,DB, IniFiles, Variants, System.UITypes,
   uRS232, DateUtils, Data.Win.ADODB;

type
  TFarsh_Weight_AppForm = class(TForm)
    StatusBar: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileExitItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DBNavigator1: TDBNavigator;
    BBRefresh_FarshDay: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel_In_scales: TPanel;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    Label1: TLabel;
    E_Weight: TEdit;
    BBSave: TBitBtn;
    RG_IsGotov: TRadioGroup;
    BBRep1: TBitBtn;
    BBCancelEdit: TBitBtn;
    Panel_list_parts: TPanel;
    GroupBox3: TGroupBox;
    DBGrid4: TDBGrid;
    Panel8: TPanel;
    DBNavigator3: TDBNavigator;
    GroupBox2: TGroupBox;
    DBGrid3: TDBGrid;
    Panel9: TPanel;
    DBNavigator4: TDBNavigator;
    BBDelW: TBitBtn;
    BBEditW: TBitBtn;
    CBISDEL: TCheckBox;
    BBAddW: TBitBtn;
    NSetting: TMenuItem;
    Timer1: TTimer;
    L_ConditionWeight: TLabel;
    BBTara: TBitBtn;
    BBZerro: TBitBtn;
    GroupBox5: TGroupBox;
    Panel6: TPanel;
    Label2: TLabel;
    DBNavigator2: TDBNavigator;
    BBReset_Tara: TBitBtn;
    BBNullTara: TBitBtn;
    DBGrid2: TDBGrid;
    CheckBox1: TCheckBox;
    BBWeight_On_Off: TBitBtn;
    DBText1: TDBText;
    BB_SET_FINAL_SER: TBitBtn;
    ExcelApplication1: TExcelApplication;
    BB_CANCEL_FINAL_SER: TBitBtn;
    GroupBox8: TGroupBox;
    DBGrid5: TDBGrid;
    GetListFarshDay: TBitBtn;
    DTP_ListFarshDay: TDateTimePicker;
    GroupBox9: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox2: TCheckBox;
    BBGrTovSel: TBitBtn;
    BBAllGrTovSel: TBitBtn;
    Label7: TLabel;
    LGrup: TLabel;
    BBSet_Doc_Inv: TBitBtn;
    L_Doc_Inv: TLabel;
    SB_Import_weight_Gotovogo_Syrogo: TSpeedButton;
    SP_IMPORT_WEIGHT: TADOStoredProc;
    Label3: TLabel;
    DBText2: TDBText;
    BBPrepOstatki: TBitBtn;
    GroupBox7: TGroupBox;
    TP_EDIT: TDateTimePicker;
    DTP_EDIT: TDateTimePicker;
    Panel3: TPanel;
    Panel4: TPanel;
    DBText3: TDBText;
    CB_IS_BASETOV: TCheckBox;
    procedure FileExit1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBRefresh_FarshDayClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBReset_TaraClick(Sender: TObject);
    procedure BBSaveClick(Sender: TObject);
    procedure BBNullTaraClick(Sender: TObject);
    procedure BBAddWClick(Sender: TObject);
    procedure BBEditWClick(Sender: TObject);
    procedure BBDelWClick(Sender: TObject);
    procedure DBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RG_IsGotovClick(Sender: TObject);
    procedure BBRep1Click(Sender: TObject);
    procedure CBISDELClick(Sender: TObject);
    procedure NSettingClick(Sender: TObject);

    procedure Timer1Timer(Sender: TObject);
    procedure BBTaraClick(Sender: TObject);
    procedure BBZerroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBWeight_On_OffClick(Sender: TObject);
    procedure BB_SET_FINAL_SERClick(Sender: TObject);
    procedure BB_CANCEL_FINAL_SERClick(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure GetListFarshDayClick(Sender: TObject);
    procedure DTP_ListFarshDayChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure BBGrTovSelClick(Sender: TObject);
    procedure BBAllGrTovSelClick(Sender: TObject);
    procedure BBSet_Doc_InvClick(Sender: TObject);
    procedure SB_Import_weight_Gotovogo_SyrogoClick(Sender: TObject);
    procedure SB_Import_weight_Gotovogo_SyrogoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BBPrepOstatkiClick(Sender: TObject);private
    { Private declarations }
  public
    { Public declarations }
    d_from, d_to:TDatetime;
    id_farsh_w_edit:integer; //  редактируемая порция  взвешивания
                             // id_farsh_w_edit  =-1  -  новое взвешивание
    S_reason_delete_edit: string;
    RS2321:TRS232;
    ComPort:TComPortNumber;
    Brand_Weight:integer;
    ComPortBaudRate:TComPortBaudRate;
    ComPortDataBits:TComPortDataBits;
    ComPortStopBits: TComPortStopBits;
    ComPortParity:TComPortParity;

    status_Weight:string;    // состояние весов
    Weight:extended;  // вес на весах
  //  Command_Weight:string; // команда, отправляемая на весы (получить вес, оттарить, установить 0)
    old_indicator:string;  // предыдущее показание индикатора весов
    time_start:TDateTime;
    time_stop:TDateTime;
    WeightOn_off:boolean; // признак весов на связи
    Carrent_ID_TOV:longint;
    ID_DOC_INV:longint; //код документа инвентаризации (док должен быть сделан в основной программе)
    ID_SCH:string;
    ID_CLI:longint;
    CTRLBooleanSetProdList:integer;
    procedure Clear_Farsh_Tara_TMP;
    procedure SettingParamRS232FromIni;
    function GetWeight_CAS_DB_H(var status:string):extended;
    function GetWeight_BH_150_1D(var status:string):extended;
    function GetWeight_XK3190_A12ESS(var status:string):extended;
    function GetWeight_CAS_CI_2001A(var status:string):extended;
    procedure Tara_XK3190_A12ESS;
    procedure Zerro_XK3190_A12ESS;
    procedure Rep1;
    procedure ConnectWeight;
    procedure DisConnectWeight;
    procedure Control_FINAL_Weight;
    procedure ReOpen_QFARSHDAY_LIST(vID_TOV:longint);
    procedure GetItog_Weight;
  end;

var
  Farsh_Weight_AppForm: TFarsh_Weight_AppForm;

implementation

uses  about, DataModule1, SysUtils, Reason_del, Setting_f, myfuncs, Math, grtov_f,
Select_Inv;
 const Time_Stabile=3; // время в сек стабилизации веса
// (если в течении его показания веса не изменны, то вес считается стабилизирован)
{$R *.dfm}

procedure TFarsh_Weight_AppForm.BBSaveClick(Sender: TObject);
var W:extended;

begin
 if (DM1.ADS_FARSH_TARA_TMP.State in [dsInsert,dsEdit]) then
    DM1.ADS_FARSH_TARA_TMP.Post;

 try
    W:=StrToFloat(E_Weight.Text);

 except
    MessageDlg('В поле общий вес не число!', mtError, [mbOk], 0);
    E_Weight.SetFocus;
    exit;
 end;

 if (DM1.DSQFARSH_DAY.DataSet.RecordCount=0)
    or (DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger=0)
 then
 begin
   MessageDlg('Нет продукции или вид ее не выбран!', mtError, [mbOk], 0);
   exit;
 end;


 if (W>eps) and (DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger<>0) then
 begin

 if (id_farsh_w_edit=-1) then
 begin
  // вставить данные
 DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@ID_USER']:=ID_user_select;
 DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@W']:=W;

 DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@ID_SER']:=
       DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;

 DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@IS_GOTOV']:=
  RG_IsGotov.ItemIndex;

  DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@ID_DOC']:= ID_DOC_INV;

 DM1.SP_ADD_FARSH_TARA_W.ExecProc;
 if DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@ER']=0 then
  begin
 // DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@ID_FARSH_W_NEW'];
    MessageDlg('Данные взвешивания сохранены!', mtInformation, [mbOk], 0);
 // переоткрыть табл порций и взвешенной тары
   with DM1.QFARSH_W do
   begin
    DisableControls;
    Close;
    Parameters.ParamByName('idser').Value:=
     DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
      Parameters.ParamByName('isgotov').Value:=
      RG_IsGotov.ItemIndex;
      Parameters.ParamByName('ID_DOC').Value:=ID_DOC_INV ;
      if CBISDEL.Checked then
       Parameters.ParamByName('isdelete').Value:=1
      else
       Parameters.ParamByName('isdelete').Value:=0;
    Open;
    DM1.QFARSH_W.Locate('ID_FARSH_W',
      DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@ID_FARSH_W_NEW'],
           [loCaseInsensitive]
      );
      EnableControls;

   end; // with DM1.QFARSH_W do
   DM1.ADS_FARSH_TARA_TMP.DisableControls;
   DM1.ADS_FARSH_TARA_TMP.Close;
   DM1.ADS_FARSH_TARA_TMP.Parameters.ParamValues['iduser']:=ID_user_select;
   DM1.ADS_FARSH_TARA_TMP.Open;
   DM1.ADS_FARSH_TARA_TMP.EnableControls;
   id_farsh_w_edit:=0;
   E_Weight.Text:='0';

   Panel_In_scales.Visible:=False;
   Panel_list_parts.Visible:=True;
   Panel_list_parts.Align:=alClient;
  end  //  if DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@ER']=0 then
  else
  begin
    MessageDlg('Ошибка при добавлении взвешивания!', mtError, [mbOk], 0);

  end;  // else if DM1.SP_ADD_FARSH_TARA_W.Parameters.ParamValues['@ER']=0 then

 end  //  if (id_farsh_w_edit=-1) then
 else
 begin
  if (id_farsh_w_edit<>0) then
  begin
   if GetReasonStr(S_reason_delete_edit)=mrOk then
   begin

     // сохранить редактируемую порцию
    if DM1.QFARSHDAY_LIST.FieldByName('ID_SER').AsInteger<>
     DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger then
    begin
        if MessageDlg('Вы действительно хотите изменить серию продукции в навеске?',
         mtConfirmation, [mbYes, mbNo], 0) = mrNo then  Exit;

    end;




   DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@ID_USER']:=ID_user_select;
   DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@COMMENT_DEL']:=S_reason_delete_edit;
   DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@W']:=W;
   DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@ID_FARSH_W']:=id_farsh_w_edit;
   DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@ID_SER_NEW']:=
      DM1.QFARSHDAY_LIST.FieldByName('ID_SER').AsInteger;
   DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@DT_NEW']:=DTP_EDIT.DateTime;

   DM1.SP_EDIT_FARSH_TARA_W.ExecProc;
   if DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@ER']=0 then
   begin
    // переоткрыть табл порций и взвешенной тары
    with DM1.QFARSH_W do
    begin
     DisableControls;
     Close;
     Parameters.ParamByName('idser').Value:=
      DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
     Parameters.ParamByName('isgotov').Value:=
      RG_IsGotov.ItemIndex;
      Parameters.ParamByName('ID_DOC').Value:=ID_DOC_INV ;
      if CBISDEL.Checked then
       Parameters.ParamByName('isdelete').Value:=1
      else
       Parameters.ParamByName('isdelete').Value:=0;
     Open;
     DM1.QFARSH_W.Locate('ID_FARSH_W',
      DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@ID_FARSH_W_NEW'],
         [loCaseInsensitive]);
     EnableControls;
    end;   //  with DM1.QFARSH_W do
    DM1.ADS_FARSH_TARA_TMP.DisableControls;
    DM1.ADS_FARSH_TARA_TMP.Close;
    DM1.ADS_FARSH_TARA_TMP.Parameters.ParamValues['iduser']:=ID_user_select;
    DM1.ADS_FARSH_TARA_TMP.Open;
    DM1.ADS_FARSH_TARA_TMP.EnableControls;
    id_farsh_w_edit:=0;
    E_Weight.Text:='0';

    Panel_In_scales.Visible:=False;
    Panel_list_parts.Visible:=True;
    Panel_list_parts.Align:=alClient;
   end  // if DM1.SP_EDIT_FARSH_TARA_W.Parameters.ParamValues['@ER']=0 then
   else
   begin
    MessageDlg('Ошибка при изменении взвешивания!', mtError, [mbOk], 0);
    exit;
   end;

   end  // if GetReasonStr(S_reason_delete_edit)=mrOk then
   else exit;

  end  // if (id_farsh_w_edit<>0) then
   else
   begin
     MessageDlg('Нажмите кнопку добавления или редактирования взвешивания!',
      mtError, [mbOk], 0);
   end;  // else if (id_farsh_w_edit<>0) then
 end;  // else   if (id_farsh_w_edit=-1) then

 end; // if (W>eps) and (DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger<>0) then
 GetItog_Weight;
 BBRefresh_FarshDayClick(Sender);
end;

procedure TFarsh_Weight_AppForm.BBSearchDownClick(Sender: TObject);

var is_found:boolean;
begin
 DM1.DSQFARSH_DAY.DataSet.DisableControls;
 with DM1.DSQFARSH_DAY.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('TOV').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DM1.DSQFARSH_DAY.DataSet.EnableControls;
end;

procedure TFarsh_Weight_AppForm.BBSearchUpClick(Sender: TObject);

var is_found:boolean;
begin
 DM1.DSQFARSH_DAY.DataSet.DisableControls;
 with DM1.DSQFARSH_DAY.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('TOV').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DM1.DSQFARSH_DAY.DataSet.EnableControls;

end;

procedure TFarsh_Weight_AppForm.BBSet_Doc_InvClick(Sender: TObject);
var vID_INV:longint; var vNI:string; var vDATE_INV:TDateTime;
 var vID_SCH:string; var vID_CLI:longint;
begin
 if Select_Inv_ShowModal(vID_INV, vNI, vDATE_INV, vID_SCH, vID_CLI)=mrOk then
 begin
  ID_DOC_INV:=vID_INV;
  ID_SCH:=vID_SCH;
  ID_CLI:=vID_CLI;
  L_Doc_Inv.Caption:=Format('№ %s за %s', [vNI, DateToStr(vDATE_INV)]);
  DateTimePicker1.DateTime:=vDATE_INV;
  BBPrepOstatkiClick(Sender);
  BBRefresh_FarshDayClick(Sender);
 end;
end;

procedure TFarsh_Weight_AppForm.BBTaraClick(Sender: TObject);
begin
  Tara_XK3190_A12ESS;
end;

procedure TFarsh_Weight_AppForm.BBWeight_On_OffClick(Sender: TObject);
begin
 if WeightOn_off then  DisConnectWeight
 else ConnectWeight;
end;

procedure TFarsh_Weight_AppForm.BBZerroClick(Sender: TObject);
begin
  Zerro_XK3190_A12ESS;
end;

procedure TFarsh_Weight_AppForm.Control_FINAL_Weight;
begin
  if DM1.IS_FINAL_SER( DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger, RG_IsGotov.ItemIndex ) then
  begin
    BB_CANCEL_FINAL_SER.Visible:=True;
    BB_SET_FINAL_SER.Visible:=False;
  end
  else
  begin
    BB_CANCEL_FINAL_SER.Visible:=False;
    BB_SET_FINAL_SER.Visible:=True;
  end;
end;

procedure TFarsh_Weight_AppForm.BB_CANCEL_FINAL_SERClick(Sender: TObject);
begin
  with DM1.SP_CANCEL_FINAL_SER do
  begin
    Parameters.ParamByName('@ID_SER').Value:=DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
    Parameters.ParamByName('@IS_GOTOV').Value:= RG_IsGotov.ItemIndex;
    ExecProc;
    if Parameters.ParamValues['@ER']<>0 then
    begin
      MessageDlg('Ошибка при установке признака финального взвешивания!', mtError, [mbOk], 0);
    end;
    Control_FINAL_Weight;
  end;
  BBRefresh_FarshDayClick(Sender);
end;

procedure TFarsh_Weight_AppForm.BB_SET_FINAL_SERClick(Sender: TObject);
begin
  with DM1.SP_SET_FINAL_SER do
  begin
    Parameters.ParamByName('@ID_SER').Value:=DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
    Parameters.ParamByName('@IS_GOTOV').Value:= RG_IsGotov.ItemIndex;
    ExecProc;
    if Parameters.ParamValues['@ER']<>0 then
    begin
      MessageDlg('Ошибка при установке признака финального взвешивания!', mtError, [mbOk], 0);
    end;
    Control_FINAL_Weight;
  end;
  BBRefresh_FarshDayClick(Sender);
end;



procedure TFarsh_Weight_AppForm.BBPrepOstatkiClick(Sender: TObject);
var Save_Cursor:TCursor;
begin
 Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
 with DM1.SP_SET_INV_OSTATKI_TMP do
  begin
    Parameters.ParamByName('@DATE_REP_TO').Value:= DateTimePicker1.DateTime;
    Parameters.ParamByName('@ID_USER').Value:=ID_user_select;
    Parameters.ParamByName('@ID_SCH').Value:=ID_SCH;
    Parameters.ParamByName('@ID_CLI').Value:=ID_CLI;
    if CB_IS_BASETOV.Checked then
       Parameters.ParamByName('@IS_BASE_TOV').Value:= 1
    else   Parameters.ParamByName('@IS_BASE_TOV').Value:= 0;


    ExecProc;
    if Parameters.ParamValues['@ER']<>0 then
    begin
      MessageDlg('Ошибка при расчете остатков!', mtError, [mbOk], 0);
        Screen.Cursor := Save_Cursor;
      exit;
    end;

  end;
  BBRefresh_FarshDayClick(Sender);
  Screen.Cursor := Save_Cursor;
  MessageDlg('Подготовка остатков выполнена!', mtInformation, [mbOk], 0);

end;

procedure TFarsh_Weight_AppForm.BBRefresh_FarshDayClick(Sender: TObject);
begin
 // весь день
 d_from:= DateOf(DateTimePicker1.Date); //IncHour(DateTimePicker1.Date,0);
 d_to:= IncHour(d_from,24);// IncHour(DateTimePicker1.Date,24); //  DateTimePicker1.Date+(1.0-1.0/24.0/60.0/60.0) ;

  if RG_IsGotov.ItemIndex in [0, 1] then   // приход сырого или готового
  begin

    with TADOQuery(DM1.DSQFARSH_DAY.DataSet) do
    begin
      Disablecontrols;
      if Active then Carrent_ID_TOV:=FieldByName('ID_TOV').AsInteger
      else  Carrent_ID_TOV:=-1;

      Close;
      Parameters.ParamByName('D_FROM').Value:=d_from;
      Parameters.ParamByName('D_TO').Value:=d_to;
      Parameters.ParamByName('IS_GOTOV').Value:=RG_IsGotov.ItemIndex;
      Parameters.ParamByName('ID_GRTOV').Value:=ID_grtov_select;
      Open;
      First;
      if Carrent_ID_TOV<>-1 then locate('ID_TOV',Carrent_ID_TOV,[loCaseInsensitive]);
      Enablecontrols;



    end;
    with DM1.QFARSH_W do
    begin
      Close;
      Parameters.ParamByName('idser').Value:=
       DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
      Parameters.ParamByName('isgotov').Value:=
        RG_IsGotov.ItemIndex;
        Parameters.ParamByName('ID_DOC').Value:=ID_DOC_INV ;
      if CBISDEL.Checked then
       Parameters.ParamByName('isdelete').Value:=1
      else
       Parameters.ParamByName('isdelete').Value:=0;
      Open;
      First;
    end;
  end
  else   // инвентаризация
  begin
   with TADOQuery(DM1.DSQFARSH_DAY.DataSet) do
    begin
      Disablecontrols;
      if Active then Carrent_ID_TOV:=FieldByName('ID_SER').AsInteger
      else  Carrent_ID_TOV:=-1;

      Close;
      Parameters.ParamByName('ID_GRTOV').Value:=ID_grtov_select;
      Parameters.ParamByName('ID_USER').Value:=ID_USER_select;
      Open;
      First;
      if Carrent_ID_TOV<>-1 then locate('ID_SER',Carrent_ID_TOV,[loCaseInsensitive]);

       Enablecontrols;
       with DM1.QFARSH_W do
        begin
          Close;
          Parameters.ParamByName('idser').Value:=
           DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
          Parameters.ParamByName('isgotov').Value:=
            RG_IsGotov.ItemIndex;
            Parameters.ParamByName('ID_DOC').Value:=ID_DOC_INV ;
          if CBISDEL.Checked then
           Parameters.ParamByName('isdelete').Value:=1
          else
           Parameters.ParamByName('isdelete').Value:=0;
          Open;
          First;
        end;
  end;
  end;

 

  with DM1.QFARSH_TARA do
  begin
    Close;
    Parameters.ParamByName('idfarshw').Value:=
     DM1.QFARSH_W.FieldByName('ID_FARSH_W').AsInteger;
    Open;
    First;
  end;

end;

procedure TFarsh_Weight_AppForm.GetItog_Weight;
begin
   with DM1.QItogWeight do
 begin
  Close;
    Parameters.ParamByName('idser').Value:=
     DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
    Parameters.ParamByName('isgotov').Value:=
      Farsh_Weight_AppForm.RG_IsGotov.ItemIndex;
    Parameters.ParamByName('ID_DOC').Value:= ID_DOC_INV;
  Open;
 end;
end;


procedure TFarsh_Weight_AppForm.Rep1;

var

 RangeE, First_RangeE, Last_RangeE:Excel2000.ExcelRange;
 i_row :integer;


begin

ExcelApplication1.Visible[0]:=False;
ExcelApplication1.Workbooks.Add(NULL,0);
RangeE:=ExcelApplication1.ActiveCell;
RangeE.Font.Size:=10;
RangeE.Value:='Отчет о взвешивании сырого фарша';
i_row:=2;
RangeE:=ExcelApplication1.Range['A'+IntToStr(i_row),'A'+IntToStr(i_row)];


 with DM1.QRep1 do
  begin
    Close;
    Parameters.ParamByName('D_FROM').Value:=d_from;
    Parameters.ParamByName('D_TO').Value:=d_to;
    Open;
    First;
  end;

 First_RangeE :=RangeE;
 RangeE.Font.Bold:=true;
 RangeE.ColumnWidth:=15;
 RangeE.HorizontalAlignment := xlCenter;
 RangeE.VerticalAlignment := xlCenter;
 RangeE.WrapText := true;
 RangeE.Value:='Группа продукции';

 RangeE:=RangeE.Next;
 RangeE.Font.Bold:=true;
 RangeE.ColumnWidth:=30;
 RangeE.HorizontalAlignment := xlCenter;
 RangeE.VerticalAlignment := xlCenter;
 RangeE.WrapText := true;
 RangeE.Value:='Продукция';

 RangeE:=RangeE.Next;
 RangeE.Font.Bold:=true;
 RangeE.ColumnWidth:=5;
 RangeE.HorizontalAlignment := xlCenter;
 RangeE.VerticalAlignment := xlCenter;
 RangeE.WrapText := true;
 RangeE.Value:='Изм';

 RangeE:=RangeE.Next;
 RangeE.Font.Bold:=true;
 RangeE.ColumnWidth:=17;
 RangeE.HorizontalAlignment := xlCenter;
 RangeE.VerticalAlignment := xlCenter;
 RangeE.WrapText := true;
 RangeE.Value:='Дата запуска';

 RangeE:=RangeE.Next;
 RangeE.Font.Bold:=true;
 RangeE.ColumnWidth:=10;
 RangeE.HorizontalAlignment := xlCenter;
 RangeE.VerticalAlignment := xlCenter;
 RangeE.WrapText := true;
 RangeE.Value:='Вес сырого';

 RangeE:=RangeE.Next;
 RangeE.Font.Bold:=true;
 RangeE.ColumnWidth:=10;
 RangeE.HorizontalAlignment := xlCenter;
 RangeE.VerticalAlignment := xlCenter;
 RangeE.WrapText := true;
 RangeE.Value:='Вес готового';

 with DM1.QRep1 do
 begin
  while not Eof do
  begin
   Inc(i_row);
   RangeE:=ExcelApplication1.Range['A'+IntToStr(i_row),'A'+IntToStr(i_row)];

   RangeE.Value:=FieldByName('GRUPTOV').AsString;

   RangeE:=RangeE.Next;
   RangeE.Value:=FieldByName('TOV').AsString;

   RangeE:=RangeE.Next;
   RangeE.Value:=FieldByName('EDIZM').AsString;

   RangeE:=RangeE.Next;
   RangeE.Value:=FieldByName('DATE_P').AsString;

   RangeE:=RangeE.Next;
   RangeE.NumberFormat:='0,00';
   RangeE.Value:=FieldByName('W_SYR_WITH_TARA').AsFloat-
                 FieldByName('W_SYR_TARA').AsFloat;

   RangeE:=RangeE.Next;
   RangeE.NumberFormat:='0,00';
   RangeE.Value:=FieldByName('W_GOT_WITH_TARA').AsFloat-
                 FieldByName('W_GOT_TARA').AsFloat;

   Next;
  end;

 end;



 Last_RangeE :=RangeE;


  RangeE:=ExcelApplication1.Range[First_RangeE.Cells, Last_RangeE.Cells];

  RangeE.Borders[xlDiagonalDown].LineStyle := xlNone;
    RangeE.Borders[xlDiagonalUp].LineStyle := xlNone;
    With RangeE.Borders[xlEdgeLeft] do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;

    With RangeE.Borders[xlEdgeTop] do
     begin
        LineStyle := xlContinuous ;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;
    With RangeE.Borders[xlEdgeBottom] do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;
    With RangeE.Borders[xlEdgeRight]  do
     begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
     end;


     With RangeE.Borders[xlInsideVertical]  do
      begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
      end;

      With RangeE.Borders[xlInsideHorizontal]  do
      begin
        LineStyle := xlContinuous;
        Weight := xlThin;
        ColorIndex := xlAutomatic;
      end;


DM1.QRep1.Close;
ExcelApplication1.Visible[0]:=True;

end;


procedure TFarsh_Weight_AppForm.BBRep1Click(Sender: TObject);
begin
// отчет о взвешивании текущего дня
 Rep1;
end;

procedure TFarsh_Weight_AppForm.BBReset_TaraClick(Sender: TObject);
begin

 DM1.SP_COPY_TARA_W_TO_TMP.Parameters.ParamValues['@ID_USER']:=ID_user_select;
 DM1.SP_COPY_TARA_W_TO_TMP.ExecProc;
 if DM1.SP_COPY_TARA_W_TO_TMP.Parameters.ParamValues['@ER']=0 then
  begin
   id_farsh_w_edit:=0;
   DM1.ADS_FARSH_TARA_TMP.DisableControls;
   DM1.ADS_FARSH_TARA_TMP.Close;
   DM1.ADS_FARSH_TARA_TMP.Parameters.ParamValues['iduser']:=ID_user_select;
   DM1.ADS_FARSH_TARA_TMP.Open;
   DM1.ADS_FARSH_TARA_TMP.EnableControls;
//   MessageDlg('Данные обновлены!', mtWarning, [mbOk], 0);

  end
 else MessageDlg('Ошибка при обновлении данных!', mtError, [mbOk], 0);
end;

procedure TFarsh_Weight_AppForm.BBAddWClick(Sender: TObject);
begin
 // новое взвешивание
 if  RG_IsGotov.ItemIndex=2 then
 begin
   if ID_DOC_INV=-1 then
   begin
    MessageDlg('Не указан документ инвентаризации!', mtError, [mbOk], 0);
    BBSet_Doc_InvClick(Sender);
    exit;
   end;
 end;

 Panel_In_scales.Visible:=True;
 Panel_In_scales.Align:=alClient;
 Panel_list_parts.Visible:=False;

 Panel3.Visible:=True;
 Panel3.height:=145;
 Panel4.Visible:=True;

 GroupBox7.Visible:=False;
 GroupBox8.Visible:=False;
// GroupBox4.Align:=alTop;
// GroupBox5.Align:=alClient;
 Panel_In_scales.height:=145;
// GroupBox4.height:=145;
 Label2.Caption:='Введите данные о весе и таре';
 BBReset_TaraClick(Sender);
 id_farsh_w_edit:=-1;
end;

procedure TFarsh_Weight_AppForm.BBEditWClick(Sender: TObject);
begin
  Panel_list_parts.Visible:=False;
  Panel_In_scales.Visible:=True;
  Panel_In_scales.Align:=alClient;

  Panel3.Visible:=True;
  Panel3.height:=328;
  Panel4.Visible:=True;
  GroupBox7.Visible:=True;
  GroupBox8.Visible:=True;

  if RG_IsGotov.ItemIndex=2 then // инвентаризация
  begin
    GroupBox8.Caption:='Товары инвентаризации';
    DTP_ListFarshDay.Visible:=False;
    GetListFarshDay.Visible:=False;
  end
  else
  begin
    GroupBox8.Caption:='Программа запуска за дату';
    DTP_ListFarshDay.Visible:=True;
    GetListFarshDay.Visible:=True;
  end;


 // Panel_In_scales.height:=473;
//  GroupBox4.height:=353;
 // редактирование существующего взвешивания
 id_farsh_w_edit:=DM1.QFARSH_W.FieldByName('ID_FARSH_W').AsInteger;

  DTP_EDIT.DateTime:=DM1.QFARSH_W.FieldByName('DT').AsFloat;
  TP_EDIT.DateTime:=DM1.QFARSH_W.FieldByName('DT').AsFloat;

 //  Carrent_ID_TOV:= DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
  Carrent_ID_TOV:= DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_TOV').AsInteger;
  DTP_ListFarshDay.DateTime:=DateTimePicker1.DateTime;
  GetListFarshDayClick(Sender);


 DM1.SP_COPY_EDIT_TARA_W_TO_TMP.Parameters.ParamValues['@ID_FARSH_W']:=
   id_farsh_w_edit;
 DM1.SP_COPY_EDIT_TARA_W_TO_TMP.Parameters.ParamValues['@ID_USER']:=
   ID_user_select;
 DM1.SP_COPY_EDIT_TARA_W_TO_TMP.ExecProc;
 if DM1.SP_COPY_EDIT_TARA_W_TO_TMP.Parameters.ParamValues['@ER']=0 then
  begin
   E_Weight.Text:=
    FloatToStr(DM1.SP_COPY_EDIT_TARA_W_TO_TMP.Parameters.ParamValues['@W']);
   DM1.ADS_FARSH_TARA_TMP.DisableControls;
   DM1.ADS_FARSH_TARA_TMP.Close;
   DM1.ADS_FARSH_TARA_TMP.Parameters.ParamValues['iduser']:=ID_user_select;
   DM1.ADS_FARSH_TARA_TMP.Open;
   DM1.ADS_FARSH_TARA_TMP.EnableControls;

  end;
   Label2.Caption:='Введите данные о весе и таре';
end;

procedure TFarsh_Weight_AppForm.BBGrTovSelClick(Sender: TObject);
begin
if F_grtovDlg= mrOk then
 begin
  LGrup.Caption:=grtov_select;
  BBRefresh_FarshDayClick(Sender);
 end;
end;

procedure TFarsh_Weight_AppForm.BBAllGrTovSelClick(Sender: TObject);
begin
 LGrup.Caption:='Все группы';
 ID_grtov_select:=-1;
 BBRefresh_FarshDayClick(Sender)

end;

procedure TFarsh_Weight_AppForm.BBDelWClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
if GetReasonStr(S_reason_delete_edit)=mrOk then
begin
  with DM1.QFARSH_W do
  begin
    Disablecontrols;
    carrent_ID:=FieldByName('ID_FARSH_W').AsInteger;
    prior;
    pred_ID:=FieldByName('ID_FARSH_W').AsInteger;
    if carrent_ID=pred_ID then Next
    else begin Next; Next; end;
    next_ID:=FieldByName('ID_FARSH_W').AsInteger;
    EnableControls;
  end;


 DM1.SP_DEL_FARSH_W.Parameters.ParamValues['@ID_FARSH_W']:=
   carrent_ID;
 DM1.SP_DEL_FARSH_W.Parameters.ParamValues['@ID_USER_DEL']:=
   ID_user_select;
 DM1.SP_DEL_FARSH_W.Parameters.ParamValues['@COMMENT_DEL']:=
   S_reason_delete_edit;

 DM1.SP_DEL_FARSH_W.ExecProc;
 if DM1.SP_DEL_FARSH_W.Parameters.ParamValues['@ER']=0 then
  begin

  with DM1.QFARSH_W do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('idser').Value:=
     DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
     Parameters.ParamByName('isgotov').Value:=
      RG_IsGotov.ItemIndex;
      Parameters.ParamByName('ID_DOC').Value:=ID_DOC_INV ;
     if CBISDEL.Checked then
     Parameters.ParamByName('isdelete').Value:=1
     else
     Parameters.ParamByName('isdelete').Value:=0;
    Open;

    if pred_ID=carrent_ID then
      Locate('ID_FARSH_W', next_ID, [loCaseInsensitive])
    else
    if next_ID=carrent_ID then
      Locate('ID_FARSH_W', pred_ID, [loCaseInsensitive])
    else Locate('ID_FARSH_W', pred_ID, [loCaseInsensitive]);


    EnableControls;
  end;
  with DM1.QFARSH_TARA do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('idfarshw').Value:=
     DM1.QFARSH_W.FieldByName('ID_FARSH_W').AsInteger;
    Open;
    EnableControls;
  end;

  end
 else MessageDlg('Ошибка при удалении порции взвешивания!', mtError, [mbOk], 0);
 BBRefresh_FarshDayClick(Sender);
end;


end;

procedure TFarsh_Weight_AppForm.BBNullTaraClick(Sender: TObject);
begin
 // обнулить временную тару
  Clear_Farsh_Tara_TMP;
  id_farsh_w_edit:=0;
  Panel_In_scales.Visible:=False;
  Panel_list_parts.Visible:=True;
end;

procedure TFarsh_Weight_AppForm.CBISDELClick(Sender: TObject);
begin
  with DM1.QFARSH_W do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('idser').Value:=
     DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
     Parameters.ParamByName('isgotov').Value:=
      RG_IsGotov.ItemIndex;
      Parameters.ParamByName('ID_DOC').Value:=ID_DOC_INV ;
     if CBISDEL.Checked then
     Parameters.ParamByName('isdelete').Value:=1
    else
     Parameters.ParamByName('isdelete').Value:=0;
    Open;
    EnableControls;
  end;
   with DM1.QFARSH_TARA do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('idfarshw').Value:=
     DM1.QFARSH_W.FieldByName('ID_FARSH_W').AsInteger;
    Open;
    EnableControls;
  end;
end;

procedure TFarsh_Weight_AppForm.ConnectWeight;
begin
  old_indicator:='';
  if RS2321=nil then  RS2321:=TRS232.Create(nil);
  SettingParamRS232FromIni;
  RS2321.Disconnect;
  RS2321.Active:=True;
  Timer1.Enabled:=True;
  WeightOn_off:=True;
  BBWeight_On_Off.Caption:='Выкл.весы';
  L_ConditionWeight.Caption:='Весы включены';
  E_Weight.ReadOnly:=True;
end;

procedure TFarsh_Weight_AppForm.DisConnectWeight;
begin
  old_indicator:='';
  try
  if RS2321<>nil then
  begin
    RS2321.Disconnect;
    RS2321.Active:=False;
    RS2321.Destroy;
    RS2321:=nil;
  end;
  except
   MessageDlg('DisConnectWeight. Чтение данных с весов не возможно!', mtError,  [mbOk], 0);
  end;
  Timer1.Enabled:=False;
  WeightOn_off:=False;
  BBWeight_On_Off.Caption:='Вкл.весы';
  L_ConditionWeight.Caption:='Весы отключены';
  E_Weight.ReadOnly:=False;
  BBSave.Enabled:=True;
end;



procedure TFarsh_Weight_AppForm.DTP_ListFarshDayChange(Sender: TObject);
begin
  GetListFarshDayClick(Sender);
end;

procedure TFarsh_Weight_AppForm.Edit1Change(Sender: TObject);
begin
if not CheckBox1.Checked then
 DM1.DSQFARSH_DAY.DataSet.Locate('TOV',Edit1.Text,[loPartialKey]);
end;

procedure TFarsh_Weight_AppForm.CheckBox1Click(Sender: TObject);
begin
 // BBAddW.Enabled:=CheckBox1.Checked;
 if DM1.QFARSH_W.RecordCount>0 then
 begin
  BBEditW.Enabled:=CheckBox1.Checked;
  BBDelW.Enabled:=CheckBox1.Checked;
  BBReset_Tara.Enabled:=CheckBox1.Checked;
  BBNullTara.Enabled:=CheckBox1.Checked;
 end;
end;

procedure TFarsh_Weight_AppForm.DateTimePicker1Change(Sender: TObject);
begin

 BBRefresh_FarshDayClick(Sender);

end;

procedure TFarsh_Weight_AppForm.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if Field.FieldName='TOV' then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('is_final').AsBoolean then
      DBGrid1.Canvas.Font.Color := clGreen;
  end;

  DBGrid1.DefaultDrawDataCell(Rect,field, State);
end;

procedure TFarsh_Weight_AppForm.DBGrid3DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
 if Field.FieldName='FW' then
 begin
  if Field.Value<eps then
   DBGrid3.Canvas.Font.Color := clRed;
 end;
 if Field.FieldName='DT' then
 begin
  if DM1.QFARSH_W.FieldByName('IS_FINAL_SER').AsInteger=1 then
   DBGrid3.Canvas.Font.Color := clGreen;
 end;
 DBGrid3.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TFarsh_Weight_AppForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TFarsh_Weight_AppForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if CanClose then
 begin
  DisConnectWeight;
 // RS2321.Active:=False;
  with DM1.Tb_USER_CONNECT do
  begin
  Open;
   while not EOF do
     begin
      if fieldbyname('ID_USER').AsInteger=ID_user_select  then
      begin
        Delete;
        break;
      end;
      next;
     end;
     close;
  end;


  DM1.DSQFARSH_DAY.DataSet.Close;


  DM1.ADOConnection1.Connected:=False;
 end;
end;

procedure TFarsh_Weight_AppForm.FormCreate(Sender: TObject);
 var iniFile:TIniFile;

begin

case status_user of
0: // обычные пользователи
  begin
   CBISDEL.Enabled:=false;
   RG_IsGotov.Enabled:=True;
  end;
1:  //  админ приложения
  begin
   CBISDEL.Enabled:=false;
   RG_IsGotov.Enabled:=True;
  end;
2: // админ БД
  begin
   CBISDEL.Enabled:=True;
   RG_IsGotov.Enabled:=True;
  end;


else
 begin
   CBISDEL.Enabled:=false;
   RG_IsGotov.Enabled:=True;
 end;

end;


  DateTimePicker1.Date:=Date();
  CheckBox1.Checked:=false;
//  BBAddW.Enabled:=CheckBox1.Checked;
  BBEditW.Enabled:=CheckBox1.Checked;
  BBDelW.Enabled:=CheckBox1.Checked;
  BBReset_Tara.Enabled:=CheckBox1.Checked;
  BBNullTara.Enabled:=CheckBox1.Checked;
  Clear_Farsh_Tara_TMP;


   id_farsh_w_edit:=0;
   E_Weight.Text:='0';
   Label2.Caption:='';

  IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
   ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));

  grtov_select:= 'Все группы';
  LGrup.Caption:=grtov_select;
  ID_grtov_select:=-1;
  with IniFile do
  begin
    RG_IsGotov.ItemIndex:=ReadInteger('MAIN_F','isgotov', RG_IsGotov.ItemIndex);
  //  ID_grtov_select:=ReadInteger('MAIN_F','ID_GR_TOV_SELECT', -1);
  //  grtov_select:=ReadString('MAIN_F','GR_TOV_SELECT', 'Все группы');

    Free;
  end;

  LGrup.Caption:=grtov_select;

  CB_IS_BASETOV.Checked:=True;
  BBRefresh_FarshDayClick(Sender);
  L_Doc_Inv.Visible:=False;
  BBSet_Doc_Inv.Visible:=False;

  case RG_IsGotov.ItemIndex of
 0:
 begin
   GroupBox2.Caption:='Взвешенные порции фарша';
   Caption:='Учет сырого фарша';
   GroupBox1.Caption:='Производственная программа на';
   BBPrepOstatki.Visible:=False;
   CB_IS_BASETOV.Visible:=False;
 end;
 1:
 begin
   GroupBox2.Caption:='Взвешенные порции готовой продукции';
   Caption:='Учет выхода готовой продукции';
   GroupBox1.Caption:='Производственная программа на';
   BBPrepOstatki.Visible:=False;
   CB_IS_BASETOV.Visible:=False;
 end;
 2:
 begin
   GroupBox2.Caption:='Взвешенные инвентаризации готовой продукции';
   Caption:='Учет инвентаризации готовой продукции';
   GroupBox1.Caption:='Продукция для инвентаризации';
    L_Doc_Inv.Visible:=True;
    BBSet_Doc_Inv.Visible:=True;
    BBPrepOstatki.Visible:=True;
    CB_IS_BASETOV.Visible:=True;
 end;
 end;

  Panel_In_scales.Visible:=False;
  Panel_list_parts.Visible:=True;
  Panel_list_parts.Align:=alClient;
  Panel_In_scales.Align:=alClient;
  RS2321:=nil;
//  RS2321:=TRS232.Create(nil);
//  SettingParamRS232FromIni;
  DisConnectWeight;
  ID_DOC_INV:=-1;
  L_Doc_Inv.Caption:='Не определен';

end;



procedure TFarsh_Weight_AppForm.FormShow(Sender: TObject);
begin
 // ConnectWeight;
  old_indicator:='';
end;

procedure TFarsh_Weight_AppForm.SB_Import_weight_Gotovogo_SyrogoClick(
  Sender: TObject);
begin
if RG_IsGotov.ItemIndex in [0,1] then  // для сырого
begin
 if CTRLBooleanSetProdList=1 then // нажата Alt - импорт веса из системы взвешивания
  begin                            // всей программы текущего времени запуска
    SP_IMPORT_WEIGHT.Parameters.ParamValues['@IS_ALL']:= 1;
   end
  else
  begin
    SP_IMPORT_WEIGHT.Parameters.ParamValues['@IS_ALL']:= 0;
  end;

  SP_IMPORT_WEIGHT.Parameters.ParamValues['@ID_SER']:=
      DM1.DSQFARSH_DAY.DataSet.FieldByName('ID_SER').AsInteger;
  SP_IMPORT_WEIGHT.Parameters.ParamValues['@IS_GOTOV']:= RG_IsGotov.ItemIndex;
  SP_IMPORT_WEIGHT.ExecProc;
  if SP_IMPORT_WEIGHT.Parameters.ParamValues['@ER']<>0 then
      MessageDlg('Ошибка при импорте веса!'+
      SP_IMPORT_WEIGHT.Parameters.ParamValues['@ER_COMMENT'],  mtError, [mbOk], 0);
  BBRefresh_FarshDayClick(Sender);
end;

end;

procedure TFarsh_Weight_AppForm.SB_Import_weight_Gotovogo_SyrogoMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 CTRLBooleanSetProdList:=0;
 if ssAlt in Shift then
      CTRLBooleanSetProdList:=1;
 if ssShift in Shift then
      CTRLBooleanSetProdList:=2;
 if  ssCtrl in Shift then
      CTRLBooleanSetProdList:=3;
 if  ssRight in Shift then
      CTRLBooleanSetProdList:=4;
end;

procedure TFarsh_Weight_AppForm.SettingParamRS232FromIni;
 var iniFile:TIniFile;
 i_param:integer;
begin
IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
   ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));

  with IniFile do
  begin
    i_param:=Readinteger('MAIN_F','COM_PORT',0);
    case i_param of
     0: ComPort:=pnCOM1;
     1: ComPort:=pnCOM2;
     2: ComPort:=pnCOM3;
     3: ComPort:=pnCOM4;
     4: ComPort:=pnCOM5;
     5: ComPort:=pnCOM6;
     6: ComPort:=pnCOM7;
     7: ComPort:=pnCOM8;
    end;

    Brand_Weight:=Readinteger('MAIN_F','Brand_Weight',0);

    i_param:=Readinteger('MAIN_F','ComPortBaudRate',0);
    case i_param of
     0: ComPortBaudRate:=br110;
     1: ComPortBaudRate:=br300;
     2: ComPortBaudRate:=br600;
     3: ComPortBaudRate:=br1200;
     4: ComPortBaudRate:=br2400;
     5: ComPortBaudRate:=br4800;
     6: ComPortBaudRate:=br9600;
     7: ComPortBaudRate:=br14400;
     8: ComPortBaudRate:=br19200;
     9: ComPortBaudRate:=br38400;
     10: ComPortBaudRate:=br56000;
     11: ComPortBaudRate:=br57600;
     12: ComPortBaudRate:=br115200;
    end;

    i_param:=Readinteger('MAIN_F','ComPortDataBits',0);
    case i_param of
     0: ComPortDataBits:=db5BITS;
     1: ComPortDataBits:=db6BITS;
     2: ComPortDataBits:=db7BITS;
     3: ComPortDataBits:=db8BITS;
    end;

    i_param:=Readinteger('MAIN_F','ComPortStopBits',0);
    case i_param of
     0: ComPortStopBits:=sb1BITS;
     1: ComPortStopBits:=sb1HALFBITS;
     2: ComPortStopBits:=sb2BITS;
    end;

    i_param:=Readinteger('MAIN_F','ComPortParity',0);
    case i_param of
     0: ComPortParity:=ptNONE;
     1: ComPortParity:=ptODD;
     2: ComPortParity:=ptEVEN;
     3: ComPortParity:=ptMARK;
     4: ComPortParity:=ptSPACE;
    end;
    Free;
  end;
  RS2321.SetParams(ComPort, ComPortBaudRate, ComPortDataBits, ComPortStopBits, ComPortParity );
end;



function TFarsh_Weight_AppForm.GetWeight_CAS_DB_H(var status:string):extended;
  // status = S - стабилизированный вес   U - нет
  const enq=$05;
        ace=$06;
        nak=$15;
        sdh=$01;
        stk=$02;
        etk=$03;
        etd=$04;
        dc1=$11;
        dc2=$12;
        dc3=$13;
        dc4=$14;
var Str1,Str,w,cel,dro:string;
    nCount:word;
    j_point,i,ndro:integer;
    vcel,vdro,v:extended;

   sign:string; // знак веса ' ' - + '-' --
begin
result:=0;
SetLength(Str1,1);
Str1[1]:=chr(enq);
if RS2321.SendString(Str1) then
begin
 if RS2321.ReadString(Str,1) then
 begin
   if length(Str)>0 then
   if Str[1]=chr(ace) then
   begin
    Str1[1]:=chr(dc1);
    if RS2321.SendString(Str1) then
    begin
     Str:='';
     if RS2321.ReadString(Str,15) then
     if Str<>'' then
     begin
      status:=copy(str,3,1);
      sign:=copy(str,4,1);
      if sign='-' then i:=-1
      else i:=1;
      w:=trim(copy(str,5,6));
      j_point:=pos('.',w);
      if j_point<>0 then
      begin
       delete(w,j_point,1);
       insert(',',w,j_point);
      end;
      try
       v:=strtofloat(w)*i;
      except
       v:=0;
      end;
      result:=v;
     end; // if Srt<>'' then
    end;
   end
   else  //if Str[1]=chr(ace) then
   begin
   {
    MessageDlg('Ошибка при передаче данных c весов 1!', mtError,
      [mbOk], 0);
      }
   end;  // else  if Str[1]=chr(ace) then

 end
 else  //  if RS2321.ReadString(Str,1) then
 begin

 {
 MessageDlg('Ошибка при передаче данных c весов 3!', mtError,
    [mbOk], 0);
  }

 end;   //  else if RS2321.ReadDataString(Str,nCount) then
end
else
begin

  DisConnectWeight;
  MessageDlg('Ошибка при передаче данных на весы GetWeight_CAS_DB_H!', mtError,
      [mbOk], 0);


end;


end; // function TFarsh_Weight_AppForm.GetWeight_CAS_DB_H(var status:string):extended;


procedure TFarsh_Weight_AppForm.ReOpen_QFARSHDAY_LIST(vID_TOV:longint);

begin
// весь день
// d_from:= IncHour(DTP_ListFarshDay.Date,0);
// d_to:= IncHour(DTP_ListFarshDay.Date,24);
 // весь день
 d_from:= DateOf(DTP_ListFarshDay.Date);
 d_to:= IncHour(d_from,24);

  with DM1.QFARSHDAY_LIST do
  begin
    Disablecontrols;
    Close;
    Parameters.ParamByName('D_FROM').Value:=d_from;
    Parameters.ParamByName('D_TO').Value:=d_to;
    Parameters.ParamByName('IS_GOTOV').Value:=RG_IsGotov.ItemIndex;
    Parameters.ParamByName('ID_GRTOV').Value:=ID_grtov_select;
    Open;
    First;
    if vID_TOV<>-1 then locate('ID_TOV',vID_TOV,[loCaseInsensitive]);
    Enablecontrols;
  end;
end;


procedure TFarsh_Weight_AppForm.GetListFarshDayClick(Sender: TObject);

begin
// весь день
ReOpen_QFARSHDAY_LIST(Carrent_ID_TOV);
end;

function TFarsh_Weight_AppForm.GetWeight_BH_150_1D(var status:string):extended;
  // status = S - стабилизированный вес   U - нет
  const start=$3C;
        stop=$3E;
        adres=$01;
        command_request=$21;

var  Str_Answer, s_param : string;
w:extended;
sb:byte;
i,j:integer;
b, b1:TBitSet;
v1,v10,v100,v1000, v10000, v100000:integer; // значения единиц, десяток, сотен, тысяч
sign:integer; // знак веса 1 или -1
digit_rank:integer; // знаков после запятой
status_stabil:integer; // статус стабилизации веса 0 -нестабилизирован 1- стабилизирован
status_nul:integer; // индикатор нуля - 0 - не светит 1-светит
status_tara:integer; // индикатор тары - 0 - не светит 1-светит
begin
result:=0;

  SetLength(Str_Answer,7);
  if RS2321.ReadString(Str_Answer,7) then
  begin
    if Str_Answer<>'' then
    begin
      s_param:=copy(Str_Answer,3,1);
      sb:=ord(s_param[1]);
      b:=GetBits (sb);
      for i :=0 to 7 do b1[i]:=0;
      j:=0;
      for i:=0 to 3 do
      begin
        b1[j]:=b[i];
        inc(j);
      end;
      v10000:=MakeByte(b1);


      for i :=0 to 7 do b1[i]:=0;
      j:=0;
      for i:=4 to 7 do
      begin
        b1[j]:=b[i];
        inc(j);
      end;
      v100000:=MakeByte(b1);


      s_param:=copy(Str_Answer,4,1);
      sb:=ord(s_param[1]);
      b:=GetBits (sb);
      for i :=0 to 7 do b1[i]:=0;
      j:=0;
      for i:=0 to 3 do
      begin
        b1[j]:=b[i];
        inc(j);
      end;
      v100:=MakeByte(b1);

      for i :=0 to 7 do b1[i]:=0;
      j:=0;
      for i:=4 to 7 do
      begin
        b1[j]:=b[i];
        inc(j);
      end;
      v1000:=MakeByte(b1);


      s_param:=copy(Str_Answer,5,1);
      sb:=ord(s_param[1]);
      b:=GetBits (sb);
      for i :=0 to 7 do b1[i]:=0;
      j:=0;
      for i:=0 to 3 do
      begin
        b1[j]:=b[i];
        inc(j);
      end;
      v1:=MakeByte(b1);

      for i :=0 to 7 do b1[i]:=0;
      j:=0;
      for i:=4 to 7 do
      begin
        b1[j]:=b[i];
        inc(j);
      end;
      v10:=MakeByte(b1);


      s_param:=copy(Str_Answer,6,1);
      sb:=ord(s_param[1]);
      b:=GetBits (sb);

      sign:=b[5]; // 1 или -1
      for i :=0 to 7 do b1[i]:=0;
      b1[0]:=b[0];
      b1[1]:=b[1];
      digit_rank:=MakeByte(b1);
      status_stabil:=b[2];
      status_nul:=b[3];
      status_tara:=b[4];


      if (status_stabil=1) then
      status := 'S'
      else  status := 'U';

      if v1>=10 then v1:=0;
      if v10>=10 then v10:=0;
      if v100>=10 then v100:=0;
      if v1000>=10 then v1000:=0;
      if v10000>=10 then v10000:=0;
      if v100000>=10 then v100000:=0;

      if sign=1 then i:=-1 else i:=1;

      w:=i*(v1+v10*10+v100*100+v1000*1000+
      v10000*10000+v100000*100000)/ IntPower(10,digit_rank);

      result:=w;

    end;   // if Str_Answer<>'' then
  end   //  if RS2321.ReadString(Str_Answer,7) then
  else
    begin

      DisConnectWeight;
      MessageDlg('Ошибка при передаче данных на весы GetWeight_BH_150_1D!', mtError,
      [mbOk], 0);

  end;


end; // function TFarsh_Weight_AppForm.GetWeight_BH_150_1D(var status:string):extended;


function TFarsh_Weight_AppForm.GetWeight_XK3190_A12ESS(var status:string):extended;


var  Str_Answer, Str1: string;
w:extended;

time_now:TDateTime;
s:string;
begin
result:=0;
SetLength(Str1,1);
Str1[1]:='R';
if RS2321.SendString(Str1) then
begin


  SetLength(Str_Answer,13);
  if RS2321.ReadString(Str_Answer,13) then
  begin
    if Str_Answer<>'' then
    begin


      time_now:= Now;
      if (old_indicator=Str_Answer) then
      begin
        if  (time_now>time_stop) then  status := 'S'
        else  status := 'U';
      end
      else
      begin
        status := 'U';
        time_start:=Now;
        time_stop:=IncSecond(time_start,Time_Stabile);
        old_indicator:=Str_Answer;
      end;


    // ответ в формате строки 'ww000.000kg'
       s:=trim(copy(Str_Answer,3,7));
       try
         w:=StrToFloat(s);
       except
         s:=StringReplace(s,'.',',',[ rfReplaceAll, rfIgnoreCase]);
       end;

        try
         w:=StrToFloat(s);
       except
         w:=0.0;
       end;


       result:=w;
     end;   // if Str_Answer<>'' then
  end   //  if RS2321.ReadString(Str_Answer,7) then
  else
  begin

   DisConnectWeight;
   MessageDlg('Ошибка при чтении данных с весов GetWeight_XK3190_A12ESS!', mtError,
        [mbOk], 0);


  end;
end
 else
  begin

   DisConnectWeight;
   MessageDlg('Ошибка при передаче данных на весы GetWeight_XK3190_A12ESS!', mtError,
        [mbOk], 0);


  end;

end;


procedure TFarsh_Weight_AppForm.Tara_XK3190_A12ESS;
var  Str1 : string;
begin
SetLength(Str1,1);
// оттаривание
Str1[1]:='T';
if not RS2321.SendString(Str1) then
begin
   MessageDlg('Ошибка при передаче данных на весы Tara_XK3190_A12ESS!', mtError,
        [mbOk], 0);
end;
end;

procedure TFarsh_Weight_AppForm.Zerro_XK3190_A12ESS;
var  Str1 : string;
begin
SetLength(Str1,1);
// обнуление
Str1[1]:='Z';
if not RS2321.SendString(Str1) then
begin
   MessageDlg('Ошибка при передаче данных на весы Zerro_XK3190_A12ESS!', mtError,
        [mbOk], 0);
end;
end;


function TFarsh_Weight_AppForm.GetWeight_CAS_CI_2001A(var status:string):extended;
  // status = S - стабилизированный вес   U - нет

var Str1,Str,w,cel,dro:string;
    nCount:word;
    j_point,i,ndro:integer;
    vcel,vdro,v:extended;

   sign:string; // знак веса ' ' - + '-' --
begin
result:=0;
status:='U';
SetLength(Str,22);


SetLength(Str1,2);
Str1:='00';
if RS2321.SendString(Str1) then
begin
 if RS2321.ReadString(Str,22) then
 begin
   status:='S';
   sign:=copy(Str,10,1);
   if sign='-' then i:=-1 else i:=1;
   w:=trim(copy(str,11,7));
   j_point:=pos('.',w);
   if j_point<>0 then
   begin
    delete(w,j_point,1);
    insert(',',w,j_point);
   end;
   try
    v:=strtofloat(w)*i;
   except
    v:=0;
   end;
   result:=v;
 end
else
begin
  DisConnectWeight;
  MessageDlg('Ошибка при чтении данных с весов GetWeight_CAS_CI_2001A!', mtError,
      [mbOk], 0);

end;
end
else
 begin
  DisConnectWeight;
  MessageDlg('Ошибка при передаче данных на весы GetWeight_CAS_CI_2001A!', mtError,
      [mbOk], 0);

end;


end;



procedure TFarsh_Weight_AppForm.Timer1Timer(Sender: TObject);
begin
  try

      Timer1.Enabled:=False;

      case Brand_Weight of
       0: Weight:=GetWeight_CAS_DB_H(status_Weight);
       1: Weight:=GetWeight_BH_150_1D(status_Weight);
       2: Weight:=GetWeight_XK3190_A12ESS(status_Weight);
       3: Weight:=GetWeight_CAS_CI_2001A(status_Weight);
      end;
      L_ConditionWeight.Caption:='Весы на связи!';
      BBTara.Enabled:=True;
      BBZerro.Enabled:=True;
      BBSave.Enabled:=((status_Weight='S') and (Weight>0));
      E_Weight.ReadOnly:=False;
      E_Weight.Text:=Format('%8.2f',[Weight]);
      E_Weight.ReadOnly:=True;

      Timer1.Enabled:=True;


  except
    DisConnectWeight;
    status_Weight:='S';
    L_ConditionWeight.Caption:='Нет связи с весами!';
    BBTara.Enabled:=False;
    BBZerro.Enabled:=False;
    BBSave.Enabled:=True;
    Weight:=0;
    E_Weight.ReadOnly:=False;
    E_Weight.Text:=Format('%8.2f',[Weight]);

   exit;

  end;




end;

procedure TFarsh_Weight_AppForm.HelpAbout1Execute(Sender: TObject);
begin
 AboutBoxShowModal;
end;

procedure TFarsh_Weight_AppForm.NSettingClick(Sender: TObject);
begin
  if SettingShowModal=1 then
  begin
    DisConnectWeight;
    SettingParamRS232FromIni;
  end;
end;

procedure TFarsh_Weight_AppForm.RG_IsGotovClick(Sender: TObject);
begin
case RG_IsGotov.ItemIndex of
 0:
 begin
   GroupBox2.Caption:='Взвешенные порции фарша';
   Caption:='Учет сырого фарша';
    GroupBox1.Caption:='Производственная программа на';
    LGrup.Caption:='Все группы';
    ID_grtov_select:=-1;
    L_Doc_Inv.Visible:=False;
    BBSet_Doc_Inv.Visible:=False;
    DM1.DSQFARSH_DAY.DataSet:=DM1.QFARSH_DAY;
    BBPrepOstatki.Visible:=False;
    CB_IS_BASETOV.Visible:=False;
 end;
 1:
 begin
   GroupBox2.Caption:='Взвешенные порции готовой продукции';
   Caption:='Учет выхода готовой продукции';
    GroupBox1.Caption:='Производственная программа на';
    LGrup.Caption:='Все группы';
    ID_grtov_select:=-1;
    L_Doc_Inv.Visible:=False;
    BBSet_Doc_Inv.Visible:=False;
    DM1.DSQFARSH_DAY.DataSet:=DM1.QFARSH_DAY;
    BBPrepOstatki.Visible:=False;
    CB_IS_BASETOV.Visible:=False;
 end;
 2:
 begin
   GroupBox2.Caption:='Взвешенные инвентаризации готовой продукции';
   Caption:='Учет инвентаризации готовой продукции';
    GroupBox1.Caption:='Продукция для инвентаризации';
     LGrup.Caption:='Продукция';
    ID_grtov_select:=5;
    L_Doc_Inv.Visible:=True;
    BBSet_Doc_Inv.Visible:=True;
    DM1.DSQFARSH_DAY.DataSet:=DM1.Q_Ostatki;
    BBSet_Doc_InvClick(Sender);
    BBPrepOstatki.Visible:=True;
    CB_IS_BASETOV.Visible:=True;
 end;
 end;


  BBRefresh_FarshDayClick(Sender);
  {
  with DM1.QFARSH_W do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('idser').Value:=
     DM1.QFARSH_DAY.FieldByName('ID_SER').AsInteger;
     Parameters.ParamByName('isgotov').Value:=
      RG_IsGotov.ItemIndex;
     if CBISDEL.Checked then
     Parameters.ParamByName('isdelete').Value:=1
    else
     Parameters.ParamByName('isdelete').Value:=0;
    Open;
    EnableControls;
  end;
   with DM1.QFARSH_TARA do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('idfarshw').Value:=
     DM1.QFARSH_W.FieldByName('ID_FARSH_W').AsInteger;
    Open;
    EnableControls;
  end;
  }
end;

procedure TFarsh_Weight_AppForm.Clear_Farsh_Tara_TMP;
begin

DM1.SP_CLEAR_FARSH_TARA_TMP.Parameters.ParamValues['@ID_USER']:=ID_user_select;
 DM1.SP_CLEAR_FARSH_TARA_TMP.ExecProc;
 if DM1.SP_CLEAR_FARSH_TARA_TMP.Parameters.ParamValues['@ER']=0 then
  begin
   DM1.ADS_FARSH_TARA_TMP.DisableControls;
   DM1.ADS_FARSH_TARA_TMP.Close;
   DM1.ADS_FARSH_TARA_TMP.Parameters.ParamValues['iduser']:=ID_user_select;
   DM1.ADS_FARSH_TARA_TMP.Open;
   DM1.ADS_FARSH_TARA_TMP.EnableControls;

  end
 else MessageDlg('Ошибка при подготовке данных!', mtError, [mbOk], 0);

end;

end.
