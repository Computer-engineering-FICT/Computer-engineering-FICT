with Ada.Text_IO; use Ada.Text_IO;
package body Vector_F1.Matrix_F2 is
	
	-- MD = MA+MB-MC*MM 
   procedure Func2(MA, MB, MC, MM: in Matrix; MD: out Matrix) is
   begin
      MD := MatrixRizn( MatrixSum(MA,MB), MatrixMult(MC, MM));
	   exception
	      when Constraint_Error =>
	         Put("Constraint error in Func2");
    end Func2;

   ---Matrix operations
   ----Multiplication of matrix a*b
   function MatrixMult(A, B: in Matrix) return Matrix is
		RezMatr: Matrix;
		v: Vector;
		begin
			for i in 1..N loop      -- счетчик вертикалей
				for j in 1..N loop    -- формирует вертикальный
					v(j) := B(j)(i);  -- вектор второй матрицы 
				end loop;             -- из номера вертикали
				for k in 1..N loop      -- счетчик горизонталей
  					RezMatr(k)(i) := MultiplyStep (A(k),v);
				end loop;
			end loop;
			return RezMatr; 
		end MatrixMult;



   ----Sum of matrix a+b
   function MatrixSum(a, b: Matrix) return Matrix is
      c: Matrix;
   begin
      for i in 1..N loop
         for j in 1..N loop
            c(i)(j) := a(i)(j) + b(i)(j);
         end loop;
      end loop;
      return c;
   end;

   ----Discrepancy of matrix a-b
   function MatrixRizn(a, b: Matrix) return Matrix is
      c: Matrix;
   begin
      for i in 1..N loop
         for j in 1..N loop
            c(i)(j) := a(i)(j) - b(i)(j);
         end loop;
      end loop;
      return c;
   end;

	function MultiMatrNum (A: in Matrix; e: in integer) return matrix is
			buf: matrix;
	begin
		Buf := A;
			for i in 1..N loop
				for J in 1..N loop
					Buf(I)(J) := Buf(I)(J)*e;
				end loop;
			end loop;
			return Buf;
		end MultiMatrNum;

   -----Descending sort of strings of matrix m
   procedure MatrixSort(m: in out Matrix) is
   begin
      for i in 1..n loop
         VectSort(m(i));
      end loop;
   end MatrixSort;

   ----Searching maximum in matrix m
   function MatrixMax(m: Matrix) return integer is
      max: integer;
   begin
      max := m(1)(1);
      for i in 1..N loop
         for j in 1..N loop
            if max < m(i)(j) then
               max := m(i)(j);
            end if;
         end loop;
      end loop;
      return max;
   end;

	----Searching maximum in matrix m
   function MatrixMin(m: Matrix) return integer is
      max: integer;
   begin
      max := m(1)(1);
      for i in 1..N loop
         for j in 1..N loop
            if max > m(i)(j) then
               max := m(i)(j);
            end if;
         end loop;
      end loop;
      return max;
   end;

end Vector_F1.Matrix_F2;
