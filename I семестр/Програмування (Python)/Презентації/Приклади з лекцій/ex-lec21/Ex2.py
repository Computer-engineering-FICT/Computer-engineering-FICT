class MyClass:
    x=11
    def out_x(self):# self-це посилання на екземпляр класу
        print("Attribute x =",self.x)
c = MyClass () # Створення екземпляра класу
               # Викликаємо метод- out_х()
c.out_x()  # self не вказують при виклику методу
print(c.__class__)
print("Stright print x =",c.x)
print(type(MyClass))

