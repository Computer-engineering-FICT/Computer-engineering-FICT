import math
from random import random
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure
from Tkinter import *
from matplotlib import use
use("TkAgg")

h = math.pi/6
r = 6/math.pi
generated_nums = 5000

def f_xy(x,y):
    return h/r*math.sqrt(math.pow(r,2)-math.pow(x,2)-math.pow(y,2))

def phi_x(x):
    return math.pi/4*(1-math.pow(h*x,2))

def psi_y(y):
    return phi_x(y)

def f_y_while_x(x,y):
    return f_xy(x,y)/phi_x(x)

def generate_x():
    r = random()
    step = 1.0/10**3
    searched_x = 0.0
    sum = 0.0
    while r > sum:
        sum += phi_x(searched_x)*step
        searched_x += step
    return searched_x

def generate_y(x):
    r = random()
    step = 1.0 / 10 ** 3
    searched_y = 0.0
    sum = 0.0
    while r > sum:
        sum += f_y_while_x(x,searched_y) * step
        searched_y += step
    return searched_y

def math_expectation(arr):
    return sum(arr)/generated_nums

def deviation(arr, math_expectation):
    return sum(list(map(lambda x: (x-math_expectation)**2/generated_nums,arr)))

def covariation(arr_a,arr_b,expected_a,expected_b):
    return sum(list(map(lambda a,b: (a-expected_a)*(b-expected_b)/generated_nums,
                    arr_a,arr_b)))

def standard_deviation(deviation):
    return math.sqrt(deviation)


def correlation(cov,stand_dev_a,stand_dev_b):
    return cov/(stand_dev_a*stand_dev_b)

generated_x = []
generated_y = []
for i in range(generated_nums):
    x = generate_x()
    y = generate_y(x)
    generated_x.append(x)
    generated_y.append(y)

exp_x = math_expectation(generated_x)
exp_y = math_expectation(generated_y)
deviation_x = deviation(generated_x,exp_x)
deviation_y = deviation(generated_y,exp_y)
standard_x_deviation = standard_deviation(deviation_x)
standard_y_deviation = standard_deviation(deviation_y)
cov = covariation(generated_x,generated_y,exp_x,exp_y)
corr = correlation(cov,standard_x_deviation,standard_y_deviation)


x_higher_1 = [i for i in generated_x if i>1]
len = len(x_higher_1)
print(float(len)/generated_nums)
root = Tk()
root.title("Lab work #3")
root.geometry("500x680")
frame = Frame(root,bg = "white")
frame.grid(row = 1, column = 1)
f = Figure(figsize = (5,5), dpi = 100)
canvas = FigureCanvasTkAgg(f,frame)
a = f.add_subplot(111)

a.scatter(generated_x,generated_y,s=0.3)
canvas._tkcanvas.grid(row = 1,column = 1)
canvas.draw()
text = "Generated distribution with:\nexpected x: " + str(exp_x) + "\nexpected y: " + str(exp_y) + "\nx deviation: "+ str(deviation_x) +"\ny deviation: " + str(deviation_y) + "\nstandard x deviation: "+str(standard_x_deviation)+ "\nstandard y deviation: "+str(standard_y_deviation)+ "\ncovariation: " + str(cov) + "\ncorrelation: " + str(corr)
information = Label(root, text = text)
information.grid(row = 2,column = 1)
root.mainloop()