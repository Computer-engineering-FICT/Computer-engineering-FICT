package p1 is

	N: constant integer := 3;

	type Vector is private;
	
	function F1(A, B, C: Vector) return integer;

private

	type Vector is Array(1..N) of integer;
	
end p1;
