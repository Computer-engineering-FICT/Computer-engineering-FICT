program matrix;

Type
  Tindex=1..10;
  Tarray=array [Tindex] of integer;
  Tmatrix=array [Tindex] of Tarray;

Var
  n:integer;
  a:Tmatrix;
  b:Tmatrix;
  c:Tmatrix;

procedure inputarray( a,b:Tmatrix);
var i,j:integer;
begin
for i:=1 to n do
  for j:=1 to n do
  read(a[i,j]);
for i:=1 to n do
  for j:=1 to n do
  read(b[i,j]);
end;

procedure outputarray( a:Tmatrix;  n:integer);
var i,j:integer;
begin
writeln('elements of matrix A ');
  for i:=1 to n do
  begin
    for j:=1 to n do
    write(a[i,j],' ');
    writeln;
writeln('elements of matrix B ');
  for i:=1 to n do
    begin
      for j:=1 to n do
      write(b[i,j],' ');
      writeln
    end;
 writeln('elements of matrix C');
  for i:=1 to 3 do
  begin
    for j:=1 to 3 do
    write(c[i,j],' ');
    writeln
  end;
  readln;
  end;

procedure multiplication( a,b:Tmatrix; c:Tmatix  n:integer)
var i,j,y,k:integer; 
begin
   for i:=1 to n do
    for j:=1 to n do
     begin
      y:=0;
      for k:=1 to n do
       begin
        y:=a[i,k]*b[k,j];
        c[i,j]:=y+c[i,j]
       end
     end
   end;

procedure transpose( a:Tmatrix; n:integer);
var i,j,x:integer;
  begin
   for i:=1 to n do
    for j:=1 to n do
      if i<j then
       begin
        x:=a[i,j];
        a[i,j]:=a[j,i];
        a[j,i]:=x
       end;
   writeln
  end;

Begin
  writeln('enter limit of elements n');
  read(n);
  
inputarray;

  outputarray;

  multiplication;

  transpose;
  
  outputarray;
 
readln;readln
 end.
