    with Ada.Text_IO; use Ada.Text_IO;
    with Ada.INteger_Text_IO; use Ada.INteger_Text_IO;
    with Ada.IO_Exceptions; use Ada.IO_Exceptions;

    package Package1 is
    	N: integer := 50;   --size of structures
   		P: integer := 2;   --count of processors
  		H: integer := N/P; --size of piece

	   type Vec is array (1..N) of Integer;
       type Matr is array (1..N) of Vec;

       procedure Constant_Out(a: integer);
       procedure Vec_print(v: Vec);
       procedure Matr_print(m: Matr);
	   procedure Vec_Input(V: in out Vec);
	   procedure Matr_Input(M: in out Matr);

    end Package1;
    
            
  package body Package1 is
  	
    procedure Matr_Input(M: in out Matr) is 
	begin
		for i in 1 .. N loop
            for j in 1 .. N loop
               M(i)(j) := 1;
            end loop;
         end loop;	
end Matr_Input;

	    procedure Vec_Input(V: in out Vec) is 
	begin
		for i in 1 .. N loop
               V(i) := 1;
         end loop;	
	end Vec_Input;
           
	procedure Constant_Out(a: integer) is	
   begin
	  Put(a, 4);
	  New_Line;
   end Constant_Out;

   procedure Vec_print(v: Vec) is
   begin
      for i in 1 .. N loop
         Put(v(i), 4);
      end loop;
   end;

   procedure Matr_print(m: Matr) is
   begin
      for i in 1..n loop
         Vec_print(m(i));
         New_Line;
      end loop;
   end Matr_print;
   
  end Package1;
