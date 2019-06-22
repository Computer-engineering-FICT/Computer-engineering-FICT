-- Косейкина Анна Сергеевна, группа ИО-91
--Лаб. №5. Ада. Защищённый модуль
--a=(B+C*(MO*MX))*Z
with Ada.TEXT_IO; use Ada.TEXT_IO;
with Ada.INTEGER_TEXT_IO; use Ada.INTEGER_TEXT_IO;
PROCEDURE LAB5 IS
	N: INTEGER := 6;
	P: INTEGER := 6;
	H: INTEGER := N/P;
    TYPE VECTOR IS ARRAY (1..N) OF INTEGER;
	TYPE MATRIX IS ARRAY (1..N) OF VECTOR; 
    B, Z: VECTOR;
	MX: MATRIX;
		bufV: VECTOR;
		bufM: MATRIX;
	PROTECTED Monitor IS        
 	PROCEDURE Write_MO (value_MO:in MATRIX);
	PROCEDURE Write_C (value_C:in VECTOR);
	FUNCTION Copy_MO RETURN MATRIX;
	FUNCTION Copy_C RETURN VECTOR;
	PROCEDURE Signal_enter;
	PROCEDURE Count_a (value_a: in INTEGER);
	FUNCTION Output_a RETURN INTEGER;
	ENTRY Wait_enter;
	ENTRY Wait_count;
	PRIVATE 
   		a: INTEGER := 0;
		MO: MATRIX;
		C: VECTOR;	
   	 	F1: INTEGER := 0;	
   		F2: INTEGER := 0;	

  	end Monitor;
    PROTECTED BODY Monitor IS
 		PROCEDURE Write_MO(value_MO: in MATRIX)IS
		begin
			MO := value_MO;
		end Write_MO;
		PROCEDURE Write_C(value_C: in VECTOR) IS
		begin
			C := value_C;
		end Write_C;
		FUNCTION Copy_MO RETURN MATRIX IS
  			copy: MATRIX;
   		BEGIN
            copy := MO;
  			RETURN copy;
  		END Copy_MO;
		FUNCTION Copy_C RETURN VECTOR IS
   			copy: VECTOR;
   		BEGIN
            copy := C;
 			RETURN copy;
  		END Copy_C;	
		PROCEDURE Signal_enter IS
   		BEGIN
  			F1:= F1 + 1;
   		END Signal_enter;
		PROCEDURE Count_a(value_a:in INTEGER) IS
		begin
			a := a+value_a;
			F2:= F2 +1;
		end Count_a;
		FUNCTION Output_a RETURN INTEGER IS
			copy: INTEGER;
		begin
			copy:= a;
			RETURN copy;
		end Output_a;
        ENTRY Wait_enter WHEN F1 = 3 IS 
   		BEGIN
   			NULL;
   		END Wait_enter;
        ENTRY Wait_count WHEN F2 = 6 IS 
   		BEGIN
   			NULL;
   		END Wait_count;
  	END Monitor;
  --========================================================================
  	TASK T1;
  	TASK BODY T1 IS
 		a1: INTEGER:= 0;
  		MO1: MATRIX;
		C1: VECTOR;
  	BEGIN
 		PUT_LINE(" T1 STARTED ");
  	--enter Z
  		for i  in 1..N loop
			Z(i) := 1;
		end loop;  
  	--signal about enter                     
  		Monitor.Signal_enter;
--wait for enter
		Monitor.Wait_enter;
  	--copy MO
		MO1 := Monitor.Copy_MO;
  	--copy C
 		C1 := Monitor.Copy_C;
  	--count a1
		for i in 1..H loop                     
			for j in 1..N loop
				bufM(i)(j):= 0;
				for k in 1..N loop 
					bufM(i)(j) := bufM(i)(j)+(MO1(i)(k)*MX(k)(j));
				end loop; 
			end loop;
		end loop;
        for i in 1..H loop
            for j in 1..N loop
                bufV(i) :=bufV(i)+ bufM(i)(j) * C1(j);
			end loop;
		end loop;
        for i in 1..H loop
        	bufV(i):= bufV(i)+B(i);
		end loop;
        for i in 1..H loop
        	a1 := a1+ bufV(i)*Z(i);
		end loop;

		--count a
		Monitor.Count_a(a1);
