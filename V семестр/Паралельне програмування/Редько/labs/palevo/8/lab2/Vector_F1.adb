with Ada.Text_IO; use Ada.Text_IO;

package body Vector_F1 is

   -- Summa vektorov
   function Vector_Sum(A,B: Vector) return Vector is
      C: Vector;
   begin
      for i in 1..N loop
            C(i):=A(i)+B(i);
      end loop;
      return C;
   end Vector_Sum;

   -- Umnojenie vektorov
   function Vector_Product(A,B: Vector) return Integer is
                           separate;

   -- Sortirovka vektora
      function Vector_Sort(A: in Vector; des: in Boolean)
                        return Vector is
      Buf: Integer;
      B: Vector;
   begin
      B:=A;
      for i in 1..N-1 loop
         for j in i+1..N loop
            if (B(i)>B(j) and not des) or (B(i)<B(j) and des) then
               Buf:=B(i); B(i):=B(j); B(j):=Buf;
            end if;
         end loop;
      end loop;
       return B;
   end Vector_Sort;

   -- Funkciya1
   function Fun1(A,B,C: Vector) return Integer is
      e: Integer;
   begin
         e:=Vector_Product(Vector_Sum(A,Vector_Sort(B,False)),
                           Vector_Sum(C,Vector_Sort(C,False)));
      return e;
   exception
      when Constraint_Error =>
         Put("Constraint error at Func1. Result is uncorrect: ");
      return e;
   end Fun1;

end Vector_F1;
