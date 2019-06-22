//READY
unit EditText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmEdit = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox: TComboBox;
    lbId: TLabel;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEdit: TfmEdit;

implementation

{$R *.dfm}

procedure TfmEdit.BitBtn1Click(Sender: TObject);
begin
  with ComboBox.Items do
    if IndexOf(ComboBox.Text) = -1 then Add(ComboBox.Text);
end;

procedure TfmEdit.FormShow(Sender: TObject);
begin
  ComboBox.SetFocus;
end;

end.
