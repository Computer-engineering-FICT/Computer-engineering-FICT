PROGRAM Variant4;
USES Crt;
VAR A, B, U, temp, temp1, temp2, temp3, temp4, Res: set of byte;
    i: integer;
FUNCTION Sym(VAR A, B: set of byte): set of byte;
VAR temp, temp1: set of byte;
 BEGIN
  temp := A + B;
  temp1 := A*B;
  Sym := temp - temp1;
 END; {Sym}
FUNCTION NotS(VAR A: set of byte): set of byte;
 BEGIN
  NotS := U - A;
 END; {NotS}
 BEGIN
  A := [1, 3];
  B := [7, 8, 5, 0];
  U := [0..255];
  temp := A*B;
  temp1 := temp + Nots(A);
  temp2 := temp1 + Nots(B);
  temp2 := Nots(temp2);
  temp3 := Nots(A) + Nots(B);
  temp4 := temp2 - temp3;
  Res := Sym(temp4, A);
  Writeln('Answer:');
  FOR i := 0 TO 255 DO IF i IN Res THEN Write(i, ' ');
 END.
