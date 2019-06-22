program integral;

function F(z: real): real;
begin
  F:=z*z;
end;

var
  a,b,e,s1,s2,h,r,d,riz: real;
  i,m,metod,k,j:integer;
begin
  write('Лiва границя - a = ');read(a);
  write('Права границя - b = ');read(b);
  write('Похибка - e = ');read(e);
  writeln(' ');
  write('Виберiть метод:');
  writeln(' 1 - метод лiвих прямокутникiв');
  writeln('                2 - метод правих прямокутникiв');
  writeln('                3 - метод середнiх прямокутникiв');
  writeln('                4 - метод трапецiї');
  writeln('                5 - метод парабол');
  writeln('                6 - метод Баде');
  writeln(' ');
  write('Ваш вибiр: ');read(metod);
  case metod of
  1:
    begin
    m:=1;
    S1:=(b-a)*F(a);
    repeat 
      begin
        m:=m*2;
        h:=(b-a)/m;
        S2:=0;
        for i:=0 to m-1 do S2:=S2+F(a+i*h);
        S2:=S2*h;
        R:=abs(S2-S1);
        S1:=S2;
      end
    until r<=e;
    end;
  2:
    begin
      s1:=(b-a)*F(b);
      m:=1;
      repeat
        begin
        m:=m*2;
        h:=(b-a)/m;
        S2:=0;
        for i:= 1 to m do S2:=S2+F(b-i*h);
        S2:=S2*h;
        r:=abs(S2-S1);
        S1:=S2
        end
      until r <= e;
    end;
  3:
    begin
      s1:=(b-a)*F((a+b)/2);
      m:=1;
      repeat
       begin
          m:=m*2;
          h:=(b-a)/m;
          s2:=0;
          for i:= 0 to m-1 do S2:=S2+F(a+(i*h)+h/2);
          s2:=s2*h;
          r:=abs(s2-s1);
          s1:=s2;
       end;
    until r<=e;
    end;
  4:
    begin
    s1:=(b-a)*(F(a)+F(b))/2;
      m:=1;
      repeat
       begin
          m:=m*2;
          h:=(b-a)/m;
          s2:=0;
          for i:= 0 to m-1 do S2:=S2+F(a+i*h)+F(a+(i+1)*h);
          s2:=s2*h/2;
          r:=abs(s2-s1);
          s1:=s2;
       end;
      until r<=e;
    end;
  5:
    begin
      s1:=(b-a)*(F(a)+F(b))/3;
      m:=1;
      repeat
        m:=m*2;
        h:=(b-a)/m;
        s2:=0;
        for i:=0 to m do
        begin
          if (i=0) or (i=m) then k:=1
                            else
                              if (i mod 2)=0 then k:=2
                                             else k:=4;

          s2:=s2+k*f(a+i*h);
        end;
        s2:=s2*h/3;
        r:=abs(s1-s2);
        s1:=s2;
      until r<=e;
      end;
  6:
    begin
    m:=1;
    s1:=(b-a)*(f(b)+f(a));
    repeat
       m:=m*2;
       h:=(b-a)/m;
       d:=h/4;
       s2:=0;
       for i:=0 to m-1 do
         begin
             for j:=0 to 4 do
              begin
                  if (j=0) or (j=4) then k:=7
                  else if (j=1) or (j=3) then k:=32
                  else k:=12;
                  s2:=s2+k*f(a+(i*h)+(j*d));
              end;
        end;
     s2:=s2*2*d/45;
     r:=abs(s1-s2);
     s1:=s2;
     until r<=e; 
    end;  
  end;
    writeln(' ');
    writeln('Iнтеграл вiд ',a,' до ',b,' = ',s2:2:8);
    writeln('Кiлькiсть операцiй iнтегрування = ',m);
end.