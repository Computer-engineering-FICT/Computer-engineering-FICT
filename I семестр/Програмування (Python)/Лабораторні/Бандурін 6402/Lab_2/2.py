#
# Розрахувати надбавку до зарплати за стаж. Якщо стаж від 2
# до 5 років, то надбавка становить 2%, якщо стаж від 5 до 10
# років
# –
# 5%. Ввести з клавіатури зарплату і стаж, вивести
# надбавку і суму до виплати
from math import *
# def isfloat(value):
#     try:
#         float(value)
#         return True
#     except ValueError:
#         return False
x=input('Введіть зарплату: \n')
while 1:
    if not x.isnumeric ():
        x=float(x)
        break
    else:
        print("Ошибка! Введите число!")
        x=input('Введіть зарплату: \n')

y=input('Введіть стаж: \n')
while 1:
    if not y.isnumeric ():
        y=float(y)
        break
    else:
        print("Ошибка! Введите число!")
        y=input('Введіть стаж: \n')
z=x
n=0
a=None
if 2<=y<5:
    z=x*1.02
    n=x*0.02
    a=" (2%)"
if 5<=y<10:
    z=x*1.05
    n=x*0.05
    a=" (5%)"
print("Надбавка: ",n,a,"\nСумма до виплати: ",z)
