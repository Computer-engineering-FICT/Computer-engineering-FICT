unit uMenu;

interface

uses
  uPart1,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uPart2;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Hide;
  FormPart1.ShowModal;
  Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Hide;
  FormPart2.ShowModal;
  Show;
end;

end.
