#__author__ = "Andry Bratun"

from tkinter import *

def solver(a,b,c):
    """ Solves quadratic equation and returns the result in formatted string """
    if a >= 0:
        aq = a*a
        text = "Квадрат першого числа: %.2f \n" % (aq)
    else:
        text = "Від'ємне число: %2.f \n" % a
    if b >= 0:
        bq = b*b
        text2 = "Квадрат другого числа: %.2f \n" % (bq)
    else:
        text2 = "Від'ємне число: %2.f \n" % b
    if c >= 0:
        cq = c*c
        text3 = "Квадрат третього числа: %.2f \n" % (cq)
    else:
        text3 = "Від'ємне число: %2.f \n" % c
    return text + text2 + text3


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
        a_val = float(a.get())
        b_val = float(b.get())
        c_val = float(c.get())
        inserter(solver(a_val, b_val, c_val))
    except ValueError:
        inserter("Будь ласка введіть 3 числа")

root = Tk()
root.title("Quadratic float")
root.minsize(325,230)
root.resizable(width=False, height=False)


frame = Frame(root)
frame.grid()

a = Entry(frame, width=3)
a.grid(row=1,column=2,padx=(10,0))
a.bind("<FocusIn>", clear)
a_lab = Label(frame, text="Number1 =").grid(row=1,column=1)

b = Entry(frame, width=3)
b.bind("<FocusIn>", clear)
b.grid(row=1,column=4)
b_lab = Label(frame, text="Number2 =").grid(row=1, column=3)

c = Entry(frame, width=3)
c.bind("<FocusIn>", clear)
c.grid(row=1, column=6)
c_lab = Label(frame, text="Number3 =").grid(row=1, column=5)

but = Button(frame, text="Рахуй!", command=handler).grid(row=1, column=7, padx=(10,0))

output = Text(frame, bg="lightblue", font="Arial 12", width=35, height=10)
output.grid(row=2, columnspan=8)

root.mainloop()
