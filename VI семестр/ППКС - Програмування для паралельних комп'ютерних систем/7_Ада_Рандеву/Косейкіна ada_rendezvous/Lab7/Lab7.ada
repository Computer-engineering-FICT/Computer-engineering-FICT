--Косейкина Анна Сергеевна, группа ИО-91
--'''лаб№ 8. Ada''' 
-- A=B*(MO*MX)-alpha*Z
with Ada.TEXT_IO; use Ada.TEXT_IO;
with Ada.INTEGER_TEXT_IO; use Ada.INTEGER_TEXT_IO;
PROCEDURE LAB8 IS
	N: INTEGER := 6;
   	P: INTEGER := 6;
   	H: INTEGER := N/P;
    TYPE VECTOR IS ARRAY (INTEGER RANGE <>) OF INTEGER;
  	TYPE MATRIX IS ARRAY (INTEGER RANGE <>) OF VECTOR(1..N); 
--========================================================================
  	TASK T1;
--========================================================================
  	TASK T2 IS 
  		ENTRY EXCT1T2(ALFA1: IN INTEGER; B1: IN VECTOR; MX1: IN MATRIX; Z1: OUT VECTOR; MO1: OUT MATRIX);
  		ENTRY REST2(A1: OUT VECTOR);
   	END T2;
--========================================================================
  	TASK T3 IS 
  		ENTRY DATAT1(ALFA1: IN INTEGER; B1: IN VECTOR; MO1: IN MATRIX; MX1: IN MATRIX; Z1: IN VECTOR);
  		ENTRY REST3(A1: OUT VECTOR);
   	END T3;
--========================================================================
 	TASK T4 IS 
   		ENTRY DATAT2(ALFA1: IN INTEGER; B1: IN VECTOR; MO1: IN MATRIX; MX1: IN MATRIX; Z1: IN VECTOR);
   		ENTRY REST4(A1: OUT VECTOR);  
   	END T4;
--========================================================================
 	TASK T5 IS 
   		ENTRY DATAT3(ALFA1: IN INTEGER; B1: IN VECTOR; MO1: IN MATRIX; MX1: IN MATRIX; Z1: IN VECTOR);
  		ENTRY REST5(A1: OUT VECTOR);
  	END T5;
--========================================================================
   	TASK T6 IS 
   		ENTRY DATAT4(ALFA1: IN INTEGER; B1: IN VECTOR; MO1: IN MATRIX; MX1: IN MATRIX; Z1: IN VECTOR);
   		ENTRY REST6 (A1: OUT VECTOR);
   	END T6;
--========================================================================
  	TASK BODY T1 IS
   		alfa, t: INTEGER;
  		A: VECTOR(1..N);
   		B: VECTOR(1..N);
   		Z: VECTOR(1..3*H);
   		MX: MATRIX(1..N);
   		MO: MATRIX(1..N);
		Buf : vector (1..H*3);
		buf2 : vector (1..H*2);
  	BEGIN
   		PUT_LINE(" T1 STARTED ");
   --input B, alpha, MX
   		FOR I IN 1..N LOOP
  			FOR J IN 1..N LOOP
   				MX(I)(J) := 1;
   			END LOOP;
   			B(I):= 1;
   		END LOOP;
  		ALFA:= 1;  
   --exchange
   		T2.EXCT1T2(ALFA, B(1..N), MX(H..(4*H)-1), Z, MO);
   --send to T3             
  		T3.DATAT1(ALFA, B(1..N), MO, MX, Z(2*H..(3*H)-1)&Z(4*H..(5*H)-1)); 
 --count
   		FOR I IN 1..H LOOP
   			FOR J IN 1..N LOOP
   				t:= 0;
   				FOR K IN 1..N LOOP
   					t:= t +(MO(K)(J)*MX(I)(K));
   				END LOOP;
   				A(I) := A(I) +(t*B(J));
   			END LOOP;
   			A(I) := A(I) -(Z(I)*ALFA);
   		END LOOP;  
 --receive from T3
  		T3.REST3(Buf); 
		for i in H*2..H*3 loop
			a(i) := buf(i-H*2+1);
		end loop;
		for i in H*4..N loop
			a(i) := buf(i-H*2);
		end loop;
