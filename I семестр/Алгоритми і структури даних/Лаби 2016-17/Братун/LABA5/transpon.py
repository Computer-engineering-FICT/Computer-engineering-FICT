import random

N = int(input(str('Input the number of lines -> ')))
M = int(input(str('Input the number of column -> ')))
matrix = [[random.randint(0, 10) for j in range(M)] for i in range(N)]

print('Matrix -> {}'.format(matrix))


for i in range(len(matrix)):
    for j in range(0,i+1):
        matrix[i][j], matrix[j][i] = matrix [j][i], matrix[i][j]
print("Транспонована матрия")
print(matrix)
