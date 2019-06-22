unit degree2;
interface
type
    pFunc = function(x:real; y:integer):real;
    pProc = procedure(var x:real; var y:integer; f:pFunc);
var
    step : pFunc;
    writeln : pProc;
    
implementation
function step(x:real; y:integer):real;
var
    r :real;
    i : integer;
begin
    r := 1;
    if x = 0 then
        begin
            if y > 0 then
                Degree := 0.0
        end
    else
        if y = 0 then
            Degree := 1.0
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
                Degree := r;
            end;
end;
procedure writeln(var x:real; var y:integer; f:pFunc);
var
    r:real;
begin
    write('Enter x: ');
    readln(x);
    write('Enter y: ');
    readln(y);
    write('The result is ', f(x,y),#10)
end;

begin
end.