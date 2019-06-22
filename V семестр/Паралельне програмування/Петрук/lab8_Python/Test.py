# -*- coding: utf-8 -*-
#-----------------------------------------------
# Laboratory work 3
# Petruk Vadim, IO-92
# Variant:        1.13  C = A - B + D
#                 2.28  MD = MIN(MA)*MB*MC
#                 3.14  D = (A + B)*(MA - MB)
#-----------------------------------------------

import time

from threading import Thread
from InputOutputClass import InputOutput
#-----------------------------------------------
# Function1:		 C := A - B + D
def Function1(N):
    print "Function1 is started"
    time.sleep(30)
    ioObject = InputOutput()
    A = ioObject.VectorIn(N);
    B = ioObject.VectorIn(N);
    C = ioObject.VectorIn(N);
    D = ioObject.VectorIn(N);  
    for i in range(N):
        C[i] = A[i] - B[i] + D[i]
    if N <= 8:
        ioObject.VectorOut(C);
    print "Function1 is finished"
#-----------------------------------------------
# Function2: 		MD := MIN(MA)*MB*MC
def Function2(N):
    print "Function2 is started"
    ioObject = InputOutput()
    MA = ioObject.MatrixIn(N)
    MB = ioObject.MatrixIn(N)
    MC = ioObject.MatrixIn(N)
    MD = ioObject.MatrixIn(N)
    
    #MD = 0
    for i in range(N):
        for j in range(N):
            MD[i][j]=0;
    #MD := MB*MC
    for i in range(N):
        for j in range(N):
            for k in range(N):
                MD[i][j] = MD[i][j]+MB[i][k]*MC[k][j]
    #search MIN(MA)
    min_MA = MA[0][0]
    for i in range(N):
        for j in range(N):
            if MA[i][j] < min_MA:
                min_MA = MA[i][j]
    #MD := MIN(MA)*MB*MC
    for i in range(N):
        for j in range(N):
            MD[i][j] = MD[i][j]*min_MA
    if N<=8 :
        ioObject.MatrixOut(MD);
    print "Function2 is finished"

#-----------------------------------------------
# Function3: 		D := (A + B)*(MA - MB)
def Function3(N):
    print "Function3 is started"
    ioObject = InputOutput()
    
    A = ioObject.VectorIn(N)
    B = ioObject.VectorIn(N)
    D = ioObject.VectorIn(N)
    MA = ioObject.MatrixIn(N)
    MB = ioObject.MatrixIn(N)
    
    #C:=A + B
    C = ioObject.VectorIn(N)
    for i in range(N):
        C[i] = A[i]+B[i]
    
    #MC:=MA - MB
        MC = ioObject.MatrixIn(N)
    for i in range(N):
        for j in range(N):
            MC[i][j] = MA[i][j] - MB[i][j]
            
    #MD = 0
    for i in range(N):
        for j in range(N):
            D[i]=0
            
    #D := C * MC
    for i in range(N):
        for j in range(N):
            D[j] = D[j] + C[j]*MC[j][i]
    if N<=8 :
        ioObject.VectorOut(D);
    print "Function3 is finished"
#-----------------------------------------------
def main():
    N = 2000
    function1 = Function1(N)
    thread1 = Thread(target=function1)
    thread1.start()
    
    function2 = Function2(N)
    thread2 = Thread(target=function2)
    thread2.start()
    
    function3 = Function3(N)
    thread3 = Thread(target=function3)
    thread3.start()

main()
