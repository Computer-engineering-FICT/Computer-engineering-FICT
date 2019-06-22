from random import randrange

class Vector:
	def __init__(self, param):
		if (type(param) is int):
			self.N, self.grid = param, [randrange(10, 50) for _ in range(param)]
		else:
			self.N, self.grid = len(param), param[:]	

	def __repr__(self):
		return ' '.join(map(str, self.grid))

	def get(self, i):
		return self.grid[i]

	def sum(self, v):
		return Vector([self.grid[i] + v.get(i) for i in range(v.N)])

	def sort(self):
		return Vector(sorted(self.grid))