unit Setting_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFSetting = class(TForm)
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    CB_ComPort: TComboBox;
    BBSetting: TBitBtn;
    CB_Brand_Weight: TComboBox;
    CB_ComPortBaudRate: TComboBox;
    CB_ComPortDataBits: TComboBox;
    CB_ComPortStopBits: TComboBox;
    CB_ComPortParity: TComboBox;
    BitBtn1: TBitBtn;
    RG_IsGotov: TRadioGroup;
    Label1: TLabel;
    L_Gr_tov: TLabel;
    BBGrTovSel: TBitBtn;
    procedure BBSettingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBOnWeightClick(Sender: TObject);
    procedure BBGrTovSelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IniFile:TIniFile;
  end;

var
  FSetting: TFSetting;
  function SettingShowModal:integer;

implementation
 uses myfuncs,Farsh_Weight_MAIN, grtov_f;
{$R *.dfm}

function SettingShowModal:integer;
var i:integer;
begin
 result:=0;
 FSetting:=TFSetting.Create(Application);
 with FSetting do
 try
  i:=ShowModal;
  if i=mrOk then
   result:=1;
 finally
  Free;
  FSetting:=Nil;
 end;

end;


procedure TFSetting.BBGrTovSelClick(Sender: TObject);
begin
if F_grtovDlg= mrOk then
 begin
  L_Gr_tov.Caption:=grtov_select;
 end;
end;

procedure TFSetting.BBSettingClick(Sender: TObject);
begin
 IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
   ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
with IniFile do
begin
 Writeinteger('MAIN_F','COM_PORT',CB_ComPort.ItemIndex);
 Writeinteger('MAIN_F','Brand_Weight',CB_Brand_Weight.ItemIndex);
 Writeinteger('MAIN_F','ComPortBaudRate',CB_ComPortBaudRate.ItemIndex);
 Writeinteger('MAIN_F','ComPortDataBits',CB_ComPortDataBits.ItemIndex);
 Writeinteger('MAIN_F','ComPortStopBits',CB_ComPortStopBits.ItemIndex);
 Writeinteger('MAIN_F','ComPortParity',CB_ComPortParity.ItemIndex);
 WriteInteger('MAIN_F','isgotov', RG_IsGotov.ItemIndex);
 WriteInteger('MAIN_F','ID_GR_TOV_SELECT', ID_grtov_select);
 WriteString('MAIN_F','GR_TOV_SELECT', grtov_select);
 Free;
 end;
end;

procedure TFSetting.CBOnWeightClick(Sender: TObject);
begin
 // Farsh_Weight_AppForm.CBOnWeightClick(Sender);
// Farsh_Weight_AppForm.CBOnWeight.Checked:=CBOnWeight.Checked
end;

procedure TFSetting.FormCreate(Sender: TObject);
begin
 IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
   ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
with IniFile do
begin
 CB_ComPort.ItemIndex:=Readinteger('MAIN_F','COM_PORT',0);
 CB_Brand_Weight.ItemIndex:=Readinteger('MAIN_F','Brand_Weight',0);
 CB_ComPortBaudRate.ItemIndex:=Readinteger('MAIN_F','ComPortBaudRate',0);
 CB_ComPortDataBits.ItemIndex:=Readinteger('MAIN_F','ComPortDataBits',0);
 CB_ComPortStopBits.ItemIndex:=Readinteger('MAIN_F','ComPortStopBits',0);
 CB_ComPortParity.ItemIndex:=Readinteger('MAIN_F','ComPortParity',0);
 RG_IsGotov.ItemIndex:=ReadInteger('MAIN_F','isgotov', RG_IsGotov.ItemIndex);
 Free;
end;
end;

end.
