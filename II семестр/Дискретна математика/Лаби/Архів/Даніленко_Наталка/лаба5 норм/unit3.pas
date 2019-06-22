  unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TInp1Form }

  TInp1Form = class(TForm)
    Label1: TLabel;
    PaintGraph: TButton;
    ClearButton: TButton;
    HandEnter: TRadioButton;
    RandomEnter: TRadioButton;
    ExitButton: TButton;
    GraphImage: TImage;
    InfoPanel: TPanel;
    IMatrixGrid: TStringGrid;
    procedure HandEnterChange(Sender: TObject);
    procedure InfoPanelClick(Sender: TObject);
    procedure RandomEnterChange(Sender: TObject);
    procedure PaintGraphClick(Sender: TObject);
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
    Procedure EdgeGenerator;

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
  CoordArr: array [1..150] of TNodeCoord;


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
 InfoPanel.Caption:='Поле для графа очищено';
end;

procedure TInp1Form.PaintGraphClick(Sender: TObject);
Type
  node=record
    num:integer;
    pow:integer;
    dpow:integer;
    color:integer;
  end;

  ArrayEdge=array[1..100] of node;
  MatrixA=array[1..200] of byte;

Var
  i,j,k,z:integer;
  A:MatrixA;
  Deg:ArrayEdge;
  SortDeg:ArrayEdge;
  x:node;
  CurColor:integer;
  procedure SetColor(i,z:integer);
  var
    j,m:integer;
    k:integer;
    b:boolean;
  begin
    for j:=1 to NumNodes do
      begin
      b:=true;
      if IMatrixGrid.Cells[i,j]='0' then
       begin
       for m:=1 to NumNodes do
         if((deg[m].color=z)and(IMatrixGrid.Cells[deg[m].num,j]='1')) then b:=false;
       for k:=1 to NumNodes do
        if ((deg[k].num=j) and (deg[k].color=0)and b) then deg[k].color:=z;
       end;
     end;
    end;


begin
  for i:=1 to NumNodes do
   begin
    deg[i].color:=0;
    deg[i].num:=i;
    deg[i].pow:=0;
    for j:=1 to Numnodes do
      begin
        if IMatrixGrid.Cells[i,j]='1' then
        deg[i].pow:=deg[i].pow+StrToInt(IMatrixGrid.Cells[i,j]);
      end;
      begin
       deg[i].dpow:=0;
       for k:=1 to NumNodes do
        begin
         if IMatrixGrid.Cells[deg[i].num,k]='1' then
           for z:=1 to NumNodes do
           if IMatrixGrid.Cells[k,z]='1' then
            deg[i].dpow:=deg[i].dpow+StrToInt(IMatrixGrid.Cells[k,z]);
        end;
       deg[i].dpow:=deg[i].dpow-deg[i].pow;
      end;
   end;
  for i:=1 to NumNodes do
   for j:=i+1 to NumNodes do
     if deg[i].pow<deg[j].pow then
      begin
       x:=deg[i];
       deg[i]:=deg[j];
       deg[j]:=x;
      end
     else if deg[i].pow=deg[j].pow then
       if deg[i].dpow<deg[j].dpow then
         begin
          x:=deg[i];
          deg[i]:=deg[j];
          deg[j]:=x;
         end;
  CurColor:=1;
  for i:=1 to NumNodes do
      if deg[i].color=0 then
        begin
         deg[i].color:=CurColor;
         SetColor(deg[i].num,CurColor);
         inc(CurColor);
        end;
  GraphImage.Canvas.Pen.Width:=7;
  For i:=1 to NumNodes do
   begin
     case deg[i].color of
     1:GraphImage.Canvas.Pen.Color:=clRed;
     2:GraphImage.Canvas.Pen.Color:=clBlue;
     3:GraphImage.Canvas.Pen.Color:=clGreen;
     4:GraphImage.Canvas.Pen.Color:=clBlack;
     5:GraphImage.Canvas.Pen.Color:=clYellow;
     6:GraphImage.Canvas.Pen.Color:=clGray;
     7:GraphImage.Canvas.Pen.Color:=clSilver;
     8:GraphImage.Canvas.Pen.Color:=clPurple;
     9:GraphImage.Canvas.Pen.Color:=clNavy;
     10:GraphImage.Canvas.Pen.Color:=clOlive;
     end;
     GraphImage.Canvas.MoveTo(CoordArr[deg[i].num].X,CoordArr[deg[i].num].Y);
     GraphImage.Canvas.Ellipse(CoordArr[deg[i].num].X-4,CoordArr[deg[i].num].Y-4,CoordArr[deg[i].num].X+4,CoordArr[deg[i].num].Y+4);
   end;
  InfoPanel.Caption:='Граф розфарбовано';
end;



procedure TInp1Form.RandomEnterChange(Sender: TObject);

 var i,j:integer;
begin
 ClearGrid;
 Randomize;
 For i:=1 to IMatrixGrid.RowCount-1 do
 For j:=1 to IMatrixGrid.ColCount-1 do
 begin
  IMatrixGrid.Cells[i,j]:=IntToStr(random(2));
  IMatrixGrid.Cells[j,i]:=IMatrixGrid.Cells[i,j];
 end;
 for i:=1 to IMatrixGrid.RowCount-1 do
  IMatrixGrid.Cells[i,i]:='0';
 EdgesPaint;
 InfoPanel.Caption:='Граф заповнився рандомно';
end;

procedure TInp1Form.HandEnterChange(Sender: TObject);
var
  i,j:integer;
begin
  ClearGrid;
  for i:=1 to NumNodes do
    for j:=1 to NumNodes do
      IMatrixGrid.Cells[i,j]:='0';
  InfoPanel.Caption:='Ви обрали ручне введення з*єднань між вершинами';
