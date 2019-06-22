------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--         Laboratory work #1. Subprograms and packages         --
--                                                              --
--  File: data.adb                                              --
--  Task: F1: E = A + B + C + D * (MA * MZ)                     -- 
--        F2: MD = (MA * MB) * TRANS(MC)                        --
--        F3: E = (MA * MM) * B + MB * SORT(A)                  --
--                                                              --
--  Author: Redko Alexander, group IO-01                        --
--  Date: 09.09.2012                                            --
--                                                              --
------------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Data is
 
   --procedure Randomize(V : out Vector);
   --procedure Randomize(MA : out Matrix);

   ------------------
   -- Input_Vector --
   ------------------

   procedure Input_Vector (V : out Vector) is
   begin
      for I in Index loop
         Get(V(I));
      end loop;
      --Randomize(V);
   end Input_Vector;
   
   ------------------
   -- Input_Matrix --
   ------------------

   procedure Input_Matrix (MA : out Matrix) is
   begin
      for I in Index loop
         for J in Index loop
            Get(MA(I)(J));
         end loop;
      end loop;
--      Randomize(MA);
   end Input_Matrix;

   
   -------------------
   -- Output_Vector --
   -------------------

   procedure Output_Vector (V : in Vector) is
   begin
      New_Line;
      for I in Index loop
         Put(Item => V(I), Width => 5);
      end loop;
      New_Line;
   end Output_Vector;

   -------------------
   -- Output_Matrix --
   -------------------   

   procedure Output_Matrix (MA : in Matrix) is
   begin
      New_Line;
      for I in Index loop
         for J in Index loop
            Put(Item => MA(i)(j), Width => 5);
         end loop;
         New_line;
      end loop;
      --new_line;
   end Output_Matrix;

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


   ---------------------------------------
   -- F1: E = A + B + C + D * (MA * MZ) --
   ---------------------------------------

   procedure F1 
      (VA, VB, VC, VD : in Vector;
       MA, MZ         : in Matrix;
       VE             : out Vector) is
   begin      
      VE := VA + VB + VC + VD * (MA * MZ); 
   end F1;

   ------------------------------------
   -- F2: MD = (MA * MB) * TRANS(MC) --
   ------------------------------------

   procedure F2
      (MA, MB, MC : in Matrix;
       MD         : out Matrix) is
       MCT : Matrix;
   begin
      Transpose(MC, MCT);
      MD := (MA * MB) * MCT;

   end F2;

   ------------------------------------------
   -- F3: E = (MA * MM) * B + MB * SORT(A) --
   ------------------------------------------
   
   procedure F3
      (VA, VB     : in Vector;
       MA, MB, MM : in Matrix;
       VE         : out Vector) is
      VS : Vector;   
   begin
      Sort(VE, VS);
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
   
   -- procedure Randomize (V : out Vector) is
      -- subtype Integer_range is Integer range 0..15;
      -- package Random_Generator is new Ada.Numerics.Discrete_Random(Integer_range);
      -- use Random_Generator;
      -- G : Generator;
   -- begin
      -- V := (others => 0);
      -- Reset(G);
      -- for I in Index loop
         -- V(I) := Random(G);
      -- end loop;
   -- end Randomize;


    -- procedure Randomize (MA : out Matrix) is
      -- subtype Int_range is Integer range 0..15;
      -- package Random_Generator is new Ada.Numerics.Discrete_Random(Int_range);
      -- use Random_Generator;
      -- G : Generator;
   -- begin
      -- Reset(G);
      -- for I in Index loop
         -- for J in Index loop
            -- MA(i)(j) := random(G);
         -- end loop;
      -- end loop;
   -- end Randomize;


   -- procedure Initialize_Default  (VA, VB, VC, VD     : in out Vector;
                                  -- MA, MZ, MB, MC, MM : in out Matrix ) is
   -- begin
      -- VA := (-1, 2, 3);
      -- VB := (5, -5, 0);
      -- VC := (9, 10, -4);
      -- VD := (-8, 1, 2);
      -- MA := ((6,4,6),
             -- (3,-7,10),
             -- (10,1,2));
      -- MB := ((1,4,0),
             -- (3,-3,4),
             -- (9,5,6));
      -- MC := ((16,4,3),
             -- (3,0,15),
             -- (1,5,2));
      -- MZ := ((1,2,3),
             -- (7,-6,4),
             -- (0,8,2));
      -- MM := ((3,4,7),
             -- (6,-8,9),
             -- (2,3,5));
   -- end Initialize_default;

end Data;
