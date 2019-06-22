with Data;
with Ada.Text_IO; use Ada.Text_IO;
with System.Multiprocessors; use System.Multiprocessors;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lab1 is
   N : Integer := 10;

   package Lab1Data is new Data(N);
   use Lab1Data;

   vectorA, vectorB, resultVector, vectorT, vectorO, vectorP : Vector;
   matrixA, matrixB, matrixP, matrixR, matrixS, matrixF, matrixG, matrixH, matrixK: Matrix;
   integerRes2, integerRes3: Integer;

   CPU0: CPU_Range := 0;
   CPU1: CPU_Range := 1;
   CPU2: CPU_Range := 2;

   procedure tasks is
      task T1 is
         pragma Priority(1);
         pragma Storage_Size(100000);
         pragma CPU(CPU0);
      end;
      task body T1 is
         vectorA: Vector;
         matrixA, matrixE: Matrix;
      begin
         Put_Line("T1 started");
         randomVector(vectorA);
         randomVector(vectorB);
         randomVector(vectorT);
         randomMatrix(matrixA);
         randomMatrix(matrixE);
         F1(vectorA, vectorB, vectorT, matrixA, matrixE, resultVector);
         Put_Line("T1 finished");
      end T1;

      task T2;
      task body T2 is
         matrixH, matrixK, matrixL, matrixF: Matrix;
      begin
         Put_Line("T2 started");
         fillMatrix(matrixH);
         fillMatrix(matrixK);
         fillMatrix(matrixL);
         F2(matrixH, matrixK, integerRes2);
         Put_Line("T2 finished");
      end T2;

      task T3 is
         pragma Priority(5);
         pragma Storage_Size(100000);
      end;
      task body T3 is
         vectorP, vectorT: Vector;
         matrixR, matrixS: Matrix;
         integerRes: Integer;
      begin
         Put_Line("T3 started");
         randomVector(vectorP);
         fillMatrix(matrixR);
         fillMatrix(matrixS);
         F3(matrixR, matrixS, vectorP, integerRes);
         Put_Line("T3 finished");
      end T3;

   begin
      null;
   end tasks;

begin
   Put_Line("Lab 1 started");
   tasks;

   Put_Line("---");
   Put_Line("Task 1 results");
   putVector(resultVector);
   
   Put_Line("---");

   Put_Line("---");
   Put_Line("Task 2 results");
   Put(integerRes2);
   Put_Line("");
   Put_Line("---");

   Put_Line("---");
   Put_Line("Task 3 results");
   Put(integerRes3);
   Put_Line("");
   Put_Line("---");
   
   Get(N);
end Lab1;
