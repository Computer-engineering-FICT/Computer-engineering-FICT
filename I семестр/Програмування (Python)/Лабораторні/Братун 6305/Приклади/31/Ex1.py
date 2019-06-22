from tkinter import *
root = Tk()
listbox = Listbox(root)
for i in range(20):
    listbox.insert(END, str(i))
listbox.pack()
mainloop()