--wait for count
Monitor.Wait_count;
        --output a
		a1 := Monitor.Output_a;
 		PUT(a1);
		NEW_LINE;
	    PUT_LINE(" T1 FINISHED ");
 	END T1;
  --========================================================================
 	TASK T2;
  	TASK BODY T2 IS
  		a2: INTEGER:= 0;
  		MO2: MATRIX;
		C2: VECTOR;
		temp: INTEGER := 0;
		buf: VECTOR;
  	BEGIN
 		PUT_LINE(" T2 STARTED ");    
  	--wait for enter                     
  		Monitor.Wait_enter;
  	--copy MO
		MO2 := Monitor.Copy_MO;
  	--copy C
 		C2 := Monitor.Copy_C;
  	--count a2
  		for i in H+1..2*H loop                     
			for j in 1..N loop
				bufM(i)(j):= 0;
				for k in 1..N loop 
					bufM(i)(j) := bufM(i)(j)+(MO2(i)(k)*MX(k)(j));
				end loop; 
			end loop;
		end loop;
        for i in H+1..2*H loop
            for j in 1..N loop
                bufV(i) :=bufV(i)+ bufM(i)(j) * C2(j);
			end loop;
		end loop;
        for i in H+1..2*H loop
        	bufV(i):= bufV(i)+B(i);
		end loop;
        for i in H+1..2*H loop
        	a2 := a2+ bufV(i)*Z(i);	
end loop;

		--count a
		Monitor.Count_a(a2);
	    PUT_LINE(" T2 FINISHED ");
  	END T2;
  --========================================================================
  	TASK T3;
  	TASK BODY T3 IS
 		a3: INTEGER:= 0;
  		MO, MO3: MATRIX;
		C3: VECTOR;  
		buf: VECTOR;
        temp: INTEGER := 0;
  	BEGIN
 		PUT_LINE(" T3 STARTED ");
  	--enter B, MO
  		for i  in 1..N loop
			B(i) := 1;
		end loop; 
		for i in 1..N loop
			for j in 1..N loop
				MO(i)(j) := 1;
			end loop;
		end loop;
		Monitor.Write_MO(MO);     
  	--signal about enter                     
  		Monitor.Signal_enter;
--wait for enter
Monitor.Wait_enter;
  	--copy MO
		MO3 := Monitor.Copy_MO;
  	--copy C
 		C3 := Monitor.Copy_C;
  	--count a3
  		  for i in 2*H+1..3*H loop                     
			for j in 1..N loop
				bufM(i)(j):= 0;
				for k in 1..N loop 
					bufM(i)(j) := bufM(i)(j)+(MO3(i)(k)*MX(k)(j));
				end loop; 
			end loop;
		end loop;
        for i in 2*H+1..3*H loop
            for j in 1..N loop
                bufV(i) :=bufV(i)+ bufM(i)(j) * C3(j);
			end loop;
		end loop;
        for i in 2*H+1..3*H loop
        	bufV(i):= bufV(i)+B(i);
		end loop;
        for i in 2*H+1..3*H loop
        	a3 := a3+ bufV(i)*Z(i);	
