from tkinter import *
root=Tk()
var1=IntVar()
var2=StringVar()
def fch1():
    print(var1.get())
def fch2():
    print(var2.get())

check1=Checkbutton(root,text='1 пункт', variable=var1, onvalue=1, offvalue=0, command = fch1)
check2=Checkbutton(root,text='2 пункт', variable=var2, onvalue="Yes", offvalue="No", command = fch2)
check1.pack()
check2.pack()
root.mainloop()

