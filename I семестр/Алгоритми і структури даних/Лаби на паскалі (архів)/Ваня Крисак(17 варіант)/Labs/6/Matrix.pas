program matrixMultip;

type
    index = 1..1000;
    matrix = array [index, index] of integer;
var
    a, b, c : matrix;
    sa, sb, sc : index;
    e : integer;
    
procedure readCons(var m : matrix; var s : index);
var
    i, j : index;
begin
    write('Enter the size of the matrix: ');
    readln(s);
    for i := 1 to s do
        for j := 1 to s do
            begin
                write('Enter the next [',i,',',j,'] element: ');
                readln(m[i,j]);
            end;
end;
    procedure writeCons(m : matrix; s : index);
var
    i, j : index;
begin
    for i := 1 to s do
        begin
            for j := 1 to s do
                write(m[i,j],' ');
            writeln;
        end
end;

procedure transparent(var m : matrix; s : index);
var
    i, j : index;
    t : integer;
begin
    for i := 1 to s do
        for j := i to s do
            begin
                t := m[i,j];
                m[i,j] := m[j,i];
                m[j,i] := t;
            end;
end;

procedure multip(a : matrix; sa : index; b : matrix; sb : index; var c : matrix; var sc : index);
var
    i, j, t : index;
begin
    if  sa = sb then
        begin
            sc := sa;
            for i := 1 to sa do
                for j := 1 to sb do
                    for t := 1 to sa do
                        c[i,j] := c[i,j] + a[i,t] * b[t,j];
            writeCons(c,sc)
        end
    else
        write('The matrixes can''t be muntiplicated.',#10);
end;

function diagonal(m : matrix; s : index) : integer;
var 
    i : index;
    r : integer;
begin
    
end;

begin
    repeat
    writeln(#10, 'Please, choose what to do: ');
    writeln('   1 -- to input the first matrix.');
    writeln('   2 -- to input the second matrix.');
    writeln('   3 -- to output the first matrix.');
    writeln('   4 -- to output the second matrix.');
    writeln('   5 -- transparation of the first matrix.');
    writeln('   6 -- transparation of the second matrix.');
    writeln('   7 -- to get A times B.');
    writeln('   8 -- to get B times A.');
    writeln('   0 -- to finish the program.');
    write('Your choise: ');
    readln(e);
    writeln;
    case e of
    1 : readCons(a,sa);
    2 : readCons(b,sb);
    3 : writeCons(a,sa);
    4 : writeCons(b,sb);
    5 : transparent(a,sa);
    6 : transparent(b,sb);
    7 : multip(a,sa,b,sb,c,sc);
    8 : multip(b,sb,a,sa,c,sc);
    end
    until (e = 0);
end.