numvar = int(input("Write the number: "))
if numvar < 20 and numvar % 2 == 0:
        print("This is an even number")
        print("floor by 3 = ",numvar // 3)
        print("second_power = ",numvar**2)
elif numvar < 20 and numvar % 2 !=0:
        print("This is an odd number")
        print("floor by 4 = ",numvar // 4)
        print("3hd power = ",numvar**3)
else:
        print ("Your number is greater than 20")
