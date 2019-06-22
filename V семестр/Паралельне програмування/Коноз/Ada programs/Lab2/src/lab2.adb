with Data, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with System.Multiprocessors; use System.Multiprocessors;

-------------Основна програма---------------------------------
--ПРО Lab2
--Коноз Андрій Олександрович
--ІО-21
--19.09.14
--F1: E:=A+B+C+D(MA*MZ)
--F2: MZ:=Min(MA)*MB+Max(MT)*(MX*MZ)
--F3: d:=Min(A*Trans(MB*MM)+B*Sort(MC))

procedure Lab2 is
   --Розмірність векторів і матриць
   n : Integer :=3;
   --Ініціалізація пакету
   package Lab1Data is new Data(n);
   use Lab1Data;
   --задання номерів процесора
   CPU_1 :  CPU_Range:=0;
   CPU_2 :  CPU_Range:=1;
   --Оголошення задачі для виконання функції F1
   --Задання пріоритету, назви задачі, виділення стеку,
   -- номер процесору на якому буде відбуватися виконання
   task T1 is
      pragma Priority(1);
      pragma Task_Name ("T1");
      pragma Storage_Size(1000);
      pragma CPU (CPU_2);
   end T1;
   --Тіло задачі
   task body T1 is

      A,B,C,D,E: Vect;
      MA,MZ: Matrix;

   begin
      --Затримка виконання на 10с
      delay 10.0;
      --Введення даних для F1

      Put("Enter vector A for F1");
      New_Line;
      readVect(A);
      New_Line;

      Put("Enter vector B for F1");
      New_Line;
      readVect(B);
      New_Line;

      Put("Enter vector C for F1");
      New_Line;
      readVect(C);

      New_Line;
      Put("Enter vector D for F1");
      New_Line;
      readVect(D);

      New_Line;
      Put("Enter MA for F1");
      New_Line;
      readMatr(MA);

      New_Line;
      Put("Enter MZ for F1");
      New_Line;
      readMatr(MZ);
      --Виконання функції F1
      F1(A,B,C,D,MA, MZ,E);
      --Виведення результатів функції
      Put("F1 = ");
      showVect(E);
      New_Line;
      put("TF1 finifed");

   end T1;
   --Оголошення задачі для виконання функції F2
   --Задання пріоритету, назви задачі, виділення стеку,
   -- номер процесору на якому буде відбуватися виконання
   task T2 is
      pragma Priority(5);
      pragma Task_Name ("T2");
      pragma Storage_Size(1000);
      pragma CPU (CPU_1);
      end T2;

   task body T2 is
      MA,MB,MT,MX,MZ,ME: Matrix;

   begin
      --затримка виконання задачі на 5с
      delay 5.0;
      --Введення даних для F2

      New_Line;
      Put("Enter MA for F2");
      New_Line;
      readMatr(MA);

      New_Line;
      Put("Enter MB for F2");
      New_Line;
      readMatr(MB);

      New_Line;
      Put("Enter MX for F2");
      New_Line;
      readMatr(MX);

      New_Line;
      Put("Enter MZ for F2");
      New_Line;
      readMatr(MZ);

      New_Line;
      Put("Enter MT for F2");
      New_Line;
      readMatr(MT);
      --Виконання функції F2
      F2(MA,MB,MT,MX,MZ,ME);
      --Виведення результатів функції
      Put("F2 = ");
      showMatr(ME);
      New_Line;
      Put("TF2 finished");

   end T2;
   --Оголошення задачі для виконання функції F3
   --Задання пріоритету, назви задачі, виділення стеку,
   -- номер процесору на якому буде відбуватися виконання
   task T3 is
      pragma Priority(8);
      pragma Task_Name ("3");
      pragma Storage_Size(1000);
      pragma CPU (CPU_1);
   end T3;

   task body T3 is
      MB,MM,MC: Matrix;
      A,B: Vect;
      y: Integer;

   begin
      delay 2.0;
      --Введення даних для F3

      Put("Enter vector A for F3");
      New_Line;
      readVect(A);

      New_Line;
      Put("Enter vector B for F3");
      New_Line;
      readVect(B);

      New_Line;
      Put("Enter MB for F3");
      New_Line;
      readMatr(MB);

      New_Line;
      Put("Enter MM for F3");
      New_Line;
      readMatr(MM);

      New_Line;
      Put("Enter MC for F3");
      New_Line;
      readMatr(MC);
      --Виконання функції F3
      F3(A,B,MB, MM,MC,y);
      --Виведення результатів функції
      Put("F3 = ");
      Put(y);

      New_Line;
      put("TF3 finished");
   end T3;

      begin
         put("Lab 2");
      end Lab2;

