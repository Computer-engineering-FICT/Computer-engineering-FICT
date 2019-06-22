#__author__ = "Andry Bratun"

from tkinter import *

def solver(a):
    """ Solves quadratic equation and returns the result in formatted string """
    b = len(a)
    return a , b


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
        a_val = str(a.get())
        inserter(solver(a_val))
    except ValueError:
        inserter("Будь ласка введіть рядок")

root = Tk()
root.title("Quest1")
root.minsize(850,680)
root.resizable(width=False, height=False)


frame = Frame(root)
frame.grid()

a = Entry(frame, width=160)
a.grid(row=1,column=2,padx=(10,0))
a.bind("<FocusIn>", clear)
a_lab = Label(frame, text="Введіть рядок").grid(row=1,column=1)

but = Button(frame, text="Довжина", command=handler).grid(row=1, column=7, padx=(10,0))

output = Text(frame, bg="chocolate", font="Arial 12", width=120, height=40)
output.grid(row=2, columnspan=8)

root.mainloop()
