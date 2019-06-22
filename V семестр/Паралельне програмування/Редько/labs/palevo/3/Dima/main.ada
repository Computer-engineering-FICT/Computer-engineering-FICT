--Водопьянов Дмитрий Вадимович, группа ИО-91
--Лаб. 1. Подпрограммы. Пакеты
--F1: С=A-B
--F2: MC=SORT(TRANS(MA)*MB)
--F3: D=SORT(A)*(MA+MB)
WITH ADA.TEXT_IO, Func, ADA.INTEGER_TEXT_IO; USE ADA.TEXT_IO, Func, ADA.INTEGER_TEXT_IO;

--Основная программа
PROCEDURE Lab2 IS
    TASK F1_TASK IS
        PRAGMA PRIORITY(3);
    END F1_TASK;
    TASK BODY F1_TASK IS
        A,B,C: Вектор;
        F_OUT: File_type;
    BEGIN
--C=A-B
        PUT_LINE("T1 STARTED");
        set_N(3);
        Create_Vector(A, 1);
        Create_Vector(B, 1);
        delay 3.0;
   	    F1(A,B,C);
        CREATE(F_OUT, Out_File, "F1_OUT.TXT");
        PUT_LINE(F_OUT, "C=A-B");
        Vector_File_Output(F_OUT, C);
        CLOSE(F_OUT);
        PUT_LINE("T1 COMPLETE");
    END F1_TASK;
    -----------------------------------------------------   
    TASK F2_TASK IS
        PRAGMA PRIORITY(4);
    END F2_TASK;
    TASK BODY F2_TASK IS 
        MA,MB,MC: Матрица;
        F_OUT: File_type;
    BEGIN         
    --MC=SORT(TRANS(MA)*MB)
        PUT_LINE("T2 STarted"); 
        set_N(3);
        Create_Matrix(MA, 1);
        Create_Matrix(MB, 1);  
        delay 3.0;    
        F2(MA,MB,MC);
        CREATE(F_OUT, Out_File, "F2_OUT.TXT");
        PUT_LINE(F_OUT, "MC=SORT(TRANS(MA)*MB)");
        Matrix_File_Output(F_OUT, MC);
        CLOSE(F_OUT);
        PUT_LINE("T2 COMPLETE");
    END F2_TASK;
   -----------------------------------------------
    TASK F3_TASK IS 
        PRAGMA PRIORITY(1);
    END F3_TASK;
    TASK BODY F3_TASK IS 
        MA,MB: Матрица;
        A,D: Вектор;   
        F_OUT: File_type;  
    BEGIN
   --D=SORT(A)*(MA+MB)
        PUT_LINE("T3 STARTED");
        set_N(3);
        Create_Matrix(MA, 1);
        Create_Matrix(MB, 1);
        Create_Vector(A,1);
        delay 3.0;
        F3(MA,MB,A,D);
        CREATE(F_OUT, OUT_File, "F3_OUT.TXT");
        PUT_LINE(F_OUT, "D=SORT(A)*(MA+MB)");
        Vector_File_Output(F_OUT, D);
        Close(F_OUT);
        PUT_LINE("T3 COMPLETE");
    END F3_TASK;
    t: integer;
BEGIN
    GET(t); 
END Lab2;

