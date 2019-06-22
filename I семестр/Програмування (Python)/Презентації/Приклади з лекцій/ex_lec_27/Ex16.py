import shelve
# Видаляємо всі елементи
db = shelve.open("MyDatabase")
db["obj1"] = (9, 14)
db["obj2"] = (15, 17)
db["obj3"] = "string"
d={"c":1,"k":2}
db.clear()
m=dict(db.items())
db.close()
print(m)
