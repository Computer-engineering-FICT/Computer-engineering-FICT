def func(elem):
    return elem >= 0
arr = [-1, 2, -3, 4, 0, -20, 10]
J=filter(func,arr)
while True:
    try:
        a=next(J)
        print(a)
    except: StopIteration

