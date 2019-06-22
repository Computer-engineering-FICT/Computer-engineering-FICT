from tkinter import *
import func

def open_toplevel_next_step(event):

    top = Toplevel(height=500, width=100, relief = GROOVE)

    result = set()
    D = set()

    def step1(event):
        global D
        D = func.A | func.B
        print('Step 1\nA v B = ' , D)

    but1 = Button(top, text="Step 1\nA v B", font='arial 14')
    but1.bind("<Button-1>", step1)

    def step2(event):
        global result
        result = func.U - func.C
        print('Step 2\n¬C = ' , result)

    but2 = Button(top, text="Step 2\n¬C", font='arial 14')
    but2.bind("<Button-1>", step2)

    def step3(event):
        global result
        global D
        D &= result
        print('Step 3\n(A v B) ^ ¬C = ' , D)
    but3 = Button(top, text="Step 3\n(A v B) ^ ¬C ", font='arial 14')
    but3.bind("<Button-1>", step3)

    lab1 = Label(top, text='Do with easy example', font='arial 20')


    lab1.grid(row=1,column=1)

    but1.grid(row=2,column=1, sticky=W+E,padx=5,pady=5)
    but2.grid(row=3,column=1, sticky=W+E,padx=5,pady=5)
    but3.grid(row=4,column=1, sticky=W+E,padx=5,pady=5)


def see_set_D(event):
    print('D =  ' , D)

def save_set_D(event):
    with open(r"Set D(simplified).txt", "w") as f:
        f.write('D = ' + str(D))
