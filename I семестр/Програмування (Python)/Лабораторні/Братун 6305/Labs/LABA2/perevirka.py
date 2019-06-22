s=input('Write the number')
a=0
for i in s:
    for j in (range(10)):
        if i==str(j):a+=1
if a == len(s): print("Number")
else: print("Not number")
