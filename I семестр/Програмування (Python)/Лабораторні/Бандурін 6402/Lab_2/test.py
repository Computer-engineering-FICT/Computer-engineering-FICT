# from math import *
# from fractions import Fraction
# x=float(input('Введите x\n'))
# y=float(input('Введите y\n'))
# # print(y)
# # print(cos(y))
# # if (sin(y)==0):
# #     print(y)
#
# # def isfloat(value):
# #     value.istitle()
# while 1:
#     if x.istitle():
#        print("Ошибка! Введите число!")
#        x=float(input('Введите x\n'))
#     else:
#        break
# while 1:
#     if y.istitle():
#         print("Ошибка! Введите число!")
#         y=float(input('Введите y\n'))
#     else:
#         break
#             # y=float(input('Введите y\n'))




from math import *
from decimal import Decimal
# def isfloat(value):
#     try:
#         float(value)
#         return True
#     except ValueError:
#         return False
x=input('Введите x: \n')
while 1:
    if x.isnumeric ():
        x=float(x)
        break
    else:
        print("Ошибка! Введите число!")
        x=input('Введите x: \n')
y=input('Введите y\n')
while 1:
    if  y.isnumeric ():
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



