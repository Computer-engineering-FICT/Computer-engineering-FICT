import Methods
import threading

class Function1 (threading.Thread):
    def __init__(self, sizeOfArrays, threadLock):
        self.size = sizeOfArrays
        self.threadLock = threadLock
        threading.Thread.__init__(self)

    def run(self):
        self.StartOfFunction()

    def StartOfFunction(self):
        methods = Methods.Methods(self.size)

        a = []
        b = []
        c = []
        d = []

        md = [[]]
        me =[[]]
        
        b = methods.fillVectorOfOne()
        c = methods.fillVectorOfOne()
        d = methods.fillVectorOfOne()
        md = methods.fillMatrixOfOne()
        me = methods.fillMatrixOfOne()

        a = methods.sumOfVectors(methods.sumOfVectors(b, c), methods.multOfVectorOnMatrix(d, methods.multOfMatrix(md, me)))

        
        #self.threadLock.acquire()
        print("Start Function1")
        print(a)
        print("End Function1\n")
       # self.threadLock.release()
        
