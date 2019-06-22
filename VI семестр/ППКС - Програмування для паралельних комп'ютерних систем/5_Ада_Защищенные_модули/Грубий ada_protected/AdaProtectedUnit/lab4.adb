----------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #4. Ada. Protected unit        --
--                 Func: MA = a*(MB*(MZ + MO*MF)              --
--                   IO-73 Grubyi Pavel                       --
--                         17.03.2010                         --
----------------------------------------------------------------

with Ada.Text_Io, Ada.Integer_Text_Io, Ada.Calendar;
use Ada.Text_Io, Ada.Integer_Text_Io, Ada.Calendar;

procedure lab4 is
   N : integer := 1000;   --size of structures
   P : integer := 4;   --count of processors
   H : integer := N / P; --size of piece

   type TVector is array (1 .. N) of integer;
   type TMatrix is array (1 .. N) of TVector;

   MA, MZ, MF : TMatrix;

   procedure VectorInput (vec : out TVector; x : in  integer);

   procedure VectorOutput (vec : in TVector);

   procedure MatrixInput (m : out TMatrix; x : in  integer);

   procedure MatrixOutput (m : in TMatrix);

   -----------------------------------------
   protected CalcSync is
      entry WaitForCalc;
      procedure CalcSignal;

   private
      F : integer := 0;
   end CalcSync;

   protected body CalcSync is

      entry WaitForCalc when F >= 3 is
      begin
         if N <= 8 then
            MatrixOutput (MA);
         end if;
      end WaitForCalc;

      procedure CalcSignal is
      begin
         F := F + 1;
      end CalcSignal;

   end CalcSync;
   ------------------------------------------
   ------------------------------------------
   protected InputSync is
      entry WaitForInput;
      procedure InputSignal;

   private
      F : integer := 0;
   end InputSync;

   protected body InputSync is

      entry WaitForInput when F >= 1 is
      begin
         null;
      end WaitForInput;

      procedure InputSignal is
      begin
         F := F + 1;
      end InputSignal;

   end InputSync;
   ------------------------------------------
   ------------------------------------------
   protected Res_a is
      procedure seta (x : in  integer);
      function geta return integer;

   private
      a : integer;
   end Res_a;

   protected body Res_a is

      procedure seta (x : in  integer) is
      begin
         a := x;
      end;

      function geta return integer is
      begin
         return a;
      end;

   end Res_a;
   ------------------------------------------
   ------------------------------------------
   protected Res_MB is
      procedure setMB (x : in  integer);
      function getMB return TMatrix;

   private
      MB : TMatrix;
   end Res_MB;

   protected body Res_MB is

      procedure setMB (x : in  integer) is
      begin
         MatrixInput (MB, x);
      end;

      function getMB return TMatrix is
      begin
         return MB;
      end;

   end Res_MB;
   ------------------------------------------
   ------------------------------------------
   protected Res_MO is
      procedure setMO (x : in  integer);
      function getMO return TMatrix;

   private
      MO : TMatrix;
   end Res_MO;

   protected body Res_MO is

      procedure setMO (x : in  integer) is
      begin
         MatrixInput (MO, x);
      end;

      function getMO return TMatrix is
      begin
         return MO;
      end;

   end Res_MO;
   ------------------------------------------

   procedure Process (id, a : integer; MO, MB : in TMatrix) is
      MX : TMatrix;
   begin
      for j in ((H * id)+1) .. (H * (id + 1)) loop
         for i in 1 .. N loop
            MX (i) (j) := 0;
            --put(MX(i)(j));
            -- MO*MF
            for k in 1 .. N loop
               MX (i) (j) := MX (i) (j) + MO (i) (k) * MF (K) (J);
            end loop;
            -- MZ + MO*MF
            MX (i) (j) := MX (i) (j) + MZ (i) (j);
         end loop;
      end loop;

      for j in ((H * id)+1) .. (H * (id + 1)) loop
         for i in 1 .. N loop
            MA (i) (j) := 0;
            -- MB*(MZ + MO*MF)
            for k in 1 .. N loop
               MA (i) (j) := MA (i) (j) + MB (i) (k) * MX (K) (J);
            end loop;
            -- a*(MB*(MZ + MO*MF))
            MA (i) (j) := MA (i) (j) * a;
         end loop;
      end loop;
   end Process;

   -----------------------------------------------------
   task T1;
   task body T1 is
      MB1, MO1    : TMatrix;
      a1          : integer;
      id          : integer := 0;
      start, stop : time;
   begin
      Put_Line ("T1: start");
      start := Clock;
      Res_a.seta (1);
      Res_MB.setMB (1);
      Res_MO.setMO (1);
      MatrixInput (MZ, 1);
      MatrixInput (MF, 1);
      InputSync.InputSignal;
      Put_Line ("T1: input finished");

      a1 := Res_a.geta;
      MB1 := Res_MB.getMB;
      MO1 := Res_MO.getMO;
      Put_Line ("T1: copy finished");

      Process (id, a1, MO1, MB1);
      Put_Line ("T1: calc ended");
      CalcSync.CalcSignal;
      stop := Clock;
      Put_Line ("T1: finished in " & Duration'Image (stop-start));
   end T1;

   -----------------------------------------------------
   task T2;
   task body T2 is
      MB2, MO2    : TMatrix;
      a2          : integer;
      id          : integer := 1;
      start, stop : time;
   begin
      Put_Line ("T2: start");
      start := Clock;
      InputSync.WaitForInput;

      a2 := Res_a.geta;
      MO2 := Res_MO.getMO;
      MB2 := Res_MB.getMB;
      Put_Line ("T2: copy finished");

      Process (id, a2, MO2, MB2);
      Put_Line ("T2: calc ended");
      CalcSync.CalcSignal;

      stop := Clock;
      Put_Line ("T2: finished in " & Duration'Image (stop-start) );
   end T2;

   -----------------------------------------------------
   task T3;
   task body T3 is
      MB3, MO3    : TMatrix;
      a3          : integer;
      id          : integer := 2;
      start, stop : time;
   begin
      Put_Line ("T3: start");
      start := Clock;

      InputSync.WaitForInput;

      MB3 := Res_MB.getMB;
      a3 := Res_a.geta;
      MO3 := Res_MO.getMO;
      Put_Line ("T3: copy finished");

      Process (id, a3, MO3, MB3);
      Put_Line ("T3: calc ended");
      CalcSync.WaitForCalc;
      stop := Clock;
      Put_Line ("T3: finished in " & Duration'Image (stop-start));
   end T3;

   -----------------------------------------------------
   task T4;
   task body T4 is
      MB4, MO4    : TMatrix;
      a4          : integer;
      id          : integer := 3;
      start, stop : time;
   begin
      Put_Line ("T4: start");
      start := Clock;

      InputSync.WaitForInput;

      MO4 := Res_MO.getMO;
      a4 := Res_a.geta;
      MB4 := Res_MB.getMB;
      Put_Line ("T4: copy finished");

      Process (id, a4, MO4, MB4);
      Put_Line ("T4: calc ended");
      CalcSync.CalcSignal;
      stop := Clock;
      Put_Line ("T4: finished in " & Duration'Image (stop-start));
   end T4;
   -----------------------------------------------------

   procedure VectorInput (vec : out TVector; x : in  integer) is
   begin
      for i in 1 .. N loop
         vec (i) := x;
      end loop;
   end VectorInput;

   procedure VectorOutput (vec : in TVector) is
   begin
      for i in 1 .. N loop
         put (vec (i), 4);
      end loop;
      new_line;
   end VectorOutput;

   procedure MatrixInput (m : out TMatrix; x : in  integer) is
   begin
      for i in 1 .. N loop
         VectorInput (m (i), x);
      end loop;
   end MatrixInput;

   procedure MatrixOutput (m : in TMatrix) is
   begin
      for i in 1 .. N loop
         VectorOutput (m (i));
         new_line;
      end loop;
   end MatrixOutput;

begin
   null;
end lab4;

