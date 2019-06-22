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
     writeln('¬ведiть ',m*n,' елементiв');
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
     writeln('¬ведiть матрицю ¬');
     write('¬ведiть кiлькiсть стовпцiв: ');read(n1);
     writeln('¬ведiть ',n*n1,' елементiв');
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
      writeln('–≈«”Ћ№“ј“');
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
  write('¬ведiть кiлькiсть р€дкiв: ');read(m);
  write('¬ведiть кiлькiсть стовпцiв: ');read(n);
  MatrixInputA(a);
  writeln('¬иберiть дiю:');
  writeln('             1. “ранпонувати матрицю');
  writeln('             2. ѕомножити матрицю ј на матрицю B');
  write('¬аш вибiр: ');read(action);
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