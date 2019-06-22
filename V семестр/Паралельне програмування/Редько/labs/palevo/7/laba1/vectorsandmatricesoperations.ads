with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package vectorsAndMatricesOperations is

	type Vector is private;
	type Matrix is private;
	
	procedure inputVectorTo(a: out Vector);
	procedure outputVector(a: in Vector);
	function addVector(a, b: Vector) return Vector;
	function subtractVector(a, b: Vector) return Vector;
	function multiplyVectorByInteger(a: Vector; b: integer) return Vector;
	function multiplyVectors(a, b: Vector) return integer;
	function getMaxElement(a: Vector) return integer;
	function getMinElement(a: Vector) return integer;
	function multiplyIntegerByVector(a: integer; b: Vector) return Vector;
	procedure sortVectorInAscendingOrder(a: in out Vector);
	procedure sortVectorInDescendingOrder(a: in out Vector);
	
	procedure inputMatrixTo(a: out Matrix);
	procedure outputMatrix(a: in Matrix);
	function addMatrix(a, b: Matrix) return Matrix;
	function subtractMatrix(a, b: Matrix) return Matrix;
	function multiplyIntegerByMatrix(a: integer; b: Matrix) return Matrix;
	function multiplyVectorByMatrix(a: Vector; b: Matrix) return Vector;
	function multiplyMatrices(a, b: Matrix) return Matrix;
	function transposeMatrix(a: Matrix) return Matrix;
	function getMaxElement(a: Matrix) return integer;
	function getMinElement(a: Matrix) return integer;
	procedure sortMatrix(a: in out Matrix);
	
private

	N: constant integer := 3;
	
	type Vector is Array(1..N) of integer;
	type Matrix is Array(1..N) of Vector;
	
end vectorsAndMatricesOperations;
