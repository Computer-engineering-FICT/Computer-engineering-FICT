def notX(X,U):
    nX = set(U)
    for elem in X:
        if elem in nX:
            nX.remove(elem)
    return nX


def vyraz(A,B,C,U):
    return set(((A & notX(B, U)) | (B & notX(A, U))) & (C | B) & C)
