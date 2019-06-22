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
var i,j,t,k:integer;
begin
  k:=1;
  for i:=1 to (n div 2)+1 do begin
    for j:=1 to n do begin
      mat[2*i-1,j]:=k;
      k:=k+1
    end;
    for t:=0 to n-1 do begin
      j:=n-t;
      mat[2*i,j]:=k;
      k:=k+1
    end
  end
end;

begin
  write('¬вед≥ть розм≥р матриц≥ A(nxn), n = ');
  readln(n);
  read_mat(A,n);
  writeln('ћатриц€ A:');
  write_mat(A,n)
end.