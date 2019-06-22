program Degree;

var
    x,r:real;
    i,y:integer;
begin
    r := 1;

    write('Enter x: ');
    readln(x);
    write('Enter y :');
    readln(y);
    
    if x = 0 then
        if y = 0 then
            writeln('0^0 doesn''t exist!')
        else 
        if y < 0 then
            writeln('0^',y,' doesn''t exist!')
        else
            writeln(x,'^',y,' = ',0)
    else
        if y = 0 then
            writeln(x,'^',y,' = ',1)
        else
            begin
                if y > 0 then
                    for i := 1 to y do
                        r:=r*x
                else
                    begin
                        for i := -1 downto y do
                            r:=r*x;
                        r := 1/r
                    end;
                writeln(x,'^',y,' = ', r)
            end
end.
        