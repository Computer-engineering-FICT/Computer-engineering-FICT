import math
cubeL = float(input("Размер стороны куба(м): "))
cubeW = float(input("Масса тела кубической формы(кг): "))
sphereR = float(input("Радиус сферы(м): "))
sphereW = float(input("Масса сферы(кг): "))
cubeV = float(cubeL**3)
cubeD = float(cubeW/cubeV)
sphereV = float((4/3)*math.pi*(sphereR**3))
sphereD = float(sphereW/sphereV)
print("Плотность куба: " + str(cubeD))
print("Плотность сферы:" + str(sphereD))
if cubeD > sphereD:
    print("Плотность куба больше чем плотность сферы")
elif cubeD < sphereD:
    print("Плотность сферы больше чем плотность куба")
else:
    print("Плотность фигур одинаковая")



