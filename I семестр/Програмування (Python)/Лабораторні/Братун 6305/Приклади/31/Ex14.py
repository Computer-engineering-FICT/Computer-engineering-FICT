from tkinter import *
root = Tk( )
l1=Label(root, text="Група", font = ("Arial", 20))
l1.grid(row=0, sticky=W) # По умолчанию column=0
l2=Label(root, text="П.І.Б.", font = ("Arial", 20))
l2.grid(row=1,sticky=W) # По умолчанию column=0
l3=Label(root, text="№", font = ("Arial", 20))
l3.grid(row=2, sticky=W) # По умолчанию column=0

e1 = Entry(root, font = ("Arial", 20))
e2 = Entry(root, font = ("Arial", 20))
e3 = Entry(root,font = ("Arial", 20))
e1.grid(row=0, column=1)
e2.grid(row=1, column=1)
e3.grid(row=2, column=1)
root.mainloop()

