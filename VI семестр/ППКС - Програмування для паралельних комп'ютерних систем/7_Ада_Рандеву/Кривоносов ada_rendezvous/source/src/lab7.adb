   -------------------------------------------------------------------------------
   --                                                                           --
   --                   Parallel and Distributed Computing                      --
   --                   Laboratory work #7. Ada. Rendezvous                     --
   --                                                                           --
   --  File: lab7.adb                                                           --
   --  Task:A = α∙B+ max(Z)∙Т∙ (MO∙MK)                                          --
   --                                                                           --
  --  Author: Kryvonosov Oleksii, group IO-34                                   --
   --  Date: 30.04.2015                                                         --
   --                                                                           --
   -------------------------------------------------------------------------------

   with Ada.Text_IO, Ada.Integer_text_iO, Ada.Synchronous_Task_Control, Data;
   use Ada.Text_IO, Ada.Integer_text_iO, Ada.Synchronous_Task_Control;

   procedure lab7 is

    Value : Integer := 1;
    N : Natural := 6;
    P : Natural := 6;
    H : Natural := N/P;

    package DataN is new Data(N, H);
    use DataN;

   procedure StartTasks is
   -------------------------------------------------------------------------------
 --                             СПЕЦИФІКАЦІЯ ЗАДАЧ                            --
   -------------------------------------------------------------------------------

   --                                 Задача T1                                 --
    task T1 is
         entry T2T1_alphaZhTMK(alpha: in Integer; Z: in VectorH; T: in VectorN; MK : in MatrixN);
         entry MaxZ (maxZ : in Integer);

    end T1;

   --                                 Задача T2                                 --
    task T2 is
         entry T1T2_B5hMO5h(B : in Vector5H; MO : in Matrix5H);
         entry T3T2_alphaZ4hTMK( alpha: in Integer; Z: in Vector4H; T: in VectorN; MK : in MatrixN);
         entry MaxZ1 (maxZ1 : in Integer);
         entry MaxZ3 (maxZ3 : in Integer);
         entry MaxZ5 (maxZ5 : in Integer);

         entry Result2H(A : out Vector5H);
    end T2;

   --                                 Задача T3                                 --
    task T3 is
         entry T2T3_B2hMO2h(B : in Vector2H; MO : in Matrix2H);
         entry T4T3_alphaZ5hTMK( alpha: in Integer; Z: in Vector5H; T: in VectorN; MK : in MatrixN);
         entry MaxZ4 (maxZ4 : in Integer);
         entry MaxZ (maxZ : in Integer);
         entry Result3H(A : out Vector2H);
    end T3;



   --                                 Задача T4                                 --
    task T4 is
         entry T3T4_BhMOh(B : in VectorH; MO : in MatrixH);
         entry MaxZ (maxZ : in Integer);
         entry Result4H(A : out VectorH);

    end T4;

   --                                 Задача T5                                 --
    task T5 is

         entry T2T5_B2hMO2h(B : in Vector2H; MO : in Matrix2H);
         entry T2T5_alphaZ2hTMK( alpha: in Integer; Z: in Vector2H; T: in VectorN; MK : in MatrixN);
         entry MaxZ6(MaxZ6: in Integer);
         entry MaxZ (maxZ : in Integer);
         entry Result5H(A : out Vector2H);
    end T5;

   --                                 Задача T6                                 --
    task T6 is
         entry T5T6_BhMOh(B : in VectorH; MO : in MatrixH);
         entry T5T6_alphaZhTMK( alpha: in Integer; Z: in VectorH; T: in VectorN; MK : in MatrixN);
         entry MaxZ (maxZ : in Integer);
         entry Result6H(A : out VectorH);
    end T6;



   -------------------------------------------------------------------------------
   --                                 ТІЛА ЗАДАЧ                                --
   -------------------------------------------------------------------------------

   --                                 Задача T1                                 --

    task body T1 is
         A1 : Vector6H;
         Z1 : VectorH;
         T1: VectorN;
         B1 : Vector6H;
         MO1 : Matrix6H;
         MK1 : MatrixN;
         alfa1: Integer;
         maxZ1: Integer :=-99999;
      begin
         Put_Line("T1 started");
         --1.Введення B, MO
         Input(MO1,1);
         Input(B1,1);


         --2.Передати B5H, MO5H  задачі Т2
         T2.T1T2_B5hMO5h(B1(H+1..6*H), MO1(H+1..6*H));


         --3.Прийняти α ,ZH,Т, MК від задачі Т2

         accept T2T1_alphaZhTMK (alpha : in Integer; Z : in VectorH; T : in VectorN; MK : in MatrixN) do
            alfa1 := alpha;
            Z1 := Z;
            T1 := T;
            MK1 := MK;
         end T2T1_alphaZhTMK;

    --4.Обчислити maxZ1 = max(ZH)
     FindMaxZ(Z1, maxZ1);
    --5.Передати maxZ1 задачі Т2
    T2.MaxZ1(maxZ1);
   --6.Прийняти maxZ від задачі Т2
    accept MaxZ (maxZ : in Integer) do
            maxZ1:=maxZ;
         end MaxZ;

         --7.Обчислити AH = α∙BH+ maxZ∙Т∙(MOH∙MK)

         Calculation(alfa1, maxZ1, B1(1..H), T1, MO1(1..H), MK1, A1(1..H));

         --8.Передати AH задачі Т2

         T2.Result2H(A1(H+1..6*H));

     --9.Вивести А
    Output(A1);


    Put_Line("T1 finished");

    end T1;

   --                                 Задача T2                                 --

    task body T2 is
    A2 : Vector5H;
    Z2 : Vector4H;

    T2: VectorN;
    B2 : Vector5H;
    MO2 : Matrix5H;
    MK2 : MatrixN;
    alfa2: Integer;
    maxZ2: Integer :=-999999;
    maxValueZ1: Integer;
    maxValueZ3: Integer;
    maxValueZ5: Integer;
    begin
    Put_Line("T2 started");
         --1.Прийняти B5H, MO5H  від задачі Т1

         accept T1T2_B5hMO5h (B : in Vector5H; MO : in Matrix5H) do

            B2 := B;

            MO2 := MO;
         end T1T2_B5hMO5h;


   --2.Передати B2H, MO2H  задачі Т3
    T3.T2T3_B2hMO2h(B2(3*H+1..H*5), MO2(3*H+1..H*5));
         --3.	Передати B2H, MO2H задачі Т5
          T5.T2T5_B2hMO2h(B2(H+1..H*3), MO2(H+1..H*3));

         -- 4.Прийняти α, Z4H,Т, MК від задачі Т3
         accept T3T2_alphaZ4hTMK (alpha : in Integer; Z : in Vector4H; T : in VectorN; MK : in MatrixN) do
            alfa2 := alpha;
            Z2 := Z;
            T2 := T;
            MK2 := MK;
         end T3T2_alphaZ4hTMK;
         -- 5.	Передати α, ZH,Т, MК задачі Т1
         T1.T2T1_alphaZhTMK(alfa2, Z2(1..H), T2,MK2);
         -- 6.	Передати α, Z2H,Т, MК  задачі Т5
         T5.T2T5_alphaZ2hTMK(alfa2, Z2(H*2+1..H*4), T2,MK2);

         -- 7.	Обчислити maxZ2 = max(ZH)
         FindMaxZ(Z2(H+1..2*H), maxZ2);
         -- 8.	Прийняти maxZ1 від задачі Т1
         accept MaxZ1 (maxZ1 : in Integer) do
            maxValueZ1 := MaxZ1;
         end MaxZ1;
         -- 9.	Обчислити maxZ2 = max (maxZ2,maxZ1)
         MaxZ2 := Max(MaxZ2, maxValueZ1);
         -- 10.	Прийняти maxZ3 від задачі Т3
          accept MaxZ3 (maxZ3 : in Integer) do
            maxValueZ3 := MaxZ3;
         end MaxZ3;
         -- 11.	Обчислити maxZ2 = max (maxZ2,maxZ3)
         MaxZ2 := Max(MaxZ2, maxValueZ3);
         -- 12.	Прийняти maxZ5 від задачі Т5
         accept MaxZ5 (maxZ5 : in Integer) do
            maxValueZ5 := MaxZ5;
         end MaxZ5;
         -- 13.	Обчислити maxZ = max (maxZ2,maxZ5)
         MaxZ2 := Max(MaxZ2, maxValueZ5);

         -- 14.	Педедати maxZ задачі Т1
         T1.MaxZ(MaxZ2);
           -- 15.	Педедати maxZ задачі Т3
           T3.MaxZ(MaxZ2);
         -- 16.	Педедати maxZ задачі Т5
         T5.MaxZ(MaxZ2);

         -- 17.	Обчислити AH = α∙BH+ maxZ∙Т∙(MOH∙MK)

           Calculation(alfa2, maxZ2, B2(1..H), T2, MO2(1..H), MK2, A2(1..H
));
         -- 18.	Прийняти A2H від задачі Т3
         T3.Result3H(A2(H*3+1..H*5));
                     -- 19.	Прийняти A2H від задачі Т5
                     T5.Result5H(A2(H+1..H*3));
                     --20.	Передати A5H задачі Т1
                     accept Result2H (A : out Vector5H) do
                        A := A2;
                     end Result2H;

    Put_Line("T2 finished");
    end T2;

   --                                 Задача T3                                 --

    task body T3 is
    A3 : Vector2H;

    Z3 : Vector5H;
    T3: VectorN;
    B3 : Vector2H;
    MO3 : Matrix2H;
    MK3 : MatrixN;
    alfa3: Integer;
    maxZ3: Integer :=-999999;
                     maxValZ4: Integer;


    begin
    Put_Line("T3 started");
                     --1.Прийняти B2H, MO2H  від задачі Т2
                 accept T2T3_B2hMO2h (B : in Vector2H; MO : in Matrix2H) do
                     B3 := B;
                     MO3 := MO;
                 end T2T3_B2hMO2h;
                     --2.Передати BH, MOH  задачі Т4
                     T4.T3T4_BhMOh(B3(H+1..2*H), MO3(H+1..2*H));
                     -- 3.	Прийняти α, Z5H,Т, MК від задачі Т4
                 accept T4T3_alphaZ5hTMK (alpha : in Integer; Z : in Vector5H; T : in VectorN; MK : in MatrixN) do
                     alfa3 := alpha;
                     Z3 := Z;
                     T3 := T;
                     MK3 := MK;
                     end T4T3_alphaZ5hTMK;
                     -- 4.Передати α, Z4H,Т, MК задачі Т2

                     T2.T3T2_alphaZ4hTMK(alfa3, Z3(H+1..5*H), T3, MK3);
                     -- 5.	Обчислити maxZ3 = max(ZH)
                     FindMaxZ(Z3(1..H), maxZ3);
                     -- 6.Прийняти maxZ4  від задачі Т4
                     accept MaxZ4 (maxZ4 : in Integer) do
                        maxValZ4 := maxZ4;
                     end MaxZ4;

                     --7.Обчислити maxZ3 = max (maxZ3,maxZ4)
                     maxZ3 := max(maxZ3, maxValZ4);
                     --8.Передати maxZ3  задачі Т2
                     T2.MaxZ3(MaxZ3);
                     -- 9.	Прийняти maxZ від задачі Т2
                     accept MaxZ (maxZ : in Integer) do
                        maxZ3 := maxZ;
                     end MaxZ;
                     --10.	Передати maxZ задачі Т4
                     T4.MaxZ(MaxZ3);
                     -- 11.	Обчислити AH = α∙BH+ maxZ∙Т∙(MOH∙MK)
                     Calculation(alfa3, maxZ3, B3(1..H), T3, MO3(1..H), MK3, A3(1..H));
                     --12.	Прийняти AH від задачі Т4
                     T4.Result4H(A3(H+1..2*H));
                          -- 13.	Передати A2H задачі Т2
                                 accept Result3H (A : out Vector2H) do
                                    A := A3;
                                 end Result3H;


    Put_Line("T3 finished");
    end T3;

   --                                 Задача T4                                 --


    task body T4 is
    A4 : VectorH;
    Z4 : Vector6H;
    T4: VectorN;
    B4 : VectorH;
    MO4 : MatrixH;
    MK4 : MatrixN;
    alfa4: Integer;
    maxZ4: Integer :=-999999;




    begin
    Put_Line("T4 started");
   --1.	Ввести Z, α Т, МК
                                 Input(Z4,1);
                                 Input(T4,1);
                                 Input(MK4,1);
                                 alfa4 := 1;

                                 --2.	Прийняти BH, MOH від задачі Т3
                                 accept T3T4_BhMOh (B : in VectorH; MO : in MatrixH) do
                                   B4 := B;
                                   MO4:= MO;

                                 end T3T4_BhMOh;
                                 --3.Передати α, Z5H,Т, MК задачі Т3

                                 T3.T4T3_alphaZ5hTMK(alfa4, Z4(1..5*H), T4, MK4);
                                 --4.	Обчислити maxZ4 = max(ZH)
                                 FindMaxZ(Z4(5*H+1..6*H),maxZ4);
                                 --5.	Передати  maxZ4 задачі Т3
                                 T3.MaxZ4(maxZ4);
                                   --6.	Прийняти maxZ від задачі Т3
                                 accept MaxZ (maxZ : in Integer) do
                                    MaxZ4 := maxZ;
                                 end MaxZ;
                                 -- 7.Обчислити AH = α∙BH+ maxZ∙Т∙(MOH∙MK)
                                 Calculation(alfa4, maxZ4, B4,T4, MO4, MK4, A4);
                                 -- Передати AH задачі Т3
                                 accept Result4H (A : out VectorH) do
                                     A := A4;
                                 end Result4H;


  Put_Line("T4 finished");
   end T4;

   --                                 Задача T5                                 --

  task body T5 is
   A5 : Vector2H;
    Z5 : Vector2H;
   T5: VectorN;
  B5 : Vector2H;
    MO5 : Matrix2H;
    MK5 : MatrixN;
    alfa5: Integer;
    maxZ5: Integer :=-999999;
    maxValZ6 : Integer;
    begin
                                 Put_Line("T5 started");



                   --1.Прийняти B2H, MO2H  від задачі Т2
                 accept T2T5_B2hMO2h (B : in Vector2H; MO : in Matrix2H) do
                     B5 := B;
                     MO5 := MO;
                 end T2T5_B2hMO2h;
                     --2.Передати BH, MOH  задачі Т6
                     T6.T5T6_BhMOh(B5(H+1..2*H), MO5(H+1..2*H));
         -- 3.	Прийняти α, Z2H,Т, MК від задачі Т2

                 accept T2T5_alphaZ2hTMK (alpha : in Integer; Z : in Vector2H; T : in VectorN; MK : in MatrixN) do
                     alfa5 := alpha;
                     Z5 := Z;
                     T5 := T;
                     MK5 := MK;
                     end T2T5_alphaZ2hTMK;
                     -- 4.Передати α, ZH,Т, MК задачі Т6
                     T6.T5T6_alphaZhTMK(alfa5, Z5(H+1..2*H), T5, MK5);

                     -- 5.	Обчислити maxZ5 = max(ZH)
                     FindMaxZ(Z5(1..H), maxZ5);
                     -- 6.Прийняти maxZ6  від задачі Т6
                     accept MaxZ6 (maxZ6 : in Integer) do
                        maxValZ6 := maxZ6;
                     end MaxZ6;

                     --7.Обчислити maxZ5 = max (maxZ6,maxZ5)
                     maxZ5 := max(maxZ5, maxValZ6);
                     --8.Передати maxZ5  задачі Т2
                     T2.MaxZ5(MaxZ5);
                     -- 9.	Прийняти maxZ від задачі Т2
                     accept MaxZ (maxZ : in Integer) do
                        maxZ5 := maxZ;
                     end MaxZ;
                     --10.	Передати maxZ задачі Т6
                     T6.MaxZ(MaxZ5);
                     -- 11.	Обчислити AH = α∙BH+ maxZ∙Т∙(MOH∙MK)
                     Calculation(alfa5, maxZ5, B5(1..H), T5, MO5(1..H), MK5, A5(1..H));
                     --12.	Прийняти AH від задачі Т4
                     T6.Result6H(A5(H+1..2*H));
                          -- 13.	Передати A2H задачі Т2
                                 accept Result5H (A : out Vector2H) do
                                    A := A5;
                                 end Result5H;




    Put_Line("T5 finished");
    end T5;

   --                                 Задача T6                                 --

    task body T6 is
    A6 : VectorH;
    Z6 : VectorH;
    T6: VectorN;
    B6 : VectorH;
    MO6 : MatrixH;
    MK6 : MatrixN;
    alfa6: Integer;
                                 maxZ6: Integer :=-999999;


    begin
    Put_Line("T6 started");
     --1.	Прийняти BH, MOH від задачі Т5
                                 accept T5T6_BhMOh (B : in VectorH; MO : in MatrixH) do
                                   B6 := B;
                                   MO6:= MO;

                                 end T5T6_BhMOh;
                                 --2.	Прийняти α, ZH,Т, MК  від задачі Т5
                                 accept T5T6_alphaZhTMK (alpha : in Integer; Z : in VectorH; T : in VectorN; MK : in MatrixN) do
                                 alfa6 := alpha;
                                 Z6 := Z;
                                 T6 := T;
                                 MK6 := MK;
                                 end T5T6_alphaZhTMK;

                                 --3.	Обчислити maxZ6 = max(ZH)
                                 FindMaxZ(Z6,maxZ6);
                                 --5.	Передати  maxZ4 задачі Т5
                                 T5.MaxZ6(maxZ6);
                                   --6.	Прийняти maxZ від задачі Т5
                                 accept MaxZ (maxZ : in Integer) do
                                    maxZ6 := maxZ;
                                 end MaxZ;
                                 -- 7.Обчислити AH = α∙BH+ maxZ∙Т∙(MOH∙MK)
                                 Calculation(alfa6, maxZ6, B6,T6, MO6, MK6, A6);
                                 -- Передати AH задачі Т5
                                 accept Result6H (A : out VectorH) do
                                     A := A6;
                                 end Result6H;


    Put_Line("T6 finished");
    end T6;



    begin
    null;
    end StartTasks;
   begin
    Put_Line ("Lab7 started");
    StartTasks;
    Put_Line ("Lab7 finished");
   end lab7;

