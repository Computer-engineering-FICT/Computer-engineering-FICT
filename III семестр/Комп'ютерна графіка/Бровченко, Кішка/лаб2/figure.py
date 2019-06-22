import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure()

f1 = fig.add_subplot(111)

t = np.arange(0, 2*np.pi+1, 0.01)
x = 3*(1+np.cos(t))*np.cos(t)
y = 3*(2+np.cos(t))*np.sin(t)

f1.axes.set_axis_off()
f1.plot(x, y, 'purple')


plt.show()
