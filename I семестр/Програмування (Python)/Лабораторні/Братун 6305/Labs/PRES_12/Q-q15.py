def func(elem):

    return elem + 10 # Повертаємо нове значення
arr = [1, 2, 3, 4, 5]
print(list(map(func, arr)), end=" ")
