unit grtov_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, Data.DB;

type
  TF_grtov = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBRefresh: TBitBtn;
    BBDelete: TBitBtn;
    CB_Deleted: TCheckBox;
    BBRestore: TBitBtn;
    CBSetEdit: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBDeleteClick(Sender: TObject);
    procedure CB_DeletedClick(Sender: TObject);
    procedure BBRestoreClick(Sender: TObject);
    procedure CBSetEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenFound(id_found:integer);
   

  end;

var

  ID_grtov_select:longint;
  grtov_select:string;

  F_grtov: TF_grtov;
  function  F_grtovDlg:integer;
  
implementation
 uses DataModule1, myfuncs;
{$R *.dfm}


function  F_grtovDlg:integer;
begin
 F_grtov:=TF_grtov.Create(Application);
 with F_grtov do
 begin
  try
   result:=ShowModal;
  finally
   Free;
   F_grtov:=Nil;
  end;
 end;
end;


procedure TF_grtov.OpenFound(id_found:integer);
begin
with DM1.ADODSGrTov do
begin
 Disablecontrols;
 Close;
 if CB_Deleted.Checked then
  Parameters.ParamByName('isdelete').Value:=1
 else
  Parameters.ParamByName('isdelete').Value:=0;
 Open;
 if id_found<>-1 then
  locate('ID_GRTOV', id_found, [loCaseInsensitive]);
 Enablecontrols;
end;

end;







procedure TF_grtov.FormCreate(Sender: TObject);
begin

Caption:=work_DB+'/ Справочник групп товаров';
// DM1.ADODSGrTov.Active:=True;
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;

  DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast];
  CBSetEdit.Enabled:=False;
  CBSetEdit.Checked:=False;
  DBGrid1.ReadOnly:=True;
  BBDelete.Enabled:=CBSetEdit.Checked;
  CB_Deleted.Checked:=False;
  CB_Deleted.Enabled:=CBSetEdit.Checked;
  BBRestore.Enabled:=(CB_Deleted.Checked and CBSetEdit.Checked);

 case status_user of
0:     // обычные пользователи
 begin
;
 end;
1:  // админ приложения
  begin
  CBSetEdit.Enabled:=True;
  end;
 2:  // админ БД
  begin
   CBSetEdit.Enabled:=True;
  end;
 else
  begin
   DBNavigator1.Enabled:=False;
  end;
end; // case status_user of
 OpenFound(-1);
end;

procedure TF_grtov.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin
   if DM1.ADODSGrTov.State in [dsInsert,DsEdit] then DM1.ADODSGrTov.Post;
   ID_grtov_select:=DM1.ADODSGrTov.FieldByName('ID_GRTOV').Asinteger;
   grtov_select:=DM1.ADODSGrTov.FieldByName('GRUPTOV').AsString;
  end
  else
  begin
   if DM1.ADODSGrTov.State in [dsInsert,DsEdit] then DM1.ADODSGrTov.Cancel;
   ID_grtov_select:=Unknown_code;
   grtov_select:=Unknown_str;
  end;

  DM1.ADODSGrTov.Active:=False;
 end;
end;

procedure TF_grtov.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSGrTov.DataSet.DisableControls;
 with DM1.DSGrTov.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('GRUPTOV').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом '+Edit1.Text+' не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DM1.DSGrTov.DataSet.EnableControls;
end;

procedure TF_grtov.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSGrTov.DataSet.DisableControls;
 with DM1.DSGrTov.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('GRUPTOV').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом '+Edit1.Text+' не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DM1.DSGrTov.DataSet.EnableControls;

end;

procedure TF_grtov.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TdataSet(DM1.DSGrTov.DataSet).Locate('GRUPTOV',Edit1.Text,[loPartialKey]);
end;

procedure TF_grtov.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_grtov.BBRefreshClick(Sender: TObject);
var carrent_ID_GRTOV:longint;
begin
 with  DM1.DSGrTov.DataSet do
