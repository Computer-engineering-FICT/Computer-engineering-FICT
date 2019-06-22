numvar = int(input("Write the number"))
firstvar, secondvar, thirdvar = 0,0,0
if numvar < 20:
        firstvar = numvar
        secondvar = numvar**2
        thirdvar = numvar**3
result = firstvar + secondvar + thirdvar
print("first_power=",numvar)
print("second_power=",secondvar)
print("third_power=",thirdvar)
print("Total=",result)
