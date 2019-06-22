------------------------------
-- PDC. Lab#7
-- A = max(B) *  C + alpha * T * (MO * MK)
-- Rakovtsii Vitalii, IO-01
-- 21.04.2013
-------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Data;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab7 is
   N: Integer;
   P: Integer;

   procedure Setup is
      package DataInstance is new Data(N => N);
      use DataInstance;

      H: Integer := N / P;

      alpha: Integer;
      B, C, T: Vector;
      MK, MO: Matrix;

      function count_lindex(id: Integer) return Integer is
      begin
         return id * H + 1;
      end count_lindex;

      function count_rindex(id: Integer) return Integer is
      begin
         if id = (P - 1) then
            return N;
         end if;

         return (id + 1) * H;
      end count_rindex;

      task type FancyTask(id: Integer) is
         entry receiveInputFromPrev(B: VectorBase; MO: MatrixBase; alpha: Integer);
         entry receiveInputFromNext(MK: Matrix; C: VectorBase; T: Vector);

         entry receiveMaxFromPrev(max: Integer);
         entry receiveMaxFromNext(max: Integer);

         entry receiveOutputFromNext(A: VectorBase);
      end FancyTask;

      type FancyTaskAccess is access FancyTask;
      FancyArray: array(0..P-1) of FancyTaskAccess;

      task body FancyTask is
         lindex: Integer := 0;
         rindex: Integer := 0;

         l_alpha: Integer;
         l_A, l_B, l_C, l_T: Vector;
         l_MK, l_MO: Matrix;

         l_max: Integer := Integer'First;
      begin
         put_line("Task " & Integer'Image(id) & " started");

         lindex := count_lindex(id);
         rindex := count_rindex(id);

         -- INPUT
         if id = 0 then
            generate(B);
            generate(MO);
            alpha := 1;

            l_alpha := alpha;
            l_B := B;
            l_MO := MO;
         elsif id = (P - 1) then
            generate(MK);
            generate(C);
            generate(T);

            l_MK := MK;
            l_C := C;
            l_T := T;
         end if;
         ---------------------------------------------------------
         ---------------------------------------------------------
         if id > 0 then
            accept receiveInputFromPrev (B: VectorBase; MO: MatrixBase; alpha: Integer) do
               l_B(B'Range) := B;
               l_MO(MO'Range) := MO;
               l_alpha := alpha;
            end receiveInputFromPrev;
         end if;

         if id < (P - 1) then
            declare
               s_lindex: Integer := count_lindex(id + 1);
            begin
               FancyArray(id + 1).all.receiveInputFromPrev(l_B(s_lindex .. N), l_MO(s_lindex .. N), l_alpha);
            end;
         end if;
         ---------------------------------------------------------
         ---------------------------------------------------------
         if id < (P - 1) then
            accept receiveInputFromNext (MK : Matrix; C : VectorBase; T : Vector) do
               l_MK := MK;
               l_T := T;
               l_C(C'Range) := C;
            end receiveInputFromNext;
         end if;

         if id > 0 then
            declare
               s_rindex: Integer := count_rindex(id - 1);
            begin
               FancyArray(id - 1).all.receiveInputFromNext(l_MK, l_C(1 .. s_rindex), l_T);
            end;
         end if;
         ---------------------------------------------------------

         for i in lindex .. rindex loop
            if l_max < l_B(i) then
               l_max := l_B(i);
            end if;
         end loop;

         ---------------------------------------------------------
         if id < (P - 1) then
            accept receiveMaxFromNext (max: Integer) do
               if max > l_max then
                  l_max := max;
               end if;
            end receiveMaxFromNext;
         end if;

         if id > 0 then
            FancyArray(id - 1).all.receiveMaxFromNext(l_max);
         end if;
         ---------------------------------------------------------
         ---------------------------------------------------------
         if id > 0 then
            accept receiveMaxFromPrev (max: Integer) do
               l_max := max;
            end receiveMaxFromPrev;
         end if;

         if id < (P - 1) then
            FancyArray(id + 1).all.receiveMaxFromPrev(l_max);
         end if;
         ---------------------------------------------------------

         declare
            sum: Integer;
         begin
            for i in lindex .. rindex loop
               l_A(i) := l_C(i) * l_max;

               for j in 1..N loop
                  sum := 0;

                  for k in 1..N loop
                     sum := sum + l_MO(i)(k) * l_MK(k)(j);
                  end loop;

                  l_A(i) := l_A(i) + sum * l_T(j) * l_alpha;
               end loop;
            end loop;
         end;

         ---------------------------------------------------------
         if id < (P - 1) then
            accept receiveOutputFromNext (A : VectorBase) do
               l_A(A'Range) := A;
            end receiveOutputFromNext;
         end if;

         if id > 0 then
            FancyArray(id - 1).all.receiveOutputFromNext(l_A(lindex .. N));
         end if;
         ---------------------------------------------------------
         ---------------------------------------------------------
         if N <= 10 and id = 0 then
            output(l_A);
         end if;

         put_line("Task " & Integer'Image(id) & " finished");
      end;
   begin
      for i in 0..(P - 1) loop
         FancyArray(P - 1 - i) := new FancyTask(P - 1 - i);
      end loop;
   end Setup;
begin
   Put("Set size of vector/matrix: ") ;
   Get(N);
   Put("Numero of les proccesors: ") ;
   Get(P);
   Setup;
end Lab7;
