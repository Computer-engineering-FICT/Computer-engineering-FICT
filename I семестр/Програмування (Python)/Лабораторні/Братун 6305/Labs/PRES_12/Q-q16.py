def func(elem):
    return elem * 10
arr = [1, 2, 3, 4, 5]
print(tuple(map(func, arr)), end=" ")
