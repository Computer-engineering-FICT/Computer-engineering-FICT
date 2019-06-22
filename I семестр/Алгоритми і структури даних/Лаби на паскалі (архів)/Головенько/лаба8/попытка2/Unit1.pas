unit Unit1;

interface

Type
  TIndex = 0 .. 10;
  TVector = array [TIndex] of real;
  TMatrix = array [TIndex] of TVector;
  TFunction = function(i, j: TIndex): real;

procedure CreateMatrix(n: TIndex; f: TFunction; Var Matrix: TMatrix);
procedure CreateVector(n: TIndex; Matrix: TMatrix; Var Vector: TVector);
procedure SortMatrix(n: TIndex; Var Matrix: TMatrix);
procedure EditVector(n: TIndex; Var Vector: TVector);
procedure WriteMatrix(n: TIndex; Matrix: TMatrix);
procedure WriteVector(n: TIndex; Vector: TVector);

implementation

procedure CreateMatrix(n: TIndex; f: TFunction; Var Matrix: TMatrix);
Var
  i, j: TIndex;
Begin
  for i := 1 to n do
    for j := 1 to n do
      Matrix[i, j] := f(i, j);
End;

procedure SortVector(n: TIndex; Var Vector: TVector);
Type
  TPosition = array [TIndex] of TIndex;
Var
  i, j, k: TIndex;
  P: TPosition;
  m: real;
begin
  k := 0;
  for i := 1 to n do
    if (Vector[i] < 0) then
    begin
      k := k + 1;
      P[k] := i;
    end;

  for i := 2 to k do
    if Vector[P[i]] > Vector[P[i] - 1] then
    Begin
      m := Vector[P[i]];
      j := i;
      while (k > Vector[P[j] - 1]) and (j > 1) do
      Begin
        Vector[P[j]] := Vector[P[j] - 1];
        j := j - 1;
      end;
      Vector[P[j]] := m;
    End;
end;

procedure SortMatrix(n: TIndex; Var Matrix: TMatrix);
Var
  i: TIndex;
Begin
  for i := 1 to n do
    SortVector(n, Matrix[i]);
End;

procedure CreateVector(n: TIndex; Matrix: TMatrix; Var Vector: TVector);
Var
  i: TIndex;
Begin
  for i := 1 to n do
    Vector[i] := Matrix[i, i];
End;

procedure EditVector(n: TIndex; Var Vector: TVector);
Var
  i, k, m: TIndex;
  V: TVector;
Begin
  k := n div 2;
  m := n mod 2;

  for i := 1 to k do
    V[i + k + m] := Vector[i];
  for i := k + 1 to n do
    V[i - k] := Vector[i];
  for i := 1 to n do
    Vector[i] := V[i];
End;

procedure WriteVector(n: TIndex; Vector: TVector);
Var
  i: TIndex;
Begin
  for i := 1 to n do
    Write(Vector[i]:2:2, ' ');
End;

procedure WriteMatrix(n: TIndex; Matrix: TMatrix);
Var
  i: TIndex;
Begin
  for i := 1 to n do
  begin
    WriteVector(n, Matrix[i]);
    Writeln;
  end;
End;

end.
