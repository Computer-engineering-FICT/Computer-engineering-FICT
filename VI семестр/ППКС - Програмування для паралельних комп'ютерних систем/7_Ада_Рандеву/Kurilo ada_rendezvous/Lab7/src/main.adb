with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control, Ada.Command_Line;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control, Ada.Command_Line;

procedure Main is

   N: integer := 6; --Size of vectors and matrixes
   P: integer := 6; --Number of tasks
   H: integer := N/P;

   type Vector_General is array(integer range <>) of Integer;
   subtype Vector is Vector_General(1..N);

   type Matrix_General is array(integer range <>) of Vector;
   subtype Matrix is Matrix_General(1..N);

      procedure print(MA: in Matrix) is
   begin
      put_line("[");
      for i in MA'Range loop

         put("   [");
         for j in MA'Range loop

            put(MA(i)(j), Width => 10);

            if j /= MA'Last then
              put(", ");
            end if;
         end loop;
         put("]");

         if i /= MA'Last then
            put_line(", ");
         else
            new_line;
         end if;
      end loop;
      put_line("]");
   end print;

      procedure print(A: in Vector) is
   begin
      put("[");
      for i in A'Range loop
         put(A(i), Width => 10);

         if i /= A'Last then
            put(", ");
         end if;
      end loop;
      put_line("]");
   end print;

   protected Operation is
      procedure output(MA: Matrix);
      procedure output(V: Vector);
   end Operation;

   protected body Operation is
      procedure output(MA: Matrix) is
      begin
         print(MA);
      end output;

      procedure output(V: Vector) is
      begin
         print(V);
      end output;
   end Operation;

   procedure calculation(left, right: Integer; A: out Vector; B: out Vector; MB1, MC1, MO1, MT1, ME1: in Matrix; MA1: out Matrix) is
   begin
      for i in left..right loop
         for j in 1..N loop
            A(j) := 0;
            B(j) := 0;
            for k in 1..N loop
               A(j) := A(j) + MB1(k)(j) * MC1(i)(k);
               B(j) := B(j) + MO1(k)(j) * MT1(i)(k);
            end loop;
            MA1(i)(j) := A(j)+B(j)+ME1(i)(j);
         end loop;
      end loop;
   end calculation;

   --Task specification T1-----------------------------------------------
   task T1 is
      entry Send_fromT2(MB: in Matrix; MO: in Matrix; MEh: in Matrix_General; ME2h: in Matrix_General);
      entry Send_fromT6(MCh: in Matrix_General; MTh: in Matrix_General);
      entry Send_MAT6(MA2h: in Matrix_General);
   end T1;
   ----------------------------------------------------------------------

   --Task specification T2-----------------------------------------------
   task T2 is
      entry Send_fromT3(MCh: in Matrix_General; MTh: in Matrix_General);
      entry Send_MAT1(MAh: in Matrix_General; MA2h: in Matrix_General);
      entry Send_MAT3(MA2h: in Matrix_General);
   end T2;
   ----------------------------------------------------------------------

   --Task specification T3-----------------------------------------------
   task T3 is
      entry Send_fromT2(MB: in Matrix; MO: in Matrix; ME2h: in Matrix_General);
      entry Send_fromT4(MC2h: in Matrix_General; MT2h: in Matrix_General);
      entry Send_MAT4(MAh: in Matrix_General);
   end T3;
   ----------------------------------------------------------------------

   --Task specification T4-----------------------------------------------
   task T4 is
      entry Send_fromT3(MB: in Matrix; MO: in Matrix; MEh: in Matrix_General);
   end T4;
   ----------------------------------------------------------------------

   --Task specification T5-----------------------------------------------
   task T5 is
      entry Send_fromT4(MCh: in Matrix_General; MC2h: in Matrix_General; MTh: in Matrix_General; MT2h: in Matrix_General);
      entry Send_fromT6(MB: in Matrix; MO: in Matrix; MEh: in Matrix_General);
   end T5;
   ----------------------------------------------------------------------

   --Task specification T6-----------------------------------------------
   task T6 is
      entry Send_fromT5(MC1h: in Matrix_General; MCh: in Matrix_General; MT1h: in Matrix_General; MTh: in Matrix_General);
      entry Send_fromT1(MB: in Matrix; MO: in Matrix; ME2h: in Matrix_General);
      entry Send_MAT5(MAh: in Matrix_General);
   end T6;
   ----------------------------------------------------------------------

   --Task body T1--------------------------------------------------------
   task body T1 is
      MA1, MB1, MO1: Matrix;
      MC1, MT1, ME1: Matrix;
      A, B: Vector;
   begin
      put_line("Task T1 has started.");

      -- 1. Receive MB, MO, ME3h from T2
      accept Send_fromT2(MB: in Matrix; MO: in Matrix; MEh: in Matrix_General; ME2h: in Matrix_General) do
         MB1 := MB;
         MO1 := MO;
         ME1(MEh'Range) := MEh;
         ME1(ME2h'Range) := ME2h;
      end Send_fromT2;

      -- 2. Send MB, MO, ME2h to T6
      T6.Send_fromT1(MB1, MO1, ME1(4*H+1..N));

      -- 3. Receive MCh, MTh from T6
      accept Send_fromT6(MCh: in Matrix_General; MTh: in Matrix_General) do
         MC1(MCh'Range) := MCh;
         MT1(MTh'Range) := MTh;
      end Send_fromT6;

      -- 4. Calculate
      calculation(1, H, A => A,
              B   => B,
              MB1 => MB1,
              MC1 => MC1,
              MO1 => MO1,
              MT1 => MT1,
              ME1 => ME1,
              MA1 => MA1);

      -- 5. Receive MA2h from T6
      accept Send_MAT6(MA2h: in Matrix_General) do
	MA1(MA2h'Range) := MA2h;
      end Send_MAT6;

      -- 6. Send MA3h to T2
      T2.Send_MAT1(MA1(1..H), MA1(4*H+1..N));

      put_line("Task T1 has finished.");
   end T1;
   ----------------------------------------------------------------------

   --Task body T2--------------------------------------------------------
   task body T2 is
      MA, MB, MO: Matrix;
      MC, MT, ME: Matrix;
      A, B: Vector;

   begin
      put_line("Task T2 has started.");

      -- 1. Input MB, MO, ME
      for i in 1..N loop
         for j in 1..N loop
            MB(i)(j) := 1;
            MO(i)(j) := 1;
            ME(i)(j) := 1;
         end loop;
      end loop;

      -- 2. Send MB, MO, ME3h to T1
      T1.Send_fromT2(MB, MO, ME(1..H), ME(4*H+1..N));

      -- 3. Send MB, MO, ME2h to T3
      T3.Send_fromT2(MB, MO, ME(2*H+1..4*H));

      -- 4. Receive MCh, MTh from T3
      accept Send_fromT3(MCh: in Matrix_General; MTh: in Matrix_General) do
         MC(MCh'Range) := MCh;
         MT(MTh'Range) := MTh;
      end Send_fromT3;

      -- 5. Calculate
      calculation(H+1, 2*H, A => A,
              B   => B,
              MB1 => MB,
              MC1 => MC,
              MO1 => MO,
              MT1 => MT,
              ME1 => ME,
              MA1 => MA);

      -- 6. Receive MA3h from T1
      accept Send_MAT1(MAh: in Matrix_General; MA2h: in Matrix_General) do
         MA(MAh'Range) := MAh;
         MA(MA2h'Range) := MA2h;
      end Send_MAT1;

      -- 7. Receive MA2h from T3
      accept Send_MAT3(MA2h: in Matrix_General) do
	MA(MA2h'Range) := MA2h;
      end Send_MAT3;

      -- 8. Output MA
      Operation.Output(MA);

      put_line("Task T2 has finished.");
   end T2;
   ----------------------------------------------------------------------

   --Task body T3--------------------------------------------------------
   task body T3 is
      MA3, MB3, MO3: Matrix;
      MC3, MT3, ME3: Matrix;
      A, B: Vector;
   begin
      put_line("Task T3 has started.");

      -- 1. Receive MB, MO, ME2h from T2
      accept Send_fromT2(MB: in Matrix; MO: in Matrix; ME2h: in Matrix_General) do
         MB3 := MB;
         MO3 := MO;
         ME3(ME2h'Range) := ME2h;
      end Send_fromT2;

      -- 2. Send MB, MO, MEh to T4
      T4.Send_fromT3(MB3, MO3, ME3(3*H+1..4*H));

      -- 3. Receive MC2h, MT2h from T5
      accept Send_fromT4(MC2h: in Matrix_General; MT2h: in Matrix_General) do
         MC3(MC2h'Range) := MC2h;
         MT3(MT2h'Range) := MT2h;
      end Send_fromT4;

      -- 4. Send MCh, MTh to T2
      T2.Send_fromT3(MC3(H+1..2*H), MT3(H+1..2*H));

      -- 5. Calculate
      calculation(2*H+1, 3*H, A => A,
              B   => B,
              MB1 => MB3,
              MC1 => MC3,
              MO1 => MO3,
              MT1 => MT3,
              ME1 => ME3,
              MA1 => MA3);

      -- 6. Receive MAh from T4
      accept Send_MAT4(MAh: in Matrix_General) do
	MA3(MAh'Range) := MAh;
      end Send_MAT4;

      -- 7. Send MA2h to T2
      T2.Send_MAT3(MA3(2*H+1..4*H));

      put_line("Task T3 has finished.");
   end T3;
   ----------------------------------------------------------------------

   --Task body T4--------------------------------------------------------
   task body T4 is
      MA4, MB4, MO4: Matrix;
      MC, MT, ME4: Matrix;
      A, B: Vector;
   begin
      put_line("Task T4 has started.");

      -- 1. Input MC, MT
      for i in 1..N loop
         for j in 1..N loop
            MT(i)(j) := 1;
            MC(i)(j) := 1;
         end loop;
      end loop;

      -- 2. Receive MB, MO, MEh from T3
      accept Send_fromT3(MB : Matrix; MO : Matrix; MEh : Matrix_General) do
         MB4 := MB;
         MO4 := MO;
         ME4(MEh'Range) := MEh;
      end Send_fromT3;

      -- 3. Send MC2h, MT2h to T3
      T3.Send_fromT4(MC(H+1..3*H), MT(H+1..3*H));

      -- 4. Send MC3h, MT3h to T5
      T5.Send_fromT4(MC(1..H), MC(4*H+1..N), MT(1..H), MT(4*H+1..N));

      -- 5. Calculate
      calculation(3*H+1, 4*H, A => A,
              B   => B,
              MB1 => MB4,
              MC1 => MC,
              MO1 => MO4,
              MT1 => MT,
              ME1 => ME4,
              MA1 => MA4);

      -- 6. Send MAh to T3
      T3.Send_MAT4(MA4(3*H+1..4*H));

      put_line("Task T4 has finished.");
   end T4;
   ----------------------------------------------------------------------

   --Task body T5--------------------------------------------------------
   task body T5 is
      MA5, MB5, MO5: Matrix;
      MC5, MT5, ME5: Matrix;
      A, B: Vector;
   begin
      put_line("Task T5 has started.");

      -- 1. Receive MB, MO, MEh from T6
      accept Send_fromT6(MB : Matrix; MO : Matrix; MEh : Matrix_General) do
         MB5 := MB;
         MO5 := MO;
         ME5(MEh'Range) := MEh;
      end Send_fromT6;

      -- 2. Receive MC3h, MT3h from T4
      accept Send_fromT4(MCh : Matrix_General; MC2h : Matrix_General; MTh : Matrix_General; MT2h : Matrix_General) do
         MC5(MCh'Range) := MCh;
         MC5(MC2h'Range) := MC2h;
         MT5(MTh'Range) := MTh;
         MT5(MT2h'Range) := MT2h;
      end Send_fromT4;

      -- 3. Send MC2h, MT2h to T6
      T6.Send_fromT5(MC5(1..H), MC5(5*H+1..N), MT5(1..H), MT5(5*H+1..N));

      -- 4. Calculate
      calculation(4*H+1, 5*H, A => A,
              B   => B,
              MB1 => MB5,
              MC1 => MC5,
              MO1 => MO5,
              MT1 => MT5,
              ME1 => ME5,
              MA1 => MA5);

      -- 5. Send MAh to T6
      T6.Send_MAT5(MA5(4*H+1..5*H));

      put_line("Task T5 has finished.");
   end T5;
   ----------------------------------------------------------------------

   --Task body T6--------------------------------------------------------
   task body T6 is
      MA6, MB6, MO6: Matrix;
      MC6, MT6, ME6: Matrix;
      A, B: Vector;
   begin
      put_line("Task T6 has started.");

       -- 1. Receive MB, MO, ME2h from T1
      accept Send_fromT1(MB : Matrix; MO : Matrix; ME2h : Matrix_General) do
         MB6 := MB;
         MO6 := MO;
         ME6(ME2h'Range) := ME2h;
      end Send_fromT1;

      -- 2. Send MB, MO, MEh to T5
      T5.Send_fromT6(MB6, MO6, ME6(4*H+1..5*H));

      -- 3. Receive MC2h, MT2h from T5
      accept Send_fromT5(MC1h : Matrix_General; MCh: Matrix_General; MT1h : Matrix_General; MTh : Matrix_General) do
         MC6(MC1h'Range) :=MC1h;
         MC6(MCh'Range) := MCh;
         MT6(MT1h'Range) := MT1h;
         MT6(MTh'Range) := MTh;
      end Send_fromT5;

      -- 4. Send MCh, MTh to T1
      T1.Send_fromT6(MC6(1..H), MT6(1..H));

      -- 5. Calculate
	calculation(5*H+1, N, A => A,
              B   => B,
              MB1 => MB6,
              MC1 => MC6,
              MO1 => MO6,
              MT1 => MT6,
              ME1 => ME6,
              MA1 => MA6);

      -- 6. Receive MAh from T5
      accept Send_MAT5(MAh: in Matrix_General) do
	MA6(MAh'Range) := MAh;
      end Send_MAT5;

      -- 7. Send MA2h to T1
      T1.Send_MAT6(MA6(4*H+1..N));

      put_line("Task T6 has finished.");
   end T6;
   ----------------------------------------------------------------------

begin
   null;
end Main;

