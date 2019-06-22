Program Matrix;
  type
    TIndex = 1..10;
    TArray = array[TIndex] of integer;
    TMatrix = array[TIndex] of TArray;
  var
    n1, n, m, p: TIndex;
    M1, M2, resul: TMatrix;
  
  Procedure GenerateSMatrix(n: TIndex; var Ms: TMatrix);
    var
      i, j : TIndex;
    begin
      for i:=1 to n do
        for j:=1 to n do
          Ms[i, j] := random(1, 9);
      writeln;
    end;
  
  Procedure WriteSMatrix(n: TIndex; var Ms: TMatrix);
    var
      i, j : TIndex;
    begin
      for i:=1 to n do
        begin
          for j:=1 to n do
            write(Ms[i,j]:3);
          writeln;
        end;
      writeln;
    end;

  Procedure TransMatrix(n: TIndex; var Ms: TMatrix);
    var
      i, j : TIndex;
      temp : integer;
    begin
      for i := 1 to n do
        for j := i + 1 to n do
          begin
            temp := Ms[i,j];
            Ms[i,j] :=  Ms[j,i];
            Ms[j,i] := temp;
          end;
    end;
  
  Procedure GenerateMatrix(n, m: TIndex; var Matr: TMatrix);
    var
      i, j: TIndex;
    begin
      for i := 1 to n do
        for j := 1 to m do
           Matr[i, j] := random(1, 9);
    end;    
    
  Procedure WriteMatrix(n, m: TIndex; var Matr: TMatrix);
    var
      i, j : TIndex;
    begin
      for i := 1 to n do
        begin
          for j := 1 to m do
            write(Matr[i, j]:3);
          writeln;
        end;
      writeln;
    end;
    
    //��������� �������: M1(n,m), M2(m,n), res(n,n)
{ ���������� ��������� ������������ ������: (res) = (a) X (B) }
  Procedure MultMatrix(m, n, p: TIndex; M1, M2: TMatrix; var res: TMatrix);
    var i, j, k: Integer;
    begin
      for i := 1 to m do
        for j := 1 to p do
          begin
            res[i, j] := 0;
            for k := 1 to m do
              res[i, j] := res[i, j] + M1[i, k] * M2[k, j];
          end;
    end;

  begin
    writeln('����i�� ����i� ��������� ������i');
    readln(n1);
    writeln('����������� �������');
    GenerateSMatrix(n1, M1);
    WriteSMatrix(n1, M1);
    writeln('������������� �������');
    TransMatrix(n1, M1);
    WriteSMatrix(n1, M1);
    writeln('����i�� ����i�����i �������');
    write(' n = ');
    read(n);
    write(' m = ');
    read(m);
    write(' p = ');
    read(p);
    writeln('����������i ������i');
    GenerateMatrix(m, n, M1);
    WriteMatrix(m, n, M1);   
    GenerateMatrix(n, p, M2);
    WriteMatrix(n, p, M2);   
    writeln('����������i ������i');
    MultMatrix(m, n, p, M1, M2, resul);
    WriteMatrix(m, p, resul);  
  end.