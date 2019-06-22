import pickle
#Зчитування об'єкта з файла
f = open(r"file.txt", "rb")
obj = pickle.load(f)
print(obj)
f.close()
