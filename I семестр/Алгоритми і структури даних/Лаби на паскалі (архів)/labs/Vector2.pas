Program Sort;
  type
    TIndex = 1 .. 1001;
    TVector = array[TIndex] of integer;
  var
    n: TIndex;
    v1: TVector;
    value: integer;
    l, z: real;
  
  Procedure RandomVector(var n: TIndex; var A: TVector);
    var
      i: TIndex;
    begin
      for i := 1 to n do
       A[i] := random(-50, 50);
    end; {InputVector}
   
  Procedure OutputVector(var n: TIndex; var A: TVector);
    var
      i: TIndex;
    begin
      for i := 1 to n do
       write(A[i], ' ');
    end; {OutputVector}
    
    
  Procedure Insert(n: TIndex; a: TVector; l: real);
    var 
      i, j, k: Tindex; 
      tmp : integer;
    begin
      for i := 2 to n do
        begin
          tmp := a[i];
          j := 1;
          while tmp > a[j] do
            begin
              j := j + 1;
              l := l + 1;
            end;
          for k := i - 1 downto j do
            a[k + 1] := a[k];
          a[j] := tmp;
        end;
        writeln(l);
    end; {Insert}

  Procedure Bubble(n: TIndex; a: TVector; z: real);
    var
      i, j: TIndex;
      tmp: integer;
    begin
    z := 0;
      for i := 2 to n do
        for j := n downto i do
          if a[j] < a[j-1] then
            begin
              tmp := a[j];
              a[j] := a[j - 1];
              a[j - 1] := tmp;
              l := l + 1;
            end;
        writeln(l);
    end; {SortVector}

  Procedure SearchVal(var n: TIndex; var a: TVector; var value: integer);
    var
      i: TIndex;
      frag: boolean;
    begin
     frag := false;
     for i := 1 to n do
       if a[i] = value then
         begin
           writeln('Номер ', i);
           frag := true;
         end;
       if not frag then
         writeln('Величина не знайдена');
    end;
    
  begin
    writeln('Введiть кiлькiсть елементiв вектора');
    read(n);
    RandomVector(n, v1);
    //writeln('Згенерований вектор');
    //OutputVector(n, v1);
    //writeln;
    //writeln('Пошук числа в масивi');
    //writeln('Введiть число, яке хочете знайти у векторi');
    //readln(value);
    //SearchVal(n, v1, value);
    //writeln;
    //writeln('Вiдсортований вектор');
    Insert(n, v1, l);
    //OutputVector(n, v1);
    writeln;
    Bubble(n, v1, l);
    //OutputVector(n, v1);
    writeln;
  end.