a = input("Ведіть число")
c = a.split(".")
print(c)
if len(c)==2:
    if c[0].isdecimal() and c[1].isdecimal():
        result = float(a)
        print("float:", result)
    else: print("str:", a)
elif len(c)==1:
    if c[0].isdecimal():
        result = int(a)
        print("int:", result)
    else: print("str:", a)
