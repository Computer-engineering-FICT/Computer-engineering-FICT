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

for a in matrix:
    min_mat = min(a)
    indx = a.index(min_mat)
    new_elem = sum(a)/len(a)
    a.remove(min_mat)
    a.insert(indx, new_elem)
    print(a)

