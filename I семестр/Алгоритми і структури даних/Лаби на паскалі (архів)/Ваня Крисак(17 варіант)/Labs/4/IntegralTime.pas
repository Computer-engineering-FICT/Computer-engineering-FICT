program integral;

var
    n, t : integer;
    a, b, acc, r : real;
    
function f(x : real) : real;
begin
    f := x * x;
end;

procedure left(a : real; b : real; acc : real; var r1 : real; var n : integer);
var
    d, h, r2 : real;
    i : integer;
begin
    n  := 1;
    r1 := (b - a) * f(a);
    repeat 
      begin
        n := n * 2;
        h := (b - a) / n;
        r2 := 0;
        for i := 0 to n - 1 do 
            r2 := r2 + f(a + i * h);
        r2 := r2 * h;
        d := abs(r2 - r1);
        r1:=r2;
      end
    until d <= acc;
end;
procedure right(a : real; b : real; acc : real; var r1 : real; var n : integer);
var
    d, h, r2 : real;
    i : integer;
begin
    n  := 1;
    r1 := (b - a) * f(b);
    repeat 
      begin
        n := n * 2;
        h := (b - a) / n;
        r2 := 0;
        for i := 1 to n do 
            r2 := r2 + f(b - i * h);
        r2 := r2 * h;
        d := abs(r2 - r1);
        r1:=r2;
      end
    until d <= acc;
end;
procedure centre(a : real; b : real; acc : real; var r1 : real; var n : integer);
var
    d, h, r2 : real;
    i : integer;
begin
    n  := 1;
    r1 := (b - a) * f((a + b) / 2);
    repeat 
      begin
        n := n * 2;
        h := (b - a) / n;
        r2 := 0;
        for i := 0 to n - 1 do 
            r2 := r2 + f(a + (i * h) + (h / 2));
        r2 := r2 * h;
        d := abs(r2 - r1);
        r1:=r2;
      end
    until d <= acc;
end;
procedure trap(a : real; b : real; acc : real; var r1 : real; var n : integer);
var
    d, h, r2 : real;
    i : integer;
begin
    n  := 1;
    r1 := (b - a) * ((f(a) + f(b)) / 2);
    repeat 
      begin
        n := n * 2;
        h := (b - a) / n;
        r2 := 0;
        for i := 0 to n - 1 do 
            r2 := r2 + f(a + i * h) + f(a + (i + 1) * h);
        r2 := r2 * h / 2;
        d := abs(r2 - r1);
        r1:=r2;
      end
    until d <= acc;
end;
procedure simp(a : real; b : real; acc : real; var r1 : real; var n : integer);
var
    d, h, r2 : real;
    i : integer;
begin
    n  := 1;
    r1 := (b - a) * ((f(a) + f(b)) / 3);
    repeat 
      begin
        n := n * 2;
        h := (b - a) / n;
        r2 := 0;
        for i := 0 to n do 
            begin
                if (i=0) or (i = n) then
                    r2 := r2 + f(a + i * h)
                else
                    if i mod 2 = 0 then
                        r2 := r2 + 2 * f(a + i * h)
                    else
                        r2 := r2 + 4 * f(a + i * h);
            end;
        r2 := r2 * h / 3;
        d := abs(r2 - r1);
        r1:=r2;
      end
    until d <= acc;
end;
procedure bool(a : real; b : real; acc : real; var r1 : real; var n : integer);
var
    d, h, r2, t : real;
    i, j : integer;
begin
    r1 := (b - a) * (f(a) + f(b));
    repeat 
      begin
        n  := 1;
        n := n * 2;
        h := (b - a) / n;
        t := h / 4;
        r2 := 0;
        for i := 0 to n - 1 do 
            begin
                for j:=0 to 4 do
                    begin
                        if (j=0) or (j=4) then 
                            r2 := r2 + 7 * f(a + (i * h) + (j * t))
                        else 
                            if (j=1) or (j=3) then 
                                r2 := r2 + 32 * f(a + (i * h) + (j * t))
                            else 
                                r2 := r2 + 12 * f(a + (i * h) + (j * t));
                    end;
            end;
        r2 := r2 * 2 * t / 45;
        d := abs(r2 - r1);
        r1:=r2;
      end
    until d <= acc;
end;

begin
    write('Enter the start of the range: ');
    readln(a);
    write('Enter the finish of the range: ');
    readln(b);
    write('Enter the accuracy of the canculation: ');
    readln(acc);   
    t := milliseconds();
    left(a, b, acc, r, n);
    writeln('The result of left rectangle method is ', r);
    writeln('The number of additions is ', n);
    writeln('Time is ', milliseconds()-t);
    t := milliseconds();
    right(a, b, acc, r, n);
    writeln('The result of right rectangle method is ', r);
    writeln('The number of additions is ', n);
    writeln('Time is ', milliseconds()-t);
    t := milliseconds();
    centre(a, b, acc, r, n);
    writeln('The result of centre rectangle method is ', r);
    writeln('The number of additions is ', n);
    writeln('Time is ', milliseconds()-t);
    t := milliseconds();
    trap(a, b, acc, r, n);
    writeln('The result of trapezium method is ', r);
    writeln('The number of additions is ', n);
    writeln('Time is ', milliseconds()-t);
    t := milliseconds();
    simp(a, b, acc, r, n);
    writeln('The result of Simpson''s method is ', r);
    writeln('The number of additions is ', n);
    writeln('Time is ', milliseconds()-t);
    t := milliseconds();
    bool(a, b, acc, r, n);
    writeln('The result of Boole''s method is ', r);
    writeln('The number of additions is ', n);
    writeln('Time is ', milliseconds()-t);
end.