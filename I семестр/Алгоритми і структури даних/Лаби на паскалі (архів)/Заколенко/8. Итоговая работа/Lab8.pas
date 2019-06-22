Unit Lab8;
  Interface
    Type
      Tindex=0..100;
      Tarray=array[Tindex] of real;
      Matrix=array[Tindex] of Tarray;
    function f(i,j:Tindex):real;
    Procedure InputMatrix(var n:Tindex; var A:Matrix);
    Procedure OutputMatrix(n:Tindex; A:Matrix);
    Procedure WriteMatrix(var mf:text; A:Matrix;n:Tindex);
    Procedure ResetMatrix(mf:text; var B:Matrix;n:Tindex);
    Procedure Vektor(B:Matrix;var X:Tarray;n:Tindex);
    Procedure OutputVektor(X:Tarray;n:Tindex);
    Procedure NewVektor(var X:Tarray; var X1:Tarray; n:Tindex);
  Implementation
    var
      i,j:Tindex;
    Function f(i,j:Tindex):real;
      begin
        f:=-2*(j/2-3.1)*(i-3.9)+exp(ln(2.5)*i)*j-10;
      end;
    Procedure InputMatrix(var n:Tindex; var A:Matrix);
      begin
        write('enter the size of matrix, n=');
        read(n);
        for i:=1 to n do
          for j:=1 to n do
            A[i][j]:=f(i,j);
      end;
    Procedure OutputMatrix(n:Tindex; A:Matrix);
      begin
        writeln('Matrix A:');
        for i:=1 to n do
          begin
            for j:=1 to n do
              write(A[i][j],' ');
            writeln
          end;
      end;
    Procedure WriteMatrix(var mf:text; A:Matrix;n:Tindex);
      begin
        assign(mf,'D:\lab8.txt');
        rewrite(mf);
        for i:=1 to n do
          begin
            for j:=1 to n do
              write(mf,A[i][j],'  ');
            writeln
          end;
        close(mf)
      end;
    Procedure ResetMatrix(mf:text; var B:Matrix;n:Tindex);
      begin
        assign(mf,'D:\lab8.txt');
        reset(mf);
        for i:=1 to n do
          for j:=1 to n do
            read(mf,B[i][j]);
        close(mf)
      end;
    Procedure Vektor(B:Matrix;var X:Tarray;n:Tindex);
      begin
        j:=1;
        for i:=1 to n do
          if B[i][i]>=0 then
            begin
              X[j]:=B[i][i];
              j:=j+1
            end;
        for i:=1 to n do
          if B[i][i]<0 then
            begin
              X[j]:=B[i][i];
              j:=j+1
            end;
      end;
    Procedure OutputVektor(X:Tarray;n:Tindex);
      begin
        writeln('Vektor X:');
        for i:=1 to n do
          write(X[i],' ');
        writeln
      end;
    Procedure NewVektor(var X:Tarray;var X1:Tarray; n:Tindex);
      begin
        for i:=1 to (n-1) do
          X1[i]:=(X[i]-X[i+1])/2;
        for i:=1 to n-1 do
          X[i]:=X1[i];
      end;
  end.