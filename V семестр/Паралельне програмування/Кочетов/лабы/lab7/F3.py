from Matrix import Matrix
from Vector import Vector
class F3:
	def __init__(self, N):
		self.N = N

	def run(self):
		print 'Task 3 start\n'
		MO, MP, MR = [Matrix(self.N) for _ in range(3)]
		S = Vector(self.N)
		self.result = MO.multiply(MP).multiply(S).sum(MR.multiply(S.sort()))
		print 'Task 3 end\n'