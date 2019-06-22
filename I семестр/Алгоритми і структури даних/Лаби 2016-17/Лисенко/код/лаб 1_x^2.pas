var 
  a,b,c,x1,x2,imx,rex,D,Ds: real;
begin
write('a = ');
read(a);
write('b = ');
read(b);
write('c = ');
read(c);
writeln(a+'x² + '+b+'x + '+c+' = 0');
if a=0 then begin
  if b=0 then begin
    if c=0 then writeln('x є R')
    else writeln('None')
  end
  else begin
    x1:=0-c/b;
    writeln('x = ',x1)
  end;
end
else begin
  D:=b*b-4*a*c;
  if D>0 then begin
    Ds:=sqrt(D);
    x1:=(0-b+Ds)/2/a;
    x2:=(0-b-Ds)/2/a;
    writeln('x1 = ',x1,', x2 = ',x2)
  end
  else begin
    if D=0 then begin
      x1:=0-b/2/a;
      writeln('x = ',x1)
    end
    else begin
      Ds:=sqrt(abs(D));
      rex:=0-b/2/a;
      imx:=abs(Ds/2/a);
      writeln('x1 = ',rex,'+j',imx,', x2 = ',rex,'-j',imx)
    end
  end
end
end.
