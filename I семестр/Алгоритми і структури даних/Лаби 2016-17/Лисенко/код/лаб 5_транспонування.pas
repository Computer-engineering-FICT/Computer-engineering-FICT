type
  matrix = array[1..100,1..100] of integer;
var
  A:matrix;
  n:integer;

procedure read_mat(var mat:matrix; var n:integer);
var i,j: integer;
begin
  readln(n);
  writeln('¬вед≥ть числа дл€ матриц≥:');
  for i:=1 to n do for j:=1 to n do read(mat[i,j])
end;

procedure transpose(var mat:matrix; var n:integer);
var i,j,c:integer;
begin
  for i:=2 to n do begin
    for j:=1 to i-1 do begin
      c:=mat[i,j];
      mat[i,j]:=mat[j,i];
      mat[j,i]:=c
    end
  end
end;

procedure write_mat(var mat:matrix; var n:integer);
var i,j:integer;
begin
  for i:=1 to n do begin
    for j:=1 to n do write(mat[i,j]:3,' ');
    writeln('')
  end
end;

begin
  write('¬вед≥ть розм≥р матриц≥ A(nxn), n = ');
  read_mat(A, n);
  transpose(A, n);
  writeln('“ранспонована матриц€ A^(-1):');
  write_mat(A, n);
end.