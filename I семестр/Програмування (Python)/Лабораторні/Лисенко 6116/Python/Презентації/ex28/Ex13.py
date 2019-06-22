class MyError(Exception):
    def __init__(self, value):
        self.msg = value
    def __str__(self):
        return self.msg
# Опрацювання виключення користувача
try:
   err= MyError("Oпиc виключення1")
   raise err
except MyError as arr:
    print(err) #Викликаємо метод __str__ ()
    print(err.msg) #Доступ до атрибуту класу


