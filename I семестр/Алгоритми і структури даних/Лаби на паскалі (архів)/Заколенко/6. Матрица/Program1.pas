Program MyMatrix;
  Type
    Tindex=1..10;
    Tarray=array[Tindex] of real;
    Matrix=array[Tindex] of Tarray;
  var
    a1,a2,z:Tindex;
    M1,M2,M3:Matrix;
  Procedure InputMatrix(var a:Tindex ;var m:Matrix);
    var
      i,j:Tindex;
    begin
      write('Enter the square matrix, the number of lines and columns - N=');
      read(a);
      writeln('Enter the elements of matrix:');
      for i:=1 to a do
        for j:=1 to a do
          read(m[i][j])
    end;
  Procedure OutputMatrix(a:Tindex; m:Matrix);
    var
      i,j:Tindex;
    begin
      for i:=1 to a do
        begin
          for j:=1 to a do
            write('M[',i,',',j,']=',m[i][j],' ');
          writeln;
        end;
    end;
  Procedure Transposition(a:Tindex; var m:Matrix);
    var
      i,j:Tindex;
      x:real;
    begin
      for i:=1 to a-1 do
        for j:=i+1 to a do
          begin
            x:=m[i][j];
            m[i][j]:=m[j][i];
            m[j][i]:=x
          end;
    end;
  Procedure Multiplication(a:Tindex; m1,m2:Matrix; var m:Matrix);
    var
      i,j,k:Tindex;
    begin
      for i:=1 to a do
        for j:=1 to a do
          begin
            m[i][j]:=0;
            for k:=1 to a do
            m[i][j]:=m[i][j]+m1[i][k]*m2[k][j]
          end;
    end;
  begin
    InputMatrix(a1,M1);
    writeln('Select the action:');
    writeln('1-matrix transpose;');
    writeln('2-multiply matrices.');
    read(z);
    case(z) of
      1:
        begin
          Transposition(a1,M1);
          OutputMatrix(a1,M1)
        end;
      2:
        begin
          InputMatrix(a2,M2);
          Multiplication(a1,M1,M2,M3);
          OutputMatrix(a1,M3)
        end;
    end;
  end.