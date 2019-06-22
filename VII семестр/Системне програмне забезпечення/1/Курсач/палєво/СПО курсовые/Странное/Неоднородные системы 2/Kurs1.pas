unit Kurs1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, ComCtrls, TeEngine, Series, TeeProcs,
  Chart;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Im: TImage;
    Virobn: TStringGrid;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    StringGrid5: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    StringGrid4: TStringGrid;
    Label7: TLabel;
    Label8: TLabel;
    StringGrid6: TStringGrid;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 type
   Tproc=array[1..10,1..10] of integer;
 const
  proc:Tproc =( (0,1,1,1,1,0,0,0,0,0),
                (1,0,1,0,0,1,1,0,0,0),
                (1,1,0,1,0,1,1,1,0,0),
                (1,0,1,0,1,0,1,1,1,1),
                (1,0,0,1,0,0,0,0,1,1),
                (0,1,1,0,0,0,1,0,0,0),
                (0,1,1,1,0,1,0,1,0,0),
                (0,0,1,1,0,0,1,0,1,0),
                (0,0,0,1,1,0,0,1,0,1),
                (0,0,0,1,1,0,0,0,1,0) );

 proc1:Tproc =( (0,5,6,6,4,0,0,0,0,0),
                (5,0,3,0,0,2,4,0,0,0),
                (6,3,0,5,0,3,3,3,0,0),
                (6,0,0,0,5,0,2,4,7,1),
                (4,0,0,0,0,0,0,0,3,2),
                (0,2,3,0,0,0,5,0,0,0),
                (0,4,3,2,0,5,0,3,0,0),
                (0,0,3,4,0,0,3,0,1,0),
                (0,0,0,7,3,0,0,1,0,4),
                (0,0,0,1,2,0,0,0,4,0) );


var
  Form1: TForm1;
  x,y,s,l,m,mm,i,j,N,middle,k:integer;
  KolVer,ext,max,min,chart:integer;
  pp,ss: string;
  flag:boolean;
  Proc2,way:array[1..10,1..10] of integer;
  equation:array[1..10] of real;
  Syst,Syst1:array[1..10,0..10] of real;
  Minim:array[0..10,0..3] of integer;
  p,patth: array[1..10, 1..10] of integer;
  produktivity:array[1..10] of integer;
  buf,buf1,buf2,buf3,buf4:real;
  iterequat,taktsum:array[1..10] of integer;
  takt:array[1..10,1..2] of integer;
  taktstring,st: string;
  iter:array[1..1000] of integer;
  taktarray:array[1..1000] of string;
implementation

{$R *.dfm}

//Процедура знаходження вершин мінімального шляху
procedure path(x,y:integer);
begin
 if p[x,y] = 0 then
    begin
      pp:=pp+inttostr(y)+#13;
    end
 else
     begin
           path(x, p[x,y]);
	         path(p[x,y], y);
     end;
end;

//Процедура знаходження мінімального шляху та вершин
Procedure minimize;
var
 i,j,k,l,min,mini:integer;
 min1:array[1..10,1..10] of integer;
begin
   //Копіювання масиву ваг графу
    for i:=1 to KolVer  do
       for j:=1 to KolVer  do
         Proc2[i,j]:=Proc1[i,j];
   //Задання початкових умов для алгоритму
   for i:=1 to KolVer  do
       for j:=1 to KolVer  do
          if i=j then
            Proc2[i,j]:=0
          else
             if proc2[i,j]=0 then
                 proc2[i,j]:=100000;
   //Алгоритм Флойда пошуку мінімального шляху

   for k:=1 to KolVer do
     for i:=1 to KolVer do
       for j:=1 to KolVer do
         begin
           if (i<>k) and (proc2[i,k]<100000) and (proc2[k,j]<100000) then
               begin
                 mini:=proc2[i,k]+proc2[k,j];
                   if proc2[i,j]>mini then
                      begin
                          proc2[i,j]:=mini;
                          p[i,j]:=k;
                      end
               end
         end;
