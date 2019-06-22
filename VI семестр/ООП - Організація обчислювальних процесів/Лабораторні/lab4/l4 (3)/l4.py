from mlib import *

from numpy import arange, ones, zeros
from pylab import plot, axis, xlabel, ylabel, grid, show, savefig, cla, rc, legend, figure


REPEAT = 50
STEP = 1


def sort_matrix(matrix):
    for shift in range(len(matrix)):
        wm = matrix[shift:, shift:]
        min_id = wm.sum(axis=1).argmin() + shift

        buf = matrix.copy()
        matrix[shift] = matrix[min_id]
        matrix[min_id] = buf[shift]

        wm = matrix[shift:, shift:]
        max_col = [(id, s.sum()) for id, s in
                   filter(lambda m: m[1][:, 0] == 1, enumerate(wm.transpose()))]
        # print ("checking ", max_col)
        if len(max_col) > 0:
            max_id = max(max_col, key=lambda x: x[1])[0] + shift
            buf = matrix.copy()
            matrix[:, shift] = matrix[:, max_id]
            matrix[:, max_id] = buf[:, shift]
            # print ("2:", max_id)
            # print (matrix)
    return matrix


def filter_ob(matrix):
    N = len(matrix)
    buf = matrix.copy()
    for i in range(N):
        if matrix[i, :].sum() == 1:
            # print (matrix)
            
            # matrix[:, i] += buf[i, :].reshape((N, 1))  # ones(N)
            matrix[i, :] = zeros((1, N))
            # print (matrix)
            # print ("=================")
    buf = matrix.copy()
    for i in range(N):
        if matrix[:, i].sum() == 1:
            # print (matrix)
            # matrix[i, :] += buf[:, i].reshape((1, N))  # ones(N)
            matrix[:, i] = zeros((N, 1))
    # for i in range(N):
    #     if matrix[:, i].sum() == 1:
    #         matrix[:, i] = ones((N, 1))
    return matrix


def find_conflict(matrix):
    matrix = filter_ob(sort_matrix(matrix))
    N = len(matrix)

    for i in range(1, N):
        k = i
        l = N-k
        # print (matrix[:k, N-l:])
        if not matrix[:k, N-l:].any():
            if matrix[N-k:, :l].any():
                return True
    return False


def xplot(y, title_t, index, cl=True, ax=None, sv=True):
    color = 'bgrcmykw'
    rc('font', **{'family': 'serif'})
    rc('text', usetex=True)
    rc('text.latex', unicode=True)
    rc('text.latex', preamble='\\usepackage[utf8]{inputenc}')
    rc('text.latex', preamble='\\usepackage[russian]{babel}')
    x = arange(0.0, 1.0+STEP/100, STEP/100)
    print (x, y)
    print (len(x), len(y))
    if ax:
        ax.plot(x, y, '%s.-' % color[index], label=title_t)
    grid()
    ylabel("вероятность")
    xlabel("связность")
    if sv:
        savefig('%s.png' % title_t.replace(" ", "_"))
    if cl:
        cla()


def test():
    data = []
    for index, N in enumerate(range(10, 16, 5)):
        lst = []
        for pc in range(0, 101, STEP):
            print("N=%d pc=%d%%" % (N, pc))
            matrixes = generate(N, pc/100., REPEAT)
            # print (list((mpermutations(matrix))))
            conf = list(map(find_conflict, matrixes))
            # print (conf)
            lst.append(len(list(filter(None, conf))) / len(conf))
        print (lst)
        data.append(lst)

    fig = figure()
    ax = fig.add_subplot(111)
    for index, l in enumerate(data):
        xplot(l, str(index*5+10), index, True, ax)

    fig = figure()
    ax = fig.add_subplot(111)
    for index, l in enumerate(data):
        xplot(l, str(index*5+10), index, False, ax, False)
    ax.legend()
    savefig('all.png')


if __name__ == '__main__':
    test()
    # fig = figure()
    # ax = fig.add_subplot(111)
    # xplot([0.0, 0.41, 0.53, 0.75, 0.78, 0.88, 0.92, 0.94, 0.92, 0.99, 0.94, 0.99, 0.98, 0.94, 0.95, 0.94, 0.87, 0.72, 0.66, 0.56, 0.52, 0.38, 0.32, 0.21, 0.11, 0.08, 0.08, 0.07, 0.02, 0.02, 0.01, 0.01, 0.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '10', 0, True, ax)
    # xplot([0.0, 0.42, 0.56, 0.71, 0.92, 0.95, 0.99, 0.95, 0.95, 0.92, 0.96, 0.94, 0.88, 0.74, 0.69, 0.48, 0.36, 0.3, 0.19, 0.15, 0.08, 0.02, 0.04, 0.03, 0.01, 0.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '15', 1, True, ax)
    # xplot([0.0, 0.41, 0.56, 0.94, 0.96, 0.99, 0.96, 1.0, 0.97, 0.98, 0.86, 0.65, 0.49, 0.38, 0.24, 0.18, 0.07, 0.04, 0.05, 0.03, 0.01, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '20', 2, True, ax)
    # xplot([0.0, 0.48, 0.63, 0.91, 0.98, 0.98, 0.97, 0.96, 0.95, 0.75, 0.63, 0.36, 0.19, 0.12, 0.01, 0.02, 0.03, 0.03, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '25', 3, True, ax)
    # xplot([0.0, 0.48, 0.67, 0.97, 0.99, 0.97, 0.97, 0.94, 0.71, 0.49, 0.27, 0.15, 0.09, 0.04, 0.02, 0.01, 0.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '30', 4, True, ax)

    # fig = figure()
    # ax = fig.add_subplot(111)
    # xplot([0.0, 0.41, 0.53, 0.75, 0.78, 0.88, 0.92, 0.94, 0.92, 0.99, 0.94, 0.99, 0.98, 0.94, 0.95, 0.94, 0.87, 0.72, 0.66, 0.56, 0.52, 0.38, 0.32, 0.21, 0.11, 0.08, 0.08, 0.07, 0.02, 0.02, 0.01, 0.01, 0.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '10', 0, False, ax, False)
    # xplot([0.0, 0.42, 0.56, 0.71, 0.92, 0.95, 0.99, 0.95, 0.95, 0.92, 0.96, 0.94, 0.88, 0.74, 0.69, 0.48, 0.36, 0.3, 0.19, 0.15, 0.08, 0.02, 0.04, 0.03, 0.01, 0.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '15', 1, False, ax, False)
    # xplot([0.0, 0.41, 0.56, 0.94, 0.96, 0.99, 0.96, 1.0, 0.97, 0.98, 0.86, 0.65, 0.49, 0.38, 0.24, 0.18, 0.07, 0.04, 0.05, 0.03, 0.01, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '20', 2, False, ax, False)
    # xplot([0.0, 0.48, 0.63, 0.91, 0.98, 0.98, 0.97, 0.96, 0.95, 0.75, 0.63, 0.36, 0.19, 0.12, 0.01, 0.02, 0.03, 0.03, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '25', 3, False, ax, False)
    # xplot([0.0, 0.48, 0.67, 0.97, 0.99, 0.97, 0.97, 0.94, 0.71, 0.49, 0.27, 0.15, 0.09, 0.04, 0.02, 0.01, 0.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    #     '30', 4, False, ax, False)
    # ax.legend()
    # savefig('all.png')