------------------------------------------------------------------
--             Паралельні та розподілені обчислення             --
--          Лабораторна робота №1. Підпрограми і пакети         --
--                                                              --
--  F1: E = A + B + C + D * (MA * MZ)                           --
--  F2: MD = (MA * MB) * TRANS(MC)                              --
--  F3: E = (MA * MM) * B + MB * SORT(A)                        --
--                                                              --
--  Автор: Редько О.М., гр. IO-01                               --
--  Дата: 09.09.2012                                            --
------------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

generic
   N: Integer;
   type elem is private;
package Data is 

   type Vector is array(1..N) of Elem;
   type Matrix is array (1..N) of Vector;

   procedure F1 (VA, VB, VC, VD : in Vector;
                 MA, MZ         : in Matrix;
                 VE             : out Vector);

   procedure F2 (MA, MB, MC : in Matrix;
                 MD         : out Matrix);

   procedure F3(VB, VA     : in Vector;
                MA, MM, MB : in Matrix;
                VE         : out Vector);

   procedure Input_Vector(V : out Vector);

   procedure Input_Matrix(M : out Matrix);

   procedure Output_Vector(V : in Vector);

   procedure Output_Matrix(M : in Matrix);

   
end Data;

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Data is

   procedure F1 (VA, VB, VC, VD : in Vector;
                 MA, MZ         : in Matrix;
                 VE             : out Vector) is
   begin
      for I in 1..N loop
         VE(I) := VA(I) + VB(I) + VC(I);
      end loop;
         
   end F1;

   procedure F2 (MA, MB, MC : in Matrix;
                 MD         : out Matrix) is
   begin
      put("F2");
   end F2;

   procedure F3(VB, VA     : in Vector;
                MA, MM, MB : in Matrix;
                VE         : out Vector) is
   begin
      put("F3");
   end F3;
   
   procedure Input_Vector(V : out Vector) is
   begin
      for I in 1..N loop
         Get(V(I));
      end loop;
   end Input_Vector;

   procedure Input_Matrix(M : out Matrix) is
   begin
      put("2");
   end Input_Matrix;
   
   procedure Output_Vector(V : in Vector) is
   begin   
      for I in 1..N loop
         Put(V(I));
      end loop;
      New_Line;
   end Output_Vector;
   
   procedure Output_Matrix(M : in Matrix) is
   begin
      put("f");
   end Output_Matrix;
   
end Data;


with Ada.Text_IO, Ada.Integer_Text_IO, Data;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab1 is
   package Data3 is new data(4, Integer);
   use Data3;
   A, E : Vector;
begin
   
   Put("Input any vector:");
   New_Line;
   Input_Vector(A);
   New_Line;
   Put("Vector");
   New_Line;
   Output_Vector(A);
  
end Lab1;
