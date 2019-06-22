import random

n = int(input("Enter size for matrix, please "))


# generation random matrix
def random_matrix(n, zero=False):
    matrix = []
    for i in range(n):
        tmp = []
        for j in range(n):
            if not zero:
                tmp.append(random.randint(0, 100))
            else:
                tmp.append(0)
        matrix.append(tmp)
    return matrix

A = random_matrix(n)
B = random_matrix(n)
C = random_matrix(n, True)


# multiplying matrices
def multiple_matrix(A, B, C):
    for i in range(len(A)):
        for j in range(len(A[i])):
           C[i][j] = A[i][j] * B[i][j]


# Just beautiful printing matrix
def print_matrix(matrix):
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            print(matrix[i][j], ' ', end='')
        print('')
    print('-'*20)

multiple_matrix(A, B, C)
print_matrix(A)
print_matrix(B)
print_matrix(C)
