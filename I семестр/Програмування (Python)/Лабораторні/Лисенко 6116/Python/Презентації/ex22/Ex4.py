class Class1: # Базовий клас
    def func1(self):
        print("Meтoд func1() класу Class1")
    def func2 (self) :
        print("Meтoд func2() класу Class1")
class Class2(Class1):# Клас Class2 успадковує клас Class1
    def func3 (self) :
        print("Meтoд func3() класу Class2")
с = Class2 ()  # Створюємо екземпляр класу Class2
с.func1()      # Виведе: Метод func1() класу Class1
с.func2()      # Виведе: Метод func2() класу Class1
с.func3()      # Виведе: Метод func3 () класу Class2
