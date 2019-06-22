d = {"x": 1, "y": 2, "z": 3}
k = list(d.keys()) # Одержуємо список ключів
k. sort() # Сортуємо список ключів
for key in k:
    print("({0!s} => {1!s})".format(key, d[key]), end=" ")
