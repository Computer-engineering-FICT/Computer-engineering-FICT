procedure StraightInsertion (var a : Items);
var 
  i,j,k: integer; 
  x: Item;
begin
  for i :=2 to n do begin
    x := a[i]; j := 1;
    while x.key > a[j].key do inc(j);
    if j < i then {є дірка!} begin
      for k := i downto j+1 do
        a[k] := a[k-1];
      a[k-1] := x;
    end;
  end;
end