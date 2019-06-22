class One:
     to=10
class Two:
     tw=20
x=One()
y=Two()
L=[(x,"to",1),(y,"tw",2)]
for i,j,k in L:
    setattr(i,j,k)
print(x.__dict__)
print(y.__dict__)

