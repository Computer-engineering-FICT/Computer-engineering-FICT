import Methods
import threading

class Function2 (threading.Thread):
    def __init__(self, sizeOfArrays, threadLock):
        self.size = sizeOfArrays
        self.threadLock = threadLock
        threading.Thread.__init__(self)

    def run(self):
        self.StartOfFunction()

    def StartOfFunction(self):
        Lock = threading.Lock();
        methods = Methods.Methods(self.size)

        mg = methods.fillMatrixOfOne()
        mk = methods.fillMatrixOfOne()
        ml = methods.fillMatrixOfOne()

        mf = methods.sumOfMatrix(methods.transMatrix(mg), methods.multOfMatrix(mk, ml));

        
       # self.threadLock.acquire()
        print("Start Function2")
        print(mf)
        print("End Function2\n")
       # self.threadLock.release()
        
