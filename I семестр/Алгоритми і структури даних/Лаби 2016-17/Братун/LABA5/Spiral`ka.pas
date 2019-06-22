var
  a:array[1..100,1..100]of integer;
  i,imax,imin,j,jmax,jmin,k,m,n:integer;
begin
  write('Vvedite 4islo strok: ');
  readln(m);
  write('Vvedite 4islo stolbcov: ');
  readln(n);
  jmin:=1;
  jmax:=n;
  imin:=2;
  imax:=m;
  k:=0;
  repeat
    for j:=jmin to jmax do
    begin
      inc(k);
      a[imin-1,j]:=k;
    end;
    for i:=imin to imax do
    begin
      inc(k);
      a[i,jmax]:=k;
    end;
    dec(jmax);
    for j:=jmax downto jmin do
    begin
      inc(k);
      a[imax,j]:=k;
    end;
    dec(imax);
    for i:=imax downto imin do
    begin
      inc(k);
      a[i,jmin]:=k;
    end;
    inc(imin);
    inc(jmin);
  until k>=m*n;
  for i:=1 to m do
  begin
    writeln;
    for j:=1 to n do write(a[i,j]:3);
  end;
  readln;
end.
