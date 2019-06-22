package p1.p2 is

	type Matrix is private;

	function F2(MB: Matrix) return integer;

private

	type Matrix is Array(1..N) of Vector;
	
end p1.p2;

package body p1.p2 is

	function getMaxElement(a: Matrix) return integer is
		b: integer := a(1)(1);
	begin
		for i in 1..N loop
			for j in 1..N loop
				if b < a(i)(j) then
					b := a(i)(j);
				end if;
			end loop;
		end loop;
		return b;
	end getMaxElement;

	-- x = MAX(MB)
	function F2(MB: Matrix) return integer is
	begin
		return getMaxElement(MB);
	end F2;	
	
end p1.p2;
