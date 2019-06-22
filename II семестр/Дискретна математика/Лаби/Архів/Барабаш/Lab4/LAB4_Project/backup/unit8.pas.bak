  unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type
  TNodeCoord=record
    X:Integer;
    Y:Integer;
  end;

  { TInp5Form }

  TInp5Form = class(TForm)
    EdgeButton: TButton;
    ClearButton: TButton;
    EdgeEdit: TEdit;
    Label1: TLabel;
    LoadButton: TButton;
    SaveButton: TButton;
    ExitButton: TButton;
    GraphImage: TImage;
    InfoPanel: TPanel;
    IMatrixGrid: TStringGrid;
    procedure ClearButtonClick(Sender: TObject);
    procedure EdgeButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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


var
  Inp5Form: TInp5Form;
  CoordArr: array [1..20] of TNodeCoord;


implementation
Uses Unit5;
Var CurCol,CurRow:Integer;

{$R *.lfm}

{ TInp3Form }


procedure TInp5Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp5Form.ClearButtonClick(Sender: TObject);
begin
  ClearGrid;
end;


procedure TInp5Form.EdgeButtonClick(Sender: TObject);  // Вод ребер
Var dWeight:Integer;
begin
 If EdgeEdit.Text>'' then
  begin
   InfoPanel.Caption:='';
   try
    dWeight := StrToInt(EdgeEdit.Text); // Проверка корректности числа
  except
    on EConvertError do
    begin
     MessageDlg('Помилка вводу числа.', mtError,[mbOk], 0);
     EdgeEdit.Text:='0';
     InfoPanel.Caption:='Наберіть вагу ребра і натисніть "ВВІД"';
     abort;
    end;
   end;
  IMatrixGrid.Cells[CurCol,CurRow]:=EdgeEdit.Text; // Запись числа в выбранную ячейку
  end else InfoPanel.Caption:='Наберіть вагу ребра і натисніть "ВВІД"';
  If dWeight=0 then GraphImage.Canvas.FillRect(Rect(1,1,599,599)); // Очистили Canvas
  EdgesPaint; // Нарисовали ребра
  NodesPaint; // Нарисовали вершины
end;

procedure TInp5Form.FormActivate(Sender: TObject);
  var i,j:Integer;
begin
 NumNodes:=10+NZK mod 11;  //Задаем количество вершин графа
 IMatrixGrid.ColCount:=NumNodes+1;  //Фрмируем колич. колонок матрицы смежности
 IMatrixGrid.RowCount:=NumNodes+1; //Фрмируем колич. строк матрицы смежности
 For i:=0 to IMatrixGrid.ColCount-1 do
  For j:=0 to IMatrixGrid.RowCount-1 do
 begin
  If j=0 then IMatrixGrid.Cells[i,j]:=IntToStr(i) else //Нумерация строк и столбцов
  If i=0 then IMatrixGrid.Cells[i,j]:=IntToStr(j) else //Нумерация строк и столбцов
  IMatrixGrid.Cells[i,j]:='0'; //Заполняем нулями
 end;
 GraphImage.Canvas.Pen.Width:= 1;   // Толщина окаймляющей линии
 GraphImage.Canvas.Pen.Color:=clBlack; // Цвет окаймляющей линии
 GraphImage.Canvas.Brush.Color := clwhite; // Цвет фона
 GraphImage.Canvas.Rectangle(0, 0, 600, 600);//  Размер картинки
 GraphImage.Canvas.Font.Size:=12; // Размер шрифиа на картинке
 NodesPaint;
end;

procedure TInp5Form.FormCreate(Sender: TObject);
begin
end;

procedure TInp5Form.FormShow(Sender: TObject);
begin

end;

procedure TInp5Form.EdgesPaint; // отрисовка ребер
var i,j:Integer;
    x1,y1:Integer;      // Служебные координаты
    Angle:Extended;     // Угол наклона вершины относительно центра графа
    Weight:Integer;    //Вес ребра
    WL1,WL2:TNodeCoord;
    Len:Extended;    //Длина ребра
    QX,QY:Integer;
