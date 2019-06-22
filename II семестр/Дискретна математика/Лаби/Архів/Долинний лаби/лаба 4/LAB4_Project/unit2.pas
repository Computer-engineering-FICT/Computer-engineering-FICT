unit Unit2;

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
 TIndex=0..18;
  TArray=array[TIndex] of Integer;
  TMatrix=array[TIndex] of TArray;
  TByte=array[TIndex] of Boolean;

  { TOperForm }

  TOperForm = class(TForm)
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    WayLength: TEdit;
    InputStart: TEdit;
    InputFinish: TEdit;
    Generate: TButton;
    ClearButton: TButton;
    EdgeButton: TButton;
    EdgeEdit: TEdit;
    ExitButton: TButton;
    GraphImage: TImage;
    IMatrixGrid: TStringGrid;
    InfoPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LoadButton: TButton;
    InputFile: TRadioButton;
    InputDisplay: TRadioButton;
    SortResult: TStringGrid;
    SortLength: TStringGrid;
    SortWay: TStringGrid;
    procedure ClearButtonClick(Sender: TObject);
    procedure EdgeButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GenerateClick(Sender: TObject);
    procedure IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
    procedure LoadButtonClick(Sender: TObject);
    procedure NodesPaint;
    procedure EdgesPaint;
    procedure FormActivate(Sender: TObject);
    procedure SaveToFile;
    procedure LoadFromFile;
    procedure ClearGrid;
    procedure RedEdgesPaint;

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;

  CoordArr: array [1..20] of TNodeCoord;
  Var
    Count:Integer=18;
      CurCol,CurRow:Integer;
    NumNodes:Integer=18;
    NumVariant:Integer=7;
    NZK:Integer=3110;
    DataPath:String='D:\универ\2 семестр\дискр\лаба 4\LAB4_Project';
    List,ListReturn,ListWay: array[TIndex] of TIndex;
    ListLength: array[TIndex] of Integer;
    Tabl:TMatrix;
    PromArray:TArray;
    PromCounter:TIndex;

implementation

