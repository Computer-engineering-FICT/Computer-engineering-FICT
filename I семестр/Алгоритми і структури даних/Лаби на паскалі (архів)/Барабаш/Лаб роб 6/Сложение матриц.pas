uses crt;
type matrix=array[1..10,1..10]of integer;
var a,b,c:matrix;
    choose,x,y,z:integer;
 
procedure Zapolnenie(var m:matrix; x,y:integer);
var i,j:integer;
begin
 for i:=1 to x do
 for j:=1 to y do
 m[i,j]:=random(10);
end;
 
procedure Vyvod(m:matrix; x,y:integer);
var i,j:integer;
begin
 for i:=1 to x do
 begin
  for j:=1 to y do 
  write(m[i,j]:4);
  writeln;
 end;
end;
 
procedure Peremnozhenie(a:matrix; x,y:integer; b:matrix; z:integer; var c:matrix);
var i,j,k:integer;
    s:integer;
begin
 for i:=1 to x do
 for j:=1 to z do
 begin
  S:=0;
  for k:=1 to y do
  S:=S+a[i,k]*b[k,j];
  c[i,j]:=S;
 end;
end;
 
procedure slozhenie(x,y:integer; a,b:matrix; var c:matrix);
var i,j:integer;
begin
 for i:=1 to x do for j:=1 to y do c[i,j]:=a[i,j]+b[i,j];
end;
 
procedure vychitanie(x,y:integer; a,b:matrix; var c:matrix);
var i,j:integer;
begin
 for i:=1 to x do for j:=1 to y do c[i,j]:=a[i,j]-b[i,j];
end;
 
begin
 clrscr;
 write('��������: 1-��������, 2-���������, 3-��������� ');
 readln(choose);
 case choose of
 1:begin
   write('������� ���-�� ����� ������:');
   readln(x);
   write('������� ���-�� �������� ������:');
   readln(y);
   zapolnenie(a,x,y);
   zapolnenie(b,x,y);
   writeln('������� A');
   vyvod(a,x,y);
   writeln('������� B');
   vyvod(b,x,y);
   slozhenie(x,y,a,b,c);
   writeln('������� C');
   vyvod(c,x,y);
   end;
  2:begin
   write('������� ���-�� ����� ������:');
   readln(x);
   write('������� ���-�� �������� ������:');
   readln(y);
   zapolnenie(a,x,y);
   zapolnenie(b,x,y);
   writeln('������� A');
   vyvod(a,x,y);
   writeln('������� B');
   vyvod(b,x,y);
   vychitanie(x,y,a,b,c);
   writeln('������� C');
   vyvod(c,x,y);
   end;    
  3:begin
   write('������� ���-�� ����� ������� A:');
   readln(x);
   write('������� ���-�� �������� ������� A:');
   readln(y);
   Zapolnenie(a,x,y);
   Vyvod(a,x,y);
   write('������� ���������� �������� ������� B:');
   readln(z);
   Zapolnenie(b,y,z);
   Vyvod(b,y,z);
   Peremnozhenie(a,x,y,b,z,c);
   writeln('������� C ');
   Vyvod(c,x,z);
   end;
  end;
  readln;
end.