begin
 GraphImage.Canvas.Font.Size:=8; //Устанавливаем размер шрифта для веса ребра
 GraphImage.Canvas.Pen.Color:=clBlack; //Устанавливаем цвет пера
 For i:=1 to NumNodes do
  For j:=1 to NumNodes do
  begin
   Weight:=StrToInt(IMatrixGrid.Cells[i,j]);
   If Weight>0 then
   begin
    If i<>j then
    begin  // Отрисовка ребер, соединяющих различные вершины
     GraphImage.Canvas.MoveTo(CoordArr[i].X,CoordArr[i].Y); //Стали в начало ребра
     GraphImage.Canvas.LineTo(CoordArr[j].X,CoordArr[j].Y); //Нарисовали ребро
     GraphImage.Canvas.Pen.Width:= 4;   // Толщина линии стрелки
     QX:=(CoordArr[j].X-CoordArr[i].X)*(CoordArr[j].X-CoordArr[i].X);
     QY:=(CoordArr[j].Y-CoordArr[i].Y)*(CoordArr[j].Y-CoordArr[i].Y);
     Len:=sqrt(QX+QY);  // Вычислили длину ребра по теореме Пифагора
     x1:=Round((CoordArr[j].X-CoordArr[i].X)*20/Len)+CoordArr[i].X; //Координаты начла стрелки
     y1:=Round((CoordArr[j].Y-CoordArr[i].Y)*20/Len)+CoordArr[i].Y;//Координаты начла стрелки
     GraphImage.Canvas.MoveTo(x1,y1); //Стали в начало стрелки
     GraphImage.Canvas.LineTo(CoordArr[i].X,CoordArr[i].Y); // Нарисовали стрелку
     GraphImage.Canvas.Pen.Width:= 2;   // Восстановили базовую толщину  линии
     WL1.X:=(CoordArr[j].X+CoordArr[i].X) div 2;
     WL1.Y:=(CoordArr[j].Y+CoordArr[i].Y) div 2;
     WL2.X:=(CoordArr[j].X+WL1.X) div 2; // Вычислли координаты для веса ребра
     WL2.Y:=(CoordArr[j].Y+WL1.Y) div 2;
     GraphImage.Canvas.TextOut(WL2.X,WL2.Y,IMatrixGrid.Cells[i,j]); //Нарисовали вес
    end else
    begin // Отрисовка петель
     Angle:=(j-1)*360/NumNodes; //Ввычислили текущий угол наклона вершины
     x1:=CoordArr[i].X+Round( 30 * cos(Angle*2*pi/360)); // Координаты центра петли
     y1:=CoordArr[i].Y-Round( 30 * sin(Angle*2*pi/360));
     GraphImage.Canvas.Ellipse(x1-30,y1-30,x1+30,y1+30); //Нарисовали петлю
     WL2.X:=300+Round( 280 * cos(Angle*2*pi/360)); //Координаты для веса петли
     WL2.Y:=300-Round( 280 * sin(Angle*2*pi/360));
     GraphImage.Canvas.TextOut(WL2.X,WL2.Y,IMatrixGrid.Cells[i,j]);  //Нарисовали вес петли
    end;
   end;
  end;
end;

procedure TInp5Form.NodesPaint; //Отрисовка вершин
  var i:Integer;
      x,y: integer;    // координаты номеров вершин
      x0,y0: integer;  // центр графа
      a: Extended;     // угол между OX и прямой (x0,yo) (x,y)
      h: integer;      // номера вершины
begin
 X0:=300; //Координаты центра графа
 Y0:=300;
 a:=0; // вершины ставим начиная с 1, против часовой стрелки
 h:=1; // номер вершины
 GraphImage.Canvas.Pen.Width:= 2; //Установка толщины пера
 GraphImage.Canvas.Pen.Color:=clBlack; //Установка цвета пера
  GraphImage.Canvas.Font.Size:=12;  // Размер шрифта для номеров вершин
 While a<360 do
 begin
  CoordArr[h].X:=x0+Round( 220 * cos(a*2*pi/360)); //массив координат
  CoordArr[h].Y:=x0-Round( 220 * sin(a*2*pi/360));  //Формируем массив координат вершин
  GraphImage.Canvas.MoveTo(CoordArr[h].X,CoordArr[h].Y); //Стали в центр вершины
  {Рисуем кружок вершины}
  GraphImage.Canvas.Ellipse(CoordArr[h].X-4,CoordArr[h].Y-4,CoordArr[h].X+4,CoordArr[h].Y+4);
  // цифры по большему радиусу
  x:=x0+Round( (220+25) * cos(a*2*pi/360));
  y:=y0-Round( (220+25) * sin(a*2*pi/360));
  GraphImage.Canvas.TextOut(x-2,y-2,IntToStr(h)); // Рисуем номера вершин
  Inc(h);
  a:=a+360/NumNodes; // Угловой шаг
 end;
end;




procedure TInp5Form.IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
var Angle:Extended;
    x1,y1:Integer;
begin
 CurCol:=aCol; //Выбрали активную ячейку матрицы
 CurRow:=aRow;
end;

procedure TInp5Form.LoadButtonClick(Sender: TObject);
begin
 LoadFromFile(NumVariant); //Загрузили данные в таблицк IMatrixGrid
 EdgesPaint; // Нарисовали ребра
 NodesPaint; // Нарисовали вершины
end;

procedure TInp5Form.SaveButtonClick(Sender: TObject);
begin
  SaveToFile(NumVariant); //Сохраннили содержимое IMatrixGrid в файле
end;


procedure TInp5Form.SaveToFile(M:Integer); //Процелура сохранения в текстовый файл
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
 str:=IntToStr(IMatrixGrid.RowCount);// Writeln(F,str);
 str:=IntToStr(IMatrixGrid.ColCount); //Writeln(F,str);
 For j:=1 to IMatrixGrid.RowCount-1 do
 For i:=1 to IMatrixGrid.ColCount-1 do   Writeln(F,IMatrixGrid.Cells[i,j]);
 CloseFile(F);
end;


procedure TInp5Form.LoadFromFile(M:Integer); //Процедура чтения из файла
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

procedure TInp5Form.ClearGrid; // Очистка всего
var i,j:Integer;
    x1,y1:Integer;
    Angle:Extended;
begin
 For j:=1 to IMatrixGrid.RowCount-1 do
 For i:=1 to IMatrixGrid.ColCount-1 do IMatrixGrid.Cells[i,j]:='0';
 GraphImage.Canvas.FillRect(Rect(1,1,599,599));
 NodesPaint;
end;


end.

