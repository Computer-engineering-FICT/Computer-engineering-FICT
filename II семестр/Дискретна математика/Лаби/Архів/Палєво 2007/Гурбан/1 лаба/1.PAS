uses crt;

const n = 10;

type
    vector = array [1..n] of integer;

var
   U,A,B:vector;

procedure input (var a:vector);
          var i,n:integer;
          begin
               writeln('vvedite razmernost');
               readln(n);
               writeln('vvedite ',n,' chisel');
               for i:=1 to n do
                   readln(a[i]);
          end;

procedure print (a:vector);
          var i:integer;
          begin
               writeln('Print vector');
               for i:=1 to n do
                   write(a[i],' ');
               writeln;
          end;

procedure operation (var a,b,c:vector);
          var A1,dA,B1,dB:vector;
          begin
               write('-A ^ A ^ -B ^ B = ');
              {writeln('dA - A1 := 0');}
              {writeln('dB - B1 := 0');}
               if 0-0=0 then
                  write('pustoe mnozhestvo');
          end;

begin
     clrscr;
     writeln('vvedite universum');
     input(U);
     print(U);
     writeln;
     writeln('vvedite mnozhestvo A');
     input(A);
     print(A);
     writeln;
     writeln('vvedite mnozhestvo B');
     input(B);
     print(B);
     writeln;
     writeln('REZULTAT');
     operation (U,A,B);
     readln;
end.