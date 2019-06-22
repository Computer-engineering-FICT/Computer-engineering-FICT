import random

n = 5 #int(input("Enter size for matrix, please "))


# Generate random matrix
def random_matrix(n):
    matrix = []
    for i in range(n):
        tmp = []
        for j in range(n):
            tmp.append(0)#random.randint(0, 100))
        matrix.append(tmp)
    return matrix

A = random_matrix(n)


# Just beautiful printing matrix
def print_matrix(matrix):
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            print(matrix[i][j], ' ', end='')
        print('')
   # for i in range(len(matrix)):


tmp = 1
for i in range(len(A)):
    if i % 2 == 0:
        x = 0
        y = i
        while y >= 0 :
            A[x][y] = tmp
            tmp +=1
            x += 1
            y -= 1
    else:
        x = i
        y = 0
        while x >= 0:
            A[x][y] = tmp
            tmp += 1
            x -= 1
            y += 1




print_matrix(A)
