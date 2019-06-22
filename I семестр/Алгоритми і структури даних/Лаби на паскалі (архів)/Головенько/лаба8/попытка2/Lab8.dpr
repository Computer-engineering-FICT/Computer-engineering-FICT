program Lab8;
{$APPTYPE CONSOLE}

uses
  Unit1 in 'C:\TEMP\Rar$DIa0.638\Unit1.pas';

Var
  n: TIndex;
  Vector: TVector;
  Matrix: TMatrix;

function f(i, j: TIndex): real;
  function G(x: real; y: integer): real;
  Var
    p, s: real;
    k: integer;
  Begin
    p := x;
    k := abs(y);
    S := 1;

    while k >= 1 do
    Begin
      if (k mod 2) = 1 then
        S := S * p;
      p := p * p;
      k := k div 2;
    End;

    if y < 0 then
      S := 1 / S;

    G := s;
  end;
Begin
  f := (abs(j - 3) - 1.3) * (6.5 - j) + 2 * G(3.33, -i) - 1.5;
End;

begin
  Write('Write n= ');
  read(n);

  CreateMatrix(n, f, Matrix);

  Writeln;
  Writeln('New Matrix');
  WriteMatrix(n, Matrix);

  SortMatrix(n, Matrix);

  Writeln;
  Writeln('Sort Matrix');
  WriteMatrix(n, Matrix);

  createVector(n, Matrix, Vector);

  Writeln;
  Writeln('New Vector');
  WriteVector(n, Vector);

  EditVector(n, Vector);

  Writeln;
  Writeln('Sort Vector');
  WriteVector(n, Vector);

  readln;
  readln;

end.
