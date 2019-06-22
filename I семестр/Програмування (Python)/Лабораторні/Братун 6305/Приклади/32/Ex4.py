from tkinter import *
root = Tk()
def callback(event):
    print("clicked at", event.x, event.y)

frame = Frame(root, width=200, height=200)
frame.bind("<Buttonrelease-1>", callback)
frame.pack()

root.mainloop()
