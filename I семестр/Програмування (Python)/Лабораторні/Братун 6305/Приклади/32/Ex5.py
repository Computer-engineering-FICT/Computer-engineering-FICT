from tkinter import *
root = Tk()
def key(event):
    print("pressed", repr(event.char))
def callback(event):
    frame.focus_set()
    print("clicked at", event.x, event.y)
frame = Frame(root, width=200, height=200)
frame.bind("<Key>", key)
frame.bind("<Double-Button-1>", callback)
frame.pack()
root.mainloop()
