class MyClass:
    def __init__(self, m):
        self.msg = m
    def __repr__(self):
        return "Метод  __repr__()  {0}".format(self.msg)
    def __str__ (self):
        return "Метод __str__() {0}".format(self.msg)
c = MyClass("Значення")
print(repr(c))
print(str(c))
print(c)
