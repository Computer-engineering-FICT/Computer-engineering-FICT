print('Генеруємо матрицю розмірністю m x n')
m = int(input('m = '))
n = int(input('n = '))
Matrix = []
for i in range(0, m):
    Matrix.append([])
    for j in range(0, n):
        Matrix[i].append(0)

DICTIONARY = [i for i in range(1, m**2+1)]

x = 0
d = 0
for i in range(x, m):
    for j in range(x, n):
        Matrix[j][i] = DICTIONARY[d]
        d += 1
    x += 1
    n -= 1
    d += m

x = 0
d = 2*m - 2
for i in range(x, m, -1):
    for j in range(x, n, -1):
        Matrix[j][i] = DICTIONARY[d]
        d += 1
    x += 1
    n -= 1
    d += m

for k in Matrix:
    print(k)
