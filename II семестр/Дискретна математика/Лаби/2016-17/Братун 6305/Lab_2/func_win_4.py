from tkinter import *
from tkinter import messagebox
import random
import copy
import window3


with open(r"Relation R.txt", "r", encoding="UTF-8") as f:
            relation_R = f.read()
with open(r"Relation S.txt", "r", encoding="UTF-8") as f:
            relation_S = f.read()

f1 = open(r"Set A.txt", "r", encoding="UTF-8")
set_A = f1.read().split(" ")
f2 = open(r"Set B.txt", "r", encoding="UTF-8")
set_B = f2.read().split(" ")
def R_plus_S():
    all1 = []
    for i in set_A[:-1]:
        for j in set_B[:-1]:
            p = i,j
            all1.append(p)

    score = []
    for i in all1:
        if i in window3.relation_S_plus_R:score.append(1)
        else:score.append(0)

    r1 = len(set_A[:-1])
    c1 = len(set_B[:-1])
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("R ∪ S")
    calc = 0
    lab3 = Label(top, text="R ∪ S", font='arial 14')
    lab3.grid(row=0, column=0)
    z = 1
    f = 1
    for m in list(set_A[:-1]):
        lb = Label(top, text=m, font='arial 14')
        lb.grid(row=z, column=0)
        z += 1
    for n in list(set_B[:-1]):
        lb = Label(top, text=n, font='arial 14')
        lb.grid(row=0, column=f)
        f += 1
    for r in range(r1):
        for c in range(c1):
            lb = Label(top, text=score[calc], font='arial 14')
            lb.grid(row=r+1, column=c+1)
            calc += 1

def R_on_S():
    all1 = []
    for i in set_A[:-1]:
        for j in set_B[:-1]:
            p = i,j
            all1.append(p)

    score = []
    for i in all1:
        if i in window3.relation_S_on_R:score.append(1)
        else:score.append(0)

    r1 = len(set_A[:-1])
    c1 = len(set_B[:-1])
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("R ∩ S")
    calc = 0
    lab3 = Label(top, text="R ∩ S", font='arial 14')
    lab3.grid(row=0, column=0)
    z = 1
    f = 1
    for m in list(set_A[:-1]):
        lb = Label(top, text=m, font='arial 14')
        lb.grid(row=z, column=0)
        z += 1
    for n in list(set_B[:-1]):
        lb = Label(top, text=n, font='arial 14')
        lb.grid(row=0, column=f)
        f += 1
    for r in range(r1):
        for c in range(c1):
            lb = Label(top, text=score[calc], font='arial 14')
            lb.grid(row=r+1, column=c+1)
            calc += 1

def R_diff_S():
    all1 = []
    for i in set_A[:-1]:
        for j in set_B[:-1]:
            p = i,j
            all1.append(p)

    score = []
    for i in all1:
        if i in window3.relation_R_diff_S:score.append(1)
        else:score.append(0)

    r1 = len(set_A[:-1])
    c1 = len(set_B[:-1])
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("R \ S")
    calc = 0
    lab3 = Label(top, text="R \ S", font='arial 14')
    lab3.grid(row=0, column=0)
    z = 1
    f = 1
    for m in list(set_A[:-1]):
        lb = Label(top, text=m, font='arial 14')
        lb.grid(row=z, column=0)
        z += 1
    for n in list(set_B[:-1]):
        lb = Label(top, text=n, font='arial 14')
        lb.grid(row=0, column=f)
        f += 1
    for r in range(r1):
        for c in range(c1):
            lb = Label(top, text=score[calc], font='arial 14')
            lb.grid(row=r+1, column=c+1)
            calc += 1

def U_diff_R():
    all1 = []
    for i in set_A[:-1]:
        for j in set_B[:-1]:
            p = i,j
            all1.append(p)

    score = []
    for i in all1:
        if i in window3.relation_U_diff_R:score.append(1)
        else:score.append(0)

    r1 = len(set_A[:-1])
    c1 = len(set_B[:-1])
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("U \ R")
    calc = 0
    lab3 = Label(top, text="U \ R", font='arial 14')
    lab3.grid(row=0, column=0)
    z = 1
    f = 1
    for m in list(set_A[:-1]):
        lb = Label(top, text=m, font='arial 14')
        lb.grid(row=z, column=0)
        z += 1
    for n in list(set_B[:-1]):
        lb = Label(top, text=n, font='arial 14')
        lb.grid(row=0, column=f)
        f += 1
    for r in range(r1):
        for c in range(c1):
            lb = Label(top, text=score[calc], font='arial 14')
            lb.grid(row=r+1, column=c+1)
            calc += 1


def S_tra():
    all1 = []
    for i in set_A[:-1]:
        for j in set_B[:-1]:
            p = i,j
            all1.append(p)

    score = []
    for i in all1:
        if i in window3.s_tra:score.append(1)
        else:score.append(0)

    r1 = len(set_A[:-1])
    c1 = len(set_B[:-1])
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("s^(-1)")
    calc = 0
    lab3 = Label(top, text="s^(-1)", font='arial 14')
    lab3.grid(row=0, column=0)
    z = 1
    f = 1
    for m in list(set_A[:-1]):
        lb = Label(top, text=m, font='arial 14')
        lb.grid(row=0, column=z)
        z += 1
    for n in list(set_B[:-1]):
        lb = Label(top, text=n, font='arial 14')
        lb.grid(row=f, column=0)
        f += 1
    for r in range(r1):
        for c in range(c1):
            lb = Label(top, text=score[calc], font='arial 14')
            lb.grid(row=c+1, column=r+1)
            calc += 1
