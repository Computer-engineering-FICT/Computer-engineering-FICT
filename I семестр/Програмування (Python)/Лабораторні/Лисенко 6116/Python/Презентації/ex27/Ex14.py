import shelve #Підключаємо модуль
db = shelve.open("MyDatabase")#Відкр. файл
db["obj1"] = (9, 14)
db["obj2"] = (15, 17)
db["obj3"] = "string"
d={"c":1,"k":2}
a=db.pop("obj1")
b=db.pop("obj4",d)
m=list(db.items())
db.close()
print(a, b)
print(m)
