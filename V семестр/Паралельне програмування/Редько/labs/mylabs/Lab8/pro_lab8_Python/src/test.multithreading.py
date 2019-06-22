import time
from multiprocessing import Process

N=5

def InputVector():
      vector = [1 for col in range(N)]
      return vector

def InputMatrix():
      matrix = [[1 for row in range(N)] for col in range(N)]
      return matrix

def OutputVector(vector):
      if N <= 5:
          print(vector)

def OutputMatrix(matrix):
      if N <= 5:
          for i in range(5):
              print(matrix[i])

def MultiplyVectorOnScalar(vector, scalar):
      result = InputVector()
      for i in range(5):
          result[i] = vector[i]*scalar
      return result

def MultiplyMatrices(matrix1, matrix2):
      result = [[0 for row in range(len(matrix1))] for col in range(len(matrix2[0]))]
      for i in range(len(matrix1)):
          for j in range(len(matrix2[0])):
              for k in range(len(matrix2)):
                  result[i][j] += matrix1[i][k]*matrix2[k][j]
      return result

def MultiplyVectorOnMatrix(vector, matrix):
      result = InputVector()
      for i in range(5):
          result[i] = 0
          for j in range(5):
              result[i] = result[i] + vector[j]*matrix[j][i]
      return result

def MultiplyVectors(vector1, vector2):
       vector = InputVector()
       result = 0
       for i in range(N):
          vector[i] = 0
          vector[i] = vector1[i] * vector2[i]
       result = result + vector[i]
       return result

def AddVectors(vector1, vector2):
     result = InputVector()
     for i in range(5):
         result[i] = vector1[i] + vector2[i]
     return result

def AddVectorAndScalar(vector, scalar):
     result = InputVector()
     for i in range(5):
         result[i] = vector[i] + scalar
     return result

def SearchMaxVector(vector):
     result = SortVector(vector)
     max = result[0]
     return max

def SearchMinVector(vector):
     result = SortVector(vector)
     min = result[5 - 1]
     return min

def SortVector(vector):
     for i in range(5):
         for j in range(5):
             if (vector[i] > vector[j]):
                 buffer = vector[i]
                 vector[i] = vector[j]
                 vector[j] = buffer
     return vector

def Transpoze(matrix):
     result = InputMatrix()
     for i in range(5):
         for j in range(5):
             result[i][j] = matrix[i][j]
     for i in range(5):
         for j in range(5):
             buffer = result[i][j]
             result[i][j] = result[j][i]
             result[j][i] = buffer
     return result

def F1():
      print("1 function started.")
      A = InputVector()
      B = InputVector()
      C = InputVector()
      MA = InputMatrix()
      MZ = InputMatrix()
      MT = MultiplyMatrices(MA, MZ)
      VT = MultiplyVectorOnMatrix(B, MT)
      VT1 = AddVectors(VT, A)
      VT2 = AddVectors(VT1, C)
      s = SearchMaxVector(A)
      E = MultiplyVectorOnScalar(VT2, s)
      OutputVector(E)
      print("1 function ended.")

def F2():
      print("2 function started.")
      MA = InputMatrix()
      MB = InputMatrix()
      MC = MultiplyMatrices(MA, MB)
      time.sleep(1)
      OutputMatrix(MC)
      print("2 function ended.")

def F3():
      print("3 function started.")
      A = InputVector()
      B = InputVector()
      C = InputVector()
      MB = InputMatrix()
      MM = InputMatrix()
      MT = MultiplyMatrices(MB, MM)
      MT1 = Transpoze(MT)
      VT = MultiplyVectorOnMatrix(A, MT1)
      VT1 = SortVector(C)
      s = MultiplyVectors(VT1, B)
      VT2 = AddVectorAndScalar(VT, s)
      d = SearchMinVector(VT2)
      print(d)
      print("3 function ended.")


if __name__ == "__main__":
    print("Main started.")
process1 = multiprocessing.Process(target = F1, args = ())
process2 = multiprocessing.Process(target = F2, args = ())
process3 = multiprocessing.Process(target = F3, args = ())
process1.start()
process2.start()
process3.start()
process1.join()
process2.join()
process3.join()
print("Main ended.")
