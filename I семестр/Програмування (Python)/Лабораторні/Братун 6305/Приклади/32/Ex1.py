from tkinter import *
root = Tk()
root.title("Root window")
top = Toplevel(height=500, width=500, relief = GROOVE)
top.title("My first toplevel window")
lab = Label(root, text= "Текст у головному вікні", font = "Arial 20")
lab.pack()
lab1 = Label(top, text= "Текст у вікні Toplevel", font = "Arial 20")
lab1.pack()
button = Button(root, text="Root Dismiss", bg = "Yellow", command=root.destroy,font = "Arial 20")
button.pack(side=LEFT)
button2 = Button(root, text="Top Dismiss", bg = "Blue", fg = "White", command=top.destroy,font = "Arial 20")
button2.pack(side=LEFT)
def topstate():
    try:
        lab.config(text="Toplevel:"+top.state())
    except TclError:
        lab.config(text="Toplevel closed")

button3 = Button(root, text="State", bg = "red", fg = "White", command = topstate, font = "Arial 20")
button3.pack(side = LEFT )

button1 = Button(top, text="Dismiss", command=top.destroy,font = "Arial 20")
button1.pack()


mainloop()
