Program Power2;
  var a,S,x:real;
      n,y:integer;
  begin
  write('enter x,x=');
  read(x);
  write('enter y,y=');
  read(y);
  if x=0 then
    if y<=0 then writeln('Uncertainly')
      else
        begin
          S:=0;
          writeln('S=',S);
        end
    else
      begin
       S:=1;
       n:=abs(y);
       a:=x;
       while n>0 do
         begin
           if n mod 2=1 then S:=S*a;
           a:=a*a;
           n:=n div 2;
         end;
       if y>=0 then writeln('S=',S)
         else
           begin
             S:=1/S;
             writeln('S=',S);
           end;
      end;
  end.
