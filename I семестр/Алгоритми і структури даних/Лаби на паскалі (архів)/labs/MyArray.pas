Unit MyArray;

  Interface
  
  type
    TIndex = 1..100;
    TArray = array [TIndex] of integer;
    
  Procedure InputArray(n: TIndex; var A: TArray);
  Procedure OutputArray(n: TIndex; var A: TArray);
  Procedure FillArray(n: TIndex; var A: TArray; rmin, rmax: integer);  //�������� ����� ����������� �������
  Procedure SortByChoice(n: TIndex; var A: TArray);
{  Procedure SortByInsert(n: TIndex; var A: TArray);
  Procedure SortBublle(n: TIndex; var A: TArray);
  Procedure SearchQuantir(n: TIndex; var a: TArray; quantir: integer);
  Procedure VectorFile(n: TIndex; var a: TArray; FName: string);}

  function Min_elem(n: TIndex; var A: TArray): integer; //������� ��������� ������� ������
  function Max_elem(n: TIndex; var A: TArray): integer; //������� ������������ ������� ������
  
  
  Implementation
  
  Procedure InputArray(n: TIndex; var A: TArray);
    var
      i: TIndex;
    begin
      for i := 1 to n do
        read(a[i]);
    end; //InputArray
    
  Procedure OutputArray(n: TIndex; var A: TArray);
    var
      i: TIndex;
    begin
      for i := 1 to n do
       write(A[i]:4)
    end; //OutputVector
    
  Procedure FillArray(n: TIndex; var A: TArray; rmin, rmax: integer);
  var
    i: TIndex;
  begin
    for i := 1 to n do
      a[i] := Random(rmin, rmax);
  end; //FillArray
  
  Procedure SortByChoice(n: TIndex; var A: TArray); //���������� �������
    var
      i, j, min, ind: integer;
    begin
      for i := 0 to n-2 do
        begin
          min := a[i]; 
          ind := i;
          for j :=i+1 to n-1 do
            if a[j]<min then
              begin
                min := a[j];
                ind := j;
              end;
            a[ind] :=a [i];
            a[i] := min;
        end;
    end;//SortByChoice
end.