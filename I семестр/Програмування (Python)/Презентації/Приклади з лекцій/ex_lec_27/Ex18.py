import shelve, Ex17
#Перевірка наявності та видалення
db = shelve.open("MyDatabase")
print("{0:<20} {1:<20}".format("Розмір бази:",len(db)))   # Кількість елементів
a="obj1" in db
print("{0:<20} {1:<20}".format("Наявність об'єкта obj1:",a))
del db["obj1"] # Видалення елемента
a="obj1" in db
print("{0:<20} {1:<20}".format("Наявність об'єкта obj1:",a))
b="obj1" not in db
print("{0:<20} {1:<20}".format("Відсутність об'єкта:",b))
db.close()

