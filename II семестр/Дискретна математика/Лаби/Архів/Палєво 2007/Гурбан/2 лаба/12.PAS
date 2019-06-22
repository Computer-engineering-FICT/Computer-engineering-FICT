uses crt;

const n = 10;

type
    vector = array [1..n] of integer;

var
   A,B,C:vector;
   n1,n2:integer;

procedure input (var a:vector; var n1:integer);
          var i:integer;
          begin
               writeln('vvedite razmernost');
               readln(n1);
               writeln('vvedite ',n1,' chisel');
               for i:=1 to n1 do
                   readln(a[i]);
          end;

procedure print (a:vector;n1:integer);
          var i:integer;
          begin
               writeln('Print vector');
               for i:=1 to n1 do
                   write(a[i],' ');
               writeln;
          end;

procedure system (var a,b,c:vector; n1:integer);
          var i:integer;
          begin
               if nA = C then writeln ('x = U');
                  else
                      begin
                           if A >< pm then writeln ('RESHENII NET');
                              else
                                  begin
                                       if B<=C then writeln ('x = B v Cnb');
                                          else writeln ('RESHENII NET');
                                  end;
                      end
          end;

begin
     clrscr;
     writeln('vvedite mnozhestvo A');
     input(A,n1);
     print(A,n1);
     writeln;
     writeln('vvedite mnozhestvo B');
     input(B,n2);
     print(B,n2);
     writeln;
     writeln('vvedite mnozhestvo C');
     input(C,n2);
     print(C,n2);
     writeln;
     system(a,b,c,n1,n2);
     print(a,b,c,n1,n2);
     writeln;
     readln;
end.