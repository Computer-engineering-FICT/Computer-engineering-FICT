from tkinter import *
root=Tk()
button1 = Button(text="1", font = ("Arial", 20))
button2 = Button(text="2", font = ("Arial", 20))
button3 = Button(text="3", font = ("Arial", 20))
button4 = Button(text="4", font = ("Arial", 20))
button1.grid(row=1, column=0)
button2.grid(row=2, column=0)
button3.grid(row=3, column=0)
button4.grid(row=4, column=0)
root.mainloop()
