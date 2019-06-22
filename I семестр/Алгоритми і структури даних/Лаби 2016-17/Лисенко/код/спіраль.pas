type
  matrix = array[1..100,1..100] of integer;
var
  A:matrix;
  n:integer;

procedure write_mat(var mat:matrix; var n:integer);
var i,j:integer;
begin
  for i:=1 to n do begin
    for j:=1 to n do write(mat[i,j]:3,' ');
    writeln('')
  end
end;

procedure read_mat(var mat:matrix; var n:integer);
var i,j,b,k,t:integer;
begin
  for k:=1 to (n div 2)+1 do begin
    b:=n+1-k;
    for j:=k to b do read(mat[k,j]);
    for i:=k+1 to b do read(mat[i,b]);
    for t:=k to n-k do begin
      j:=n-t;
      read(mat[b,j])
    end;
    for t:=k to n-1-k do begin
      i:=n-t;
      read(mat[i,k])
    end
  end
end;

begin
  write('Введіть розмір матриці A(nxn), n = ');
  readln(n);
  writeln('Введіть елементи матриці по спіралі');
  read_mat(A,n);
  writeln('Матриця А:');
  write_mat(A,n)
end.