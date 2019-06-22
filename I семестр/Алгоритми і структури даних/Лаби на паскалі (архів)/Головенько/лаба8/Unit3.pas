unit Unit3;

interface

Type
TIndex = 0 .. 20;
TVector = array [TIndex] of real;
TMatrix = array [TIndex] of TVector;
TFunction = function(i, j: TIndex): real;

Var
  n : TIndex;
  Vector: TVector;
  Matrix: TMatrix;
   
procedure CreateMatrix(n: TIndex; f: TFunction; Var a: TMatrix);
procedure CreateVector(n: TIndex; a: TMatrix; Var Vector: TVector);
procedure SortVector(n :TIndex; var Vector:TVector ; x:TVector);
//procedure EditVector(n: TIndex;  var Vector: TVector);
procedure WriteMatrix(n: TIndex; a: TMatrix);
procedure WriteVector(n: TIndex; Vector: TVector);
function f(i, j: TIndex): real;
function G(x: real; y: integer): real;

implementation

procedure CreateMatrix;
var
  i,j : TIndex;
Begin
  for i := 1 to n do
    for j := 1 to n do
      a[i, j] := f(i, j);
end;

procedure CreateVector;
var
  i,j : TIndex;
begin
  vector[i]:=a[i,j]/n;
end;

procedure SortVector;
var

  i,j : TIndex;
 z:real;
begin
  if Vector[i]>Vector[i+1]
    then
      begin
        z:=x[j];
        x[j]:=x[i];
        x[i]:=z;
      end;
end;

procedure WriteVector;
var
  i : TIndex;
begin
  for i := 1 to n do
    Writeln(Vector[i],' ');
end;

procedure WriteMatrix;
var
  i,j : TIndex;
begin
  for i := 1 to n do
    for j := 1 to n do
      Writeln(a[i,j],' ');
end;




function f: real;
begin
  f := (-2-(j-3)*(j-3))*(j-5.7)/(i+j)+G(2,i)*sin(i);
end;
function G: real;
Var
    p, s: real;
    k: integer;
Begin
    Write('Write n= ');
    readln(n);
    p := x;
    k := abs(y);
    S := 1;
    while k >= 1 do
      begin
        if (k mod 2) = 1
          then
          begin
            S := S * p;
            p := p * p;
            k := k div 2;
          end;
      end;
      if y < 0
        then
          begin
            S := 1 / S;
            G := s;
          end;
end;


end.
