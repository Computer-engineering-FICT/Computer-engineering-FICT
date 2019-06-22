Program MyArray;
 Type
   Tindex=1..10;
   Tarray=array[Tindex] of real;
 var
   i,N,k:Tindex;
   M:Tarray;
 Procedure InputArray(var N1:Tindex;var M1:Tarray);
   begin
     write('Input the size of array, N=');
     read(N1);
     writeln('Input the array');
     for i:=1 to N1 do
       begin
         write('M[',i,']=');
         read(M1[i]);
       end;
   end;
 Procedure OutputArray(N1:Tindex;M1:Tarray);
   begin
     writeln('The elements of array:');
     for i:=1 to N1 do
       write('M[',i,']=',M[i],' ');
       writeln
   end;
 Procedure Sort1(N1:Tindex;var M1:Tarray);
  var
    i,j,x:Tindex;
    a:real;
  begin
    x:=N1-1;
    for j:=1 to x do
      for i:=1 to N1-j do
          if M1[i]>M1[i+1] then
            begin
              a:=M1[i+1];
              M1[i+1]:=M1[i];
              M1[i]:=a;
            end;
  end;
Procedure Sort2(N1:Tindex;var M1:Tarray);
  var
    i:Tindex;
    j:integer;
    x:real;
  begin
    for i:=2 to n do
    begin
        x:=M1[i];
        j:=i-1;
        while (j>0) and (x<M1[j]) do
        begin
            M1[j+1]:=M1[j];
            j:=j-1;
        end;
        M1[j+1]:=x;
    end;
end;
 Procedure SearchQ(N1:Tindex;M1:Tarray);
   var
     i:Tindex;
     j:boolean;
     q:real;
   begin
     write('Input the elements, q=');
     read(q);
     j:=false;
     for i:=1 to N1 do
       if q=M1[i] then
         begin
           writeln('The position of ',q,' is i=',i);
           j:=true;
         end;
     if j=false then writeln('not found');
   end;
 begin
   InputArray(N,M);
   writeln('1-Bubble sort');
   writeln('2-Sorting by direct inclusion');
   read(k);
   case(k) of
   1: Sort1(N,M);
   2: Sort2(N,M);
   end;
   OutputArray(N,M);
   SearchQ(N,M);
 end.