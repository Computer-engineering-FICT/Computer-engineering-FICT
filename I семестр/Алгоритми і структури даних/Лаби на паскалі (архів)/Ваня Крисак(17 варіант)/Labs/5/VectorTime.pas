program vector;
uses utils;
const
    c = 1000;
type
    tI = 1..c;
    tArray = array [tI] of real;
var
    a : tArray;
    t : real;
    e : char;
    
procedure read(var a : tArray);
var
    f : file;
    i : tI;
begin
    assign(f, 'input.txt');
    reset(f);
    for i := 1 to c do
        read(f, a[i]);
end;

procedure write(a : tArray);
var
    i, j : tI;
begin
    writeln;
    for i := 0 to c div 5 - 1 do
        begin
            for j := 1 to 5 do
                write(a[i*5+j], ' ');
            writeln();
        end;
    writeln;
end;

procedure sort(var a : tArray; b : boolean);
var
    i, j, mi : tI;
    mr, t : real;
    st : integer;
begin
    st := milliseconds();
    for i := 1 to c do
        begin
            if b then
                mr :=  100000.0
            else
                mr := -100000.0;
            mi := -1;
            for j := i to c do
                if b then
                    begin
                        if mr > a[j] then
                            begin
                                mr := a[j];
                                mi := j;
                            end
                    end
                else
                    begin
                        if mr < a[j] then
                            begin
                                mr := a[j];
                                mi := j;
                            end;  
                    end;
            t := a[mi];
            a[mi] := a[i];
            a[i] := t;
        end;
    writeln('Time: ', milliseconds() - st);
end;

function max(a : tArray) : tI;
var
    i, mi : tI;
    mr : real;
    st: integer;
begin
    st := milliseconds();
    mr := -10000;
    for i := 1 to c do
        if (mr < a[i]) then
            begin
                mi := i;
                mr := a[i];
            end;
    max := mi;
    writeln('Time: ', milliseconds() - st);
end;

function min(a : tArray) : tI;
var
    i, mi : tI;
    mr : real;
    st : integer;
begin
    mr := 10000;
    st := milliseconds();
    for i := 1 to c do
        if (mr > a[i]) then
            begin
                mi := i;
                mr := a[i];
            end;
    min := mi;
    writeln('Time: ', milliseconds() - st);
end;

procedure search(a : tArray);
var
    t : real;
    n : integer;
    i : tI;
    st : integer;
begin
    writeln;
    write('Enter your number: ');
    readln(t);
    st := milliseconds();
    for i := 1 to c do
        if (a[i] < t + 0.001) and (a[i] > t - 0.001) then
            begin
                n := i;
                break;
            end;
    if not (n = 0) then
        writeln('The position of ', t, ' is ', n)
    else
        writeln('There aren''t such an element at the array.');
        writeln('Time: ', milliseconds() - st);
    writeln; 
end;

begin
    read(a);    
    repeat
        writeln('Choose the option to do: ');
        writeln('   1 -- To show the array.');
        writeln('   2 -- To sort the array(min to max).');
        writeln('   3 -- To sort the array(max to min).');
        writeln('   4 -- To find a number in the array.');
        writeln('   5 -- To find a maximum number in the array.');
        writeln('   6 -- To find a minimum number in the array.');
        writeln('   7 -- To close the program.');
        write('Your choise is: ');
        readln(e);    
        case e of
            '1':write(a);
            '2':sort(a,true);
            '3':sort(a,false);
            '4':search(a);
            '5':writeln(#10, 'The maximum number is a[', max(a), '] = ', a[max(a)], #10);
            '6':writeln(#10, 'The minimum number is a[', min(a), '] = ', a[min(a)], #10);
        end;
    until e = '7';
end.