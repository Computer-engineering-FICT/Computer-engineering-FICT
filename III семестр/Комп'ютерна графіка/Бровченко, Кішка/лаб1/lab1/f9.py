from tkinter import *
import math


root = Tk()
canv = Canvas(root, width=600, height=600)
canv.pack()


for j in range(5):
    x = [300, 400, 200, 500, 100]
    center_x = x[j]
    center_y = x[j]
    for i in range(0, 91, 2):
        x1 = i * math.pi / 180
        line_length = 100+i
        end_x = center_x + line_length * math.cos(x1)
        end_y = center_y + line_length * math.sin(x1)
        canv.create_line(center_x, center_y, end_y, end_x)

    for i in range(90, 181, 2):
        x1 = i * math.pi / 180
        line_length = 100+i-90
        end_x = center_x + line_length * math.cos(x1)
        end_y = center_y + line_length * math.sin(x1)
        canv.create_line(center_x, center_y, end_y, end_x)

    for i in range(180, 271, 2):
        x1 = i * math.pi / 180
        line_length = 100+i-180
        end_x = center_x + line_length * math.cos(x1)
        end_y = center_y + line_length * math.sin(x1)
        canv.create_line(center_x, center_y, end_y, end_x)

    for i in range(270, 361, 2):
        x1 = i * math.pi / 180
        line_length = 100+i-270
        end_x = center_x + line_length * math.cos(x1)
        end_y = center_y + line_length * math.sin(x1)
        canv.create_line(center_x, center_y, end_y, end_x)

root.mainloop()
