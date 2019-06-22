program prog;
const Vmin=1;
      Vmax=20;
type
  index = Vmin..Vmax;
  Vector = array [index] of real;
var A,B,C:vector;
    n,m,j:integer;
    
procedure VectorInput (n:integer; var A:Vector);
var i:integer;
  begin
  if n > Vmax then n := Vmax;
      writeln('¬ведiть значенн€');
      for i := Vmin to n do
        begin
          write('A[',i,']=');
          readln(A[i]);
        end;
  end;
procedure Sort (n:integer; var A:Vector);
var
  i, j, k: integer;
  z: real;
  begin
    for j:=1 to n do
    for i:=1 to n do
    begin
    if A[i] > A[j] then
              begin
                z := A[j];
                A[j] := A[i];
                A[i] := z;
              end;
            end;
  end;
procedure VectorOutput (n:integer; A:vector);
var i:integer;
  begin
  for i := 1 to n do
    write (A[i]:3:3,' ');
    writeln;
  end;
procedure VectorChoice (n,m,j:integer; A,B:vector; var C:vector);
var i,k:integer;
begin
  for i:=1 to n do
    begin
  for j:=2 to m do
  begin
  if A[i]>B[j]then 
    for k:=1 to m do C[k]:=B[j];
  end;
  end;
end;
begin
write('¬ведiть розмiр масиву A: '); readln(n);
VectorInput(n,A);
write('¬ведiть розмiр масиву B: '); readln(m);
VectorInput(m,B);
Sort(n,A);
Sort(m,B);
VectorOutput(n,A);+
VectorOutput(m,B);
VectorChoice(n,m,j,A,B,C);
VectorOutput(j,C);
end.