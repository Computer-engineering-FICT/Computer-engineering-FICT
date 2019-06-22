 -------------------------------------------------------------------------------
   --                                                                           --
   --                   Parallel and Distributed Computing                      --
   --                   Laboratory work #7. Ada. Rendezvous                     --
   --                                                                           --
   --  File: data.adb                                                          --
   --  Task:A = α∙B+ max(Z)∙Т∙ (MO∙MK)                                          --
   --                                                                           --
  --  Author: Kryvonosov Oleksii, group IO-34                                   --
   --  Date: 30.04.2015                                                         --
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

    procedure FindMaxZ (V : in VectorH; maxZi : out Integer) is
    maxBuf : Integer;
    begin
    maxBuf :=-99999;
    for i in 1..H loop
    if(maxBuf < V(i)) then
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

    procedure Calculation (
    alfa : in Integer;
    maxZ : in Integer;
    B : in VectorH;
    T : in VectorN;
    MO : in MatrixH;
    MK : in MatrixN;
    A : out VectorH) is
    Sum : Integer := 0;
      Sum1 : Integer := 0;
      TempVect : VectorH;

   begin


      for I in 1..H loop
         TempVect(i) := B(i)* alfa;
      end loop;

    for I in 1..H loop
         Sum1 := 0;

    for j in 1..N loop
   sum := 0;
    for K in 1..N loop
               Sum := sum + MO(I)(K)* MK(K)(J);

    end loop;
    Sum1 := sum1 + Sum * T(J);
    end loop;
         A(I):= Sum1*maxZ + TempVect(I);

      end loop;



    end Calculation;

   end Data;
