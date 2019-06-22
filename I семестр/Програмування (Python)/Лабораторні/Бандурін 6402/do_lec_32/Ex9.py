from tkinter import *
root = Tk()
label1 = Label(root, text="example",font = ("Arial", 20))
button1 = Button(root, text = '1',font = ("Arial", 20))
button2 = Button(root, text = '2',font = ("Arial", 20))
label1.grid(row=0,column=1,columnspan=3)
button1.grid(row=1,column=0)
button2.grid(row=1,column=4)
root.mainloop()
