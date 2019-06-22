program cnupaln;

{$APPTYPE CONSOLE}
type
  TIndex = 1..10;
  TMatrix = array[1..10, 1..10] of Integer;
var
  n,m :TIndex;
  A :TMatrix;

procedure InputMatrix(var n,m: TIndex; var AMatrix: TMatrix);
var
  i,j:TIndex;
begin
  writeln('Size of matrix?');
  write('How many strings: ');
  readln(n);
  write('How many columns: ');
  readln(m);

end;


procedure InitMatrix(var n,m: TIndex; var AMatrix: TMatrix);
var
  i, j, k, MinDim: integer;
  delta, dir, steps: integer;
begin
  delta := 0;
  dir := 1;
  i := 1;
  j := 0;
  k := 1;

  if n < m then
    MinDim := n
  else
    MinDim := m;

  while delta < MinDim do
  begin
    j := j + dir;
    steps := (m - delta);

    while steps > 0 do
    begin
      AMatrix[i, j] := k;
      k := k + 1;

      j := j + dir;
      steps := steps - 1;
    end;
    j := j - dir;

    delta := delta + 1;

    i := i + dir;
    steps := (n - delta);

    while steps > 0 do
    begin
      AMatrix[i, j] := k;
      k := k + 1;

      i := i + dir;
      steps := steps - 1;
    end;
    i := i - dir;

    dir := dir * -1;
  end;
end;

procedure OutputMatrix(m,n:TIndex; AMatrix: TMatrix);
var
  i,j: TIndex;
begin
  writeln;
  for i := 1 to n do
  begin
    for j := 1 to m do
      write(A[i,j]:2, ' ');
    writeln;
    writeln;
  end;
end;

begin
  InputMatrix(n,m,A);
  InitMatrix(m,n,A);
  OutputMatrix(n,m,A);
  readln;
  readln;
end.
