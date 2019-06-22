program snow;
type
    tI = 1..100;
    tM = array[tI,tI] of integer;
var
    a, n : tI;
    m : tM;
    e,s : integer;
    
procedure circle(n : tI; var m : tM; var a : tI; var e : integer; s: integer);
var
    i : tI;
begin
    if a < n div 2+1 then
        for i := a to n-a+1 do
            begin
                m[a,i]:= e;
                e := e + s;
            end;
    if a < n div 2+1 then
        for i := a+1 to n-a+1 do
            begin
                m[i,n-a+1]:= e;
                e := e + s;
            end;
    if a < n div 2+1 then
        for i := n-a downto a do
            begin
                m[n-a+1,i]:= e;
                e := e + s;
            end;
    if a < n div 2+1 then
        for i := n-a downto a+1 do
            begin
                m[i,a]:= e;
                e := e + s;
            end;
    a := a + 1;
    if a < n div 2+1 then
            circle(n,m,a,e,s);
end;
    
procedure outs(n: tI; m : tM);
var
    i,j : tI;
begin
    for i := 1 to n do
        begin
            for j := 1 to n do
                write(m[i,j]:4);
            writeln();
        end
end;
    
begin
    n := 30;
    a := 1;
    e := 1;
    s := 1;
    circle(n,m,a,e,s);
    outs(n,m);
end.