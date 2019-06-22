from tkinter import *
import func


def see_set_A(event):
    top = Toplevel(height=500, width=100, relief = GROOVE)
    top.title("Random create A")
    tex = Text(top,width=180, height=20,font="Verdana 12")
    tex.insert(END,func.A)
    tex.pack(fill=BOTH,expand=True)
def see_set_B(event):
    print('Set B = ' ,func.B)
def see_set_C(event):
    print('Set C = ' ,func.C)
def open_toplevel_next_step(event):

    top = Toplevel(height=500, width=100, relief = GROOVE)
    result1 = set()
    result2 = set()
    D = set()

    def step1(event):
        global result1
        result1 = func.U - func.A
        print('Step 1\n¬A = ' , result1)

    but1 = Button(top, text="Step 1\n¬A", font='arial 14')
    but1.bind("<Button-1>", step1)

    def step2(event):
        global result1
        result1 |= func.A
        print('Step 2\n¬A v A = ' , result1)

    but2 = Button(top, text="Step 2\n¬A v A", font='arial 14')
    but2.bind("<Button-1>", step2)

    def step3(event):
        global result1
        result1 &= func.A
        print('Step 3\n(¬A v A) ^ A = ' , result1)
    but3 = Button(top, text="Step 3\n(¬A v A) ^ A", font='arial 14')
    but3.bind("<Button-1>", step3)

    def step4(event):
        global result1
        result1 -= func.B
        print('Step 4\n((¬A v A) ^ A)\\B = ' , result1)

    but4 = Button(top, text="Step 4\n((¬A v A) ^ A)\\B", font='arial 14')
    but4.bind("<Button-1>", step4)

    def step5(event):
        global result1
        result1 |= func.B
        print('Step 5\n((¬A v A) ^ A)\\B v B = ' , result1)

    but5 = Button(top, text="Step 5\n((¬A v A) ^ A)\\B v B", font='arial 14')
    but5.bind("<Button-1>", step5)

    def step6(event):
        global result2
        result2 = func.C & func.B
        print('Step 6\nC ^ B = ' , result2)

    but6 = Button(top, text="Step 6\nC ^ B", font='arial 14')
    but6.bind("<Button-1>", step6)

    def step7(event):
        global result2
        result2 |= func.C
        print('Step 7\n(C ^ B) v C = ' , result2)
    but7 = Button(top, text="Step 7\n(C ^ B) v C", font='arial 14')
    but7.bind("<Button-1>", step7)

    def step8(event):
        global result2
        result2 = func.U - result2
        print('Step 8\n¬(C ^ B) v C) = ' , result2)

    but8 = Button(top, text="Step 8\n¬(C ^ B) v C)", font='arial 14')
    but8.bind("<Button-1>", step8)

    def step9(event):
        global D
        global result1
        global result2
        D = result1 & result2
        print('Step 9\nD = (((¬A v A) ^ A)\\B v B) ^ (¬(C ^ B) v C) = ' , D)

    but9 = Button(top, text="Step 9\n(((¬A v A) ^ A)\\B v B) ^ (¬(C ^ B) v C)", font='arial 14')
    but9.bind("<Button-1>", step9)

    lab1 = Label(top, text='Do with left example', font='arial 20')
    lab2 = Label(top, text='Do with right example', font='arial 20')
    lab3 = Label(top, text='Set D\n(Total with left and right example)', font='arial 20')


    lab1.grid(row=1,column=1)

    but1.grid(row=2,column=1, sticky=W+E,padx=5,pady=5)
    but2.grid(row=3,column=1, sticky=W+E,padx=5,pady=5)
    but3.grid(row=4,column=1, sticky=W+E,padx=5,pady=5)
    but4.grid(row=5,column=1, sticky=W+E,padx=5,pady=5)
    but5.grid(row=6,column=1, sticky=W+E)

    lab2.grid(row=1,column=2)

    but6.grid(row=2,column=2, sticky=W+E,padx=5,pady=5)
    but7.grid(row=3,column=2, sticky=W+E,padx=5,pady=5)
    but8.grid(row=4,column=2, sticky=W+E,padx=5,pady=5)

    lab3.grid(row=5,column=2)

    but9.grid(row=6,column=2, sticky=W+E,padx=5,pady=5)

def see_set_D(event):
    print('D =  ' , D)
def save_set_D(event):
    with open(r"Set D(don`t simplified).txt", "w") as f:
        f.write('D = ' + str(D))
