from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np

# Count x, y, z
x, y, z = [], [], []
i = 0
while i <= 2 * np.pi:
    j = 0
    while j <= 2 * np.pi:
        x.append(round(np.sin(i) + np.cos(j), 2))
        y.append(round(np.sin(i) + np.sin(j), 2))
        z.append(round((np.sin(i)**2 * np.cos(j)**2 + np.sin(i)**2 * np.sin(j)**2) ** (1 / 2), 2))
        j += 0.5
    i += 0.5

# Create gistograms

plt.bar(x, y, 0.02)

plt.ylabel('Y')
plt.xlabel('X')
plt.show()


# Count x, y, z
x, y, z = [], [], []
i = 0
while i <= 2 * np.pi:
    j = 0
    while j <= 2 * np.pi:
        x.append(round(np.sin(i) + np.cos(j), 2))
        y.append(round(np.sin(i) + np.sin(j), 2))
        z.append(round((np.sin(i)**2 * np.cos(j)**2 + np.sin(i)**2 * np.sin(j)**2) ** (1 / 2), 2))
        j += 2
    i += 2

# Create pies
plt.title('X, Z')
plt.pie(z)
plt.legend(x)
plt.show()

plt.title('Y, Z')
plt.pie(z)
plt.legend(y)
plt.show()
