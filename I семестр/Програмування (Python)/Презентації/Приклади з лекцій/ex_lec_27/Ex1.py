import pickle
#Запис об'єкта у файл
f = open(r"file.txt", "wb")
obj = ["Рядок", (2, 3)]
pickle.dump(obj, f)
f.close()
