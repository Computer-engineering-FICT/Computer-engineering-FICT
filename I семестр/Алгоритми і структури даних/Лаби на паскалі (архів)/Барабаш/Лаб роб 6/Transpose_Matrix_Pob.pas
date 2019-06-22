procedure MatrixTransposePob (var a:matrix; var m,n:tindex);
  var i,j,temp,max:integer;
  begin
       if m>=n then max:=m else max:=n;
       for i:=1 to max-1 do
       for j:=1 to max-i do
       begin
        temp:=a[i,j];
        a[i,j]:=a[m-j+1,m-i+1];
        a[m-j+1,m-i+1]:=temp;
       end;
  end;
  writeln('             3. Транспонувати матрицю за побiчною дiагоналлю');
  3: begin
            if m<>n then writeln('Транспонувати можна лише квадратну матрицю') else
            begin
            MatrixTransposePob(a,m,n);
            MatrixOutput(a,m,n);
            end;