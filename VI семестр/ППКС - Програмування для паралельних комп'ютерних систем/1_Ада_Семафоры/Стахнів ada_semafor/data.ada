package Data is
  N: Integer := 4;
  P: Integer := 2;
  H: Integer := N/P;
  type Vector is array (1 .. N) of Integer;
  type Matrix is array (1 .. N) of vector;
  procedure Vector_Input (A: out Vector; C:in string);
  procedure Matrix_Input (MA: out Matrix; C:in string);
end Data;

with Ada.Text_IO,  Ada.Integer_Text_IO;
use Ada.Text_IO,  Ada.Integer_Text_IO;

package body Data is

  procedure Vector_Input (A: out Vector; C:in string)is
    f:file_type;
  begin
    Open(f,in_file,C);
    for i in 1..N loop
      get(f,A(i));	
    end loop;
  end Vector_Input;

  procedure Matrix_Input (MA: out Matrix; C:in string) is
    F:file_type;
  begin
    Open(f,in_file,C);
    for i in 1..N loop
      FOR J IN 1..N LOOP
        get(F,MA(i)(J));
      END LOOP;
    end loop;
  end Matrix_Input;
  
end data; 