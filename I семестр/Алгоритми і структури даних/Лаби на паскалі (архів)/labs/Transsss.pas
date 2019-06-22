Program Trans;
  type
    TIndex = 1..10;
    TArray = array[TIndex] of integer;
    TMatrix = array[TIndex] of TArray;
    GenProc = procedure(A: TMatrix; n: TIndex);
    TransProc = procedure(A: TMatrix; n: TIndex);
    WriteMProc = procedure(A: TMatrix; n: TIndex);
    TransExecProc = procedure(A: TMatrix; n: TIndex; G: GenProc; T:TransProc; W:WriteMProc);
    
  var
    n: TIndex;
    A: TMatrix;
    G: GenProc;
    T: TransProc;
    W: WriteMProc;
    TE: TransExecProc;
    
  procedure Gen(A:TMatrix; n:TIndex);
    var
      i, j: TIndex;
    begin
      for i := 1 to n do
        for j := 1 to n do
           A[i, j] := random(1, 9);
    end;
    
  procedure TransM(A:TMatrix; n:TIndex);
  var
    i, j : TIndex;
    temp : integer;
  begin
    for i := 1 to n do
      for j := i + 1 to n do
        begin
          temp := A[i,j];
          A[i,j] :=  A[j,i];
          A[j,i] := temp;
        end;
  end;
  
  procedure WriteM(A:TMatrix; n:TIndex);
  var
     i, j : TIndex;
  begin
    for i:=1 to n do
      begin
        for j:=1 to n do
          write(A[i,j]:3);
        writeln;
      end;
    writeln;
  end;
  
  procedure TransExec(A:TMatrix; n:TIndex; G: GenProc; T: TransProc; W: WriteMProc);
    begin
      G(A, n);
      T(A, n);
      W(A, n);
    end;
  
  procedure Exec(A:TMatrix; n:TIndex; TE:TransExecProc);
    begin
      TE(A, n, G, T, W);
    end;
    
  begin
    Exec(A, n, TE);
  end.