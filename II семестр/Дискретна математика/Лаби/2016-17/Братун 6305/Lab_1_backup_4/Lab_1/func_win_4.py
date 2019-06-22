from tkinter import *
from  tkinter import messagebox
import func,My_differense
import timer2


#See set X
def see_set_X(event):
    printed = 'X = ' + str(func.A)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("See set X")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)


#See set Y
def see_set_Y(event):
    printed = 'Y = ' + str(func.C)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("See set Y")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)

Z = set()


#Step
def step(event):
    global Z
    with timer2.Profiler() as p:
        Z = My_differense.difference(func.A ,func.C)
    printed = 'Z = ' + str(Z)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("X \ Y")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)


#See set Z
def see_set_Z(event):
    printed = 'Z = ' + str(Z)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("See set Z")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)


#Save set Z
def save_set_Z(event):
    with open(r"Set Z(calc about my func).txt", "w") as f:
        f.write('Z = ' + str(Z))
        msg = messagebox.showinfo('Save set Z', 'Set Z was saved \n Time was saved')

