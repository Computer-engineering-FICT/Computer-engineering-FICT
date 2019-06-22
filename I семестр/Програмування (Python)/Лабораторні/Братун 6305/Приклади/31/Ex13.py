import tkinter
root = tkinter.Tk()
for r in range(3):
    for c in range(4):
        lb = Label(root, text='R%s/C%s'%(r,c),borderwidth=10, font = ("Arial", 20))
        lb.pack()
root.mainloop()
