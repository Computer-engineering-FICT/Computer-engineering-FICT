#My function
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
