class Person:
    def __init__(self, name, job, pay):
        # Конструктор вимагає трьох аргументів
        self.name = name
        # Атрибути потрібно заповнити при створенні екземпляра
        self.job = job # self – це новий екземпляр класу
        self.pay = pay
petro = Person("Petrenko Petro","Python developer", 10000)
print("{0:<16}-{1:^18}-{2:>7}".format(petro.name, petro.job, petro.pay))
print(petro.__dict__)

