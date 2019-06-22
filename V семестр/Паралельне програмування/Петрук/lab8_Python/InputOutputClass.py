# -*- coding: utf-8 -*-

from copy import deepcopy

class InputOutput():

    def VectorIn(self,N):
        X = [1, ] * N
        return X
#-----------------------------------------------------
    def VectorOut(self,X):
       print X,
       print
#-----------------------------------------------------      
    def MatrixIn(self,N):
        MX = []
        for i in range(N):
            MX.append(self.VectorIn(N))
        return MX
#-----------------------------------------------------   
    def MatrixOut(self,MX):
        for i in range(len(MX)):
            print(MX[i])
