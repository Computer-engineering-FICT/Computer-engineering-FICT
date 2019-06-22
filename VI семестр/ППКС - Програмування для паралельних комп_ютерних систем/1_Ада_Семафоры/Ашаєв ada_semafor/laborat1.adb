
--------------------------------------------
-----ПРО. Лаб 1. Ада. Семафоры.
-----MA=MB(MC*MZ)*a
-----Ашаев Ю.М. ИО-73
-----15.02.2010
with Ada.Synchronous_Task_Control;
use  Ada.Synchronous_Task_Control;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

Procedure lab1 is
   N:integer:=5;
   P:integer:=2;
   H:integer:=N/P;
   s1, s2, s3:Suspension_Object;
   sku:Suspension_Object;
   type Vector is array(1..N) of integer;
   type Matrix is array(1..N) of Vector;
   alfa: Integer;
   MA, MB, MC, MZ:Matrix;
   procedure inputVector(A:out Vector) is
   begin
      for i in 1..N loop
         A(i):=1;
      end loop;
   end inputVector;

   procedure OutputVector(A:in Vector) is
   begin
      for i in 1..N loop
         Put(a(i));
      end loop;
	   New_line;
   end outputVector;

   procedure inputMatrix(MA:out Matrix) is
   begin
      for i in 1..N loop
         inputVector(MA(i));
      end loop;
   end inputMatrix;

   procedure OutputMatrix(MA:in Matrix) is
   begin
      for i in 1..N loop
         OutputVector(MA(i));
      end loop;
   end OutputMatrix;

   procedure Vector_input(file: in File_Type;A: out Vector) is
   begin
      for i in 1..N loop
         get(file, A(i));
      end loop;
   end Vector_input;

   procedure Matrix_input(file: in File_Type;MA: out Matrix) is
   begin
      for i in 1..N loop
         Vector_input(file, MA(i));
      end loop;
   end Matrix_input; 

   task T1;
   task body T1 is
      Mcur:Matrix;
      sum:integer:=0;
      MC1, MB1: Matrix;
      alfa1: Integer;

   begin
      Put_Line("T1 started");
      Put_Line("T1 input");
      inputMatrix(MC);
      Alfa:=1;
      Put_Line("Signal s1");
      Set_True(s1);
      Suspend_Until_True(s2);
      Suspend_Until_True(sku);
      Put_Line("T1 copy Data");
   
      for i in 1..N loop
         for j in 1..N loop
            MC1(i)(j):=MC(i)(j);
            MB1(i)(j):=MB(i)(j);
         end loop;
      end loop;
      Alfa1:=alfa;

      Set_True(sku);
      Put_Line("T1 calculating");

      for J in 1..H loop
         for I in 1..N loop
            for K in 1..N loop
               Mcur(i)(J):=Mcur(i)(J)+MC1(i)(K)*MZ(j)(k);
            end loop;
            Mcur(i)(J):=Mcur(i)(J)*alfa1;
         end loop;
         for I in 1..N loop
            for K in 1..N loop
               MA(i)(J):=MA(i)(J)+MB1(i)(K)*Mcur(K)(J);
            end loop;
         end loop;    
      end loop;

      Put_Line("T1 waiting for result");
      Suspend_Until_True(s3);
      Put_Line("T1 output");
      if (N<9) then   	
         Put_line("Result MA is");
         OutputMatrix(MA);
      end if;
      Put_Line("T1 finished");
   
   end T1;
   
   task T2;
   task body T2 is
      Mcur:Matrix;
      sum:integer:=0;
   	MC2, MB2: Matrix;
   	alfa2: Integer;
   begin
      
      Put_Line("T2 started");
      Put_Line("T2 input");
      inputMatrix(MB);
      inputMatrix(MZ);
      Suspend_Until_True(s1);
      Put_Line("signal s2");
      Set_True(s2);
      Suspend_Until_True(sku);
      Put_Line("T2 copy Data");
   
      for i in 1..N loop
         for j in 1..N loop
            MC2(i)(j):=MC(i)(j);
            MB2(i)(j):=MB(i)(j);
         end loop;
      end loop;
      Alfa2:=alfa;
   
      Set_True(sku);
      Put_Line("T2 calculating");
   
      for J in H+1..N loop
         for I in 1..N loop
            for K in 1..N loop
               Mcur(i)(J):=Mcur(i)(J)+
                  MC2(i)(K)*MZ(j)(k);
            end loop;
            Mcur(i)(J):=Mcur(i)(J)*alfa2;
         end loop;
   	   for I in 1..N loop
            for K in 1..N loop
               MA(i)(J):=MA(i)(J)+MB2(i)(K)*
                  Mcur(K)(J);
            end loop;
         end loop;    
      end loop;

      Put_Line("signal s3");
      Put_Line("T2 finished");
      Set_True(s3);
   
   end T2;
   
begin
   Set_True(sku);
end lab1;
