from tkinter import *
root=Tk()
lb=Label(text= "Введіть дані",font = ("Arial",20))
en =Entry(root,width=20,bd=3, font = ("Arial",20))
text1=Text(root,height=3,width=40, font=("Arial",14),wrap=WORD)
def callback():
    text1.insert(INSERT, en.get())
b = Button(root, text="Додати", width=10, command=callback, font = ("Arial",20))

lb.pack()
en.pack()
b.pack()
text1.pack()

root.mainloop()
