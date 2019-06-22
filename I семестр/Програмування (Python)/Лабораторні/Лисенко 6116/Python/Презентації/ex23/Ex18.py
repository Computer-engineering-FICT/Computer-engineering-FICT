class MyClass:
    def __init__(self, m):
        self.msg = m
    def __call__(self):
        print(self.msg)
        return "Повертаємо "+self.msg
x = MyClass("Повідомлення об'єкта x")
# Створення екземпляра класу
y = MyClass("повідомлення y")
# Створення екземпляра класу
x()
b=y()
print(b)
