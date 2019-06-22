import shelve #Підключаємо модуль
# Застосування методу setdefault для запису в базу даних
db = shelve.open("MyDatabase")#Відкриваємо файл
db["obj1"] = (9, 14)
d={"c":1,"k":2}
a=db.setdefault("obj1")
b=db.setdefault("obj4",d)
db.close()
print(a, b)
