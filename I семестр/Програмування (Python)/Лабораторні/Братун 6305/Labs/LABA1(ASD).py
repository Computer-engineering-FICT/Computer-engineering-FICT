import math
a = float(input("input a="))
b = float(input("input b="))
c = float(input("input c="))
if a==0:
    if b==0:
        print("x=",(-c/b))
    else:
        if c==0:
            print("infinite number of roots")
        else:
            print("no roots")
else:
    d=b*b-4*a*c
    if d >= 0:
        print("x1=",round(((-b+math.sqrt(d))/(2*a)),4),
              "x2=",round(((-b-math.sqrt(d))/(2*a)),4))
    else:

        print("Output Complex roots(REAL + IMAG)")
        print("x1=",(-b+1j*math.sqrt(abs(d))/(2*a)))
        print("x2=",(-b+(-1j)*math.sqrt(abs(d))/(2*a)))
