class MyClass:
    def __setattr__(self, attr, value):
        print("Метод __setattr__()")
        self.__dict__[attr] = value  # Тільки так!!!

c = MyClass()
c.i = 10
print(c.i)

