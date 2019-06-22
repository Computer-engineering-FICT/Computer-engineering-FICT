
from tkinter import *
from tkinter import messagebox

def callback1():
    if messagebox.askokcancel("toplevel", "Do you really wish to leave toplevel?"):
        top.destroy()
def callback2():
    if messagebox.askokcancel("root", "Do you really wish to quit?"):
        root.destroy()

root = Tk()
root.title("Root window")
root.protocol("WM_DELETE_WINDOW", callback2)

top = Toplevel(root, height=500, width=500)
top.protocol("WM_DELETE_WINDOW", callback1)

top.title("Toplevel window with own handler")
top.mainloop()


