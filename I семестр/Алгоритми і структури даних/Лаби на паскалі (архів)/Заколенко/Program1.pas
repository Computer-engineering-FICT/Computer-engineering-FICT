Program My_Spisok;
  Type
    ref=^item;
    item=record
      key:real;
      next:ref;
    end;
  Var
    n:integer;
    a:real;
    p,q:ref;
  Procedure FormSpisok(var n1:integer;var q1,p1:ref);
    var
      z:integer;
    begin
      write('Enter the n=');
      read(n1);
      z:=n1;
      p1:=nil;
      while z>0 do
        begin
          new(q1);
          q1^.next:=p;
          p1:=q1;
          writeln('Enter the component');
          read(q1^.key);
          z:=z-1
        end;
    end;
  Procedure Vuvod(q1,p1:ref);
    begin
      writeln('Spisok:');
      while p1<>nil do
        begin
          writeln(p1^.key);
          p1:=p1^.next;
        end;
    end;
  Procedure Poisk(q1:ref;n1:integer;var a1:real);
    var
      i:integer;
    begin
      i:=1;
      writeln('Enter the qvantil');
      read(a);
      while (q1<>nil) and (q1^.key<>a)  do
        begin
          q1:=q1^.next;
          i:=i+1;
        end;
      if n1>=i then writeln('the position of qvantil is ',i)
        else writeln('not found');
    end;
  begin
    FormSpisok(n,q,p);
    Poisk(q,n,a);
    Vuvod(q,p);
  end.