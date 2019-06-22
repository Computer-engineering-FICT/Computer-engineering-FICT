----------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #7. Ada. Rondevouz             --
--                 Func: A = B*(MX*MZ - a*ME)                 --
--                   IO-73 Grubyi Pavel                       --
--                         17.03.2010                         --
----------------------------------------------------------------
with Ada.Text_Io, Matrix_Pack;
use Ada.Text_Io, Matrix_Pack;

procedure main is
   task T1 is
      entry input2 (in_a : in integer; in_MX : in Matrix);
      entry input3 (in_MZ : in Matrix_H);
   end T1;
   ---------------------------------------------------
   task T2 is
      entry input1 (in_B : in Vector; in_ME : in Matrix_4H);
      entry input2 (in_a : in integer; in_MX : in Matrix);
      entry input3 (in_MZ : in Matrix_2H);
      entry result (in_A : in Vector_H);
   end T2;
   ---------------------------------------------------
   Task T3 is
      entry input1 (in_B : in Vector; in_ME : in Matrix_H);
      entry input2 (in_a : in integer; in_MX : in Matrix);
      entry input3 (in_MZ : in Matrix_H);
      entry result (in_A : in Vector_2H);
   end T3;
   ---------------------------------------------------
   task T4 is
      entry input1 (in_B : in Vector; in_ME : in Matrix_H);
      entry input2 (in_a : in integer; in_MX : in Matrix);
      entry input3 (in_MZ : in Matrix_4H);
      entry result (in_A : in Vector_3H);
   end T4;
   ---------------------------------------------------
   task T5 is
      entry input1T2 (in_ME : in Matrix_2H);
      entry input1T6 (in_B : in Vector; in_ME : in Matrix_2H);
      entry input2 (in_a : in integer; in_MX : in Matrix);
      entry input3T4 (in_MZ : in Matrix_2H);
      entry input3T8 (in_MZ : in Matrix_2H);
      entry result (in_A : in Vector_H);
   end T5;
   ---------------------------------------------------
   Task T6 is
      entry input1 (in_B : in Vector; in_ME : in Matrix_4H);
      entry input2 (in_a : in integer; in_MX : in Matrix);
      entry input3 (in_MZ : in Matrix_H);
   end T6;
   ---------------------------------------------------
   task T7 is
      entry input1 (in_B : in Vector; in_ME : in Matrix_H);
      entry input3 (in_MZ : in Matrix_H);
   end T7;
   ---------------------------------------------------
   task T8 is
      entry input1 (in_B : in Vector; in_ME : in Matrix_2H);
      entry input2 (in_a : in integer; in_MX : in Matrix);
      entry input3 (in_MZ : in Matrix_4H);
      entry resultT5 (in_A : in Vector_2H);
      entry resultT7 (in_A : in Vector_H);
   end T8;
   ---------------------------------------------------
   task T9 is
      entry input1 (in_B : in Vector; in_ME : in Matrix_H);
      entry input2 (in_a : in integer; in_MX : in Matrix);
      entry resultT4 (in_A : in Vector_4H);
      entry resultT8 (in_A : in Vector_4H);
   end T9;

   task body T1 is
      a : integer;
      B : Vector;
      MZ  : Matrix_H;
      MX, ME : Matrix;
      Ah : Vector_H;
   begin
      Put_line ("T1 started");
      B := getVector(1);
      ME := getMatrix (1);
      --ME (1) (2) := 10;
      Put_line ("T1 input finished");

      T2.input1 (B, ME (H + 1 .. 5 * H));
      Put_line ("T1 data sent T2");
      T6.input1 (B, ME (5 * H + 1 .. 9 * H));
      Put_line ("T1 data sent T6");

      accept input2 (in_a : in integer; in_MX : in Matrix) do
         a := in_a;
         MX := in_MX;
      end input2;

      Put_line ("T1 input2 accepted");

      T2.input2 (a, MX);
      Put_line ("T1 input2 T2");

      accept input3 (in_MZ : in Matrix_H) do
         MZ := in_MZ;
      end input3;

       Put_line ("T1 input3");

      mainCalc (Ah, a, B, MX, MZ, ME (1 .. H));
      Put_line ("T1 calc finished");
      T2.result (Ah);
      Put_line ("Process T1 complete");
   end T1;
   ---------------------------------------------
   task body T2 is
      a      : integer;
      B      : Vector;
      MX     : Matrix;
      MZ     : Matrix_2H;
      ME     : Matrix_4H;
      A2h     : Vector_2H;
   begin
      Put_line ("Process T2 started");

      accept input1 (in_B : in Vector; in_ME : in Matrix_4H) do
         B := in_B;
         ME := in_ME;
      end input1;

      T3.input1 (B, ME (H + 1 .. 2 * H));
      Put_line ("T2 input1 T3");
      T5.input1T2 (ME (2 * H + 1 .. 4 * H));
      Put_line ("T2 input1 T5");

      accept input2 (in_a : in integer; in_MX : in Matrix) do
         a := in_a;
         MX := in_MX;
      end input2;

      T3.input2 (a, MX);
      Put_line ("T2 input2 T3");

      accept input3 (in_MZ : in Matrix_2H) do
         MZ := in_MZ;
      end input3;

      T1.input3(MZ(1..H));

      mainCalc (A2h (H+1..2*H), a, B, MX, MZ(H+1..2*H), ME (1 .. H));

      accept result (in_A : in Vector_H) do
         A2h (1..H) := in_A;
      end result;

      T3.result(A2h);
      Put_line ("Process T2 complete");
   end T2;
   ---------------------------------------------
   task body T3 is
      a       : integer;
      B       : Vector;
      MX      : Matrix;
      MZ      : Matrix_H;
      ME      : Matrix_H;
      A3h     : Vector_3H;
   begin
      Put_line ("Process T3 started");

      accept input1 (in_B : in Vector; in_ME : in Matrix_H) do
         B := in_B;
         ME := in_ME;
      end input1;
      Put_line ("T3 input1 accepted");

      accept input2 (in_a : in integer; in_MX : in Matrix) do
         a := in_a;
         MX := in_MX;
      end input2;
      Put_line ("T3 input2 accepted");

      accept input3 (in_MZ : in Matrix_H) do
         MZ := in_MZ;
      end input3;
      Put_line ("T3 input3 accepted");

      mainCalc (A3h (2*H + 1 .. 3 * H), a, B, MX, MZ, ME);

      accept result (in_A : in Vector_2H) do
         A3h (1 .. 2*H) := in_A;
      end result;

      T4.result (A3h);
      Put_line ("Process T3 complete");
   end T3;
   ---------------------------------------------
   task body T4 is
      a       : integer;
      B       : Vector;
      MX      : Matrix;
      MZ      : Matrix_4H;
      ME      : Matrix_H;
      A4h     : Vector_4H;
   begin
      Put_line ("Process T4 started");

      accept input1 (in_B : in Vector; in_ME : in Matrix_H) do
         B := in_B;
         ME := in_ME;
      end input1;

      accept input2 (in_a : in integer; in_MX : in Matrix) do
         a := in_a;
         MX := in_MX;
      end input2;

      accept input3 (in_MZ : in Matrix_4H) do
         MZ := in_MZ;
      end input3;

      T5.input3T4 (MZ (1 .. 2 * H));
      T3.input3 (MZ (2 * H + 1 .. 3 * H));

      mainCalc (A4h (3*H + 1 .. 4 * H), a, B, MX, MZ(3*H+1..4*H), ME);

      accept result (in_A : in Vector_3H) do
         A4h (1 .. 3*H) := in_A;
      end result;

      T9.resultT4 (A4h);
      Put_line ("Process T4 complete");
   end T4;
   ---------------------------------------------
   task body T5 is
      a       : integer;
      B       : Vector;
      MX      : Matrix;
      MZ      : Matrix_4H;
      ME      : Matrix_4H;
      A2h     : Vector_2H;
   begin
      Put_line ("Process T5 started");

      accept input1T2 (in_ME : in Matrix_2H) do
         ME(1..2*H) := in_ME;
      end input1T2;

      accept input1T6 (in_B : in Vector; in_ME : in Matrix_2H) do
         B := in_B;
         ME(2*H+1..4*H) := in_ME;
      end input1T6;

      T4.input1 (B, ME (1 .. H));
      Put_line ("T5 input1 T4");
      T8.input1 (B, ME (2*H + 1 .. 4 * H));
      Put_line ("T5 input1 T8");

      accept input2 (in_a : in integer; in_MX : in Matrix) do
         a := in_a;
         MX := in_MX;
      end input2;

      T4.input2 (a, MX);

      accept input3T4 (in_MZ : in Matrix_2H) do
         MZ(1..2*H) := in_MZ;
      end input3T4;

      accept input3T8 (in_MZ : in Matrix_2H) do
         MZ(2*H+1..4*H) := in_MZ;
      end input3T8;

      T6.input3 (MZ (3 * H + 1 .. 4 * H));
      T2.input3 (MZ (1..2*H));

      mainCalc (A2h (1 .. H), a, B, MX, MZ (2*H + 1 .. 3 * H), ME (H+1 .. 2*H));

      accept result (in_A : in Vector_H) do
         A2h (H + 1 .. 2 * H) := in_A;
      end result;

      T8.resultT5 (A2h);
      Put_line ("Process T5 complete");
   end T5;
   ---------------------------------------------
   task body T6 is
      a       : integer;
      B       : Vector;
      MX      : Matrix;
      MZ      : Matrix_H;
      ME      : Matrix_4H;
      Ah      : Vector_H;
   begin
      Put_line ("Process T6 started");

      accept input1 (in_B : in Vector; in_ME : in Matrix_4H) do
         B := in_B;
         ME := in_ME;
      end input1;

      T5.input1T6 (B, ME (2 * H + 1 .. 4 * H));
      Put_line ("T6 input1 T5");
      T7.input1 (B, ME (H + 1 .. 2 * H));
      Put_line ("T6 input1 T7");

      accept input2 (in_a : in integer; in_MX : in Matrix) do
         a := in_a;
         MX := in_MX;
      end input2;

      Put_line ("T6 input2 accepted");

      T1.input2 (a, MX);
      Put_line ("T6 input2 T1");
      T5.input2 (a, MX);
      Put_line ("T6 input2 T5");


      accept input3 (in_MZ : in Matrix_H) do
         MZ := in_MZ;
      end input3;

      mainCalc (Ah, a, B, MX, MZ, ME (1 .. H));
      T5.result (Ah);
      Put_line ("Process T6 complete");
   end T6;
   ---------------------------------------------
   task body T7 is
      a       : integer;
      B       : Vector;
      MX      : Matrix;
      MZ      : Matrix_H;
      ME      : Matrix_H;
      Ah      : Vector_H;
   begin
      Put_line ("Process T7 started");
      a := 1;
      MX := getMatrix (1);

      accept input1 (in_B : in Vector; in_ME : in Matrix_H) do
         B := in_B;
         ME := in_ME;
      end input1;

      Put_line ("T7 input 1 accepted");

      T6.input2 (a, MX);
      Put_line ("T7 input2 T6");
      T8.input2 (a, MX);
      Put_line ("T7 input2 T8");

      accept input3 (in_MZ : in Matrix_H) do
         MZ := in_MZ;
      end input3;

      mainCalc (Ah, a, B, MX, MZ, ME);
      T8.resultT7 (Ah);
      Put_line ("Process T7 complete");
   end T7;
   ---------------------------------------------
   task body T8 is
      a       : integer;
      B       : Vector;
      MX      : Matrix;
      MZ      : Matrix_4H;
      ME      : Matrix_2H;
      A4h     : Vector_4H;
   begin
      Put_line ("Process T8 started");

      accept input2 (in_a : in integer; in_MX : in Matrix) do
         a := in_a;
         MX := in_MX;
      end input2;

      T9.input2 (a, MX);
      Put_line ("T8 input2 T9");

      accept input1 (in_B : in Vector; in_ME : in Matrix_2H) do
         B := in_B;
         ME := in_ME;
      end input1;

      T9.input1 (B, ME (H + 1 .. 2 * H));
      Put_line ("T8 input1 T9");

      accept input3 (in_MZ : in Matrix_4H) do
         MZ := in_MZ;
      end input3;

      T7.input3 (MZ (3 * H + 1 .. 4 * H));
      T5.input3T8 (MZ (1 .. 2 * H));

      mainCalc (A4h (3*H + 1 .. 4 * H), a, B, MX, MZ (3 * H + 1 .. 4 * H), ME (1 .. H));

      accept resultT5 (in_A : in Vector_2H) do
         A4h (1 .. 2*H) := in_A;
      end resultT5;

      accept resultT7 (in_A : in Vector_H) do
         A4h (2*H+1 .. 3 * H) := in_A;
      end resultT7;

      T9.resultT8 (A4h);
      Put_line ("Process T8 complete");
   end T8;
   ---------------------------------------------
   task body T9 is
      a       : integer;
      B       : Vector;
      MX      : Matrix;
      MZ      : Matrix;
      ME      : Matrix_H;
      A9h     : Vector;
   begin
      Put_line ("Process T9 started");
      MZ := getMatrix (1);

      accept input2 (in_a : in integer; in_MX : in Matrix) do
         a := in_a;
         MX := in_MX;
      end input2;

      accept input1 (in_B : in Vector; in_ME : in Matrix_H) do
         B := in_B;
         ME := in_ME;
      end input1;

      T4.input3 (MZ (1 .. 4 * H));
      Put_line ("T9 input3 T4");
      T8.input3 (MZ (4 * H + 1 .. 8 * H));
      Put_line ("T9 input3 T8");

      mainCalc (A9h (8 * H + 1 .. 9 * H), a, B, MX, MZ(8 * H + 1 .. 9 * H), ME);

      accept resultT4 (in_A : in Vector_4H) do
         A9h (1 .. 4 * H) := in_A;
      end resultT4;

      accept resultT8 (in_A : in Vector_4H) do
         A9h (4 * H + 1 .. 8 * H) := in_A;
      end resultT8;

      putVector(A9h);
      Put_line ("Process T9 complete");
   end T9;

begin
   null;
end main;
