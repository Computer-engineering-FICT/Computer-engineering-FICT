unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TOperForm }

  TOperForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ExitButton: TButton;
    OldGrid: TStringGrid;
    InfoPanel: TPanel;
    Ngrid: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;
  Agrid,b,c:array[1..200,1..1000]of integer;

implementation

{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.Button1Click(Sender: TObject);
  var F : Text;
    LogFileName,Str:String;
    i,j:Integer;
begin
 LogFileName:='DATA\P1.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Неможливо прочитати '+LogFileName;
  Exit;
 end;
 Readln(F, Str);
 OldGrid.RowCount:=StrToInt(str);
 Readln(F, Str);
 OldGrid.ColCount:=StrToInt(str);
 For j:=1 to OldGrid.RowCount-1 do
 For i:=1 to OldGrid.ColCount-1 do
 begin
  Readln(F,str);
  Oldgrid.Cells[i,j]:=str;
 end;
 CloseFile(F);
end;

procedure TOperForm.Button2Click(Sender: TObject);
var i,j,k,m,p,kr:integer;
begin
    k:=0;
    For i:=1 to oldgrid.rowCount-1 do
        For j:=1 to OldGrid.colCount-1 do
        if oldgrid.cells[i,j]<>'' then
            agrid[i,j]:=1//зчитує старий масив
                             else
            agrid[i,j]:=0;
    For i:=1 to oldgrid.rowCount-1 do
        For j:=1 to OldGrid.colCount-1 do
            if agrid[i,j]<>0 then inc(k); //зчитує кількість ребер
    For i:=1 to oldgrid.rowCount-1 do
        For j:=1 to OldGrid.colCount-1 do
            if  agrid[i,j]=1 then kr:=i; // останній заповнений рядок
    for i:=1 to oldgrid.RowCount-1 do
        for j:=1 to k-1 do
        Ngrid.Cells[i,j]:=''; //обнуляє кінцеву матрицю
    m:=1;
     For i:=1 to oldgrid.rowCount-1 do
        For j:=1 to OldGrid.colCount-1 do
        c[i,j]:=agrid[j,i];       //перевертаю
    For i:=1 to oldgrid.rowCount-1 do
             For j:=1 to oldGrid.colCount-1 do
                 if c[i,j]=1 then
                    begin
                         m:=m+1;
                         if i<>j then
                            begin
                            b[i,m]:=1;

                            if j>kr then b[kr-j,m]:=-1
                                    else b[j,m]:=-1;  //сам алгоритм
                            end
                         else b[i,m]:=2;
                    end;
     For i:=1 to oldgrid.rowCount-1 do
             For j:=1 to oldGrid.colCount-1 do
             c[i,j]:=b[i,j+1];  //зміщу на 1 рядок
     for i:=1 to 19 do
         for j:=1 to 100 do
            NGrid.Cells[j,i]:=inttostr(c[i,j]);

end;

end.

