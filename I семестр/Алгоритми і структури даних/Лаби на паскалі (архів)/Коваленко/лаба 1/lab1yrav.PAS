program kvadratnoe_yravnenie;
var a,b,c,d,x,x1,x2,rex1,rex2,imx1,imx2:real;
begin
writeln('vvedite a,b,c');
readln(a,b,c);
  if a=0 then
         begin if b=0 then
                      begin if c=0 then writeln('toschdestvo')
                        else writeln('neravenstvo');
                      end
                      else if c=0 then
                        begin
                          x:=0;
                          writeln('x=',x:2:1)
                          end
                      else
                        begin
                          x:=(-c)/b;
                          writeln('x=',x:2:1);
                          end
         end
       else
         begin
           d:=b*b-4*a*c;
             if d>=0 then
               begin
                 x1:=(-b+sqrt(d))/(2*a);
                 x2:=(-b-sqrt(d))/(2*a);
                 writeln('x1:=',x1:2:1,'  ','x2=',x2:2:1);
               end
             else
               begin
                 rex1:=(-b)/(2*a);
                 rex2:=rex1;
                 imx1:=sqrt(-d)/(2*a);
                 imx2:=-imx1;
                 writeln('X1=',rex1:2:1,'+',imx1:2:1,'*i');
                 writeln('X2=',rex2:2:1,'+',imx2:2:1,'*i');
               end;
end;
readln;
end.

