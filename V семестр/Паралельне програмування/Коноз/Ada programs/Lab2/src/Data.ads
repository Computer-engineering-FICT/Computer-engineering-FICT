-----Специфікація пакету Data----------
generic
   N : in Integer;
package Data is
   --Оголошення приватних типів
   type Vect is private;
   type Matrix is private;
   --F1: E:=A+B+C+D(MA*MZ)
   procedure F1(A,B,C,D: in Vect; MA, MZ: in Matrix; E : out Vect);
   --F2: MZ:=Min(MA)*MB+Max(MT)*(MX*MZ)
   procedure F2(MA,MB,MT,MX,MZ: in Matrix; ME: out Matrix);
   --F3: d:=Min(A*Trans(MB*MM)+B*Sort(MC))
   procedure F3(A,B: in Vect; MB, MM,MC: in Matrix; d: out Integer);
   --Процедура зчитування вектора з консолі
   procedure readVect(A : out Vect);
   --Процедура відображення вектора в консолі
   procedure showVect(A : in Vect);
   --Процедура зчитування матриці з консолі
   procedure readMatr(MA: out Matrix);
   --Процедура відображення матриці в консоль
   procedure showMatr(MA: in Matrix);
  --Визначення приватних типів
  private
     type Vect is array(1..N) of Integer;
     type Matrix is array(1..N, 1..N) of Integer;
end Data;
