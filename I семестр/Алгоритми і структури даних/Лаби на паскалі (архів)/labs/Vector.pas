Program Sort;
  type
    TIndex = 1 .. 100;
    TVector = array[TIndex] of integer;
  var
    n: TIndex;
    v1: TVector;
    value: integer;
  
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
    
    
  Procedure Insert(n: TIndex; var a: TVector);
    var 
      i, j, k : Tindex; 
      tmp : integer;
    begin
      for i := 2 to n do
        begin
          tmp := a[i];
          j := 1;
          while tmp > a[j] do
            j := j + 1;
          for k := i - 1 downto j do
            a[k + 1] := a[k];
          a[j] := tmp;
        end;
    end; {Insert}

  Procedure Bubble(var n: TIndex; var a: TVector);
    var
      i, j: TIndex;
      tmp: integer;
    begin
      for i := 2 to n do
        for j := n downto i do
          if a[j] < a[j-1] then
            begin
              tmp := a[j];
              a[j] := a[j - 1];
              a[j - 1] := tmp;
            end;
     end; {SortVector}

  Procedure SearchVal(var n: TIndex; var a: TVector; var value:integer);
    var
      i: TIndex;
      frag: boolean;
    begin
     frag := false;
     for i := 1 to n do
       if a[i] = value then
         begin
           writeln('����� ', i);
           frag := true;
         end;
       if not frag then
         writeln('�������� �� ��������');
    end;
    
  begin
    writeln('����i�� �i���i��� �������i� �������');
    read(n);
    RandomVector(n, v1);
    writeln('������������ ������');
    OutputVector(n, v1);
    writeln;
    writeln('����� ����� � �����i');
    writeln('����i�� �����, ��� ������ ������ � ������i');
    readln(value);
    SearchVal(n, v1, value);
    writeln;
    writeln('�i����������� ������');
    //Bubble(n, v1);
    Insert(n, v1);
    OutputVector(n, v1);
    writeln;
  end.