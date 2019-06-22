import pickle
#Збереження кількох об'єктів у файлі
obj1 = ["Рядок", (2, 3)]
obj2 = (1, 2)
f = open(r"file.txt", "wb")
pickle.dump(obj1, f) # Зберігаємо перший об'єкт
pickle.dump(obj2, f) # Зберігаємо другий об'єкт
f. close()
