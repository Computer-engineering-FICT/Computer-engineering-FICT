import pickle
# Завантаження об'єкта, який збережений функцією dump
f = open(r"file.txt", "rb")
# Відновлюємо перший об'єкт
obj1 = pickle.load(f)
# Відновлюємо другий об'єкт
obj2 = pickle.load(f)
print( obj1, obj2)
f.close()

