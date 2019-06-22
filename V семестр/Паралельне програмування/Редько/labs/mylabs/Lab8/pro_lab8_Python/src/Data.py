'''

     Laboratory work #8. Threads in Python
 
 Task: F1: E = A + B + C + D * (MA * MZ)
       F2: MD = (MA * MB) * TRANS(MC)
       F3: E = (MA * MM) * B + MB * SORT(A)

 @author Red'ko Alexander
 @group IO-01
 @date 06.11.12

'''

from numpy import ones, sort, dot, int16

class Data(object):

    def __init__(self, n):
        self.n = n
        
    def inputVector(self):
        return ones( self.n, dtype = int16 )
    
    def inputMatrix(self):
        return ones( (self.n, self.n), dtype = int16 )
    
    def f1(self, va, vb, vc, vd, ma, mz):
        return va + vb + vc + dot(vd, dot(ma, mz))
    
    def f2(self, ma, mb, mc):
        return dot(dot(ma, mb), mc.transpose())
    
    def f3(self, va, vb, ma, mb, mm):
        return dot(vb, dot(ma, mm)) + dot(sort(va), mb)
    
    def outputVector(self, vector):
        if self.n < 10:
            print vector
    
    def outputMatrix(self, matrix):
        if self.n < 10:
            print matrix