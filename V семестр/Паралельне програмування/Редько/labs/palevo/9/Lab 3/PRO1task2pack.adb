package body PRO1task2pack is
-- F1: C := A - B + D; (1.13)
procedure Func1(A, B, D : in out Vector; C : out Vector) is
begin
  for i in 1..N loop
    C(i) := A(i) - B(i) + D(i);
  end loop; 
end Func1;
--

-- Function 2: MD := MA + (MB * MC); (2.21)
procedure Func2(MA, MB, MC : in Matrix; MD : out Matrix) is
begin
  -- preparing MD 
  for i in 1..N loop
    for j in 1..N loop
      MD(i)(j) := 0;
    end loop;
  end loop;
  -- multiplying MB, MC into MD
  for i in 1..N loop
    for j in 1..N loop
      for k in 1..N loop
        MD(i)(j) := MD(i)(j) + MB(i)(k) * MC(k)(j);
      end loop;
    end loop;
  end loop;
  -- Adding MA to (MB * MC) 
  for i in 1..N loop
    for j in 1..N loop
      MD(i)(j) := MD(i)(j) + MA(i)(j);
    end loop;
  end loop;
end Func2;
--

-- Function 3: E := (A + B - C) * (MA -MB); (3.25)
procedure Func3(A, B, C : in Vector; MA, MB : in Matrix; E : out Vector) is  
MT : Matrix;
T : Vector;
begin
  for i in 1..N loop
    for j in 1..N loop
      MT(i)(j) := 0;
    end loop;
  end loop;
  -- calculating MA - MB
  for i in 1..N loop
    for j in 1..N loop
      MT(i)(j) := MT(i)(j) + MA(i)(j) - MB(i)(j);
    end loop;
  end loop;
  -- puting A + B - C into E
  for i in 1..N loop
    T(i) := A(i) + B(i) - C(i);
  end loop; 
   -- puting A + B - C into T
  for i in 1..N loop
    E(i) :=0 ;
  end loop;          
  for i in 1..N loop
    for j in 1..N loop      
      E(i) := E(i) + T(j) * MT(j)(i);      
    end loop;
  end loop; 
end Func3;
--


-- Vector_Input() -- 
procedure Vector_Input(A : out Vector) is
begin
  for i in 1..N loop
    Get(A(i));
  end loop;
end Vector_Input;
--

-- Vector_Output -- 
procedure Vector_Output(A : in Vector) is
begin
  for i in 1..N loop
    Put(A(i),5);
  end loop;
  New_Line;
end Vector_Output;
--

-- Matrix_Input -- 
procedure Matrix_Input(MA : out Matrix) is
begin
  for i in 1..N loop
    for j in 1..N loop
      Get(MA(i)(j));
    end loop;
  end loop;
end Matrix_Input;
--

-- Matrix_Output --
procedure Matrix_Output(MA : in Matrix) is
begin
  for i in 1..N loop
    for j in 1..N loop
      Put(MA(i)(j), 5);
    end loop;
  end loop;
  New_Line;
end Matrix_Output;
--
end PRO1task2pack;
