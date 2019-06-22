------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--           Laboratory work #5. Ada. Protected unit            --
--                                                              --
--  File:Data.adb                                                --
--  Task: MA = (B*C)*MO+ a(MT*MR)                               --
--                                                              --
--  Author: Krivonosov Oleksii, group IO-34                     --
--  Date: 14.04.2016                                            --
--                                                              --
 ------------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

     package body Data is

        procedure Input(Value : Integer; V : out Vector) is
        begin
           for i in 1..N loop
              V(i):=Value;
              end loop;
        end Input;
        procedure Input (Value : Integer; MA : out Matrix) is
        begin
              for I in 1..N loop
                  for J in 1..N loop
                         MA(I)(J) := Value;
                  end loop;
               end loop;
            end Input;


            procedure Output (V : in Vector) is
            begin
               New_Line;
               for I in 1..N loop
                  Put(Item => V(I), Width => 4);
               end loop;
               New_Line;
            end Output;

            procedure Output (MA : in Matrix) is
            begin
               New_Line;
               for I in 1..N loop
                  for J in 1..N loop
                     Put(MA(i)(j));
                  end loop;
                  New_line;
               end loop;
               New_Line;
            end Output;


        end Data;
