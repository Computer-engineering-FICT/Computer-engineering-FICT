program sinTeil;

var
    c,t,denom : int64;
    a,x,num,r : real;
const
    pi = 6.28318530717958647692;
begin
    write('Enter the number you want to get sine: ');
    readln(x);
    write('Enter the accuracy of calculation: ');
    readln(a); 
    
    while x > pi do
        x := x - pi;        
    while x < -pi do
        x := x + pi;
        
    num := -1/x;
    t := 0;
    denom := 1;
    r := 0;
    
    num := x;
    t := 2;
    denom := 1;
    r := x;
    c := 0;
    while abs(num/denom) >= a do
        begin
            num := num * x * x * (-1);
            denom := denom * t * (t + 1);
            t := t + 2;
            r := r + (num/denom);
            c := c + 1;
        end;
        
    writeln('My program returns:      Sin(',x,') = ',r); 
    writeln('Pascal function returns: Sin(',x,') = ',sin(x));
    writeln('The number of items: ',c);
end.