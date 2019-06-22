program set_1;

uses CRT;

type
    Tset=array [1..100] of integer;
var
    A, C, U,R,L:Tset;
    n,p:integer;
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
procedure insertSET_C(var C:Tset; n:integer);
 var
   i:integer;
 begin
  for i:=1 to n do
   begin
    write('input',i,':');
    read(C[i]);
   end;
 end;
procedure printSET_C(var C:Tset; n:integer);
 var
   i:integer;
 begin
  for i:=1 to n do
    write(C[i]:5);
 end;
procedure znahod_U(var A,C,U:Tset; n:integer);
 var
    i,j,p:integer;
    ex:boolean;
 begin
  p:=0;
  for i:=1 to n do
  begin
    ex:=true;
    for j:=1 to n do
     begin
       if A[i]=C[j] then
          ex:=false;
     end;

     if ex=true  then
     begin
          p:=p+1;
          U[p]:=A[i];
     end;
  end;
  for j:=1 to n do
  begin
    p:=p+1;
    U[p]:=C[j];
   end;
 end;

procedure print_U(var U:Tset; c:integer);
 var
    p:integer;
 begin
   for p:=1 to n  do
    write(U[p]:5);
 end;
procedure zaperechennya_A(var A,U,R:Tset; p,n:integer);
  var t,i:integer;
 begin
  t:=0;
  for i:=1 to n do
   begin
    for p:=1 to n do
     if A[i]<>U[p] then
        begin
        t:=t+1;
        R[t]:=A[i];
        end;
   end;
 end;
procedure print_zaperechennya_A(var R:Tset; n:integer);
  var
     t:integer;
 begin
   for t:=1 to n do
   write(R[t]:5);
 end;
procedure obednannya_notA_C(var C,L,R:Tset; p,n:integer);
  var f,t,i:integer;
 begin
  t:=0;
  for i:=1 to n do
   begin
      for f:=1 to n do
       L[f]:=C[i];
      for t:=1 to n do
       L[f]:=R[t];
   end;
 end;
procedure print_obednannya_notA_C(var L:Tset; n:integer);
  var
     f:integer;
 begin
   for f:=1 to n do
   write(L[f]:5);
 end;
 
begin
 clrscr;
  write('input the size of set-->');
  read(n);

  insertSET_A(A,n);
  printSET_A(A,n);
   writeln;
  insertSET_C(C,n);
  printSET_C(C,n);
   writeln;
  znahod_U(A,C,U,n);
  print_U(U,p);
   writeln;
 zaperechennya_A(A,U,R,p,n);
 print_zaperechennya_A(R, n);
 obednannya_notA_C(C,L,R, p,n);
 print_obednannya_notA_C(L, n);
 readln;
 readln;
end.