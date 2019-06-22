unit DobavlenieSviazi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Start;

type
  TForm2Main = class(TForm)
    LabeledEdit1: TLabeledEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2Main: TForm2Main;

implementation

{$R *.dfm}

procedure TForm2Main.BitBtn1Click(Sender: TObject);
begin
  VesSviazi:=StrToInt(LabeledEdit1.Text);
  Form2Main.Close;
end;

end.
