from tkinter import *
from tkinter import messagebox
top = Tk()
top.geometry("500x500")
def helloCallBack():
   msg=messagebox.showinfo( "Python", "Hello World")
B = Button(top, text ="Hello",
command = helloCallBack,
bd=4, bg="blue", width=30,fg="white", activeforeground="black" )
B.place(x=140,y=200)
top.mainloop()
