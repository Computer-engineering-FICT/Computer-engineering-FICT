program RandomArray;
var
    f : file of real;
    i : integer;
begin
    assign(f, 'input.txt');
    rewrite(f);
    randomize();
    for i := 1 to 7 do
        write(f, 2, 4, 9, 15, 20, 25, 30);
end.