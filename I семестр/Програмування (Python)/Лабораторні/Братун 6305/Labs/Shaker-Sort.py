a = [54,1,543,3,52,8,9,21,31,53,34,67,323,211,2]
k= ub = len(a)-1
lb=1
while ( lb < ub ):
        # проход сверху вниз
    for j in range(ub, lb-1, -1):
        if a[j-1] > a[j]:
            a[j-1], a[j] = a[j], a[j-1]
            k=j
        lb = k
    # проход снизу вверх
    for j in range(lb, ub+1):
        if a[j-1] > a[j]:
            a[j-1], a[j] = a[j], a[j-1]
            k=j
        ub = k
print(a)
