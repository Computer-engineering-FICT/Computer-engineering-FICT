unit Unit1;

interface
 type
 index=1..100;
 Vector = array [index] of real;
 Matrix = array [index] of Vector;

var
n: integer;
A,B: matrix;
F: file of matrix;
X:vector;

procedure InputMatrix (var n:integer; var A:matrix);
procedure OutputMatrix (n:integer; A:matrix);
procedure OutputVector (n:integer; X:vector);
procedure WriteFile (A :matrix; F:file of matrix);
procedure ReadFile (var B:matrix; F:file of matrix);
procedure MatrixOnVector (n:integer; A: matrix; var X:vector);
procedure VectorOn2Vector (n:integer; var X:vector);

implementation
 uses crt;

procedure InputMatrix;                     //���� �������
var
i,j: index;
begin
  writeln ('������� ������ ���������� �������');
  read (n);
  for i := 1 to n do
    for j := 1 to n do
      A[i,j]:=(2-(i-3)*(j-3))*(j-5.7)/(i+j)+power(2,i)*sin(i);
end;

procedure OutputMatrix;                     //������ �������
var
i,j: index;
begin
  for i := 1 to n do
    begin
      for j := 1 to n do
        write (A[i,j]:3:3,' ');
        writeln;
    end;
writeln;
readln;
end;

procedure OutputVector;                     //������ �������
var
i: index;
begin
  for i := 1 to n do
    write (X[i]:3:3,' ');
    writeln;
    readln;
end;

procedure WriteFile;                //������ � ����
begin
  assign (F,'myfile');
  rewrite(F);
  write(F,A);
  close(F);
end;

procedure ReadFile;              //������ � �����
begin
  assign(F,'myfile');
  reset(F);
  read(F,B);
  close(F);
end;

procedure MatrixOnVector;                 //������� � ������
var
i,j: index;
buf: real;
begin
 for i := 1 to n do
   begin
     for j := 1 to n do
       buf := buf+A[i,j];
       X[p] := buf/n;
       buf  := 0;
   end;
for i := 1 to n-1 do
  for j := 1 to n-1 do
    if X[j] < X[j+1]
      then
        begin
          buf := X[j];
          X[j] := X[j+1];
          X[j+1] := buf;
        end;
end;

procedure VectorOn2Vector;                //������ � ������ ������
var i: index;
begin
  for i := n downto 2 do
    X[i] := (X[i]-X[i-1])/2;
end;


end.

