from tkinter import *
import math


root = Tk()
canv = Canvas(root, width=600, height=600)
canv.pack()
for i in range(360):
    x1 = i * math.pi / 180
    line_length = 450
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_x, end_y)

root.mainloop()
