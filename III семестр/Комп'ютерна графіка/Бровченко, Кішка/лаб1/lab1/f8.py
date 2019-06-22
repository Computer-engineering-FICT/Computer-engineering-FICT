from tkinter import *
import math


root = Tk()
canv = Canvas(root, width=600, height=600, bg='black')
canv.pack()


for i in range(0, 91):
    x1 = i * math.pi / 180
    line_length = 100+i+270
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='cyan4')

for i in range(90, 181):
    x1 = i * math.pi / 180
    line_length = 100+i+180
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='purple4')

for i in range(180, 271):
    x1 = i * math.pi / 180
    line_length = 100+i+90
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='cyan4')

for i in range(270, 361):
    x1 = i * math.pi / 180
    line_length = 100+i
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='purple4')


for i in range(0, 91, 2):
    x1 = i * math.pi / 180
    line_length = 100+i+180
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='green')

for i in range(90, 181, 2):
    x1 = i * math.pi / 180
    line_length = 100+i+90
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='magenta4')

for i in range(180, 271, 2):
    x1 = i * math.pi / 180
    line_length = 100+i
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='green')

for i in range(270, 361, 2):
    x1 = i * math.pi / 180
    line_length = 100+i-90
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='magenta4')


for i in range(0, 91, 3):
    x1 = i * math.pi / 180
    line_length = 100+i+90
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='red')

for i in range(90, 181, 3):
    x1 = i * math.pi / 180
    line_length = 100+i
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='red')

for i in range(180, 271, 3):
    x1 = i * math.pi / 180
    line_length = 100+i-90
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='red')

for i in range(270, 361, 3):
    x1 = i * math.pi / 180
    line_length = 100+i-180
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='red')


for i in range(0, 91, 4):
    x1 = i * math.pi / 180
    line_length = 100+i
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='yellow')

for i in range(90, 181, 4):
    x1 = i * math.pi / 180
    line_length = 100+i-90
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='yellow')

for i in range(180, 271, 4):
    x1 = i * math.pi / 180
    line_length = 100+i-180
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='yellow')

for i in range(270, 361, 4):
    x1 = i * math.pi / 180
    line_length = 100+i-270
    center_x = 300
    center_y = 300
    end_x = center_x + line_length * math.cos(x1)
    end_y = center_y + line_length * math.sin(x1)
    canv.create_line(center_x, center_y, end_y, end_x, fill='yellow')


root.mainloop()
