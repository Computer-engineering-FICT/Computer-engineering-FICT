program set_1;

uses CRT;

type
    Tset=array [1..10] of integer;
var
    A, B, U:Tset;
    n:integer;
procedure insertSET_A(var A:Tset; n:integer);
 var
   i:integer;
 begin
  for i:=1 to n do
   begin
    write('input',i,':');
    readln(A[i]);
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
    readln(B[i]);
   end;
 end;
procedure printSET_B(var B:Tset; n:integer);
 var
   i:integer;
 begin
  for i:=1 to n do

    write(B[i]:5);


 end;

{procedure znahod_U(var U,A,B:Tset; n:integer);
 var
    i:integer;
 begin
  for i:=1 to n do

    U:=A;
   if B[i]<>A[i] then
    A:=B;

 end;

procedure print_U(var U:Tset; n:integer);
 var
    i:integer;
 begin
   for i:=1 to n do
    write(U[i]);
 end;   }

{procedure ob()}


begin
 clrscr;
  write('input the size of set-->');
  read(n);

  insertSET_A(A,n);
  printSET_A(A,n);
  writeln;
  insertSET_B(B,n);
  printSET_B(B,n);

{  znahod_U(A,B,U,n);
  print_U(U,n); }
 readln;
 readln;
end.