program Lab8;
const Vmin = 1;
      Vmax = 20;
type
  index = Vmin..Vmax;
  Vector = array [index] of real;
  Matrix = array [index] of Vector;

var
  A: Matrix; 
  n, maxi: integer;
  V: Vector;

procedure InputOfMatrix(var A:matrix; n:integer);
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      A[i, j] := (abs(3.7 - j) - 2) * (i - power(4.2, j)) + 8.7 * i;
end;

procedure OutputOfMatrix(A:Matrix; n:integer);
var 
  i,j : integer;
begin
  writeln('Result: ');
  for i:=1 to n do
    begin
    for j:=1 to n do
      write(a[i,j]:3:3,'  ');
      writeln;
    end;
end;

procedure FindMax (A:Matrix; n:integer);
var
  i, j, k: integer;
  t, maxs: real;
begin
  maxi := 1;
  for i := 1 to n do
  begin
    t := 0;
    for j := 1 to n do
      t := t + a[i, j];
    if (t > maxs) then
    begin
      maxs := t;
      maxi := i;
    end;
  end;
end;

procedure VectorFormation (A:Matrix; n:integer; maxi:integer; var V:Vector);
var j,k:integer;
begin
  for j := 1 to n do
  begin
    k := k + 1;
    V[k] := a[maxi, j];
  end;
end;

procedure Sort (var V:Vector; n:integer);
var
  i, j, k: integer;
  z: real;
  begin
    for j:=1 to n do
    for i:=1 to n do
    begin
    if V[i] > V[j] then
              begin
                z := V[j];
                V[j] := V[i];
                V[i] := z;
              end;
            end;
        end;
        
procedure VectorTranform (var V:vector; n:integer);
var i:integer;
  begin
  for i := n downto 2 do
    V[i] := (V[i]+V[i-1])/2;
  end;

procedure VectorOutput (V:Vector; n:integer);
var i:integer;
  begin
  for i := 1 to n do
    write (V[i]:3:3,' ');
    writeln;
  end;

begin
  write('Rozmir:');read(n);
  InputOfMatrix(A,n);
  OutputOfMatrix(A,n);
  FindMax(A,n);
  VectorFormation(A,n,maxi,V);
  Sort(V,n);
  writeln;
  VectorOutput(V,n);
  VectorTranform(V,n);
  writeln;
  VectorOutput(V,n);
end.