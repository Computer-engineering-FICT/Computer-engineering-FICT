program matricu;
uses crt;
type tindex=1..4;
     tarray=array[tindex] of integer;
     tmatrix=array[tindex] of tarray;
var
  j,i,n,h:tindex; w:tarray; m,q,c,s:tmatrix; k:integer;
  begin
    write ('Vvedite razmer matricu: ');
    readln (n);
    writeln ('Vvodite matricy: ');
    for i:=1 to n do
    begin
      for j:=1 to n do
      read (m[i,j]);
     readln;
    end;
    readln;
    writeln ('Vvodite matricy: ');
    for i:=1 to n do
    begin
      for j:=1 to n do
      read (q[i,j]);
     readln;
    end;

    for i:=1 to n do
    begin

      for j:=1 to n do
      begin
        k:=0;
        for h:=1 to n do
            k:=k+m[i,h]*q[h,j];
        c[i,j]:=k;
      end;
    end;

    for i:=1 to n do
    begin
    for j:=1 to n do
    write (c[i,j]:4);
    writeln;
    end;
    writeln;
    writeln ('Transponovana matrucya M: ');
    for i:=1 to n do
    begin
    for j:=1 to n do
    begin
    s[i,j]:=m[j,i];
    write (s[i,j]:2);
    end;
    writeln;

   end;
    readln;
  end.