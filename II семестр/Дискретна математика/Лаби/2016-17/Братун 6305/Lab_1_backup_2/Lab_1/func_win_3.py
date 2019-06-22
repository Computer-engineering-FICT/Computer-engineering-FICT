from tkinter import *
import func
from tkinter import messagebox


#Open toplevel to do next step
def open_toplevel_next_step(event):

    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.maxsize(width=270,height=250)
    top.minsize(width=270,height=250)
    top.title("Single-step execution expression")
    result = set()
    D = set()

    #Step 1
    def step1(event):
        global D
        D = func.A | func.B
        printed = 'A v B = ' + str(D)
        top = Toplevel(height=500, width=100, relief = GROOVE)
        top.title("Step 1\n A v B")
        tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
        tex.insert(END,printed)
        tex.pack(fill=BOTH,expand=True)

    but1 = Button(top, text="Step 1\nA v B", font='arial 14')
    but1.bind("<Button-1>", step1)


    #Step 2
    def step2(event):
        global result
        result = func.U - func.C
        printed = '¬C = ' + str(result)
        top = Toplevel(height=500, width=100, relief = GROOVE)
        top.title("Step 2\n ¬C")
        tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
        tex.insert(END,printed)
        tex.pack(fill=BOTH,expand=True)

    but2 = Button(top, text="Step 2\n¬C", font='arial 14')
    but2.bind("<Button-1>", step2)


    #Step 3
    def step3(event):
        global result
        global D
        D &= result
        printed = 'D = ' + str(D)
        top = Toplevel(height=500, width=100, relief = GROOVE)
        top.title("Step 3\n (A v B) ^ ¬C")
        tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
        tex.insert(END,printed)
        tex.pack(fill=BOTH,expand=True)

    but3 = Button(top, text="Step 3\n(A v B) ^ ¬C ", font='arial 14')
    but3.bind("<Button-1>", step3)

    lab1 = Label(top, text='Do with easy example', font='arial 20')


    #Packed labels
    lab1.grid(row=1,column=1)


    #Packed buttons
    but1.grid(row=2,column=1, sticky=W+E,padx=5,pady=5)
    but2.grid(row=3,column=1, sticky=W+E,padx=5,pady=5)
    but3.grid(row=4,column=1, sticky=W+E,padx=5,pady=5)


#See set D
def see_set_D(event):
    printed = 'D = ' + str(D)
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("See set D")
    tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
    tex.insert(END,printed)
    tex.pack(fill=BOTH,expand=True)


#Save set D
def save_set_D(event):
    with open(r"Set D(simplified).txt", "w") as f:
        f.write('D = ' + str(D))
        msg = messagebox.showinfo('Save set D', 'Set D was saved')
