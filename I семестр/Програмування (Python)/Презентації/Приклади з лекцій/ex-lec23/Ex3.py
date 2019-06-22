class One:
     def __init__(self,a): self.a = a ** 2
     def __str__(self):
         return '[Піднесли до квадрата: %s]' % (self.a)
class Two:
     def __init__(self,a): self.a = a * 2
     def __str__(self):
         return '[Подвоїли: %s]' % (self.a)
a = input ("Введіть число: ")
a = int(a)
if -100 < a < 100: obj = One(a)
else:
     obj = Two(a)
print (obj)
