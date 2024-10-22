program dop;

{$APPTYPE CONSOLE}
type
  Tindex = 1..10;
  vector = array [tindex] of integer;
  Matrix = array[tindex] of vector;
var
 A:Matrix;
n,m:Tindex;


procedure InputMatra(var n,m:tindex; var A:matrix);
var
i,j:integer;
begin
  writeln('Size of matrix?');
  write('How many strings: ');
  readln(n);
  write('How many columns: ');
  readln(m);
  writeln('Enter ', n*m,  ' elements of matrix string by string:');
  for i:=1 to n do
    begin
      for j:=1 to m do
        read(A[i,j]);
    end;
end;

procedure OutputMatr (n,m:tindex; A:matrix);
var
i,j:integer;
begin
for i:=1 to n do
  begin
    for j:=1 to m do
    write(A[i,j], ' ');
    writeln;
  end;
  readln;
end;

procedure Cnuralb(var n,m :Tindex; var A:Matrix);
var
  i, j, MaxI, MaxJ, MinDim: integer;
  delta, dir, steps: integer;


begin
  delta := 0;
  dir := 1;
  i := 1;
  j := 0;

  MaxI := n;
  MaxJ := m;

  if MaxI < MaxJ
    then
      MinDim := MaxI
    else
      MinDim := MaxJ;

  while delta < MinDim do
    begin
      j := j + dir;
      steps := (MaxJ - delta);

      while steps > 0 do
        begin
          A[i, j];

          j := j + dir;
          steps := steps - 1;
        end;
          j := j - dir;

          delta := delta + 1;

          i := i + dir;
          steps := (MaxI - delta);

      while steps > 0 do
        begin
          A[i, j];

          i := i + dir;
          steps := steps - 1;
        end;
          i := i - dir;

          dir := dir * -1;
          
    end;
      
 end;

begin
  InputMatra(n,m,A);
  Cnuralb(n,m,A);
  OutputMatr(n,m,A);
 readln;
end.

