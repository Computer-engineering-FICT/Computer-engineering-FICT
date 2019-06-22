class Base:
     tb=10
class One(Base):
     to=20
class Two(Base):
     tt=30
x=Base()
y=One()
z=Two()
L=[(x,"tb"),(y,"to"),(z,"tt")] #Атрибути задаємо як рядки
for i,j in L:
   print(getattr(i,j), end=" ")
