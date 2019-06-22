x = float(input("Enter base: "))
y = int(input("Enter degree for base: "))
if x==0:
    if y<=0:
        print("No answer")
    else:
        print("result: 0")
else:
    if y==0:
        print("result: 1")
    else:
        s=1
        if y>0:
            for i in range(0,y):
                s*=x
            print(round(s,4))
        else:
            for i in range(0,y,-1):
                s*=1/x
            print(s)
