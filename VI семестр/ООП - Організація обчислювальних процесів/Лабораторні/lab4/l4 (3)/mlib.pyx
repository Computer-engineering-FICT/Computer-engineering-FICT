import random
import numpy


def generate(N, pc, count):
    for x in range(count):
        matrix = [[0 for x in range(N)] for x in range(N)]
        count = int(N*N*pc)
        for i in random.sample(range(N*N), count):
            matrix[i % N][i//N] = 1
        yield numpy.matrix(matrix)

