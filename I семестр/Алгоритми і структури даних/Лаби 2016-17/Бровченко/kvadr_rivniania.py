a = float(input("Write the number: "))
b = float(input("Write the number: "))
c = float(input("Write the number: "))
if a == 0:
    if b == 0:
        if c == 0:
            print("Infinite number of roots")
        else:
            print("No roots")
    else:
        x = -c / b
        print(x)
else:
    D = b * b - 4 * a * c
    if D == 0:
        x = -b / (2 * a)
        print(x)
    elif D < 0:
        import math

        rex1 = -b / (2 * a)
        imx1 = math.sqrt(D) / (2 * a)
        rex2 = rex1
        imx2 = -imx1
        print(rex1, imx1, rex2, imx2)
    else:
        import math

        x1 = (-b + math.sqrt(D)) / (2 * a)
        x2 = (-b - math.sqrt(D)) / (2 * a)
        print("Roots: ", x1, x2)
