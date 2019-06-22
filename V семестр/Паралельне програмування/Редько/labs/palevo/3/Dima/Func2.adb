--���������� ������� ���������, ������ ��-91
--���. 1. ������������. ������
--F1: C=A-B
--F2: MC=SORT(TARNS(MA)*MB)
--F3: D=SORT(A)*(MA+MB)
WITH ADA.TEXT_IO; USE ADA.TEXT_IO;
WITH ADA.INTEGER_TEXT_IO; USE ADA.INTEGER_TEXT_IO;

PACKAGE BODY Func IS
--���������� �������������� ��������

	FUNCTION "-" (L, R: ������) RETURN ������ IS
		Result : ������;
	BEGIN
		FOR I IN 1..N LOOP
			Result(I) := L(I) - R(I);
		END LOOP;
		RETURN Result;
	END "-";

	FUNCTION "*" (L: �������; R: ������) RETURN ������ IS
		Result : ������;
	BEGIN
		FOR I IN 1..N LOOP
			Result(I) := 0;
		END LOOP;
		FOR I IN 1..N LOOP
			FOR j IN 1..N LOOP
				Result(I) := Result(I)+ (L(I)(J) * R(J));
			END LOOP;
		END LOOP;
		RETURN Result;
	END "*";

   FUNCTION "*" (L, R : �������) RETURN ������� IS
       Result : �������;
   BEGIN
       FOR I IN 1..N LOOP
           FOR J IN 1..N LOOP
			   Result(I)(J):=0;
               FOR K IN 1..N LOOP
                   Result(I)(J) := L(I)(K)*R(K)(J)+Result(I)(J);
               END LOOP;
           END LOOP;
       END LOOP;
      RETURN Result;
   END "*";

   FUNCTION "+" (L, R: �������) RETURN ������� IS
       Result : �������;
   BEGIN
	   FOR I IN 1..N LOOP
	   	   FOR J IN 1..N LOOP
			   Result(I)(J) := L(I)(J) + R(I)(J);
		   END LOOP;
	   END LOOP;
	   RETURN Result;
   END "+";

--���������� ���������������� �������
    PROCEDURE TRANS(M : IN OUT �������) IS
        Buf : �������;
	BEGIN
        Buf := M;
        FOR I IN 1..N LOOP
            FOR J IN 1..N LOOP
                M(I)(J) := Buf(J)(I);
			END LOOP;
		END LOOP;
    END TRANS;
                 
--���������� �����/������
	PROCEDURE File_Output(F: in File_type) IS
    BEGIN
        PUT(F, N);
        NEW_LINE(F);
    END File_Output;
   
    PROCEDURE Integer_File_Output(F: in File_type; Int: in INTEGER) IS
    BEGIN
        PUT(F, Int);
        NEW_LINE(F);
    END Integer_File_Output;

    PROCEDURE Vector_File_Output(F: in File_type; V : IN ������) IS
    BEGIN
        FOR I IN 1..N LOOP
            PUT(F, V(I));
        END LOOP;
        NEW_LINE(F);
    END Vector_File_Output;
  
    PROCEDURE Matrix_File_Output(F: in File_type; M : IN �������) IS
    BEGIN
        FOR I IN 1..N LOOP
            FOR J IN 1..N LOOP
                PUT(F, M(I)(J));
            END LOOP;      
            NEW_LINE(F);
        END LOOP;
        NEW_LINE(F);    
    END Matrix_File_Output;

    PROCEDURE set_N (Value: IN INTEGER) IS
    BEGIN
        N := Value;
    END set_N;

    PROCEDURE Create_Vector (V : OUT ������; Value: IN INTEGER) IS
    BEGIN
        FOR I IN 1..N LOOP
            V(I) := Value;
        END LOOP;
    END Create_Vector;
  
    PROCEDURE Create_Matrix(M : OUT �������; Value: IN INTEGER) IS
    BEGIN
        FOR I IN 1..N LOOP
            FOR J IN 1..N LOOP
                M(I)(J) := Value;
            END LOOP;
        END LOOP;
    END Create_Matrix;

--�������� ����������
	PROCEDURE SORT(V : IN OUT ������) IS
	T: INTEGER;
	BEGIN
		FOR I IN 1..N LOOP
			FOR J IN I+1..N LOOP
				IF V(J) > V(I) THEN
					T:= V(I);
                    V(I):= V(J);
					V(J):= T;
				END IF;  
			END LOOP;
		END LOOP;
	END SORT;
    PROCEDURE SORT(M : IN OUT �������) IS
        I1,J1, T: INTEGER:=1;
        V: ARRAY (1..N*N) OF INTEGER;
    BEGIN
        FOR I IN 1..N LOOP
            FOR J IN 1..N LOOP
                V(T):= M(I)(J);
                T:= T+1;
            END LOOP;
        END LOOP;
        FOR I IN 1..N*N LOOP
            FOR J IN I+1..N*N LOOP
                IF V(J) > V(I) THEN
                    T:= V(I);
                    V(I):= V(J);
                    V(J):= T;
                END IF;
            END LOOP;
        END LOOP;
        T:= 1;
        FOR I IN 1..N LOOP
            FOR J IN 1..N LOOP
                M(I)(J):= V(T);
                T:= T+1;
            END LOOP;
        END LOOP;
    END SORT;

--��������� �������� N
	PROCEDURE Edit_N IS
 	BEGIN
		PUT("N=");
		GET(N);
    END Edit_N;
--��������� � ������������ � ���������
	PROCEDURE F1 (A,B : IN ������; C : OUT ������)  IS     
	BEGIN
    	C := A-B;		
	END F1;

    PROCEDURE F2 (MA,MB : IN �������; MC : OUT �������)  IS
    Buf : �������;           
	BEGIN
        Buf := MA;
        TRANS(Buf);
    	MC := Buf*MB;
        SORT(MC);
	END F2;
	PROCEDURE F3 (MA,MB : IN �������; A : IN ������; D : OUT ������)IS
        Buf : �������;
        BufV : ������;
    BEGIN
        BufV := A;
        SORT(BufV);
        Buf := MA+MB;
        D := Buf*BufV;
	END F3;
END Func;

