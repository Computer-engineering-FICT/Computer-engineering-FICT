program Matrix;
Const max=50;
Var a,b,c: array [1..max,1..max] of integer;
  i,j,k,n,m,p,l,summa,action: integer;
 procedure MatrixA (var a:array [1..max,1..max] of integer);
 var i,j:integer;
  begin
     writeln('Enter elements');
     for i:=1 to m do
       for j:=1 to n do
         begin
            write('A[',i,',',j,']= ');
            read(a[i,j]);
         end;
  end;
  procedure MatrixB (var b:array [1..max,1..max] of integer);
  var i,j:integer;
    begin
     writeln('Enter matrix В');
     write('Enter the number of columns: ');
     read(m);
     writeln('Enter elements');
     for i:=1 to n do
       for j:=1 to m do
         begin
            write('b[',i,';',j,'] = ');
            read(b[i,j]);
         end;
           end;
procedure MatrixTranspose (var a:array [1..max,1..max] of integer; var m,n:integer);
 var i,j:integer;t:array [1..max,1..max] of integer;
   begin
      For i := 1 To N Do
    For j := 1 To M Do
      T [i, j] := A [j, i];
  WriteLn;
  WriteLn('MATRIX');
  For i := 1 To N Do
    Begin
      For j := 1 To m Do
        Write (T [i, j] : 5);
      WriteLn;
    End;
  End;

 procedure MatrixMultiply (var c:array [1..max,1..max] of integer);
  var l,k,i,j:integer;
    begin
       for i:=1 to n do
    for j:=1 to m do
      begin
        summa:= 0;
        for l:= 1 to k do
          summa:= summa + a[i,l]*b[l,j];
          c[i,j] := summa;
           end;
      writeln('Result:');
  for i:=1 to n do
    begin
      for j:=1 to m do
        write(c[i,j]:8);
      writeln;
    end;
    end;
procedure matrixoutput (var a:array [1..max,1..max] of integer; var m,n:integer);
 var i,j:integer;t:array [1..max,1..max] of integer;
  begin
Writeln('Дана матриця:');
  For i := 1 To N Do
    Begin
      For j := 1 To M Do
        Write (a [i, j] : 5);
      WriteLn;
    End;
end;
begin
  write('Enter the number of lines: ');read(m);
  write('Enter the number of columns: ');read(n);
  MatrixA(a);
  matrixoutput(a,n,m);
  writeln('Select action:');
  writeln('1. Transpone matrix');
  writeln('2. Multiply matrixes a and b');
  write('Your choise: ');read(action);
      if action=1 then
       begin
            MatrixTranspose(a,m,n);
       end;
        if action=2 then
        begin
            MatrixB(b);
            MatrixMultiply(c);
           end;


end.
