PROGRAM Determinant;
USES Crt;
VAR delta, i, k: integer;
    det: array[1..3, 1..3] of integer;
    minor: array [1..3, 1..3] of integer;
 BEGIN
  Writeln('¬вед≥ть 1 р€док:');
  Readln(det[1,1], det[1,2], det[1,3]);
  Writeln('¬вед≥ть 2 р€док:');
  Readln(det[2,1], det[2,2], det[2,3]);
  Writeln('¬вед≥ть 3 р€док:');
  Readln(det[3,1], det[3,2], det[3,3]);
  delta := det[1,1]*det[2,2]*det[3,3] + det[1,2]*det[2,3]*det[3,1] + det[1,3]*det[2,1]*det[3,2] - det[3,1]*det[2,2]*det[1,3] - det[3,2]*det[2,3]*det[1,1] - det[3,3]*det[2,1]*det[1,2];
  Writeln('Delta = ', delta) ;
  FOR i := 1 TO 3 DO
   BEGIN
    FOR k := 1 TO 3 DO minor[k,i] := minor[i,k];
   END;
  minor[1,1] := det[2,2]*det[3,3] - det[3,2]*det[2,3];
  minor[1,2] := -(det[2,1]*det[3,3] - det[3,1]*det[2,3]);
  minor[1,3] := det[2,1]*det[3,2] - det[3,1]*det[2,2];
  minor[2,1] := -(det[1,2]*det[3,3] - det[3,2]*det[1,3]);
  minor[2,2] := det[1,1]*det[3,3] - det[3,1]*det[1,3];
  minor[2,3] := -(det[1,1]*det[3,2] - det[3,1]*det[1,2]);
  minor[3,1] := det[1,2]*det[2,3] - det[2,2]*det[1,3];
  minor[3,2] := -(det[1,1]*det[2,3] - det[2,1]*det[1,3]) ;
  minor[3,3] := det[1,1]*det[2,2] - det[2,1]*det[1,2];
  Writeln('—оюзна матриц€:');
  Writeln(minor[1,1], '  ', minor[1,2], '  ', minor[1,3]);
  Writeln(minor[2,1], '  ', minor[2,2], '  ', minor[2,3]);
  Writeln(minor[3,1], '  ', minor[3,2], '  ', minor[3,3]);
 END.
