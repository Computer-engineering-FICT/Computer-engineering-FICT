UNIT Logic;
{Created by Rudnitsky M.
Last changed 01.05.2011}
INTERFACE
USES Matrix;
TYPE
 TBinary = 0..1;
 TIndex = 1..100;
 TZIndex = 0..100;
 TVector = ARRAY[TIndex] OF TBinary;

 FUNCTION AND2(a, b: TBinary): TBinary;
 FUNCTION OR2(a, b: TBinary): TBinary;
 FUNCTION AND_NOT2(a, b: TBinary): TBinary;
 FUNCTION OR_NOT2(a, b: TBinary): TBinary;
 FUNCTION Invert(a: TBinary): TBinary;
 FUNCTION Sum(a: TVector; b: TVector; n: TIndex): TVector;
 FUNCTION RightMoving(a: TVector; n: TIndex; MoveSize: TIndex; Left: TVector): TVector;
 FUNCTION LeftMoving(a: TVector; n: TIndex; MoveSize: TIndex; Right: TVector): TVector;
 PROCEDURE Multiplication_1(VAR a: TVector; VAR b: TVector; VAR c: TVector; n: TIndex);
 
IMPLEMENTATION
 FUNCTION AND2(a, b: TBinary): TBinary;
  BEGIN
   IF (a = b) AND (a = 1) THEN AND2 := 1
                          ELSE AND2 := 0
  END; {AND2}
 FUNCTION OR2(a, b: TBinary): TBinary;
  BEGIN
   IF (a = b) AND (a = 0) THEN OR2 := 0
                          ELSE OR2 := 1
  END; {OR2}
 FUNCTION AND_NOT2(a, b: TBinary): TBinary;
  VAR temp: TBinary;
   BEGIN
    temp := AND2(a, b);
    AND_NOT2 := Invert(temp)
   END; {AND_NOT2}
 FUNCTION OR_NOT2(a, b: TBinary): TBinary;
  VAR temp: TBinary;
   BEGIN
    temp := OR2(a, b);
    OR_NOT2 := Invert(temp)
   END; {OR_NOT2}
 FUNCTION Invert(a: TBinary): TBinary;
  BEGIN
   IF a = 0 THEN Invert := 1
            ELSE Invert := 0
  END; {Invert}
 FUNCTION Sum(a: TVector; b: TVector; n: TIndex): TVector;
  VAR flag, transfering: boolean;
      i: TIndex;
      temp: TVector;
   BEGIN
    transfering := false;
    flag := false;
    FOR i := n + 1 DOWNTO 2 DO
     BEGIN
      IF ((a[i - 1] = 0) AND (b[i - 1] = 0)) AND (transfering = false) THEN
       BEGIN
        IF i = 2 THEN flag := true;
        temp[i] := 0;
        transfering := false;
        CONTINUE
       END;
      IF ((a[i - 1] = 0) AND (b[i - 1] = 0)) AND (transfering = true) THEN
       BEGIN
        IF i = 2 THEN flag := true;
        temp[i] := 1;
        transfering := false;
        CONTINUE
       END;
      IF ((a[i - 1] = 1) AND (b[i - 1] = 0)) AND (transfering = false) THEN
       BEGIN
        IF i = 2 THEN flag := true;
        temp[i] := 1;
        transfering := false;
        CONTINUE;
       END;
      IF ((a[i - 1] = 1) AND (b[i - 1] = 0)) AND (transfering = true) THEN
       BEGIN
        IF i = 2 THEN flag := true;
        temp[i] := 0;
        transfering := true;
        CONTINUE
       END;
      IF (a[i - 1] = 0) AND (b[i - 1] = 1) AND (transfering = false) THEN
       BEGIN
        IF i = 2 THEN flag := true;
        temp[i] := 1;
        transfering := false;
        CONTINUE
       END;
      IF ((a[i - 1] = 0) AND (b[i - 1] = 1)) AND (transfering = true) THEN
       BEGIN
        IF i = 2 THEN flag := true;
        temp[i] := 0;
        transfering := true;
        CONTINUE
       END;
      IF ((a[i - 1] = 1) AND (b[i - 1] = 1)) AND (transfering = false) THEN
       BEGIN
        IF i = 2 THEN flag := true;
        temp[i] := 0;
        transfering := true;
        CONTINUE
       END;
      IF ((a[i - 1] = 1) AND (b[i - 1] = 1)) AND (transfering = true) THEN
       BEGIN
        IF i = 2 THEN flag := true;
        temp[i] := 1;
        transfering := true;
        CONTINUE
       END
    END;
    IF (transfering = true) AND (flag = true) THEN temp[1] := 1
                                              ELSE temp[1] := 0;
    Sum := temp
   END; {Sum}
 FUNCTION RightMoving(a: TVector; n: TIndex; MoveSize: TIndex; Left: TVector): TVector;
  VAR i: TIndex;
   BEGIN
    FOR i := n DOWNTO MoveSize + 1 DO a[i] := a[i - MoveSize];
    FOR i := 1 TO MoveSize DO a[i] := Left[i];
    RightMoving := a
   END; {RightMoving}
 FUNCTION LeftMoving(a: TVector; n: TIndex; MoveSize: TIndex; Right: TVector): TVector;
  VAR i: TIndex;
   BEGIN
    FOR i := 1 TO n - MoveSize DO a[i] := a[i + MoveSize];
    FOR i := n - MoveSize + 1 TO n DO a[i] := Right[i - n + MoveSize];
    LeftMoving := a
   END; {LeftMoving}
 PROCEDURE Multiplication_1(VAR a, b, c: TVector; n: TIndex);
  VAR i: TIndex;
      temp, temp1, temp2: TVector;
   BEGIN
    FOR i := 1 TO n + 1 DO c[i] := 0;
    temp1[1] := 0;
    b := RightMoving(b, n + 1, 1, temp1);
    OutPutVector(b, n + 1, false, 'b = ');
    FOR i := n DOWNTO 1 DO
     BEGIN
      IF a[n] = 1 THEN
       BEGIN
         c := Sum(b, c, n);
         OutPutVector(c, n + 1, false, 'c = ');
       END;
      temp[1] := c[n + 1];
     // IF i <= n - 1 THEN c := temp2;
      a := RightMoving(a, n, 1, temp);
      OutPutVector(a, n , false, 'a = ');

      c := RightMoving(c, n + 1, 1, temp1);
      OutPutVector(c, n + 1, false, ' c = ');

     END;
   END; {Multiplication_1}
 END.
