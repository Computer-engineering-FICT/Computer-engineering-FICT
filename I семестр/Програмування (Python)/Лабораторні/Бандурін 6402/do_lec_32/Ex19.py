from tkinter import *
from tkinter import messagebox

root = Tk()
def hello():
   messagebox.showinfo("Say Hello", "Hello World")

B1 = Button(root, text = "Say Hello", command = hello, font='arial 20')
B1.pack()

mainloop()

