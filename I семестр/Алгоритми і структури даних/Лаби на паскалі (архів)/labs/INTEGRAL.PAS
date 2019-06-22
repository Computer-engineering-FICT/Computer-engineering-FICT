Program Integral;
  var
    m : integer;
    a, b, e, s: real;

  Function f(x: real):real;
  begin
    f := sin(x * x)-0.25*x;
  end;
  
 Procedure rect_l(a, b, e: real; var s2: real; var m: integer);
    var
      i: integer;
      s1, x, r, h: real;
    begin
      m := 1;
      s1 := (b - a) * f(a);
      repeat
        m := m * 2;
        h := (b - a)/m;
        s2 := 0.0;
        x := a;
        for i := 0 to m - 1 do
          begin
           s2 := s2 + f(x);
           x := x + h;
          end;
        s2 := s * h;
        r := abs(s2 - s1);
        s1 := s2;
      until r <= e;
    end;

  Procedure rect_m(a, b, e: real; var s2: real; var m: integer);
    var
      i: integer;
      s1, x, r, h: real;
    begin
      m := 1;
      s1 := (b - a) * f((a + b)/2);
      repeat
        m := m * 2;
        h := (b - a)/m;
        x := a + h/2;
        s2 := 0.0;
        for i := 0 to m - 1 do
          begin
            s2 := s2 + f(x);
            x := x + h;
          end;
        s2 := s2 * h;
        r := abs(s2 - s1);
        s1 := s2;
      until r <= e;
    end;
    
  Procedure rect_r(a, b, e: real; var s2: real; var m: integer);
    var
      i: integer;
      s1, x, r, h: real;
    begin
      m := 1;
      s1 := (b - a) * f(b);
      repeat
        m := m * 2;
        h := (b - a)/m;
        x := a + h;
        s2 := 0.0;
        for i := 1 to m do
          begin
            s2 := s2 + f(x);
            x := x + h;
          end;
        s2 := s2 * h;
        r := abs(s2 - s1);
        s1 := s2;
      until r <= e;
    end;

  Procedure trap(a, b, e: real; var s2: real; var m: integer);
    var
      i: integer;
      s1, x, r, h: real;
    begin
      m := 1;
      s1 := (b - a)/2 * (f(a) + f(b));
      repeat
        m := m * 2;
        h := (b - a)/m;
        x := a;
        s2 := 0.0;
        for i := 0 to m - 1 do
          begin
            s2 := s2 + f(x);
            x := x + h;
          end;
        s2 := (s2 + (f(a) + f(b))/2) * h;
        r := abs(s2 - s1);
        s1 := s2;
      until r <= e;
    end;

  
  procedure simpson(a, b, e: real; var s2: real; var m: integer);
  var
    i: integer;
    s1, x, r, h: real;
  begin
    m := 1;
    s1 := (b - a) / 3 * (f(a) + f(b));
    repeat
      m := m * 2;
      h := (b - a) / m;
      x := a;
      s2 := 0.0;
      for i := 0 to m - 1 do
      begin
        s2 := s2 + f(x) + 4 * f(x + h/2.0) + f(x + h);
        x := x + h;
      end;
      s2 := s2 * h / 6;
      r := abs(s2 - s1);
      s1 := s2;
    until r <= e;
  end;

  procedure bode(a, b, e: real; var s2: real; var m: integer);
  var
    i: integer;
    d, h , r, s1, x: real;
  begin
    m := 1;
    s1 := 1/90 * (b - a) * (7 * f(a) + 32 * f((3 * a + b)/4) + 12 * f((a + b)/2) + 32 * f((3 * b + a)/4) + 7 * f(b));
    repeat
      m := m * 2;
      h := (b - a) / m;
      x := a + h;
      s2 := 0.0;
      d := h/4;
      for i := 1 to m do
      begin
        s2 := s2 + (7 * f(a + x) + 32 * f(a + x - d) + 12 * f(a + x - 2 * d) + 32 * f(a + x - 3 * d) + 7 * f(a + x - 4 * d));
        x := x + h;
      end;
      s2 := s2 * 2 * d/45;
      r := abs(s2 - s1);
      s1 := s2;
    until r <= e;
  end;

  begin
    write('a = ');
    read(a);
    write('b = ');
    read(b);
    write('e = ');
    read(e);
    rect_l(a, b, e, s, m);
    writeln('Rect_l = ', s:12:10, '  m = ', m);
    rect_m(a, b, e, s, m);
    writeln('Rect_r = ', s:12:10, '  m = ', m);
    trap(a, b, e, s, m);
    writeln('Rect_m = ', s:12:10, '  m = ', m);
    rect_r(a, b, e, s, m);
    writeln('Trap =   ', s:12:10, '  m = ', m);
    simpson(a, b, e, s, m);
    writeln('Simpson= ', s:12:10, '  m = ', m);
    bode(a, b, e, s, m);
    writeln('Bode =   ', s:12:10, '  m = ', m);
  end.