def MatrixGen():
    """Генерація матриці"""
    print('Генеруємо матрицю розмірністю m x n')
    m = int(input('m = '))
    n = int(input('n = '))
    # Matrix = []
    # for i in range(0, m):
    #     Matrix.append([])
    #     for j in range(0, n):
    #         Matrix[i].append(int(input('a[{},{}] = '.format(i, j))))
    return [[x for x in range(m)] for _ in range(n)]


def MatrixOutput(matrix):
    """Вивід матриці"""
    for i in matrix:
        print(i)


def MatrixTranspose(Matrix):
    """Транспонування матриці"""

    # Квадратна матриця
    if len(Matrix) == len(Matrix[0]):
        TMatrix = Matrix
        for i in range(0, len(TMatrix)):
            for j in range(0, len(TMatrix[0])):
                if j == i: break
                else:
                    TMatrix[i][j], TMatrix[j][i] = TMatrix[j][i], TMatrix[i][j]

    # Не квадратна матриця
    else:
        TMatrix = []
        for i in range(0, len(Matrix[0])):
            TMatrix.append([])
            for j in range(0, len(Matrix)):
                TMatrix[i].append(0)
        for i in range(0, len(TMatrix)):
            for j in range(0, len(TMatrix[0])):
                TMatrix[i][j] = Matrix[j][i]
    return TMatrix


def MatrixMultiply(Matrix1, Matrix2):
    """Множення матриць Matrix1*Matrix2"""
    if len(Matrix1[0]) != len(Matrix2):
        print('Матриці неузгоджені. Неможливо виконати множення.')
        raise SystemExit

    Matrix = list([] for i in range(0, len(Matrix1)))
    for i in range(0, len(Matrix1)):
        for j in range(0, len(Matrix2[0])):
            elem = 0
            for k in range(0, len(Matrix2)):
                elem += Matrix1[i][k]*Matrix2[k][j]
            Matrix[i].append(elem)
    return Matrix


# Генерація і транспонування
Matrix1 = MatrixGen()
print('Згенерована матриця:'); MatrixOutput(Matrix1)
T_Matrix = MatrixTranspose(Matrix1)
print('Результат транспонування:'); MatrixOutput(T_Matrix)

# На яку матрицю помножити?
option = int(input('Починаємо множення матриць\n'
                   'Зробіть свій вибір:\n'
                   '1 -> помножити матрицю саму на себе\n'
                   '2 -> помножити матрицю на транспоновану\n'
                   '3 -> помножити матрицю на нову згенеровану\n'
                   'Ваш вибір: '))
if option == 1:
    Matrix2 = Matrix1
elif option == 2:
    Matrix2 = T_Matrix
elif option == 3:
    Matrix2 = MatrixGen()
    print('Нова матриця: '); MatrixOutput(Matrix2)
else:
    print('Такого варіанту немає.')
    raise SystemExit

# Виконуємо множення
Matrix3 = MatrixMultiply(Matrix1, Matrix2)
print('Результат множення:'); MatrixOutput(Matrix3)
