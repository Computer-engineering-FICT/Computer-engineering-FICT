# Ввести з клавіатури два цілих числа A і B (A <B). Знайти всі
# цілі числа, які розташовані між даними числами (невключаючи самі ці числа), в порядку їх зменшення, а також
# кількість N цих чисел.
from math import *
print("Введите числа А<В:")
# def isfloat(value):
#     try:
#         float(value)
#         return True
#     except ValueError:
#         return False

while 1:
    a=input('Введите a: \n')
    while 1:

        if not a.isnumeric ():
            a=float(a)
            break
        else:
            print("Ошибка! Введите число!")
            a=input('Введите a: \n')

    b=input('Введите b\n')
    while 1:

        if not b.isnumeric ():
             b=float(b)
             break
        else:
             print("Ошибка! Введите число!")
             b=input('Введите b: \n')

    if a < b:
        i=b-1
        a_r=floor(a)+1
        b_r=ceil(b)-1
        n=0
        for i in (range(b_r,a_r-1,-1)):
            print(i)
            n+=1
        print('Кол-во чиcел: ',n)
        break

    else: print("Ошибка! Введите числа А<В:")
