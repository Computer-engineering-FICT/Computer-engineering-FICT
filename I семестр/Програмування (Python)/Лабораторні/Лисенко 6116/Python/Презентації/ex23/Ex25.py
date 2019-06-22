class MyClass:
    def __init__ (self, y):
        self.x = y
    def hash (self) :
        return hash(self.x)

m = MyClass(10)
d = {}
d[m] = "Значення"
print(d[m])
