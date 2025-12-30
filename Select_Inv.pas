unit Select_Inv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TF_Sel_Inv = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Q_Doc_Type: TADOQuery;
    Q_Inv: TADOQuery;
    DS_Q_Doc_Type: TDataSource;
    DS_Q_Inv: TDataSource;
    Q_Doc_TypeID_DOC_TYPE: TAutoIncField;
    Q_Doc_TypeNAMEDOC: TWideStringField;
    Q_InvID_INV: TAutoIncField;
    Q_InvNI: TWideStringField;
    Q_InvDATE_INV: TDateTimeField;
    D_From: TDateTimePicker;
    D_To: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Q_InvSCH: TStringField;
    Q_InvID_CLI: TIntegerField;
    Q_InvCLIENT: TWideStringField;
    procedure Q_Doc_TypeAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure D_FromChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_INV:longint;
    NI:string;
    DATE_INV:TDateTime;
    ID_SCH:string;
    ID_CLI:longint;
    procedure Reopen_Q_Inv;
  end;

var
  F_Sel_Inv: TF_Sel_Inv;
function Select_Inv_ShowModal(var vID_INV:longint; var vNI:string; var vDATE_INV:TDateTime; var vID_SCH:string; var vID_CLI:longint):integer;
implementation

{$R *.dfm}
uses DataModule1;

function Select_Inv_ShowModal(var vID_INV:longint; var vNI:string; var vDATE_INV:TDateTime; var vID_SCH:string; var vID_CLI:longint):integer;
var i:integer;
begin
 result:=mrCancel;
 F_Sel_Inv:=TF_Sel_Inv.Create(Application);
 with F_Sel_Inv do
 try
  i:=ShowModal;
  if i=mrOk  then
  begin
   vID_INV:=ID_INV;
   vNI:=NI;
   vDATE_INV:=DATE_INV;
   vID_SCH:=ID_SCH;
   vID_CLI:=ID_CLI;
   result:=mrOk;
  end;

 finally
  Free;
  F_Sel_Inv:=Nil;
 end;

end;

procedure TF_Sel_Inv.D_FromChange(Sender: TObject);
begin
 Reopen_Q_Inv;
end;

procedure TF_Sel_Inv.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if modalResult=mrOk then
begin

  if Q_Inv.RecordCount>0 then
  begin
    ID_INV:=Q_Inv.FieldByName('ID_INV').AsInteger;
    NI:=Q_Inv.FieldByName('NI').AsString;
    DATE_INV:=Q_Inv.FieldByName('DATE_INV').AsFloat;
    ID_SCH:=Q_Inv.FieldByName('SCH').AsString;
    ID_CLI:=Q_Inv.FieldByName('ID_CLI').AsInteger;
  end
  else
  begin
    MessageDlg('Не выбран документ инвентаризации!', mtError, [mbOk], 0);
    CanClose:=False;
  end;
end;


end;

procedure TF_Sel_Inv.FormCreate(Sender: TObject);
begin
 D_From.Date:=Date();
 D_To.Date:=Date();
 Q_Doc_Type.Open;
end;

procedure TF_Sel_Inv.Reopen_Q_Inv;
begin
  with Q_Inv do
  begin
    DisableControls;
    Close;
    Parameters.ParamByName('ID_DOC_TYPE').Value:=Q_Doc_Type.FieldByName('ID_DOC_TYPE').AsInteger;
    Parameters.ParamByName('D_FROM').Value:=D_From.DateTime;
    Parameters.ParamByName('D_TO').Value:=D_To.DateTime;
    Open;
    EnableControls;
 //   if RecordCount=0 then    MessageDlg('Нет документов инвентаризации в заданном периоде!', mtError, [mbOk], 0);

  end;
end;

procedure TF_Sel_Inv.Q_Doc_TypeAfterScroll(DataSet: TDataSet);
begin
  Reopen_Q_Inv;
end;

end.
