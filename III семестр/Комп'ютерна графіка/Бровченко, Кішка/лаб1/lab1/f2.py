from tkinter import *
import math


root = Tk()
canv = Canvas(root, width=600, height=600, bg='light yellow')
canv.pack()


for i in range(0, 360, 4):
    x1 = i * math.pi / 180
    line_length = 300
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_x, end_y, fill='red')

for i in range(0, 360, 1):
    x1 = i * math.pi / 180
    line_length = 100
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_x, end_y, fill='yellow')

for i in range(2, 360, 4):
    x1 = i * math.pi / 180
    line_length = 200
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_x, end_y, fill='green')


root.mainloop()
