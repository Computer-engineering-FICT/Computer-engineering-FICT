import shelve
#Застосування методу update() у різних варіантах
def dbupd():
    db = shelve.open("MyDatabase")
    db.update(obj1=(9, 14),obj2=(15, 17))
    db.update({"obj3":4})
    db.update([("obj4",4),("obj5",5)])
    db.update([["obj7",7],["obj6",6]])
    m=dict(db.items())
    print(m)
    db.close()
dbupd()
