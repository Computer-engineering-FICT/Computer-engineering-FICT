from tkinter import *
import math

root = Tk()
canv = Canvas(root, width=800, height=800)
canv.pack()

for i in range(0, 360, 3):
    x1 = i * math.pi / 180
    line_length = 100
    center_x1 = 200
    center_y1 = 200
    center_x = center_x1 * math.cos(x1) + 400
    center_y = center_y1 * math.sin(x1) + 400

    canv.create_line(center_x + line_length, center_y, center_x - line_length, center_y)
    canv.create_line(center_x, center_y + line_length, center_x, center_y - line_length)

root.mainloop()
