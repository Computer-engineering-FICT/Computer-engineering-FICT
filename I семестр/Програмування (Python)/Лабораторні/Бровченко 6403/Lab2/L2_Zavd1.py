import math
x = float(input('x = '))
y = float(input('y = '))

if (math.e**y + 2.355 * x**2) == 0:
    print('На нуль ділити не можна')
if (x-y) <= 0:
    print('Підлогарифмічний вираз повинен бути більшим за 0')
else:
    R = (math.log(x-y) + y**4) / (math.e**y + 2.355 * x**2)
    print('Результат = ', R)
