
-------------------------------------------------------------------------------
--                                                                           --
--                   Parallel and Distributed Computing                      --
--                   Laboratory work #7. Ada. Rendezvous                     --
--                                                                           --
--  File: main.adb                                                           --
--  Task: MA = max(Z)*MO + d * (MX * MS)                                     --
--                                                                           --
--  Author: Krut Vladyslav, group IO-43                                      --
--  Date: 08.06.2017                                                         --
--                                                                           --
-------------------------------------------------------------------------------


with Ada.Text_IO, Ada.Integer_text_iO, Ada.Synchronous_Task_Control, Data;
use Ada.Text_IO, Ada.Integer_text_iO, Ada.Synchronous_Task_Control;

procedure Main is


   Value : Integer := 1;
   N : Integer := 8;
   P : Integer := 8;
   H : Integer := N/P;

   package DataN is new Data(N, H);
   use DataN;

   procedure StartTasks is
      -----------   СПЕЦИФІКАЦІЯ ЗАДАЧ    ----------------

      --                                 Задача T1                                 --
      task T1 is
         entry Data_MX_MO_d(MX: in MatrixN;
                            MO: in MatrixN;
                            d: in Integer);
         entry MaxZ (maxZ : in Integer);
      end T1;

      --                                 Задача T2                                 --
      task T2 is
         entry Data_MX_MO_d(MX: in MatrixN;
                            MO: in MatrixN;
                            d: in Integer);
         entry Data_Z_MS(Z: in VectorN;
                         MS: in MatrixN);

         entry MaxZ1 (maxZ1 : in Integer);
         entry MaxZ (maxZ : in Integer);
         entry Result(MA : out Matrix7H);
      end T2;

      --                                 Задача T3                                 --
      task T3 is
         entry Data_MX(MX: in MatrixN);
         entry Data_MO_d(MO: in MatrixN;
                         d: in Integer);
         entry Data_Z_MS(Z: in VectorN;
                         MS: in MatrixN);

         entry MaxZ2 (maxZi : in Integer);
         entry MaxZ4 (maxZi : in Integer);
         entry MaxZ5 (maxZi : in Integer);
         entry MaxZ6 (maxZi : in Integer);
         entry Result(MA : out Matrix6H);

      end T3;



      --                                 Задача T4                                 --
      task T4 is
         entry Data(MS: in MatrixN;
                    MX: in MatrixN;
                    MO: in MatrixN;
                    Z: in VectorN;
                    d: in Integer);

         entry MaxZ (maxZ : in Integer);
         entry Result(MA : out Matrix1H);
      end T4;

      --                                 Задача T5                                 --
      task T5 is
         entry Data(MS: in MatrixN;
                    MX: in MatrixN;
                    Z: in VectorN);
         entry MaxZ (maxZ : in Integer);
         entry Result(MA : out Matrix1H);
      end T5;

      --                                 Задача T6                                 --
      task T6 is
         entry Data_Z_MS_MO_d(Z : in VectorN;
                              MS: in MatrixN;
                              MO: in MatrixN;
                              d: in Integer);
         entry Data_MX(MX: in MatrixN);

         entry MaxZ7 (maxZi : in Integer);
         entry MaxZ8 (maxZi : in Integer);

         entry MaxZ (maxZ : in Integer);

         entry Result(MA : out Matrix3H);
      end T6;

      --                                 Задача T7                                 --
      task T7 is
         entry Data(MS: in MatrixN;
                    MX: in MatrixN;
                    MO: in MatrixN;
                    Z: in VectorN;
                    d: in Integer);

         entry MaxZ (maxZ : in Integer);
         entry Result(MA : out Matrix1H);
      end T7;

      --                                 Задача T8                                 --
      task T8 is
         entry Data(MS: in MatrixN;
                    MO: in MatrixN;
                    Z: in VectorN;
                    d: in Integer);

         entry MaxZ (maxZ : in Integer);
         entry Result(MA : out Matrix1H);
      end T8;

      -------------------------------------------------------------------------------
      --                                 ТІЛА ЗАДАЧ                                --
      -------------------------------------------------------------------------------

      --                                 Задача T1                                 --

      task body T1 is
         MA1 : MatrixN;
         Z1 : VectorN;
         MS1 : MatrixN;
         MO1 : MatrixN;
         MX1 : MatrixN;
         d1: Integer;
         maxZ1: Integer := -99999;
      begin
         Put_Line("T1 started");
         --1
         Input(MS1,1);
         Input(Z1,1);

         --2
         T2.Data_Z_MS(Z1, MS1);

         --3
         accept Data_MX_MO_d (MX : in MatrixN; MO : in MatrixN; d : in Integer) do
            MX1 := MX;
            MO1 := MO;
            d1 := d;
         end Data_MX_MO_d;

         --4
         FindMaxZ(Z1(1..H), maxZ1);

         --5
         T2.MaxZ1(maxZ1);

         --6
         accept MaxZ (maxZ : in Integer) do
            maxZ1:=maxZ;
         end MaxZ;

         --7
         Calculation(d1, maxZ1, MO1, MX1, MS1, MA1);

         --8
         T2.Result(MA1(H+1..N));

         if N < 20 then
            Output(MA1);
         end if;

         Put_Line("T1 finished");

      end T1;

      --                                 Задача T2                                 --

      task body T2 is
         MA2 : MatrixN;
         Z2 : VectorN;
         MS2 : MatrixN;
         MO2 : MatrixN;
         MX2 : MatrixN;
         d2: Integer;
         maxZ2: Integer := -99999;
      begin
         Put_Line("T2 started");

         --1
         accept Data_Z_MS (Z : in VectorN; MS : in MatrixN) do
            Z2 := Z;
            MS2 := MS;
         end Data_Z_MS;

         --2
         T3.Data_Z_MS(Z2, MS2);

         --3
         accept Data_MX_MO_d (MX : in MatrixN; MO : in MatrixN; d : in Integer) do
            MX2 := MX;
            MO2 := MO;
            d2 := d;
         end Data_MX_MO_d;

         --4
         T1.Data_MX_MO_d(MX2, MO2, d2);

         --5
         FindMaxZ(Z2(H+1..2*H), maxZ2);

         --6
         accept MaxZ1 (maxZ1 : in Integer) do
            --7
            maxZ2 := Max(maxZ1, maxZ2);
         end MaxZ1;

         --8
         T3.MaxZ2(maxZ2);

         --9
         accept MaxZ (maxZ : in Integer) do
            maxZ2:=maxZ;
         end MaxZ;

         --10
         T1.MaxZ(maxZ2);

         --11
         Calculation(d2, maxZ2, MO2, MX2, MS2, MA2);

         --12
         T3.Result(MA2(2*H+1..N));

         accept Result (MA : out Matrix7H) do
            MA := MA2(H+1..N);
         end Result;

         Put_Line("T2 finished");
      end T2;

      --                                 Задача T3                                 --

      task body T3 is
         MA3 : MatrixN;
         Z3 : VectorN;
         MS3 : MatrixN;
         MO3 : MatrixN;
         MX3 : MatrixN;
         d3: Integer;
         maxZ3: Integer := -99999;
      begin
         Put_Line("T3 started");

         --1
         accept Data_Z_MS (Z : in VectorN; MS : in MatrixN) do
            Z3 := Z;
            MS3 := MS;
         end Data_Z_MS;

         --2
         accept Data_MO_d (MO : in MatrixN; d : in Integer) do
            MO3 := MO;
            d3 := d;
         end Data_MO_d;

         --3
         accept Data_MX (MX : in MatrixN) do
            MX3 := MX;
         end Data_MX;

         --4
         T4.Data(MS3, MX3, MO3, Z3, d3);

         --5
         T5.Data(MS3, MX3, Z3);

         --6
         T6.Data_Z_MS_MO_d(Z3, MS3, MO3, d3);

         --7
         T2.Data_MX_MO_d(MX3, MO3, d3);

         --8
         FindMaxZ(Z3(2*H+1..3*H), maxZ3);

         --9
         accept MaxZ2 (maxZi : in Integer) do
            --10
            maxZ3 := Max(maxZ3, maxZi);
         end MaxZ2;

         --11
         accept MaxZ4 (maxZi : in Integer) do
            --12
            maxZ3 := Max(maxZ3, maxZi);
         end MaxZ4;

         --13
         accept MaxZ5 (maxZi : in Integer) do
            --14
            maxZ3 := Max(maxZ3, maxZi);
         end MaxZ5;

         --15
         accept MaxZ6 (maxZi : in Integer) do
            --16
            maxZ3 := Max(maxZ3, maxZi);
         end MaxZ6;

         --17
         T2.MaxZ(maxZ3);
         T4.MaxZ(maxZ3);
         T5.MaxZ(maxZ3);
         T6.MaxZ(maxZ3);

         --18
         Calculation(d3, maxZ3, MO3, MX3, MS3, MA3);

         --19
         T6.Result(MA3(5*H+1..N));

         --20
         T4.Result(MA3(3*H+1..4*H));
         T5.Result(MA3(4*H+1..5*H));

         --21
         accept Result (MA : out Matrix6H) do
            MA := MA3(2*H+1..N);
         end Result;

         Put_Line("T3 finished");

      end T3;

      --                                 Задача T4                                 --

      task body T4 is
         MA4 : MatrixN;
         Z4 : VectorN;
         MS4 : MatrixN;
         MO4 : MatrixN;
         MX4 : MatrixN;
         d4: Integer;
         maxZ4: Integer := -99999;
      begin
         Put_Line("T4 started");

         --1
         accept Data (MS : in MatrixN; MX : in MatrixN; MO : in MatrixN; Z : in VectorN; d : in Integer) do
            MS4 := MS;
            MX4 := MX;
            MO4 := MO;
            Z4 := Z;
            d4 := d;
         end Data;

         --2
         FindMaxZ(Z4(3*H+1..4*H), maxZ4);

         --3
         T3.MaxZ4(maxZ4);

         --4
         accept MaxZ (maxZ : in Integer) do
            maxZ4 := maxZ;
         end MaxZ;

         --5
         Calculation(d4, maxZ4, MO4, MX4, MS4, MA4);

         accept Result (MA : out Matrix1H) do
            MA := MA4(3*H+1..4*H);
         end Result;


         Put_Line("T4 finished");
      end T4;

      --                                 Задача T5                                 --

      task body T5 is
         MA5 : MatrixN;
         Z5 : VectorN;
         MS5 : MatrixN;
         MO5 : MatrixN;
         MX5 : MatrixN;
         d5: Integer;
         maxZ5: Integer := -99999;

      begin
         Put_Line("T5 started");

         --1
         Input(MO5, 1);
         d5 := 1;

         --3
         T3.Data_MO_d(MO5, d5);

         --2
         accept Data (MS : in MatrixN; MX : in MatrixN; Z : in VectorN) do
            MS5 := MS;
            MX5 := MX;
            Z5 := Z;
         end Data;

         --4
         FindMaxZ(Z5(4*H+1..5), maxZ5);

         --5
         T3.MaxZ5(maxZ5);

         --6
         accept MaxZ (maxZ : in Integer) do
            maxZ5 := maxZ;
         end MaxZ;

         --7
         Calculation(d5, maxZ5, MO5, MX5, MS5, MA5);

         --8
         accept Result (MA : out Matrix1H) do
            MA := MA5(4*H+1..5*H);
         end Result;

         Put_Line("T5 finished");
      end T5;

      --                                 Задача T6                                 --

      task body T6 is
         MA6 : MatrixN;
         Z6 : VectorN;
         MS6 : MatrixN;
         MO6 : MatrixN;
         MX6 : MatrixN;
         d6: Integer;
         maxZ6: Integer := -99999;
      begin
         Put_Line("T6 started");

         --2
         accept Data_MX (MX : in MatrixN) do
            MX6 := MX;
         end Data_MX;

         --5
         T3.Data_MX(MX6);

         --1
         accept Data_Z_MS_MO_d (Z : in VectorN; MS : in MatrixN; MO : in MatrixN; d : in Integer) do
            Z6 := Z;
            MS6 := MS;
            MO6 := MO;
            d6 := d;
         end Data_Z_MS_MO_d;

         --3
         T8.Data(MS6, MO6, Z6, d6);

         --4
         T7.Data(MS6, MX6, MO6, Z6, d6);

         --6
         FindMaxZ(Z6(5*H+1..6*H), maxZ6);

         --7
         accept MaxZ7 (maxZi : in Integer) do
            --8
            maxZ6 := Max(maxZi, maxZ6);
         end MaxZ7;

         --9
         accept MaxZ8 (maxZi : in Integer) do
            --10
            maxZ6 := Max(maxZi, maxZ6);
         end MaxZ8;

         --11
         T3.MaxZ6(maxZ6);

         --12
         accept MaxZ (maxZ : in Integer) do
            maxZ6 := maxZ;
         end MaxZ;

         --13
         T7.MaxZ(maxZ6);
         T8.MaxZ(maxZ6);

         --14
         Calculation(d6, maxZ6, MO6, MX6, MS6, MA6);

         --15
         T7.Result(MA6(6*H+1..7*H));

         T8.Result(MA6(7*H+1..N));

         --16
         accept Result (MA : out Matrix3H) do
            MA := MA6(5*H+1..N);
         end Result;

         Put_Line("T6 finished");
      end T6;

      --                                 Задача T7                                 --

      task body T7 is
        MA7 : MatrixN;
         Z7 : VectorN;
         MS7 : MatrixN;
         MO7 : MatrixN;
         MX7 : MatrixN;
         d7: Integer;
         maxZ7: Integer := -99999;
      begin
         Put_Line("T7 started");

         --1
         accept Data (MS : in MatrixN; MX : in MatrixN; MO : in MatrixN; Z : in VectorN; d : in Integer) do
            MS7 := MS;
            MX7 := MX;
            MO7 := MO;
            Z7 := Z;
            d7 := d;
         end Data;

         --2
         FindMaxZ(Z7(6*H+1..7*H), maxZ7);

         --3
         T6.MaxZ7(maxZ7);

         --4
         accept MaxZ (maxZ : in Integer) do
            maxZ7 := maxZ;
         end MaxZ;

         --5
         Calculation(d7, maxZ7, MO7, MX7, MS7, MA7);

         --6
         accept Result (MA : out Matrix1H) do
            MA := MA7(6*H+1..7*H);
         end Result;

         Put_Line("T7 finished");
      end T7;

            --                                 Задача T8                                 --

      task body T8 is
        MA8 : MatrixN;
         Z8 : VectorN;
         MS8 : MatrixN;
         MO8 : MatrixN;
         MX8 : MatrixN;
         d8: Integer;
         maxZ8: Integer := -99999;
      begin
         Put_Line("T8 started");

         --1
         Input(MX8, 1);

         --2
         T6.Data_MX(MX8);

         --3
         accept Data (MS : in MatrixN; MO : in MatrixN; Z : in VectorN; d : in Integer) do
            MS8 := MS;
            MO8 := MO;
            Z8 := Z;
            d8 := d;
         end Data;

         --4
         FindMaxZ(Z8(7*H+1..N), maxZ8);

         --5
         T6.MaxZ8(maxZ8);

         --6
         accept MaxZ (maxZ : in Integer) do
            maxZ8 := maxZ;
         end MaxZ;

         --7
         Calculation(d8, maxZ8, MO8, MX8, MS8, MA8);

         accept Result (MA : out Matrix1H) do
            MA := MA8(7*H+1..N);
         end Result;

         Put_Line("T8 finished");
      end T8;

   begin
      null;
   end StartTasks;
begin
   Put_Line ("Lab7 started");
   StartTasks;
   Put_Line ("Lab7 finished");
end Main;

