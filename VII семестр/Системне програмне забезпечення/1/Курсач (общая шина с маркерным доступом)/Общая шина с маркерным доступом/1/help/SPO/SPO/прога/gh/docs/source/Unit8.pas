unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons;

type
  TForm5 = class(TForm)
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    SpinEdit10: TSpinEdit;
    SpinEdit11: TSpinEdit;
    Label10: TLabel;
    Label11: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
implementation
uses unit5;
var Stat:Statistic;

{$R *.DFM}

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
Form5.Hide;
Form5.SpeedButton1.Enabled:=False;
stat:=Statistic.Create(False);
end;

end.
