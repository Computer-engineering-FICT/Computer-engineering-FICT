Program sinus;
Var a, x, e, t, y, f, q : real;
i: integer;
Begin
  Writeln ('Input x');
  Readln (x);
  Writeln ('You input x in degrees (1) or radians (2) ?');
  Readln (a);
    If a=1 then
             x:=(pi*x/180);
             t:=abs(x);
             while t>2*pi do
                         t:=t-2*pi;
                         Writeln ('Enter accuracy e');
                         Readln (e);
                         y:=t;
                         f:=t*t;
                         i:=3;
                         q:=t;
                         while abs(y)>=e do
                         Begin
                          y:=(-y*f)/(i*(i-1));
                          q:=q+y;
                          i:=i+2;
                         End;
                           If x<0 then
                                  q:=-q;       
                          Writeln ('The value determined using this algorithm: sin (', x,') = ', q);       
                        
                         
End.