{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.FormCreate(Sender: TObject);
begin

end;

procedure TOperForm.GenerateClick(Sender: TObject);

var i,j,k,s:Integer;
    Start,Finish,StartL,FinishL,Prom:TIndex;
    flag:boolean;
    ArrayUsed:TByte;
begin
  EdgesPaint;
Start:=StrToInt(InputStart.Text);
 Finish:=StrToInt(InputFinish.Text);
 if Start=Finish then
 begin
      Infopanel.Caption:='Вершина '+IntToStr(Start)+' співпадає ';
      WayLength.Text:='';
 end

 else
 begin
   for i:=1 to NumNodes do
          SortWay.Cells[i-1,0]:='';
 for j:=1 to NumNodes do
   for i:=1 to NumNodes do
     Tabl[j,i]:=StrToInt(IMatrixGrid.Cells[i,j]);
 for i:=1 to NumNodes do
   ArrayUsed[i]:=false;
 for k:= NumNodes downto 1 do
   begin
    for i:=NumNodes downto 1 do
      begin
       s:=1;
       if ArrayUsed[i]=false then
          begin
           s:=0;
           for j:=1 to NumNodes do
              if ((i<>j) and (Tabl[i,j]<>0) and (ArrayUsed[j]=false))
                    then s:=s+1;
          end;
       if s=0 then
          begin
           ArrayUsed[i]:=true;
           List[k]:=i;       // из номера вершину
           ListReturn[i]:=k; // из вершины номер
           break;
          end;
      end;
     end;
 for i:=1 to NumNodes do
   SortResult.Cells[i-1,0]:=IntToStr(List[i]);

 StartL:=ListReturn[Start];
 FinishL:=ListReturn[Finish];
 ListLength[StartL]:=0;
 for i:=StartL+1 to FinishL do
    ListLength[i]:=-1;
 for i:=StartL+1 to FinishL do
    for j:=StartL to i-1 do
       if ((Tabl[List[j],List[i]]<>0)and(ListLength[j]<>-1)and
         ((ListLength[i]=-1) or (ListLength[i]>ListLength[j] + Tabl[List[j],List[i]]) ))
                  then   ListLength[i]:=ListLength[j] + Tabl[List[j],List[i]] ;
 for i:=1 to NumNodes do
    SortLength.Cells[i-1,0]:=IntToStr(ListLength[i]);
 Prom:=FinishL;
 PromCounter:=1;
 for i:=FinishL downto StartL+1 do
    if ((ListLength[Prom]=ListLength[i] + Tabl[List[i],List[Prom]])and (ListLength[i]<>-1)and (ListLength[i]<>ListLength[Prom])) then
       begin
        PromArray[PromCounter]:= i;
        inc(PromCounter);
        Prom:=i;
        if Prom=StartL then break;
       end;
 if (PromCounter=1) and (ListLength[FinishL]<=0)
       then begin
        Infopanel.Caption:='Неможливо знайти шлях із вершини '+IntToStr(Start)+' до вершини '+IntToStr(Finish);
        WayLength.Text:='';
       end
 else
   begin
    PromArray[0]:= FinishL;
    PromArray[PromCounter]:= StartL;
    for i:=0 to  PromCounter do
       SortWay.Cells[PromCounter-i,0]:=IntToStr(List[PromArray[i]]);
    WayLength.Text:=IntToStr(ListLength[FinishL]);
    Infopanel.Caption:='Шлях з вершини '+IntToStr(Start)+' до вершини '+IntToStr(Finish);
   end;
 RedEdgesPaint;
 end;
end;




procedure TOperForm.IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
var Angle:Extended;
    x1,y1:Integer;
begin
 CurCol:=aCol; //Выбрали активную ячейку матрицы
 CurRow:=aRow;
end;


procedure TOperForm.LoadButtonClick(Sender: TObject);
begin
 if InputFile.Checked then
    begin
     LoadFromFile; //Загрузили данные в таблицк IMatrixGrid
     EdgesPaint; // Нарисовали ребра
     NodesPaint; // Нарисовали вершины
    end;
end;


procedure TOperForm.EdgeButtonClick(Sender: TObject);  // Вод ребер
Var dWeight:Integer;
begin
  if InputDisplay.Checked then
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
end;


procedure TOperForm.ClearButtonClick(Sender: TObject);
begin
  ClearGrid;
end;


procedure TOperForm.FormActivate(Sender: TObject);
  var i,j:Integer;
begin
 Infopanel.Caption:='';
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


procedure TOperForm.SaveToFile; //Процелура сохранения в текстовый файл
var F : Text;
    LogFileName:String;
    i,j:integer;
    str:String;
begin
 AssignFile(F,'DATA\P7.TXT');
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
    begin
     InfoPanel.Caption:='Невозможно записать в '+LogFileName;
     Exit;
    end;
 str:=IntToStr(IMatrixGrid.RowCount); Writeln(F,str);
 str:=IntToStr(IMatrixGrid.ColCount); Writeln(F,str);
 For j:=1 to IMatrixGrid.RowCount-1 do
    For i:=1 to IMatrixGrid.ColCount-1 do
       Writeln(F,IMatrixGrid.Cells[i,j]);
 CloseFile(F);
end;


procedure TOperForm.LoadFromFile; //Процедура чтения из файла
var F : Text;
    LogFileName,Str:String;
    i,j:Integer;
begin
 ClearGrid;
 AssignFile(F,'DATA\P7.TXT');
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из ';
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
  if str<>''
        then IMatrixGrid.Cells[i,j]:=str
        else IMatrixGrid.Cells[i,j]:='0';
 end;
 CloseFile(F);
end;


procedure TOperForm.EdgesPaint; // отрисовка ребер
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


procedure TOperForm.RedEdgesPaint; // отрисовка выделенных ребер
var i,j,k:Integer;
    x1,y1:Integer;      // Служебные координаты
    Angle:Extended;     // Угол наклона вершины относительно центра графа
    Weight:Integer;    //Вес ребра
    WL1,WL2:TNodeCoord;
    Len:Extended;    //Длина ребра
    QX,QY:Integer;
begin
 EdgesPaint;
 GraphImage.Canvas.Font.Size:=10; //Устанавливаем размер шрифта для веса ребра
 GraphImage.Canvas.Pen.Color:=clRed; //Устанавливаем цвет пера
 For k:=0 to PromCounter-1 do begin
i:=List[PromArray[k]];
j:=List[PromArray[k+1]];
  begin
   Weight:=StrToInt(IMatrixGrid.Cells[i,j]);
   If Weight>0 then
   begin
    If i<>j then
    begin  // Отрисовка ребер, соединяющих различные вершины
     GraphImage.Canvas.Pen.Color:=clRed; //Установка цвета пера
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
     WL2.X:=(CoordArr[j].X+WL1.X) div 2; // Вычислили координаты для веса ребра
     WL2.Y:=(CoordArr[j].Y+WL1.Y) div 2;
     GraphImage.Canvas.TextOut(WL2.X,WL2.Y,IMatrixGrid.Cells[i,j]); //Нарисовали вес
    end;
   end;
  end;
 end;
end;


procedure TOperForm.NodesPaint; //Отрисовка вершин
var   x,y: integer;    // координаты номеров вершин
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


procedure TOperForm.ClearGrid; // Очистка всего
var i,j:Integer;
    x1,y1:Integer;
    Angle:Extended;
begin
 For j:=1 to IMatrixGrid.RowCount-1 do
    For i:=1 to IMatrixGrid.ColCount-1 do
       IMatrixGrid.Cells[i,j]:='0';
 GraphImage.Canvas.FillRect(Rect(1,1,599,599));
 NodesPaint;
 for i:=1 to NumNodes do
     begin
          SortResult.Cells[i-1,0]:='';
          SortLength.Cells[i-1,0]:='';
          SortWay.Cells[i-1,0]:='';
     end;
end;


end.

