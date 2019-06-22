  unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TInp1Form }

  TInp1Form = class(TForm)
    ClearButton: TButton;
    LoadButton: TButton;
    SaveButton: TButton;
    ExitButton: TButton;
    GraphImage: TImage;
    InfoPanel: TPanel;
    IMatrixGrid: TStringGrid;
    procedure ClearButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GraphButtonClick(Sender: TObject);
    procedure IMatrixGridButtonClick(Sender: TObject; aCol, aRow: Integer);
    procedure IMatrixGridClick(Sender: TObject);
    procedure IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
    procedure LoadButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
  private
    { private declarations }
    procedure NodesPaint;
    procedure EdgesPaint;
    procedure SaveToFile(M:Integer);
    procedure LoadFromFile(M:Integer);
    procedure ClearGrid;

  public
    { public declarations }
  end;

 Type
   TNodeCoord=record
     X:Integer;
     Y:Integer;
   end;

var
  Inp1Form: TInp1Form;
  CoordArr: array [1..20] of TNodeCoord;


implementation
Uses Unit5;



{$R *.lfm}

{ TInp1Form }

procedure TInp1Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp1Form.ClearButtonClick(Sender: TObject);
begin
  ClearGrid;
end;

procedure TInp1Form.FormActivate(Sender: TObject);
  var i:Integer;
begin
 NumNodes:=10+NZK mod 11;  //Задаем количество вершин графа
 IMatrixGrid.ColCount:=NumNodes+1;  //Фрмируем размер матрицы смежности
 IMatrixGrid.RowCount:=NumNodes+1;
 For i:=1 to NumNodes do
 begin
  IMatrixGrid.Cells[i,0]:=IntToStr(i); //Нумерация строк и столбцов
  IMatrixGrid.Cells[0,i]:=IntToStr(i);
 end;
 GraphImage.Canvas.Pen.Width:= 1;   // Толщина окаймляющей линии
 GraphImage.Canvas.Pen.Color:=clBlack; // Цвет окаймляющей линии
 GraphImage.Canvas.Brush.Color := clwhite; // Цвет фона
 GraphImage.Canvas.Rectangle(0, 0, 600, 600);//  Размер картинки
 GraphImage.Canvas.Font.Size:=12; // Размер шрифиа на картинке
 NodesPaint;
end;

procedure TInp1Form.FormCreate(Sender: TObject);
begin
end;

procedure TInp1Form.FormShow(Sender: TObject);
begin

end;

procedure TInp1Form.EdgesPaint; // отрисовка ребер
var i,j:Integer;
    x1,y1:Integer;
    Angle:Extended;
begin
 GraphImage.Canvas.Pen.Color:=clBlack; // Цвет ребер
 For i:=1 to NumNodes do
  For j:=1 to NumNodes do
  begin
   If IMatrixGrid.Cells[i,j]='1' then
   begin
     If i<>j then
     begin  // Отрисовка ребер, соединяющих различные вершины
      GraphImage.Canvas.MoveTo(CoordArr[i].X,CoordArr[i].Y);
      GraphImage.Canvas.LineTo(CoordArr[j].X,CoordArr[j].Y);
     end else
     begin // Отрисовка петель
      Angle:=(i-1)*360/NumNodes;
      x1:=CoordArr[i].X+Round( 30 * cos(Angle*2*pi/360));
      y1:=CoordArr[i].Y-Round( 30 * sin(Angle*2*pi/360));
      GraphImage.Canvas.Ellipse(x1-30,y1-30,x1+30,y1+30);
     end;
   end;
  end;
end;

procedure TInp1Form.NodesPaint;
  var i:Integer;
      x,y: integer;    // координаты номеров вершин
      x0,y0: integer;  // центр графа
      a: Extended;     // угол между OX и прямой (x0,yo) (x,y)
      h: integer;      // номера вершины
begin
 X0:=300;
 Y0:=300;
 a:=0; // вершины ставим начиная с 1, против часовой стрелки
 h:=1; // номер вершины
 GraphImage.Canvas.Pen.Width:= 2;
 GraphImage.Canvas.Pen.Color:=clBlack;
 While a<360 do
 begin
  CoordArr[h].X:=x0+Round( 220 * cos(a*2*pi/360)); //массив координат
  CoordArr[h].Y:=x0-Round( 220 * sin(a*2*pi/360));
  GraphImage.Canvas.MoveTo(CoordArr[h].X,CoordArr[h].Y);
  GraphImage.Canvas.Ellipse(CoordArr[h].X-4,CoordArr[h].Y-4,CoordArr[h].X+4,CoordArr[h].Y+4);
  // цифры по большему радиусу
  x:=x0+Round( (220+25) * cos(a*2*pi/360));
  y:=x0-Round( (220+25) * sin(a*2*pi/360));
  GraphImage.Canvas.TextOut(x-2,y-2,IntToStr(h));
  Inc(h);
  a:=a+360/NumNodes;
 end;
