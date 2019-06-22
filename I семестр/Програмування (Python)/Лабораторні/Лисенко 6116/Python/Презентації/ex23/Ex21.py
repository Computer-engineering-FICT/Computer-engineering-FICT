class MyClass:
    def __init__(self):
        self.i = 20
    def __getattribute__(self, attr):
       print("Метод __getattribute__()")
       return object.__getattribute__(self, attr)  # Тільки так!!!
с = MyClass ()
print(с.i)
