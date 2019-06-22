PROGRAM Variant4;
USES GraphABC;
TYPE TBinary = 0..1;
     TIndex = 1..100;
 PROCEDURE Draw;
  BEGIN
   Writeln('Граф:');
   Line(50, 50, 150, 200);
   Line(50, 50, 150, 50);
   Line(150, 50, 150, 200);
   Line(50, 50, 150, 200);
   Line(150, 200, 120, 10);
   Line(120, 10, 150, 50);
   Line(50, 50, 200, 100);
   Line(200, 100, 300, 150);
   Line(200, 100, 250, 250);
   Line(200, 100, 300, 220);
   Line(250, 250, 300, 220);
   Line(300, 10, 250, 250);
   Line(300, 10, 300, 150);
   Line(300, 150, 400, 20);
   Line(400, 20, 150, 50);
   Line(120, 10, 400, 200);
   Line(400, 200, 400, 20);
   Line(400, 200, 300, 220);
   Circle(50, 50, 5);
   Circle(150, 200, 5);
   Circle(120, 10, 5);
   Circle(150, 50, 5);
   Circle(400, 20, 5);
   Circle(300, 10, 5);
   Circle(300, 220, 5);
   Circle(400, 200, 5);
   Circle(300, 150, 5);
   Circle(250, 250, 5);
   Circle(200, 100, 5)
  END;
 PROCEDURE Incident;
  VAR matrix: array[TIndex, TIndex] of TBinary;
      i, j: TIndex;
   BEGIN
    FOR i := 1 TO 18 DO
     BEGIN
      FOR j := 1 TO 11 DO Write(matrix[i, j], ' ');
      Writeln
     END
   END;
BEGIN
 Draw;
 Incident
END.
