unit RebroUnit;
//==============================================================================
interface
//==============================================================================
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
//==============================================================================
type
  TRebroForm = class(TForm)
    Edit1: TEdit;
    btOk: TButton;
    Label1: TLabel;
    procedure btOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
//==============================================================================
var
  RebroForm: TRebroForm;
//==============================================================================
implementation
uses MainUnit;
{$R *.dfm}
//==============================================================================
procedure TRebroForm.btOkClick(Sender: TObject);
begin
 try
  StrToInt(Edit1.Text)
 except on EConvertError do
  begin
   messageDlg('¬ведите числовое значение !',mtError,[mbOk],0);
   exit
  end
 end;
 if StrToInt(Edit1.Text) < 0 then
  begin
   messageDlg('¬ведите значение >= 0!',mtError,[mbOk],0);
   exit
  end;
 Close
end;
//==============================================================================
procedure TRebroForm.FormActivate(Sender: TObject);
begin
 Edit1.Text:=''
end;
//==============================================================================
end.
