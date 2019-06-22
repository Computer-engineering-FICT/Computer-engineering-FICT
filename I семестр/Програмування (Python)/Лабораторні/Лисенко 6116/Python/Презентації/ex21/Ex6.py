class Car:
    wheels=4
    engine=1

my=Car()
my.seats='Leather'
print("Атрибут екземпляру:", my.seats)
print("Атрибут класу:", my.wheels)
print(my.__dict__)
print(my.__class__.__dict__)
