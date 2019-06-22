program Degree;
uses utils;

var
    x,r:real;
    i,y:integer;
    st:integer;
    c:integer;
begin
{
    write('Enter x: ');
    readln(x);
    write('Enter y :');
    readln(y);
}
    st:=milliseconds();
    randomize();
    for c := 0 to 100000 do
        begin
            x := random()*100;
            y := random(1,100);   
    r := 1;
    write('c = ', c,'       ');
    
    if x = 0 then
        if y = 0 then
            writeln('0^0 doesn''t exist!')
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
            end;
            
        end;
    writeln('Time: ',(milliseconds()-st))
end.
        