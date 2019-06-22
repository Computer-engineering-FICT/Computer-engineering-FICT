""" Считывает х и y. Выводит R уравения: R = (math.log1p(x-y)+y**4)/((math.exp(y))+2.355*x**2) """

import math

print('Введите x и y:')
x = int(input('x = '))
y = int(input('y = '))

if x >= y:
    R = (math.log1p(x-y)+y**4)/((math.exp(y))+2.355*x**2)
    print("Результат = ", R)
elif x < y:
    print('Ошибка')
