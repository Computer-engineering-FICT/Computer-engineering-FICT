from tkinter import *
top = Tk()
top.geometry("500x500")
lb=Label(text= "Ведіть дані",font = ("Arial",20))
lb.place(x=140,y=150)
en =Entry(top,width=20,bd=3, font = ("Arial",20))
en.place(x=90,y=200)
def callback():
    print(en.get())
b = Button(top, text="get", width=10, command=callback, font = ("Arial",20))
b.place(x=150,y=250)

top.mainloop()
