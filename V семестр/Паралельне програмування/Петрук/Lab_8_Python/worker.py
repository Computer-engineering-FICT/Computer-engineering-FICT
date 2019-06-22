# -*- coding: utf-8 -*-

import time

from threading import Thread
from calculating import PackF


def function1():

    print "Thread F1 is started"
    pack = PackF()
    dimension = pack.get_dimension()

    B = pack.get_filled_vector(dimension)
    C = pack.get_filled_vector(dimension)
    D = pack.get_filled_vector(dimension)
    A = pack.f1(B, C, D)
    #time.sleep(2)

    if dimension < 8:
        print "Result F1:"
        print A
    print "Thread F1 is over"

def function2():

    print "Thread F2 is started"
    pack = PackF()
    dimension = pack.get_dimension()

    MA = pack.get_filled_matrix(dimension)
    MB = pack.get_filled_matrix(dimension)
    MC = pack.get_filled_matrix(dimension)
    MU = pack.f2(MA, MB, MC)
    time.sleep(4)

    if dimension:
        print "Result F2:"
        pack.matrix_print(MU)
    print "Thread F2 is over"

def function3():

    print "Thread F3 is started"
    pack = PackF()
    dimension = pack.get_dimension()

    MS = pack.get_filled_matrix(dimension)
    MA = pack.get_filled_matrix(dimension)
    MB = pack.get_filled_matrix(dimension)
    p = pack.f3(MS, MA, MB)
    time.sleep(3)

    if dimension < 8:
        print "Result F3:"
        print p
    print "Thread F3 is over"

def main():

    print "Main is started"

    func1 = function1
    thread1 = Thread(target=func1)
    thread1.start()

    func2 = function2
    thread2 = Thread(target=func2)
    thread2.start()

    func3 = function3
    thread3 = Thread(target=func3)
    thread3.start()

    print "Main is over"

main()
