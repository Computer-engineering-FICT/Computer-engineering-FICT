r=int(input("Enter the dimension\n"))
data=[]
b=float(input("Enter b0\n"))
data.append(b)
for i in range(r):
    a=float(input("Enter a"+str(i+1)+"\n"))
    b=float(input("Enter b"+str(i+1)+"\n"))
    data.append(a)
    data.append(b)
print(data)
# data.reverse()
rez=0
def f(a,b,c):
    return c+a/b
x=f(data[-2],data[-1],data[-3])
print(x)
q=3
for i in range(1,r):

    x=f(data[-q-1],x,data[-q-2])
    q += 2
    # print(x)
print(x)
