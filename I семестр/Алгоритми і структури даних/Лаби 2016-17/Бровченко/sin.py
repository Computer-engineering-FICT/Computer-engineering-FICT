from math import pi
i = int(input('Зробіть вибір:\nрадiани - 0\nградуси - 1\n'))
x = float(input('Введіть величину кута -> '))
e = float(input('Максмальне значення похибки -> '))
if i == 1:
    x = (x/180)*pi
z = abs(x)
while z >= 2*pi:
    z -= 2*pi
while z <= 2*pi:
    z += 2*pi
k = z
res = z
l = 3
while abs(k) > e:
    k = -(k*z*z)/(l*(l-1))
    res += k
    l += 2
print("Sin =", round(res, 8))
