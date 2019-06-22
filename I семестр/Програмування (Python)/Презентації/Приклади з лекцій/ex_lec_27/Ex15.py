import shelve
db = shelve.open("db1")
db["obj1"] = (9, 14)
db["obj2"] = (15, 17)
db["obj3"] = "string"
d={"c":1,"k":2}
a=db.popitem(); b=db.popitem()
m=dict(db.items())
db.close()
print(a, b);print(m)
