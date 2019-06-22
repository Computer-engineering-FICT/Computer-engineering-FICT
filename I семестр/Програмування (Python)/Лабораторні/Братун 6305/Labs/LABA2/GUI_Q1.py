#__author__ = "Andry Bratun"

from tkinter import *
import math as m

def solver(a,b,c):
    odz = a+2*c
    if odz <= 0:
        text = "Число логарифма \n має бути більшим від нуля"
    else:
        try:
            D = (7.8*a**2+3.52*b)/(m.log(a+2*c , m.e)+m.e**c)
        except:
            D = 0
        text = "Відповідь: R= %s \n" % D
    return text

def inserter(value):
    output.delete("0.0","end")
    output.insert("0.0",value)

def clear(event):
    caller = event.widget
    caller.delete("0", "end")

def handler():
    try:
        a_val = float(a.get())
        b_val = float(b.get())
        c_val = float(c.get())
        inserter(solver(a_val, b_val, c_val))
    except ValueError:
        inserter("Будь ласка введіть 3 числа")

root = Tk()
root.title("(7.8x^2 + 3.52y)/(ln(x+2z)+e^z)")
root.minsize(325,230)
root.resizable(width=False, height=False)


frame = Frame(root)
frame.grid()

a = Entry(frame, width=3)
a.grid(row=1,column=2,padx=(10,0))
a.bind("<FocusIn>", clear)
a_lab = Label(frame, text="x =").grid(row=1,column=1)

b = Entry(frame, width=3)
b.bind("<FocusIn>", clear)
b.grid(row=1,column=4)
b_lab = Label(frame, text="y =").grid(row=1, column=3)

c = Entry(frame, width=3)
c.bind("<FocusIn>", clear)
c.grid(row=1, column=6)
c_lab = Label(frame, text="z =").grid(row=1, column=5)

but = Button(frame, text="Рахуй!", command=handler).grid(row=1, column=7, padx=(10,0))

output = Text(frame, bg="lightblue", font="Arial 12", width=35, height=10)
output.grid(row=2, columnspan=8)

root.mainloop()
