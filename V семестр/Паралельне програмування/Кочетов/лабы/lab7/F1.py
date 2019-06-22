from Matrix import Matrix
from Vector import Vector
class F1:
	def __init__(self, N):
		self.N = N

	def run(self):
		print 'Task 1 start\n'
		MA, ME = [Matrix(self.N) for _ in range(2)]
		A, B, D = [Vector(self.N) for _ in range(3)]
		self.result = MA.multiply(ME).multiply(A).sum(B).sum(D)
		print 'Task 1 end\n'