import sys
sys.path.append((r'F:\Dima\дискретна математика\Lab_1\Func'))
from functions import *
def long(A,B,C):
    return Sym_dif(Union(Crossing(A, B), Difference(A, B)), Union(C, B))
