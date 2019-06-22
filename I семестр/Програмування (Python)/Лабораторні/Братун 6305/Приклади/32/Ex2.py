from tkinter import *
from tkinter import messagebox
top = Tk()

C = Canvas(top, bg="white", height=250, width=500)

coord = (10, 50, 240, 210)
arc = C.create_arc(coord, start=90, extent=150, fill="green")

filename = PhotoImage(file = "sunshine.gif")
image = C.create_image(500, 0, anchor=NE, image=filename)

line = C.create_line(20, 20, 100, 20, fill="blue", width =2)
ov= C.create_oval(30, 30, 100, 100, fill="blue", width =10)
plg = C.create_polygon(110, 180, 200, 220, 180, 30, fill="red")


C.pack()
top.mainloop()
