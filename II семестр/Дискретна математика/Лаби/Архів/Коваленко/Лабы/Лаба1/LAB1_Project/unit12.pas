unit Unit12;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids;

type

  { TOperForm }

  TOperForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ExitBtn: TButton;
    InfoPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;

implementation

{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.FormCreate(Sender: TObject);
begin

end;

procedure TOperForm.Button1Click(Sender: TObject);
begin
  StringGrid1.Clean;
  InfoPanel.Caption:='A очищена';
end;

procedure TOperForm.Button2Click(Sender: TObject);
begin
  StringGrid2.Clean;
  InfoPanel.Caption:='B очищена';
end;

procedure TOperForm.Button3Click(Sender: TObject);
begin
  StringGrid3.Clean;
  InfoPanel.Caption:='C очищена';
end;

procedure TOperForm.Button4Click(Sender: TObject);
var input: textfile;
    i,j,A,B: integer;
begin
  StringGrid1.Clean;
  StringGrid2.Clean;
    assignfile(input,'C:\kpi\LAB1_Project\DATA\A9.TXT');
    reset(input);
    i:=0;
    j:=0;
    while not eof(input) do            // завантажую файл 1
      begin
        readln(input, A);
        StringGrid1.Cells[i,j]:=inttostr(A);
        i:=i+1;
        if i>=StringGrid1.ColCount then
          begin
            i:=0;
            j:=j+1;
          end;
      end;
     closefile(input);

     assignfile(input,'C:\kpi\LAB1_Project\DATA\B9.TXT');
     reset(input);
     i:=0;
     j:=0;
     while not eof(input) do             // завантажую файл 2
       begin
         readln(input, B);
         StringGrid2.Cells[i,j]:=inttostr(B);
         i:=i+1;
         if i>= StringGrid2.ColCount then
           begin
             i:=0;
             j:=j+1;
           end;
       end;
     closefile(input);
     InfoPanel.Caption:='A та B завантажені';
end;

procedure TOperForm.Button5Click(Sender: TObject);
const n=15; m=21;
type
  tindex=1..500;
  tarray=array[tindex] of string;
var i,j,l,k,max1,max2:integer;
      flag:boolean;
      a,b,c:tarray;
begin
  StringGrid3.Clean;
  max1:=0;
    for i:=0 to n do     // запись элеметов СГ1 в массив А
      for j:=0 to m do
        begin
          if StringGrid1.Cells[i,j]<>'' then begin
            max1:=max1+1;
            a[max1]:=StringGrid1.Cells[i,j];
            end;
        end;

  max2:=0;
    for i:=0 to n do     // запись элеметов СГ2 в массив Б
      for j:=0 to m do
        begin
          if StringGrid2.Cells[i,j]<>'' then begin
            max2:=max2+1;
            b[max2]:=StringGrid2.Cells[i,j];
            end;
        end;

  for i:=1 to max1 do begin      // запись эл массива А в массив C
  c[i]:=a[i];
  end;

  k:=max1;
  for i:=1 to max2 do begin         // дозаписываю массив С
    flag:=true;
    for j:=1 to max1 do begin
      if (b[i]=a[j]) then
        flag:=false;
      end;
      if (flag=true) then begin
        k:=k+1;
        c[k]:=b[i];
        end;
      end;

  l:=0;
  while (l<=k) do begin    // запись массива С в СГ3
  for j:=0 to m do
    for i:=0 to n do  begin
      l:=l+1;
      StringGrid3.Cells[i,j]:=c[l];
      end;
  end;
  InfoPanel.Caption:='Об''єднання виконано';
end;

procedure TOperForm.Button6Click(Sender: TObject);
const n=15; m=21;
type
  tindex=1..500;
  tarray=array[tindex] of string;
var i,j,k,l,max1,max2:integer;
      flag:boolean;
      a,b,c:tarray;
begin
  Label2.Visible:=false;
  StringGrid3.Clean;
  max1:=0;
    for i:=0 to n do     // запись элеметов СГ1 в массив А
      for j:=0 to m do
        begin
          if StringGrid1.Cells[i,j]<>'' then begin
            max1:=max1+1;
            a[max1]:=StringGrid1.Cells[i,j];
            end;
        end;

  max2:=0;
    for i:=0 to n do     // запись элеметов СГ2 в массив Б
      for j:=0 to m do
        begin
          if StringGrid1.Cells[i,j]<>'' then begin
            max2:=max2+1;
            b[max2]:=StringGrid2.Cells[i,j];
            end;
        end;

  k:=0;
  for i:=1 to max1 do begin        // формирую массив С
    flag:=false;
    for j:=1 to max2 do
      if (a[i]=b[j]) then
        flag:=true;
    if (flag=true) then begin
    k:=k+1;
    c[k]:=a[i];
    end;
  end;

  l:=0;
    while (l<=k) do begin    //запись массива С в СГ3
      for j:=0 to m do
        for i:=0 to n do begin
          l:=l+1;
          StringGrid3.Cells[i,j]:=c[l];
          end;
    end;
InfoPanel.Caption:='Перетин виконано';
end;

procedure TOperForm.Button7Click(Sender: TObject);
const n=15; m=21;
type
  tindex=1..1000;
  tarray=array[tindex] of string;
var i,j,k,l,max1,max2:integer;
      flag:boolean;
      a,b,c:tarray;
begin
  Label2.Visible:=false;
  StringGrid3.Clean;
  max1:=0;
    for i:=0 to n do     // запись элеметов СГ1 в массив А
      for j:=0 to m do
        begin
          if StringGrid1.Cells[i,j]<>'' then begin
            max1:=max1+1;
            a[max1]:=StringGrid1.Cells[i,j];
            end;
        end;

  max2:=0;
  for i:=0 to n do     // запись элеметов СГ2 в массив Б
    for j:=0 to m do
      begin
        if StringGrid2.Cells[i,j]<>'' then begin
          max2:=max2+1;
          b[max2]:=StringGrid2.Cells[i,j];
          end;
      end;

  k:=0;
    for i:=1 to max1 do begin    // формирую массив С
      flag:=true;
      for j:=1 to max2 do begin
        if (a[i]=b[j]) then
          flag:=false;
        end;
      if (flag=true) then begin
      k:=k+1;
      c[k]:=a[i];
      end;
    end;

  l:=0;
    while (l<=k) do begin    //запись массива С в СГ3
      for j:=0 to m do
        for i:=0 to n do begin
          l:=l+1;
          StringGrid3.Cells[i,j]:=c[l];
          end;
    end;
InfoPanel.Caption:='Різницю виконано';
end;

procedure TOperForm.Button8Click(Sender: TObject);
const n=15; m=21;
type
  tindex=1..1000;
  tarray=array[tindex] of string;
var i,j,k,l,max1,max2:integer;
      flag:boolean;
      a,b,c:tarray;
begin
  Label2.Visible:=false;
  StringGrid3.Clean;
  max1:=0;
    for i:=0 to n do     // запись элеметов СГ1 в массив А
      for j:=0 to m do
        begin
          if StringGrid1.Cells[i,j]<>'' then begin
            max1:=max1+1;
            a[max1]:=StringGrid1.Cells[i,j];
            end;
        end;

  max2:=0;
  for i:=0 to n do     // запись элеметов СГ2 в массив Б
    for j:=0 to m do
    begin
      if StringGrid2.Cells[i,j]<>'' then begin
        max2:=max2+1;
        b[max2]:=StringGrid2.Cells[i,j];
        end;
    end;

  k:=0;
  for i:=1 to max1 do begin    // формирую массив С (А/В)
    flag:=true;
    for j:=1 to max2 do begin
      if (a[i]=b[j]) then
        flag:=false;
        end;
      if (flag=true) then begin
      k:=k+1;
      c[k]:=a[i];
      end;
    end;

  for i:=1 to max2 do begin
    flag:=true;
    for j:=1 to max1 do begin
      if(b[i]=a[j]) then
        flag:=false;
        end;
      if (flag=true) then begin
      k:=k+1;
      c[k]:=b[i];
      end;
  end;

  l:=0;
  while (l<=k) do begin    //запись массива С в СГ3
    for j:=0 to m do
      for i:=0 to n do begin
        l:=l+1;
        StringGrid3.Cells[i,j]:=c[l];
        end;
    end;
InfoPanel.Caption:='Симетричну різницю виконано';
end;

procedure TOperForm.Button9Click(Sender: TObject);

const n=15; m=21;
type
  tindex=1..1000;
  tarray=array[tindex] of string;
var i,j,k,l,max1,max2,V:integer;
      flag:boolean;
      a,b,c:tarray;
      input: textfile;
begin
  StringGrid3.Clean;
  Label2.Visible:=true;
  StringGrid2.Clean;
  assignfile(input,'C:\kpi\LAB1_Project\DATA\Amax.TXT');
  reset(input);
  i:=0;
  j:=0;
  while not eof(input) do
  begin
    readln(input, V);
    StringGrid2.Cells[i,j]:=inttostr (V);
    i:=i+1;
    if i>=StringGrid1.ColCount then
      begin
        i:=0;
        j:=j+1;
      end;
  end;
  closefile(input);

  max1:=0;
  for i:=0 to n do     // запись элеметов СГ1 в массив А
    for j:=0 to m do
      begin
        if (StringGrid1.Cells[i,j]<>'') then begin
          max1:=max1+1;
          a[max1]:=StringGrid1.Cells[i,j];
          end;
      end;

  max2:=0;
  for i:=0 to n do     // запись элеметов СГ2 в массив Б
    for j:=0 to m do
      begin
      if (StringGrid2.Cells[i,j]<>'') then begin
        max2:=max2+1;
        b[max2]:=StringGrid2.Cells[i,j];
        end;
      end;

  k:=0;
  for i:=1 to max2 do begin
    flag:=true;
      for j:=1 to max1 do begin
        if (b[i]=a[j]) then
          flag:=false;
        end;
        if (flag=true) then begin
           k:=k+1;
           c[k]:=b[i];
        end;
  end;

  l:=0;
  while (l<=k) do begin    //запись массива С в СГ3
    for j:=0 to m do
      for i:=0 to n do begin
      l:=l+1;
      StringGrid3.Cells[i,j]:=c[l];
      end;
  end;
   InfoPanel.Caption:='Доповнення виконано';
end;

end.