end loop;

		--count a
		Monitor.Count_a(a3);
	    PUT_LINE(" T3 FINISHED ");
  	END T3;
  --========================================================================
  	TASK T4;
  	TASK BODY T4 IS
  		a4: INTEGER:= 0;
  		MO4: MATRIX;
		C4: VECTOR;
		buf: VECTOR;
		temp: INTEGER := 0;
  	BEGIN
 		PUT_LINE(" T4 STARTED ");    
  	--wait for enter                     
  		Monitor.Wait_enter;
  	--copy MO
		MO4 := Monitor.Copy_MO;
  	--copy C
 		C4 := Monitor.Copy_C;
  	--count a2
  		  		  for i in 3*H+1..4*H loop                     
			for j in 1..N loop
				bufM(i)(j):= 0;
				for k in 1..N loop 
					bufM(i)(j) := bufM(i)(j)+(MO4(i)(k)*MX(k)(j));
				end loop; 
			end loop;
		end loop;
        for i in 3*H+1..4*H loop
            for j in 1..N loop
                bufV(i) :=bufV(i)+ bufM(i)(j) * C4(j);
			end loop;
		end loop;
        for i in 3*H+1..4*H loop
        	bufV(i):= bufV(i)+B(i);
		end loop;
        for i in 3*H+1..4*H loop
        	a4 := a4+ bufV(i)*Z(i);	
end loop;

		--count a
		Monitor.Count_a(a4);
	    PUT_LINE(" T4 FINISHED ");
  	END T4;
  --========================================================================
  	TASK T5;
  	TASK BODY T5 IS
  		a5: INTEGER:= 0;
  		MO5: MATRIX;
		C5: VECTOR;
		buf: VECTOR;
		temp: INTEGER := 0;
  	BEGIN
 		PUT_LINE(" T5 STARTED ");    
  	--wait for enter                     
  		Monitor.Wait_enter;
  	--copy MO
		MO5 := Monitor.Copy_MO;
  	--copy C
 		C5 := Monitor.Copy_C;
  	--count a5
  		  		  for i in 4*H+1..5*H loop                     
			for j in 1..N loop
				bufM(i)(j):= 0;
				for k in 1..N loop 
					bufM(i)(j) := bufM(i)(j)+(MO5(i)(k)*MX(k)(j));
				end loop; 
			end loop;
		end loop;
        for i in 4*H+1..5*H loop
            for j in 1..N loop
                bufV(i) :=bufV(i)+ bufM(i)(j) * C5(j);
			end loop;
		end loop;
        for i in 4*H+1..5*H loop
        	bufV(i):= bufV(i)+B(i);
		end loop;
        for i in 4*H+1..5*H loop
        	a5 := a5+ bufV(i)*Z(i);	
end loop;
	
		--count a
		Monitor.Count_a(a5);
	    PUT_LINE(" T5 FINISHED ");
  	END T5;
  --========================================================================
  	TASK T6;
  	TASK BODY T6 IS
 		a6: INTEGER:= 0;
  		MO6: MATRIX;
		C, C6: VECTOR;
		buf: VECTOR;
		temp: INTEGER := 0;
  	BEGIN
 		PUT_LINE(" T6 STARTED ");
  	--enter C, MX
  		for i  in 1..N loop
			C(i) := 1;
		end loop; 
		for i in 1..N loop
			for j in 1..N loop
				MX(i)(j) := 1;
			end loop;
		end loop;
		Monitor.Write_C(C);     
  	--signal about enter                     
  		Monitor.Signal_enter;
--wait for enter
Monitor.Wait_enter;
  	--copy MO
		MO6 := Monitor.Copy_MO;
  	--copy C
 		C6 := Monitor.Copy_C;
  	--count a6
  		  		  for i in 5*H+1..N loop                     
			for j in 1..N loop
				bufM(i)(j):= 0;
				for k in 1..N loop 
					bufM(i)(j) := bufM(i)(j)+(MO6(i)(k)*MX(k)(j));
				end loop; 
			end loop;
		end loop;
        for i in 5*H+1..N loop
            for j in 1..N loop
                bufV(i) :=bufV(i)+ bufM(i)(j) * C6(j);
			end loop;
		end loop;
        for i in 5*H+1..N loop
        	bufV(i):= bufV(i)+B(i);
		end loop;
        for i in 5*H+1..N loop
        	a6 := a6+ bufV(i)*Z(i);			
end loop;

		--count a
		Monitor.Count_a(a6);
	    PUT_LINE(" T6 FINISHED ");
  	END T6;
  	
  BEGIN
  	NULL;
  END LAB5;

