unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TElement= 0..1;
  TPercent= 0..100;
  TVector= array of TElement;
  TMatrix= array of TVector;
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Chart1: TChart;
    Series1: TFastLineSeries;
    StringGrid2: TStringGrid;
    Edit3: TEdit;
    Label3: TLabel;
    Button2: TButton;
    Edit4: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Size,Number_Of_Iterations:integer;
  MasMax,MasMin:TVector;
  Matrix:TMatrix;
  Percent:TPercent;
  Number_Of_1:integer;
  Statistics:array of integer;
implementation

{$R *.dfm}

procedure Fill_Grid1;
var i,j:integer;
begin
  Form1.StringGrid1.RowCount:=Size;
  Form1.StringGrid1.ColCount:=Size;
  for i:=0 to Size-1 do
    for j:=0 to Size-1 do
      begin
        Form1.StringGrid1.Cells[j,i]:=inttostr(Matrix[i,j]);
      end;
end;

procedure Fill_Grid2;
var i,j:integer;
begin
  Form1.StringGrid2.RowCount:=Size;
  Form1.StringGrid2.ColCount:=Size;
  for i:=0 to Size-1 do
    for j:=0 to Size-1 do
      begin
        Form1.StringGrid2.Cells[j,i]:=inttostr(Matrix[i,j]);
      end;
end;
Procedure Matrix_Creating;
  var i,j,x,y:integer;
begin
  SetLength(Matrix,0);
  SetLength(Matrix,Size);
  for i:=0 to Size-1 do
  SetLength(Matrix[i],Size);
  for i:=0 to Size-1 do
    for j:=0 to Size-1 do
      Matrix[i,j]:=0;
  Number_Of_1:=(Size*Size*Percent)div(100);
  randomize;
  if Number_Of_1>0 then
  repeat
    x:=random(Size);
    y:=random(Size);
    if Matrix[x,y]=0 then
      begin
        Matrix[x,y]:=1;
        dec(Number_Of_1);
      end;  
  until Number_Of_1=0;
end;



procedure Find_Min(k:integer;Mas:TVector; var n:integer);
var i,min:integer;
begin
  n:=k;
  min:=Mas[n];
  for i:=k+1 to Size-1 do
    begin
      if min>Mas[i] then
        begin
          min:=Mas[i];
          n:=i;
        end;
    end;
end;
procedure Find_Max_With_Top(k:integer;Mas:TVector; var n:integer);
var i,max:integer;
begin
  max:=0;
  if MasMin[k]>0 then
  begin
    for i:=0 to Size-1 do
    if Matrix[k,i]=1 then
      begin
        n:=i;
        max:=Mas[n];
        break;
      end;
  for i:=k to Size-1 do
    begin
      if (max<Mas[i]) and (Matrix[k,i]=1) then
        begin
          max:=Mas[i];
          n:=i;
        end;
    end
  end  
  else
    n:=k;
    max:=Mas[k];
    for i:=k+1 to Size-1 do
      begin
        if (max<Mas[i]) then
          begin
            max:=Mas[i];
            n:=i;
          end;
      end;
end;

procedure Matrix_Sorting;
var i,j,k,z,nmin,nmax:integer;
    Buffer:TElement;
  begin
    SetLength(MasMax,0);
    SetLength(MasMin,0);
    SetLength(MasMax,Size);
    SetLength(MasMin,Size);
    for k:=0 to Size-2 do
      begin
        nmin:=0;
        for i:=0 to Size-1 do
          begin
            MasMax[i]:=0;
            MasMin[i]:=0;
          end;
        for i:=k to Size-1 do
          begin
            for j:=k to Size-1 do
              begin
                MasMin[i]:=MasMin[i]+Matrix[i,j];
              end;
          end;
        Find_Min(k,MasMin,nmin);
        for z:=0 to Size-1 do
          begin
            Buffer:=Matrix[nmin,z];
            Matrix[nmin,z]:=Matrix[k,z];
            Matrix[k,z]:=Buffer;
          end;
        for i:=k to Size-1 do
          begin
            for j:=k to Size-1 do
              begin
                MasMax[i]:=MasMax[i]+Matrix[j,i];
              end;
          end;
        nmax:=0;  
        Find_Max_With_Top(k,MasMax,nmax);
        for z:=0 to Size-1 do
          begin
            Buffer:=Matrix[z,nmax];
            Matrix[z,nmax]:=Matrix[z,k];
            Matrix[z,k]:=Buffer;
          end;
      end;
  end;

procedure Matrix_Critical;
var i,j,k,Summ:integer;
begin
  for k:=0 to Size-2 do
    begin
      Summ:=0;
      for i:=0 to k do
        for j:=k+1 to Size-1 do
          Summ:=Summ+Matrix[i,j];
      if summ=0 then
        begin
          inc(Statistics[Percent]);
          break;
        end;      
    end;
end;

procedure Fill_Chart;
var i:integer;
begin
  Form1.Chart1.Series[0].Clear;
  for i:=0 to 100 do
    Form1.Chart1.Series[0].Add((Statistics[i]/Number_Of_Iterations)*100,inttostr(i),clgreen);
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
Size:=strtoint(Edit1.Text);
Number_Of_Iterations:=strtoint(Edit2.Text);
SetLength(Statistics,0);
SetLength(Statistics,101);
for i:=1 to Number_Of_Iterations do
  begin
    for Percent:=0 to 100 do
      begin
        Matrix_Creating;
        Matrix_Sorting;
        Matrix_Critical;
      end;  
  end;
 Fill_Chart;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Percent:=strtoint(Edit4.Text);
  Size:=strtoint(Edit3.Text);
  Matrix_Creating;
  Fill_Grid1;
  Matrix_Sorting;
  Fill_Grid2;
end;

end.
