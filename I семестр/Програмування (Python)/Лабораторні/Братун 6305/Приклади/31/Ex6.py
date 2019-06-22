from tkinter import *
root = Tk()
w = Label(root, text="Red", bg="red", fg="white", font = ("Arial", 20))
w.pack(side=LEFT,fill="y")

w = Label(root, text="Green", bg="green", fg="black", font = ("Arial", 20))
w.pack(side=LEFT,fill=X)

w = Label(root, text="Blue", bg="blue", fg="white", font = ("Arial", 20))
w.pack(side=LEFT,fill=Y)
mainloop()
