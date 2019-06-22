unit Unit2;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids,Unit5;

type
  { TOperForm }
  TOperForm = class(TForm)
    before: TLabel;
    after: TLabel;
    load: TButton;
    draw: TButton;
    clean: TButton;
    ExitButton: TButton;
    GraphImage: TImage;
    InfoPanel: TPanel;
    Label1: TLabel;
    sg1: TStringGrid;
    Label2: TLabel;
    list: TStringGrid;
    procedure cleanClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg1Selection(Sender: TObject; aCol, aRow: Integer);
    procedure loadClick(Sender: TObject);
    procedure drawClick(Sender: TObject);
  private
    { private declarations }
    procedure NodesPaint;
    procedure EdgesPaint;
    Procedure glue(n, l: integer);
    procedure LoadFromFile(M:Integer);
    procedure ClearGrid;
    Procedure EdgeGenerator;
    Procedure show_sp;
    Procedure check(l: integer);
    procedure otrisovka(number: integer; colorOf: integer);
  public
    { public declarations }
  end;

   Type
   TNodeCoord=record
     X:Integer;
     Y:Integer;
   end;

var
  OperForm: TOperForm;
  CoordArr: array [1..150] of TNodeCoord;
  R2S : array[1..16,1..2] of integer;
  paints : array[1..16,1..2] of integer;
  kraska, fl: integer;
implementation

