program set_1;

uses CRT;

type
    Tset=array [1..100] of integer;
var
    A, B, C, L, R:Tset;
    n:integer;
procedure insertSET_A(var A:Tset; n:integer);
 var
   i:integer;
 begin
  for i:=1 to n do
   begin
    write('input',i,':');
    read(A[i]);
   end;
 end;
procedure printSET_A(var A:Tset; n:integer);
 var
   i:integer;
 begin
  for i:=1 to n do
    write(A[i]:5);
 end;
procedure insertSET_B(var B:Tset; n:integer);
 var
    j:integer;
 begin
  for j:=1 to n do
   begin
    write('input',j,':');
    read(B[j]);
   end;
 end;
procedure printSET_B(var B:Tset; n:integer);
 var
   j:integer;
 begin
  for j:=1 to n do
    write(B[j]:5);
 end;
procedure obednannya_A_B(var A,B,L:Tset; p,n:integer);
  var f,i:integer;
 begin
  for i:=1 to n do
   begin
      for i:=1 to n do
       L[f]:=A[i];
      for j:=1 to n do
       L[f]:=B[j];
   end;
 end;
procedure print_obednannya_A_B(var L:Tset; n:integer);
  var
     f:integer;
 begin
   for f:=1 to n do
   write(L[f]:5);
 end;
procedure insertSET_C(var C:Tset; n:integer);
 var
   k:integer;
 begin
  for k:=1 to n do
   begin
    write('input',k,':');
    read(C[k]);
   end;
 end;
procedure printSET_C(var C:Tset; n:integer);
 var
   k:integer;
 begin
  for k:=1 to n do
    write(C[k]:5);
 end;

procedure peretun(var L,C,R:Tset; n:integer);
  var t,f,k,m:integer;
 begin
  m:=0;
  for f:=1 to n do
   begin
    for t:=1 to n do
     if L[f]=C[k] then
        begin
        m:=m+1;
        L[f]=C[k];
        end;
   end;
 end;
procedure print_peretun(var C:Tset; n:integer);
  var
     k:integer;
 begin
   for k:=1 to n do
   write(C[k]:5);
 end;


begin
 clrscr;
  write('input the size of set-->');
  read(n);
  insertSET_A(A; n);
  printSET_A(A; n);
  insertSET_B(B; n);
  printSET_B(B; n);
  obednannya_A_B(A,B,L; p,n);
  print_obednannya_A_B(L; n);
  insertSET_C(C; n);
  printSET_C(C; n);
  peretun(L,C,R; n);
  print_peretun(C; n);
 readln;
 readln;
end.