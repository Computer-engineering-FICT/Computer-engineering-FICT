from tkinter import *

root = Tk()
size = 600
canvas = Canvas(root, width=size, height=size)
canvas.pack()

canvas.create_line(300, 100, 300, 500)
canvas.create_line(100, 300, 500, 300)

mainloop()
