with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

package body data is
   type Rand_Value is range 1..20;

   package Rand_Int is new  Ada.Numerics.Discrete_Random(Rand_Value);
   use Rand_Int;

   gen: Rand_Int.Generator;

   procedure putVector(vect: in Vector) is
   begin
      for i in 1..N loop
         Put(Integer'Image(vect(i)));
      end loop;
      Put_Line("");
   end putVector;

   procedure putMatrix(matr: in Matrix) is
   begin
      for i in 1..N loop
         putVector(matr(i));
      end loop;
   end putMatrix;

   procedure randomVector(vect: out Vector) is
   begin
      for i in 1..N loop
         Rand_Int.Reset(gen);
         vect(i) := INTEGER(Rand_Int.Random(gen));
      end loop;
   end randomVector;

   procedure randomMatrix(matr: out Matrix) is
   begin
      for i in 1..N loop
         randomVector(matr(i));
      end loop;
   end randomMatrix;

   procedure fillVector(vect: out Vector) is
   begin
      for i in 1..N loop
         vect(i) := 1;
      end loop;
   end fillVector;

   procedure fillMatrix(matr: out Matrix) is
   begin
      for i in 1..N loop
         fillVector(matr(i));
      end loop;
   end fillMatrix;

   function sortVector(vect : Vector) return Vector is
      m : Integer;
      resultVector: Vector;
   begin
      for i in 1..N loop
         resultVector(i) := vect(i);
      end loop;

      for i in reverse 1..N loop
         for j in 1..(i-1) loop
            if resultVector(j) > resultVector(j+1) then
               m := resultVector(j);
               resultVector(j) := resultVector(j+1);
               resultVector(j+1) := m;
            end if;
         end loop;
      end loop;

      return resultVector;
   end SortVector;

   function "*"(matrA, matrB: in Matrix) return Matrix is
      sum : Integer;
      resultMatr : Matrix;
   begin
      for i in 1..N loop
         for j in 1..N loop
            sum := 0;
            for k in 1..N loop
               sum := sum + matrA(i)(k) * matrB(k)(j);
            end loop;
            resultMatr(i)(j) := sum;
         end loop;
      end loop;

      return resultMatr;
   end "*";

   function "*"(int:in Integer; vect: in Vector) return Vector is
      resultVector: Vector;
   begin
      for i in 1..N loop
         resultVector(i) := vect(i) * int;
      end loop;

      return resultVector;
   end  "*";

   function "*"(int: in Integer; matr: in Matrix) return Matrix is
      resultMatrix: Matrix;
   begin
      for i in 1..N loop
         for j in 1..N loop
            resultMatrix(i)(j) := int * matr(i)(j);
         end loop;
      end loop;

      return resultMatrix;
   end "*";

   function "*"(vectorA, vectorB: in Vector) return Vector is
      resultVector : Vector;
   begin
      for i in 1..N loop
         resultVector(i) := vectorA(i) * vectorB(i);
      end loop;

      return resultVector;
   end "*";

   function "*"(vect: in Vector; matr: in Matrix) return Vector is
      resultVect: Vector;
      sum : Integer;
   begin
      for i in 1..N loop
         sum := 0;
         for j in 1..N loop
            sum := sum + matr(i)(j) * vect(i);
         end loop;
         resultVect(i) := sum;
      end loop;

      return resultVect;
   end "*";

   function "+"(vectorA, vectorB: in Vector) return Vector is
      resultVector: Vector;
   begin
      for i in 1..N loop
            resultVector(i) := vectorA(i) + vectorB(i);
      end loop;

      return resultVector;
   end "+";


   function sort(MA:Matrix) return Matrix is
      MT:Matrix;
   begin
      for i in 1..n loop
         MT(i):=sortVector(MA(i));
      end loop;
      return MT;
   end sort;


   function searchMax(A : Matrix) return Integer is
      Var : Integer := A(1)(1);
   begin
      for i in 1..N loop
         for j in 1..N loop
            if A(i)(j) > Var then
               Var := A(i)(j);
            end if;
         end loop;
      end loop;

      return Var;
   end searchMax;
   
   
   function searchMin(A : Matrix) return Integer is
      Var : Integer := A(1)(1);
   begin
      for i in 1..N loop
         for j in 1..N loop
            if A(i)(j) < Var then
               Var := A(i)(j);
            end if;
         end loop;
      end loop;

      return Var;
   end searchMin;

   procedure F1(vectorA, vectorB, vectorC: in Vector; matrixA, matrixE: in Matrix; vectorD: out Vector) is
   begin
      vectorD := (vectorA + vectorB) + (vectorC * (vectorB * (matrixA * matrixE)));
   end F1;

   procedure F2(matrixH, matrixK: in Matrix; integerRes: out Integer) is
   begin
      integerRes := searchMin(matrixH * matrixK);
   end F2;

   procedure F3(matrixR, matrixS: in Matrix; vectorR: in Vector; integerRes: out Integer) is
   begin
      integerRes :=  searchMax(((sort(matrixR) * (matrixR * matrixS))));
   end F3;

begin
   Rand_Int.Reset(gen);
end data;
