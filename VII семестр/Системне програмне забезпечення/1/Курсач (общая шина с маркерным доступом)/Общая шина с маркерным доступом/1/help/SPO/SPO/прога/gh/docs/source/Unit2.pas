unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Menus, RzLabel;

type
  TForm2 = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    RzURLLabel1: TRzURLLabel;
    RzURLLabel2: TRzURLLabel;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure OnActivate(Sender: TObject);
    procedure OnDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses unit1;
{$R *.DFM}

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
Form2.Hide;
end;

procedure TForm2.OnActivate(Sender: TObject);
begin
label1.Caption:=Format('Used Memory=%d',[AllocMemSize div 1024])+' Kb';
end;

procedure TForm2.OnDeactivate(Sender: TObject);
begin
Form2.Hide;
end;

end.
