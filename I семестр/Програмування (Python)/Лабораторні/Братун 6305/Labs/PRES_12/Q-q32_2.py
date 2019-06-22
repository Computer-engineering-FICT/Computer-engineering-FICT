#Варіант використанням list
def func(elem):
    return elem >= 0
arr = [-1, 2, -3, 4, 0, -20, 10]
arr = list(filter(func, arr))
print(arr)
                                                                                                            #[2, 4, 0, 10}

