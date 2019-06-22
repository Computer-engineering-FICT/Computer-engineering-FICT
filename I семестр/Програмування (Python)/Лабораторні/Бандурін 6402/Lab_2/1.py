from math import *
from decimal import Decimal
def isfloat(value):
    try:
        float(value)
        return True
    except ValueError:
        return False
x=input('Введите x: \n')
while 1:
    if isfloat(x):
      x=float(x)
      break
    else:
        print("Ошибка! Введите число!")
        x=input('Введите x: \n')
y=input('Введите y\n')
while 1:
    if isfloat(y):
      y=float(y)
      break
    else:
       print("Ошибка! Введите число!")
       y=input('Введите y: \n')

while 1:
    if cos(2*y)==0 :
        y=input('Ошибка! Введите другое значение y\n')
    else:
        break

R=Decimal(log(x,e)+(3.5*x+1)/cos(2*y))
print("Результат: ",R)



