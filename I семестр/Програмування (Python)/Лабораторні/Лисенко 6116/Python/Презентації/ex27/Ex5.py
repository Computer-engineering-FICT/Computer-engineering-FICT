import pickle
#Збереження об'єкта методом Pickle.dump
f = open(r"file.txt", "wb")
obj = ["Рядок", (2, 3)]
pkl = pickle.Pickler(f)
pkl.dump(obj)
f.close()
