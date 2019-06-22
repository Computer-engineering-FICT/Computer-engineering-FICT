import shelve #Підключаємо модуль
#Застосування ітераторів словника при роботі з базою даних
db = shelve.open("MyDatabase")
print(db.keys())
print(db.values())
print(db.items())
print("----------------------")
a = list(db.keys()), list(db.values())
print(a)
b = list(db.items())
print(b)
print("----------------------")
db.close()
