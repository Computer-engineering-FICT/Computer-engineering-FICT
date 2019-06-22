----------------------------------------------
-- data.adb                                 --
-- F1 : d = MAX(B + C) + MIN(A + B*(MA*MK)) --
-- F2 : q = MAX(MA * MB - MC)               --
-- F3 : D = SORT(A)*(MA * MB)               --
-- Chekanskiy Evgeniy Anatoliyovich, IO-01  --
-- 08.09.2012                               --
----------------------------------------------
with Ada.Integer_Text_IO, Ada.Text_IO; use Ada.Integer_Text_IO, Ada.Text_IO;
package body Data is

   function Matrix_Mul (Source1,Source2 : in Matrix) return Matrix;
   function Matrix_Sub (Source1,Source2 : in Matrix) return Matrix;
   function Matrix_Max(Source : in Matrix) return Integer;

   procedure Vector_Sort(Source : in out Vector);
   function Vector_Add(Source1,Source2 : in Vector) return Vector;
   function Vector_Max(Source : in Vector) return Integer;
   function Vector_Min(Source : in Vector) return Integer;
   function Vector_Matrix_Mul(Source1 : in Vector; Source2 : in Matrix) return Vector;

   function Matrix_Mul (Source1,Source2 : in Matrix) return Matrix is
      Result : Matrix;
   begin
      for I in 1..N loop
            Result(i) := (others => 0);
      end loop;
      for I in 1..N loop
         for J in 1..N loop
            for K in 1..N loop
            	Result(I)(J) := Result(I)(J) + Source1(I)(K)*Source2(K)(J);
            end loop;
         end loop;
      end loop;
      return Result;
   end Matrix_Mul;

   function Matrix_Sub (Source1,Source2 : in Matrix) return Matrix is
      Result : Matrix;
   begin
      for I in 1..N loop
         for J in 1..N loop
            Result(I)(J) := Source1(I)(J) - Source2(I)(J);
         end loop;
      end loop;
      return Result;
   end Matrix_Sub;

   function Matrix_Max(Source : in Matrix) return Integer is
      Max:Integer := Source(1)(1);
   begin
      for I in 1..N loop
         for J in 1..N loop
            if Source(I)(J) > Max then
               Max := Source(I)(J);
            end if;
         end loop;
      end loop;
      return Max;
   end Matrix_Max;

   procedure Vector_Sort(Source : in out Vector) is
      tmp:Integer :=Source(1) ;
   begin
      for I in 1..N loop
         for K in (I+1)..N loop
            if Source(I) > Source(K) then
               tmp := Source(K);
               Source(K) := Source(I);
               Source(I) := tmp;
            end if;
         end loop;
      end loop;
   end Vector_Sort;

   function Vector_Add(Source1,Source2 : in Vector) return Vector is
      Result:Vector := (others => 0);
   begin
      for I in 1..N loop
         Result(I) := Source1(I)+Source2(I);
      end loop;
      return Result;
   end Vector_Add;

   function Vector_Max(Source : in Vector) return Integer is
      Max:Integer := Source(1);
   begin
      for I in 1..N loop
         if Source(I) > Max then
            Max := Source(I);
         end if;
      end loop;
      return Max;
   end Vector_Max;

   function Vector_Min(Source : in Vector) return Integer is
      Min:Integer := Source(1);
   begin
      for I in 1..N loop
         if Source(I) < Min then
            Min := Source(I);
         end if;
      end loop;
      return Min;
   end Vector_Min;

   function Vector_Matrix_Mul(Source1 : in Vector; Source2 : in Matrix) return Vector is
      Result:Vector := (others => 0);
   begin
      for I in 1..N loop
         for J in 1..N loop
            Result(I) := Result(I) + Source1(J) * Source2(J)(I);
         end loop;
      end loop;
      return Result;
   end Vector_Matrix_Mul;

   procedure Vector_Input ( Result : out Vector ) is

   begin
      for Count in 1..N loop
         Get(Result(Count));
      end loop;
   end Vector_Input;

   procedure Vector_Output ( Source : in Vector ) is

   begin
      for Count in 1..N loop
         Put(Source(Count));
      end loop;
      Put_Line("");
   end Vector_Output;

   procedure Matrix_Input ( Result : out Matrix ) is

   begin
      for I in 1..N loop
         Put("Enter matrix line:");
         Put(I);
         Put_Line("");
         for J in 1..N loop
            Get(Result(i)(j));
         end loop;
      end loop;
   end Matrix_Input;

   procedure Matrix_Output ( Source : in Matrix ) is

   begin
      for I in 1..N loop
         for J in 1..N loop
            Put(Source(i)(j));
         end loop;
         Put_Line("");
      end loop;
   end Matrix_Output;

   function Func1(A,B,C: in Vector; MA,MK: in Matrix) return Integer is
      Result:Integer := 0;
   begin
      Result := Vector_Max(Vector_Add(B,C)) + Vector_Min(Vector_Add(A,Vector_Matrix_Mul(B,Matrix_Mul(MA,MK))));
      return Result;
   end Func1;

   function Func2(MA,MB,MC: in Matrix) return Integer is

   begin
      return Matrix_Max(Matrix_Sub(Matrix_Mul(MA,MB),MC));
   end Func2;

   function Func3(A: in Vector;MA,MB : Matrix) return Vector is
      Result:Vector;
   begin
      Result := A;
      Vector_Sort(Result);
      Result := Vector_Matrix_Mul(Result,Matrix_Mul(MA,MB));
      return Result;
   end Func3;

end Data;
