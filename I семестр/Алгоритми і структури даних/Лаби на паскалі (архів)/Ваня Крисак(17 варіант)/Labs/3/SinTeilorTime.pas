program sinTeil;
uses utils;

var
    i,j,st : integer;
    c,t,denom : int64;
    a,x,num,r : real;
begin
{
    write('Enter the number you want to get sine: ');
    readln(x);
    write('Enter the accuracy of calculation: ');
    readln(a);
}
    
    randomize();
    st := milliseconds();
    for i := 0 to 10000 do begin
    x := random()*3.1415;
    t := random(0,5);
    a := 1/(10*t);
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
    //writeln('Pascal function returns: Sin(',x,') = ',sin(x));
    writeln('The number of items: ',c);
    end;
    writeln('Time: ', milliseconds()-st);
end.