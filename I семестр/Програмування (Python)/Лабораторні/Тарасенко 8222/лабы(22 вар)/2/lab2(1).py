import math
x = float(input("Введите число x: "))
y = float(input("Введите число y: "))
if  x>0:
    F = float((4.351*(y**3)+2*x*math.log(x))/(math.sqrt(math.cos(2*y)+4.351)))
    print(F)
else:
    while x <= 0:
        print("X не может быть равно нулю/меньше нуля. Повторите ввод.")
        x = float(input("Введите число x: "))
        F = float((4.351*(y**3)+2*x*math.log(x))/(math.sqrt(math.cos(2*y)+4.351)))
        print(F)
