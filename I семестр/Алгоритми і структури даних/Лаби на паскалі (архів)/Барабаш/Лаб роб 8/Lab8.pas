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

procedure InputOfMatrix;
var
  i, j: integer;
begin
  write('Rozmir: ');read(n);
  for i := 1 to n do
    for j := 1 to n do
      A[i, j] := (abs(3.7 - j) - 2) * (i - power(4.2, j)) + 8.7 * i;
end;

procedure VectorOutput;
var i:integer;
  begin
  for i := 1 to n do
    write (V[i]:3:3,' ');
    writeln;
  end;

procedure FindMax;
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

procedure Sort;
var
  i, j, k: integer;
  z: real;
begin
  for j := 1 to n do
  begin
    k := k + 1;
    V[k] := a[maxi, j];
  end;
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
end;

procedure VectorTranform;
var i:integer;
  begin
  for i := n downto 2 do
    V[i] := (V[i]+V[i-1])/2;
  end;

begin
  InputOfMatrix;
  FindMax;
  Sort;
  VectorOutput;
  VectorTranform;
  VectorOutput;
end.