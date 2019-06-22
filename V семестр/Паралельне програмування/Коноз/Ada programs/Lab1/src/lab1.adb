with Data, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
-------------Основна програма---------------------------------
--ПРО Lab1
--Коноз Андрій Олександрович
--ІО-21
--13.09.14
--F1: E:=A+B+C+D(MA*MZ)
--F2: MZ:=Min(MA)*MB+Max(MT)*(MX*MZ)
--F3: d:=Min(A*Trans(MB*MM)+B*Sort(MC))

procedure Lab1 is
   --Розмірність векторів і матриць
   n : Integer :=3;
   --Ініціалізація пакету
   package Lab1Data is new Data(n);
   use Lab1Data;
   --Оголошення змінних, які будуть використовуватися в програмі
   A,B,C,D,E: Vect;
   MA,MB,MT,MX,MZ,MM,ME,MC: Matrix;
   y: Integer;

begin
   --Введення даних для F1
   Put("All vectors had ");
   Put(n);
   Put(" items");
   New_Line;

   Put("Arguments for F1");
   Put("Enter vector A");
   New_Line;
   readVect(A);

   New_Line;
   Put("Enter vector B");
   New_Line;
   readVect(B);

   New_Line;
   Put("Enter vector C");
   New_Line;
   readVect(C);

   New_Line;
   Put("Enter vector D");
   New_Line;
   readVect(D);

   New_Line;
   Put("Enter MA");
   New_Line;
   readMatr(MA);

   New_Line;
   Put("Enter MZ");
   New_Line;
   readMatr(MZ);
   --Виконання функції F1
   F1(A,B,C,D,MA, MZ,E);
   --Введення даних для F2
   Put("Arguments for F2");
   New_Line;
   Put("Enter MA");
   New_Line;
   readMatr(MA);

   New_Line;
   Put("Enter MB");
   New_Line;
   readMatr(MB);

   New_Line;
   Put("Enter MX");
   New_Line;
   readMatr(MX);

   New_Line;
   Put("Enter MZ");
   New_Line;
   readMatr(MZ);

   New_Line;
   Put("Enter MT");
   New_Line;
   readMatr(MT);
   --Виконання функції F2
   F2(MA,MB,MT,MX,MZ,ME);
  --Введення даних для F3
   Put("Arguments for F3");
   Put("Enter vector A");
   New_Line;
   readVect(A);

   New_Line;
   Put("Enter vector B");
   New_Line;
   readVect(B);

   New_Line;
   Put("Enter MB");
   New_Line;
   readMatr(MB);

   New_Line;
   Put("Enter MM");
   New_Line;
   readMatr(MM);

    New_Line;
   Put("Enter MC");
   New_Line;
   readMatr(MC);
   --Виконання функції F3
   F3(A,B,MB, MM,MC,y);
   --Виведення результатів функцій
   Put("F1 = ");
   showVect(E);
   Put("F2 = ");
   showMatr(ME);
   Put("F3 = ");
   Put(y);

end Lab1;
