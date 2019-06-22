# -*- coding: utf-8 -*-

from copy import deepcopy

class PackF(object):

    N = 2000

    def get_dimension(self):
        return self.N

    def get_filled_vector(self, dimension):
        vector = [1, ] * dimension
        return vector

    def vector_plus(self, vector1, vector2):
        result = deepcopy(vector1)
        for i in range(self.N):
            result[i] = vector1[i] + vector2[i]
        return result

    def vector_minus(self, vector1, vector2):
        result = deepcopy(vector1)
        for i in range(self.N):
            result[i] = vector1[i] - vector2[i]
        return result

    def get_filled_matrix(self, dimension):
        result = []
        for i in range(dimension):
            result.append(self.get_filled_vector(dimension))
        return result

    def matrix_trans(self, matrix):
        result = deepcopy(matrix)
        for i in range(self.N):
            for j in range(self.N):
                result[i][j] = matrix[j][i]
        return result

    def matrix_minus(self, matrix1, matrix2):
        result = deepcopy(matrix1)
        for i in range(self.N):
            result[i] = self.vector_minus(matrix1[i], matrix2[i])
        return result

    def matrix_plus(self, matrix1, matrix2):
        result = deepcopy(matrix1)
        for i in range(self.N):
            result[i] = self.vector_plus(matrix1[i], matrix2[i])
        return result

    def matrix_mul(self, matrix1, matrix2):
        result = deepcopy(matrix1)
        for i in range(len(matrix1)):
            for j in range(len(matrix1)):
                result[i][j] = 0
                for k in range(len(matrix1)):
                    result[i][j] += matrix1[i][k] * matrix2[k][j]
        return result

    def matrix_sort(self, matrix):
        result = deepcopy(matrix)
        tmp = None
        for i in range(1, self.N):
            for j in range(1, self.N):
                if result[i - 1][j - 1] < result[i - 1][j]:
                    tmp = result[i - 1][j]
                    result[i - 1][j] = result[i - 1][j - 1]
                    result[i - 1][j] = tmp
        return result

    def matrix_print(self, matrix):
        for i in range(self.N):
            print matrix[i]

    def matrix_maximum(self, matrix):
        result = -100000
        for i in range(self.N):
            for j in range(self.N):
                if result < matrix[i][j]:
                    result = matrix[i][j]
        return result

    def f1(self, B, C, D):
        return self.vector_plus(B, self.vector_minus(C, D))

    def f2(self, MA, MB, MC):
        return self.matrix_sort(
            self.matrix_minus(
                self.matrix_plus(MA, self.matrix_trans(MB)),
                self.matrix_trans(MC)
            )
        )

    def f3(self, MS, MA, MB):
        return self.matrix_maximum(
            self.matrix_plus(self.matrix_sort(MS), self.matrix_mul(MA, MB)))
