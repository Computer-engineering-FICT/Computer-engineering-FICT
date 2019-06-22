#__author__ = "Andry Bratun"

from tkinter import *
import random

def solver(a,b):
    """ Solves quadratic equation and returns the result in formatted string """
    a = int(input("Введіть кількість рядків  "))
    b = int(input("Введіть кількість стовбців  "))
    A = []


    for i in range(0, a):
        A.append([random.randint(0, 20) for i in range(0, b)])

        schetchik = 0
        for i in A:
            for j in i:
                if schetchik == b-1:
                    schetchik = 0
                    print('{0: <4}'.format(str(j)))
                else:
                    print('{0: <4}'.format(str(j)), end=' ')
                    schetchik = schetchik + 1


        for i in A:
           if A.index(i) % 2 == 0:
               A[A.index(i)] = sorted(A[A.index(i)])
        else:
            A[A.index(i)] = sorted(A[A.index(i)], reverse=True)

            schetchik = 0
            for i in A:
                for j in i:
                    if schetchik == b-1:
                        schetchik = 0
                        print('{0: <4}'.format(str(j)))
                    else:
                        print('{0: <4}'.format(str(j)), end=' ')
                        schetchik = schetchik + 1
    return A


def inserter(value):
    """ Inserts specified value into text widget """
    output.delete("0.0","end")
    output.insert("0.0",value)

def clear(event):
    """ Clears entry form """
    caller = event.widget
    caller.delete("0", "end")

def handler():
    """ Get the content of entries and passes result to the text """
    try:
        # make sure that we entered correct values
        a_val = int(a.get())
        b_val = int(b.get())
        inserter(solver(a_val, b_val,))
    except (ValueError, TypeError):
        inserter("Будь ласка введіть числа")

root = Tk()
root.title("Matrix")
root.minsize(850,680)
root.resizable(width=False, height=False)


frame = Frame(root)
frame.grid()

a = Entry(frame, width=3)
a.grid(row=1,column=2,padx=(10,0))
a.bind("<FocusIn>", clear)
a_lab = Label(frame, text="Кількість рядків").grid(row=1,column=1)

b = Entry(frame, width=3)
b.bind("<FocusIn>", clear)
b.grid(row=1,column=4)
b_lab = Label(frame, text="Кількість стовбців").grid(row=1, column=3)

but = Button(frame, text="Генеруй!", command=handler).grid(row=1, column=7, padx=(10,0))

output = Text(frame, bg="chocolate", font="Arial 12", width=120, height=40)
output.grid(row=2, columnspan=8)

root.mainloop()

