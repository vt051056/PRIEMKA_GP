unit Reason_del;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFReason_del = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReason_del: TFReason_del;
function GetReasonStr(var S_reason_delete_edit: string):integer;

implementation

{$R *.dfm}

function GetReasonStr(var S_reason_delete_edit: string):integer;
begin
 try
  Application.CreateForm(TFReason_del, FReason_del);
  Result:=FReason_del.ShowModal;
  if Result = mrOk then  S_reason_delete_edit:=FReason_del.ComboBox1.Text
  else S_reason_delete_edit:='';
 finally
  FReason_del.Free;
 end;
end;




end.