--receive from T2
		T2.REST2(buf2);
		for i in H..2*H loop
			a(i) := buf(i-H+1);
		end loop;
		for i in H*3..H*4 loop
			a(i) := buf(i-H*2);
		end loop;
--output A      
		IF N = 6 THEN
 			FOR i IN 1..N LOOP
 				PUT(A(i));
  			END LOOP;
  			NEW_LINE;
  		ELSE
  			PUT(A(1));
  			NEW_LINE;
  		END IF;     
   	    PUT_LINE(" T1 FINISHED ");
   	END T1;
 --========================================================================
   	TASK BODY T2 IS
  		alfa, t: INTEGER;
   		A: VECTOR(1..H*2);
   		B: VECTOR(1..N);
   		Z: VECTOR(1..N);
   		MX: MATRIX(1..H*3);
   		MO: MATRIX(1..N);		
   	BEGIN
   		PUT_LINE(" T2 STARTED ");
   --input MO, Z
		FOR I IN 1..N LOOP
  			FOR J IN 1..N LOOP
   				MO(I)(J) := 1;
   			END LOOP;
   			Z(I):= 1;
   		END LOOP;
   		ACCEPT EXCT1T2(ALFA1: IN INTEGER; B1: IN VECTOR; MX1: IN MATRIX; Z1: OUT VECTOR; MO1: OUT MATRIX) DO
   			ALFA := ALFA1;
  			B:= B1;
  			MX:= MX1;
  			Z1:= Z(1..H)&Z(H*2..H*3)&Z(H*4..H*5);
            MO1:= MO;       
  		END EXCT1T2;
  --send to T4 
  		T4.DATAT2(ALFA, B(1..N), MO, MX, Z(3*H..(4*H)-1)&Z(5*H..N-1));
  --count
  		FOR I IN H..H*2 LOOP
  			FOR J IN 1..N LOOP
  				t:= 0;
  				FOR K IN 1..N LOOP
  					t:= t +(MO(K)(J)*MX(I)(K));
  				END LOOP;
  				A(I) := A(I) +(t*B(J));
  			END LOOP;
  			A(I) := A(I) -(Z(I)*ALFA);
  		END LOOP;
  --receive T4
		T4.REST4(A(H..H*2));   
--send to T1      
  		ACCEPT REST2(A1: OUT VECTOR) DO
  			A1 := A;
  		END REST2;
  	    PUT_LINE(" T2 FINISHED ");
  	END T2;
 --========================================================================
  	TASK BODY T3 IS
  		alfa, t: INTEGER;
  		A: VECTOR(1..H*3);
  		B: VECTOR(1..N);
  		Z: VECTOR(1..H*2);
  		MX: MATRIX(1..H*2);
  		MO: MATRIX(1..N);	
  	BEGIN
  		PUT_LINE(" T3 STARTED ");
  --receive from T1
  		ACCEPT DATAT1(ALFA1: IN INTEGER; B1: IN VECTOR; MO1: IN MATRIX; MX1: IN MATRIX; Z1: IN VECTOR) DO
  			ALFA:= ALFA1;
  			B:= B1;
  			MO:= MO1;
			MX := MX1;
			Z := Z1;
  		END DATAT1;
--send to T5
		T5.DATAT3(ALFA, B(1..N), MO, MX, Z(H..(H*2)-1));    
 --count	       
  		FOR I IN H*2..(H*3)-1 LOOP
  			FOR J IN 1..N LOOP
  				t:= 0;
  				FOR K IN 1..N LOOP
  					t:= t +(MO(K)(J)*MX(I)(K));
  				END LOOP;
  				A(I) := A(I) +(t*B(J));
  			END LOOP;                
  			A(I) := A(I) -(Z(I)*ALFA);
  		END LOOP;
 --receive from T5        
		T5.REST5(A(H..H*3));
--send to T1     
  		ACCEPT REST3(A1: OUT VECTOR) DO
  			A1 := A;
  		END REST3;     	
  	    PUT_LINE(" T3 FINISHED ");
  	END T3;
