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
	--Ah = dB + C(MO*MK)
   procedure Calculation (d  : in Integer; MO : in Matrix; c: in integer; MX : in Matrix; MK : in Matrix_N; First : in Integer; Last  : in Integer; Start: in integer; MA : out Matrix) is

      Sum1 : Integer;
   begin
      for I in First..Last loop
         for J in 1..N loop
            Sum1 := 0;
            for K in 1..N loop
               Sum1 := Sum1 + MX(I)(K)*MK(J)(K);
            end loop;
            MA(I+Start)(J) := d*MO(I)(J) + C * Sum1;
         end loop;
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
