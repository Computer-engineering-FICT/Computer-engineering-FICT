program power;

var
  x, S: real;
  y, p, i: integer;

begin
  write('����i�� ������ - �: '); read(x);
  write('����i�� ����i�� - �: '); read(y);
  if x=0 then
          if y>0 then 
                  begin
                    s:=0;
                    writeln('S = ', s);
                  end
                 else
                  writeln('����������� ������ ���')
         else
          begin
            S:=1;
            p:=abs(y);
            for i:=1 to p do
              if y<0 then S := S*(1/x)
                     else S := S*x;
              writeln('S = ', s);
          end;            
end.