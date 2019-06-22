from tkinter import *
from tkinter import messagebox
root = Tk()
app = Frame(root, bg = "green" , bd=10)
app.grid(row=0, column = 0)
def dialog():
    messagebox.showinfo("test" , "This is my first message")
button2 = Button(app, text = "Info" , width=5, command=dialog, font = ("Arial", 20) )
button2.grid(padx=110, pady=80)
button1 = Button(app, text = " exit " , width=3, command=exit,font = ("Arial", 20))
button1.grid(row=1, column = 2)
mainloop()
