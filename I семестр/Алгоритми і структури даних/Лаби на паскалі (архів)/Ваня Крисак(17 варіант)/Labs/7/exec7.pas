unit exec7;
interface
type
    pFunc = function (a:real;b:real):real;
    oFunc = function (f:pFunc; g:pFunc):real;
var
    a,b:real;
    
procedure exec(f1:oFunc; f2:pFunc; f3:pFunc; var a:real; var b:real);
function umn(f:pFunc; g:pFunc):real;
function add(a:real;b:real):real;
function sub(a:real;b:real):real;

implementation

function umn(f:pFunc; g:pFunc):real;
begin
    umn := f(a,b)*g(a,b);
end;

function add(a:real;b:real):real;
begin
    add := a+b;
end;
function sub(a:real;b:real):real;
begin
    sub := a-b;
end;

procedure exec(f1:oFunc; f2:pFunc; f3:pFunc; var a:real; var b:real);
var
    r : real;
begin
    write('Enter a: ');
    readln(a);
    write('Enter b: ');
    readln(b);
    r := f1(f2,f3);
    writeln('Result is ',r);
end;
begin
end.