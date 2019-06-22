from tkinter import *
root = Tk()
pane=Frame(root, height=150, width=150, bg = "green", relief = RAISED, bd = 10.)
pane.place( relx=0.5, rely=0.5,anchor=CENTER )
def helloCallBack():
   print( "Hello Python")
B = Button(pane, height=2, width=10, text ="Hello", command = helloCallBack)
L = Label(pane, text= "Welcome button", fg="red",bg = "yellow")
B.place( relx=0.5, rely=0.5,anchor=CENTER)
L.place( relx=0.5, rely=0.25,  anchor=S)
root.mainloop()
