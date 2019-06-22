from numpy import *
from multiprocessing import Process, Lock

# --------------------------------------------
# --           Assignment #7
# --   Student:   Andrew Logvinchuk
# --   Group:     IO-41
# --   Date:      14/11/2016
# --   F1 = ((A + B)*((MA*ME)*C))
# --   F2 = SORT(TRANS(MF)*MK)
# --   F3 = MAX((MO*MP)*R + MS*S)
# ---------------------------------------------
size = 1500


def f1(l, a, b, c, ma, me):
    print('Thread 1 started!')
    d = (a + b).dot(dot(ma, me).dot(c))
    l.acquire()
    print('F1 = {}'.format(d))
    l.release()
    print('Thread 1 finished!')


def f2(l, mf, mk):
    print('Thread 2 started!')
    mc = sort(dot(mk, mf.transpose()))[:, ::-1]
    if size < 6:
        l.acquire()
        print('F2 = {}'.format(mc))
        l.release()
    else:
        print('F2: Output is to cumbersome!')
    print('Thread 2 finished!')


def f3(l, r, s, mo, mp, ms):
    print('Thread 3 started!')
    d = (dot(mo, mp).dot(r) + ms.dot(s)).max()
    l.acquire()
    print('F3 = {}'.format(d))
    l.release()
    print('Thread 3 finished!')


if __name__ == '__main__':
    a = ones(size, dtype=int32)
    b = ones(size, dtype=int32)
    c = ones(size, dtype=int32)
    r = ones(size, dtype=int32)
    s = ones(size, dtype=int32)

    ma = ones((size, size), dtype=int32)
    me = ones((size, size), dtype=int32)
    mf = ones((size, size), dtype=int32)
    mk = ones((size, size), dtype=int32)
    mo = ones((size, size), dtype=int32)
    mp = ones((size, size), dtype=int32)
    ms = ones((size, size), dtype=int32)

    lock = Lock()
    t1 = Process(target=f1, name='Task1', args=(lock, a, b, c, ma, me))
    t2 = Process(target=f2, name='Task2', args=(lock, mf, mk))
    t3 = Process(target=f3, name='Task3', args=(lock, r, s, mo, mp, ms))

    t1.start()
    t2.start()
    t3.start()

    t1.join()
    t2.join()
    t3.join()
