  unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TInp3Form }

  TInp3Form = class(TForm)
    EdgeEnter: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Result: TMemo;
    PaintGraph: TButton;
    Algoritm: TButton;
    ClearButton: TButton;
    EdgeEdit1: TEdit;
    BEdge: TEdit;
    AEdge: TEdit;
    ExitButton: TButton;
    GraphImage: TImage;
    IMatrixGrid: TStringGrid;
    Label2: TLabel;
    Label4: TLabel;
    LoadButton: TButton;
    InfoPanel: TPanel;
    HandEnter: TRadioButton;
    RandomEnter: TRadioButton;
    SaveButton: TButton;
    procedure EdgeEnterClick(Sender: TObject);
    procedure PaintGraphClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EdgeEdit1Change(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure ResultChange(Sender: TObject);
    procedure AlgoritmClick(Sender: TObject);
    procedure IMatrixGrid1Click(Sender: TObject);
    procedure IMatrixGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure HandEnterChange(Sender: TObject);
    procedure RandomEnterChange(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure EdgeButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GraphButtonClick(Sender: TObject);
    procedure IMatrixGridButtonClick(Sender: TObject; aCol, aRow: Integer);
    procedure IMatrixGridClick(Sender: TObject);
    procedure IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
    procedure LoadButtonClick(Sender: TObject);
    procedure RandomEnterClick(Sender: TObject);
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
    NodeCount: integer;
  end;

 Type
   TNodeCoord=record
     X:Integer;
     Y:Integer;
   end;

 type rebro = record
       i, j: integer; { номера вершин }
     end;


var
  Inp3Form: TInp3Form;
  CoordArr: array [1..20] of TNodeCoord;
  Reb: array[1..20] of rebro;
  StartColor:boolean;

implementation
Uses Unit5;
Var CurCol,CurRow:Integer;

{$R *.lfm}

{ TInp3Form }

function SetK(k:integer) :integer;
begin
 result:=k;
 end;

procedure TInp3Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp3Form.ClearButtonClick(Sender: TObject);
begin
  ClearGrid;
end;

procedure TInp3Form.EdgeEnterClick(Sender: TObject);
Var x1,y1:Integer;
    Angle:Extended;
    dWeight,i,j:Integer;
begin

 If EdgeEdit1.Text>'' then
  begin
   InfoPanel.Caption:='';
   try
    NumNodes:= StrToInt(EdgeEdit1.Text); //Задаем количество вершин графа
   except
    on EConvertError do
    begin
     MessageDlg('Помилка вводу числа.', mtError,[mbOk], 0);
     EdgeEdit1.Text:='0';
     InfoPanel.Caption:='Наберіть вагу ребра і натисніть "ВВІД"';
     abort;
    end;
   end;

   For j:=1 to IMatrixGrid.RowCount-1 do
   For i:=1 to IMatrixGrid.ColCount-1 do begin
   IMatrixGrid.Cells[i,j]:='0';

   end;
 GraphImage.Canvas.FillRect(Rect(1,1,599,599));

 IMatrixGrid.ColCount:=NumNodes+1;  //Фрмируем размер матрицы смежности
 IMatrixGrid.RowCount:=NumNodes+1;

 For i:=0 to IMatrixGrid.ColCount-1 do
 For j:=0 to IMatrixGrid.RowCount-1 do
 begin
  If j=0 then begin
  IMatrixGrid.Cells[i,j]:=IntToStr(i);

  end
  else //Нумерация строк и столбцов
  If i=0 then begin
  IMatrixGrid.Cells[i,j]:=IntToStr(j);

  end
  else //Нумерация строк и столбцов

 end;
  cleargrid;
  end ;
 end;

procedure TInp3Form.PaintGraphClick(Sender: TObject);
var i,j:integer;
begin
  EdgesPaint;
  HandEnter.Checked:=true;
   For j:=1 to IMatrixGrid.RowCount-1 do
 For i:=1 to IMatrixGrid.ColCount-1 do
 //IMatrixGrid.Cells[i,j]:='0'
 ;
end;

procedure TInp3Form.Button3Click(Sender: TObject);
var Colori: array[1..20] of integer;
    Weight, i, j, k, z, min, col_i, col_j: integer;
    Reb: array[1..20] of rebro;
    dmin, l: real; n, m, i1,j1:integer;
begin

{ весовая матрица IMatrixGrid.Cells}

 for i:=1 to NumNodes do { раскрасить все вершины в разные цвета }
  Colori[i] := i;

{ основной алгоритм – заполнение массива ребер Reb  }

  k:=0;
  l:=0;

  while k<NumNodes-1 do begin
   dmin:=MaxInt;
   for i1:=1 to NumNodes-1 do
   for j1:=i1+1 to NumNodes do
   begin
   if (StrToInt(IMatrixGrid.Cells[i1,j1])=0) then break;
   if (StrToInt(IMatrixGrid.Cells[i1,j1])<dmin)
   and (colori[i1] <> colori[j1]) then
    begin
    dmin:=StrToInt(IMatrixGrid.Cells[i1,j1]);
    i:=i1;
    j:=j1;
    end;
   end;
   k:=k+1;
   l:=l+dmin;
   Reb[k].i := i;
   Reb[k].j := j;
   //col_i := Colori[i];
   col_j := Colori[j];

   for z:=1 to NumNodes-1 do
   if Colori[z] = col_j then Colori[z] := Colori[i];
  end;

  { вывести найденные ребра (массив Reb)}
  GraphImage.Canvas.Pen.Color:=clRed;

  For k:=1 to NumNodes-1 do
    begin
    // Отрисовка ребер, соединяющих различные вершины
    GraphImage.Canvas.MoveTo(CoordArr[Reb[k].i].X,CoordArr[Reb[k].i].Y);
    GraphImage.Canvas.LineTo(CoordArr[Reb[k].j].X,CoordArr[Reb[k].j].Y);
    end;

  //Result.Lines.Text:='Довжина дерева L: '+ FloatToStr(l);
end;

procedure TInp3Form.EdgeEdit1Change(Sender: TObject);
begin

end;

procedure TInp3Form.Label4Click(Sender: TObject);
begin

end;

procedure TInp3Form.ResultChange(Sender: TObject);
begin
end;

procedure TInp3Form.AlgoritmClick(Sender: TObject);
const
INF=32768;
type
  edge=record
  a,b,cost:integer;
  end;
var
  i,j,z,k,num:integer;
  first1,last1:integer;
  ArrayEdge:array[1..100] of edge;
  ArrayPor:array[1..20] of integer;
  alpha:array[1..20] of integer;
  d:array[1..20] of integer;
begin
 z:=1;
 num:= strtoint(EdgeEdit1.Text)  ;
 for i:=1 to num do
   for j:=1 to  num do
     if StrToInt(IMatrixGrid.Cells[i,j])>0 then
       begin
         ArrayEdge[z].a:=i;
         ArrayEdge[z].b:=j;
         ArrayEdge[z].cost:=StrToInt(IMatrixGrid.Cells[i,j]);
         z:=z+1;
         ArrayEdge[z].a:=j;
         ArrayEdge[z].b:=i;
         ArrayEdge[z].cost:=StrToInt(IMatrixGrid.Cells[i,j]);
         z:=z+1;
       end;
 for i:=1 to 20 do alpha[i]:=inf;
 alpha[Strtoint(AEdge.Text)]:=0;
 for i:=1 to (Strtoint(EdgeEdit1.Text )-1)  do
   for j:=1 to (z-1) do
     if (alpha[ArrayEdge[j].a] < INF) then
       if (alpha[ArrayEdge[j].b]>alpha[ArrayEdge[j].a]+ArrayEdge[j].cost) then
         begin
           alpha[ArrayEdge[j].b]:=alpha[ArrayEdge[j].a]+ArrayEdge[j].cost;
           ArrayPor[ArrayEdge[j].b]:=ArrayEdge[j].a;
         end;
 GraphImage.Canvas.Pen.Color:=clred;
 GraphImage.Canvas.Pen.Width:=4;
 StartColor:=true;
 if((alpha[strtoint(BEdge.Text)]=INF) or (alpha[strtoint(BEdge.Text)]=0) ) then
   begin
     Result.Lines.Delete(0);
     Result.Lines.Delete(0);
     Result.Lines.Add('З вершини А('+AEdge.Text+') у веришину В('+BEdge.Text+') не має шляху.');
   end
 else
   begin
     Result.Lines.Delete(0);
     Result.Lines.Delete(0);
     Result.Lines.Add('Довжина найкоротшого шляху з вершини А('+AEdge.Text+') у вершину В('+BEdge.Text+') за алгоритмом Форда-Белмана дорівнює L='+inttostr(alpha[strtoint(BEdge.Text)])+'.');
     i:=strtoint(BEdge.Text);
     k:=1;
     while i<>strtoint(AEdge.Text) do
       begin
         d[k]:=i;
         k:=k+1;
         i:=ArrayPor[i];
       end;
     GraphImage.Canvas.MoveTo(CoordArr[strtoint(AEdge.Text)].X,CoordArr[strtoint(AEdge.Text)].Y);
     for i:=k-1 downto 1 do
       begin
         //Отрисовка ребер, соединяющих различные вершины
         GraphImage.Canvas.LineTo(CoordArr[d[i]].X,CoordArr[d[i]].Y);
       end;
   end;
end;

procedure TInp3Form.IMatrixGrid1Click(Sender: TObject);
begin
  StartColor:=false;
end;

procedure TInp3Form.IMatrixGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
const
clPaleRed = TColor($CCCCFF);
var k:integer;
begin
 If StartColor then
;
 For k:=1 to NumNodes-1 do
   begin
   if (ACol = Reb[k].i ) and (ARow = Reb[k].j) then
   begin
        end;
  end;
end;

procedure TInp3Form.HandEnterChange(Sender: TObject);
begin

end;

procedure TInp3Form.RandomEnterChange(Sender: TObject);
begin

end;

procedure TInp3Form.EdgeButtonClick(Sender: TObject);
Var dWeight:Integer;
begin
end;

procedure TInp3Form.FormActivate(Sender: TObject);
  var i,j:Integer;
begin
 NumNodes:=10+NZK mod 11;  //Задаем количество вершин графа
 IMatrixGrid.ColCount:=NumNodes+1;  //Фрмируем размер матрицы смежности
 IMatrixGrid.RowCount:=NumNodes+1;
 For i:=0 to IMatrixGrid.ColCount-1 do
  For j:=0 to IMatrixGrid.RowCount-1 do
 begin
  If j=0 then IMatrixGrid.Cells[i,j]:=IntToStr(i) else //Нумерация строк и столбцов
  If i=0 then IMatrixGrid.Cells[i,j]:=IntToStr(j) else //Нумерация строк и столбцов
  IMatrixGrid.Cells[i,j]:='0';
 end;
 GraphImage.Canvas.Pen.Width:= 1;   // Толщина окаймляющей линии
 GraphImage.Canvas.Pen.Color:=clBlack; // Цвет окаймляющей линии
 GraphImage.Canvas.Brush.Color := clwhite; // Цвет фона
 GraphImage.Canvas.Rectangle(0, 0, 600, 600);//  Размер картинки
 GraphImage.Canvas.Font.Size:=12; // Размер шрифиа на картинке
 NodesPaint;
end;

procedure TInp3Form.FormCreate(Sender: TObject);
begin
end;

procedure TInp3Form.FormShow(Sender: TObject);
begin
end;

procedure TInp3Form.EdgesPaint; // отрисовка ребер
var i,j:Integer;
    x1,y1:Integer;
    Angle:Extended;
    Weight:Integer;
    WL1,WL2:TNodeCoord;
begin
 GraphImage.Canvas.Font.Size:=8;
 GraphImage.Canvas.Pen.Color:=clBlack;
 For i:=1 to NumNodes do
  For j:=1 to NumNodes do
  begin
   Weight:=StrToInt(IMatrixGrid.Cells[i,j]);
   If Weight>0 then
   begin
    If i<>j then
    begin  // Отрисовка ребер, соединяющих различные вершины
     GraphImage.Canvas.MoveTo(CoordArr[i].X,CoordArr[i].Y);
     GraphImage.Canvas.LineTo(CoordArr[j].X,CoordArr[j].Y);
     WL1.X:=(CoordArr[j].X+CoordArr[i].X) div 2;
     WL1.Y:=(CoordArr[j].Y+CoordArr[i].Y) div 2;
     WL2.X:=(CoordArr[j].X+WL1.X) div 2;
     WL2.Y:=(CoordArr[j].Y+WL1.Y) div 2;
     GraphImage.Canvas.TextOut(WL2.X,WL2.Y,IMatrixGrid.Cells[i,j]);
    end else
    begin // Отрисовка петель
     Angle:=(i-1)*360/NumNodes;
     x1:=CoordArr[i].X+Round( 30 * cos(Angle*2*pi/360));
     y1:=CoordArr[i].Y-Round( 30 * sin(Angle*2*pi/360));
     GraphImage.Canvas.Ellipse(x1-30,y1-30,x1+30,y1+30);
     WL2.X:=300+Round( 280 * cos(Angle*2*pi/360));
     WL2.Y:=300-Round( 280 * sin(Angle*2*pi/360));
     GraphImage.Canvas.TextOut(WL2.X,WL2.Y,IMatrixGrid.Cells[i,j]);
    end;
   end;
  end;
end;

procedure TInp3Form.NodesPaint;
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
  GraphImage.Canvas.Font.Size:=12;
 While a<360 do
 begin
  CoordArr[h].X:=x0+Round( 220 * cos(a*2*pi/360)); //массив координат
  CoordArr[h].Y:=x0-Round( 220 * sin(a*2*pi/360));
  GraphImage.Canvas.MoveTo(CoordArr[h].X,CoordArr[h].Y);
  GraphImage.Canvas.Ellipse(CoordArr[h].X-4,CoordArr[h].Y-4,CoordArr[h].X+4,CoordArr[h].Y+4);
  // цифры по большему радиусу
  x:=x0+Round( (220+25) * cos(a*2*pi/360));
  y:=y0-Round( (220+25) * sin(a*2*pi/360));
  GraphImage.Canvas.TextOut(x-2,y-2,IntToStr(h));
  Inc(h);
  a:=a+360/NumNodes;
 end;
end;

procedure TInp3Form.GraphButtonClick(Sender: TObject);

begin

end;

procedure TInp3Form.IMatrixGridButtonClick(Sender: TObject; aCol, aRow: Integer);
begin
end;

procedure TInp3Form.IMatrixGridClick(Sender: TObject);
begin

end;


procedure TInp3Form.IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
var Angle:Extended;
    x1,y1:Integer;
begin
 CurCol:=aCol;
 CurRow:=aRow;
 end;

procedure TInp3Form.LoadButtonClick(Sender: TObject);
begin
 LoadFromFile(NumVariant);
 EdgesPaint;
 NodesPaint;
end;

procedure TInp3Form.RandomEnterClick(Sender: TObject);
var i,j:integer;
begin
 ClearGrid;
 Randomize;
 For i:=1 to IMatrixGrid.RowCount-1 do
 For j:=1 to IMatrixGrid.ColCount-1 do
 IMatrixGrid.Cells[i,j]:='0';
 For i:=1 to IMatrixGrid.RowCount-1 do
 For j:=i+1 to IMatrixGrid.ColCount-1 do
 if (Random < 0.5) then IMatrixGrid.Cells[i,j]:='0' else
 begin
  IMatrixGrid.Cells[i,j]:=IntToStr(random(10));
  IMatrixGrid.Cells[j,i]:=IMatrixGrid.Cells[i,j];
end;
end;
procedure TInp3Form.SaveButtonClick(Sender: TObject);
begin
  SaveToFile(NumVariant);
end;
procedure TInp3Form.SaveToFile(M:Integer);
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


procedure TInp3Form.LoadFromFile(M:Integer);
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

procedure TInp3Form.ClearGrid;
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

