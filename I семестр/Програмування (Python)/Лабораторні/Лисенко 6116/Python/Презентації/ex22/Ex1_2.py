class Person:
    def __init__(self, name, job=None, pay=0):
        self.name = name
        self.job = job
        self.pay = pay
    def lastName(self): # Метод виводу прізвища
        return self.name.split()[-1]
        # Повертає останнє слово рядка
    def giveRaise(self, percent):
        self.pay = int(self.pay + (self.pay/100)*percent)

petro = Person("Petro Petrenko","Python developer", 10000)
ivan = Person("Ivan Ivanov")
print(petro.lastName(), ivan.lastName())
# Використали новий метод lastName()
petro.giveRaise(10)
print(petro.name, petro.pay)
print(ivan.name, ivan.pay)
