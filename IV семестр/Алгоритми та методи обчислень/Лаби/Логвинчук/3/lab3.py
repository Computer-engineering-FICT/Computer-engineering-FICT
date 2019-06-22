import numpy as np
import matplotlib.pyplot as plt
from matplotlib import pylab


def f(x):
    return np.exp(-x) * np.exp(-np.sin(x))


def lagrange_pol(nodes, values):
    n = nodes.size

    def p(x):
        polynomial = 0
        for j in range(n):

            def product(j, n):
                total = 1
                for i in range(n):
                    if i == j:
                        continue
                    xi = nodes[i]
                    xj = nodes[j]
                    total *= (x - xi) / (xj - xi)
                return total

            polynomial += product(j, n) * values[j]
        return polynomial

    return p


def main():
    a = float(input('Start = '))
    b = float(input('End = '))
    n = int(input('Nodes number = '))
    step = (b - a) / n

    x_nodes = np.arange(a, b + 0.1, step)
    f_values = f(x_nodes)

    pol = lagrange_pol(x_nodes, f_values)

    x_arg = np.arange(-1, 10, 0.01)

    fig = plt.figure()
    plt.subplot(211)
    plt.xlabel('x')
    plt.ylabel('f(x)')
    plt.title('Lagrange interpolation\n(interval [{}; {}], {} nodes)'.format(a, b, n))

    plt.plot(x_arg, f(x_arg), label='original function')
    plt.plot(x_arg, pol(x_arg), label='Lagrange polynomial')
    plt.axis([a - 2, b + 2, 0., 0.1])
    plt.legend(loc=3, prop={'size': 10})

    plt.subplot(212)
    plt.xlabel('x')
    plt.ylabel('R(x)')
    plt.title('Divergence')

    plt.plot(x_arg, f(x_arg) - pol(x_arg))
    plt.axis([a - 2, b + 2, 0., 0.0000025])

    fig.subplots_adjust(hspace=0.4)
    fig = pylab.gcf()
    fig.canvas.set_window_title('Lagrange interpolation')

    plt.show()

if __name__ == "__main__":
    main()