  unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TInp2Form }

  TInp2Form = class(TForm)
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
    procedure IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
    procedure LoadButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
  private
    { private declarations }
    procedure NodesPaint;
    procedure EdgesPaint(B:Boolean);
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
  Inp2Form: TInp2Form;
  CoordArr: array [1..20] of TNodeCoord;
  StartNode:Integer;
  StopNode:Integer;
  LoopNode:Integer;

implementation
Uses Unit5;



{$R *.lfm}

{ TInp1Form }

procedure TInp2Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp2Form.ClearButtonClick(Sender: TObject);
begin
  ClearGrid;
end;

procedure TInp2Form.FormActivate(Sender: TObject);
  var i:Integer;
begin
 NumNodes:=10+NZK mod 11;  //Задаем количество вершин графа
 IMatrixGrid.ColCount:=Round((NumNodes*NumNodes)/2)+1;  //Фрмируем размер матрицы инцидентности
 IMatrixGrid.RowCount:=NumNodes+1;
 For i:=1 to IMatrixGrid.RowCount-1  do IMatrixGrid.Cells[0,i]:='v'+IntToStr(i);//Нумерация строк
 For i:=1 to IMatrixGrid.ColCount-1  do IMatrixGrid.Cells[i,0]:='e'+IntToStr(i);//Нумерация столбцов
 GraphImage.Canvas.Pen.Width:= 1;   // Толщина окаймляющей линии
 GraphImage.Canvas.Pen.Color:=clBlack; // Цвет окаймляющей линии
 GraphImage.Canvas.Brush.Color := clwhite; // Цвет фона
 GraphImage.Canvas.Rectangle(0, 0, 600, 600);//  Размер картинки
 GraphImage.Canvas.Font.Size:=12; // Размер шрифиа на картинке
 NodesPaint;
end;


procedure TInp2Form.EdgesPaint(B:Boolean); // отрисовка ребер
var i,j:Integer;
    x1,y1:Integer;
    Angle:Extended;
begin
 If B then GraphImage.Canvas.Pen.Color:=clBlack else
 GraphImage.Canvas.Pen.Color:=clWhite;
 For i:=1 to IMatrixGrid.ColCount-1 do
 begin
  StartNode:=0;
  StopNode:=0;
  LoopNode:=0;
  For j:=1 to IMatrixGrid.RowCount-1 do
  begin
   If IMatrixGrid.Cells[i,j]='1' then
   begin
    If StartNode=0 then StartNode:=j else
    If StopNode=0 then StopNode:=j;
   end;
   If IMatrixGrid.Cells[i,j]='2' then LoopNode:=j;
  end;
  If  ((StartNode>0)  AND (StopNode>0)) then
  begin
   GraphImage.Canvas.MoveTo(CoordArr[StartNode].X,CoordArr[StartNode].Y);
   GraphImage.Canvas.LineTo(CoordArr[StopNode].X,CoordArr[StopNode].Y);
  end else
  begin
   If  (LoopNode>0) then
   begin  // Отрисовка петель
    Angle:=(LoopNode-1)*360/NumNodes;
    x1:=CoordArr[LoopNode].X+Round( 30 * cos(Angle*2*pi/360));
    y1:=CoordArr[LoopNode].Y-Round( 30 * sin(Angle*2*pi/360));
    GraphImage.Canvas.Ellipse(x1-30,y1-30,x1+30,y1+30);
   end;
  end;
 end;
end;

procedure TInp2Form.NodesPaint;
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





procedure TInp2Form.IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
var Angle:Extended;
    x1,y1:Integer;
begin
  EdgesPaint(false);
  If NumNodes>0 then
  begin
   If IMatrixGrid.Cells[aCol,aRow]=''
   then IMatrixGrid.Cells[aCol,aRow]:='1' else
   If IMatrixGrid.Cells[aCol,aRow]='1' then
   IMatrixGrid.Cells[aCol,aRow]:='2'else
   If IMatrixGrid.Cells[aCol,aRow]='2' then IMatrixGrid.Cells[aCol,aRow]:='';
   EdgesPaint(true);
   NodesPaint;
  end;
end;


procedure TInp2Form.LoadButtonClick(Sender: TObject);
begin
 EdgesPaint(false);
 LoadFromFile(NumVariant);
 EdgesPaint(true);
 NodesPaint;
end;

procedure TInp2Form.SaveButtonClick(Sender: TObject);
begin
  SaveToFile(NumVariant);
end;


procedure TInp2Form.SaveToFile(M:Integer);
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
 str:=IntToStr(IMatrixGrid.RowCount); Writeln(F,str);
 str:=IntToStr(IMatrixGrid.ColCount); Writeln(F,str);
 For j:=1 to IMatrixGrid.RowCount-1 do
 For i:=1 to IMatrixGrid.ColCount-1 do   Writeln(F,IMatrixGrid.Cells[i,j]);
 CloseFile(F);
end;


procedure TInp2Form.LoadFromFile(M:Integer);
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



procedure TInp2Form.ClearGrid;
var i,j:Integer;
    x1,y1:Integer;
    Angle:Extended;
begin
 GraphImage.Canvas.Pen.Color:=clWhite;
 For j:=1 to IMatrixGrid.RowCount-1 do
 begin
  Angle:=(j-1)*360/NumNodes;
  x1:=CoordArr[j].X+Round( 30 * cos(Angle*2*pi/360));
  y1:=CoordArr[j].Y-Round( 30 * sin(Angle*2*pi/360));
  GraphImage.Canvas.Ellipse(x1-30,y1-30,x1+30,y1+30);
  For i:=1 to IMatrixGrid.ColCount-1 do
  begin
   IMatrixGrid.Cells[i,j]:='';
   If i<>j then
   begin
    GraphImage.Canvas.MoveTo(CoordArr[j].X,CoordArr[j].Y);
    GraphImage.Canvas.LineTo(CoordArr[i].X,CoordArr[i].Y);
   end ;
  end;
 end;
 NodesPaint;
end;


end.

