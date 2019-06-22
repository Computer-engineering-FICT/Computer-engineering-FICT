//READY
unit More;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons;

type
  TfmMore = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbAll(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMore: TfmMore;

implementation

{$R *.dfm}

procedure TfmMore.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then ModalResult:= mrCancel;
end;

procedure TfmMore.sbAll(Sender: TObject);
begin
  with Sender as TSpeedButton do
    ModalResult:= Tag;
end;

end.
