class MyClass:
    def __init__(self):
        self.i = 20
    def __getattr__(self, attr):
        print("Метод __getattr__()")
        return 0
c = MyClass()
# Атрибут i існує
print(c.i)
print(c.s)
