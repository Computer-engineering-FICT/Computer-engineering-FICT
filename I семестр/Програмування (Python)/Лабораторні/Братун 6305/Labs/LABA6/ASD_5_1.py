import random

n = int(input("Enter size for matrix, please "))


# Generate random matrix
def random_matrix(n):
    matrix = []
    for i in range(n):
        tmp = []
        for j in range(n):
            tmp.append(random.randint(0, 100))
        matrix.append(tmp)
    return matrix

A = random_matrix(n)


# Just beautiful printing matrix
def print_matrix(matrix):
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            print(matrix[i][j], ' ', end='')
        print('')


# transposition matrix
def transposition(matrix):
    for i in range(len(matrix)):
        for j in range(i):
            tmp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = tmp
    return matrix


print_matrix(A)
transposition(A)
print('-'*10)
print_matrix(A)
