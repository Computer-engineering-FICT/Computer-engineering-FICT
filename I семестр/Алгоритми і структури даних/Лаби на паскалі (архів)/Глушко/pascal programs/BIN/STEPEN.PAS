program stepen;
var y, x,flag,f2: integer;
    k: longint;
    s:real;
begin
 writeln('enter x');
 readln(x);
 writeln('enter y');
 readln(y);

 if (y>0)
  then flag:=1
  else flag:=0;
 y:=abs(y);
 k:=1;
 s:=1;
 f2:=0;

 if (y=0) then
  if (x=0)  then
   writeln('wrong variables')
   else writeln('s=1')
 else
  if (x=0) then
   writeln('s=0')
   else

    begin
     f2:=1;
     while (y<>1) do
      begin
       if (y mod 2)=0 then
        begin
         x:=x*x;
         y:=trunc(y/2);
        end
       else
        begin
         k:=k*x;
         y:=y-1;
        end;
       end;
    end;
 if f2=1 then begin
 if (flag=1)
  then s:=x*k
  else s:=1/(x*k);
 writeln(s:0:3);
 end;

 readln;

end.