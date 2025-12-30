unit reg_server;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,IniFiles, DB, ADODB, Mask;

type
  TFReg_serv = class(TForm)
    E_sqlsrv: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    E_database: TEdit;
    Label3: TLabel;
    E_User: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    E_Passw: TEdit;
    BBSetting: TBitBtn;
    procedure BBSettingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
 
  private
    { Private declarations }
  public
    { Public declarations }
     iniFile:TIniFile;
   // Provider=SQLOLEDB.1;Persist Security Info=False;
  //  User ID=sa;Password=453;Initial Catalog=realiz;Data Source=myhome\tvv
  end;

var
  FReg_serv: TFReg_serv;
  Connect_info,login:string;
  is_connected:boolean;
  function FReg_servShowModal:integer;
implementation
{$R *.dfm}

function FReg_servShowModal:integer;
var i:integer;
begin
 result:=0;
 FReg_serv:=TFReg_serv.Create(Application);
 with FReg_serv do
 try
  i:=ShowModal;
  if i=mrOk then
   result:=1;
 finally
  Free;
 end;
end;


procedure TFReg_serv.BBSettingClick(Sender: TObject);
begin
IniFile:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
with IniFile do
begin
 WriteString('servset','sqlsrv', E_sqlsrv.Text);
 WriteString('servset','database', E_database.Text);
 if E_database.Text='NMK_W' then
 begin
  WriteString('servset','login', E_User.Text);
  WriteString('servset','passw', E_Passw.Text);
 end;
 Free;
end;

end;

procedure TFReg_serv.FormCreate(Sender: TObject);
var status:string;
begin

IniFile:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
 status:=IniFile.ReadString('servset', 'sqlsrv', E_sqlsrv.Text);
 if status<>'' then
 begin
  E_sqlsrv.Text:=IniFile.ReadString('servset','sqlsrv', E_sqlsrv.Text);
  E_database.Text:=IniFile.ReadString('servset','database', E_database.Text);
  if E_database.Text='NMK_W' then
  begin
   E_User.Text:=IniFile.ReadString('servset','login', E_User.Text);
   E_Passw.Text:=IniFile.ReadString('servset','passw', E_Passw.Text);
  end;
 end
 else
 begin
  E_sqlsrv.Text:='myhome\tvv';
  E_database.Text:='realiz';
 end;
 IniFile.Free;
 
 Connect_info:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='
  +E_User.Text+';Password='+E_Passw.Text+
  ';Initial Catalog='+E_database.Text+';Data Source='+E_sqlsrv.Text;
end;

procedure TFReg_serv.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if modalresult=mrOk then
begin
 Connect_info:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID='
  +E_User.Text+';Password='+E_Passw.Text+
  ';Initial Catalog='+E_database.Text+';Data Source='+E_sqlsrv.Text;
  Login:=E_User.Text;
end;
end;

procedure TFReg_serv.FormShow(Sender: TObject);
begin
E_User.SetFocus;
end;

end.
