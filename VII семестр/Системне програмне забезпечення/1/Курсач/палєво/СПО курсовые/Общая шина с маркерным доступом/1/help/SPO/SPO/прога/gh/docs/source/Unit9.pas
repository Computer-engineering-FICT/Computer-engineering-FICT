unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids;

type
  TForm9 = class(TForm)
    StringGrid1: TStringGrid;
    procedure OnResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.DFM}

procedure TForm9.OnResize(Sender: TObject);
begin
Form9.WindowState:=wsMaximized;

StringGrid1.Top:=Form9.Top+30;
StringGrid1.Left:=Form9.Left+5;
StringGrid1.Width:=Form9.clientWidth;
StringGrid1.Height:=Form9.clientheight;
end;

end.
