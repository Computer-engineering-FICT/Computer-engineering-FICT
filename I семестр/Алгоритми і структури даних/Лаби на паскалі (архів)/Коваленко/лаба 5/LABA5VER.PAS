program vector_massiv;

Type Tindex=1..100;
     vector= array[Tindex] of real;
var a:vector;
    n,i:integer;

procedure searchk;
var k,p:real;
begin
  writeln;
  writeln('enter number k');
  readln(k);
  p:=0;
  for i:=1 to n do
    if a[i]=k then
      begin
        p:=1;
        writeln('number ',k:2:2,'is on position',i)
      end;
    if p=0 then
      writeln('there is no number ',k:2:0,' in array');
end;

procedure searchmin;
var k:integer;
    min:real;
begin
  min:=a[1];
  k:=1;
  for i:=2 to n do
    if a[i]<min then
      begin
        min:=a[i];
        k:=i;
      end;
  writeln;
  writeln('min=',min:2:0,' on position ',k);
  readln
end;

procedure searchmax;
var k:integer;
    max:real;
begin
  max:=a[1];
  k:=1;
  for i:=2 to n do
    if a[i]>max then
      begin
        max:=a[i];
        k:=i;
      end;
  writeln;
  writeln('max=',max:2:0,' on position ',k);
  readln
end;

procedure sortingpyzur;
var i:Tindex;
    k:real;
    j:integer;
begin
  for j:=1 to n-1 do
  begin
    for i:=1 to n-1 do
    if A[i]>a[i+1] then
      begin
        k:=a[i+1];
        A[i+1]:=A[i];
        A[i]:=k;
      end;
  end;
end;

Begin
  writeln('enter max number of array');
  read(n);
  write('enter elements of array');
  for i:=1 to n do
  read(a[i]);

  for i:=1 to n do
  write(a[i]:5:2);
  readln
end.
