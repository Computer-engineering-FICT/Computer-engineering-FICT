from tkinter import *
import math


root = Tk()
canv = Canvas(root, width=600, height=600, bg='black')
canv.pack()

for j in range(9):
    x = [100, 100, 500, 500, 100, 500, 300, 300, 300]
    y = [300, 500, 100, 500, 100, 300, 500, 100, 300]
    center_x = x[j]
    center_y = y[j]
    line_length = 300
    if j == 8:
        line_length =450

    for i in range(0, 360):
        x1 = i * math.pi / 180
        end_x = center_x + line_length * math.cos(x1)
        end_y = center_y + line_length * math.sin(x1)
        canv.create_line(center_x, center_y, end_x, end_y, fill='yellow')

    for i in range(2, 361, 4):
        x1 = i * math.pi / 180
        end_x = center_x + line_length * math.cos(x1)
        end_y = center_y + line_length * math.sin(x1)
        canv.create_line(center_x, center_y, end_x, end_y, fill='green')

    for i in range(0, 360, 4):
        x1 = i * math.pi / 180
        end_x = center_x + line_length * math.cos(x1)
        end_y = center_y + line_length * math.sin(x1)
        canv.create_line(center_x, center_y, end_x, end_y, fill='red')

root.mainloop()
