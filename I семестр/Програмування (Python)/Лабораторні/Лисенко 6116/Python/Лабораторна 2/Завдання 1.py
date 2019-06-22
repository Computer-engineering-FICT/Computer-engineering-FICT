from math import *
x, y, z = float(input("x = ")), float(input("y = ")), float(input("z = "))
if y > 0 and not e**(z+y)+7.2*sin(y) == 0:
    F = (4*x**3+log(y, e))/(e**(z+y)+7.2*sin(y))
    print("F = " + str(F))
else:
    print("функція невизначена")
