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
var i,j,k,t:integer;
begin
  k:=1;
  for i:=1 to n*2-1 do
    for j:=1 to i do begin
      t:=i-j+1;
      if (t<=n) and (j<=n) then begin
        mat[t,j]:=k;
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