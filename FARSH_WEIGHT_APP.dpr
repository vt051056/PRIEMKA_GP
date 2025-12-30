program FARSH_WEIGHT_APP;

uses
  Vcl.Forms,
  ABOUT in 'ABOUT.PAS' {AboutBox},
  DataModule1 in 'DataModule1.pas' {DM1: TDataModule},
  reg_server in 'reg_server.pas' {FReg_serv},
  Farsh_Weight_MAIN in 'Farsh_Weight_MAIN.pas' {Farsh_Weight_AppForm},
  uRS232 in 'uRS232.pas',
  Setting_f in 'Setting_f.pas' {FSetting},
  myfuncs in 'myfuncs.pas',
  GRTOV_F in 'GRTOV_F.PAS' {F_grtov},
  Select_Inv in 'Select_Inv.pas' {F_Sel_Inv};

{$R *.res}

begin

  Application.Initialize;
  if  FReg_servShowModal=1 then
  begin
    Application.CreateForm(TDM1, DM1);
  if DM1.is_connected then
    begin

      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TFarsh_Weight_AppForm, Farsh_Weight_AppForm);
      Application.Run;
    end;
  end;







end.
