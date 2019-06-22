import pickle
#ВВідновлення об'єкта методом load класу Unpickler
f = open(r"file.txt", "rb")
obj = pickle.Unpickler(f).load()
print(obj)
f.close()
