class Person:
    Inner= True
    def __init__(self, name, job = None, pay = 0):
        # Конструктор не вимагає трьох аргументів
        self.name = name
        self.job = job
        self.pay = pay

m= Person("Michael","programmer", 100)
print(Person.__class__)
print(Person.__dict__)
print(m.__class__.__dict__)

