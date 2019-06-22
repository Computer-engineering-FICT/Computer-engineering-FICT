Uses Crt;
Const n=9;
Type TArray=array [1..n,1..n] of byte;
     TVector=array [1..n] of integer;
     TMatrix=object
       m:TArray;
       processor:TVector;
       zayavka:TVector;
       procedure Init;
       procedure Show;
       procedure Go_for_it;
     end;

     procedure TMatrix.Init;
     var i,j:integer;
         x,y:integer;
     begin
      for i:=1 to n do
          begin
           processor[i]:=i;
           zayavka[i]:=i;
           for j:=1 to n do
               m[i,j]:=0;
          end;
      for i:=1 to 5*n*n div 11 do
          begin
            repeat
             x:=random(n)+1;
             y:=random(n)+1;
            until m[x,y]=0;
            m[x,y]:=1;
          end;
     end;
     procedure TMatrix.Show;
     var i,j:integer;
     begin
      ClrScr;
      Write('  ':3);
      For i:=1 to n do Write(zayavka[i]:3);
      WriteLn;
      For i:=1 to n do
          begin
           Write(processor[i]:3);
           for j:=1 to n do
               Write(m[i,j]:3);
           WriteLn;
          end;
      ReadLn;
     end;
     procedure TMatrix.Go_for_it;
     var i,j:integer;
         v:integer;

     function find_1_min_raw(ogr:integer):integer;
     var i1,j1:integer;
         num:integer;
         count:integer;
         a:integer;
     begin
      num:=ogr;
      count:=n+2;
      for i1:=ogr to n do
          begin
           a:=0;
           for j1:=ogr to n do
               a:=a+m[i1,j1];
           if a<count then
              begin
               count:=a;
               num:=i1;
              end;
          end;
      find_1_min_raw:=num;
     end;

     function find_1_max_col(ogr:integer):integer;
     var i1,j1:integer;
         num:integer;
         count:integer;
         a:integer;
     begin
      num:=ogr;
      count:=-1;
      for i1:=ogr to n do
          begin
           a:=0;
           for j1:=ogr to n do
               a:=a+m[j1,i1];
           if (a>count) and (m[ogr,i1]<>0) then
              begin
               count:=a;
               num:=i1;
              end;
          end;
      find_1_max_col:=num;
     end;

     procedure Change(a1,a2:integer;what:boolean); {true raw}
     var
      i1:integer;
      w:integer;
     begin
      if what then
         begin
          w:=processor[a1];
          processor[a1]:=processor[a2];
          processor[a2]:=w;
         end else
         begin
          w:=zayavka[a1];
          zayavka[a1]:=zayavka[a2];
          zayavka[a2]:=w;
         end;

      for i1:=1 to n do
          if what then
             begin;
              w:=m[a1,i1];
              m[a1,i1]:=m[a2,i1];
              m[a2,i1]:=w;
             end else
             begin
              w:=m[i1,a1];
              m[i1,a1]:=m[i1,a2];
              m[i1,a2]:=w;
             end;

     end;

     begin
      for i:=1 to n do
          begin
           v:=find_1_min_raw(i);
           Change(i,v,true);
           v:=find_1_max_col(i);
           Change(i,v,false);
          end;
     end;

var matrix:TMatrix;

begin
 randomize;
 matrix.init;
 matrix.show;
 matrix.go_for_it;
 matrix.show;
end.