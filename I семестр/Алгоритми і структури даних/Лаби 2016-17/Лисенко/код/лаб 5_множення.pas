type
  matrix = array[1..100,1..100] of integer;
var
  A,B,C:matrix;
  n:integer;

procedure read_mat(var mat:matrix; var n:integer);
var i,j: integer;
begin
  writeln('¬вед≥ть числа дл€ матриц≥');
  for i:=1 to n do for j:=1 to n do read(mat[i,j])
end;

procedure write_mat(var mat:matrix; var n:integer);
var i,j:integer;
begin
  for i:=1 to n do begin
    for j:=1 to n do write(mat[i,j]:3,' ');
    writeln('')
  end
end;

procedure mat_mult(var mat1,mat2,res:matrix; var n:integer);
var i,j,k,tmp:integer;
begin
  for i:=1 to n do for j:=1 to n do begin
      tmp:=0;
      for k:=1 to n do tmp:=tmp+mat1[i,k]*mat2[k,j];
      res[i,j]:=tmp
  end
end;

begin
  write('¬вед≥ть розм≥р матриць A(nxn) та B(nxn), n = ');
  read(n);
  writeln('A(',n,'x',n,'):');
  read_mat(A, n);
  writeln('B(',n,'x',n,'):');
  read_mat(B, n);
  mat_mult(A,B,C,n);
  writeln('–езультат множенн€ матриць A та B:');
  write_mat(C,n)
end.