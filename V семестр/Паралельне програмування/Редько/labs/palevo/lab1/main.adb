----------------------------------------------
-- main.adb                                 --
-- F1 : d = MAX(B + C) + MIN(A + B*(MA*MK)) --
-- F2 : q = MAX(MA * MB - MC)               --
-- F3 : D = SORT(A)*(MA * MB)               --
-- Chekanskiy Evgeniy Anatoliyovich, IO-01  --
-- 08.09.2012                               --
----------------------------------------------
with Ada.Text_IO, Ada.Integer_Text_IO, Data; use Ada.Text_IO,Ada.Integer_Text_IO;
procedure Main is
   package Data3 is new Data(3);
   use Data3;
   f1,f2:Integer := 0;
   f3:Vector;
   A,B,C:Vector;
   MA,MB,MC,MK:Matrix;
begin
   Put_Line("Enter Vector A:");
   Vector_Input(A);
   Put_Line("Enter Vector B:");
   Vector_Input(B);
   Put_Line("Enter Vector C:");
   Vector_Input(C);
   Put_Line("Enter Matrix MA:");
   Matrix_Input(MA);
   Put_Line("Enter Matrix MB:");
   Matrix_Input(MB);
   Put_Line("Enter Matrix MC:");
   Matrix_Input(MC);
   Put_Line("Enter Matrix MK:");
   Matrix_Input(MK);
   f1 := Func1(A,B,C,MA,MK);
   Put_Line("Result of F1:");
   Put(f1);
   Put_Line("");
   f2 := Func2(MA,MB,MC);
   Put_Line("Result of F2:");
   Put(f2);
   Put_Line("");
   f3 := Func3(A,MA,MB);
   Put_Line("Result of F3:");
   Vector_Output(f3);
   Put_Line("");
end Main;
