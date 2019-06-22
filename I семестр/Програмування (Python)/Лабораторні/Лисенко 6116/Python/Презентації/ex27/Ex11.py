import shelve          #Підключаємо модуль
#Застосування методу get() для считування з бази даних
db = shelve.open("MyDatabase")#Відкриваємо файл
db["obj1"] = [1, 2, 3, 4, 5]
db["obj2"] = (6, 7, 8, 9, 10)
db["obj3"] = "Рядок"
a=db.get("obj3")
print(a)
db.close()
