from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np


# Count x, y, z
x, y, z = [], [], []
i = 0
while i <= 2 * np.pi:
    j = 0
    while j <= 2 * np.pi:
        x.append(np.sin(i) + np.cos(j))
        y.append(np.sin(i) + np.sin(j))
        z.append((np.sin(i)**2 * np.cos(j)**2 + np.sin(i)**2 * np.sin(j)**2) ** (1 / 2))
        j += 0.1
    i += 0.1

# Create graphics z(x), z(y)
fig1 = plt.figure()
ax1 = fig1.add_subplot(311)

ax1.plot(z, x, label=u'X', color='green')
ax1.set_ylabel(u'X')
ax1.set_xlabel(u'Z')
ax1.grid(True, color='green')
ax1.tick_params(axis='y', which='major', labelcolor='green')

ax2 = fig1.add_subplot(312)
ax2.plot(z, y, label=u'Y', color='red')
ax2.set_ylabel(u'Y')
ax2.set_xlabel(u'Z')
ax2.tick_params(axis='y', which='major', labelcolor='red')
ax2.grid(True, color='red')

ax3 = fig1.add_subplot(313)
ax3.plot(x, y, label=u'Y(x)', color='blue')
ax3.set_ylabel(u'Y')
ax3.set_xlabel(u'X')
ax3.tick_params(axis='y', which='major', labelcolor='blue')
ax3.grid(True, color='blue')

plt.show()
