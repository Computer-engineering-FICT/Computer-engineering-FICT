procedure StraightSelection;
var 
  i,j,k : Integer;
  r : Item;
begin
  for i := 1 to n-1 do {номер мінімуму} begin
    k := i; { шукати min серед a[i]..a[n] }
    for j := i+1 to n do
      if a[k] > a[j].key then begin
        k := j;
      end;
    {Тут a[k] - найменше з a[i]..a[n]}
    {Тепер обмін}
    if k <> i then begin
      r := a[k];
      a[k] := a[i];
      a[i] := r;
    end;
  end;
end;