begin
  carrent_ID_GRTOV:=FieldByName('ID_GRTOV').AsInteger;
  OpenFound(carrent_ID_GRTOV);
end;
end;

procedure TF_grtov.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TF_grtov.BBDeleteClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
  if MessageDlg('Вы уверенны в удалении записи?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
with DM1.ADODSGrTov do
begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_GRTOV').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_GRTOV').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_GRTOV').AsInteger;
 locate('ID_GRTOV', carrent_ID, [loCaseInsensitive]);
 if FieldByName('IS_DELETE').AsInteger=0 then
 begin
    Edit;
    FieldByName('IS_DELETE').AsInteger:=1;
    Post;
    if pred_ID=carrent_ID then // удаляем 1-ю
    OpenFound(next_ID)
    else
    if next_ID=carrent_ID then // удаляем последнюю
     OpenFound(pred_ID)
    else OpenFound(pred_ID);

 end
 else
 begin
  if MessageDlg('Будет безвозвратно удалена запись. '+
   'Это может привести к нарушению целосности БД. '+
   'Вы уверенны в удалении записи?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Delete;
    if pred_ID=carrent_ID then // удаляем 1-ю
    OpenFound(next_ID)
    else
    if next_ID=carrent_ID then // удаляем последнюю
     OpenFound(pred_ID)
    else OpenFound(pred_ID);
  end;
 end;

 

 Enablecontrols;
end;
end;
end;

procedure TF_grtov.CB_DeletedClick(Sender: TObject);
begin
  OpenFound(-1);
  BBRestore.Enabled:=(CB_Deleted.Checked and CBSetEdit.Checked);
end;

procedure TF_grtov.BBRestoreClick(Sender: TObject);
var pred_ID, next_ID,carrent_ID:longint;
begin
with DM1.ADODSGrTov do
begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_GRTOV').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_GRTOV').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_GRTOV').AsInteger;

 locate('ID_GRTOV', carrent_ID, [loCaseInsensitive]);
 Edit;
 FieldByName('IS_DELETE').AsInteger:=0;
 Post;

 if pred_ID=carrent_ID then // перенесли 1-ю
    OpenFound(next_ID)
 else
    if next_ID=carrent_ID then // перенесли последнюю
     OpenFound(pred_ID)
    else OpenFound(pred_ID);

 Enablecontrols;
end;
end;

procedure TF_grtov.CBSetEditClick(Sender: TObject);
begin
 case status_user of
0:     // обычные пользователи
 begin
;
 end;
1:  // админ приложения
  begin
  if CBSetEdit.Checked then
    DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbEdit,nbPost,nbCancel]
  else DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  DBGrid1.ReadOnly:=not CBSetEdit.Checked;
  BBDelete.Enabled:=False;
  CB_Deleted.Checked:=False;
  CB_Deleted.Enabled:=CBSetEdit.Checked;
  BBRestore.Enabled:=(CB_Deleted.Checked and CBSetEdit.Checked);
  end;
 2:  // админ БД
  begin
  if CBSetEdit.Checked then
    DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbEdit,nbPost,nbCancel]
  else DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  DBGrid1.ReadOnly:=not CBSetEdit.Checked;
  BBDelete.Enabled:=CBSetEdit.Checked;
  CB_Deleted.Checked:=False;
  CB_Deleted.Enabled:=CBSetEdit.Checked;
  BBRestore.Enabled:=(CB_Deleted.Checked and CBSetEdit.Checked);
  end;
 else
  begin
   DBNavigator1.Enabled:=False;
   DBGrid1.Enabled:=False;
   CBSetEdit.Enabled:=False;
   BBDelete.Enabled:=False;
   CB_Deleted.Checked:=False;
   CB_Deleted.Enabled:=False;
   BBRestore.Enabled:=False;
  end;
end; // case status_user of

end;

end.
