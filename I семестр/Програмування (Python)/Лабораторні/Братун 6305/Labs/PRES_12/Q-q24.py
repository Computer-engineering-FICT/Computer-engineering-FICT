J=zip([1, 2, 3], [4, 5, 6], [7, 8, 9])
for i in range(3):
    a=next(J)
    sum(a)
    print(a, sum(a))
