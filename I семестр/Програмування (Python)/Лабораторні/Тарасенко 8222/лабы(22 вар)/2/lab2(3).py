import math
x = float(input("Введите число: "))
if 0 < x <3.14 :
    r = math.sin(x)
elif -3.14 <= x <0 :
    r = x**3
elif x < -2*3.14:
    r = x**2
elif x > 2*3.14:
    r = 0
else:
    r = 0
print("r = " + str(r))

