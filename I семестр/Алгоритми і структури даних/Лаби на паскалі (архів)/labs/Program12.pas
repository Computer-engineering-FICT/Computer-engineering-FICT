Program Lab8;
  type
    TIndex = 1..100;
    Tvector = array[TIndex] of integer;
    TMatrix = array[TIndex] of TVector;
    SwapSum = procedure(n: TIndex; M: TMatrix; var X: TVector);
    
  var
    n: TIndex;
    V1, X1: TVector;
    M1: TMatrix;
    Suma: SwapSum;
    
  Procedure GenerateMatrix(n: TIndex; var M: TMatrix);
    var
      i, j : TIndex;
    begin
      for i := 1 to n do
        for j := 1 to n do
          M[i, j] := random(-100, 100);
    end;
    
  Procedure WriteMatrix(n: TIndex; M: TMatrix);
    var
      i, j : TIndex;
    begin
      for i := 1 to n do
        begin
          for j := 1 to n do
            write(M[i, j]:4);
          writeln;
        end;
      writeln;
    end;

  Procedure WriteVector(n: TIndex; V: TVector);
    var
      i: TIndex;
    begin
      for i := 1 to n do
        begin
          write(V[i]:5);
          writeln;
        end;
      writeln;
    end;

  Procedure Sum(n: TIndex; M: TMatrix; var V: TVector);
    var
      i, j: TIndex;
      s: integer;
    begin
      for i := 1 to n do
        begin
          s := 0;
          for j := 1 to n do
            s := s + M[i, j];
          V[i] := s;
        end;
    end;
  
  Procedure Exec(n: TIndex; M: TMatrix; V: TVector; Suma: SwapSum);
    begin
      Suma := Sum;
      writeln('¬ведiть розмiр квадратноњ матрицi');
      readln(n);
      GenerateMatrix(n, M1);
      writeln('«генерована матриц€');
      WriteMatrix(n, M1);
      Suma(n, M1, V1);
      writeln('ќтриманий вектор');
      WriteVector(n, V1);
    end;
  
begin
  Exec(n, M1, V1, Suma);
end.