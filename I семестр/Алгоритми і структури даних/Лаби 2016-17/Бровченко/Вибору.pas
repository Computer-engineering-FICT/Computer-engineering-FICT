procedure StraightSelection;
var 
  i,j,k : Integer;
  r : Item;
begin
  for i := 1 to n-1 do {����� ������} begin
    k := i; { ������ min ����� a[i]..a[n] }
    for j := i+1 to n do
      if a[k] > a[j].key then begin
        k := j;
      end;
    {��� a[k] - �������� � a[i]..a[n]}
    {����� ����}
    if k <> i then begin
      r := a[k];
      a[k] := a[i];
      a[i] := r;
    end;
  end;
end;