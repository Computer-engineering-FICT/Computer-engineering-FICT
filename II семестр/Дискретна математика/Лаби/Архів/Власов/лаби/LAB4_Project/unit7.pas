  unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TInp4Form }

  TInp4Form = class(TForm)
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

 Type
   TNodeCoord=record
     X:Integer;
     Y:Integer;
   end;

var
  Inp4Form: TInp4Form;
  CoordArr: array [1..20] of TNodeCoord;


implementation
Uses Unit5;
Var CurCol,CurRow:Integer;

{$R *.lfm}

{ TInp3Form }

procedure TInp4Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp4Form.ClearButtonClick(Sender: TObject);
begin
  ClearGrid;
end;

procedure TInp4Form.EdgeButtonClick(Sender: TObject);
Var dWeight:Integer;
begin
 If EdgeEdit.Text>'' then
  begin
   InfoPanel.Caption:='';
   try
    dWeight := StrToInt(EdgeEdit.Text);
  except
    on EConvertError do
    begin
     MessageDlg('Помилка вводу числа.', mtError,[mbOk], 0);
     EdgeEdit.Text:='0';
     InfoPanel.Caption:='Наберіть вагу ребра і натисніть "ВВІД"';
     abort;
    end;
   end;
  IMatrixGrid.Cells[CurCol,CurRow]:=EdgeEdit.Text;
  end else InfoPanel.Caption:='Наберіть вагу ребра і натисніть "ВВІД"';
  If dWeight=0 then GraphImage.Canvas.FillRect(Rect(1,1,599,599));
  EdgesPaint;
  NodesPaint;
end;

procedure TInp4Form.FormActivate(Sender: TObject);
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

procedure TInp4Form.FormCreate(Sender: TObject);
begin
end;

procedure TInp4Form.FormShow(Sender: TObject);
begin

end;

procedure TInp4Form.EdgesPaint; // отрисовка ребер
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

procedure TInp4Form.NodesPaint;
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




procedure TInp4Form.IMatrixGridSelection(Sender: TObject; aCol, aRow: Integer);
var Angle:Extended;
    x1,y1:Integer;
begin
 CurCol:=aCol;
 CurRow:=aRow;
 {If NumNodes>0 then
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
 end; }
end;

procedure TInp4Form.LoadButtonClick(Sender: TObject);
begin
 LoadFromFile(NumVariant);
 EdgesPaint;
 NodesPaint;
end;

procedure TInp4Form.SaveButtonClick(Sender: TObject);
begin
  SaveToFile(NumVariant);
end;


procedure TInp4Form.SaveToFile(M:Integer);
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


procedure TInp4Form.LoadFromFile(M:Integer);
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

procedure TInp4Form.ClearGrid;
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

