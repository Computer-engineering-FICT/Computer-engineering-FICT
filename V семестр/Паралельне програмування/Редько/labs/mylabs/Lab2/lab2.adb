------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--                  Laboratory work #2. Tasks                   --
--                                                              --
--  File: lab2.adb                                              --
--  Task: F1: E = A + B + C + D * (MA * MZ)                     -- 
--        F2: MD = (MA * MB) * TRANS(MC)                        --
--        F3: E = (MA * MM) * B + MB * SORT(A)                  --
--                                                              --
--  Author: Redko Alexander, group IO-01                        --
--  Date: 16.09.2012                                            --
--                                                              --
------------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_text_iO, Data;
use Ada.Text_IO, Ada.Integer_text_iO;

procedure Lab2 is 
   
   N : Natural;
   Fill : Character;
   file1, File2, File3 : File_Type;

begin
  
   Put ("Input N: ");
   Get (Item => N);
   

   declare
      
      package Data_N is new Data(N);
      use Data_N;

      Value : Integer := 0;

      A1, A3, B1, B3, C1, D1, E1, E3 : Vector;
      MA1, MA2, MA3, MB2, MB3, MC2, MD2, MM3, MZ1 : Matrix;

   begin
         
      Put ("Enter r (fill random), g (fill manually)"&
         "or a (fill all the elements any number): ");
      Get (Fill);
      if (Fill = 'a') then
         Put ("Enter number: ");
         Get (Value);
      end if;


      Put_Line ("Inputing data for F1...");
      Input (Fill, Value, A1);
      Input (Fill, Value, B1);
      Input (Fill, Value, C1);
      Input (Fill, Value, D1);
      Input (Fill, Value, MA1);
      Input (Fill, Value, MZ1);

      Put_Line ("Inputing data for F2...");
      Input (Fill, Value, MA2);
      Input (Fill, Value, MB2);
      Input (Fill, Value, MC2);

      Put_Line ("Inputing data for F3...");
      Input (fill, Value, MA3);
      Input (Fill, Value, MM3);
      Input (Fill, Value, B3);
      Input (Fill, Value, MB3);
      Input (Fill, Value, A3);
      
      declare
         task Task_F1 is
            pragma Priority(7);
         end Task_F1;

         task body Task_F1 is
         begin
            delay 0.0;
            Put_line("Started Task_F1");
            F1 (A1, B1, C1, D1, MA1, MZ1, E1);
            Create (File1, Out_File, "f1.txt");
				Put_Line (File1, "Result of F1:");
				Output (E1, File1);
            Close(File1);
            Put_line ("End Task_F1");
         end Task_F1;

         task Task_F2 is 
            pragma Priority(7);
         end Task_F2;

         task body Task_F2 is
         begin
            delay 0.0;
            Put_line ("Started Task_F2");
            F2 (MA2, MB2, MC2, MD2);
            Create (File2, Out_File, "f2.txt");
				Put_Line (File2, "Result of F2:");
				Output (MD2, File2);
            Close(File2);
            Put_line ("End Task_F2");
         end Task_F2;


         task Task_F3 is 
            pragma Priority(7);
         end Task_F3;

         task body Task_F3 is
         begin 
            delay 0.0;
            F3 (A3, B3, MA3, MB3, MM3, E3);
            Create (File3, Out_File, "f3.txt");
				Put_Line (File3, "Result of F3:");
				Output (E3, File3);
            Close(File3);
            Put_line ("End Task_F3");
         end Task_F3;
         
      begin
         null;
      end;


      null;
   end;
      
end Lab2;
   
     

