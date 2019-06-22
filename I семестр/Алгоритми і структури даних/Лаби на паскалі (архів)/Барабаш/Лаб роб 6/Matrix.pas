program MatrixProg;

  type Tindex=1..20;
       Vector=array [Tindex] of integer;
       Matrix=array [Tindex] of vector;
       
  var  a,b,c:matrix;
       action:integer;
       n,n1,m:tindex;
       
 procedure MatrixInputA (var a:Matrix);
 var i,j:integer;
  begin
     writeln('����i�� ',m*n,' �������i�');
     for i:=1 to m do
       for j:=1 to n do
         begin
            write('a[',i,'.',j,'] = ');
            read(a[i,j]);
         end;
  end;
  procedure MatrixInputB (var b:Matrix);
  var i,j:integer;
    begin
     writeln('����i�� ������� �');
     write('����i�� �i���i��� ������i�: ');read(n1);
     writeln('����i�� ',n*n1,' �������i�');
     for i:=1 to n do
       for j:=1 to n1 do
         begin
            write('b[',i,'.',j,'] = ');
            read(b[i,j]);
         end;
  end;
procedure MatrixOutput (var a:Matrix; n,n1:integer);
  var i,j:integer;
    begin
      writeln('���������');
      for i:=1 to n do
        begin
          for j:=1 to n1 do 
            write(a[i,j],'  ');
            writeln;
 end;
    end;

procedure MatrixTranspose (var a:matrix; var m,n:tindex);
 var i,j,temp,max:integer;
   begin
       if m>=n then max:=m else max:=n;
       for i:=1 to max-1 do
         for j:=i+1 to max do
          begin
           temp:=a[i,j];
           a[i,j]:=a[j,i];
           a[j,i]:=temp;
          end;
       temp:=n;
       n:=m;
       m:=temp;
   end;
 procedure MatrixMultiply (var c:matrix);
  var s,k,i,j:integer;
    begin
      for i:=1 to m do
        for j:=1 to n1 do
          begin
          s:=0;
            for k:=1 to n do
              s:=s+a[i,k]*b[k,j];
            c[i,j]:=s;
          end;
    end;
begin
  write('����i�� �i���i��� ����i�: ');read(m);
  write('����i�� �i���i��� ������i�: ');read(n);
  MatrixInputA(a);
  writeln('�����i�� �i�:');
  writeln('             1. ������������ �������');
  writeln('             2. ��������� ������� � �� ������� B');
  write('��� ���i�: ');read(action);
      case action of
        1: begin
            MatrixTranspose(a,m,n);
            MatrixOutput(a,m,n);
           end;
        2: begin
            MatrixInputB(b);
            MatrixMultiply(c);
            MatrixOutput(c,m,n1);
           end;
        end;
end.