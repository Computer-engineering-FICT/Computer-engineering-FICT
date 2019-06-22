Program Skorost;
  var
    V,d,n:real;
    m:text;
  begin
    write('Enter the d, d=');
    read(d);
    write('Enter the n, n=');
    read(n);
    V:=0.00314*d*n;
    writeln('V=',V);
    assign(m,'d:\1.txt');
    rewrite(m);
    writeln(m,'d=',d,'; ','n=',n,'; ','V=',V,'.');
    close(m)
  end.