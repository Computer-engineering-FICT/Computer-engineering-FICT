import math
xa = float(input('Координата х точки А = '))
ya = float(input('Координата y точки А = '))
xb = float(input('Координата х точки B = '))
yb = float(input('Координата y точки B = '))

OA = math.sqrt(xa**2 + ya**2)
OB = math.sqrt(xb**2 + yb**2)

if OA > OB:
    print('OA > OB')
elif OA < OB:
    print('OA < OB')
else:
    print('OA = OB')
