import functools
def func (x, y):
    print("({0}, {1})".format(x, y), end=" ")
    return x + y
arr = [1, 2, 3, 4, 5]
suma = functools.reduce(func, arr)

print('вариант1',suma)
suma = functools.reduce(func, arr, 10)

print('вариант2',suma)
suma = functools.reduce(func, [1], 10)
print('вариант3',suma)
