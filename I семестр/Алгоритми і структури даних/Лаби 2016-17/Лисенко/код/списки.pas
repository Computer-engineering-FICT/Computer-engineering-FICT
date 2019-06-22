const
  Error=42;
type
  point = ^Node_type;
  Node_type=record
    number: integer;
    next: point;
  end;
var
  i: integer;
  start,tmp: point;
  node: Node_type;
  
begin
  new(start);
  for i:=1 to 10 do begin
    node.number:=i;
    if i<>10 then begin
      new(tmp);
      node.next:=tmp;
      node:=node.next^;
    end
  end;
  node.next:=nil;
end.