end;

procedure TInp1Form.GraphButtonClick(Sender: TObject);

begin

end;

procedure TInp1Form.IMatrixGridButtonClick(Sender: TObject; aCol, aRow: Integer);
begin
end;

procedure TInp1Form.IMatrixGridClick(Sender: TObject);
begin

end;


procedure TInp1Form.IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
var Angle:Extended;
    x1,y1:Integer;
begin
 If NumNodes>0 then
 begin
  If IMatrixGrid.Cells[aCol,aRow]='' then
  begin IMatrixGrid.Cells[aCol,aRow]:='1'; end else
  If IMatrixGrid.Cells[aCol,aRow]='1' then
  begin
   IMatrixGrid.Cells[aCol,aRow]:='';
   GraphImage.Canvas.Pen.Color:=clWhite;
   If aCol<>aRow then
  begin
   GraphImage.Canvas.MoveTo(CoordArr[ARow].X,CoordArr[ARow].Y);
   GraphImage.Canvas.LineTo(CoordArr[ACol].X,CoordArr[ACol].Y);
  end else
  begin
   Angle:=(aCol-1)*360/NumNodes;
   x1:=CoordArr[aCol].X+Round( 30 * cos(Angle*2*pi/360));
   y1:=CoordArr[aCol].Y-Round( 30 * sin(Angle*2*pi/360));
   GraphImage.Canvas.Ellipse(x1-30,y1-30,x1+30,y1+30);
  end;
 end;
 EdgesPaint;
 NodesPaint;
 end;
end;

procedure TInp1Form.LoadButtonClick(Sender: TObject);
begin
 LoadFromFile(NumVariant);
 EdgesPaint;
 NodesPaint;
end;

procedure TInp1Form.SaveButtonClick(Sender: TObject);
begin
  SaveToFile(NumVariant);
end;


procedure TInp1Form.SaveToFile(M:Integer);
var F : Text;
    LogFileName:String;
    i,j:integer;
    str:String;
begin
 LogFileName:=DataPath+'DATA\P'+IntToStr(M)+'.TXT';
 AssignFile(F,LogFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно записать в '+LogFileName;
  Exit;
 end;
// str:=IntToStr(IMatrixGrid.RowCount); Writeln(F,str);
// str:=IntToStr(IMatrixGrid.ColCount); Writeln(F,str);
 For j:=1 to IMatrixGrid.RowCount-1 do
 For i:=1 to IMatrixGrid.ColCount-1 do   Writeln(F,IMatrixGrid.Cells[i,j]);
 CloseFile(F);
end;


procedure TInp1Form.LoadFromFile(M:Integer);
var F : Text;
    LogFileName,Str:String;
    i,j:Integer;
begin
 ClearGrid;
 LogFileName:=DataPath+'DATA\P'+IntToStr(M)+'.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из '+LogFileName;
  Exit;
 end;
 Readln(F, Str);
 IMatrixGrid.RowCount:=StrToInt(str);
 Readln(F, Str);
 IMatrixGrid.ColCount:=StrToInt(str);
 For j:=1 to IMatrixGrid.RowCount-1 do
 For i:=1 to IMatrixGrid.ColCount-1 do
 begin
  Readln(F,str);
  IMatrixGrid.Cells[i,j]:=str;
 end;
 CloseFile(F);
end;

procedure TInp1Form.ClearGrid;
var i,j:Integer;
    x1,y1:Integer;
    Angle:Extended;
begin
 GraphImage.Canvas.Pen.Color:=clWhite;
 For j:=1 to IMatrixGrid.RowCount-1 do
 For i:=1 to IMatrixGrid.ColCount-1 do
 begin
  IMatrixGrid.Cells[i,j]:='';
  If i<>j then
  begin
   GraphImage.Canvas.MoveTo(CoordArr[j].X,CoordArr[j].Y);
   GraphImage.Canvas.LineTo(CoordArr[i].X,CoordArr[i].Y);
  end else
  begin
   Angle:=(i-1)*360/NumNodes;
   x1:=CoordArr[i].X+Round( 30 * cos(Angle*2*pi/360));
   y1:=CoordArr[i].Y-Round( 30 * sin(Angle*2*pi/360));
   GraphImage.Canvas.Ellipse(x1-30,y1-30,x1+30,y1+30);
  end;
 end;
 NodesPaint;
end;


end.

