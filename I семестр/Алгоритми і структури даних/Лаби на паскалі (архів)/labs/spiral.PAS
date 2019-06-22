Program spiral;

  type
    TAction = 1 .. 4;
    TIndex = 1 .. 100;
    TElement = 1 .. 10000;
    TElemArr = array [TIndex] of TElement;
    TMatrix = array [TIndex] of TElemArr;

  var
    sz, n, lim_left, lim_right, lim_top, lim_bottom, cur_x, cur_y, count, i,
    j: TIndex;
    action: TAction;
    matrix: TMatrix;

  procedure go_left;
    begin
      i := lim_right;
    while (i >= lim_left) {and (count <= n)} do
    begin
      matrix[i, cur_y] := count;
      dec(i);
      inc(count)
    end;
    cur_x := lim_left;
    dec(lim_bottom)
  end;

  procedure go_right;
  begin
    i := lim_left;
    while (i <= lim_right) {and (count <= n)} do
    begin
      matrix[i, cur_y] := count;
      inc(i);
      inc(count)
    end;
    cur_x := lim_right;
    inc(lim_top)
  end;

  procedure go_up;
  begin
    i := lim_bottom;
    while (i >= lim_top) {and (count <= n)} do
    begin
      matrix[cur_x, i] := count;
      dec(i);
      inc(count)
    end;
    cur_y := lim_top;
    inc(lim_left)
  end;

  procedure go_down;
  begin
    i := lim_top;
    while (i <= lim_bottom) {and (count <= n)} do
    begin
      matrix[cur_x, i] := count;
      inc(i);
      inc(count)
    end;
    cur_y := lim_bottom;
    dec(lim_right)
  end;

  procedure do_action(what_action: TAction);
  begin
    case what_action of
      1:
        go_right;
      2:
        go_down;
      3:
        go_left;
      4:
        go_up
    end
  end;

  begin
    readln(n);
    sz := n;
    n := n*n;
    lim_left := 1;
    lim_right := sz;
    lim_top := 1;
    lim_bottom := sz;
    cur_x := sz;
    cur_y := 1;
    action := 4;
    count := 1;
    while count <= n do
    begin
      inc(action);
      if action = 5 then
        action := 1;
      do_action(action)
  end;
 
  for i := 1 to sz do
  begin
    for j := 1 to sz do
      write(matrix[j, i], '  ');
    writeln
  end;
  readln

end.
