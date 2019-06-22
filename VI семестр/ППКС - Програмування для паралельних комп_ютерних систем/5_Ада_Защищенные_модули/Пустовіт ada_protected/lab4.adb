----------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #4. Ada. Protected unit        --
--                  Func: MA = MB*(MC + a*MZ*MR)              --
--                   IO-73 Pustovit Michael                   --
--                         7.03.2010                          --
----------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab4 is
   N: integer := 8;   --size of structures
   P: integer := 4;   --count of processors
   H: integer := N/P; --size of piece

   type Vect is array (1..N) of integer;
   type Matr is array (1..N) of Vect;

   MA, MB, MC, MR, MZ: Matr;
   a                 : integer; --alpha

   protected Synchro is
      entry WaitIn;
      entry WaitEnd;
      procedure SignalIn;
      procedure SignalEnd;

      private
      F1: integer := 0;
      F2: integer := 0;
   end Synchro;

   protected body Synchro is
      --Ojidanie vvoda dannih vsemi processami
      entry WaitIn when F1 >= P is
      begin
         null;
      end WaitIn;

      --Ojidanie rasscheta vsemi processami
      entry WaitEnd when F2 >= P-1 is
      begin
         null;
      end WaitEnd;

      --Signal o vvode nachalnih dannih
      procedure SignalIn is
      begin
         F1 := F1 + 1;
      end SignalIn;

      --Signal ob okonchanii osnovnogo rasscheta
      procedure SignalEnd is
      begin
         F2 := F2 + 1;
      end SignalEnd;
   end Synchro;

   protected Dostup is
      procedure Copy(MBx, MZx: out Matr; ax: out  integer);
   end Dostup;

   protected body Dostup is

      procedure Copy(MBx, MZx: out Matr; ax: out  integer) is
      begin
         MBx := MB;
         MZx := MZ;
         ax := a;
      end;

   end Dostup;

   procedure Vec_print(v: Vect) is
   begin
      for i in 1 .. N loop
         Put(v(i), 4);
      end loop;
   end;

   procedure Matr_print(m: Matr) is
   begin
      for i in 1..n loop
         Vec_print(m(i));
         New_Line;
      end loop;
   end Matr_print;

   procedure Process(MBx, MZx: Matr; ax, num: integer);
   procedure Process(MBx, MZx: Matr; ax, num: integer) is
      T     : Vect;
      sum   : integer;
   begin
      for z in ((num-1)*H + 1) .. num*H loop
         for i in 1..N loop
            sum := 0;
            for j in 1..N loop
               sum := sum + MZx(i)(j) * MR(j)(z) * ax;
            end loop;
            T(i) := sum;
         end loop;

         for i in 1..N loop
            T(i) := T(i) + MC(i)(z);
         end loop;

         for i in 1..N loop
            sum := 0;
            for j in 1..N loop
               sum := sum + MBx(i)(j) * T(j);
            end loop;
            MA(i)(z) := sum;
         end loop;
      end loop;
   end;

   procedure Task_start is
      --wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
      task T1;
      task body T1 is
         MB1, MZ1: Matr;
         a1: integer;
         num: integer := 1;
      begin
         Put_Line("T1: start");
         --Data entering
         for i in 1 .. N loop
            for j in 1 .. N loop
               MR(i)(j) := 1;
            end loop;
         end loop;

         Put_Line("T1: input finished");
         Synchro.SignalIn;
         Synchro.WaitIn;

         Dostup.Copy(MB1, MZ1, a1);
         Put_Line("T1: copy finished");

         Process(MB1, MZ1, a1, num);
         Synchro.WaitEnd;

         Put_Line("T1: output");
         if (N <= 8) then
            Matr_print(MA);
         end if;
         Put_Line("T1: stop");
      end T1;

      --wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
      task T2;
      task body T2 is
         MB2, MZ2: Matr;
         a2: integer;
         num: integer := 2;
      begin
         Put_Line("T2: start");
         --Data entering
         for i in 1 .. N loop
            for j in 1 .. N loop
               MC(i)(j) := 1;
            end loop;
         end loop;

         Put_Line("T2: input finished");
         Synchro.SignalIn;
         Synchro.WaitIn;

         Dostup.Copy(MB2, MZ2, a2);
         Put_Line("T2: copy finished");

         Process(MB2, MZ2, a2, num);
         Synchro.SignalEnd;
         Put_Line("T4: finish signal");
         Put_Line("T2: stop");
      end T2;

      --wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
      task T3;
      task body T3 is
         MB3, MZ3: Matr;
         a3: integer;
         num: integer := 3;
      begin
         Put_Line("T3: start");
         --Data entering
         for i in 1 .. N loop
            for j in 1 .. N loop
               MZ(i)(j) := 1;
            end loop;
         end loop;

         a := 1;

         Put_Line("T3: input finished");
         Synchro.SignalIn;
         Synchro.WaitIn;

         Dostup.Copy(MB3, MZ3, a3);
         Put_Line("T3: copy finished");

         Process(MB3, MZ3, a3, num);
         Synchro.SignalEnd;
         Put_Line("T4: finish signal");
         Put_Line("T3: stop");
      end T3;

      --wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
      task T4;
      task body T4 is
         MB4, MZ4: Matr;
         a4: integer;
         num: integer := 4;
      begin
         Put_Line("T4: start");
         --Data entering
         for i in 1 .. N loop
            for j in 1 .. N loop
               MB(i)(j) := 1;
            end loop;
         end loop;

         Put_Line("T4: input finished");
         Synchro.SignalIn;
         Synchro.WaitIn;

         Dostup.Copy(MB4, MZ4, a4);
         Put_Line("T4: copy finished");

         Process(MB4, MZ4, a4, num);
         Synchro.SignalEnd;
         Put_Line("T4: finish signal");
         Put_Line("T4: stop");
      end T4;

   begin
      null;
   end Task_start;

begin
   Task_start;
end lab4;

