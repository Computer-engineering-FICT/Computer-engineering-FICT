
program lab8p;
uses lab8;
var
    n : tI;
    m : tM;
    v : tV;
begin
    n := 100;
    receiveM(n,m);
    FoutM(n,m,'f1.txt');
    FinCoutM(n,m,'f1.txt');
    writeln();
    receiveV(n,m,v);
    execV(n,v);
    FoutV(n,v,'f2.txt');
    FinCoutV(n,v,'f2.txt');
end.