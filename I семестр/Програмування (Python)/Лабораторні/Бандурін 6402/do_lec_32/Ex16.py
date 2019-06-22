from tkinter import *
root = Tk()
def helloCallBack():
   print( "Hello Python")
B = Button(root, height=2, width=10, text ="Hello", command = helloCallBack)
B.place( relx=0.5, rely=0.5,anchor=CENTER)
root.mainloop()