{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.cleanClick(Sender: TObject);
begin
 ClearGrid;
 list.Clean;
 before.visible:=false;
 after.visible:=false;
 infopanel.Caption:='Очищення виконано';
end;

procedure TOperForm.FormActivate(Sender: TObject);
  var i:Integer;
begin
 OperForm.Caption:='Ввід даних по варіанту '+IntToStr(NumVariant);
 sg1.ColCount:=NumNodes+1;  //Формируем размер матрицы смежности
 sg1.RowCount:=NumNodes+1;
 GraphImage.Canvas.Pen.Width:= 1;   // Толщина окаймляющей линии
 GraphImage.Canvas.Pen.Color:=clBlack; // Цвет окаймляющей линии
 GraphImage.Canvas.Brush.Color := clwhite; // Цвет фона
 GraphImage.Canvas.Rectangle(0, 0, 600, 600);//  Размер картинки
 GraphImage.Canvas.Font.Size:=10; // Размер шрифиа на картинке
 If NumNodes>0 then
 begin
  For i:=1 to NumNodes do
  begin
   sg1.Cells[i,0]:=IntToStr(i); //Нумерация строк и столбцов
   sg1.Cells[0,i]:=IntToStr(i);
  end;
  ClearGrid;
  NodesPaint;
  If NumEdges>0 then EdgeGenerator;
 end else sg1.Visible:=false;
end;


procedure TOperForm.NodesPaint;
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
   If (a>45 ) AND  (a<225) then
   begin
    x:=x0+Round( (220+30) * cos(a*2*pi/360));
    y:=x0-Round( (220+30) * sin(a*2*pi/360));
   end else
   begin
    x:=x0+Round( (220+15) * cos(a*2*pi/360));
    y:=x0-Round( (220+15) * sin(a*2*pi/360));
   end;
   GraphImage.Canvas.TextOut(x-2,y-2,IntToStr(h));
    Inc(h);
   a:=a+360/NumNodes;
  end;
end;

procedure TOperForm.EdgesPaint;
  var i,j:Integer;
      x1,y1:Integer;
      Angle:Extended;
begin
 GraphImage.Canvas.Pen.Color:=clBlack; // Цвет ребер
  For i:=1 to NumNodes do
   For j:=1 to NumNodes do
   begin
    If sg1.Cells[i,j]='1' then
    begin
      If i<>j then
      begin  // Отрисовка ребер, соединяющих различные вершины
       GraphImage.Canvas.MoveTo(CoordArr[i].X,CoordArr[i].Y);
       GraphImage.Canvas.LineTo(CoordArr[j].X,CoordArr[j].Y);
      end else
      begin // Отрисовка петель
       Angle:=(i-1)*360/NumNodes;
       x1:=CoordArr[i].X+Round( 25 * cos(Angle*2*pi/360));
       y1:=CoordArr[i].Y-Round( 25 * sin(Angle*2*pi/360));
       GraphImage.Canvas.Ellipse(x1-25,y1-25,x1+25,y1+25);
      end;
    end;
   end;
end;

procedure TOperForm.sg1Selection(Sender: TObject; aCol, aRow: Integer);
var Angle:Extended;
    x1,y1:Integer;
begin
 If NumNodes>0 then
 begin
  If sg1.Cells[aCol,aRow]='' then
  begin sg1.Cells[aCol,aRow]:='1'; end else
  If sg1.Cells[aCol,aRow]='1' then
  begin
   sg1.Cells[aCol,aRow]:='';
   GraphImage.Canvas.Pen.Color:=clWhite;
   If aCol<>aRow then
  begin
   GraphImage.Canvas.MoveTo(CoordArr[ARow].X,CoordArr[ARow].Y);
   GraphImage.Canvas.LineTo(CoordArr[ACol].X,CoordArr[ACol].Y);
  end else
  begin
   Angle:=(aCol-1)*360/NumNodes;
   x1:=CoordArr[aCol].X+Round( 25 * cos(Angle*2*pi/360));
   y1:=CoordArr[aCol].Y-Round( 25 * sin(Angle*2*pi/360));
   GraphImage.Canvas.Ellipse(x1-25,y1-25,x1+25,y1+25);
  end;
 end;
 EdgesPaint;
 NodesPaint;
 end;
end;

procedure TOperForm.loadClick(Sender: TObject);
begin
 LoadFromFile(NumVariant);
 EdgesPaint;
 NodesPaint;
 infopanel.caption:='Граф завантажено';
end;

procedure TOperForm.glue(n, l: integer);
var
    i:integer;
begin
 for i:=1 to NumNodes do
       begin
        if i<>l then
        begin
            if sg1.Cells[l,i] = '1' then sg1.Cells[n,i]:= sg1.Cells[l,i];
            sg1.Cells[l,i]:= ' ';
        end;
       end;
       for i:=1 to NumNodes do
       begin
        if i<>l then
        begin
         if sg1.Cells[i,l] = '1' then sg1.Cells[i,n]:= sg1.Cells[i,l];
         sg1.Cells[i,l]:= ' ';
        end;
       end;
end;

procedure TOperForm.LoadFromFile(M: Integer);
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
  sg1.RowCount:=StrToInt(str);
  Readln(F, Str);
  sg1.ColCount:=StrToInt(str);
  NumNodes:=sg1.ColCount-1;
  For j:=1 to sg1.RowCount-1 do
  For i:=1 to sg1.ColCount-1 do
  begin
   Readln(F,str);
   sg1.Cells[i,j]:=str;
  end;
  sg1.Visible:=true;
  NodesPaint;
  CloseFile(F);
end;

procedure TOperForm.ClearGrid;
var i,j:Integer;
begin
 If NumNodes>0 then
 begin

 For j:=1 to sg1.RowCount-1 do
  For i:=1 to sg1.ColCount-1 do sg1.Cells[i,j]:='';
 For j:=1 to list.RowCount-1 do
  For i:=1 to list.ColCount-1 do list.Cells[i,j]:='';
  GraphImage.Canvas.FillRect(Rect(1,1,599,599));
  NodesPaint;
 end;
end;

procedure TOperForm.EdgeGenerator;
var N:Integer;
    StartNode,StopNode:Integer;
begin
 Randomize;
 N:=1;
 While N<=NumEdges do
 begin
  StartNode:=Random(NumNodes)+1;
  StopNode:=Random(NumNodes)+1;
  If sg1.Cells[StartNode,StopNode]='' then
  begin
   sg1.Cells[StartNode,StopNode]:='1';
   Inc(N);
  end;
 end;
 EdgesPaint;
 NodesPaint;
end;
procedure TOperForm.show_sp;
var
    flag,i,j:integer;
begin
 for i:=1 to NumNodes do
       begin
         paints[i,0]:=0;
         paints[i,1]:=0;
       end;
  flag:=0;
       for i:=1 to NumNodes do
       begin
          for j:=1 to NumNodes do
          begin
           if R2S[j,0]=i then
           begin
                paints[i,0]:= R2S[j,0];
                paints[i,1]:= R2S[j,1];
                flag:=1;
           end;
          end;
          if flag=0 then
          begin
               paints[i,0]:=i;
               paints[i,1]:=kraska;
               kraska:=kraska+1;
          end;
          flag:=0;
       end;

       for i:=1 to NumNodes do
       begin
         list.Cells[0,i]:=inttostr(paints[i,0]);
         list.Cells[1,i]:=inttostr(paints[i,1]);
       end;
       for i:=1 to NumNodes do
       otrisovka(paints[i,0],paints[i,1]);
end;
procedure TOperForm.check(l: integer);
var
    i:integer;
begin
 for i:=1 to NumNodes do
       begin
        if i<>l then
        begin
        if sg1.Cells[i,l]= '' then  fl:=1;
        end;
       end;
end;
procedure TOperForm.otrisovka(number: integer; colorOf: integer);
var i:Integer;
      x,y: integer;    // координаты номеров вершин
      x0,y0: integer;  // центр графа
      a: Extended;     // угол между OX и прямой (x0,y0) (x,y)
      h: integer;      // номера вершины
begin
 //выбор цвета, в который будут окрашена вершина с номером i
   case colorOf of
   1: GraphImage.Canvas.Pen.Color:=clred;
   2:  GraphImage.Canvas.Pen.Color:=clBlue;
   3:  GraphImage.Canvas.Pen.Color:=cllime;
   4:  GraphImage.Canvas.Pen.Color:=clyellow;
   5:  GraphImage.Canvas.Pen.Color:=clteal;
   6:  GraphImage.Canvas.Pen.Color:=clOlive;
   7:  GraphImage.Canvas.Pen.Color:=clAqua;
   8:  GraphImage.Canvas.Pen.Color:=clGreen;
   9:  GraphImage.Canvas.Pen.Color:=clMaroon;
   10: GraphImage.Canvas.Pen.Color:=clFuchsia;
   11: GraphImage.Canvas.Pen.Color:=clgray;
   end;
   X0:=300;
   Y0:=300;
   a:=0; // вершины ставим начиная с 1, против часовой стрелки
   h:=1; // номер вершины
   GraphImage.Canvas.Pen.Width:= 20;
   While a<360 do
  begin
   CoordArr[h].X:=x0+Round( 220 * cos(a*2*pi/360)); //массив координат
   CoordArr[h].Y:=x0-Round( 220 * sin(a*2*pi/360));
   if number = h then
     begin
       GraphImage.Canvas.MoveTo(CoordArr[h].X,CoordArr[h].Y);
       GraphImage.Canvas.Ellipse(CoordArr[h].X-1,CoordArr[h].
                      Y-1,CoordArr[h].X+1,CoordArr[h].Y+1);
     end;
   // цифры по большему радиусу
   If (a>45 ) AND  (a<225) then
   begin
    x:=x0+Round( (220+30) * cos(a*2*pi/360));
    y:=x0-Round( (220+30) * sin(a*2*pi/360));
   end else
   begin
    x:=x0+Round( (220+15) * cos(a*2*pi/360));
    y:=x0-Round( (220+15) * sin(a*2*pi/360));
   end;
    GraphImage.Canvas.TextOut(x-2,y-2,IntToStr(h));
      // относит. степень
   If (a>45 ) AND  (a<225) then
   begin
    x:=x0+Round( (240+30) * cos(a*2*pi/360));
    y:=x0-Round( (240+30) * sin(a*2*pi/360));
   end else
   begin
    x:=x0+Round( (240+15) * cos(a*2*pi/360));
    y:=x0-Round( (240+15) * sin(a*2*pi/360));
   end;
    //GraphImage.Canvas.TextOut(x-2,y-2,IntToStr(DegArr[h] div 100));
      // двойная относит степень
   If (a>45 ) AND  (a<225) then
   begin
    x:=x0+Round( (260+30) * cos(a*2*pi/360));
    y:=x0-Round( (260+30) * sin(a*2*pi/360));
   end else
   begin
    x:=x0+Round( (260+15) * cos(a*2*pi/360));
    y:=x0-Round( (260+15) * sin(a*2*pi/360));
   end;
    //GraphImage.Canvas.TextOut(x-2,y-2,IntToStr(DegArr[h]  mod 100));
   Inc(h);
   a:=a+360/NumNodes;
  end;
end;
procedure TOperForm.drawClick(Sender: TObject);
var
    m,i,j,p: integer;
begin
    fl:=0;
    m:=1;
    kraska:=1;
    for i:=1 to NumNodes do
    begin
     check(i);
     if fl=1 then
     begin
          R2S[m,0]:=i;
          R2S[m,1]:=kraska;
          fl:=0;
          m:=m+1;
          kraska:=kraska+1;
     end;

     for j:=1 to NumNodes do
         begin
              if i<>j then
              begin
                 if sg1.Cells[j,i]= '' then
                 begin
                      R2S[m,0]:= j;
                      R2S[m,1]:=R2S[m-1,1];
                      m:=m+1;
                      glue(i,j);
                 end;
              end;

         end;
    end;
    show_sp;

    p:=0;
    i:=1;
    while(list.Cells[1,i]<>'') do
    begin
     if (list.Cells[1,i]>intToStr(p)) then
        p:=StrToInt(list.Cells[1,i]);
     i:=i+1;
    end;

    for i:=0 to sg1.ColCount-1 do
        for j:=0 to sg1.RowCount-1 do
            if ((i>p) or (j>p)) then
               sg1.Cells[i,j]:='';
    before.visible:=true;
    before.Caption:='Кількість вершин до : '+intToStr(sg1.ColCount-1);
    after.visible:=true;
    after.Caption:='Кількість вершин після : '+intToStr(p);
    InfoPanel.Caption:='Розфарбовування виконано.';
end;
end.
