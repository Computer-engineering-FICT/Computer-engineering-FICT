#Згенерувати матрицю Amn розмірністю m n × з випадкових
#елементів, що є цілими числами. Побудувати список,
#елементами якого є середнє арифметичне рядків матриці Amn

import numpy as np

print('Генеруємо матрицю А розмірністю m x n')
m = int(input('m = '))
n = int(input('n = '))

print('Діапазон чисел для матриці')
MIN = int(input('min = '))
MAX = int(input('max = '))

A = np.random.randint(MIN, MAX, (m, n))
print('Отримана матриця:\n', A)

midA = list()
for i in range(len(A)):
    midA.append(str(round(sum(A[i])/len(A[i]), 3)))
print('Середнє арифметичне рядків матриці -> {}'.format(midA))
