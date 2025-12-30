unit ABOUT;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

  function AboutBoxShowModal:integer;

implementation

{$R *.dfm}

function AboutBoxShowModal:integer;
var i:integer;
begin
 result:=0;
 AboutBox:=TAboutBox.Create(Application);
 with AboutBox do
 try
  i:=ShowModal;
  if i=mrOk then
   result:=1;
 finally
  Free;
 end;
end;

end.
 
