#__author__ = "Andry Bratun"

from tkinter import *
import math as m

def solver(a,b):
    """ Solves quadratic equation and returns the result in formatted string """
    resultB = 1
    resultC = 1

    i = int(1)
    CheckPar = float(0)
    if b > 0:
        while i <= b:
            resultB = resultB+a**i
            CheckPar = m.fmod(i,2)
            if CheckPar != 0:
                resultC = resultC-a**i
            else:
                resultC = resultC+a**i
            i += 1
    else:
        text = 'Ви ввели неправильне число N'
        return text
    text1 = "B = %.2f \n" % resultB
    text2 = "C = %.2f \n" % resultC
    return text1 + text2


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
        b_val = int(b.get())
        inserter(solver(a_val, b_val,))
    except (ValueError, TypeError):
        inserter("Будь ласка введіть 2 числа \n де А дійсне , N ціле")

root = Tk()
root.title("Progression by A.B.")
root.minsize(325,230)
root.resizable(width=False, height=False)


frame = Frame(root)
frame.grid()

a = Entry(frame, width=3)
a.grid(row=1,column=2,padx=(10,0))
a.bind("<FocusIn>", clear)
a_lab = Label(frame, text="A =").grid(row=1,column=1)

b = Entry(frame, width=3)
b.bind("<FocusIn>", clear)
b.grid(row=1,column=4)
b_lab = Label(frame, text="N =").grid(row=1, column=3)

but = Button(frame, text="Рахуй!", command=handler).grid(row=1, column=7, padx=(10,0))

output = Text(frame, bg="lightblue", font="Arial 12", width=35, height=10)
output.grid(row=2, columnspan=8)

root.mainloop()