--========================================================================
  	TASK BODY T4 IS
  		alfa, t: INTEGER;
  		A: VECTOR(1..H);
  		B: VECTOR(1..N);
  		Z: VECTOR(1..H*2);
  		MX: MATRIX(1..H*2);
  		MO: MATRIX(1..N);
  	BEGIN
  		PUT_LINE(" T4 STARTED ");
  		--receive from T2
  	    ACCEPT DATAT2(ALFA1: IN INTEGER; B1: IN VECTOR; MO1: IN MATRIX; MX1: IN MATRIX; Z1: IN VECTOR) DO
  			AlFA := ALFA1;
			B := B1;
			MO := MO1;
			MX := MX1;
			Z := Z1;
  		END DATAT2;                   
  --send to T6
  		T6.DATAT4(alfa, b, mo, mx(H..H*2), Z(H..H*2));
 --count
  		FOR I IN 1..H LOOP
  			FOR J IN 1..N LOOP
  				t:= 0;
  				FOR K IN 1..N LOOP
  					t:= t +(MO(K)(J)*MX(I)(K));
  				END LOOP;
  				A(I) := A(I) +(t*B(J));
  			END LOOP;
  			A(I) := A(I) -(Z(I)*ALFA);
  		END LOOP;
  --send to T2
  		ACCEPT REST4(A1: OUT VECTOR) DO
  			A1 := A(1..H);
  		END REST4;    
  	    PUT_LINE(" T4 FINISHED ");
  	END T4;
--========================================================================
  	TASK BODY T5 IS
  		alfa, t: INTEGER;
  		A: VECTOR(1..H*2);
  		B: VECTOR(1..N);
  		Z: VECTOR(1..H);
  		MX: MATRIX(1..H);
  		MO: MATRIX(1..N);
  	BEGIN
  		PUT_LINE(" T5 STARTED ");
  --receive from t3       
  		ACCEPT DATAT3(ALFA1: IN INTEGER; B1: IN VECTOR; MO1: IN MATRIX; MX1: IN MATRIX; Z1: IN VECTOR) DO
  			ALFA:= ALFA1;
  			B:= B1;
  			MO:= MO1;
			mx := mx1;
			z := z1;
  		END DATAT3;   
  		--count
  		FOR I IN 1..H LOOP
  			FOR J IN 1..N LOOP
  				t:= 0;
  				FOR K IN 1..N LOOP
  					t:= t +(MO(K)(J)*MX(I+H-1)(K));
  				END LOOP;
  				A(I) := A(I) +(t*B(J));
  			END LOOP;
  			A(I) := A(I) -(Z(I)*ALFA);
  		END LOOP;
--receive from T6
		T6.REST6(A);
--send to T3
  		ACCEPT REST5(A1: OUT VECTOR) DO
  			A1 := A;
  		END REST5;               
  	    PUT_LINE(" T5 FINISHED ");
  	END T5;
  --========================================================================
  	TASK BODY T6 IS
  		alfa, t: INTEGER;
  		A: VECTOR(1..H);
  		B: VECTOR(1..N);
  		Z: VECTOR(1..H);
  		MX: MATRIX(1..H);
  		MO: MATRIX(1..N);
  	BEGIN
  		PUT_LINE(" T6 STARTED ");
  		--receive from t4
  		ACCEPT DATAT4(ALFA1: IN INTEGER; B1: IN VECTOR; MO1: IN MATRIX; MX1: IN MATRIX; Z1: IN VECTOR) DO
  			ALFA:= ALFA1;
  			B:= B1;           
  			MO:= MO1;
			mx := mx1;
			z := z1;
  		END DATAT4;
  --count
  		FOR I IN 1..H LOOP
  			FOR J IN 1..N LOOP
  				t:= 0;
 				FOR K IN 1..N LOOP
  					t:= t +(MO(K)(J)*MX(I)(K));
  				END LOOP;
  				A(I) := A(I) +(t*B(J));
  			END LOOP;
  			A(I) := A(I) -(Z(I)*ALFA);
  		END LOOP;   
 --send to T5
  		ACCEPT REST6(A1: OUT VECTOR) DO
  			A1 := A;
  		END REST6;     
  	    PUT_LINE(" T6 FINISHED ");
  	END T6;
  	
  BEGIN
  	NULL;
 END LAB8;
	

