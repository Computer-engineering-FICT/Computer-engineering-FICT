import shelve #Підключаємо модуль
# Застосування методу pop() для видалення об'єкта з бази даних
db = shelve.open("MyDatabase")#Відкриваємо файл
db["obj1"] = (9, 14)
d={"c":1,"k":2}
a=db.pop("obj1")
b=db.pop("obj4",d)
db.close()
print(a, b)
