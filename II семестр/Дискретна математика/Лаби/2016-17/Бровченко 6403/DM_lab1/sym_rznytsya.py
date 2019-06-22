def sym_rizn(x, y):
    z = x.union(y)
    for elem in x:
        if elem in y:
            z.remove(elem)
    return z
