from math import*
x = float(input('Input x = '))
E = 84
while x < 0:
    x += 6.28318
while x > 6.2831:
    x -= 6.28318
n = 1.0
l = 0
a = x
for i in range(0, E):
    a = ((-1)**int(n))*(x**(2*int(n) + 1))/factorial(2*int(n) + 1)
    l += a
    n += 1
c = l + x
d = sin(x)
print(c)
print(d)
