
------------------------
-- File data.adb
-- group IO-21
-- Kuzmenko Vladimir Z.
--------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
package body Data is

  --input vector
   procedure Vector_Input (A:out Vector) is
      	begin
         for i in 1..n loop
            Get(A(i));
         end loop;
      end Vector_Input;

   --output vector
   procedure Vector_Output (A:in Vector) is
      	begin
         for i in 1..n loop
            Put(A(i));
         end loop;
      end Vector_Output;

   -- input matrix
   procedure Matrix_Input (MA:out Matrix) is
      	begin
         for i in 1..n loop
            for j in 1..n loop
               Get(MA(i)(j));
            end loop;
         end loop;
      end Matrix_Input;

   --output matrix
   procedure Matrix_Output (MA:in Matrix) is
      	begin
         for i in 1..n loop
         	for j in 1..n loop
            		Put(MA(i)(j));
           		Put ("|");
         	end loop;
        	 Put_Line("");
         end loop;
      end Matrix_Output;

   --multing matrix
   function MultMatr (ma,mz:Matrix) return Matrix is
      s:integer;
      MT:Matrix;
   begin
      for i in 1..n loop
         for j in 1..n loop
            s:=0;
            for k in 1..n loop
               s:=s+ma(i)(k)*mz(k)(j);
               MT(i)(j):=s;
            end loop;
         end loop;
      end loop;
      return MT;
   end MultMatr;

   --multing matrix on vector
   function multMatrixOnVector(MA:Matrix; A:Vector) return Vector is
      s:Integer;
      R:Vector;
   begin
      for i in 1..n loop
         s:=0;
         for j in 1..n loop
            s:=s+MA(i)(j)*A(j);
         end loop;
         R(i):=s;
      end loop;
      return R;
   end multMatrixOnVector;

   --addition vectors
   function AddVec(B,C:Vector) return Vector is
      K:Vector;
   begin
      for i in 1..n loop
         K(i):=B(i)+C(i);
      end loop;
      return K;
   end AddVec;

   --addition matrix
   function AddMatr (ma,mb:Matrix) return Matrix is
      m:Matrix;
   begin
      for i in 1..n loop
         for j in 1..n loop
            m(i)(j):=ma(i)(j)+mb(i)(j);
         end loop;
      end loop;
      return m;
   end AddMatr;

   --sorting vector
   function SortVector(A:Vector) return Vector is
      M:Vector:=A;
      buf:Integer;
      k:Integer;
   begin
      for i in 1..(n-1) loop
         k:=i;
         for j in (i+1)..n loop
            if M(k)>M(j) then
               k:=j;
            end if;
         end loop;
         buf:=M(k);
         M(k):=M(i);
         M(i):=buf;
      end loop;
      return M;
   end SortVector;

   -- sjrting matrix
   function SortMatr(MA:Matrix) return Matrix is
      MT:Matrix;
   begin
      for i in 1..n loop
         MT(i):=sortVector(MA(i));
      end loop;
      return MT;
   end SortMatr;

   --finding max element in matrix
   function MaxElMatr  (MD:Matrix) return Integer is
      m:Integer:=MD(1)(1);
   begin
      for i in 1..n loop
         for j in 1..n loop
            if m<MD(i)(j) then
               m:=MD(i)(j);
            end if;
         end loop;
      end loop;
      return m;
   end MaxElMatr;

   --F1: 1.24 E = A + C * (MA * MZ) + B
   procedure Func1(A,B,C:in Vector;MA,MZ: in Matrix; E:out Vector) is
   begin
      E:=AddVec(AddVec(multMatrixOnVector(MultMatr(MA,MZ),C),A),B);
   end Func1;

   --F2: 2.14 MC = SORT(MA + MB * MM)
   procedure Func2(MA,MB,MM:in Matrix; MC:out Matrix) is
   begin
      MC:= SortMatr(AddMatr(MultMatr(MB,MM),MA));
   end Func2;

   --F3: 3.18 p = MAX(SORT(MS) + MA* MM)
   procedure Func3(MA,MM,MS: in Matrix; p: out Integer) is
   begin
      p:= MaxElMatr(AddMatr(SortMatr(MS),MultMatr(MA,MM)));
   end Func3;

end Data;

