class MyClass:
    x = 10  # Атрибут класу
c1 = MyClass() # Створюємо екземпляр класу
c2 = MyClass() # Створюємо екземпляр класу
print(c1.x, c2.x) # 10 10
c1.y = 88 # Змінюємо атрибут класу
print(c1.x, c1.y) # 88 88
c2.z = 100
print(c2.x, c2.z)  # 20 20

