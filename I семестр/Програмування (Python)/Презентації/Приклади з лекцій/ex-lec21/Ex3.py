class MyClass:
    def __init__(self, value1, value2):#Конструктор
        self.x = value1
        self.y = value2
        print("Спрацював конструктор")
    print("Створено клас MyClass")
# Створюємо екземпляр класу
c = MyClass(100, 300)
print("Створено екземпляр класу MyClass")
print(c.x, c.y)
