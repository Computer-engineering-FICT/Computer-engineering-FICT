def spr_vyraz(A,B,C):
    return set(A.symmetric_difference(B) & C)
