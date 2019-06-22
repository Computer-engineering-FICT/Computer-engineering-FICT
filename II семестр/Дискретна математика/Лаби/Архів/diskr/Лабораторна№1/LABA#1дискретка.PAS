program set_1;

uses CRT;

type
    Tset=array [1..100] of integer;
var
    A, B, U,R:Tset;
    n,c:integer;
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
   i:integer;
 begin
  for i:=1 to n do
   begin
    write('input',i,':');
    read(B[i]);
   end;
 end;
procedure printSET_B(var B:Tset; n:integer);
 var
   i:integer;
 begin
  for i:=1 to n do
    write(B[i]:5);
 end;

procedure znahod_U(var A,B,u:Tset; n:integer);
 var
    i,j:integer;
    ex:boolean;
 begin
  c:=0;
  for i:=1 to n do
  begin
    ex:=true;
    for j:=1 to n do
     begin
       if A[i]=B[j] then
          ex:=false;
     end;

     if ex=true  then
     begin
          c:=c+1;
          U[c]:=A[i];
     end;
  end;
  for j:=1 to n do
  begin
    c:=c+1;
    U[c]:=B[j];
   end;
 end;

procedure print_U(var U:Tset; c:integer);
 var
    i:integer;
 begin
   for i:=1 to c  do
    write(U[i]:5);
 end;
procedure peretun(var A,U,R:Tset; c,n:integer);
  var t,i:integer;
 begin
  t:=0;
  for i:=1 to n do
   begin
    for c:=1 to n do
     if A[i]=U[c] then
        begin
        t:=t+1;
        R[t]:=A[i];
        end;
   end;
 end;
procedure print_peretun(var R:Tset; n:integer);
  var
     t:integer;
 begin
   for t:=1 to n do
   write(R[t]:5);
 end;

begin
 clrscr;
  write('input the size of set-->');
  read(n);

  insertSET_A(A,n);
  printSET_A(A,n);
   writeln;
  insertSET_B(B,n);
  printSET_B(B,n);
   writeln;
  znahod_U(A,B,U,n);
  print_U(U,c);
   writeln;
  peretun(A,U,R,c,n);
  print_peretun(R,n);
 readln;
 readln;
end.