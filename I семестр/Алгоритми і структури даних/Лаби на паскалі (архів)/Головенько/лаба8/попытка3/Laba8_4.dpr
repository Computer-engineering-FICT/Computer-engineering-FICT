program Laba8_4;

{$APPTYPE CONSOLE}

uses
  Unit1;

begin
InputMatrix (n,A);
OutputMatrix (n,A);
WriteFile (A,F);
ReadFile (B,F);
MatrixOnVector (n,A,X);
OutputVector(n,X);
VectorOn2Vector (n,X);
OutputVector (n,X);
end.