end;

procedure TInp1Form.InfoPanelClick(Sender: TObject);
begin

end;


procedure TInp1Form.FormActivate(Sender: TObject);
  var i:Integer;
begin
 Inp1Form.Caption:='Ввід даних по варіанту '+IntToStr(NumVariant);
 IMatrixGrid.ColCount:=NumNodes+1;  //розмір матриці суміжності
 IMatrixGrid.RowCount:=NumNodes+1;
 GraphImage.Canvas.Pen.Width:= 1;   // товщина лінії
 GraphImage.Canvas.Pen.Color:=clBlack; // колір лінії
 GraphImage.Canvas.Brush.Color := clwhite; // колір фону
 GraphImage.Canvas.Rectangle(0, 0, 600, 600);//  розмір картинки
 GraphImage.Canvas.Font.Size:=10; // розмір шрифту на картинці
 If NumNodes>0 then
 begin
  For i:=1 to NumNodes do
  begin
   IMatrixGrid.Cells[i,0]:=IntToStr(i); //нумерація строк і стовбців
   IMatrixGrid.Cells[0,i]:=IntToStr(i);
  end;
  ClearGrid;
  NodesPaint;
  If NumEdges>0 then EdgeGenerator;
 end else IMatrixGrid.Visible:=false;
end;

procedure TInp1Form.FormCreate(Sender: TObject);
begin
end;

procedure TInp1Form.FormShow(Sender: TObject);
begin

end;

procedure TInp1Form.EdgesPaint; // рисування ребер
var i,j:Integer;
    x1,y1:Integer;
    Angle:Extended;
begin
 GraphImage.Canvas.Pen.Color:=clBlack; // колір ребер
 For i:=1 to NumNodes do
  For j:=1 to NumNodes do
  begin
   If IMatrixGrid.Cells[i,j]='1' then
   begin
     If i<>j then
     begin  // рисування ребер, які зєднують різні вершини
      GraphImage.Canvas.MoveTo(CoordArr[i].X,CoordArr[i].Y);
      GraphImage.Canvas.LineTo(CoordArr[j].X,CoordArr[j].Y);
     end else
     begin // петлі
      Angle:=(i-1)*360/NumNodes;
      x1:=CoordArr[i].X+Round( 25 * cos(Angle*2*pi/360));
      y1:=CoordArr[i].Y-Round( 25 * sin(Angle*2*pi/360));
      GraphImage.Canvas.Ellipse(x1-25,y1-25,x1+25,y1+25);
     end;
   end;
  end;
end;

procedure TInp1Form.NodesPaint;
  var i:Integer;
      x,y: integer;    // координати вершин
      x0,y0: integer;  // центр графа
      a: Extended;     // кут між OX і прямою (x0,yo) (x,y)
      h: integer;      // номери вершин
begin
 X0:=300;
 Y0:=300;
 a:=0; // вершини з 1, протичасової стрілки
 h:=1; // номер вершини
 GraphImage.Canvas.Pen.Width:= 2;
 GraphImage.Canvas.Pen.Color:=clBlack;
 While a<360 do
 begin
  CoordArr[h].X:=x0+Round( 220 * cos(a*2*pi/360)); //масив координат
  CoordArr[h].Y:=x0-Round( 220 * sin(a*2*pi/360));
  GraphImage.Canvas.MoveTo(CoordArr[h].X,CoordArr[h].Y);
  GraphImage.Canvas.Ellipse(CoordArr[h].X-4,CoordArr[h].Y-4,CoordArr[h].X+4,CoordArr[h].Y+4);
  // цифри по великому радіусу
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
  If  IMatrixGrid.Cells[aCol,aRow]='0'then
  begin IMatrixGrid.Cells[aCol,aRow]:='1'; end else
  If IMatrixGrid.Cells[aCol,aRow]='1' then
  begin
   IMatrixGrid.Cells[aCol,aRow]:='0';
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

procedure TInp1Form.LoadButtonClick(Sender: TObject);
begin

end;

procedure TInp1Form.SaveButtonClick(Sender: TObject);
begin

end;

procedure TInp1Form.SaveToFile(M:Integer);
var F : Text;
    LogFileName:String;
    i,j:integer;
    str:String;
begin
 If NumNodes>0 then
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
 NumNodes:=IMatrixGrid.ColCount-1;
 For j:=1 to IMatrixGrid.RowCount-1 do
 For i:=1 to IMatrixGrid.ColCount-1 do
 begin
  Readln(F,str);
  IMatrixGrid.Cells[i,j]:=str;
 end;
 IMatrixGrid.Visible:=true;
 NodesPaint;
 CloseFile(F);
end;

procedure TInp1Form.ClearGrid;
var i,j:Integer;
begin
 If NumNodes>0 then
 begin
  For j:=1 to IMatrixGrid.RowCount-1 do
  For i:=1 to IMatrixGrid.ColCount-1 do IMatrixGrid.Cells[i,j]:='';
  GraphImage.Canvas.FillRect(Rect(1,1,599,599));
  NodesPaint;
 end;
end;

Procedure  TInp1Form.EdgeGenerator;
var N:Integer;
    StartNode,StopNode:Integer;
begin
 Randomize;
 N:=1;
 While N<=NumEdges do
 begin
  StartNode:=Random(NumNodes)+1;
  StopNode:=Random(NumNodes)+1;
  If IMatrixGrid.Cells[StartNode,StopNode]='' then
  begin
   IMatrixGrid.Cells[StartNode,StopNode]:='1';
   Inc(N);
  end;
 end;
 EdgesPaint;
 NodesPaint;
end;


end.

