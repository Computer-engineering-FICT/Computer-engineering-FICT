
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

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Data is

   procedure Input (V : out Vector; Value : Integer) is
   begin
      for I in 1..N loop
         V(I):= Value;
      end loop;
   end Input;


   procedure Input (MA : out Matrix; Value : Integer) is
   begin
      for I in 1..N loop
         for J in 1..N loop
            MA(I)(J):= Value;
         end loop;
      end loop;
   end Input;

   procedure Output (V : in Vector) is
   begin
      New_Line;
      for I in 1..V'Last loop
         Put(Item => V(I), Width => 6);
      end loop;
      New_Line;
   end Output;


   procedure Output (MA : in Matrix) is
   begin
      New_Line;
      for I in 1..MA'Last loop
         for J in 1..N loop
            Put(Item => MA(i)(j), Width => 6);
         end loop;
         New_line;
      end loop;
      New_Line;
   end Output;

   procedure FindMaxZ (V : in Vector; maxZi : out Integer) is
      maxBuf : Integer;
   begin
      maxBuf :=-99999;
      for i in V'Range loop

         if maxBuf < V(i) then
            maxBuf := V(i);
         end if;
      end loop;
      maxZi:=maxBuf;
   end FindMaxZ;

   function Max (A, B: Integer) return Integer is
   begin
      if A >= B then
         return A;
      else
         return B;
      end if;
   end Max;

   procedure Calculation(d : in Integer;
                         maxZ : in Integer;
                         MO : in MatrixN;
                         MX : in MatrixN;
                         MS : in MatrixN;
                         MA : out MatrixN) is
      Sum : Integer := 0;
      Sum1 : Integer := 0;
      BufferMatrix : MatrixN;
   begin
       Input(BufferMatrix, 0);

      for i in 1..N loop
         for j in 1..N loop
            for k in 1..N loop
               BufferMatrix(i)(j) := BufferMatrix(i)(j) + MX(i)(k) * MS(k)(j);
            end loop;
         end loop;
      end loop;

      for i in 1..N loop
         for j in 1..N loop
            MA(i)(j) := maxZ * MO(i)(j) + d * BufferMatrix(i)(j);
         end loop;
      end loop;

   end Calculation;

end Data;
