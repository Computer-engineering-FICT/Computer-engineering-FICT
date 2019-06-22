------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--                  Laboratory work #2. Tasks                   --
--                                                              --
--  File: data.adb                                              --
--  Task: F1: E = A + B + C + D * (MA * MZ)                     -- 
--        F2: MD = (MA * MB) * TRANS(MC)                        --
--        F3: E = (MA * MM) * B + MB * SORT(A)                  --
--                                                              --
--  Author: Redko Alexander, group IO-01                        --
--  Date: 16.09.2012                                            --
--                                                              --
------------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, ada.numerics.discrete_random, Ada.Strings, Ada.Strings.Fixed;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Data is
   
   subtype Random_Range is Integer range -20..20;
	package Random_Integer is new Ada.Numerics.Discrete_Random(Random_Range);
	use Random_Integer;
	G : Random_Integer.Generator;
   Random_Item : Random_Range;


   procedure Input (Way_To_Fill : in Character; Value : Integer; V : out Vector) is
      Number : Integer;
   begin
      case Way_To_Fill is
         when 'r' =>
            Reset(G);
   		   for I in Index loop
   		   	Random_Item := Random(G);
     		   	V(I):= Random_Item;
     		   end loop;
    	   when 'g' =>
            Put ("Input vector: ");
    	    	for I in Index loop
    	    		Get(V(I));
    	    	end loop;
         when 'a' =>
     			for I in Index loop
     				V(I) := Value;
     			end loop;
         when others =>
            for I in Index loop
     				V(I) := 1;
     			end loop;
         end case;         

   end Input;
   

   procedure Input (Way_To_Fill : in Character; Value : Integer; MA : out Matrix) is
      Number : Integer := 3;
   begin
      case Way_To_Fill is
         when 'r' =>
            Reset(G);
			   for I in Index loop
               for J in Index loop
			      	Random_Item := Random(G);
			      	MA(I)(J) := Random_Item;
               end loop;
			   end loop;
		   when 'g' =>
            Put ("Input matrix: ");
		    	for I in Index loop
		    		for J in Index loop
                  Get(MA(I)(J));
               end loop;
		    	end loop;
         when 'a' =>
   			for I in Index loop
               for J in Index loop
   				   MA(I)(J) := Value;
               end loop;
   			end loop;
         when others =>
     			for I in Index loop
               for J in Index loop
   				   MA(I)(J) := 0;
               end loop;
   			end loop;

      end case;

   end Input;


   procedure Output (V : in Vector; File : File_Type) is
   begin
      for I in Index loop
         Put(File, V(I));
      end loop;
      New_Line(File);
   end Output;

   procedure Output (MA : in Matrix; File : File_Type) is
   begin
      for I in Index loop
         for J in Index loop
            Put(File, MA(I)(J));
         end loop;
         New_line(File);
      end loop;
      New_Line(File);
   end Output;
   

   procedure Output (V : in Vector) is
   begin
      New_Line;
      for I in Index loop
         Put(Item => V(I), Width => 6);
      end loop;
      New_Line;
   end Output;


   procedure Output (MA : in Matrix) is
   begin
      New_Line;
      for I in Index loop
         for J in Index loop
            Put(Item => MA(i)(j), Width => 6);
         end loop;
         New_line;
      end loop;
      New_Line;
   end Output;


   function "*" --Matrix_Matrix_Multiply
      (Left  : Matrix;
       Right : Matrix) return Matrix;


   function "*" --Vector_Matrix_Multiply
      (Left  : Vector;
      Right : Matrix) return Vector;


   function "+" --Vector_Vector_Add
     (Left  : Vector;
      Right : Vector) return Vector;
   
   
   procedure Transpose (A : in Matrix; R : out matrix);
   procedure Sort (V : in Vector; A : out Vector);


   procedure F1 
      (VA, VB, VC, VD : in Vector;
       MA, MZ         : in Matrix;
       VE             : out Vector) is
   begin      
      VE := VA + VB + VC + VD * (MA * MZ); 
   end F1;


   procedure F2
      (MA, MB, MC : in Matrix;
       MD         : out Matrix) is
       MCT : Matrix;
   begin
      Transpose(MC, MCT);
      MD := (MA * MB) * MCT;

   end F2;
   

   procedure F3
      (VA, VB     : in Vector;
       MA, MB, MM : in Matrix;
       VE         : out Vector) is
      VS : Vector;
   begin
      Sort(VA, VS);
      VE := VB * (MA * MM) + VS * MB;
   end F3;   
   

   function "*"--Matrix_Matrix_Multiply
     (Left  :  Matrix;
      Right :  Matrix) return Matrix
   is
      MR : Matrix;
   begin
      for i in Index loop
		   for J in Index loop
			   MR(I)(J) := 0;
				for K in Index loop
					MR(I)(J) := MR(I)(J) + Left(I)(K) * Right(K)(J);
				end loop;
			end loop;
      end loop;
      return MR;
   end  "*";


   function "*"--Vector_Matrix_Multiply
     (Left  : Vector;
      Right : Matrix) return Vector
   is
      R : Vector;
   begin
      for J in Index loop
         R(j) := 0;
         begin
            for K in Index loop
               R(J) := R(J) + Left(K) * Right(K )(J);
            end loop;
         end;
      end loop;
      return R;
   end "*";
   

   function "+"--Vector_Vector_Add
     (Left  : Vector;
      Right : Vector) return Vector
   is
      R : Vector;
   begin
      for J in Index loop
         R (J) :=  Left (J) + Right (J);
      end loop;
      return R;
   end "+";


	procedure Transpose (A : in Matrix; R : out Matrix) is
      begin
         for J in Index loop
            for K in Index loop
               R (J)(K) := A (K)(j);
            end loop;
         end loop;
      end Transpose;
   

   procedure Sort (V : in Vector; A : out Vector) is
      Min  : Positive;
      Temp : Integer;
   begin
      A := V;
      for I in A'First..A'Last - 1 loop
         Min := I;
         for J in I + 1..A'Last loop
            if A (Min) > A (J) then
               Min := J;
            end if;
         end loop;
         if Min /= I then
            Temp    := A (I);
            A (I)   := A (Min);
            A (Min) := Temp;
         end if;
      end loop;
   end Sort;

end Data;
