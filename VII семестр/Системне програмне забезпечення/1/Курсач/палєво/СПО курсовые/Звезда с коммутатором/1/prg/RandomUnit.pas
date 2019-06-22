unit RandomUnit;
//==============================================================================
interface
//==============================================================================
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;
//==============================================================================
type
  TRandomForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    Label3: TLabel;
    btOk: TButton;
    btCancel: TButton;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
  public
  end;
//==============================================================================
var
  RandomForm: TRandomForm;
//==============================================================================
implementation
uses MainUnit;
{$R *.dfm}
//==============================================================================
procedure TRandomForm.btCancelClick(Sender: TObject);
begin
 close
end;
//==============================================================================
procedure TRandomForm.btOkClick(Sender: TObject);
begin
 try
  StrToInt(Edit1.Text);
  StrToInt(Edit2.Text)
 except on EConvertError do
  begin
   messageDlg('Введите числовое значение !',mtError,[mbOk],0);
   exit
  end
 end;
 MainForm.generateRandom(StrToInt(Edit1.Text),StrToInt(Edit2.Text));
 Close
end;
//==============================================================================
end.
