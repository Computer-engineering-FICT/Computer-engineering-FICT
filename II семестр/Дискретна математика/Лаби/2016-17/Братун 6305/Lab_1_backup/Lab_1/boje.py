k = {1,2,3,4,5,6,7,8,9,10}
s = {}
def difference(a, b):
    res = []
    for i in a:
        d = True
        for j in b:
            if i == j:
                d = False
                break
        if d:
            res.append(i)
    return set(res)
d = difference(k,s)
print(d)
