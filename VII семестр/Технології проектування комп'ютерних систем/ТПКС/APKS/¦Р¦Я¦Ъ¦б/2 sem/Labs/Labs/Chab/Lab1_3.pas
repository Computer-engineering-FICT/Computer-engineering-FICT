unit Lab1_3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids,lab1_1;

type
  TEditForm = class(TForm)
    editorial: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure editorialSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure draw_line;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;
  E:TNode;
implementation


{$R *.DFM}

procedure TEditForm.FormCreate(Sender: TObject);
begin
     editorial.rowcount:=2;
     editorial.cells[0,0]:='№';
     editorial.cells[1,0]:='назв';
     editorial.cells[2,0]:='перех';
     editorial.cells[3,0]:='сигн';
     editorial.cells[4,0]:='да';
     editorial.cells[5,0]:='нет';

end;

procedure TEditForm.editorialSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
  var tmp:TNode;
  begin
c:=p;E:=p;
  while (c<>nil) do
  begin
  if c^.marker.Caption=editorial.Cells[0,ARow] then
    begin
     {Сигналы}
     if (ACol=3) then
        begin
        C^.signals.Caption:=Value;
        exit;
        end;
     {Переход}
     if (ACol=2) then
     begin
     E:=P;tmp:=p;
     if (E^.marker.Caption=editorial.Cells[0,ARow]) then
         exit
     else if (E^.next^.marker.Caption=editorial.Cells[0,ARow]) then
         E:=E^.next
     else
      begin
       if E^.next<>nil then E:=E^.next;
       while (E<>nil) do
       begin
       if E^.marker.Caption=editorial.Cells[0,ARow] then
          begin
          C^.Yes:=E;draw_line;
          exit;
          end
       else begin E:=E^.next; tmp:=tmp^.next;  end;
       if (C^.Yes=nil)then editorial.Cells[2,ARow]:='нет'
       end;
      end;
     end;
     {Переход по ДА}
     if (ACol=4) then
    begin
     E:=P;
     {Переход по НЕТ}
     if (ACol=5) then
     begin
     E:=P;
     end ;
    end;
   end
   else c:=c^.next;
  end;
end;
{-----------------}
procedure TEditForm.draw_line;
var x1,x2,y1,y2:integer;
begin
x1:=C^.shapen.left;
y1:=C^.shapen.top;
x2:=C^.yes^.shapen.left;
y2:=C^.yes^.shapen.top;
Form1.Canvas.Moveto(x1,y1);
Form1.canvas.Lineto(x2,y2);
end;
end.
