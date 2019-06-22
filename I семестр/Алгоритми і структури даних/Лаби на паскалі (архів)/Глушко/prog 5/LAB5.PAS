 program lab5;
        type Tindex= 1..100;
             Tvector= array [Tindex] of integer;
        var V:Tvector;
            i,j,n:Tindex;
        x,k,M,buf,first,last:integer;
            found,f: boolean;
procedure input;
begin
     writeln ('Vvedite dlinu vektora');
     readln (n);
            for i:=1 to n do
            begin
            writeln('Vvedite_',i,'_element massiva');
            readln (V[i]);
            end;
            end;{input}
procedure sort;
begin
       repeat
      found:=false;
      for j:=1 to n-1 do
        begin
       if V[j+1] < V[j] then
       begin
       found:= true;
       buf:=V[j];
       V[j]:= V[j+1];
       V[j+1]:= buf;
       end;
       end;
       until not found;
       for j:=1 to n do
      write (V[j],' ');
end;{sort}
procedure find;
begin
          first:=1;
          last:=n;
      writeln ('vvedite element');
      read(x);
      while first<=last do
       begin
         M:=1+(last-first)div 2;
      if x < V[M] then
      last:=M-1
      else
          if x>V[M] then first:=M+1
      else break;
       end;
       writeln('nomer iskomogo elementa',M);
end;{find}


BEGIN
     input;
writeln;
     sort;
     writeln;
     find;
      readln;
END.


