class Base:
     def __init__(self,N):
          self.numb = N
     def out(self):
          self.numb /= 2
          print (self.numb, end=" ")

class Subclass(Base):
     def out(self):
          print ("\n----")
          Base.out(self)
          print ("\n----")

i = 0
while i < 10:
     if 4 < i < 7:
          obj = Subclass(i)
     else:
          obj = Base(i)
     i += 1
     obj.out()

