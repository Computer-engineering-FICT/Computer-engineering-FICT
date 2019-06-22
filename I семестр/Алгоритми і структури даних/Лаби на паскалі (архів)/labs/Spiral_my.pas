Program spiral;
  type
    TIndex = 1 .. 50;
    TMatrix = array [TIndex, TIndex] of integer;
  var
    a: TMatrix;
    n: integer;   {розмір матриці}
    i, j: integer;
    x, y: integer;
    num: integer;
    add: integer;
    dir: integer;
  begin
    write('n = '); 
    readln(n);
    x := 0;
    y := 1;
    num := 1;
    Add := n;
    dir := 1;
    while (add <> 0) do
      begin
        i := 0;
        while (i <> add) do {вправо}
          begin
            x := x + dir;
            a[y, x] := num;
            num := num + 1;
            i := i + 1;
          end;
        i := 0;
        add := add - 1;
        while (i <> add) do {вниз}
          begin
            y := y + dir;
            a[y, x] := num;
            num := num + 1;
            i := i + 1;
          end;
        dir := dir * (-1); {змінюємо знак і теж саме вліво і вверх}
      end;
    for i := 1 to n do
      begin
        for j := 1 to n do
        write(a[i,j] : 4);
        writeln;
      end;
    readln;
  end.
 