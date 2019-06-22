class FClass:
     n=10
     def total(self,N):
          self.total = int(self.n) + int(N)

class SClass:
     def total(self,s):
          self.total = len(str(s))
f = FClass()
s = SClass()
f.total(45)
s.total(45)
print (f.total) # Вивід: 55
print (s.total) # Вивід: 2
