uses GraphABC;
 var  x,y:integer;
begin
  for x:=0 to WindowWidth-1 do
  for y:=0 to WindowHeight-1 do
    SetPixel(x,y,RGB(2*x-y,x-3*y,x+y));
end.
