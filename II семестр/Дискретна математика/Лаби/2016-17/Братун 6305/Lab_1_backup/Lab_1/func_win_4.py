import func
from tkinter import *
from  tkinter import messagebox
import My_differense


def see_set_X(event):
    printed = 'X = ' + str(func.A)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("See set X")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)


def see_set_Y(event):
    printed = 'Y = ' + str(func.C)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("See set Y")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)



Z = set()

def step(event):
    global Z
    Z = My_differense.difference(func.A ,func.C)
    printed = 'Z = ' + str(Z)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("X \ Y")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)



def see_set_Z(event):
    printed = 'Z = ' + str(Z)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("See set Z")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)


def save_set_Z(event):
    with open(r"Set Z(calc about my func).txt", "w") as f:
        f.write('Z = ' + str(Z))
        msg = messagebox.showinfo('Save set Z', 'Set Z was saved')

