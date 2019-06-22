class Methods:
    def __init__(self, sizeOfArrays):
        self.size = sizeOfArrays

    
    def fillVectorOfOne(self):
        return [1 for i in range(self.size)]
    
    def fillMatrixOfOne(self):
        return [[1 for j in range(self.size)] for i in range(self.size)]

    def sumOfVectors(self, vector1, vector2):
        return list(map(lambda i,j: i + j, vector1, vector2))

    def sumOfMatrix(self, matrix1, matrix2):
        return list(map(lambda i,j: self.sumOfVectors(i, j), matrix1, matrix2))

    def multOfMatrix(self, matrix1, matrix2):
        return [[sum(a*b for a,b in zip(X_row, Y_call)) for Y_call in zip(*matrix2)] for X_row in matrix1]

    def multOfMatrixOnVector(self, matrix, vector):
        vectorToMatrixOnCol = list(map(lambda *row: list(row), vector))
        return list(map(lambda row: row, *list(map(lambda *col: list(col), *self.multOfMatrix(matrix, vectorToMatrixOnCol)))))

    def multOfVectorOnMatrix(self, vector, matrix):
        return list(map(lambda row: row, *self.multOfMatrix([vector], matrix)))
    
    def transMatrix(self, matrix):
         return list(map(lambda *row: list(row), *matrix))
        
