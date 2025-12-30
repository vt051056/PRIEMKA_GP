unit tov_list_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids,DB;

type
  TFTov_list = class(TForm)
    Panel1: TPanel;
    LGrup: TLabel;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBGrTovSel: TBitBtn;
    BBAllGrTovSel: TBitBtn;
    BBRefresh: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BNotDef: TButton;
    procedure BBRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBGrTovSelClick(Sender: TObject);
    procedure BBAllGrTovSelClick(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BNotDefClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CarentFieldSeach:string;
  public
    { Public declarations }
    viewGrup:longInt;
    nameTovForSearch:string;
    procedure ReOpenQ(v_idTov,IDG_FROM,IDG_TO:longInt);
    procedure FoundTov(v_ID_Tov:longint);
     procedure MouseWheel(Sender: TObject; Shift: TShiftState;
                   WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  end;

var
  FTov_list: TFTov_list;
  id_Base_Tov_Select:integer;

function  FTov_listDLG(id_gr:longint; nametov:string):integer;

implementation
 uses dm_nakl, grtov_f;
{$R *.dfm}


function  FTov_listDLG(id_gr:longint; nametov:string):integer;
begin
 FTov_list:=TFTov_list.Create(Application);
 with FTov_list do
 begin
  try
    viewGrup:=id_gr;
    ReOpenQ(-1,id_gr,id_gr);
    nameTovForSearch:=nametov;
    result:=ShowModal;
  finally
   Free;
   FTov_list:=Nil;
  end;
 end;
end;



procedure TFTov_list.ReOpenQ(v_idTov,IDG_FROM,IDG_TO:longInt);
begin
 with DM1.QTovList do
 begin
  DisableControls;
  Active:=False;
  Parameters.ParamByName('IDG_FROM').Value:=IDG_FROM;
  Parameters.ParamByName('IDG_TO').Value:=IDG_TO;
  Active:=True;
  if v_idTov<>-1 then
   Locate('ID_TOV',v_idTov,[loCaseInsensitive]);
  EnableControls;
 end;
end;


procedure TFTov_list.FoundTov(v_ID_Tov:longint);
var idG_from, idG_to:integer;
begin
with DM1.QTovList do
begin
 DisableControls;
  if viewGrup=-1 then
   begin
    idG_from:=0;
    idG_to:=MaxInt;
   end
   else
   begin
    idG_from:=viewGrup;
    idG_to:=viewGrup;
   end;
   ReOpenQ(v_ID_Tov,idG_from,idG_to);
 EnableControls;
end;
end;

procedure TFTov_list.BBRefreshClick(Sender: TObject);
begin
with DM1.QTovList do
begin
 Disablecontrols;
 FoundTov(FieldByName('ID_TOV').AsInteger);
 Enablecontrols;
end;
end;

procedure TFTov_list.FormCreate(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
  TForm(DBGrid1).OnMouseWheel := MouseWheel;
 CarentFieldSeach:='NAME';
// DM1.QTovList.IndexFieldNames:=CarentFieldSeach;
 viewGrup:=-1;
 LGrup.Caption:='Все группы';
 ReOpenQ(-1,0,MaxInt);



end;


procedure TFTov_list.MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta>0 then
  begin
    if not TDBGrid(Sender).DataSource.DataSet.Bof
      then TDBGrid(Sender).DataSource.DataSet.Prior;
  end
  else
  begin
    if not TDBGrid(Sender).DataSource.DataSet.Eof
      then TDBGrid(Sender).DataSource.DataSet.Next;
  end;
 
  Handled := True;
end;



procedure TFTov_list.BBGrTovSelClick(Sender: TObject);
begin
 if F_grtovDlg= mrOk then
 begin
  viewGrup:=ID_grtov_select;
  LGrup.Caption:='Группа '+grtov_select;
  ReOpenQ(-1,viewGrup,viewGrup);
 end;
end;

procedure TFTov_list.BBAllGrTovSelClick(Sender: TObject);
begin
 viewGrup:=-1;
 LGrup.Caption:='Все группы';
 ReOpenQ(-1,0,MaxInt);
end;

procedure TFTov_list.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.QTovList.DisableControls;
 with DM1.QTovList do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
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

 DM1.QTovList.EnableControls;
end;

procedure TFTov_list.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.QTovList.DisableControls;
 with DM1.QTovList do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
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

 DM1.QTovList.EnableControls;

end;

procedure TFTov_list.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TFTov_list.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  DM1.QTovList.Locate(CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TFTov_list.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if modalResult<>mrOk then   id_Base_Tov_Select:=Unknown_code;
end;

procedure TFTov_list.BNotDefClick(Sender: TObject);
begin
 id_Base_Tov_Select:=Unknown_code;
 modalResult:=mrOk;

end;

procedure TFTov_list.BitBtn1Click(Sender: TObject);
begin
  id_Base_Tov_Select:=
   DM1.QTovList.FieldByName('ID_TOV').AsInteger;
 modalResult:=mrOk;
end;

procedure TFTov_list.FormShow(Sender: TObject);
begin
 Edit1.Text:=nameTovForSearch;
end;

end.
