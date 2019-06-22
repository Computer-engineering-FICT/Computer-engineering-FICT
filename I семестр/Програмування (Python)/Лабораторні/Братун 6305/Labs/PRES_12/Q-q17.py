def func(elem):
    return elem - 10
arr = [1, 2,2, 2, 2, 2, 2, 2, 3, 4, 5]
print(set(map(func, arr)), end=" ")
