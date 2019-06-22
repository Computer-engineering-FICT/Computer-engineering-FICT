class Base:
     def __init__(self,n):
          self.numb = n
     def out(self):
          print (self.numb)
class One(Base):
     def multi(self,m):
          self.numb *= m
class Two(Base):
     def inlist(self):
          self.inlist = list(str(self.numb))
     def out(self):
          i = 0
          while i < len(self.inlist):
               print (self.inlist[i], end=" ")
               i += 1
obj1 = One(45)
obj1.out()
obj1.multi(2)
obj1.out()
obj2 = Two("abc")
obj2.inlist()
obj2.out()
