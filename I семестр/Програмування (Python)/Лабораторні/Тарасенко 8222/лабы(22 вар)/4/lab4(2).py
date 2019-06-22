import random
a = int(input("Сгенерировать последовательность чисел от: " ))
b = int(input("до: "))
m = int(input("Размерность матрицы: строчки: "))
n = int(input("Столбцы: "))
matrix = []
for i in range(m):
    arr = [random.randint(a, b) for i in range(n)]
    matrix.append(arr)
print(matrix)
print()
for i in matrix:
    min_mat = min(i)
    indx = i.index(min_mat)
    max_mat = max(i)
    i.remove(min_mat)
    i.insert(indx, max_mat)
    print(i)

