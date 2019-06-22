from math import sqrt
x, y = float(input("x = ")), float(input("y = "))
r = float(input("радіус першого кола: r = "))
R = float(input("радіус другого кола: R = "))
if r > 0 and R > 0 and not r == R:
    length = sqrt(x**2+y**2)
    if r < length < R or R < length < r:
        print("Точка A("+str(x)+","+str(y)+") лежить усередині тора")
    else:
        print("Точка A("+str(x)+","+str(y)+") не лежить усередині тора")
else:
    print("радіуси повинні бути більше 0 та бути різними")
