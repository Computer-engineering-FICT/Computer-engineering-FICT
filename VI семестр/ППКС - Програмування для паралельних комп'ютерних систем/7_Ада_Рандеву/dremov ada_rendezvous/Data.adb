-------------------------------------------------------------------------------
--                                                                           --
--                   Parallel and Distributed Computing                      --
--                        Lab7. Ada. Rendezvous                              --
--                                                                           --
--  File: data.adb                                                           --
--  Task: A = max(MO)*B + alpha*C*(MO*MK)                                    --
--                                                                           --
--  Author: Dremov Andrey, group IO-01                                       --
--  Date: 30.05.2013                                                         --
--                                                                           --
-------------------------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Data is


   procedure Input (V : out Vector; Value : in Integer) is
   begin
      for I in V'Range loop
            V(I) := Value;
      end loop;   
   end Input;

   procedure Input (MA : out Matrix; Value : in Integer) is
   begin
      for I in MA'Range loop
         for J in 1..N loop
            MA(I)(J) := Value;
         end loop;
      end loop;   
   end Input;

   procedure Output (V : in Vector) is
   begin
      New_Line;
      for I in V'Range loop
            Put(Item => V(I));
      end loop;
      New_Line;
   end Output;
    
    
   procedure Output (MA : in Matrix) is
   begin
      New_Line;
      for I in MA'Range loop
         for J in 1..N loop
            Put(Item => MA(i)(j), Width => 7);
         end loop;
         New_line;
      end loop;
      New_Line;
   end Output;


   function Maximum_Of_Matrix (MO : in Matrix) return Integer is
      Result : Integer := Integer'First;
      X      : Integer;
   begin
      for I in MO'Range loop
         for J in 1..N loop
            X := MO(I)(J);
            if X > Result then
               Result := X;
            end if;
         end loop;
      end loop;
      return Result;
   end Maximum_Of_Matrix;

    -- AH = m*BH + alpha*C*(MOH*MK)
   procedure Calculation (
      Alpha  : in Integer;
      M  : in Integer;
      B : in Vector;
      C : in Vector_N;
        MK : in Matrix_N;
        MO : in Matrix;
      First : in Integer;
      Last  : in Integer;
      A : out Vector) is

      Sum1 : Integer;
      Sum2 : Integer;
   begin
      for I in First..Last loop
         Sum2 := 0;
         for J in 1..N loop
            Sum1 := 0;
            for K in 1..N loop
               Sum1 := Sum1 + Alpha*MO(I)(K)*MK(J)(K);
            end loop;
            Sum2 := Sum2 + C(J) * Sum1;
         end loop;
         A(I) := Sum2 + m * B(I);
      end loop;
   end Calculation;
    
   procedure Transpose (MO : in out Matrix) is
      MT : Matrix := MO;
   begin
      for I in 1..N loop
         for J in 1..N loop
            MO(J)(I) := MT(I)(J);
         end loop;
      end loop;
   end Transpose;
    

end Data;
