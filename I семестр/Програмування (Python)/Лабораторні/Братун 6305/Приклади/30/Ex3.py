from tkinter import *
def printer():
    print("Натиснута кнопка з текстом")
def printer2():
    print("Натиснута кнопка з зображенням")

root = Tk()

but = Button(root,

text="Це кнопка", #напис на кнопці

width=30,height=5, #ширина и висота

bg="white",fg="blue",  #колір тла і напису
activebackground = "green",
activeforeground = "yellow",
font = ("Arial",20),
command = printer)
but.pack()

photo=PhotoImage(file="student.gif")
but2 = Button(root, activebackground = "green", command = printer2)
but2.config(image=photo,width="500",height="300")
but2.pack()
root.mainloop()

