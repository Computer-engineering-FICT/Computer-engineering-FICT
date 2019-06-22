Program MyArray;
 Type
   Tindex=1..10;
   Tarray=array[Tindex] of real;
 var
   i,N,k,z:Tindex;
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
       write('M[',i,']=',M[i],' ')
   end;
 Procedure Sort1(N1:Tindex;var M1:Tarray);
  var
    i,j:Tindex;
    a:real;
  begin
    for j:=1 to N-1 do
      for i:=1 to N-j do
          if M1[i]>M1[i+1] then
            begin
              a:=M1[i+1];
              M1[i+1]:=M1[i];
              M1[i]:=a;
            end;
  end;
 Procedure Sort2(N1:Tindex;var M1:Tarray);
  var
    i,j:Tindex;
    min,a:real;
  begin
    for j:=1 to N1-1 do
      begin
        min:=M1[j];
        for i:=j+1 to N do
          if M1[i]<min then
            begin
              a:=min;
              min:=M1[i];
              M1[i]:=a;
            end;
        M1[j]:=min;
      end;
  end;
 Procedure Sort3(N1:Tindex;var M1:Tarray);
   var
     i,j:Tindex;
     a:real;
   begin
     for i:=2 to N do
       for j:=1 to i-1 do
         if M1[i]<M1[j] then
           begin
             a:=M1[j];
             M1[j]:=M1[i];
             M1[i]:=a;
           end;
   end;
 Procedure SearchQ(N1:Tindex;M1:Tarray);
   var
     i:Tindex;
     j:boolean;
     q:real;
   begin
     write('input the elements, q=');
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
 Procedure BinarPoisk(N1:Tindex;M1:Tarray);
   var
     i,a,b,c:Tindex;
     q:real;
   begin
     write('Input the q=');
     read(q);
     a:=1;
     b:=N1;
     for i:=1 to N1 do
       begin
         c:=(a+b)div 2;
         if q=M1[c] then
           begin
             writeln('the position of q is ',c);
             break;
           end
           else if q>M1[c] then a:=c
             else b:=c;
       end;
   end;
 begin
   InputArray(N,M);
   writeln('1-Bubble sort');
   writeln('2-Sorting by direct selection');
   writeln('3-Sorting by direct inclusion');
   read(k);
   case(k) of
   1: Sort1(N,M);
   2: Sort2(N,M);
   3: Sort3(N,M);
   end;
   writeln('1-Poisk po kluchu');
   writeln('2-Poisk deleniem');
   read(z);
   case(z) of
   1: SearchQ(N,M);
   2: BinarPoisk(N,M);
   end;7
   OutputArray(N,M)
 end.