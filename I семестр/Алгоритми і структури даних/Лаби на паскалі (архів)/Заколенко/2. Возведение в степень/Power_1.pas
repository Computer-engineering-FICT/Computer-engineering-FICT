Program Power1;
  var
    i,n,y:integer;
    S,x:real;
  begin
  write('enter x,x=');
  read(x);
  write('enter y,y=');
  read(y);
  if x=0 then if y<=0 then writeln('Uncertainty')
                else begin
                       S:=0;
                       writeln('S=',S);
                     end
    else begin
           S:=1;
           n:=abs(y);
           for i:=1 to n do S:=S*x;
           if y>=0 then writeln('S=',S)
             else begin
                    S:=1/S;
                    writeln('S=',S);
                  end;
         end;
  end.
