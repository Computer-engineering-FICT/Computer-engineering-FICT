import func
from tkinter import *
from tkinter import messagebox


Z = set()
#See set D(dont simplified) into file
def see_dont_simplified_D(event):
    try:
        with open(r"Set D(don`t simplified).txt", "r") as f:
            p = f.read()
            top = Toplevel(height=500, width=100, relief = GROOVE)
            top.title("See set D(don`t simplified) into file")
            tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
            tex.insert(END,p)
            tex.pack(fill=BOTH,expand=True)
    except:
        msg = messagebox.showinfo('Error', 'File not found')


#See set D(simplified) into file
def see_simplified_D(event):
    try:
        with open(r"Set D(simplified).txt", "r") as f:
            p = f.read()
            top = Toplevel(height=500, width=100, relief = GROOVE)
            top.title("See set D(simplified) into file")
            tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
            tex.insert(END,p)
            tex.pack(fill=BOTH,expand=True)
    except:
        msg = messagebox.showinfo('Error', 'File not found')


#See set Z cacl about my func
def see_calc_about_my_func_C(event):
    try:
        with open(r"Set Z(calc about my func).txt", "r") as f:
            p = f.read()
            top = Toplevel(height=500, width=100, relief = GROOVE)
            top.title("See set Z(calc about my func) into file")
            tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
            tex.insert(END,p)
            tex.pack(fill=BOTH,expand=True)
    except:
        msg = messagebox.showinfo('Error', 'File not found')

#Step(Difference about Python func)
def step(event):
    global Z
    Z = func.A - func.C
    printed = 'Z = ' + str(Z)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("Calculated and see set Z about Python func")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)
    with open(r"Set Z(calc about Python func).txt", "w") as f:
        f.write('Z = ' + str(Z))
        msg = messagebox.showinfo('Save set Z', 'Set Z was saved')


#comparison sets D
def comparison_D_sets(event):
    try:
        f1 = open(r"Set D(don`t simplified).txt", "r")
        p1 = f1.read()
        f2 = open(r"Set D(simplified).txt", "r")
        p2 = f2.read()
        if p1 == p2:
            msg = messagebox.showinfo('Comparison D sets', 'Sets identical')
        else:
            msg = messagebox.showinfo('Comparison D sets', 'Sets unidentical')
    except:
        msg = messagebox.showinfo('Error', 'Files not found')


#comparison sets Z
def comparison_Z_sets(event):
    try:
        f1 = open(r"Set Z(calc about my func).txt", "r")
        p1 = f1.read()
        f2 = open(r"Set Z(calc about Python func).txt", "r")
        p2 = f2.read()
        if p1 == p2:
            msg = messagebox.showinfo('Comparison Z sets', 'Sets identical')
        else:
            msg = messagebox.showinfo('Comparison Z sets', 'Sets unidentical')
    except:
        msg = messagebox.showinfo('Error', 'File not found')


