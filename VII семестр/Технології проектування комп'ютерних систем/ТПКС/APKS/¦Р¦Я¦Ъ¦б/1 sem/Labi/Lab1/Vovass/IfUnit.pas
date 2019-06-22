unit IfUnit;
//==============================================================================
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
//==============================================================================
  TIfForm = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup2: TRadioGroup;
    OKButton: TButton;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  IfForm: TIfForm;
implementation
{$R *.dfm}
//==============================================================================
procedure TIfForm.OKButtonClick(Sender: TObject);
begin
 Close
end;
end.
