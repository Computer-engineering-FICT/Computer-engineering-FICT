type
  matrix = array[1..100,1..100] of integer;
var
  A:matrix;
  n,aut:integer;

procedure write_mat(var mat:matrix; var n:integer);
var i,j:integer;
begin
  for i:=1 to n do begin
    for j:=1 to n do write(mat[i,j]:3,' ');
    writeln('')
  end
end;

procedure read_element(var mat:matrix; var i,j,l,aut:integer);
begin
  if aut=1 then begin
    mat[i,j]:=l;
    l:=l+1
  end
  else read(mat[i,j])
end;

procedure read_mat(var mat:matrix; var n,aut:integer);
var i,j,b,k,t,l:integer;
begin
  l:=1;
  for k:=1 to (n div 2)+1 do begin
    b:=n+1-k;
    for j:=k to b do read_element(mat,k,j,l,aut);
    for i:=k+1 to b do read_element(mat,i,b,l,aut);
    for t:=k to n-k do begin
      j:=n-t;
      read_element(mat,b,j,l,aut)
    end;
    for t:=k to n-1-k do begin
      i:=n-t;
      read_element(mat,i,k,l,aut)
    end
  end
end;

begin
  write('Введіть розмір матриці A(nxn), n = ');
  readln(n);
  writeln('1 - автозаповнення починаючи з 1, інше - заповнення власноручно');
  readln(aut);
  if aut<>1 then writeln('Введіть елементи матриці по спіралі');
  read_mat(A,n,aut);
  writeln('Матриця А:');
  write_mat(A,n)
end.