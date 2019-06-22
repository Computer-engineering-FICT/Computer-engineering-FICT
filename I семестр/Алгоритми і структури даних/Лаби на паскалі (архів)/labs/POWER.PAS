Program Power;
 var
   x, x1, s: real;
   y, y1, y2, i: integer;
 begin
   writeln('Enter x >= 0 and y');
   read(x, y);
   x1:=x;
   y1:=y;
   y2:=y;
   if x1 = 0
     then
     begin
       if y1 > 0
         then
           begin
             s := 0;
             writeln(s);
           end
         else
           writeln('No solutions');
     end
     else
      begin
        s:=1;
        if y1 = 0
          then
            writeln(s)
          else
          begin
            y1:=abs(y1);
            i:=1;
            while i<=y1 do
              begin
                s:=s*x1;
                i:=i+1;
              end;
            if y2 < 0
              then
                s:=1/s;
            writeln('');
            writeln(s);
            writeln('');
          end;
      end;
 end.