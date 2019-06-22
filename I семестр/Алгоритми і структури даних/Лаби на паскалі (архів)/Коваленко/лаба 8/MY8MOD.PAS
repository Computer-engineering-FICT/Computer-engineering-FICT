unit my8mod;

interface

Type
  index=1..100;
  vector=array [index] of real;
  matrix=array [index] of vector;

var
  n:integer;
  A: matrix;
  X:vector;
  procedure entermatrix(var n:integer; var A:matrix);
  procedure outputmatrix(var n:integer; var A:matrix);
  procedure sortingvector(var n:integer; var A:matrix);
  procedure renote(var n:integer; var X:vector);


implementation

procedure entermatrix;
var
  i,j:index;
begin
  writeln('enter size of matrix n');
  read(n);
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=2.89/(i+j)+4.75*(2*i-5)+(exp(ln(3)*i))*cos(j);
end;

procedure outputmatrix;
var
  i,j:index;
begin
  for i:=1 to n do
    begin
      for j:=1 to n do
        write(a[i,j]:10:3,' ');
        writeln;
    end;
  writeln;
  readln;
  readln
end;

procedure sortingvector;
var i,j,f:index;
    k:real;
begin
  for i:=1 to n do
    for f:=1 to n-1 do
      begin
        for j:=1 to n-1 do
          if A[i,j]>A[i,j+1] then
          begin
            k:=a[i,j+1];
            A[i,j+1]:=A[i,j];
            A[i,j]:=k;
          end;
      end;
  for i:=1 to n do
  begin
    x[i]:=a[i,n];
  write(x[i]:8:3);
  end;
  readln
end;

procedure renote;
var i: index;
begin
 for i:=1 to (n-2) do
  begin
    x[i]:=(x[i]+x[i+1]+x[i+2])/3;
    write(x[i]:8:3);
  end;
  readln;
  readln;
end;

begin
end.