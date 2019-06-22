from tkinter import *
top = Tk()

mb=  Menubutton ( top, text="python", relief=RAISED,font='arial 16' )
mb.grid()
mb.menu  =  Menu ( mb, tearoff = 0 )
mb["menu"]  =  mb.menu

datVar = IntVar()
oopVar = IntVar()
guiVar = IntVar()

mb.menu.add_checkbutton ( label="data structures", variable=datVar,font='arial 16' )
mb.menu.add_checkbutton ( label="OOP",             variable=oopVar,font='arial 16' )
mb.menu.add_checkbutton ( label="GUI",             variable=guiVar,font='arial 16' )

mb.pack()
top.mainloop()
