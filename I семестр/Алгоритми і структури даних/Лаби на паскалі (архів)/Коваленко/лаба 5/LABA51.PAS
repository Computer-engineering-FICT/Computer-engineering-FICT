program vector_massiv;

Type Tindex=1..100;
     vector= array[Tindex] of real;
var a:vector;
    n,i:integer;

procedure sortingsimplechoose;
var i,j,k:Tindex;
    x:real;
begin
for i:=1 to n-1 do
begin
  k:=i;
  x:=a[k];
  for j:=i+1 to n do
  if a[j]<x then
  begin
  k:=j;
  x:=a[j];
  end;
a[k]:=a[i];
a[i]:=x;
end;
end;

procedure sortingsimpleinclude;
var i,j:Tindex;
    x:real;
Begin
  for i:=2 to n do
  begin
  x:=a[i];
  j:=i-1;
  while (j>0) and (a[j]>x) do
  begin
  a[j+1]:=a[j];
  j:=j-1;
  end;
  a[j+1]:=x;
end;
end;


Begin
  writeln('enter max number of array');
  read(n);
  write('enter elements of array');
  for i:=1 to n do
  read(a[i]);
  writeln;
   for i:=1 to n do
  write(a[i]:5:2);

  sortingsimpleinclude;


  writeln;
  for i:=1 to n do
  write(a[i]:5:2);

  sortingsimplechoose;

  writeln;
  for i:=1 to n do
  write(a[i]:5:2);
  readln;
  readln;
end.
