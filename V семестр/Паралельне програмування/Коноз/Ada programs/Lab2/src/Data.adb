with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Streams; use Ada.Streams;
---------Тіло пакету Data--------------
package body Data is
   --Функція виконує додавання двох векторів
   function AddVect (A, B :Vect) return  Vect is
      g : Vect;
   begin
      for index in 1..N loop
      g(index):=A(index)+B(index);
      end loop;
      return g;
   end AddVect;
   --Функція виконує множення двох матриць
   function MultMatr (A, B : Matrix) return Matrix is
      Cell : Integer;
      Result : Matrix;
   begin
      for i in 1..N loop
      for j in 1..N loop
      Cell := 0;
      for k in 1..N loop
      Cell := Cell + A(i,k)*B(k,j);
      end loop;
      Result(i,j):= Cell;
      end loop;
      end loop;
      return Result;
   end MultMatr;
   --Функція транспонує матрицю
   function Transp (A : Matrix) return Matrix is
      Result : Matrix;
   begin
      for i in 1..N loop
      for j in 1..N loop
      Result(i,j) := A(j,i);
      end loop;
      end loop;
      return Result;
   end Transp;
   --Функція виконує пошук максимального елементу матриці
   function SearchMax(A : Matrix) return Integer is
      Var : Integer := A(1,1);
   begin
      for i in 1..N loop
      for j in 1..N loop
      if A(i,j) > Var then
      Var := A(i,j);
      end if;
      end loop;
      end loop;
      return Var;
   end SearchMax;
   --Функція виконує пошук мінімального елемента матриці
   function SearchMin(A : Matrix) return Integer is
      Var : Integer := A(1,1);
   begin
      for i in 1..N loop
      for j in 1..N loop
      if A(i,j) < Var then
      Var := A(i,j);
      end if;
      end loop;
      end loop;
      return Var;
   end SearchMin;
   --Функція виконує пошук мінімального елемента в векторі
   function SearchVectMin(A: Vect) return Integer is
      min : Integer;
   begin
      min := A(1);
      for i in 1..N loop
      if A(i) < min then
      min := A(i);
      end if;
      end loop;
      return min;
   end SearchVectMin;
   --Функція виконує додавання двох матриць
   function AddMatr(A, B : Matrix) return Matrix is
      Result : Matrix;
   begin
      for i in 1..N loop
      for j in 1..N loop
      Result(i,j) := A(i,j) + B(i,j);
      end loop;
      end loop;
      return Result;
   end AddMatr;
   --Функція виконує множення вектора на матрицю
   function MultVectMatr(A : Vect; B : Matrix) return Vect is
      Cell : Integer;
      Result : Vect;
   begin
      for j in 1..N loop
      Cell := 0;
      for k in 1..N loop
      Cell := Cell + A(k)*B(k,j);
      end loop;
      Result(j):= Cell;
      end loop;
      return Result;
   end MultVectMatr;
   --Функція виконує сортування вектора за зростанням
   function SortVect(A : Vect) return Vect is
      m : Integer;
      Result: Vect;
   begin
      for i in 1..N loop
      Result(i):= A(i);
      end loop;
      for i in reverse 1..N loop
      for j in 1..(i-1) loop
      if Result(j) > Result(j+1) then
      m := Result(j);
      Result(j):=Result(j+1);
      Result(j+1):=m;
      end if;
      end loop;
      end loop;
      return Result;
   end SortVect;
   --Функція виконує сортування матриці по спаданню
   function sortMatr(MA: Matrix) return Matrix is
      Result : Matrix;
      m: Integer;
   begin
      for i in 1..N loop
      for j in 1..N loop
      Result(i,j):=MA(i,j);
      end loop;
      end loop;

      for k in 1..N loop
      for i in reverse 1..N loop
      for j in 1..(i-1) loop
      if Result(k,j) < Result(k,j+1) then
      m := Result(k,j);
      Result(k,j):=Result(k,j+1);
      Result(k,j+1):=m;
      end if;
      end loop;
      end loop;
      end loop;
      return Result;
   end sortMatr;
   --Функція виконує множення числа на матрицю
   function MultNumb(a: Integer; MA: Matrix) return Matrix is
      Result : Matrix;
   begin
      for i in 1..N loop
      for j in 1..N loop
      Result(i,j):= a*MA(i,j);
      end loop;
      end loop;
      return Result;
   end MultNumb;
   --F1: E:=A+B+C+D(MA*MZ)
   procedure F1(A,B,C,D: in Vect; MA, MZ: in Matrix; E : out Vect) is
   begin
       E := AddVect(AddVect(A,B),AddVect(C,MultVectMatr(D,MultMatr(MA,MZ))));
   end F1;
   --F2: MZ:=Min(MA)*MB+Max(MT)*(MX*MZ)
   procedure F2(MA,MB,MT,MX,MZ: in Matrix; ME: out Matrix) is
   begin
      ME := AddMatr(MultNumb(SearchMin(MA),MB),MultNumb(SearchMax(MT),MultMatr(MX,MZ)));
   end F2;
   --F3: d:=Min(A*Trans(MB*MM)+B*Sort(MC))
   procedure F3(A,B: in Vect; MB, MM,MC: in Matrix; d: out Integer) is
   begin
      d:= SearchVectMin(AddVect(MultVectMatr(A,Transp(MultMatr(MB,MM))),MultVectMatr(B,sortMatr(MC))));
   end F3;
   --Процедура зчитування вектора з консолі
   procedure readVect(A : out Vect) is
   begin
      for i in 1..N loop
         Get(A(i));
      end loop;
   end readVect;
   --Процедура відображення вектора в консолі
   procedure showVect(A : in Vect) is
   begin
      for i in 1..N loop
      Put(A(i));
      end loop;
   end showVect;
   --Процедура зчитування матриці з консолі
   procedure readMatr(MA: out Matrix) is
   begin
      for i in 1..N loop
      New_Line;
      for j in 1..N loop
      Get(MA(i,j));
      end loop;
      end loop;
   end readMatr;
   --Процедура відображення матриці в консоль
   procedure showMatr(MA: in Matrix) is
   begin
      for i in 1..N loop
      New_Line;
      for j in 1..N loop
      Put(MA(i,j));
      end loop;
      end loop;
   end showMatr;



end Data;
