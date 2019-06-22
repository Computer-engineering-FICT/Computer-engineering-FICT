from fractions import Fraction
from math import *
p=Fraction(1,2)+Fraction(1,4)
c=float(p)
l=trunc(p)
m=modf(p)
print("c = ",c)
print("l = ",l)
print("m = ",m)
print(p)
