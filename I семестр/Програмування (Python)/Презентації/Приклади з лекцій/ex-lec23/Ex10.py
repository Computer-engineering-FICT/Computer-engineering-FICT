class One():
  def __init__(self,a,b):
         self.t3 = a
         self.t4 = b
x=One(20,50)
print("Атрибути до видалення",x.__dict__)
delattr(x,"t3")
print("Атрибути після видалення",x.__dict__)
