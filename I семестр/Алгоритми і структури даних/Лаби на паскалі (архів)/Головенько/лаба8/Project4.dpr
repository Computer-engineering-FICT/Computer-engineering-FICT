program Laba8;

{$APPTYPE CONSOLE}


uses
  unit1 in '..\..\..\RAD Studio\Projects\MyUnit.pas';

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
