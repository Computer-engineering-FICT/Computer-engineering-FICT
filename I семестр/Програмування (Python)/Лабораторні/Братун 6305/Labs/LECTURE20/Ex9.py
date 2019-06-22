import numpy as np
import matplotlib.pyplot as plt
# Встановимо рівномірно час через 200ms
t = np.arange(0., 5., 0.2)
# червоний пунктир, голубі квадрати і зелені трикутники
plt.plot(t, t, "r--", t, t**2, "bs", t, t**3, "g^")
plt.show()
