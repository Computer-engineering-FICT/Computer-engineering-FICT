import pickle
#Перетворення об'єкта в послідовність байтів
obj1 = [1, 2, 3, 4, 5]  # Список
obj2 = (6, 7, 8, 9, 10) # Кортеж
bin_obj1 = pickle.dumps(obj1)
print(bin_obj1)
bin_obj2 = pickle.dumps(obj2)
print(bin_obj2)

