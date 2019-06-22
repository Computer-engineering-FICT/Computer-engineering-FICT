unit ErrorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TErrorForm = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ErrorForm: TErrorForm;

implementation

{$R *.dfm}

procedure TErrorForm.CloseButtonClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Close
end;

end.
