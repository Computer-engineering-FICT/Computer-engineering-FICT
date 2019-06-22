def func(elem):
    return elem**2
arr = [1, 2, 3, 4, 5]
J= map(func, arr)
print(sum(J))
