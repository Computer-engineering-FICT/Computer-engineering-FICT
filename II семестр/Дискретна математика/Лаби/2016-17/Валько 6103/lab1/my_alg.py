def differ(B, C):
    X = list(B)
    Z = []
    for i in range(len(X)):
        if X[i] not in C:
            Z.append(X[i])
    return set(Z)
