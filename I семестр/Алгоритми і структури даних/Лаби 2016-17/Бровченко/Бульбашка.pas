Procedure BubbleSort;
var 
  i,j : Integer;
  x : Item;
begin
  for i := 1 to n-1 do
  for j := 2 to n do
    if a[j-1].key > a[j].key then begin {ξαμ³ν}
      x := a[j];
      a[j] := a[j-1];
      a[j-1] := x;
  end;
end;