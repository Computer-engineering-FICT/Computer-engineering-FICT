class Person:
    def __init__(self, name, job=None, pay=0):
        self.name = name
        self.job = job
        self.pay = pay
    def lastName(self): # Метод виводу прізвища
        return self.name.split()[-1]
    def giveRaise(self, percent):
                     self.pay = int(self.pay+ (self.pay/100)*percent)
    def __str__(self): # Added method
        return '[Person: %s, %s]' % (self.name, self.pay)
petro = Person("Petro Petrenko","Python developer", 10000)
ivan = Person("Ivan Ivanov")
petro.giveRaise(10)
print(petro)
print(ivan)
