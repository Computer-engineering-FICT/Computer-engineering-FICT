import sys
sys.path.append((r'F:\Dima\дискретна математика\Lab_1\Func'))
from functions import Union,Sym_dif
def short(A,B,C):
    return Sym_dif(A, Union(C, B))
