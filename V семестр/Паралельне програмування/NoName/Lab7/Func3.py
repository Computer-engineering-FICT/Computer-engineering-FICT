import Methods
import threading

class Function3 (threading.Thread):
    def __init__(self, sizeOfArrays, threadLock):
        self.size = sizeOfArrays
        self.threadLock = threadLock
        threading.Thread.__init__(self)

    def run(self):
        self.StartOfFunction()
    
    def StartOfFunction(self):
        p = []
        s = []
        t = []
        mo =[]
        mr = [[]]
        ms = [[]]
        
        methods = Methods.Methods(self.size)
        s = methods.fillVectorOfOne()
        p = methods.fillVectorOfOne()

        mo = methods.fillMatrixOfOne()
        mr = methods.fillMatrixOfOne()
        ms = methods.fillMatrixOfOne()

        t = methods.sumOfVectors(methods.multOfMatrixOnVector(mo, p), methods.multOfMatrixOnVector(methods.multOfMatrix(mr, ms), s))

        
        #self.threadLock.acquire()
        print("Start Function3")
        print(t)
        print("End Function3\n")
        #self.threadLock.release()
        
