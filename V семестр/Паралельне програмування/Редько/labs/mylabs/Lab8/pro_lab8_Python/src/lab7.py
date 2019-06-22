'''

     Laboratory work #8. Threads in Python
 
 Task: F1: E = A + B + C + D * (MA * MZ)
       F2: MD = (MA * MB) * TRANS(MC)
       F3: E = (MA * MM) * B + MB * SORT(A)

 @author Red'ko Alexander
 @group IO-01
 @date 06.11.12

'''

from multiprocessing import Pool
from Data import Data


def threadF1(n):
    print  ("task f1 started")
    data = Data(n)
    va1 = data.inputVector()
    vb1 = data.inputVector()
    vc1 = data.inputVector()
    vd1 = data.inputVector()
    ma1 = data.inputMatrix()
    mz1 = data.inputMatrix()
    ve1 = data.f1(va1, vb1, vc1, vd1, ma1, mz1)
    data.outputVector(ve1)
    print ("task f1 ended")

def threadF2(n):
    print  ("task f2 started")
    data = Data(n)
    ma2 = data.inputMatrix()
    mb2 = data.inputMatrix()
    mc2 = data.inputMatrix()
    md2 = data.f2(ma2, mb2, mc2)
    data.outputMatrix(md2)
    print ("task f2 ended")

def threadF3(n):
    print ("task f3 started")
    data = Data(n)
    va3 = data.inputVector()
    vb3 = data.inputVector()
    ma3 = data.inputMatrix()
    mb3 = data.inputMatrix()
    mm3 = data.inputMatrix()
    ve3 = data.f3(va3, vb3, ma3, mb3, mm3)
    data.outputVector(ve3)
    print  ("task f3 ended")

def parallel(z, n):
    if z == 0:
        threadF1(n)
    if z == 1:
        threadF2(n)
    if z == 2:
        threadF3(n)

if __name__ =='__main__':
    print ("Lab8 started")
    print  ("Enter N:")
    n = input()
    pool = Pool(processes = 3)
    for i in xrange(3):
        pool.apply_async(parallel, (i, n,))
    pool.close()
    pool.join()
    '''p1 = Process(target = threadF1(n))
    p2 = Process(target = threadF2(n))
    p3 = Process(targe`t = threadF3(n))
    p1.start()
    p2.start()
    p3.start()'''
    print ("Lab8 ended")
    
