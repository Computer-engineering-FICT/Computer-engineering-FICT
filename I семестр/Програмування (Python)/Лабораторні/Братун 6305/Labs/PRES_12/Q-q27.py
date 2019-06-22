a=[1,2,3,4]
b=[5,6]
c=[9,10,11]
J = zip(a,b,c)
z=min(len(a),len(b),len(c))
for i in range(z):
    y=next(J)
    print(y)
