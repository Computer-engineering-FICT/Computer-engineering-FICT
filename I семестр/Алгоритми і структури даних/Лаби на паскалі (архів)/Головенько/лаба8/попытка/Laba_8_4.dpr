program Laba_8_4;

{$APPTYPE CONSOLE}


uses
  Unit2 in 'Unit2.pas';

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
  f := (-2-(j-3)*(j-3))*(j-5.7)/(i+j)+G(2,i)*sin(i);
End;

begin
Write('Write n= ');
read(n);

CreateMatrix(n, f, Matrix);

Writeln;
Writeln('NewMatrix');
WriteMatrix(n, Matrix);

SortVector(n,Vector);

Writeln;
Writeln('SortMatrix');
WriteMatrix(n, Matrix);

createVector(n, Matrix, Vector);

Writeln;
Writeln('NewVector');
WriteVector(n, Vector);

EditVector(n, Vector);

Writeln;
WriteVector(n, Vector);

end.
