def res1(A, B, C, U):
    op0 = U.difference(A)
    op1 = op0.intersection(B)
    op2 = A.union(op1)
    op3 = C.intersection(B)
    op4 = C.union(op3)
    op5 = op2.symmetric_difference(op4)
    return op5


def res2(A, B, C):
    op1 = A.union(B)
    op2 = op1.symmetric_difference(C)
    return op2
