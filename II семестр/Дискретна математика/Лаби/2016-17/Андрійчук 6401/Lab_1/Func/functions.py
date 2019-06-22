def Crossing(A, B):
    A = list(A)
    B = list(B)
    C =[]
    for j in range(len(A)):
        for i in range(len(B)):
            if A[j] == B[i]:
                C.append(A[j])

    return C

def Difference(A,B):
    A = list(A)
    B = list(B)
    C = []
    for i in A:
        q = 0
        for j in B:
            if i == j:
                q = 1
        if q == 0:
            C.append(i)
    return C

def Union(a, b):
    a = list(a)
    b = list(b)
    c = b.copy()
    for i in a:
        q=0
        for j in b:
            if i == j:
                q = 1
        if q == 0:
            c.append(i)
    return c

def Sym_dif(a, b):
    a = list(a)
    b = list(b)
    c = []
    for i in range(len(a)):
        if (a[i] not in b):
            c.append(a[i])
    for j in range(len(b)):
        if (b[j] not in a):
            c.append(b[j])
    return (c)

def No_set(A, U):
    """Другим аргументом передавати уныверсальну множину"""
    U = list(U)
    A = list(A)
    C = []
    for i in U:
        q = 0
        for j in A:
            if i == j:
                q = 1
        if q == 0:
            C.append(i)
    return C

