Program Lab8;
  type
    TIndex = 1..100;
    Tvector = array[TIndex] of real;
    TMatrix = array[TIndex] of TVector;
  var
    i, n: TIndex;
    V1, X1: TVector;
    M1: TMatrix;
    
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
            write(M[i, j]:8:2);
          writeln;
        end;
      writeln;
    end;

  Procedure WriteVector(n: TIndex; V: TVector);
    var
      i: TIndex;
    begin
      for i := 1 to n do
        write(V[i]:8:2);
      writeln;
    end;

  Procedure FormMatrix(n: TIndex; var f: TMatrix);
    var
      i, j : TIndex;
    begin
      for i := 1 to n do
        for j := 1 to n do
          f[i, j] := 2 * (4.75 * i - 2.71 * j) - 8.11 * (2 * j - 5) - tan(i);
    end;
    
  Procedure Sort(n: TIndex; var M: TMatrix; var V: TVector);
    var
      i, j, k: TIndex;
      tmp: real;
    begin
      for i := 1 to n  do
        begin
          for k := 2 to n do
            for j := n downto k do
              if M[j, i] > M[j - 1, i] then
                begin
                  tmp := M[j, i];
                  M[j, i] := M[j - 1, i];
                  M[j - 1, i] := tmp;
                end;
           V[i] := M[n, i];
         end;
       writeln;
     end;
  
  Procedure FormVector(n:TIndex; i: TIndex; V: TVector; var X: TVector);
    begin
      for i := 1 to n do
        X[i] := V[i];
      for i := 1 to n - 2 do
        X[i] := (V[i] - V[n - i] - V[n - i - 1])/3;
      writeln;
    end;
  
begin
  writeln('¬ведiть розмiр квадратноњ матрицi');
  readln(n);
  GenerateMatrix(n, M1);
  writeln('«генерована матриц€');
  WriteMatrix(n, M1);
  FormMatrix(n, M1);
  writeln('«формована за правилом матриц€');
  WriteMatrix(n, M1);
  Sort(n, M1, V1);
  writeln('¬iдсортована матриц€');
  WriteMatrix(n, M1);
  writeln('ќтриманий вектор');
  WriteVector(n, V1);
  FormVector(n, i, V1, X1);
  writeln('«формований за правилом вектор');
  WriteVector(n, X1);
end.















{  Procedure SearchMin(n: TIndex; M: TMatrix; var min: real; var V: TVector);
    var
      i, j: TIndex;
    begin
      for j := 1 to n do
        begin
          min := M[1, j];
          for i := 2 to n do
            if M[i, j] < min then
              min := M[i, j];
            V[j] := min;
        end;
    end;}