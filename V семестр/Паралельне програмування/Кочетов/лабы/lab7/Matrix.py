from random import randrange
from Vector import Vector

class Matrix:
	def __init__(self, param):
		if (type(param) is int):
			self.N, self.grid = param, [[randrange(10, 50) for _ in range(param)] for __ in range(param)]
		else:
			self.N, self.grid = len(param), param[:]

	def __repr__(self):
		return ('\n'.join([' '.join([str(item) for item in row]) for row in self.grid]))

	def get(self, i, k):
		return self.grid[i][k]

	def multiply(self, param):
		if (isinstance(param, Matrix)):
			return Matrix([[sum([self.grid[i][j] * param.get(j, k) for j in range(self.N)]) for k in range(self.N)] for i in range(self.N)])
		elif (isinstance(param, Vector)):
			return Vector([sum([self.grid[i][j] * param.get(j) for j in range(self.N)]) for i in range(self.N)])
		else:
			return Matrix([[item * int(param) for item in row] for row in self.grid])

	def sum(self, m):
		return Matrix([[self.grid[i][k] + m.get(i, k) for k in range(self.N)] for i in range(self.N)])

	def min(self):
		return min([min([item for item in row]) for row in self.grid])

	def max(self):
		return max([max([item for item in row]) for row in self.grid])