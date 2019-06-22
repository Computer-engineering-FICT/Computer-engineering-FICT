import math as m
import numpy as np
import matplotlib.pyplot as plt


def f(x):
    return m.pow(x, 3) - 2*m.pow(x, 2) + x + 1


def first_deriv(x):
    return 3*m.pow(x, 2) - 4*x + 1


def second_deriv(x):
    return 6*x - 4


def solver(a, b, e):
    k = 0

    while abs(b - a) > e:
        mid = (b - a) / 2
        if first_deriv(mid) * second_deriv(mid) <= 0:
            a, b = b, a
        a -= f(a)*(b-a)/(f(b) - f(a))
        b -= f(b)/first_deriv(b)
        k += 1

    print('\nIterations: {}'.format(k))

    return (a + b)/2


def main():

    while True:
        print('Set valid interval!')
        a = float(input('Enter a = '))
        b = float(input('Enter b = '))
        if f(a)*f(b) < 0:
            break

    e = float(input('Enter precision e = '))
    root = solver(a, b, e)

    print('Root is: {}'.format(root))

    npf = np.vectorize(f)
    args = np.arange(a, b, 0.001)
    plt.plot(args, npf(args))
    plt.plot(np.arange(a, b+1, 1), np.zeros_like(np.arange(a, b+1, 1)))
    plt.plot([root], [0], 'ro')
    plt.xlabel('x')
    plt.ylabel('f(x)')
    plt.annotate('equation root = {}'.format(root), xy=(root, 0), xytext=(root-0.8, 2.5),
                 arrowprops=dict(facecolor='black', shrink=0.05),
                 )
    plt.show()

if __name__ == "__main__":
    main()
