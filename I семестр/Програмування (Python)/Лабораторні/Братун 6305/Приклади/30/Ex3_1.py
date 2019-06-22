from tkinter import *
root = Tk()
but_fl = Button(root,text="Це кнопка")
but_fl.config(bg = 'yellow')
but_fl.pack()
def flash(event):
    but_fl.config(bg = 'red')
    but_fl.flash()
    but_fl.after(500, lambda: but_fl.config(bg = 'lightgrey'))
but_fl.bind("<Button-1>", flash)
root.mainloop()