//Формування мінімального шляху
     for i:=0 to KolVer-1 do
       for j:=0 to KolVer-1 do
         if proc2[i,j]=10000000 then
            form1.StringGrid2.Cells[i,j]:='<>'
         else
            form1.StringGrid2.Cells[i,j]:=inttostr(proc2[i+1,j+1]);

    for i:=1 to KolVer do
         begin
           path(1,i);
           pp:=pp+#13+inttostr(1)+#13;
         end;
     l:=1;m:=1;
     x:=1;y:=1;
     min:=0;
     i:=1;
     for i:=1 to length(pp) do
       begin
         if pp[i]<>#13 then
          begin
             ss:=ss+pp[i];
             way[x,y]:=strtoint(ss);
          end
         else
           begin
              ss:='';
              inc(y);
              if (pp[i]=#13) and (pp[i+1]=#13) then
                begin
                  inc(x);
                  y:=0;
                end;
           end;
       end;

for i:=1 to KolVer do
      begin
         k:=1;
         for j:=1 to KolVer do
           if way[i,j]<>0 then
              begin
                 form1.StringGrid1.Cells[i-1,j-1]:=inttostr(way[i,k]);
                 inc(k);
              end;
      end;
end;


//Формування системи рівнянь
procedure sustem;
 var
   i,j,k,m:integer;
 begin
    for i:=1 to KolVer do
      for j:=0 to KolVer do
        Syst[i,j]:=0;
    for i:=1 to KolVer do
      Syst[1,i]:=1;
      Syst[1,0]:=N;
    for i:=2 to KolVer do
      for j:=1 to KolVer do
         if (way[i,j+1]=0) and (way[i,j]<>0) then
            begin
              Syst[i,way[i,j]]:=1/produktivity[way[i,j]];
              Syst[i,way[i,j-1]]:=1/produktivity[way[i,j-1]];
              if way[i,j-1]>way[i,j] then
                Syst[i,way[i,j-1]]:=-Syst[i,way[i,j-1]]
              else
                 Syst[i,way[i,j]]:=-Syst[i,way[i,j]];
              Syst[i,0]:=proc1[way[i,j-1],way[i,j]]
            end;

     for i:=1 to KolVer do
        for j:=0 to KolVer do
           begin
           St:=floattostr(Syst[i,j]);
              Str(strtofloat(st):0:3, St);
             form1.StringGrid3.Cells[j,i-1]:=st;
           end;
       for i:=1 to KolVer do
        for j:=0 to KolVer do
         if (abs(trunc(Syst[i,j]))>0) or (Syst[i,j]=0) then
           form1.StringGrid3.Cells[j,i-1]:=inttostr(trunc(Syst[i,j]));
 end;
//Процедура знаходження коренів
procedure desizion;
 begin
 //Перетворення матриці за методом Гауса
  for i:=1 to KolVer do
    begin
        for j:=i+1 to KolVer do
          begin
           if abs(Syst[j,i])>0.000001 then
             begin
               buf:=-Syst[i,i]/Syst[j,i];
               for l:=0 to kolVer do
                 begin
                   Syst[j,l]:=Syst[j,l]*buf+Syst[i,l];
                   if abs(Syst[j,l])<0.00001 then    Syst[j,l]:=0;
                 end;
             end
           else
            begin
               Syst[j,i]:=0;
               buf:=1;
            end;
          end;
    end;

   for i:=0 to kolver do
       form1.StringGrid5.Cells[0,i]:='X'+inttostr(i+1)+'=';

  //Формування коренів рівняння з перетвореної матриці
  for i:=Kolver downto 1  do
      begin
         form1.StringGrid5.Cells[1,i-1]:=floattostr(Syst[i,0]/Syst[i,i]);
         equation[i]:=(Syst[i,0]/Syst[i,i]);
         for j:=KolVer downto i do
            begin
               buf:=equation[j];
               buf1:=Syst[i-1,j];
               buf2:=Syst[i-1,0];
               buf4:=buf*buf1;
               buf3:=buf2-buf4;
               Syst[i-1,0]:=buf3;
            end;
      end;
 //Округлення результату 
      for i:=Kolver downto 1  do
        begin
          buf:=strtofloat(form1.StringGrid5.Cells[1,i-1]);
           l:=round(buf);
           form1.StringGrid5.Cells[1,i-1]:=inttostr(l);
        end;


  end;

//Процедура знаходження коренів методом ітерацій
procedure Iteration;
begin
  //Розподілення початкових значаень
  l:=N div Kolver;
  middle:=0;
  for i:=1 to Kolver do
    begin
      iterequat[i]:=l;
      takt[i,1]:=Proc2[i,1];
      if ((l mod produktivity[i])=0) or (produktivity[i]=1) then
        takt[i,2]:=l div produktivity[i]
      else
        takt[i,2]:=(l div produktivity[i])+1;
        taktsum[i]:=takt[i,1]+takt[i,2];
      end;

 //ітерація
   m:=1;
   mm:=1;
   repeat
    inc(chart);
    ext:=0;
    middle:=0;
    for i:=1 to Kolver do
      middle:=middle+taktsum[i];
   middle:=round(middle/Kolver);
   for i:=1 to kolver do
    begin
      taktsum[i]:=taktsum[i]-middle;
      ext:=ext+abs(taktsum[i]);
    end;

   for i:=kolver  downto 1 do
    begin
        j:=Kolver;
       if  taktsum[i]>=0 then
          begin
            repeat
              if taktsum[j]<0 then
                if abs(taktsum[i])>=abs(taktsum[j]) then
                  begin
                   l:=abs(taktsum[j]);
                   for k:=1 to abs(taktsum[j]) do
                       begin
                          iterequat[j]:=iterequat[j]+produktivity[i];
                          iterequat[i]:=iterequat[i]-produktivity[i];
                          dec(taktsum[i]);
                       end;
                      taktsum[j]:=0;
                  end
                else
                 begin
                   l:=abs(taktsum[i]);
                  for k:=1 to abs(taktsum[i])  do
                      begin
                          iterequat[j]:=iterequat[j]+produktivity[i];
                          iterequat[i]:=iterequat[i]-produktivity[i];
                          dec(taktsum[i]);
                      end;
                      taktsum[j]:=taktsum[j]+l;
                 end;
                dec(j);
            until (taktsum[i]=0) or (j<=0);
          end;
    end;

    for i:=1 to Kolver do
      begin
      if iterequat[i] mod produktivity[i] =0 then
        taktsum[i]:=iterequat[i] div produktivity[i]+takt[i,1]
      else
        taktsum[i]:=iterequat[i] div produktivity[i]+takt[i,1]+1;
      end;
      inc(m);
      iter[mm]:=ext;
      inc(mm);

    until  (ext<=(kolver div 2));//or (m=Kolver*Kolver);


   //точна ітерація
 {  m:=1;
   flag:=false;
   for I:=1 to 10 do
     begin
      taktarray[i]:='';
     end;
   m:=1;
   repeat
   max:=taktsum[1];
   for i:=1 to Kolver do
      if taktsum[i]>max then
        max:=taktsum[i];
   for i:=1 to Kolver do
     begin
       if taktsum[i]=max then
         begin
           for j:=1 to kolver do
             if taktsum[j]<max then
               begin
                 inc(iterequat[j]);
                 dec(iterequat[i]);
               end;
         end;
     end;
     for i:=1 to KolVer do
       begin
          if iterequat[i] mod produktivity[i] =0 then
             taktsum[i]:=iterequat[i] div produktivity[i]+takt[i,1]
          else
             taktsum[i]:=iterequat[i] div produktivity[i]+takt[i,1]+1;
       end;
         max:=taktsum[i];
         min:=taktsum[1];
       for i:=1 to KolVer do
         begin
           if taktsum[i]>max then max:=taktsum[i];
           if taktsum[i]<min then min:=taktsum[i];
         end;
      middle:=0;
      mm:=0;
      for i:=1 to Kolver do
          middle:=middle+taktsum[i];
      middle:=round(middle/Kolver);

      for i:=1 to Kolver do
        begin
          if abs(middle-taktsum[i])>0 then
             inc(mm);
          if (abs(middle-taktsum[i])>1) or (max-min>10) then
             inc(mm);
        end;

      until (mm <= (Kolver));}

  //Виведення на екран
  for i:=0 to kolver-1 do
     begin
       form1.StringGrid4.Cells[0,i]:='X'+inttostr(i+1)+'=';
       form1.StringGrid4.Cells[1,i]:=inttostr(iterequat[i+1]);
     end;
    form1.StringGrid6.RowCount:=mm-1;
    i:=1;
  repeat
    begin
      form1.StringGrid6.Cells[0,i-1]:=inttostr(i)  ;
      form1.StringGrid6.Cells[1,i-1]:=inttostr(iter[i])  ;
      inc(i);
    end
  until iter[i]=0 ;

end;


procedure TForm1.Button1Click(Sender: TObject);
var
  ran,i,j,k,l,m:integer;
  Circle:array[1..10,0..3] of integer;
  Ver:array[0..20] of integer;
  temp,deltax:real;
begin
  randomize;
  //Очищення матриць
   for i:=0 to Kolver-1 do
     begin
       virobn.Cells[i,0]:='';
       virobn.Cells[i,1]:='';
       stringgrid3.Cells[0,i]:='';
       stringgrid4.Cells[0,i]:='';
       stringgrid4.Cells[1,i]:='';
       stringgrid5.Cells[0,i]:='';
       stringgrid5.Cells[1,i]:='';
       for j:=0 to Kolver-1 do
         begin
           stringgrid1.Cells[i,j]:='';
           stringgrid3.Cells[i+1,j]:='';
           stringgrid2.Cells[i,j]:='';
         end;
     end;
     if mm<>0 then
         for i:=1 to mm do
           begin
             form1.StringGrid6.Cells[0,i-1]:='';
             form1.StringGrid6.Cells[1,i-1]:='';
           end;
     //Формування початкових змінних
  pp:='';
  for i:=1 to Kolver do
     begin
        circle[i,0]:=0;
        circle[i,1]:=0;
        circle[i,2]:=0;
     end;
  button2.Enabled:=true;
  button3.Enabled:=true;
  //Задання початкових умов
  KolVer:=strtoint(edit2.text); //Кількість вершин графа
  N:=strtoint(edit1.text);
  //Формування топології на рисунку
  im.Canvas.pen.Width:=2;
  for i:=1 to KolVer do
    circle[i,0]:=i;
    circle[1,1]:=305;
    circle[1,2]:=35;

  for i:=2 to 5 do
    begin
      circle[i,1]:=-45+100*i;
      circle[i,2]:=135;
    end;

  for i:=6 to KolVer do
    begin
      circle[i,1]:=-655+120*i;
      circle[i,2]:=235;
    end;
    //Формування продуктивності системи
  for i:=1 to Kolver do
    begin
      Virobn.Cells[i-1,0]:=inttostr(i);
      ran:=random(Kolver div 2);
      inc(ran);
      Virobn.Cells[i-1,1]:=inttostr(ran);
     {Virobn.Cells[0,1]:='5';
      Virobn.Cells[1,1]:='4';
      Virobn.Cells[2,1]:='3';
      Virobn.Cells[3,1]:='5';
      Virobn.Cells[4,1]:='4';
      Virobn.Cells[5,1]:='1';
      Virobn.Cells[6,1]:='4';
      Virobn.Cells[7,1]:='2';
      Virobn.Cells[8,1]:='4';
      Virobn.Cells[9,1]:='3';
      Virobn.Cells[10,1]:='5';}
      produktivity[i]:=strtoint(Virobn.Cells[i-1,1]);
    end;
  //Формування ребер графу
  for i:=1 to KolVer do
     for j:=1 to KolVer do
        begin
         if proc[i,j]<>0 then
           begin
             im.Canvas.MoveTo(circle[i,1],circle[i,2]);
             im.Canvas.LineTo(circle[j,1],circle[j,2]);
           end;
        end;
  for i:=1 to KolVer do
    begin
      im.Canvas.Ellipse(circle[i,1]-25,circle[i,2]-25,circle[i,1]+25,circle[i,2]+25);
      im.Canvas.Pen.Width:=1;
      im.Canvas.Ellipse(circle[i,1]-10,circle[i,2]-23,circle[i,1]+10,circle[i,2]-3);
      im.Canvas.Pen.Width:=2;
      im.Canvas.TextOut(circle[i,1]-5,circle[i,2]-22,inttostr(i));
      im.Canvas.TextOut(circle[i,1]-5,circle[i,2],Virobn.Cells[i-1,1]);
    end;

   //Формування довжини ребер графа
    for i:=1 to KolVer do
      for j:=i to KolVer do
        begin
         if proc[i,j]=1 then
           begin
             // proc1[i,j]:=random(10);
             // proc1[i,j]:=proc1[i,j]+10;
           end;
        end;
  { for i:=1 to 10 do
     for j:=1 to 10 do
      if proc1[i,j]<>0 then proc1[j,i]:=0;}
    for i:=1 to KolVer do
      for j:=1 to KolVer do
        begin
           if proc[i,j]<>0 then
             begin
               im.Canvas.TextOut(((circle[i,1]+circle[j,1])div 2),((circle[i,2]+circle[j,2])div 2),inttostr(proc1[j,i]));
             end;
        end;

    //Пошук мінімального шляху для кожної вершини
    Minimize;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    //Задання системи KolVer рівнянь з KolVer невідомими      //рішення за
    Sustem;                                                   //допомогою
    //Розв'язання системи рівнянь                             //розвязання
    desizion;                                                 //системи рівнянь
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    //Знаходження результату за допомогою методу ітерацій     //
    Iteration;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  //Закриття програми
  close;
end;

end.
