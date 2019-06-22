package p1.p2 is

	type Matrix is private;

	function F2(MB: Matrix) return integer;

private

	type Matrix is Array(1..N) of Vector;
	
end p1.p2;
