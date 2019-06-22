PROGRAM Ten2two;
USES Crt;
VAR z, y, n: integer;
    c: array[1..100] of integer;
 BEGIN
  ClrScr;
  Writeln('¬вед≥ть Y');
  Write('Y{10} = ');
  Read(y);
  Write('X{2} = ');
  z := y;
  n := 1;
  WHILE z >= 1 DO
   BEGIN
   c[n] := z mod 2;
   z := z div 2;
   n := n + 1;
  END;
   FOR n := n - 1 DOWNTO 1 DO Write(c[n]);
 END.
