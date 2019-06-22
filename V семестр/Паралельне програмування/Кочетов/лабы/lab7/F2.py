from Matrix import Matrix
from Vector import Vector
class F2:
	def __init__(self, N):
		self.N = N

	def run(self):
		print 'Task 2 start\n'
		MG, MF, MK, MH = [Matrix(self.N) for _ in range(4)]
		self.result = MG.multiply(MF.min()).sum(MK.multiply(MF).multiply(MH.max()))
		print 'Task 2 end\n'