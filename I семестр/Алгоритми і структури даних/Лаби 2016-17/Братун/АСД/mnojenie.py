import random

N = int(input(str('Введите размерность квадратной матрицы 1 -> ')))
M = int(input(str('Введите размерность квадратной матрицы 2 -> ')))
m1 = [[random.randint(0, 10) for j in range(M)] for i in range(N)]

m2 = [[random.randint(0, 10) for k in range(M)] for m in range(N)]

print("Матрица 1")
print(m1)
print("Матрица 2")
print(m2)

def matrixmult(m1,m2):
    s = 0     # сумма
    t = []    # временная матрица
    m3 = []   # конечная матрица
    if len(m2) != len(m1[0]):
        print("Матрицы не могут быть перемножены")
    else:
        r1 = len(m1)      # количество строк в первой матрице
        c1 = len(m1[0])   # Количество столбцов в 1
        r2 = c1           # и строк во 2ой матрице
        c2 = len(m2[0])   # количество столбцов во 2ой матрице
        for z in range(0, r1):
            for j in range(0, c2):
                for i in range(0, c1):
                   s = s+m1[z][i]*m2[i][j]
                t.append(s)
                s = 0
            m3.append(t)
            t = []
    return m3

matrix3 = matrixmult(m1, m2)
print("Умноженая матрица")
print(matrix3)
